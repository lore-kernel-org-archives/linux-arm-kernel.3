Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A32CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 17:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEEh8/NUEHKuAlj68cbZhgQqD/5B/8B/EJHd3Ged6PQ=; b=UHArnK3i6ehRkeeweF/w6mpwhq
	b9HwBfzThS3sIQu/0VwLTHZHG08dliFgRqN7nTQyeoAYxkHfaXiQIOz1fetk4fPvAA8wQszU7YoQr
	YiA2gFSAw2Qx+QcAb702rBF7ySCGx5320QeT7AaMC5JFsrnWjAPRSP7shP7dvoLEyTUSanbwFsEpP
	T5Hf7zm+JaEhDXOlAsJzlTEvQMyGPq+YzLQHbktu8Uxsi1eiY2voBSLJWziTCQ53FyzBeGX5ARR+6
	bv3SKL3F031VsZSoA3QKL1LeWlJkVZ8V9w2nCyIHMe9IVOdJ9VLyo3LAJUcFQ5hEIAIa3Qb0sLuQ8
	YT406neQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvJT8-0000000C9jQ-3l9V;
	Sun, 07 Sep 2025 17:46:26 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvJOQ-0000000C8gv-2im1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 17:41:36 +0000
Message-ID: <a49cff49-3fe5-417d-8f71-7ec63a68112d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757266887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vEEh8/NUEHKuAlj68cbZhgQqD/5B/8B/EJHd3Ged6PQ=;
	b=tYo5WyzaTgugqiK/oTEOefKmgSagoyoO5h5BjVK83l73Mdkfh1vxQug8voG9pEhlljd8Ki
	fbp7QHRfhLGvMgpkuh8ZyrljysAZ57sGFfsNSfpiPGkBaCI+W4U42pVgrggtjavRhkA6v8
	nPSxhFfqVDzWehQbexLABjaF3KzhGu0=
Date: Sun, 7 Sep 2025 18:41:24 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net] net: stmmac: prevent division by 0 in
 stmmac_init_tstamp_counter()
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
References: <58116e65-1bca-4d87-b165-78989e1aa195@omp.ru>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <58116e65-1bca-4d87-b165-78989e1aa195@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_104134_987250_331A3534 
X-CRM114-Status: UNSURE (   4.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 05/09/2025 17:06, Sergey Shtylyov wrote:
> In stmmac_init_tstamp_counter(), the sec_inc variable is initialized to 0,
> and if stmmac_config_sub_second_increment() fails to set it to some non-0

How that can happen? Do you have real kernel oops log?



