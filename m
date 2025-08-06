Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF7EC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 02:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqmDvIKk5YdSA6aNR5aswei8DY6rxE4XbnAKl1IV1GE=; b=NurZCjKq6NNvMWxg8Zts5vyhaY
	6bCPiY/KU3eTWCQQu6mQANKut8lPA6YO65bS6DKqgEYB9JzUNeyHMn/vJ9ps2j4jb1QbxxThVNmJb
	hYI67RNUHuV62WETujlU5U98mVTf1NSXUCwhwQegAS3guHvzs9fPam38hitt84I8IjS2CoOyO7wZV
	65VyUm/d8X2wu9ELsfYEa5C8evLo7+Nw1iE6BinLlQGF3/UgiyABiFShPGD8ka8z0BLYRcDuDupU0
	yVIbsA1LuRTna5mRNkGEahLj7i/3zdHmku1188kTpdjHI++NpaVCirT5RzVYOGvfHIlCzcJk2JF6f
	C0nhgIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujTzK-0000000EBBr-1OzX;
	Wed, 06 Aug 2025 02:34:46 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujTwk-0000000EB6Q-0Znp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 02:32:07 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bxZ3V1z9wz13N1Z;
	Wed,  6 Aug 2025 10:28:38 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C3F3140146;
	Wed,  6 Aug 2025 10:31:53 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 6 Aug 2025 10:31:51 +0800
Message-ID: <36bd2bb2-31c8-e38f-e420-407742ccc3cc@huawei.com>
Date: Wed, 6 Aug 2025 10:31:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v7 1/7] arm64: ptrace: Replace interrupts_enabled()
 with regs_irqs_disabled()
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
 <20250729015456.3411143-2-ruanjinjie@huawei.com>
 <beb7e8f2-39f8-499f-a173-b8bf2d3296ea@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <beb7e8f2-39f8-499f-a173-b8bf2d3296ea@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_193206_340211_0D96B16B 
X-CRM114-Status: UNSURE (   8.16  )
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



On 2025/8/5 23:05, Ada Couprie Diaz wrote:
> On 29/07/2025 02:54, Jinjie Ruan wrote:
> 
>> The generic entry code expects architecture code to provide
>> regs_irqs_disabled(regs) function, but arm64 does not have this and
>> provides inerrupts_enabled(regs), which has the opposite polarity.
> Nit: "interrupts_enabled(regs)"

Good catch! thank you for the review.

>> In preparation for moving arm64 over to the generic entry code,
>> relace arm64's interrupts_enabled() with regs_irqs_disabled() and
>> update its callers under arch/arm64.
>>
>> For the moment, a definition of interrupts_enabled() is provided for
>> the GICv3 driver. Once arch/arm implement regs_irqs_disabled(), this
>> can be removed.
>>
>> Delete the fast_interrupts_enabled() macro as it is unused and we
>> don't want any new users to show up.
>>
>> No functional changes.
>>
>> Acked-by: Mark Rutland <mark.rutland@arm.com>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
> Otherwise looks good to me !
> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 

