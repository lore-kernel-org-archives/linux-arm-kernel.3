Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA631C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 08:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9N7+uAZkEN5ICi/bEpu3VTQA6hJVii3ReUztOEBsYHY=; b=VUJdzIdWDdq8wsvMSk0bHLSF7p
	Yxz6u/c/AjzAa7qr2vOPrRlzZjljomLxqh/TS9MYJ/U3XkH9DPxpWFQemRw/U0DDeDkuZ3Gpanyrm
	JMLX/bUWdYm8oeOm7OU/jEhsy1dQ6LFJHvdBbF8NMubEIYJkxa6CqVQ9xVdClVslanEFYkXc7JWbj
	/0FxGEBpwb35E+GvQwcu2eZg0V4izuG4bGsLsYK70nylOLerrwnjHFDGBakeTg4YBwgHjFF3k/6Mz
	1aUJRv9/1LNtlo5vpTf7909UelDxDMDn8XCIb16KHF+sLr20H7HUOa4y710gwKdaaJHsZSuNYn5k4
	lj6eBbmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZMi-0000000EcZO-2psb;
	Wed, 06 Aug 2025 08:19:16 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZF7-0000000EbIO-3abZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 08:11:27 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bxjYD0qPnz14ML1;
	Wed,  6 Aug 2025 16:06:24 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 55C9114022F;
	Wed,  6 Aug 2025 16:11:20 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 6 Aug 2025 16:11:19 +0800
Message-ID: <94757d00-5a8e-ac6b-f832-030f33ccf771@huawei.com>
Date: Wed, 6 Aug 2025 16:11:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v7 0/7] arm64: entry: Convert to generic irq entry
Content-Language: en-US
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <mark.rutland@arm.com>, <puranjay@kernel.org>,
	<broonie@kernel.org>, <mbenes@suse.cz>, <ryan.roberts@arm.com>,
	<akpm@linux-foundation.org>, <chenl311@chinatelecom.cn>,
	<anshuman.khandual@arm.com>, <kristina.martsenko@arm.com>,
	<liaochang1@huawei.com>, <ardb@kernel.org>, <leitao@debian.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <6bd09b5b-9830-42b4-ad9e-9ad1e153e564@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <6bd09b5b-9830-42b4-ad9e-9ad1e153e564@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_011126_058392_8E67E75B 
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



On 2025/8/5 23:08, Ada Couprie Diaz wrote:
> Hi Jinjie,
> 
> On 29/07/2025 02:54, Jinjie Ruan wrote:
> 
>> Since commit a70e9f647f50 ("entry: Split generic entry into generic
>> exception and syscall entry") split the generic entry into generic irq
>> entry and generic syscall entry, it is time to convert arm64 to use
>> the generic irq entry. And ARM64 will be completely converted to generic
>> entry in the upcoming patch series.
> Note : I had to manually cherry-pick a70e9f647f50 when pulling the series
> on top of the Linux Arm Kernel for-next/core branch, but there might be
> something I'm missing here.
>>

It seems that it is now in mainline v6.16-rc1 and linux-next but not
Linux Arm Kernel for-next/core branch.

[...]

> I'll spend some time testing the series now, specifically given patch 6's
> changes, but other than that everything I saw made sense and didn't look
> like it would be of concern to me.

Thank you for the test and review.

> 
> Thanks,
> Ada
> 

