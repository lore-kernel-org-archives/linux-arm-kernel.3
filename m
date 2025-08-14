Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB6ECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcK5JYZr7EPH+jbdKIb7dwEwKAwt/xm+4V3u85ENtDI=; b=w4LWJqfHyIEpHbD+iGvm4fyjvO
	6hr23XdfiTQ77CtMnqYFi+w3pjqlmt3KtRI+DmvfvnRypFiuJwW5zW7DFhdrFnTxuRUHVR5UrWRka
	hVgCKdgsP7J878k5NSOOjJCtEwQEShG7XN6XQAO4Kjub7WEXjS+Nt6whtwYvYj01sH2oseJLYf918
	3S3mO9UUPxXrdgwsnbGzqZDMTtIvpQc42UVjWg2P3Iln4aTJzJ9s92kKnyOeO6MGJleyAAvV6jqeN
	VWjFbXW7r3zYlLklotpt3p64t9fYQmznZ4OZBCy8+BiKRSnB/q4b5dJR+dAWyuY82dgzuAMvr05lN
	nYbip7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUUN-0000000GRM8-0iHh;
	Thu, 14 Aug 2025 09:43:15 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTeB-0000000GIhY-046O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 08:49:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c2f3W63Rsz2gKx8;
	Thu, 14 Aug 2025 16:46:15 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C74C1A0188;
	Thu, 14 Aug 2025 16:49:06 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 16:49:04 +0800
Message-ID: <afb0fb39-c221-c4c0-08cb-c6941d3ff801@huawei.com>
Date: Thu, 14 Aug 2025 16:49:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v7 5/7] arm64: entry: Refactor
 preempt_schedule_irq() check code
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
 <20250729015456.3411143-6-ruanjinjie@huawei.com>
 <4242ef37-efeb-446f-abbc-0104b805ad12@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <4242ef37-efeb-446f-abbc-0104b805ad12@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_014919_416827_F804A28F 
X-CRM114-Status: GOOD (  19.57  )
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



On 2025/8/12 0:02, Ada Couprie Diaz wrote:
> On 29/07/2025 02:54, Jinjie Ruan wrote:
> 
>> ARM64 requires an additional check whether to reschedule on return
>> from interrupt. So add arch_irqentry_exit_need_resched() as the default
>> NOP implementation and hook it up into the need_resched() condition in
>> raw_irqentry_exit_cond_resched(). This allows ARM64 to implement
>> the architecture specific version for switching over to
>> the generic entry code.
>>
>> To align the structure of the code with irqentry_exit_cond_resched()
>> from the generic entry code, hoist the need_irq_preemption()
>> and IS_ENABLED() check earlier. And different preemption check functions
>> are defined based on whether dynamic preemption is enabled.
>>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
> Unrelated to the other thread : I noticed that compiling this patch
> with `allnoconfig` would fail :
> - `raw_irqentry_exit_cond_resched` has no previous prototype,
>   as it is defined within `#ifdef CONFIG_PREEMPTION`
> - `irqentry_exit_cond_resched()` is not declared, as it is also within
>   `#ifdef CONFIG_PREEMPTION`

You are right, thank you! I'll fix it.

> 
> The patch below fixes the issue, but introduces merge conflicts in
> patches 6 and 7, plus the `#ifdef` needs to be moved accordingly
> in patch 6 and the empty "without preemption" `irq_exit_cond_resched()`
> needs to be removed in patch 7.
> 
> I hope this can be useful,
> Ada
> 
> ---
> diff --git a/arch/arm64/include/asm/preempt.h
> b/arch/arm64/include/asm/preempt.h
> index 0f0ba250efe8..d9aba8b1e466 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -103,6 +103,8 @@ void dynamic_irqentry_exit_cond_resched(void);
>  #define irqentry_exit_cond_resched() raw_irqentry_exit_cond_resched()
> 
>  #endif /* CONFIG_PREEMPT_DYNAMIC */
> +#else /* CONFIG_PREEMPTION */
> +#define irqentry_exit_cond_resched() {}
>  #endif /* CONFIG_PREEMPTION */
> 
>  #endif /* __ASM_PREEMPT_H */
> diff --git a/arch/arm64/kernel/entry-common.c
> b/arch/arm64/kernel/entry-common.c
> index 4f92664fd46c..abd7a315145e 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -661,6 +661,7 @@ static __always_inline void __el1_pnmi(struct
> pt_regs *regs,
>         arm64_exit_nmi(regs, state);
>  }
> 
> +#ifdef CONFIG_PREEMPTION
>  void raw_irqentry_exit_cond_resched(void)
>  {
>         if (!preempt_count()) {
> @@ -668,6 +669,7 @@ void raw_irqentry_exit_cond_resched(void)
>                         preempt_schedule_irq();
>         }
>  }
> +#endif
> 
>  #ifdef CONFIG_PREEMPT_DYNAMIC
>  DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> 
> 

