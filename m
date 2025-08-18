Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAA8CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 03:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GuUtFjaQqeAu6KSHmd1NnHxXxJPK5jqYfglAeOVZMjs=; b=FT5TVbmSC5aD2J3lG0Zdc6Dy9G
	LDn9yUP04DUFrRhGlhbtsRoL989JyWkJxzcQmfHQeVdlDfwx+38P8SPcynzdYRXoOMMmMGZYjjnB7
	XGai0Q+rc7450GtOE7LdO6pK/vWrKPQ5z8V8yib0CyGx1LRLSueXnYQ5XTVpqc3MhVaF3ByNNFf69
	UbaNh2kJUW7ya1H74KSjJceRRKhEbNewfrRVixIanJYZ/JY1nNTxLDZPUg4sv0nxyE4/a4I60y9T+
	rXxbZtdBeWwlZUYreFm2BkQgB0mFDiGTOEev7rifeFHZDClS4uqlf0VkeM+KjwoFx4haeD9o2Rj3E
	6EoKcOpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unqrG-00000006P81-3RMP;
	Mon, 18 Aug 2025 03:48:30 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unqoi-00000006Owm-02nI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 03:45:53 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4c4z9n0qPsz3TqWx;
	Mon, 18 Aug 2025 11:44:45 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 34E5B1A016C;
	Mon, 18 Aug 2025 11:43:40 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 11:43:39 +0800
Message-ID: <49395077-1af8-42c2-09bd-b87ed9d4a41b@huawei.com>
Date: Mon, 18 Aug 2025 11:43:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v8 0/8] arm64: entry: Convert to generic irq entry
To: kemal <kmal@cock.li>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250815030633.448613-1-ruanjinjie@huawei.com>
 <20250817211403.31054-1-kmal@cock.li>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20250817211403.31054-1-kmal@cock.li>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_204552_220237_E5FE9F1A 
X-CRM114-Status: GOOD (  10.09  )
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



On 2025/8/18 5:14, kemal wrote:
> Hello,
> 
>> Since commit a70e9f647f50 ("entry: Split generic entry into generic
>> exception and syscall entry") split the generic entry into generic irq
>> entry and generic syscall entry, it is time to convert arm64 to use
>> the generic irq entry. And ARM64 will be completely converted to generic
>> entry in the upcoming patch series.
> 
> I was trying to implement syscall user dispatch support for ARM64,
> which is simply about converting arm64 to use the generic entry, and I
> stumbled upon your patchset on Google. So I decided to write the code
> for generic syscall entry on top of this patchset, and the code seems
> to be working. (It boots, and SUD works, but I didn't test ptrace etc.)
> 
> Should I send the code here?

I have implement the generic syscall entry in v5 and will completely
convert arm64 to generic entry in the upcoming patch series.

https://lkml.org/lkml/2024/12/6/609

