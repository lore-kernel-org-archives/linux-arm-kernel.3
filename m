Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA42CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lf9KRuU3XqjH9s/P98ePLTJLe34Mktbt6oDMXgNk/4=; b=PkGHrEMXcgiGrPtelfJX6/pvrz
	1Z1Op1aSXjySYFyjMFwyJxSYThPgO2x3qw1PSfL9iu7K5FlloLqssVGS1h47apR31obvxctDKGAbX
	jMC/SycKw6LB3FkXSEk2yhcrdhWkyEbYui6JGKdcMt1XS4z73nBquaZ99PxbkviPFU4t2A+bWu2jZ
	D2blAXBgqLqGJ3Rl/d1fF4jYIrq1X8IkvyFeJSNHTybDK8PlZH2cjwrACOWxxkcsX6znVq97PuUoz
	Z7fHm3Zn6MW5Tk7g6V8jCtnuKrz+kwV4ANJBOYBp9cJfb/d/fMqP2nW0bbfRJd52EJwnD5hh9532R
	7wkQgm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgLl-00000002Q7A-2eA6;
	Thu, 28 Aug 2025 17:23:49 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbOK-00000001RXy-2rW4;
	Thu, 28 Aug 2025 12:06:10 +0000
Message-ID: <11d46e56-b8d9-4776-9969-d3767d8cda41@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756382764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4lf9KRuU3XqjH9s/P98ePLTJLe34Mktbt6oDMXgNk/4=;
	b=xClLXYSf4+Y47SMAxpPCJbn6XmGzs3dIcquE8NJLfEPLm3/qz+X/1yTkBgXhVxika8ThH3
	lsRaGUbO+SUI5mHC1mu87EeBMwd5zKFveKVZbK3cxJCrFE1pNVIWRmTlRO9W1F9fgfjpk9
	qoOf/I6JzQnTzROTIOnNmnMuWXhMosw=
Date: Thu, 28 Aug 2025 13:05:55 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] net: ethernet: ti: Prevent divide-by-zero in
 cpts_calc_mult_shift()
To: Miaoqian Lin <linmq006@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Grygorii Strashko <grygorii.strashko@ti.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250828092224.46761-1-linmq006@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250828092224.46761-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_050609_007434_B4BD913A 
X-CRM114-Status: UNSURE (   7.30  )
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

On 28/08/2025 10:22, Miaoqian Lin wrote:
> cpts_calc_mult_shift() has a potential divide-by-zero in this line:
> 
>          do_div(maxsec, freq);
> 
> due to the fact that clk_get_rate() can return zero in certain error
> conditions.

Have you seen this happening in the real environment, or is it just
analysis of the code? I don't see a reason for these "certain error
conditions" to happen...

