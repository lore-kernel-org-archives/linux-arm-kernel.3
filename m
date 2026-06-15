Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A432DCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H154WjKnOWacRn9dY+PoLW7+gwbfJIBFioyIrEEICfc=; b=JlEE/BX59KyncwnY94XAM60vje
	unIlMO+zXTAJkLBz0vnImQadZJjHb5NdGStlowjuGougqyh6qqL0VHl5RvjVax9DVtse/ORLEvynr
	R5PN2YrIVAKpxTIZKdraUebw9BxYN1Slp8Qcq2vUNN6vC+5khFz7nc0Ocj0lArL0tkQlVncpsysM2
	mJSel7qwL2NlW2WUSf3kCHGrRdppmZKZIylO+ezLE2MYMU/r7y6AJaU7DsgINDRdhIwjKem+T8QB0
	ccfpY7A25TrCamDdumrCdchRH6dYkKYE7HYVao8EsutN9TJrkzrGjjlvDhzlNrdCKmDlLHxcyKm5+
	uVoj4Pvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4Oh-0000000E2g3-1egQ;
	Mon, 15 Jun 2026 10:18:27 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4Of-0000000E2fR-0YdB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 10:18:26 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-68d23430690so5772239a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 03:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781518703; cv=none;
        d=google.com; s=arc-20240605;
        b=EXy490JjTaEd8rn6FufT2QXaJgmrDON9wLpSjbiKVdRNS5t8efqiRXypihyfY3H84l
         tkYnMy3JnmQud9gF3mIT+/1aAaG+oe1xj91lzlhf7oKeFu2AtEM7f/sja1Y1jtSGrsAX
         IgUX10GvoLf8iIYm0SVKPa2kAaSX7ihtu27Z9lzp/GRLMfKAmM5YJ3gUAFSik7Lf3uKv
         XlTGnWPWzx/uaWlfab9fjWhvaut94aEHXoxnWWhWgKlCtAMc51hU/6X770BnOadlF98o
         2KUR9ThcLZCiC4+chcu2JsJpKve6XI2eZO2PXg2XR3ShPf/6o9P/hF+o0rshka2QrNYK
         KxbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H154WjKnOWacRn9dY+PoLW7+gwbfJIBFioyIrEEICfc=;
        fh=IgKeFaNAWOzoHNtAedzGlYzNfgzrGrAzsmJlUDsu/q0=;
        b=Tlml29e9tY1J8TvnBCD84m5ZAVUsUak1REwX16q6l7wilyQq0j4IKfv9XYrOMLMpfz
         XA4U+6ocf8hITiFeFHE9AHzMTM4f67CHk57wZOWk/0g8jd0AZrxwljXajdRi0C6dm+lw
         x7oB9Q6YY5zxrOXBDHmc+xTlp1fPeeQC2s9gCG3sGocy/ZHS8BxWVf0awSoOg4hVb4tu
         6uZzKl4+fbIlsO7yTWa6DsGuH8BexRmLPairxxm3npkAeXutDNf9FgzJXo5miXuXMBOH
         QbYlK6F65nCRhooco/Lt6B1EZvpV65I0OANCQqleO9Lj8row/NSyBSKALYY7DQWE9uBG
         mmlA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781518703; x=1782123503; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H154WjKnOWacRn9dY+PoLW7+gwbfJIBFioyIrEEICfc=;
        b=MMH25yvcobJPN078wQPpA6mEF9sO5eEgp1Rp0vikIEtmMsFOBeIvC+4gvo/aEts59X
         n5TpehFBRV0ruozgrugksDN6WOpkj4KVJC3kz7Q/jCF6VfnbFfpOFOU3K/S4hu+d/Z7h
         SkGOTI5Q6LxaXUbjR7Rivo88OMcZg5dJjBGjpmXoBAZgJrnkxxareTgIVAF68Roj+gD+
         AigZFKl99ksc+XUevnfn8tM0tR6BLD6AzmqgBOiaFOhnI43HROrcwqOnJmvTCBkxljl3
         DbG7LgoVn2PlMbokwgPJWzf9LWRL5W/CPuY7rG4+/8JNUHXE9amkTjJ5UsvV5GagjewZ
         YDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781518703; x=1782123503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H154WjKnOWacRn9dY+PoLW7+gwbfJIBFioyIrEEICfc=;
        b=DP5SqeU7hprYYDR+pv4GFwbm2ho5lKRQ2KHWCah/FwZ324MG6XgeHhGVaoYPrY9boH
         IA7GXdnxZfLlwGzduN0y8VG6jPJ0LZvRwZOA0ILBToqx6PnAiq72wLvYK+8qF8v5FHfn
         kW4x6YjTiV7+Wxk+fhPXU1+eQKMN9+6WrUhcuRVha99W1pjXkkM7pzB4SmvW5rJdh5P+
         vAD7i7tK9LsA/CPP7D/7D9U/UKzPtOGJSWJ9sa0Q7lkgY0Ou12Iw8NtsTFTQDzyJQqDZ
         KMZvFhFX0gWaWwWGn+Nij/Xd+nCiDqA4ZH5UQ8rK5a1NKUkZyalqqKN2d5j+kYolvl2e
         +viw==
X-Forwarded-Encrypted: i=1; AFNElJ+pm3IkozuuBk2TW9thGyou6Rya8PoF+0Bx+RtysHyRsmCB4ar69sirNrFXNNciEHFC2w4Ihnyhi7f+yF8YOQfC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkly7CnFkE8VMqmPvClf5qIaKHjXmZQEY7odFVbI8IAT1aBSeX
	30su/OmM3ek1L2uYoFFESJDtek3ubMtfzirgrWzuVqq2p1RymITP47fQaG9m0LVwKUok/enyct9
	S6eCaWXXYYMwbQ+D6BiV/CroklrLJDyA=
X-Gm-Gg: Acq92OGIIRdcAp+8ucYbj3ykCUbotQYLpmgcX966D85l6SRF5x4SaiAvqLBZm6aoxOC
	D1Q4sLZcPzYEqoG97k4C5faFayElZEgQPN3jle/lHh/pD+PWOibLvD5EulIRtwT4+EpaLguoSos
	t359be72BMlZOKSt7XD1BPYn0nU9Q0TJkfv9CNc/pKxugdLEKckjEpJelHxJUiXUS1IqUY/ZrjL
	fkNvv4SQPZU6xSK/VBMqc4BfFZjHaYptbZiqJnU4mJc+tgzcGpOhJXeCUD2YfiZykP9sSrmDQow
	FwA/xNk=
X-Received: by 2002:a17:906:7312:b0:bec:929b:cee6 with SMTP id
 a640c23a62f3a-bff49d124aemr394065766b.20.1781518702267; Mon, 15 Jun 2026
 03:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1781490440.git.kas@kernel.org> <704b467d5b320da9cf49fc9bb4a6814063986f3b.1781490440.git.kas@kernel.org>
In-Reply-To: <704b467d5b320da9cf49fc9bb4a6814063986f3b.1781490440.git.kas@kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 15 Jun 2026 12:18:10 +0200
X-Gm-Features: AVVi8Cczau1OJ3xWVRH3rLpHJwqBhc67yl5eVw5PVUVifjULipKIqvnkXxShTPc
Message-ID: <CANk7y0iBTYuhzLTJAX0yf8Cp8cyThOVpAQYMTDN9LZUKGThqJQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drivers/firmware: add SDEI cross-CPU NMI service
 for arm64
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Doug Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, Usama Arif <usama.arif@linux.dev>, Breno Leitao <leitao@debian.org>, 
	Julien Thierry <julien.thierry.kdev@gmail.com>, Lecopzer Chen <lecopzer@gmail.com>, 
	Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_031825_352461_9CF79BAD 
X-CRM114-Status: GOOD (  44.17  )
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

On Mon, Jun 15, 2026 at 4:35=E2=80=AFAM Kiryl Shutsemau <kirill@shutemov.na=
me> wrote:
>
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> Deliver an NMI-like event to an interrupt-masked arm64 CPU via the
> standard SDEI software-signalled event (event 0), without the pseudo-NMI
> hot-path cost: register a handler for event 0 and poke a target with
> sdei_event_signal(0, mpidr).
>
> First user is arch_trigger_cpumask_backtrace() (sysrq-l, RCU stalls,
> hung-task/soft-lockup dumps), which otherwise rides an IPI that can't
> reach a masked CPU. Falls back to the IPI path when SDEI is absent; no
> watchdog backend yet, so the stock detector is untouched.
>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  MAINTAINERS                     |   2 +-
>  arch/arm64/include/asm/nmi.h    |  24 +++++
>  arch/arm64/kernel/smp.c         |  11 +++
>  drivers/firmware/Kconfig        |  19 ++++
>  drivers/firmware/Makefile       |   1 +
>  drivers/firmware/arm_sdei_nmi.c | 149 ++++++++++++++++++++++++++++++++
>  6 files changed, 205 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/include/asm/nmi.h
>  create mode 100644 drivers/firmware/arm_sdei_nmi.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c8d4b913f26c..b5ddfb85dce9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24797,7 +24797,7 @@ M:      James Morse <james.morse@arm.com>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/arm/firmware/sdei.txt
> -F:     drivers/firmware/arm_sdei.c
> +F:     drivers/firmware/arm_sdei*
>  F:     include/linux/arm_sdei.h
>  F:     include/uapi/linux/arm_sdei.h
>
> diff --git a/arch/arm64/include/asm/nmi.h b/arch/arm64/include/asm/nmi.h
> new file mode 100644
> index 000000000000..9366be419d18
> --- /dev/null
> +++ b/arch/arm64/include/asm/nmi.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_NMI_H
> +#define __ASM_NMI_H
> +
> +#include <linux/cpumask.h>
> +
> +/*
> + * Cross-CPU NMI provider hooks, consulted by the arm64 arch code before
> + * its regular-IRQ / pseudo-NMI IPI paths. The SDEI provider in
> + * drivers/firmware/arm_sdei_nmi.c implements them when active; a future
> + * FEAT_NMI provider could slot in here too. The stubs let callers stay
> + * unconditional when ARM_SDEI_NMI is off.
> + */
> +#ifdef CONFIG_ARM_SDEI_NMI
> +bool sdei_nmi_trigger_cpumask_backtrace(const cpumask_t *mask, int exclu=
de_cpu);
> +#else
> +static inline bool sdei_nmi_trigger_cpumask_backtrace(const cpumask_t *m=
ask,
> +                                                     int exclude_cpu)
> +{
> +       return false;
> +}
> +#endif
> +
> +#endif /* __ASM_NMI_H */
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 1aa324104afb..a670434a8cae 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -45,6 +45,7 @@
>  #include <asm/daifflags.h>
>  #include <asm/kvm_mmu.h>
>  #include <asm/mmu_context.h>
> +#include <asm/nmi.h>
>  #include <asm/numa.h>
>  #include <asm/processor.h>
>  #include <asm/smp_plat.h>
> @@ -927,6 +928,16 @@ static void arm64_backtrace_ipi(cpumask_t *mask)
>
>  void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_c=
pu)
>  {
> +       /*
> +        * Prefer the SDEI cross-CPU NMI provider when active: firmware
> +        * dispatches the event out of EL3 and reaches CPUs that have
> +        * interrupts locally masked, without the per-IRQ-mask cost that
> +        * pseudo-NMI pays for the same reach. The plain IPI path below
> +        * can't reach such a CPU unless pseudo-NMI is enabled.
> +        */
> +       if (sdei_nmi_trigger_cpumask_backtrace(mask, exclude_cpu))
> +               return;
> +
>         /*
>          * NOTE: though nmi_trigger_cpumask_backtrace() has "nmi_" in the=
 name,
>          * nothing about it truly needs to be implemented using an NMI, i=
t's
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index bbd2155d8483..6501087ff90d 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -36,6 +36,25 @@ config ARM_SDE_INTERFACE
>           standard for registering callbacks from the platform firmware
>           into the OS. This is typically used to implement RAS notificati=
ons.
>
> +config ARM_SDEI_NMI
> +       bool "SDEI-based cross-CPU NMI service (arm64)"
> +       depends on ARM64 && ARM_SDE_INTERFACE
> +       help
> +         Provides SDEI-based cross-CPU NMI delivery for hooks that need
> +         to reach interrupt-masked CPUs on silicon that lacks FEAT_NMI:
> +
> +           - arch_trigger_cpumask_backtrace()  (sysrq-l, RCU stalls,
> +             hardlockup_all_cpu_backtrace, soft-lockup secondary dumps,
> +             hung-task auxiliary dumps)
> +
> +         The driver registers a handler for the SDEI software-signalled
> +         event (event 0) and reaches a target CPU by signalling it with
> +         SDEI_EVENT_SIGNAL. Firmware delivers the event out of EL3
> +         regardless of the target's PSTATE.DAIF -- forced delivery into =
a
> +         CPU wedged with interrupts locally masked.
> +
> +         If unsure, say N.
> +
>  config EDD
>         tristate "BIOS Enhanced Disk Drive calls determine boot disk"
>         depends on X86
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 4ddec2820c96..be46f1e1dc77 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -4,6 +4,7 @@
>  #
>  obj-$(CONFIG_ARM_SCPI_PROTOCOL)        +=3D arm_scpi.o
>  obj-$(CONFIG_ARM_SDE_INTERFACE)        +=3D arm_sdei.o
> +obj-$(CONFIG_ARM_SDEI_NMI)     +=3D arm_sdei_nmi.o
>  obj-$(CONFIG_DMI)              +=3D dmi_scan.o
>  obj-$(CONFIG_DMI_SYSFS)                +=3D dmi-sysfs.o
>  obj-$(CONFIG_EDD)              +=3D edd.o
> diff --git a/drivers/firmware/arm_sdei_nmi.c b/drivers/firmware/arm_sdei_=
nmi.c
> new file mode 100644
> index 000000000000..a82776e7b55a
> --- /dev/null
> +++ b/drivers/firmware/arm_sdei_nmi.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * arm64 SDEI-based cross-CPU NMI service.
> + *
> + * Delivering an "NMI-shaped" event to an EL1 context that has locally
> + * masked interrupts, on silicon without FEAT_NMI, can be done two ways:
> + *
> + *   - pseudo-NMI: mask "interrupts" via the GIC priority register
> + *     (ICC_PMR_EL1) instead of PSTATE.DAIF, leaving a high-priority ban=
d
> + *     deliverable. Functionally this works -- but it reimplements every
> + *     local_irq_disable()/enable() and exception entry/exit as a PMR
> + *     write plus synchronisation, a cost paid on that hot path forever,
> + *     whether or not an NMI is ever delivered.
> + *
> + *   - SDEI: leave interrupt masking as the cheap PSTATE.DAIF operation
> + *     and have the firmware bounce an EL3-routed Group-0 SGI back to
> + *     NS-EL1 as an event callback. The cost is a firmware round-trip,
> + *     but only at the rare moment delivery is actually needed.
> + *
> + * This driver takes the second path: it keeps the IRQ-mask hot path
> + * free and pays only when it fires, which is what makes cross-CPU NMI
> + * affordable on hardware where the pseudo-NMI tax isn't, until FEAT_NMI
> + * makes NMI masking cheap in the architecture itself.
> + *
> + * Capabilities provided:
> + *
> + *   - sdei_nmi_trigger_cpumask_backtrace() =E2=80=94 override for arm64=
's
> + *     arch_trigger_cpumask_backtrace(), so sysrq-l, RCU stall dumps,
> + *     hardlockup_all_cpu_backtrace, soft-lockup/hung-task secondary
> + *     dumps all reach interrupt-masked CPUs.
> + *
> + * Delivery uses the standard SDEI software-signalled event (event 0) an=
d
> + * SDEI_EVENT_SIGNAL. We register a handler for event 0, enable it, and
> + * poke a target CPU with sdei_event_signal(0, mpidr): firmware makes
> + * event 0 pending on that PE and dispatches the handler NMI-like,
> + * regardless of the target's DAIF.
> + * Availability is simply whether event 0 registers and enables -- if SD=
EI
> + * and its software-signalled event are present we use it, otherwise the
> + * driver stays inert.
> + */
> +
> +#define pr_fmt(fmt) "sdei_nmi: " fmt
> +
> +#include <linux/arm_sdei.h>
> +#include <linux/cpumask.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/kprobes.h>
> +#include <linux/nmi.h>
> +#include <linux/printk.h>
> +#include <linux/ptrace.h>
> +#include <linux/smp.h>
> +#include <linux/types.h>
> +
> +#include <asm/nmi.h>
> +#include <asm/smp_plat.h>
> +
> +static bool sdei_nmi_available;
> +
> +#define SDEI_NMI_EVENT                 0
> +
> +static int sdei_nmi_handler(u32 event, struct pt_regs *regs, void *arg)
> +{
> +       /*
> +        * nmi_cpu_backtrace() no-ops unless this CPU's bit is set in the
> +        * global backtrace mask (driven by nmi_trigger_cpumask_backtrace=
()),
> +        * so a fire that reaches a CPU not being backtraced is harmless.
> +        */
> +       nmi_cpu_backtrace(regs);
> +       return SDEI_EV_HANDLED;
> +}
> +NOKPROBE_SYMBOL(sdei_nmi_handler);
> +
> +static void sdei_nmi_fire(unsigned int target_cpu)
> +{
> +       int err =3D sdei_event_signal(SDEI_NMI_EVENT, cpu_logical_map(tar=
get_cpu));
> +
> +       if (err)
> +               pr_warn("SDEI_EVENT_SIGNAL to CPU %u failed: %d\n",
> +                       target_cpu, err);
> +}
> +
> +/*
> + * Raise callback for nmi_trigger_cpumask_backtrace(): signal event 0
> + * at every CPU still pending in @mask. The framework excludes the local
> + * CPU from @mask before calling us.
> + */
> +static void sdei_nmi_raise_backtrace(cpumask_t *mask)
> +{
> +       unsigned int cpu;
> +
> +       for_each_cpu(cpu, mask)
> +               sdei_nmi_fire(cpu);
> +}
> +
> +/*
> + * Override hook for arch_trigger_cpumask_backtrace() (see
> + * arch/arm64/kernel/smp.c). Returns true when SDEI handled the request,
> + * which is the case whenever SDEI is active; on a false return the arch
> + * falls back to its regular-IRQ (or pseudo-NMI, if enabled) IPI.
> + *
> + * On a kernel built without paying the pseudo-NMI hot-path cost (the
> + * usual case for this driver's target), the IPI can't reach a CPU that
> + * has interrupts masked -- so the backtrace of the one CPU you care
> + * about comes back empty. SDEI is dispatched out of EL3 and lands
> + * regardless of the target's DAIF, without taxing the IRQ-mask path.
> + */
> +bool sdei_nmi_trigger_cpumask_backtrace(const cpumask_t *mask, int exclu=
de_cpu)
> +{
> +       if (!sdei_nmi_available)
> +               return false;
> +
> +       nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
> +                                     sdei_nmi_raise_backtrace);
> +       return true;
> +}
> +
> +/*
> + * device_initcall (after arch_initcall(sdei_init), so the SDEI subsyste=
m
> + * is up): probe the firmware, register the event, and turn on the
> + * cross-CPU service. If the probe fails the driver stays inert and the
> + * override hooks decline, leaving the arch's own paths in place.
> + */
> +static int __init sdei_nmi_init(void)
> +{
> +       int err;
> +
> +       err =3D sdei_event_register(SDEI_NMI_EVENT, sdei_nmi_handler, NUL=
L);
> +       if (err) {
> +               pr_err("sdei_event_register(%u) failed: %d\n",
> +                      SDEI_NMI_EVENT, err);
> +               return 0;
> +       }

This initcall runs unconditionally whenever ARM_SDEI_NMI is built in,
which includes the many arm64 systems that have no SDEI at all. On
those, sdei_event_register() -> sdei_event_create() ->
invoke_sdei_fn() returns -EIO, and the core already complains:
    pr_warn("Failed to create event %u: %d\n", event_num, err);

(that one isn't gated on err !=3D -EIO, unlike sdei_mask_local_cpu() & frie=
nds).
We then add a second pr_err() on top, so every boot on a non-SDEI box
with this config gets two alarming lines for what is just "no firmware
support". At minimum, don't shout for -EIO/-EOPNOTSUPP here. Better,
skip the probe when SDEI isn't present  there's no exported predicate
today, but -EIO is the de-facto one.

> +       err =3D sdei_event_enable(SDEI_NMI_EVENT);
> +       if (err) {
> +               pr_err("sdei_event_enable(%u) failed: %d\n",
> +                      SDEI_NMI_EVENT, err);
> +               sdei_event_unregister(SDEI_NMI_EVENT);
> +               return 0;
> +       }
> +
> +       sdei_nmi_available =3D true;
> +       pr_info("using SDEI cross-CPU NMI (SDEI_EVENT_SIGNAL, event %u)\n=
",
> +               SDEI_NMI_EVENT);
> +
> +       return 0;
> +}
> +device_initcall(sdei_nmi_init);
> --
> 2.54.0
>

