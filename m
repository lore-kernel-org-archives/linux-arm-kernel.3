Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B301EA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrh9B0GHEFHb4dNFHIIebjHAK480OIU1h3YEtokgv/E=; b=CqiG1JR81oTWzokFeEqsnjZYF5
	HmJbnVX3sR/S240TUY9N+y/5oGS37InUWlxcEy9PUSI2Jaul3iU9rYP3WZSAd2bL7p2bIkX5+7IBt
	MRobLW2taQWdjTIM8E2oz86EJRy74sk12k9NBZ0lgiy24anrNsJYP0Yn+vJzX3gjrVe8r9BUre+et
	fG9z0+QtSXxdCQ4q2p6qT2fgFaNAKIVt/L8qcyv0Nn/5YSgFIgal3pRaCpBVTtRD91j68QCi1+ZNo
	Xlf3q/qWAi8mIB85otBsvHPWGQaxhKgwXets9lzl01KLXQ8ZWI6Z21srzHWbrwPKEJhWAHf1ab0m4
	OnyUNTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTvk-000000008rN-2RYw;
	Mon, 23 Feb 2026 11:16:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTvi-000000008pT-2cSR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:16:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67E3E339;
	Mon, 23 Feb 2026 03:16:37 -0800 (PST)
Received: from e134344.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 837F03F62B;
	Mon, 23 Feb 2026 03:16:41 -0800 (PST)
Date: Mon, 23 Feb 2026 11:16:32 +0000
From: Ben Horgan <ben.horgan@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Hyesoo Yu <hyesoo.yu@samsung.com>,
	Quentin Perret <qperret@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: Force the use of CNTVCT_EL0 in __delay()
Message-ID: <aZw3EGs4rbQvbAzV@e134344.arm.com>
References: <20260213141619.1791283-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213141619.1791283-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_031646_749209_C0E2F42C 
X-CRM114-Status: GOOD (  33.15  )
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

Hi Marc,

On Fri, Feb 13, 2026 at 02:16:19PM +0000, Marc Zyngier wrote:
> Quentin forwards a report from Hyesoo Yu, describing an interesting
> problem with the use of WFxT in __delay() when a vcpu is loaded and
> that KVM is *not* in VHE mode (either nVHE or hVHE).
> 
> In this case, CNTVOFF_EL2 is set to a non-zero value to reflect the
> state of the guest virtual counter. At the same time, __delay() is
> using get_cycles() to read the counter value, which is indirected to
> reading CNTPCT_EL0.
> 
> The core of the issue is that WFxT is using the *virtual* counter,
> while the kernel is using the physical counter, and that the offset
> introduces a really bad discrepancy between the two.
> 
> Fix this by forcing the use of CNTVCT_EL0, making __delay() consistent
> irrespective of the value of CNTVOFF_EL2.
> 
> Reported-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> Reported-by: Quentin Perret <qperret@google.com>
> Reviewed-by: Quentin Perret <qperret@google.com>
> Fixes: 7d26b0516a0df ("arm64: Use WFxT for __delay() when possible")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/ktosachvft2cgqd5qkukn275ugmhy6xrhxur4zqpdxlfr3qh5h@o3zrfnsq63od
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/lib/delay.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
> index cb2062e7e2340..d02341303899e 100644
> --- a/arch/arm64/lib/delay.c
> +++ b/arch/arm64/lib/delay.c
> @@ -23,9 +23,20 @@ static inline unsigned long xloops_to_cycles(unsigned long xloops)
>  	return (xloops * loops_per_jiffy * HZ) >> 32;
>  }
>  
> +/*
> + * Force the use of CNTVCT_EL0 in order to have the same base as WFxT.
> + * This avoids some annoying issues when CNTVOFF_EL2 is not reset 0 on a
> + * KVM host running at EL1 until we do a vcpu_put() on the vcpu. When
> + * running at EL2, the effective offset is always 0.
> + *
> + * Note that userspace cannot change the offset behind our back either,
> + * as the vcpu mutex is held as long as KVM_RUN is in progress.
> + */
> +#define __delay_cycles()	__arch_counter_get_cntvct_stable()

I'm seeing this CONFIG_DEBUG_PREEMPT warning, see below, when running 7.0-rc1 on
FVP Base RevC. I haven't tried bisecting but it looks to be introduced by this
change.

The calls are:

__this_cpu_read()
erratum_handler()
arch_timer_reg_read_stable()
__arch_counter_get_cntvct_stable()
__delay()

This silences the warning:

diff --git a/arch/arm64/include/asm/arch_timer.h b/arch/arm64/include/asm/arch_timer.h
index f5794d50f51d..f07e4efa0d2b 100644
--- a/arch/arm64/include/asm/arch_timer.h
+++ b/arch/arm64/include/asm/arch_timer.h
@@ -24,14 +24,14 @@
 #define has_erratum_handler(h)                                         \
        ({                                                              \
                const struct arch_timer_erratum_workaround *__wa;       \
-               __wa = __this_cpu_read(timer_unstable_counter_workaround); \
+               __wa = raw_cpu_read(timer_unstable_counter_workaround); \
                (__wa && __wa->h);                                      \
        })
 
 #define erratum_handler(h)                                             \
        ({                                                              \
                const struct arch_timer_erratum_workaround *__wa;       \
-               __wa = __this_cpu_read(timer_unstable_counter_workaround); \
+               __wa = raw_cpu_read(timer_unstable_counter_workaround); \
                (__wa && __wa->h) ? ({ isb(); __wa->h;}) : arch_timer_##h; \
        })


[    0.116471] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc1 #787 PREEMPT
[    0.116475] Hardware name: FVP Base RevC (DT)
[    0.116476] Call trace:
[    0.116477]  show_stack+0x18/0x24 (C)
[    0.116481]  dump_stack_lvl+0x74/0x8c
[    0.116486]  dump_stack+0x18/0x24
[    0.116490]  check_preemption_disabled+0xd8/0xf8
[    0.116496]  __this_cpu_preempt_check+0x1c/0x28
[    0.116501]  __delay+0x114/0x1d4
[    0.116507]  __const_udelay+0x2c/0x38
[    0.116513]  its_wait_for_range_completion+0x54/0xe4
[    0.116518]  its_send_single_command+0xd0/0x150
[    0.116525]  its_create_device+0x260/0x3a4
[    0.116528]  its_msi_prepare+0x100/0x168
[    0.116532]  its_pci_msi_prepare+0x120/0x168
[    0.116538]  msi_create_device_irq_domain+0x224/0x290
[    0.116542]  pci_setup_msix_device_domain+0x90/0xcc
[    0.116548]  __pci_enable_msix_range+0x1b8/0x620
[    0.116554]  pci_alloc_irq_vectors_affinity+0xc4/0x144
[    0.116559]  pci_alloc_irq_vectors+0x14/0x20
[    0.116564]  ahci_init_one+0x568/0xea8
[    0.116568]  local_pci_probe+0x40/0xa8
[    0.116574]  pci_device_probe+0xd4/0x208
[    0.116580]  really_probe+0xbc/0x29c
[    0.116584]  __driver_probe_device+0x78/0x12c
[    0.116588]  driver_probe_device+0x3c/0x15c
[    0.116592]  __driver_attach+0xc8/0x1d4
[    0.116597]  bus_for_each_dev+0x7c/0xe0
[    0.116602]  driver_attach+0x24/0x30
[    0.116606]  bus_add_driver+0xe4/0x208
[    0.116610]  driver_register+0x5c/0x124
[    0.116614]  __pci_register_driver+0x4c/0x58
[    0.116619]  ahci_pci_driver_init+0x24/0x30
[    0.116624]  do_one_initcall+0x58/0x3e8
[    0.116629]  kernel_init_freeable+0x1e4/0x530
[    0.116634]  kernel_init+0x24/0x1e4
[    0.116640]  ret_from_fork+0x10/0x20



> +
>  void __delay(unsigned long cycles)
>  {
> -	cycles_t start = get_cycles();
> +	cycles_t start = __delay_cycles();
>  
>  	if (alternative_has_cap_unlikely(ARM64_HAS_WFXT)) {
>  		u64 end = start + cycles;
> @@ -35,17 +46,17 @@ void __delay(unsigned long cycles)
>  		 * early, use a WFET loop to complete the delay.
>  		 */
>  		wfit(end);
> -		while ((get_cycles() - start) < cycles)
> +		while ((__delay_cycles() - start) < cycles)
>  			wfet(end);
>  	} else 	if (arch_timer_evtstrm_available()) {
>  		const cycles_t timer_evt_period =
>  			USECS_TO_CYCLES(ARCH_TIMER_EVT_STREAM_PERIOD_US);
>  
> -		while ((get_cycles() - start + timer_evt_period) < cycles)
> +		while ((__delay_cycles() - start + timer_evt_period) < cycles)
>  			wfe();
>  	}
>  
> -	while ((get_cycles() - start) < cycles)
> +	while ((__delay_cycles() - start) < cycles)
>  		cpu_relax();
>  }
>  EXPORT_SYMBOL(__delay);
> -- 
> 2.47.3
> 
> 

Thanks,

Ben

