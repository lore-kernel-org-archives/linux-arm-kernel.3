Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6C3CA0EE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eq+PeL+FlVcieHm1rzdcWyBGWBYtcpgJFUKpFq7IWOM=; b=BbqP6l8yclaz6c/3ucG7dPHaNB
	iouE93/6omEgLFVFxp7uW9IM9/kgaofYTSehrCnEi3a0cNtuAX7ger0s5dxQWgA2KYmP6EOGuyZWw
	hkEw31EbzmUkExhSIaGKKL6g+YnM6r+KtWQmCjTa/5wNIL8UFAER3i08jZRAL60lvazWscbsqDnUR
	BAmtmK3Rimvi8VyKQzf1tACrBhRduuoVuXr3AMnXe0OSVIHFDkTizUAkwGravT/oeYec0GfA/vBK5
	cYvPwQT/GktmQC/5r6CZZ3c9OrFmTVArqJHgN3pRxp3s8AP4yjfSCo6RVQoEFj5cITn2CtIeR9x66
	vYkUUaeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluac-0000000BmqK-3Gg9;
	Tue, 12 Aug 2025 19:23:19 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloWx-0000000AqZh-1b2V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:55:08 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-71b5279714cso46044517b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1755003306; x=1755608106; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eq+PeL+FlVcieHm1rzdcWyBGWBYtcpgJFUKpFq7IWOM=;
        b=RcHzFbzR9+fBBmAp0KbCgakBn6PQe6QmWOMNqQ43de7Mf1oaLvK/fEarhWz1nYT30/
         W8DucH4p+PggGSPfLHLtZqfJTt4r/lp2fQC5w9fcyQ9Gyv2+KZrUyEzwzkrfs3NsxA4x
         cDCIced5s79r3/Fiegc35A967vDx2viKB2OFYbur/u+A7p90gH8eQl8fr21GFhdZlu8k
         SkFXTqT2RO8UXK/CmSqrGJ3YKIfTZ64IqUG/RaSuZJ5gbxcvI6Ke6lKS8HqtV8uG9Cfo
         H++J6aTGzjXEkhJDu8MX/0mY3EgZ/kdMXnLwZ18o//OWsfJEkI5bBorOnK4se1HzujXS
         QhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755003306; x=1755608106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq+PeL+FlVcieHm1rzdcWyBGWBYtcpgJFUKpFq7IWOM=;
        b=jE6UUv8WLMWJqcIzUiJjWDy9CU8j8vM2fBqHEGusV4x7TR2kNAdi2PtTkiLBgMUVrI
         BqWyYqJdXVJzbMewsO2rx9iwGNjQ0xD3CRQtI27JVWFrzZboHWaXIso0xNAme4bDUWxd
         75Drdkzyv71o4P9U4MY//72bSdKeXLWQ2AuYLvsEIme7Nr7jVfux5IokUYiHJ+xMbkck
         t9Pi/uPNoVcBVbkjPYasXdZFj9SEDzNo9rfBOaWMTuSutP34pBndcPLXvtqaX3tIVkUa
         /+UQLR2WSlUCay4w0eTcEBHzTDFLlD6cGDmUnEoe/PvEcHuy7u2OgkH43gQuX/zg7m+s
         03Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWFP42GCAtM6EIdJF9rHUVjyNngWjneO4zBqw5ecpUfpmaKPrbFevNQcjQ3qjvALlRR4HL2JygOLhfGL4jHpD7+@lists.infradead.org
X-Gm-Message-State: AOJu0YyTHd36Aj2TsPnC3r5BjzSeWrpB/m3UfA6kzj0/DkLUbmFD5qfS
	Ut11VFqDphu4m7vD1nTtJzyB8u7JCce3a6swhNRX/zkcOQy6p8iiicvg6nazO4lYaCm8DVV4ePa
	+AjMfPb39zhHRRfSjh+WB5djs6NFWGFvNyQM6N/My5w==
X-Gm-Gg: ASbGncvJ3+Thf+jJSQxYCQ2SwTAHGSIYcXdjA8qxPvLdA/lgqbdFLKR6h3oOb9KrwFl
	ISPd9SFDgxlhCkwB/86mmt+iH86+kq1hA8UA9Pz6uHOVaOc3VZu/slyMEGhBaSVWBN67vOxz9U3
	IuzvLK98UibJI8dTEBqMr77DoY0RmPb6cQ8kt83+S+Pdjy2b6Kf4LbEpo2ktgMoJPg3gYSXGxZL
	cmS51bqhdPhYDS2BEfh
X-Google-Smtp-Source: AGHT+IGYrkRp+od7bjdjPLaaoNM4RQdsNW3m//dFiPQsrDkMvNopXPpOB2rt2e+farAJCj3Iy+tVl9YKlVopdI0B3CY=
X-Received: by 2002:a05:690c:7449:b0:702:52af:7168 with SMTP id
 00721157ae682-71c42985262mr48125677b3.2.1755003306127; Tue, 12 Aug 2025
 05:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250808153901.2477005-1-cleger@rivosinc.com> <20250808153901.2477005-4-cleger@rivosinc.com>
In-Reply-To: <20250808153901.2477005-4-cleger@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 12 Aug 2025 20:54:51 +0800
X-Gm-Features: Ac12FXx45LSEgWymKEzjVuJKiq66XgPr2MhMI9zfMlH1zpQJGkfK6tbC6Bvpxds
Message-ID: <CAEEQ3wmUvQRx3HLG=i7fk60-wf1AtYmjV20Xbe2c5_RHi1c1gw@mail.gmail.com>
Subject: Re: [External] [PATCH v6 3/5] drivers: firmware: add riscv SSE support
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Xu Lu <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_055507_436592_FD43B872 
X-CRM114-Status: GOOD (  28.33  )
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

Hi Cl=C3=A9ment,

On Fri, Aug 8, 2025 at 11:39=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Add driver level interface to use RISC-V SSE arch support. This interface
> allows registering SSE handlers, and receive them. This will be used by
> PMU and GHES driver.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> Co-developed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS                        |  15 +
>  drivers/firmware/Kconfig           |   1 +
>  drivers/firmware/Makefile          |   1 +
>  drivers/firmware/riscv/Kconfig     |  15 +
>  drivers/firmware/riscv/Makefile    |   3 +
>  drivers/firmware/riscv/riscv_sse.c | 694 +++++++++++++++++++++++++++++
>  include/linux/riscv_sse.h          |  56 +++
>  7 files changed, 785 insertions(+)
>  create mode 100644 drivers/firmware/riscv/Kconfig
>  create mode 100644 drivers/firmware/riscv/Makefile
>  create mode 100644 drivers/firmware/riscv/riscv_sse.c
>  create mode 100644 include/linux/riscv_sse.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd62ad58a47f..114396d47f76 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21640,6 +21640,13 @@ T:     git git://git.kernel.org/pub/scm/linux/ke=
rnel/git/iommu/linux.git
>  F:     Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>  F:     drivers/iommu/riscv/
>
> +RISC-V FIRMWARE DRIVERS
> +M:     Conor Dooley <conor@kernel.org>
> +L:     linux-riscv@lists.infradead.org
> +S:     Maintained
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
> +F:     drivers/firmware/riscv/*
> +
>  RISC-V MICROCHIP FPGA SUPPORT
>  M:     Conor Dooley <conor.dooley@microchip.com>
>  M:     Daire McNamara <daire.mcnamara@microchip.com>
> @@ -21704,6 +21711,14 @@ F:     arch/riscv/boot/dts/spacemit/
>  N:     spacemit
>  K:     spacemit
>
> +RISC-V SSE DRIVER
> +M:     Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> +R:     Himanshu Chauhan <himanshu@thechauhan.dev>
> +L:     linux-riscv@lists.infradead.org
> +S:     Maintained
> +F:     drivers/firmware/riscv/riscv_sse.c
> +F:     include/linux/riscv_sse.h
> +
>  RISC-V THEAD SoC SUPPORT
>  M:     Drew Fustini <fustini@kernel.org>
>  M:     Guo Ren <guoren@kernel.org>
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index bbd2155d8483..1894df87b08e 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -294,6 +294,7 @@ source "drivers/firmware/meson/Kconfig"
>  source "drivers/firmware/microchip/Kconfig"
>  source "drivers/firmware/psci/Kconfig"
>  source "drivers/firmware/qcom/Kconfig"
> +source "drivers/firmware/riscv/Kconfig"
>  source "drivers/firmware/samsung/Kconfig"
>  source "drivers/firmware/smccc/Kconfig"
>  source "drivers/firmware/tegra/Kconfig"
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 4ddec2820c96..6cdd84570ea7 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -34,6 +34,7 @@ obj-y                         +=3D efi/
>  obj-y                          +=3D imx/
>  obj-y                          +=3D psci/
>  obj-y                          +=3D qcom/
> +obj-y                          +=3D riscv/
>  obj-y                          +=3D samsung/
>  obj-y                          +=3D smccc/
>  obj-y                          +=3D tegra/
> diff --git a/drivers/firmware/riscv/Kconfig b/drivers/firmware/riscv/Kcon=
fig
> new file mode 100644
> index 000000000000..8056ed3262d9
> --- /dev/null
> +++ b/drivers/firmware/riscv/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "Risc-V Specific firmware drivers"
> +depends on RISCV
> +
> +config RISCV_SSE
> +       bool "Enable SBI Supervisor Software Events support"
> +       depends on RISCV_SBI
> +       default y
> +       help
> +         The Supervisor Software Events support allow the SBI to deliver
> +         NMI-like notifications to the supervisor mode software. When en=
able,
> +         this option provides support to register callbacks on specific =
SSE
> +         events.
> +
> +endmenu
> diff --git a/drivers/firmware/riscv/Makefile b/drivers/firmware/riscv/Mak=
efile
> new file mode 100644
> index 000000000000..4ccfcbbc28ea
> --- /dev/null
> +++ b/drivers/firmware/riscv/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_RISCV_SSE)                +=3D riscv_sse.o
> diff --git a/drivers/firmware/riscv/riscv_sse.c b/drivers/firmware/riscv/=
riscv_sse.c
> new file mode 100644
> index 000000000000..edd107ade94a
> --- /dev/null
> +++ b/drivers/firmware/riscv/riscv_sse.c
> @@ -0,0 +1,694 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +
> +#define pr_fmt(fmt) "sse: " fmt
> +
> +#include <linux/cpu.h>
> +#include <linux/cpuhotplug.h>
> +#include <linux/cpu_pm.h>
> +#include <linux/hardirq.h>
> +#include <linux/list.h>
> +#include <linux/percpu-defs.h>
> +#include <linux/reboot.h>
> +#include <linux/riscv_sse.h>
> +#include <linux/slab.h>
> +
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
> +
> +struct sse_event {
> +       struct list_head list;
> +       u32 evt_id;
> +       u32 priority;
> +       sse_event_handler *handler;
> +       void *handler_arg;
> +       /* Only valid for global events */
> +       unsigned int cpu;
> +
> +       union {
> +               struct sse_registered_event *global;
> +               struct sse_registered_event __percpu *local;
> +       };
> +};
> +
> +static int sse_hp_state;
> +static bool sse_available __ro_after_init;
> +static DEFINE_SPINLOCK(events_list_lock);
> +static LIST_HEAD(events);
> +static DEFINE_MUTEX(sse_mutex);
> +
> +struct sse_registered_event {
> +       struct sse_event_arch_data arch;
> +       struct sse_event *event;
> +       unsigned long attr;
> +       bool is_enabled;
> +};
> +
> +void sse_handle_event(struct sse_event_arch_data *arch_event,
> +                     struct pt_regs *regs)
> +{
> +       int ret;
> +       struct sse_registered_event *reg_evt =3D
> +               container_of(arch_event, struct sse_registered_event, arc=
h);
> +       struct sse_event *evt =3D reg_evt->event;
> +
> +       ret =3D evt->handler(evt->evt_id, evt->handler_arg, regs);
> +       if (ret)
> +               pr_warn("event %x handler failed with error %d\n", evt->e=
vt_id, ret);
> +}
> +
> +static struct sse_event *sse_event_get(u32 evt)
> +{
> +       struct sse_event *event =3D NULL;
> +
> +       scoped_guard(spinlock, &events_list_lock) {
> +               list_for_each_entry(event, &events, list) {
> +                       if (event->evt_id =3D=3D evt)
> +                               return event;
> +               }
> +       }
> +
> +       return NULL;
> +}
> +
> +static phys_addr_t sse_event_get_attr_phys(struct sse_registered_event *=
reg_evt)
> +{
> +       phys_addr_t phys;
> +       void *addr =3D &reg_evt->attr;
> +
> +       if (sse_event_is_global(reg_evt->event->evt_id))
> +               phys =3D virt_to_phys(addr);
> +       else
> +               phys =3D per_cpu_ptr_to_phys(addr);
> +
> +       return phys;
> +}
> +
> +static struct sse_registered_event *sse_get_reg_evt(struct sse_event *ev=
ent)
> +{
> +       if (sse_event_is_global(event->evt_id))
> +               return event->global;
> +       else
> +               return per_cpu_ptr(event->local, smp_processor_id());
> +}
> +
> +static int sse_sbi_event_func(struct sse_event *event, unsigned long fun=
c)
> +{
> +       struct sbiret ret;
> +       u32 evt =3D event->evt_id;
> +       struct sse_registered_event *reg_evt =3D sse_get_reg_evt(event);
> +
> +       ret =3D sbi_ecall(SBI_EXT_SSE, func, evt, 0, 0, 0, 0, 0);
> +       if (ret.error) {
> +               pr_warn("Failed to execute func %lx, event %x, error %ld\=
n",
> +                       func, evt, ret.error);
> +               return sbi_err_map_linux_errno(ret.error);
> +       }
> +
> +       if (func =3D=3D SBI_SSE_EVENT_DISABLE)
> +               reg_evt->is_enabled =3D false;
> +       else if (func =3D=3D SBI_SSE_EVENT_ENABLE)
> +               reg_evt->is_enabled =3D true;
> +
> +       return 0;
> +}
> +
> +int sse_event_disable_local(struct sse_event *event)
> +{
> +       return sse_sbi_event_func(event, SBI_SSE_EVENT_DISABLE);
> +}
> +EXPORT_SYMBOL_GPL(sse_event_disable_local);
> +
> +int sse_event_enable_local(struct sse_event *event)
> +{
> +       return sse_sbi_event_func(event, SBI_SSE_EVENT_ENABLE);
> +}
> +EXPORT_SYMBOL_GPL(sse_event_enable_local);
> +
> +static int sse_event_attr_get_no_lock(struct sse_registered_event *reg_e=
vt,
> +                                     unsigned long attr_id, unsigned lon=
g *val)
> +{
> +       struct sbiret sret;
> +       u32 evt =3D reg_evt->event->evt_id;
> +       unsigned long phys;
> +
> +       phys =3D sse_event_get_attr_phys(reg_evt);
> +
> +       sret =3D sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, evt, att=
r_id, 1,
> +                        phys, 0, 0);
> +       if (sret.error) {
> +               pr_debug("Failed to get event %x attr %lx, error %ld\n", =
evt,
> +                        attr_id, sret.error);
> +               return sbi_err_map_linux_errno(sret.error);
> +       }
> +
> +       *val =3D reg_evt->attr;
> +
> +       return 0;
> +}
> +
> +static int sse_event_attr_set_nolock(struct sse_registered_event *reg_ev=
t,
> +                                    unsigned long attr_id, unsigned long=
 val)
> +{
> +       struct sbiret sret;
> +       u32 evt =3D reg_evt->event->evt_id;
> +       unsigned long phys;
> +
> +       reg_evt->attr =3D val;
> +       phys =3D sse_event_get_attr_phys(reg_evt);
> +
> +       sret =3D sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_WRITE, evt, at=
tr_id, 1,
> +                        phys, 0, 0);
> +       if (sret.error)
> +               pr_debug("Failed to set event %x attr %lx, error %ld\n", =
evt,
> +                        attr_id, sret.error);
> +
> +       return sbi_err_map_linux_errno(sret.error);
> +}
> +
> +static void sse_global_event_update_cpu(struct sse_event *event,
> +                                       unsigned int cpu)
> +{
> +       struct sse_registered_event *reg_evt =3D event->global;
> +
> +       event->cpu =3D cpu;
> +       arch_sse_event_update_cpu(&reg_evt->arch, cpu);
> +}
> +
> +static int sse_event_set_target_cpu_nolock(struct sse_event *event,
> +                                          unsigned int cpu)
> +{
> +       unsigned int hart_id =3D cpuid_to_hartid_map(cpu);
> +       struct sse_registered_event *reg_evt =3D event->global;
> +       u32 evt =3D event->evt_id;
> +       bool was_enabled;
> +       int ret;
> +
> +       if (!sse_event_is_global(evt))
> +               return -EINVAL;
> +
> +       was_enabled =3D reg_evt->is_enabled;
> +       if (was_enabled)
> +               sse_event_disable_local(event);
> +
> +       ret =3D sse_event_attr_set_nolock(reg_evt, SBI_SSE_ATTR_PREFERRED=
_HART,
> +                                       hart_id);
> +       if (ret =3D=3D 0)
> +               sse_global_event_update_cpu(event, cpu);
> +
> +       if (was_enabled)
> +               sse_event_enable_local(event);
> +
> +       return 0;
> +}
> +
> +int sse_event_set_target_cpu(struct sse_event *event, unsigned int cpu)
> +{
> +       int ret;
> +
> +       scoped_guard(mutex, &sse_mutex) {
> +               scoped_guard(cpus_read_lock) {
> +                       if (!cpu_online(cpu))
> +                               return -EINVAL;
> +
> +                       ret =3D sse_event_set_target_cpu_nolock(event, cp=
u);
> +               }
> +       }
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(sse_event_set_target_cpu);
> +
> +static int sse_event_init_registered(unsigned int cpu,
> +                                    struct sse_registered_event *reg_evt=
,
> +                                    struct sse_event *event)
> +{
> +       reg_evt->event =3D event;
> +
> +       return arch_sse_init_event(&reg_evt->arch, event->evt_id, cpu);
> +}
> +
> +static void sse_event_free_registered(struct sse_registered_event *reg_e=
vt)
> +{
> +       arch_sse_free_event(&reg_evt->arch);
> +}
> +
> +static int sse_event_alloc_global(struct sse_event *event)
> +{
> +       int err;
> +       struct sse_registered_event *reg_evt;
> +
> +       reg_evt =3D kzalloc(sizeof(*reg_evt), GFP_KERNEL);
> +       if (!reg_evt)
> +               return -ENOMEM;
> +
> +       event->global =3D reg_evt;
> +       err =3D sse_event_init_registered(smp_processor_id(), reg_evt, ev=
ent);
> +       if (err)
> +               kfree(reg_evt);
> +
> +       return err;
> +}
> +
> +static int sse_event_alloc_local(struct sse_event *event)
> +{
> +       int err;
> +       unsigned int cpu, err_cpu;
> +       struct sse_registered_event *reg_evt;
> +       struct sse_registered_event __percpu *reg_evts;
> +
> +       reg_evts =3D alloc_percpu(struct sse_registered_event);
> +       if (!reg_evts)
> +               return -ENOMEM;
> +
> +       event->local =3D reg_evts;
> +
> +       for_each_possible_cpu(cpu) {
> +               reg_evt =3D per_cpu_ptr(reg_evts, cpu);
> +               err =3D sse_event_init_registered(cpu, reg_evt, event);
> +               if (err) {
> +                       err_cpu =3D cpu;
> +                       goto err_free_per_cpu;
> +               }
> +       }
> +
> +       return 0;
> +
> +err_free_per_cpu:
> +       for_each_possible_cpu(cpu) {
> +               if (cpu =3D=3D err_cpu)
> +                       break;
> +               reg_evt =3D per_cpu_ptr(reg_evts, cpu);
> +               sse_event_free_registered(reg_evt);
> +       }
> +
> +       free_percpu(reg_evts);
> +
> +       return err;
> +}
> +
> +static struct sse_event *sse_event_alloc(u32 evt, u32 priority,
> +                                        sse_event_handler *handler, void=
 *arg)
> +{
> +       int err;
> +       struct sse_event *event;
> +
> +       event =3D kzalloc(sizeof(*event), GFP_KERNEL);
> +       if (!event)
> +               return ERR_PTR(-ENOMEM);
> +
> +       event->evt_id =3D evt;
> +       event->priority =3D priority;
> +       event->handler_arg =3D arg;
> +       event->handler =3D handler;
> +
> +       if (sse_event_is_global(evt))
> +               err =3D sse_event_alloc_global(event);
> +       else
> +               err =3D sse_event_alloc_local(event);
> +
> +       if (err) {
> +               kfree(event);
> +               return ERR_PTR(err);
> +       }
> +
> +       return event;
> +}
> +
> +static int sse_sbi_register_event(struct sse_event *event,
> +                                 struct sse_registered_event *reg_evt)
> +{
> +       int ret;
> +
> +       ret =3D sse_event_attr_set_nolock(reg_evt, SBI_SSE_ATTR_PRIO,
> +                                       event->priority);
> +       if (ret)
> +               return ret;
> +
> +       return arch_sse_register_event(&reg_evt->arch);
> +}
> +
> +static int sse_event_register_local(struct sse_event *event)
> +{
> +       int ret;
> +       struct sse_registered_event *reg_evt;
> +
> +       reg_evt =3D per_cpu_ptr(event->local, smp_processor_id());
> +       ret =3D sse_sbi_register_event(event, reg_evt);
> +       if (ret)
> +               pr_debug("Failed to register event %x: err %d\n", event->=
evt_id,
> +                        ret);
> +
> +       return ret;
> +}
> +
> +static int sse_sbi_unregister_event(struct sse_event *event)
> +{
> +       return sse_sbi_event_func(event, SBI_SSE_EVENT_UNREGISTER);
> +}
> +
> +struct sse_per_cpu_evt {
> +       struct sse_event *event;
> +       unsigned long func;
> +       cpumask_t error;
> +};
> +
> +static void sse_event_per_cpu_func(void *info)
> +{
> +       int ret;
> +       struct sse_per_cpu_evt *cpu_evt =3D info;
> +
> +       if (cpu_evt->func =3D=3D SBI_SSE_EVENT_REGISTER)
> +               ret =3D sse_event_register_local(cpu_evt->event);
> +       else
> +               ret =3D sse_sbi_event_func(cpu_evt->event, cpu_evt->func)=
;
> +
> +       if (ret)
> +               cpumask_set_cpu(smp_processor_id(), &cpu_evt->error);
> +}
> +
> +static void sse_event_free(struct sse_event *event)
> +{
> +       unsigned int cpu;
> +       struct sse_registered_event *reg_evt;
> +
> +       if (sse_event_is_global(event->evt_id)) {
> +               sse_event_free_registered(event->global);
> +               kfree(event->global);
> +       } else {
> +               for_each_possible_cpu(cpu) {
> +                       reg_evt =3D per_cpu_ptr(event->local, cpu);
> +                       sse_event_free_registered(reg_evt);
> +               }
> +               free_percpu(event->local);
> +       }
> +
> +       kfree(event);
> +}
> +
> +static void sse_on_each_cpu(struct sse_event *event, unsigned long func,
> +                           unsigned long revert_func)
> +{
> +       struct sse_per_cpu_evt cpu_evt;
> +
> +       cpu_evt.event =3D event;
> +       cpumask_clear(&cpu_evt.error);
> +       cpu_evt.func =3D func;
> +       on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
> +       /*
> +        * If there are some error reported by CPUs, revert event state o=
n the
> +        * other ones
> +        */
> +       if (!cpumask_empty(&cpu_evt.error)) {
> +               cpumask_t revert;
> +
> +               cpumask_andnot(&revert, cpu_online_mask, &cpu_evt.error);
> +               cpu_evt.func =3D revert_func;
> +               on_each_cpu_mask(&revert, sse_event_per_cpu_func, &cpu_ev=
t, 1);
> +       }
> +}
> +
> +int sse_event_enable(struct sse_event *event)
> +{
> +       int ret =3D 0;
> +
> +       scoped_guard(mutex, &sse_mutex) {
> +               scoped_guard(cpus_read_lock) {
> +                       if (sse_event_is_global(event->evt_id)) {
> +                               ret =3D sse_event_enable_local(event);
> +                       } else {
> +                               sse_on_each_cpu(event, SBI_SSE_EVENT_ENAB=
LE,
> +                                               SBI_SSE_EVENT_DISABLE);
> +                       }
> +               }
> +       }
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(sse_event_enable);
> +
> +static int sse_events_mask(void)
> +{
> +       struct sbiret ret;
> +
> +       ret =3D sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_HART_MASK, 0, 0, 0, =
0, 0, 0);
> +
> +       return sbi_err_map_linux_errno(ret.error);
> +}
> +
> +static int sse_events_unmask(void)
> +{
> +       struct sbiret ret;
> +
> +       ret =3D sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_HART_UNMASK, 0, 0, 0=
, 0, 0, 0);
> +
> +       return sbi_err_map_linux_errno(ret.error);
> +}
> +
> +static void sse_event_disable_nolock(struct sse_event *event)
> +{
> +       struct sse_per_cpu_evt cpu_evt;
> +
> +       if (sse_event_is_global(event->evt_id)) {
> +               sse_event_disable_local(event);
> +       } else {
> +               cpu_evt.event =3D event;
> +               cpu_evt.func =3D SBI_SSE_EVENT_DISABLE;
> +               on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
> +       }
> +}
> +
> +void sse_event_disable(struct sse_event *event)
> +{
> +       scoped_guard(mutex, &sse_mutex) {
> +               scoped_guard(cpus_read_lock) {
> +                       sse_event_disable_nolock(event);
> +               }
> +       }
> +}
> +EXPORT_SYMBOL_GPL(sse_event_disable);
> +
> +struct sse_event *sse_event_register(u32 evt, u32 priority,
> +                                    sse_event_handler *handler, void *ar=
g)
> +{
> +       struct sse_event *event;
> +       int cpu;
> +       int ret =3D 0;
> +
> +       if (!sse_available)
> +               return ERR_PTR(-EOPNOTSUPP);
> +
> +       guard(mutex)(&sse_mutex);
> +       if (sse_event_get(evt))
> +               return ERR_PTR(-EEXIST);
> +
> +       event =3D sse_event_alloc(evt, priority, handler, arg);
> +       if (IS_ERR(event))
> +               return event;
> +
> +       scoped_guard(cpus_read_lock) {
> +               if (sse_event_is_global(evt)) {
> +                       unsigned long preferred_hart;
> +
> +                       ret =3D sse_event_attr_get_no_lock(event->global,
> +                                                       SBI_SSE_ATTR_PREF=
ERRED_HART,
> +                                                       &preferred_hart);
> +                       if (ret)
> +                               goto err_event_free;
> +
> +                       cpu =3D riscv_hartid_to_cpuid(preferred_hart);
> +                       sse_global_event_update_cpu(event, cpu);
> +
> +                       ret =3D sse_sbi_register_event(event, event->glob=
al);
> +                       if (ret)
> +                               goto err_event_free;
> +
> +               } else {
> +                       sse_on_each_cpu(event, SBI_SSE_EVENT_REGISTER,
> +                                       SBI_SSE_EVENT_DISABLE);
> +               }

It is necessary to check the return value; otherwise, the event might
be passed as a valid value to subsequent logic, such as
sse_event_enable().


> +       }
> +
> +       scoped_guard(spinlock, &events_list_lock)
> +               list_add(&event->list, &events);
> +
> +       return event;
> +
> +err_event_free:
> +       sse_event_free(event);
> +
> +       return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(sse_event_register);
> +
> +static void sse_event_unregister_nolock(struct sse_event *event)
> +{
> +       struct sse_per_cpu_evt cpu_evt;
> +
> +       if (sse_event_is_global(event->evt_id)) {
> +               sse_sbi_unregister_event(event);
> +       } else {
> +               cpu_evt.event =3D event;
> +               cpu_evt.func =3D SBI_SSE_EVENT_UNREGISTER;
> +               on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
> +       }
> +}
> +
> +void sse_event_unregister(struct sse_event *event)
> +{
> +       scoped_guard(mutex, &sse_mutex) {
> +               scoped_guard(cpus_read_lock)
> +                       sse_event_unregister_nolock(event);
> +
> +               scoped_guard(spinlock, &events_list_lock)
> +                       list_del(&event->list);
> +
> +               sse_event_free(event);
> +       }
> +}
> +EXPORT_SYMBOL_GPL(sse_event_unregister);
> +
> +static int sse_cpu_online(unsigned int cpu)
> +{
> +       struct sse_event *event;
> +
> +       scoped_guard(spinlock, &events_list_lock) {
> +               list_for_each_entry(event, &events, list) {
> +                       if (sse_event_is_global(event->evt_id))
> +                               continue;
> +
> +                       sse_event_register_local(event);
> +                       if (sse_get_reg_evt(event))
> +                               sse_event_enable_local(event);
> +               }
> +       }
> +
> +       /* Ready to handle events. Unmask SSE. */
> +       return sse_events_unmask();
> +}
> +
> +static int sse_cpu_teardown(unsigned int cpu)
> +{
> +       int ret =3D 0;
> +       unsigned int next_cpu;
> +       struct sse_event *event;
> +
> +       /* Mask the sse events */
> +       ret =3D sse_events_mask();
> +       if (ret)
> +               return ret;
> +
> +       scoped_guard(spinlock, &events_list_lock) {
> +               list_for_each_entry(event, &events, list) {
> +                       if (!sse_event_is_global(event->evt_id)) {
> +                               if (event->global->is_enabled)
> +                                       sse_event_disable_local(event);
> +
> +                               sse_sbi_unregister_event(event);
> +                               continue;
> +                       }
> +
> +                       if (event->cpu !=3D smp_processor_id())
> +                               continue;
> +
> +                       /* Update destination hart for global event */
> +                       next_cpu =3D cpumask_any_but(cpu_online_mask, cpu=
);
> +                       ret =3D sse_event_set_target_cpu_nolock(event, ne=
xt_cpu);
> +               }
> +       }
> +
> +       return ret;
> +}
> +
> +static void sse_reset(void)
> +{
> +       struct sse_event *event;
> +
> +       list_for_each_entry(event, &events, list) {
> +               sse_event_disable_nolock(event);
> +               sse_event_unregister_nolock(event);
> +       }
> +}
> +
> +static int sse_pm_notifier(struct notifier_block *nb, unsigned long acti=
on,
> +                          void *data)
> +{
> +       WARN_ON_ONCE(preemptible());
> +
> +       switch (action) {
> +       case CPU_PM_ENTER:
> +               sse_events_mask();
> +               break;
> +       case CPU_PM_EXIT:
> +       case CPU_PM_ENTER_FAILED:
> +               sse_events_unmask();
> +               break;
> +       default:
> +               return NOTIFY_DONE;
> +       }
> +
> +       return NOTIFY_OK;
> +}
> +
> +static struct notifier_block sse_pm_nb =3D {
> +       .notifier_call =3D sse_pm_notifier,
> +};
> +
> +/*
> + * Mask all CPUs and unregister all events on panic, reboot or kexec.
> + */
> +static int sse_reboot_notifier(struct notifier_block *nb, unsigned long =
action,
> +                              void *data)
> +{
> +       cpuhp_remove_state(sse_hp_state);
> +       sse_reset();
> +
> +       return NOTIFY_OK;
> +}
> +
> +static struct notifier_block sse_reboot_nb =3D {
> +       .notifier_call =3D sse_reboot_notifier,
> +};
> +
> +static int __init sse_init(void)
> +{
> +       int ret;
> +
> +       if (sbi_probe_extension(SBI_EXT_SSE) <=3D 0) {
> +               pr_err("Missing SBI SSE extension\n");
> +               return -EOPNOTSUPP;
> +       }
> +       pr_info("SBI SSE extension detected\n");
> +
> +       ret =3D cpu_pm_register_notifier(&sse_pm_nb);
> +       if (ret) {
> +               pr_warn("Failed to register CPU PM notifier...\n");
> +               return ret;
> +       }
> +
> +       ret =3D register_reboot_notifier(&sse_reboot_nb);
> +       if (ret) {
> +               pr_warn("Failed to register reboot notifier...\n");
> +               goto remove_cpupm;
> +       }
> +
> +       ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/sse:online"=
,
> +                               sse_cpu_online, sse_cpu_teardown);
> +       if (ret < 0)
> +               goto remove_reboot;
> +
> +       sse_hp_state =3D ret;
> +       sse_available =3D true;
> +
> +       return 0;
> +
> +remove_reboot:
> +       unregister_reboot_notifier(&sse_reboot_nb);
> +
> +remove_cpupm:
> +       cpu_pm_unregister_notifier(&sse_pm_nb);
> +
> +       return ret;
> +}
> +arch_initcall(sse_init);
> diff --git a/include/linux/riscv_sse.h b/include/linux/riscv_sse.h
> new file mode 100644
> index 000000000000..d7bd0e22a00f
> --- /dev/null
> +++ b/include/linux/riscv_sse.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +
> +#ifndef __LINUX_RISCV_SSE_H
> +#define __LINUX_RISCV_SSE_H
> +
> +#include <linux/types.h>
> +#include <linux/linkage.h>
> +
> +struct sse_event;
> +struct pt_regs;
> +
> +typedef int (sse_event_handler)(u32 event_num, void *arg, struct pt_regs=
 *regs);
> +
> +#ifdef CONFIG_RISCV_SSE
> +
> +struct sse_event *sse_event_register(u32 event_num, u32 priority,
> +                                    sse_event_handler *handler, void *ar=
g);
> +
> +void sse_event_unregister(struct sse_event *evt);
> +
> +int sse_event_set_target_cpu(struct sse_event *sse_evt, unsigned int cpu=
);
> +
> +int sse_event_enable(struct sse_event *sse_evt);
> +
> +void sse_event_disable(struct sse_event *sse_evt);
> +
> +int sse_event_enable_local(struct sse_event *sse_evt);
> +int sse_event_disable_local(struct sse_event *sse_evt);
> +
> +#else
> +static inline struct sse_event *sse_event_register(u32 event_num, u32 pr=
iority,
> +                                                  sse_event_handler *han=
dler,
> +                                                  void *arg)
> +{
> +       return ERR_PTR(-EOPNOTSUPP);
> +}
> +
> +static inline void sse_event_unregister(struct sse_event *evt) {}
> +
> +static inline int sse_event_set_target_cpu(struct sse_event *sse_evt,
> +                                          unsigned int cpu)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static inline int sse_event_enable(struct sse_event *sse_evt)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static inline void sse_event_disable(struct sse_event *sse_evt) {}
> +#endif
> +#endif /* __LINUX_RISCV_SSE_H */
> --
> 2.43.0
>

Thanks,
Yunhui

