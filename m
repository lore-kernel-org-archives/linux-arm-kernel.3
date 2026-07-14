Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED67C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fp7EDGU5b79WmWdY3plKZu+H6UMZudAOWzavRLRHd8Q=; b=mrmkWxepOfD8k5
	RtOSTH8PiypLUSyiIeI0z573+6G6v3iKM2KKv0d+0+bMcKWoSL8Y3k+y8Wo139g0mGLgtC7nuJ9Om
	Np01v1c43+cgKJ9wpoDdhclEE+p2Xhj7mY5D6wkRrVN6fXryw2SHhL4QkJVUjhVK3ixZj2SmBSVVC
	DAc5r4ZBnjw2pc97aoSfaJbSN9rU4QgdnpS6hdOX0AVdaHYnF8+QBJM7NC4UW9SWx0Kw4VN+2JKZC
	oLPtVESwdesiJoN4yrURIgA60hcKy7sozrf+I/aW7dxop6KJg3lIgeW1z+i3nAHoiu3i23YURfXQ2
	MtFW9dZef1yqJu/Je7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbeK-0000000BnW2-2Dbk;
	Tue, 14 Jul 2026 11:50:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbeH-0000000BnVS-2KIZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:50:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 386FB497;
	Tue, 14 Jul 2026 04:50:00 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA3523F93E;
	Tue, 14 Jul 2026 04:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784029804; bh=aTdOaOA0buhylr6yxPhHYiYgFW8Bijy33maVr7NCkLA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pBiTvDMw0ySI3pLeHQVpP411R6hAMLpmIFLz/R7VH+12ZARNjLdu7FW8tiKVXVEeQ
	 oslKGmxmX81BW6a61dCKZMuUlQwB9xTOgURYxU1KB2J9p/GPTEJV2aKM6/AhLRrYAO
	 P0grvC/UrZUh+wvDIeI5R+LhpGwF3DEakP+Z1APM=
Message-ID: <1c3a6c5f-053c-4de0-a050-bbde8986fc03@arm.com>
Date: Tue, 14 Jul 2026 12:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/36] arm64: irqflags: introduce arm64-specific
 irqflags type
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-10-vladimir.murzin@arm.com>
 <cb05707e-f623-4058-8c28-031b77f4454e@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <cb05707e-f623-4058-8c28-031b77f4454e@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_045005_803955_77CC530D 
X-CRM114-Status: GOOD (  26.57  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/10/26 09:40, Jinjie Ruan wrote:
> On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> With pseudo-NMIs enabled, we have two mechanisms that control
>> interrupt masking in parallel :
>> - The DAIF flags, masking at the CPU
>> - The GIC PMR, masking before the CPU
>>
>> However, our irqflags implementation currently assumes that only one
>> of the two is used at a time, so both DAIF and PMR masking use the same
>> `unsigned long flags` in their own way.
>> This is incorrect, as some parts of the kernel will mask interrupts
>> with DAIF directly or bypass the local_irq masking via the PMR,
>> and makes tracking the state and changes of both in parallel impossible.
>>
>> The irqflags API expects `unsigned long`s to be passed around, but
>> they should not be manipulated outside of the arch-specific code.
>> So, we can encode the information we need however we want as long as
>> we return and accept `unsigned long`s.
>>
>> Introduce a union type for arm64 irqflags whose first member is
>> a struct allowing us to track DAIF and PMR in parallel, and the second
>> is the `unsigned long` expected by the irqflags API.
>>
>> DAIF is a two byte value, to maintain compatibility with existing defines.
>> PMR is a one byte value, which is the maximum amount of priority bits
>> allowed by the GICv3 architecture.
>>
>> Update the internal irqflags functions to use this new union and convert
>> back and forth with the irqflags unsigned long.
>> There should be no functional changes.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/include/asm/irqflags.h | 80 ++++++++++++++++++++-----------
>>  1 file changed, 53 insertions(+), 27 deletions(-)
> I believe that using the newly introduced arm64_exc_hwstate_t only at
> the lowest level results in the least changes and is the most readable.
> 
> otherwise, LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> arch/arm64/include/asm/irqflags.h | 42
> ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/irqflags.h
> b/arch/arm64/include/asm/irqflags.h
> index a8cb5a5c93b7..4b4521007183 100644
> --- a/arch/arm64/include/asm/irqflags.h
> +++ b/arch/arm64/include/asm/irqflags.h
> @@ -9,6 +9,8 @@
>  #include <asm/ptrace.h>
>  #include <asm/sysreg.h>
> 
> +#include <linux/compiler.h>
> +
>  /*
>   * Aarch64 has flags for masking: Debug, Asynchronous (serror),
> Interrupts and
>   * FIQ exceptions, in the 'daif' register. We mask and unmask them in
> 'daif'
> @@ -20,6 +22,22 @@
>   * exceptions should be unmasked.
>   */
> 
> + /*
> +  * Internally, we want to independently manipulate and track the different
> +  * interrupt masking mechanisms.
> +  * Externally, the generic irqflags API expects unsgined longs to
> represent
> +  * the state of interrupts, which are treated as obscure arch-specific
> data.
> +  */
> +typedef union arm64_exc_hwstate {
> +       struct {
> +               u16 daif;
> +               u8 pmr;
> +       };
> +       unsigned long flags;
> +} arm64_exc_hwstate_t;
> +
> +static_assert(sizeof(arm64_exc_hwstate_t) == sizeof(unsigned long));
> +
>  static __always_inline void __daif_local_irq_enable(void)
>  {
>         barrier();
> @@ -79,12 +97,16 @@ static __always_inline void arch_local_irq_disable(void)
> 
>  static __always_inline unsigned long __daif_local_save_flags(void)
>  {
> -       return read_sysreg(daif);
> +       arm64_exc_hwstate_t state = { .daif = read_sysreg(daif) };
> +
> +       return state.flags;
>  }
> 
>  static __always_inline unsigned long __pmr_local_save_flags(void)
>  {
> -       return read_sysreg_s(SYS_ICC_PMR_EL1);
> +       arm64_exc_hwstate_t state = { .pmr =
> read_sysreg_s(SYS_ICC_PMR_EL1) };
> +
> +       return state.flags;
>  }
> 
>  /*
> @@ -101,12 +123,16 @@ static __always_inline unsigned long
> arch_local_save_flags(void)
> 
>  static __always_inline bool __daif_irqs_disabled_flags(unsigned long flags)
>  {
> -       return flags & PSR_I_BIT;
> +       arm64_exc_hwstate_t hwstate = { .flags = flags };
> +
> +       return hwstate.daif & PSR_I_BIT;
>  }
> 
>  static __always_inline bool __pmr_irqs_disabled_flags(unsigned long flags)
>  {
> -       return flags != GIC_PRIO_IRQON;
> +       arm64_exc_hwstate_t hwstate = { .flags = flags };
> +
> +       return hwstate.pmr != GIC_PRIO_IRQON;
>  }
> 
>  static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
> @@ -171,15 +197,19 @@ static __always_inline unsigned long
> arch_local_irq_save(void)
> 
>  static __always_inline void __daif_local_irq_restore(unsigned long flags)
>  {
> +       arm64_exc_hwstate_t hwstate = { .flags = flags };
> +
>         barrier();
> -       write_sysreg(flags, daif);
> +       write_sysreg(hwstate.daif, daif);
>         barrier();
>  }
> 
>  static __always_inline void __pmr_local_irq_restore(unsigned long flags)
>  {
> +       arm64_exc_hwstate_t hwstate = { .flags = flags };
> +
>         barrier();
> -       write_sysreg_s(flags, SYS_ICC_PMR_EL1);
> +       write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
>         pmr_sync();
>         barrier();
>  }

Thanks! I'll have a closer look at the impact it has.

Vladimir

