Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDF4C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUPqitOWb1cdWJgWptQBD0fcULkT4hxweQXjK3y6VOY=; b=2azmjR+Ox2d5WDd6Gy5RM7PCwc
	ZWiXOmS/0wge2XWLEgvxVZD3VstCX+kFgvNE/ZocQMnu+6Z4ouWtcL/xHI3Dt/Fj2cKJdzwMHqgRw
	Gl3byvQLwGE2os3OtNmcGfnQ+sUv/3SbvE4O7In7E+K+bp4gXsX1ozbRT0mFCvm8L1txhwFndxnrf
	AzLUuovncWaPuin3Ia/BMfKUxE+7cbAvfl1JZIwa4yt3iweeRzcZCPAVfuxgH7+tiLJrPi7dPiCyv
	MO/7J4q0qKdmsP/YI0Nf5Oj5T054N5fkKUxlv40na6X4x+Z2wJ8E1EKYK6TjrfElIdlh5Vv8oxfkq
	ROXDcvXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfet6-00000007GQB-1Vsp;
	Fri, 03 Jul 2026 14:29:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfet3-00000007GPe-0KGK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:29:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D44B1EA6;
	Fri,  3 Jul 2026 07:28:55 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C2863F905;
	Fri,  3 Jul 2026 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783088939; bh=nv3+ueVUIqGIKl6icFEdZ93kbNEcdpBz4MyhQ3JR4po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgpwwyrA/S1qdbCYzbpunx+YSOi/jbPy7mBef/QF23F8VqcSZmHV4PamfxqlyayUB
	 sq2PIBc7rIVuruoOoPtnyLYPY+bSDlQGmACa4RDkTcGSIIPiF6xcDbM7b2i+disHMG
	 NSjNMHHWVx90IeXhriurCRV5kA4+6xDVTZCTt0Hs=
Date: Fri, 3 Jul 2026 15:28:48 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
Message-ID: <akfHIH_dZrr5bosu@J2N7QTR9R3>
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_072901_206194_D7D88C47 
X-CRM114-Status: GOOD (  28.03  )
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

On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
> The Qualcomm SoCs like LeMans, Monaco 

Are those released products?

Are those mobile phone parts, or somthing else?

> support suspend to ram which leads the SoC to ACPI S3 similar state
> where SoC is turned off and DDR is retained. The hardware design on
> these SoCs forces a constraint to suspend and resume the system on
> boot CPU / CPU0.
> 
> If CPU0 is already offline before starting suspend to ram the
> freeze_secondary_cpus() picks alternate CPU as primary / last CPU and
> proceed further to invoke PSCI SYSTEM_SUSPEND.
> This leads to a system crash.

Ok, so that's a firmware bug.

Why does the FW permit CPU0 to be offlined in the first place if it
can't handle this?

What does PSCI_MIGRATE_INFO_TYPE report?

Ideally it'd report Uniprocessor (UP) not migrate capable (1), which
would prevent CPU_OFF on that CPU, and would force suspend to happen
there...

> In order to prevent such an issue introduce PM_SLEEP_SMP_CPU_ZERO_STRICT
> config and when enabled prohibit the CPU0 from getting disabled.

I don't think it makes sense for this to be a config option.

This is a platform-specific property, and it's possible to build a
kernel that boots on this platform and/or other platforms.

> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
> Changes in v2:
> - Moved the check to arm64 specific code.
> - Link to v1: https://lore.kernel.org/r/20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com
> ---
>  arch/arm64/Kconfig       | 9 +++++++++
>  arch/arm64/kernel/psci.c | 6 ++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fe60738e5943ba279e5571862423df4fed3db661..21697a535a25d286a2f8afe4921a41b13cc32c0a 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -263,6 +263,15 @@ config ARM64
>  	help
>  	  ARM 64-bit (AArch64) Linux support.
>  
> +config PM_SLEEP_SMP_CPU_ZERO_STRICT
> +       bool "Disallow boot CPU (CPU0) offline"
> +       depends on ARCH_QCOM

Why can't others select this?

> +       depends on HOTPLUG_CPU
> +       depends on SUSPEND
> +       help
> +         Disallow boot CPU (CPU0) offline when the suspend_ops->enter()
> +         has to be executed by boot CPU.

As above, I don't think this makse sense as a config option.

Either we handle the FW bug, or we do not.

Mark.

> +
>  config RUSTC_SUPPORTS_ARM64
>  	def_bool y
>  	depends on CPU_LITTLE_ENDIAN
> diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
> index fabd732d0a2dfee37074ef4ebb6ce5894871c8bd..4ad90ae6f8bacf0cbd3203d66580107d467ea232 100644
> --- a/arch/arm64/kernel/psci.c
> +++ b/arch/arm64/kernel/psci.c
> @@ -49,6 +49,12 @@ static int cpu_psci_cpu_boot(unsigned int cpu)
>  #ifdef CONFIG_HOTPLUG_CPU
>  static bool cpu_psci_cpu_can_disable(unsigned int cpu)
>  {
> +#ifdef CONFIG_PM_SLEEP_SMP_CPU_ZERO_STRICT
> +	if (cpu == get_boot_cpu_id()) {
> +		pr_info("Disabling boot CPU is not supported\n");
> +		return false;
> +	}
> +#endif
>  	return !psci_tos_resident_on(cpu);
>  }
>  
> 
> ---
> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
> change-id: 20260603-disable_boot_cpu_offline-eb4f55ac96f2
> 
> Best regards,
> -- 
> Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> 
> 

