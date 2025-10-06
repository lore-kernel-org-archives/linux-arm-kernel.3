Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D1ECCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 05:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pW4c6n+2yRiIWNsxLVYkze/rdTmcGN5mveqQBz1D8t8=; b=L2qZSMrPL1eJXl+WmZUtmZWIni
	kQW236INXSaQMSjoy06rVCGs90ddRsbBj0+YPdKtti/2xNarfuLCirn4betNecai4YE2J1hKLVUYB
	8R18vCJx1HAFdSiFFxf3jLyQV+L6sMFIhvMLQyGUylkxE4st7mtKjQOEIQx2G7TE5LuR45hTKZo7C
	DOvC77yGLzADcSSfW537adyIfVOPAh9OmK09jhkyOMDbUEKsb2oHJNjL3qI9u8jNd745UMT0+5t+L
	Svl+gSUWeYTY402/VyF2t316VuNe7CewNDjYSMtr5xOiws6u1ezqFthz/RxiyWeA4n4Xl99BUGWxX
	Yf3vv3YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5dvb-0000000GyCs-3HcK;
	Mon, 06 Oct 2025 05:38:31 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5dvY-0000000GyC1-3kS0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 05:38:30 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-92790f12293so210560139f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Oct 2025 22:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1759729108; x=1760333908; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pW4c6n+2yRiIWNsxLVYkze/rdTmcGN5mveqQBz1D8t8=;
        b=IkM8kZnwnwnNGLStr7jy/LZZw7g4hcFn5Ddh3tz3mOrN0eRsQjaW/7wTjDk/IB1oVf
         MxKWLwX3KKhOwtlvEUmKtEPsfkbT65+KqyFkgsb3vbN2Fl03dsCZaLzUBHFYNSzr5Vzk
         YnAXqlhcANOY7hg70Gmo9EXHsj0WKjbkaLBRWudOCC0zu8RJEbOxzdJp5+n5GmYXES4m
         IEeM3IVE0IZY2KpdofMsNUNOR5qp4GngiswZg9mUXZoI26wAOKCMAcLRgjNXCcgAs6KD
         STiG8hmX7MCkGTD/fKp4dKUu4/mqrMK2kCL95PyDuJmBRgUraf/GcCncYKH00NMIjyS2
         TwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759729108; x=1760333908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pW4c6n+2yRiIWNsxLVYkze/rdTmcGN5mveqQBz1D8t8=;
        b=AOh7P1fmPjQr2P+0Lt0nCvGpSMZfcKSVUiTgC0t3zuhsUh5JbIALPhf9i7mcK06CSp
         73y8/30wGsHcriCLWFQLGrdq+7tQsUWJi4Duq74sDFy77YZuUGw+CkSDj77tx1y74tg/
         PAfGH6uyxxrF6Qu6GtyFTffLMG6giblld/mXZG30xi48tEfIhxSF92KJGgzc6xUyyqbm
         /PEN2ANokgXJw9M3As1YzycnE+p64xFLfExhQQ+oogO269awnwtxyKFjOOvRtFpr9ywS
         fOpEA8WAVligIjxl0is0WOtw6zR5ByPDTiu0iajx4t0zmSRM42uA7MJwxDofpaJfDhlF
         y7Jw==
X-Forwarded-Encrypted: i=1; AJvYcCX8AcZlWRDDWxqOG2g1BsS5yPGwj13HuWq0wjuMhH1WLAZNN25B/2sSzLDf8W/8S219fzFLCE5Iy3y3rRWTsM5t@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb8WilHUlvO0RiRDNP2L0E6hT9v785CXrKGOFDyPIT9RCNjrJs
	gH2HWAeA1ydBhbMxQt6KsIsBqm3YE1MPq+pE/KPqHgZZ1eJsTzQ344PXRByIPzrRz85LQTNIMjD
	Z6LVGsoU7FIKjVGGrhpyW+0mJELQ79IHZ9WZfuPWX6w==
X-Gm-Gg: ASbGncvD2BHIpJ7QAJscAYBvE4EYlmmhBbNyNDeBgiJrA2DjWqgjd1foihFU9+/4ixQ
	EEqYdJgumYJFmWl9YJv4qaJc7cJFL1x4teFjn6OCukO7zsQ9RUC5gmJI57J7KIBGri7Lse09ins
	/HqK2Xs4L0zUGYKQIaLGEuYqrjXJwjeaJ+002u9jOZrcD8/1q0QerdCZnI9FltP8+am3uiCAyRk
	TKtStBvIqckK2qIRZj1TfOgqo8ZcrI73QT8fFg1hYdgY5J4mIcmoEhoveBZ0fBq
X-Google-Smtp-Source: AGHT+IHPxAUl4r2f9K0Px0iy8hrJgabwk3brsr3cS0D0PsoKasiHRjoRmClFHKfFEbJFAfVhBzGI/LuLYZOyx1Nd03c=
X-Received: by 2002:a05:6e02:b2a:b0:427:d62b:45f7 with SMTP id
 e9e14a558f8ab-42e7adac50fmr94926185ab.27.1759729107921; Sun, 05 Oct 2025
 22:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250908181717.1997461-1-cleger@rivosinc.com> <20250908181717.1997461-4-cleger@rivosinc.com>
In-Reply-To: <20250908181717.1997461-4-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Oct 2025 11:08:17 +0530
X-Gm-Features: AS18NWDCLrNNt4JH_WobaoB3Er2efhAPx6fqnox0H-hF7hS1NfoIoCx1KkffDC4
Message-ID: <CAAhSdy3fwEZ+SQ3Cgc=GbisshRVQsvUPv23kzDFDd45ic=GObg@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] drivers: firmware: add riscv SSE support
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Xu Lu <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_223828_947778_94E0F3D0 
X-CRM114-Status: GOOD (  24.77  )
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

On Mon, Sep 8, 2025 at 11:50=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Add driver level interface to use RISC-V SSE arch support. This interface
> allows registering SSE handlers, and receive them. This will be used by
> PMU and GHES driver.
>
> Co-developed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS                            |  15 +
>  drivers/firmware/Kconfig               |   1 +
>  drivers/firmware/Makefile              |   1 +
>  drivers/firmware/riscv/Kconfig         |  15 +
>  drivers/firmware/riscv/Makefile        |   3 +
>  drivers/firmware/riscv/riscv_sbi_sse.c | 701 +++++++++++++++++++++++++
>  include/linux/riscv_sbi_sse.h          |  57 ++
>  7 files changed, 793 insertions(+)
>  create mode 100644 drivers/firmware/riscv/Kconfig
>  create mode 100644 drivers/firmware/riscv/Makefile
>  create mode 100644 drivers/firmware/riscv/riscv_sbi_sse.c
>  create mode 100644 include/linux/riscv_sbi_sse.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..684d23f852c3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21648,6 +21648,13 @@ T:     git git://git.kernel.org/pub/scm/linux/ke=
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
> @@ -21712,6 +21719,14 @@ F:     arch/riscv/boot/dts/spacemit/
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
> index 000000000000..ed5b663ac5f9
> --- /dev/null
> +++ b/drivers/firmware/riscv/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "Risc-V Specific firmware drivers"
> +depends on RISCV
> +
> +config RISCV_SBI_SSE
> +       bool "Enable SBI Supervisor Software Events support"
> +       depends on RISCV_SBI
> +       default y
> +       help
> +         The Supervisor Software Events support allows the SBI to delive=
r
> +         NMI-like notifications to the supervisor mode software. When en=
abled,
> +         this option provides support to register callbacks on specific =
SSE
> +         events.
> +
> +endmenu
> diff --git a/drivers/firmware/riscv/Makefile b/drivers/firmware/riscv/Mak=
efile
> new file mode 100644
> index 000000000000..c8795d4bbb2e
> --- /dev/null
> +++ b/drivers/firmware/riscv/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_RISCV_SBI_SSE)            +=3D riscv_sbi_sse.o
> diff --git a/drivers/firmware/riscv/riscv_sbi_sse.c b/drivers/firmware/ri=
scv/riscv_sbi_sse.c
> new file mode 100644
> index 000000000000..57b6dad92482
> --- /dev/null
> +++ b/drivers/firmware/riscv/riscv_sbi_sse.c
> @@ -0,0 +1,701 @@
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
> +#include <linux/riscv_sbi_sse.h>
> +#include <linux/slab.h>
> +
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
> +
> +struct sse_event {
> +       struct list_head list;
> +       u32 evt_id;
> +       u32 priority;
> +       sse_event_handler_fn *handler;
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

<snip>

> +
> +static int __init sse_init(void)
> +{
> +       int ret;
> +
> +       if (sbi_probe_extension(SBI_EXT_SSE) <=3D 0) {
> +               pr_err("Missing SBI SSE extension\n");

We might have older firmware which implements an older
SBI spec version so we should not throw errors over here.
Please change this to pr_info().

Regards,
Anup

