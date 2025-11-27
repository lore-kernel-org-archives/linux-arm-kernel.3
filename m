Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936B9CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OCgpDbPUdB6E76FQAFcSl2BlXtdK16tW3oWJzKooEM=; b=XmiCH57yjlqHuU60+tORhTL07q
	e4erTCIFqbSsUz2m1DS41TSZj5WdRL28IWNAR58BURAkVYGtAixtnTPneHWZaBle8GyPIH0iIk8P+
	ecxk1B1oh3Rs8xy93SeEVcx5jTR8JTveOzKxSvGu7ZublIeuDfKOyrMNVFirQDEVtvpc2IqykFvwu
	fY+JMxt87LWwCxjbDGJqyx5432qHRciRSsjqU7VmdJ5HqzBBKqjv+u20PV/vppw0ffDvkJliaMXCn
	bee4IN7FAF9roTR6p44DfK7dPc38DIMwTa7L47icH8spP8RV2EUFLbligVM39DZHxm+prPFT2fl53
	4h1DhcfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYwB-0000000GLcw-3E0o;
	Thu, 27 Nov 2025 10:09:19 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYw8-0000000GLc8-41Qy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:09:18 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6593155d8d6so346901eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 02:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764238152; x=1764842952; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OCgpDbPUdB6E76FQAFcSl2BlXtdK16tW3oWJzKooEM=;
        b=e8LBBdqZ3En7duXQdBu+bKHTlXiynPBOV3B1kIBvYIBS+f4uSwKs92xqb2KxpsnxuF
         FGq08OEnS6R+eZPnPQbSI8BTLO1JuRMtIsWVHiieigHNCg+QfXTN2HNxBSzTOGDp0wQu
         lRvFUxAy+eVt2n7bOZBgOtNZU7WujpAKH2yz0+aJdegewqPUg3XpJs4gFfx4CvCISbJY
         VUt1h+1e2KZdplFXkK9NIJmfr+JUP5vcerulJsHt6+NaA9/oTJiOLJn8WXJHmrNxBoct
         f7vAmlbtQPSbZOEoqxUDhYMxj728N62DJ6LuDXGDcF1s0jVm4klje76SJxgtL0Y9sKwP
         UJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238152; x=1764842952;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4OCgpDbPUdB6E76FQAFcSl2BlXtdK16tW3oWJzKooEM=;
        b=OL5jUGwzF/UbMA5YSv9QYkwYL3aNgT6QpztLd34ezvByfeNW8yeNxX/CkPoz2r7aR2
         S+iSfyPS4fo8iq97UzBOpCl5kTYU1ojnBUEsMciQeh3xjk35H5F8po3YNtRKKJ08qksr
         bfaNuShSv9DXExV/ITY2zF5Dra8GSkA7KDASI2DhRG1t70GTZaQw0PD9xHS/m43BCJac
         SwAZSHwipwk5m6wKcN5y0PNe6zggaus+ZYQ+QfyMB3fq37JPuE+DK6CkCGoXD7T3VTRX
         63IlrkiR9cegGIQZ4yfWHvf3/ji8f9B80MFx2bY1KWHrVFRoEvzvU/1SGq+IIiWjMxDJ
         H6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy2Z4nrk2bhzQcZa5eaF9MruOCFRq51CH5t4ywvhLG+bXG4cgUkUzDKhiXSotyWjaADEVChf8AsNpu7jeBKlQe@lists.infradead.org
X-Gm-Message-State: AOJu0YxNJAC8BxuPbvMx7yEmonw8Fp6jqWFd+6I1m7RuXr9E/Z0TD2gO
	HsgUJZmgXPYLy1VoOmtlLGMgE81v2LuM56hpIhhnqU012ago61ReTCSVkjTr4M0Mn7GtAtYRByN
	Wz/3G9+Q9/uAB3C8lVqnd/ptBz/xd63e37E8XMDcqRg==
X-Gm-Gg: ASbGncvLSuATvMb6CxdlxYKpQ24LEckmrZjyOyvvBmlDwLyqzWOSvbJquASB4pg7U0c
	iJZ4b/MHZUGeRFDFUcRwHilBI8MBVOMOoA18vGncP95D9t/FTjn8yuenpJAqDdE50W8PYylOzKD
	fG+PRlLAYo4egb0gd7U2y1x9FWomYxBaaGj2nfBD1cpEK9RwfHqHvTJ47KloMOM5v1fwpZ9uXEk
	3J37L4f96H5pzHC+Byax4XDOpYzH3kJwdT+DgZ03HnqGWJfygECqJ2EJeHYqTWYjaEU3wVwWuKF
	kg==
X-Google-Smtp-Source: AGHT+IGONwSzZ9LgdJ8zM0FNTrtiuhBEH34P9VeB3GuFWjKl3lmYrzQGYx3VeBpsWXFXXVS0pOwjQu37mNii5jdXqMg=
X-Received: by 2002:a05:6808:2386:b0:450:cc88:ecdf with SMTP id
 5614622812f47-45115b5d282mr8574199b6e.45.1764238151795; Thu, 27 Nov 2025
 02:09:11 -0800 (PST)
MIME-Version: 1.0
References: <20251118025015.42491-1-cuiyunhui@bytedance.com> <20251118025015.42491-2-cuiyunhui@bytedance.com>
In-Reply-To: <20251118025015.42491-2-cuiyunhui@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 27 Nov 2025 18:09:00 +0800
X-Gm-Features: AWmQ_bkjKxIacrqpNOQ3UrqKR-Al6mUUx9ZRSm8dR0DI6I2AZuuVwq_RhgAhyJA
Message-ID: <CAEEQ3w=Wy9J1q-n+iPu2ZeTLnoY63y+7iCFyAPe_r7v4hC9y8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] drivers: firmware: riscv: add SSE NMI support
To: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, cuiyunhui@bytedance.com, 
	luxu.kernel@bytedance.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, jassisinghbrar@gmail.com, 
	conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com, 
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	timothy.hayes@arm.com, lpieralisi@kernel.org, arnd@arndb.de, kees@kernel.org, 
	tglx@linutronix.de, viresh.kumar@linaro.org, boqun.feng@gmail.com, 
	linux-arm-kernel@lists.infradead.org, cleger@rivosinc.com, 
	atishp@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_020917_190030_E1BED5CE 
X-CRM114-Status: GOOD (  25.56  )
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

Hi All,

On Tue, Nov 18, 2025 at 10:50=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance.co=
m> wrote:
>
> Add support for handling Non-Maskable Interrupts (NMIs) through the
> RISC-V Supervisor Software Events (SSE) framework. Add basic NMI
> functionality via SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED registration
> and enabling.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  MAINTAINERS                            |  8 +++
>  drivers/firmware/riscv/Kconfig         | 10 +++
>  drivers/firmware/riscv/Makefile        |  1 +
>  drivers/firmware/riscv/riscv_sse_nmi.c | 89 ++++++++++++++++++++++++++
>  include/linux/riscv_sse_nmi.h          | 26 ++++++++
>  5 files changed, 134 insertions(+)
>  create mode 100644 drivers/firmware/riscv/riscv_sse_nmi.c
>  create mode 100644 include/linux/riscv_sse_nmi.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8bf5416953f45..c06658da8af96 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22057,6 +22057,14 @@ S:     Maintained
>  F:     drivers/firmware/riscv/riscv_sse.c
>  F:     include/linux/riscv_sse.h
>
> +RISC-V SSE NMI SUPPORT
> +M:     Yunhui Cui <cuiyunhui@bytedance.com>
> +R:     Xu Lu <luxu.kernel@bytedance.com>
> +L:     linux-riscv@lists.infradead.org
> +S:     Maintained
> +F:     drivers/firmware/riscv/riscv_sse_nmi.c
> +F:     include/linux/riscv_sse_nmi.h
> +
>  RISC-V THEAD SoC SUPPORT
>  M:     Drew Fustini <fustini@kernel.org>
>  M:     Guo Ren <guoren@kernel.org>
> diff --git a/drivers/firmware/riscv/Kconfig b/drivers/firmware/riscv/Kcon=
fig
> index ed5b663ac5f91..6c77c7823571a 100644
> --- a/drivers/firmware/riscv/Kconfig
> +++ b/drivers/firmware/riscv/Kconfig
> @@ -12,4 +12,14 @@ config RISCV_SBI_SSE
>           this option provides support to register callbacks on specific =
SSE
>           events.
>
> +config RISCV_SSE_NMI
> +       bool "Enable SBI Supervisor Software Events NMI support"
> +       depends on RISCV_SBI_SSE && SMP
> +       default y
> +       help
> +         This option enables support for delivering Non-Maskable Interru=
pt
> +         (NMI) notifications through the Supervisor Software Events (SSE=
)
> +         framework. When enabled, the system can deliver local, unknown =
and
> +         other types of NMIs.
> +
>  endmenu
> diff --git a/drivers/firmware/riscv/Makefile b/drivers/firmware/riscv/Mak=
efile
> index c8795d4bbb2ea..fbc182b53ae53 100644
> --- a/drivers/firmware/riscv/Makefile
> +++ b/drivers/firmware/riscv/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>
>  obj-$(CONFIG_RISCV_SBI_SSE)            +=3D riscv_sbi_sse.o
> +obj-$(CONFIG_RISCV_SSE_NMI)            +=3D riscv_sse_nmi.o
> diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/ri=
scv/riscv_sse_nmi.c
> new file mode 100644
> index 0000000000000..1763f43961ab6
> --- /dev/null
> +++ b/drivers/firmware/riscv/riscv_sse_nmi.c
> @@ -0,0 +1,89 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#define pr_fmt(fmt) "SSE NMI: " fmt
> +
> +#include <linux/atomic.h>
> +#include <linux/riscv_sbi_sse.h>
> +#include <linux/riscv_sse_nmi.h>
> +
> +#include <asm/irq_regs.h>
> +#include <asm/sbi.h>
> +#include <asm/smp.h>
> +
> +bool nmi_available;
> +static struct sse_event *local_nmi_evt;
> +static atomic_t local_nmi_arg =3D ATOMIC_INIT(LOCAL_NMI_NONE);
> +
> +bool nmi_support(void)
> +{
> +       return READ_ONCE(nmi_available);
> +}
> +
> +static inline struct sbiret sbi_sse_ecall(int fid, unsigned long arg0,
> +                                         unsigned long arg1)
> +{
> +       return sbi_ecall(SBI_EXT_SSE, fid, arg0, arg1, 0, 0, 0, 0);
> +}
> +
> +void send_nmi_single(unsigned int cpu, enum local_nmi_type type)
> +{
> +       unsigned int hart_id =3D cpuid_to_hartid_map(cpu);
> +       u32 evt =3D SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED;
> +       struct sbiret ret;
> +
> +       atomic_or(type, &local_nmi_arg);
> +       ret =3D sbi_sse_ecall(SBI_SSE_EVENT_INJECT, evt, hart_id);
> +       if (ret.error)
> +               pr_err("Failed to signal event %x to hartid %d, error %ld=
\n",
> +                      evt, hart_id, ret.error);
> +}
> +
> +void send_nmi_mask(cpumask_t *mask, enum local_nmi_type type)
> +{
> +       unsigned int cpu;
> +
> +       for_each_cpu(cpu, mask)
> +               send_nmi_single(cpu, type);
> +}
> +
> +static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
> +{
> +       return 0;
> +}
> +
> +static int __init local_nmi_init(void)
> +{
> +       int ret;
> +
> +       local_nmi_evt =3D sse_event_register(SBI_SSE_EVENT_LOCAL_SOFTWARE=
_INJECTED, 0,
> +                                          local_nmi_handler, &local_nmi_=
arg);

local_nmi_arg is used to represent the local NMI types (Crash, Stop,
Backtrace, Kgdb) for multiple CPUs, which may lead to certain issues:
for example, if CPU A sends a Backtrace to CPU C and CPU B sends a
Stop to CPU D, both CPU C and CPU D may end up responding to both
Backtrace and Stop. It is preferable to use the per-CPU variable
local_nmi_type instead of local_nmi_arg.

> +       if (IS_ERR(local_nmi_evt))
> +               return PTR_ERR(local_nmi_evt);
> +
> +       ret =3D sse_event_enable(local_nmi_evt);
> +       if (ret) {
> +               sse_event_unregister(local_nmi_evt);
> +               return ret;
> +       }
> +
> +       pr_info("Using SSE for Local NMI event delivery\n");
> +
> +       return 0;
> +}
> +
> +static int __init sse_nmi_init(void)
> +{
> +       int ret;
> +
> +       ret =3D local_nmi_init();
> +       if (ret) {
> +               pr_err("Local_nmi_init failed with error %d\n", ret);
> +               return ret;
> +       }
> +
> +       WRITE_ONCE(nmi_available, true);
> +
> +       return 0;
> +}
> +
> +late_initcall(sse_nmi_init);
> diff --git a/include/linux/riscv_sse_nmi.h b/include/linux/riscv_sse_nmi.=
h
> new file mode 100644
> index 0000000000000..16db85c5162f5
> --- /dev/null
> +++ b/include/linux/riscv_sse_nmi.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#ifndef __LINUX_RISCV_SSE_NMI_H
> +#define __LINUX_RISCV_SSE_NMI_H
> +
> +#include <linux/cpumask.h>
> +
> +enum local_nmi_type {
> +       LOCAL_NMI_NONE          =3D 0U,
> +       LOCAL_NMI_STOP          =3D BIT(0),
> +       LOCAL_NMI_CRASH         =3D BIT(1),
> +       LOCAL_NMI_BACKTRACE     =3D BIT(2),
> +       LOCAL_NMI_KGDB          =3D BIT(3),
> +};
> +
> +#ifdef CONFIG_RISCV_SSE_NMI
> +bool nmi_support(void);
> +void send_nmi_mask(cpumask_t *mask, enum local_nmi_type type);
> +void send_nmi_single(unsigned int cpu, enum local_nmi_type type);
> +#else
> +static inline bool nmi_support(void) { return false; }
> +static inline void send_nmi_mask(cpumask_t *mask) { };
> +static inline void send_nmi_single(unsigned int cpu) { };
> +#endif
> +
> +#endif
> --
> 2.39.5
>

Thanks,
Yunhui

