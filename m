Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9FDC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJU4rLfB7AKGCfzlYREDI8QDO3dBR7s5B32E3f1O/04=; b=akK3cNPuIb6lY2
	PVFp0FPMM4Tr2/DQgMLi0vsbzSUuvE0BkEBHPK3tpWMcFNImwUGWqtLolcX43zl37/yQH77kCDcT9
	o6cFb+87LG6HAo7lxocWBGrC7yABw2UOgilAhM/GCfk7ZigFMR8d0NFJ6BcdVSJD5kGTJk5AbSBxX
	FzYMgBNPB43xVkYYrBuaVFoOnKmjbvY136O9Q+uo2A2/tta3wfYycHFWsffilFxSuxjQ4TxqrX+NK
	G5oVR81qV8jzSfIte27T3OKpXN4JiS9HOD0U4LeNJDpSqgLclpkswHPiIxtgvWR0lXpVQCpGO0woI
	vpK3f1xL2ydxMn99szUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6nA-00000004Tmh-1Mbi;
	Fri, 10 Jul 2026 08:41:04 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6n6-00000004TlJ-0Upr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:41:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zJU4rLfB7AKGCfzlYREDI8QDO3dBR7s5B32E3f1O/04=;
	b=OcqkXoXhDUfznoNw1dkVWBZbCwPjI4WzygWya6ioiIqBwudgp+XFOMUy+4IQC3sc97oGRBRyA
	3m1gZUx0KqXE0lDyIDb4TURoeYk6Fsf0UoavcRmkheIT7G0geDqyEpPs8hXbJJQ2XTf2Ooxw69m
	SuQ4t1F2rpHwmHpVop9p8CA=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gxQ650zt0zKmb1;
	Fri, 10 Jul 2026 16:31:25 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DD2914057A;
	Fri, 10 Jul 2026 16:40:42 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Jul 2026 16:40:42 +0800
Message-ID: <cb05707e-f623-4058-8c28-031b77f4454e@huawei.com>
Date: Fri, 10 Jul 2026 16:40:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/36] arm64: irqflags: introduce arm64-specific
 irqflags type
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-10-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-10-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_014100_791873_EA587C67 
X-CRM114-Status: GOOD (  34.69  )
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



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> With pseudo-NMIs enabled, we have two mechanisms that control
> interrupt masking in parallel :
> - The DAIF flags, masking at the CPU
> - The GIC PMR, masking before the CPU
> 
> However, our irqflags implementation currently assumes that only one
> of the two is used at a time, so both DAIF and PMR masking use the same
> `unsigned long flags` in their own way.
> This is incorrect, as some parts of the kernel will mask interrupts
> with DAIF directly or bypass the local_irq masking via the PMR,
> and makes tracking the state and changes of both in parallel impossible.
> 
> The irqflags API expects `unsigned long`s to be passed around, but
> they should not be manipulated outside of the arch-specific code.
> So, we can encode the information we need however we want as long as
> we return and accept `unsigned long`s.
> 
> Introduce a union type for arm64 irqflags whose first member is
> a struct allowing us to track DAIF and PMR in parallel, and the second
> is the `unsigned long` expected by the irqflags API.
> 
> DAIF is a two byte value, to maintain compatibility with existing defines.
> PMR is a one byte value, which is the maximum amount of priority bits
> allowed by the GICv3 architecture.
> 
> Update the internal irqflags functions to use this new union and convert
> back and forth with the irqflags unsigned long.
> There should be no functional changes.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/irqflags.h | 80 ++++++++++++++++++++-----------
>  1 file changed, 53 insertions(+), 27 deletions(-)

I believe that using the newly introduced arm64_exc_hwstate_t only at
the lowest level results in the least changes and is the most readable.

otherwise, LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

arch/arm64/include/asm/irqflags.h | 42
++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/irqflags.h
b/arch/arm64/include/asm/irqflags.h
index a8cb5a5c93b7..4b4521007183 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -9,6 +9,8 @@
 #include <asm/ptrace.h>
 #include <asm/sysreg.h>

+#include <linux/compiler.h>
+
 /*
  * Aarch64 has flags for masking: Debug, Asynchronous (serror),
Interrupts and
  * FIQ exceptions, in the 'daif' register. We mask and unmask them in
'daif'
@@ -20,6 +22,22 @@
  * exceptions should be unmasked.
  */

+ /*
+  * Internally, we want to independently manipulate and track the different
+  * interrupt masking mechanisms.
+  * Externally, the generic irqflags API expects unsgined longs to
represent
+  * the state of interrupts, which are treated as obscure arch-specific
data.
+  */
+typedef union arm64_exc_hwstate {
+       struct {
+               u16 daif;
+               u8 pmr;
+       };
+       unsigned long flags;
+} arm64_exc_hwstate_t;
+
+static_assert(sizeof(arm64_exc_hwstate_t) == sizeof(unsigned long));
+
 static __always_inline void __daif_local_irq_enable(void)
 {
        barrier();
@@ -79,12 +97,16 @@ static __always_inline void arch_local_irq_disable(void)

 static __always_inline unsigned long __daif_local_save_flags(void)
 {
-       return read_sysreg(daif);
+       arm64_exc_hwstate_t state = { .daif = read_sysreg(daif) };
+
+       return state.flags;
 }

 static __always_inline unsigned long __pmr_local_save_flags(void)
 {
-       return read_sysreg_s(SYS_ICC_PMR_EL1);
+       arm64_exc_hwstate_t state = { .pmr =
read_sysreg_s(SYS_ICC_PMR_EL1) };
+
+       return state.flags;
 }

 /*
@@ -101,12 +123,16 @@ static __always_inline unsigned long
arch_local_save_flags(void)

 static __always_inline bool __daif_irqs_disabled_flags(unsigned long flags)
 {
-       return flags & PSR_I_BIT;
+       arm64_exc_hwstate_t hwstate = { .flags = flags };
+
+       return hwstate.daif & PSR_I_BIT;
 }

 static __always_inline bool __pmr_irqs_disabled_flags(unsigned long flags)
 {
-       return flags != GIC_PRIO_IRQON;
+       arm64_exc_hwstate_t hwstate = { .flags = flags };
+
+       return hwstate.pmr != GIC_PRIO_IRQON;
 }

 static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
@@ -171,15 +197,19 @@ static __always_inline unsigned long
arch_local_irq_save(void)

 static __always_inline void __daif_local_irq_restore(unsigned long flags)
 {
+       arm64_exc_hwstate_t hwstate = { .flags = flags };
+
        barrier();
-       write_sysreg(flags, daif);
+       write_sysreg(hwstate.daif, daif);
        barrier();
 }

 static __always_inline void __pmr_local_irq_restore(unsigned long flags)
 {
+       arm64_exc_hwstate_t hwstate = { .flags = flags };
+
        barrier();
-       write_sysreg_s(flags, SYS_ICC_PMR_EL1);
+       write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
        pmr_sync();
        barrier();
 }


> 
> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
> index a8cb5a5c93b7..7775904ba6a9 100644
> --- a/arch/arm64/include/asm/irqflags.h
> +++ b/arch/arm64/include/asm/irqflags.h
> @@ -9,6 +9,8 @@
>  #include <asm/ptrace.h>
>  #include <asm/sysreg.h>
>  
> +#include <linux/compiler.h>
> +
>  /*
>   * Aarch64 has flags for masking: Debug, Asynchronous (serror), Interrupts and
>   * FIQ exceptions, in the 'daif' register. We mask and unmask them in 'daif'
> @@ -20,6 +22,22 @@
>   * exceptions should be unmasked.
>   */
>  
> + /*
> +  * Internally, we want to independently manipulate and track the different
> +  * interrupt masking mechanisms.
> +  * Externally, the generic irqflags API expects unsgined longs to represent
> +  * the state of interrupts, which are treated as obscure arch-specific data.
> +  */
> +typedef union arm64_exc_hwstate {
> +	struct {
> +		u16 daif;
> +		u8 pmr;
> +	};
> +	unsigned long flags;
> +} arm64_exc_hwstate_t;
> +
> +static_assert(sizeof(arm64_exc_hwstate_t) == sizeof(unsigned long));
> +
>  static __always_inline void __daif_local_irq_enable(void)
>  {
>  	barrier();
> @@ -77,14 +95,14 @@ static __always_inline void arch_local_irq_disable(void)
>  	}
>  }
>  
> -static __always_inline unsigned long __daif_local_save_flags(void)
> +static __always_inline arm64_exc_hwstate_t __daif_local_save_flags(void)
>  {
> -	return read_sysreg(daif);
> +	return (arm64_exc_hwstate_t){ .daif = read_sysreg(daif) };
>  }
>  
> -static __always_inline unsigned long __pmr_local_save_flags(void)
> +static __always_inline arm64_exc_hwstate_t __pmr_local_save_flags(void)
>  {
> -	return read_sysreg_s(SYS_ICC_PMR_EL1);
> +	return (arm64_exc_hwstate_t){ .pmr = read_sysreg_s(SYS_ICC_PMR_EL1) };
>  }
>  
>  /*
> @@ -93,28 +111,32 @@ static __always_inline unsigned long __pmr_local_save_flags(void)
>  static __always_inline unsigned long arch_local_save_flags(void)
>  {
>  	if (system_uses_irq_prio_masking()) {
> -		return __pmr_local_save_flags();
> +		return __pmr_local_save_flags().flags;
>  	} else {
> -		return __daif_local_save_flags();
> +		return __daif_local_save_flags().flags;
>  	}
>  }
>  
> -static __always_inline bool __daif_irqs_disabled_flags(unsigned long flags)
> +static __always_inline
> +bool __daif_irqs_disabled_flags(arm64_exc_hwstate_t hwstate)
>  {
> -	return flags & PSR_I_BIT;
> +	return hwstate.daif & PSR_I_BIT;
>  }
>  
> -static __always_inline bool __pmr_irqs_disabled_flags(unsigned long flags)
> +static __always_inline
> +bool __pmr_irqs_disabled_flags(arm64_exc_hwstate_t hwstate)
>  {
> -	return flags != GIC_PRIO_IRQON;
> +	return hwstate.pmr != GIC_PRIO_IRQON;
>  }
>  
>  static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
>  {
> +	arm64_exc_hwstate_t hwstate = { .flags = flags };
> +
>  	if (system_uses_irq_prio_masking()) {
> -		return __pmr_irqs_disabled_flags(flags);
> +		return __pmr_irqs_disabled_flags(hwstate);
>  	} else {
> -		return __daif_irqs_disabled_flags(flags);
> +		return __daif_irqs_disabled_flags(hwstate);
>  	}
>  }
>  
> @@ -137,49 +159,51 @@ static __always_inline bool arch_irqs_disabled(void)
>  	}
>  }
>  
> -static __always_inline unsigned long __daif_local_irq_save(void)
> +static __always_inline arm64_exc_hwstate_t __daif_local_irq_save(void)
>  {
> -	unsigned long flags = __daif_local_save_flags();
> +	arm64_exc_hwstate_t hwstate = __daif_local_save_flags();
>  
>  	__daif_local_irq_disable();
>  
> -	return flags;
> +	return hwstate;
>  }
>  
> -static __always_inline unsigned long __pmr_local_irq_save(void)
> +static __always_inline arm64_exc_hwstate_t __pmr_local_irq_save(void)
>  {
> -	unsigned long flags = __pmr_local_save_flags();
> +	arm64_exc_hwstate_t hwstate = __pmr_local_save_flags();
>  
>  	/*
>  	 * There are too many states with IRQs disabled, just keep the current
>  	 * state if interrupts are already disabled/masked.
>  	 */
> -	if (!__pmr_irqs_disabled_flags(flags))
> +	if (!__pmr_irqs_disabled_flags(hwstate))
>  		__pmr_local_irq_disable();
>  
> -	return flags;
> +	return hwstate;
>  }
>  
>  static __always_inline unsigned long arch_local_irq_save(void)
>  {
>  	if (system_uses_irq_prio_masking()) {
> -		return __pmr_local_irq_save();
> +		return __pmr_local_irq_save().flags;
>  	} else {
> -		return __daif_local_irq_save();
> +		return __daif_local_irq_save().flags;
>  	}
>  }
>  
> -static __always_inline void __daif_local_irq_restore(unsigned long flags)
> +static __always_inline
> +void __daif_local_irq_restore(arm64_exc_hwstate_t hwstate)
>  {
>  	barrier();
> -	write_sysreg(flags, daif);
> +	write_sysreg(hwstate.daif, daif);
>  	barrier();
>  }
>  
> -static __always_inline void __pmr_local_irq_restore(unsigned long flags)
> +static __always_inline
> +void __pmr_local_irq_restore(arm64_exc_hwstate_t hwstate)
>  {
>  	barrier();
> -	write_sysreg_s(flags, SYS_ICC_PMR_EL1);
> +	write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
>  	pmr_sync();
>  	barrier();
>  }
> @@ -189,10 +213,12 @@ static __always_inline void __pmr_local_irq_restore(unsigned long flags)
>   */
>  static __always_inline void arch_local_irq_restore(unsigned long flags)
>  {
> +	arm64_exc_hwstate_t hwstate = { .flags = flags };
> +
>  	if (system_uses_irq_prio_masking()) {
> -		__pmr_local_irq_restore(flags);
> +		__pmr_local_irq_restore(hwstate);
>  	} else {
> -		__daif_local_irq_restore(flags);
> +		__daif_local_irq_restore(hwstate);
>  	}
>  }
>  


