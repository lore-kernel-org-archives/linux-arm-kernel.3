Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C504CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlNdQWav53VcKx5bUU9bkuVSgk5Fo7emcLVY/d4ceks=; b=FLNf0Wf1N4NWoBOZVXajXebqmE
	B3p7grNTolhC9f7s0KTx2kWM7lYJjQNjwCx3fjCo12H9GChOv/GvaspQiXbqx04ca+4ofuHoiFpgS
	oCf9cSLdx5TteLYTLWMX7IPLU19h/51TYjMxvM6EYJFSTRFm1zSm2NrHuC5u+v7K7CiCqt1FMfDpv
	xoMLa+J4bPn9m1GAXExphlWjwML4MHQBC2Itq0+sD8CWvlAbvekpv1d3e/KcwJUGrrOkvr1xbXQ8+
	y6CJW9VTs4GxNado61gOiTAlNL7KWQLlMGhL0UxJwEVAVxVMFPlAPUFaguUcnuca9wkAFA8DDan6k
	QZQt6ojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtoW-0000000EuzK-0Lpx;
	Mon, 18 May 2026 08:59:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtoU-0000000Euyt-1HQ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 08:59:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8830C60125
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 08:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A55C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779094741;
	bh=A7ICurGTIkPXELRTZbv6ysGJpJ9ImgP6X+QRSf+z+SU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=C6hIgQrmWX7HsofUCN2mACBoBoypsCFwVD/HNXLq17VKZbU/Lmsc02I99/fS2Jhvb
	 vRR9CeKoJa5YzbozDCovMAC9qlfa/U6vwbiFJG9A0FOIJDa8KL9C53/vhrb8zScvO1
	 z1QbD0SQe6VWqmA6wSCooIxC3/sb+o2VjkvuP7MxFka5hcXsFl9YR/rh6oB3irWXK7
	 v9Q/aex7t+uK1ezMt5gOaytTO2aQxyLbjasfhoc3UuWwkhl19V+Pm8bjZ7jTEkxa0E
	 tulS84vUw1s/DyaITNoUpfjlYhfwH6b3Mwqdw4rnhHOeNcnIO4eLHdLEzkxZ9oe4GB
	 3CmygoGPk28bQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39393ec4ed0so20600761fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 01:59:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/BbJojSz/gT5iO6MmZSeynLY2z1KmQYp8DXHv2BOaqBfw6dVHgDmuoyRQdQdgLtCfn222NEtHvB/LwenSFJlJT@lists.infradead.org
X-Gm-Message-State: AOJu0YzJlI6EkZeuDGWv5PemWJLb+CGrInVjcfUDt6bhDXsDdT5Dtv0E
	tJvA850yK0L9zZ/cm7uVi2ELnFX2x+HAjCe+IYxIO2xL5Uehaa3b3KARmCQ9a6SsXL/59LyuFWd
	J4qeTcJfqj1YznEwQsezQj5cgcdDR29TSCfQHJMD3xw==
X-Received: by 2002:a05:6512:3c8c:b0:5a8:84a5:bffa with SMTP id
 2adb3069b0e04-5aa0e6191a0mr3999087e87.5.1779094739901; Mon, 18 May 2026
 01:58:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 01:58:58 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 01:58:58 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-7-28a5bde07483@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-7-28a5bde07483@oss.qualcomm.com>
Date: Mon, 18 May 2026 01:58:58 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdNVBKH_4Ps_QSG_YzW3=BgsMo0bDk6vuJuH7VheY9PmQ@mail.gmail.com>
X-Gm-Features: AVHnY4JP-WgaYa7_12dnDtJw4NYyeBy8ntErqhFkjuYMsR9OM-caNZdJWXcWW34
Message-ID: <CAMRc=MdNVBKH_4Ps_QSG_YzW3=BgsMo0bDk6vuJuH7VheY9PmQ@mail.gmail.com>
Subject: Re: [PATCH v22 07/13] power: reset: Add psci-reboot-mode driver
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 14 May 2026 16:25:48 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
> there is no common driver that handles all supported psci resets at one
> place. Additionally, there is no common mechanism to issue the supported
> psci resets from userspace.
>
> Add a psci-reboot-mode driver, and define two types of PSCI resets,
> predefined-resets and vendor-specific resets. Predefined-resets are
> defined by psci driver and vendor-specific resets are defined by SoC
> vendors, under the psci:reboot-mode node of SoC device tree.
>
> Register the driver with the reboot-mode framework to interface these
> resets to userspace. When userspace initiates a supported command, pass
> the reset arguments to the PSCI driver to enable command-based reset.
>
> This change allows userspace to issue supported PSCI reset commands
> using the standard reboot system calls while enabling SoC vendors to
> define their specific resets for PSCI.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  MAINTAINERS                            |  1 +
>  drivers/power/reset/Kconfig            | 10 +++++
>  drivers/power/reset/Makefile           |  1 +
>  drivers/power/reset/psci-reboot-mode.c | 72 ++++++++++++++++++++++++++++++++++
>  4 files changed, 84 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36ba42209c0b332813a296880cd55798a5592d2a..4b0815c31679550f5ab719de4a5852990c7cc643 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21342,6 +21342,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/psci.yaml
>  F:	drivers/firmware/psci/
>  F:	drivers/mfd/psci-mfd.c
> +F:	drivers/power/reset/psci-reboot-mode.c
>  F:	include/linux/psci.h
>  F:	include/uapi/linux/psci.h
>
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 124afb99febe92450b6ae322aeed3b63fa2070df..d9d1f768b8691abc3b32f2675519f2ddbaf19b84 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
>  	  then the bootloader can read it and take different
>  	  action according to the mode.
>
> +config PSCI_REBOOT_MODE
> +	bool "PSCI reboot mode driver"
> +	depends on OF && ARM_PSCI_FW

Can you add COMPILE_TEST coverage here too please?

> +	select REBOOT_MODE
> +	help
> +	  Say y here will enable PSCI reboot mode driver. This gets
> +	  the PSCI reboot mode arguments and passes them to psci
> +	  driver. psci driver uses these arguments for issuing
> +	  device reset into different boot states.
> +
>  config POWER_MLXBF
>  	tristate "Mellanox BlueField power handling driver"
>  	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index d7ae97241a838fe1b536b2f911868e7590d12e3b..02948622fe3d00e165f941108ab92ecb66b0f0e8 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -40,5 +40,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>  obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>  obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>  obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>  obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
>  obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..845b2a1816ce53451dea8dfc4bffffda0d3e9293
> --- /dev/null
> +++ b/drivers/power/reset/psci-reboot-mode.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/psci.h>
> +#include <linux/reboot-mode.h>
> +#include <linux/types.h>
> +
> +/*
> + * Predefined modes:
> + *   reset_type = 0
> + *   cookie stored in magic[63:32]
> + */
> +#define PSCI_PREDEF_MAGIC(cookie)	((cookie) * BIT_ULL(32))
> +
> +static const struct reboot_mode_entry psci_resets[] = {
> +	{
> +		.name  = "psci-system-reset",
> +		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET),
> +	},
> +	{
> +		.name  = "psci-system-reset2-arch-warm-reset",
> +		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM),
> +	},
> +};
> +
> +/*
> + * magic is a pre-encoded value:
> + *   reset_type in low 32 bits
> + *   cookie in high 32 bits
> + */
> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
> +{
> +	psci_set_reset_cmd(magic);
> +	return 0;
> +}
> +
> +static int psci_reboot_mode_probe(struct platform_device *pdev)
> +{
> +	struct reboot_mode_driver *reboot;
> +	size_t count;
> +	int ret;
> +
> +	reboot = devm_kzalloc(&pdev->dev, sizeof(*reboot), GFP_KERNEL);
> +	if (!reboot)
> +		return -ENOMEM;
> +
> +	reboot_mode_driver_init(reboot, &pdev->dev, psci_reboot_mode_write);
> +
> +	/* Skip PSCI SYSTEM_RESET2 modes if unsupported */
> +	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
> +	ret = reboot_mode_add_predefined_modes(reboot, psci_resets, count);
> +	if (ret)
> +		return ret;
> +
> +	return devm_reboot_mode_register(&pdev->dev, reboot);
> +}
> +
> +static struct platform_driver psci_reboot_mode_driver = {
> +	.probe  = psci_reboot_mode_probe,
> +	.driver = {
> +		.name	= "psci-reboot-mode",
> +	},
> +};
> +

You can drop the newline here.

> +module_platform_driver(psci_reboot_mode_driver);
> +
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
>

With that:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

