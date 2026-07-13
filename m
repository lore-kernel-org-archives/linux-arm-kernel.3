Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D4AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBrXVBLeI2IEHvIvaOWKwyqAdMHFb6oga++/AXMhGxQ=; b=OBky/k2dTgUCz2S47X6QyqSMbX
	m8mT0MbZ6dWf+NCXHDz3Y7welf1NYUsv1Ulg+PqSabmQd8/m509CqqduXmRYkPI65YRAtq1/ZG8Mm
	oYs60LgaW5x1+XLNHzGVxzRdgKbRCLGIyO6A6/7apwee080tio+6bomDKPQVcWwviQ1LzXQRdcuVF
	2LXBQ+TDtfk1+6B8/bQlEZ2ypug+Vp2p4eQHkt2+qWnpvPovgQ+8c5+Zr6nxYEWFu8NTF2/qk1wyf
	n7VKqz+Sm08/14Wz5ZsigfkD7kprZGulAl4bzaz43IWO650r3lwrf/wKuyGM1qrCR0JqJBGC8oslc
	GQCYkF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDQ1-00000008nWS-2Pb8;
	Mon, 13 Jul 2026 09:57:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDPz-00000008nWL-2SKH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:57:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD4B842ACD;
	Mon, 13 Jul 2026 09:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB261F00A3D;
	Mon, 13 Jul 2026 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783936662;
	bh=aBrXVBLeI2IEHvIvaOWKwyqAdMHFb6oga++/AXMhGxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hfTueQg900K2ypOWxlKMzGOIEgWSbJrvzJnxo3vCHRq+jA7KVhy3HOtmzQ5/GWEEl
	 lpyAc37NQF69qqd/vVEsM3k1mfO28ktyM9yxPIRjpREeBcMfMniJdMWENMEqn5taMN
	 k4ZenW3aSYUU6w3LQswfS7bPvbr41Zd8gC4HPSW3fQvxOvsEfjetms3C5rSp8zLC4L
	 bFF5zuM8pCjti4SLwujr2ti0l0Wo1NKFpbPj7bTodj8FCcZG4ZCtis+zBRNPZtislV
	 RS+8xBcr9nv0x9BOtuPHH1L1IrbTHSN3whtbtue3Dhc1o10q/sl0R/oeKDWJHa3omJ
	 OoloLUPtEuoQA==
Date: Mon, 13 Jul 2026 10:57:38 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
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

On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
> Overriding the idle mechanism might be useful for debugging and performance
> testing. Add a cmdline parameter for it, similar to the existing idle=
> parameter already present for the x86 and ppc architectures.
> 
> It is also useful on platforms where the WFI instruction misbehaves,
> such as Apple Silicon SoCs. Generally, a misbehaving instruction should
> be treated as an erratum and patched using the alternatives framework.
> However, in the Apple Silicon case we need more flexibility because it is
> difficult to detect whether the erratum applies. For example, Linux VMs
> inside macOS have the same MIDR and may even seem like they're running
> in EL2 in the case of NV, but should continue using WFI (it's trapped and
> handled correctly by the hypervisor there). Thus, we prefer to
> let the m1n1 bootloader add the idle=nop parameter[1].
> 
> Link[1]: https://lore.kernel.org/all/99b69262-e54b-424e-baa2-96ef7013b87a@kernel.org/
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
> Changes in v2:
> - Applied suggestions by Anshuman Khandual (Thanks!)
> - Link to v1: https://patch.msgid.link/20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 23 +++++++++++++++++++
>  arch/arm64/kernel/idle.c                        | 30 +++++++++++++++++++++++--
>  arch/arm64/kernel/idle.h                        | 13 +++++++++++
>  arch/arm64/lib/delay.c                          |  5 ++++-
>  4 files changed, 68 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b2d7d3540ded..d7f5471edf8f 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2239,6 +2239,29 @@ Kernel parameters
>  
>  			idle=nomwait: Disable mwait for CPU C-states
>  
> +			[ARM64,EARLY]
> +			Format: idle=wfi, idle=yield, idle=nop
> +
> +			idle=wfi: Use the WFI (Wait For Interrupt) hint
> +			instruction in the idle loop. This is the default and
> +			allows the CPU to enter a low-power state until an
> +			interrupt arrives.

Just curious as when and why one would need to use idle=wfi if that is the
default behaviour. I am missing the need to have it.

> +
> +			idle=yield: Use the YIELD hint instruction instead of
> +			WFI. CPUs supporting simultaneous multi-threading (SMT),
> +			can continue executing another thread when the current
> +			thread reaches the idle loop. This will make the CPUs
> +			eat more power, but may be useful to get slightly better
> +			performance in some applications, since the CPUs will
> +			not enter a low-power state.
> +
> +			idle=nop: Do not execute any idle instruction in the
> +			idle loop. This is useful on platforms where WFI
> +			misbehaves, leading to system instability or loss of CPU
> +			state. This will make the CPUs eat more power, but may
> +			give slightly better performance in some applications,
> +			since the CPUs will not enter a low-power state.
> +
>  	idxd.sva=	[HW]
>  			Format: <bool>
>  			Allow force disabling of Shared Virtual Memory (SVA)
> diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
> index 05cfb347ec26..f161711a9954 100644
> --- a/arch/arm64/kernel/idle.c
> +++ b/arch/arm64/kernel/idle.c
> @@ -11,6 +11,27 @@
>  #include <asm/cpufeature.h>
>  #include <asm/sysreg.h>
>  
> +#include "idle.h"
> +
> +enum arm64_idle_mode idle = ARM64_IDLE_WFI;
> +
> +static int __init setup_idle(char *arg)
> +{
> +	if (!arg)
> +		return -1;
> +	else if (!strcmp(arg, "wfi"))
> +		idle = ARM64_IDLE_WFI;
> +	else if (!strcmp(arg, "yield"))
> +		idle = ARM64_IDLE_YIELD;
> +	else if (!strcmp(arg, "nop"))
> +		idle = ARM64_IDLE_NOP;
> +	else
> +		return -1;
> +
> +	return 0;
> +}
> +early_param("idle", setup_idle);
> +
>  /*
>   *	cpu_do_idle()
>   *
> @@ -26,8 +47,13 @@ void __cpuidle cpu_do_idle(void)
>  
>  	arm_cpuidle_save_irq_context(&context);
>  
> -	dsb(sy);
> -	wfi();
> +	if (likely(idle == ARM64_IDLE_WFI)) {
> +		dsb(sy);
> +		wfi();
> +	} else if (idle == ARM64_IDLE_YIELD) {
> +		dsb(sy);
> +		asm volatile("yield" ::: "memory");
> +	}
>  
>  	arm_cpuidle_restore_irq_context(&context);


If WFI is replaced by NOP or YIELD, do we really need to save/restore
IRQ context used for pseudo-NMIs which may add some overhead ?

-- 
Regards,
Sudeep

