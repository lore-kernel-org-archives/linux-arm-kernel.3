Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BEFFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23oET8WSQrJOKULwNvJpGNXfhvcKt2AYd/aG6/Ea7EU=; b=Qvrvx4sNhIuAasbwN1fcrqyl5u
	14GWh0KngiC1lTUCAXPT2cq/unQ5YiMHTkKCrqa1Gu9k1o6g66bwEUsy1ogwS5VF6bKFd2vDayeWf
	koeOqMhUZrH1vGkecV7anQd1FQxosK17ZaiMDyo6OxwyI2NJYtxQrIjGMbF0jli0mi5QTLPPhUD8Q
	mEMPrOXd71Jvpf7Lluiz5G3tfNCsBSb/e0tWb8dBlI1ebq3CQiOiySJqyunQzXs7O04GRCnCtG5M/
	nFpUrbiOYFVZVGwgi9K+iZK4kw5O7yQTp1RomGfUU1xN/q54Fzsf8SqnOhdeZTNBrX9tTnj/1GHTt
	Ai7JRqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdIn-00000000pG9-2yaA;
	Tue, 28 Apr 2026 07:56:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdIj-00000000pEa-2ENJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:56:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9530E44826
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D6AC2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777362970;
	bh=LFgv66F+0nt9E67NvK3C9RMmoN2dCCkDNLlwr0UUAys=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=FDjAfyK9X4SOWb9qosGFCnsMLAnw1GeTTWQOi535HnflthB4xSmC4jkyFjSMpanr0
	 AuYymZU9u+uyi6yxuYkRM+bYyn5eo+C09b4BmNLD40M5K1qyFgoH48EXvCucU2IqA1
	 ssIucaVEPqMKCkXaWR5wDM83IFxcP+dHmn26qL0zZG41aQYO0bhI0GVoXjxJoeSuQn
	 naMVGO+9kRPzDnJieG5YxapdDJ10Vb4b6Rj+e8be/pshBfU2MZyftF1aH8NKvXXQ71
	 S5K9ReJrsKRMXYR6P8I85MecWhE0pxQ7pBLn9IUnpM2kweAd8w0PkoL1u2XGh+vSoe
	 o2NiQUz2juVLg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59e4a04f059so13578856e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:56:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/zHFXpmRSiRItvSQykHqlGAiSrMrAvdnDXYXumJ7uPMEoDqAScp2WALOsKGBm0XTV9f+9539i4oRWqoErpHIWO@lists.infradead.org
X-Gm-Message-State: AOJu0YwWD8QW7UW6M9YADtHqzxFhCxhA1f615m8dMdd5d+sW6EqEGh0Q
	B0RT0GtoCyNPyCuh3Gyy8PhBQLeqgnvPGnYhk50NYnxLa6/TKaokzWA7NMIL/TYxkVYz6qiXjbo
	FK9JNinXhwCePE9XXjzTPa7DJ/g+8uV4ZQO2n2h8oQQ==
X-Received: by 2002:a05:6512:2203:b0:5a3:cc81:efdb with SMTP id
 2adb3069b0e04-5a7466234c2mr724146e87.21.1777362968553; Tue, 28 Apr 2026
 00:56:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:56:06 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:56:06 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-7-dcf937775e73@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-7-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 00:56:06 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdLTMX34DEhoMskMzjRqx+Cdpm3=P5QTZ8S6sUVJ3eTbg@mail.gmail.com>
X-Gm-Features: AVHnY4JQrBCpBs44aK1VESiHmvoftBhqWQglXzFZW2sthd0LKcTnrxCZ5nyahlo
Message-ID: <CAMRc=MdLTMX34DEhoMskMzjRqx+Cdpm3=P5QTZ8S6sUVJ3eTbg@mail.gmail.com>
Subject: Re: [PATCH v21 07/13] power: reset: Add psci-reboot-mode driver
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_005613_701998_2FD9585B 
X-CRM114-Status: GOOD (  32.99  )
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

On Mon, 27 Apr 2026 19:34:47 +0200, Shivendra Pratap
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
>  MAINTAINERS                            |   1 +
>  drivers/power/reset/Kconfig            |  10 +++
>  drivers/power/reset/Makefile           |   1 +
>  drivers/power/reset/psci-reboot-mode.c | 109 +++++++++++++++++++++++++++++++++
>  4 files changed, 121 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 333b01fa00b8fbd15e6f31a6b9af47600411624e..8cebc2c7e161c8a226802a4102756b4ed6034395 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21240,6 +21240,7 @@ S:	Maintained
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
> index 0000000000000000000000000000000000000000..29f53d2f50da8e34e714adef9507d340bc4130e2
> --- /dev/null
> +++ b/drivers/power/reset/psci-reboot-mode.c
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/psci.h>
> +#include <linux/reboot.h>
> +#include <linux/reboot-mode.h>
> +#include <linux/types.h>
> +
> +/* Predefined modes use reset_type = 0 and cookie in magic[63:32]. */
> +#define PSCI_PREDEF_MAGIC(cookie)	((cookie) * BIT_ULL(32))
> +
> +struct psci_predefined_reset {
> +	const char *mode;
> +	u64 magic;
> +};
> +
> +static const struct psci_predefined_reset psci_resets[] = {
> +	{
> +		.mode = "psci-system-reset",
> +		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET),
> +	},
> +	{
> +		.mode = "psci-system-reset2-arch-warm-reset",
> +		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM),
> +	},
> +};
> +
> +static int psci_reboot_mode_add_predefined_mode(struct device *dev,
> +						struct reboot_mode_driver *reboot,
> +						const struct psci_predefined_reset *predef)
> +{
> +	struct mode_info *info;
> +
> +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	INIT_LIST_HEAD(&info->list);
> +	info->mode = predef->mode;
> +	info->magic = predef->magic;
> +	list_add_tail(&info->list, &reboot->predefined_modes);
> +
> +	return 0;
> +}
> +
> +static int psci_reboot_mode_set_predefined_modes(struct device *dev,
> +						 struct reboot_mode_driver *reboot)
> +{
> +	int ret;
> +
> +	INIT_LIST_HEAD(&reboot->predefined_modes);
> +
> +	/* Always register psci-system-reset. */
> +	ret = psci_reboot_mode_add_predefined_mode(dev, reboot, &psci_resets[0]);
> +	if (ret)
> +		return ret;
> +
> +	/* Register arch warm reset only if SYSTEM_RESET2 is supported. */
> +	if (!psci_has_system_reset2_support())
> +		return 0;
> +
> +	return psci_reboot_mode_add_predefined_mode(dev, reboot, &psci_resets[1]);

Looking at this, I'd introduce a core reboot-mode helper for initializing the
predefined_modes field and adding an array of modes and use it here and earlier
in the series.

> +}
> +
> +/*
> + * Pass the encoded magic to psci_set_reset_cmd.
> + * magic is encoded as reset_type (low 32 bits) and cookie (high 32 bits).
> + */
> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
> +{
> +	psci_set_reset_cmd(magic);
> +	return 0;
> +}
> +
> +static int psci_reboot_mode_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct reboot_mode_driver *reboot;
> +	int ret;
> +
> +	reboot = devm_kzalloc(dev, sizeof(*reboot), GFP_KERNEL);
> +	if (!reboot)
> +		return -ENOMEM;
> +
> +	ret = psci_reboot_mode_set_predefined_modes(dev, reboot);
> +	if (ret)
> +		return ret;
> +
> +	reboot->write = psci_reboot_mode_write;
> +	reboot->dev = dev;
> +
> +	return devm_reboot_mode_register(dev, reboot);
> +}
> +
> +static struct platform_driver psci_reboot_mode_driver = {
> +	.probe  = psci_reboot_mode_probe,
> +	.driver = {
> +		.name	= "psci-reboot-mode",
> +	},
> +};
> +
> +module_platform_driver(psci_reboot_mode_driver);
> +
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
>

Looks good otherwise!

Bart

