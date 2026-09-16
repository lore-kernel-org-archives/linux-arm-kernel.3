Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9E4C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8y1oxDA3Zy9NWOoBvZCFqDaZfIYjK92V//s3NXF9nW8=; b=tp1Fzqm2fthSnr+qB9Ie2y+1Ex
	LaODzl7EV0EuRtbmzrvHhwohNceJkTGmB4DxOCafG0DWoAFEp/G+8UHrjZ3MZFtGUQ8e/m5LI4ndk
	YFF6/Y8MP3l92axW0YZaTs8Gwe76061cDigBG1AKYMmroJvpUwpkEqn6kmHW3ALeSuDOcGKZXR65N
	tvJ8GOFQPDr8FHCQyRoezVE9cJpstZlXJPIBxMbcLRTsmJvCAMNIAtU4tHDYVDeuJvUYQgRjUvOIC
	QaNHh6nMHhCD6bbIDIHdRWiX59bIRzvG0gxpMTZ2bHvd2YvnPKkHu8xPSYuzwdzMdXa+qd5Hvn1WT
	7KHVzVfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lrW-00000008pMm-44oK;
	Wed, 16 Sep 2026 09:23:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lrW-00000008pMI-13G0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:23:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A2E8F43E1F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CD01F008A0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789550609;
	bh=8y1oxDA3Zy9NWOoBvZCFqDaZfIYjK92V//s3NXF9nW8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=B72l6WtUyZlmC55w0Cn4FiftTPNmuFNftMahr1iTQQBG4ZVsbSn0gAJNgiTuSQ+LL
	 s8iSQoFDJrPerRuoITrYSEw5/F4kI8eWfSUtx/N0lhsvuCXAuTBv8dPvsSZHG+E/yj
	 CXcYrpf2of49P+clI/5/0doxNKm13SRLmF/RPfAg0LDNGqkyorjBFDAThmIC5Mr68u
	 Kc52OpQzbVKhtWMys5E0Oilcb/8UQienLFHaVvFMO7GIvy2vyq9GdB3nmzcr7YlarR
	 7KkfKw9o12b7n5hNbcahM/++69+gwUZduQlFLedBB8X9ZtR8gONAaoH2Q1oQSnOgJt
	 iF9v0mj4TPlKQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so710180e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 02:23:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxqwTW+f9YBcJ3NWkyZJzqBdXlwovMsn7/9ZOAxrGp7mLmy6BN/4xBLgvaWxTPOow7PJfL6zumZkYOkSl2zhSUy@lists.infradead.org
X-Gm-Message-State: AFuF++nOlaB+8PYjVfVG8Kx1NNxz2MZDOfu2EGP6VBEyfY4QaF8UnNCk
	SDT3Csl6HKT3rG2NFhiWvF3CZJFgW2FMaZaS9hDv11Ud8U02HVadnwG+M/X9Bsah/OErZ0tFBoJ
	B8IkCnLn4WbKL1fP1v6mMX5c9as1sNHIzCH7X4xgtTw==
X-Received: by 2002:a05:6512:1151:b0:5ae:bd5e:95f7 with SMTP id
 2adb3069b0e04-5b8b660ab6bmr1012067e87.4.1789550608110; Wed, 16 Sep 2026
 02:23:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 04:23:26 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 04:23:26 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-6-4aaf5c09b5c2@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-6-4aaf5c09b5c2@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 04:23:26 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdpuRhbCXZd1xkRH4Rs4g=iGRa1oaeN6vcmP3CjcJpydA@mail.gmail.com>
X-Gm-Features: AcwNN1UsWFiQdwj37p9YrE8LwqI5EWZQm-VOsqh34gtu3xJhOe-g-SrOqENvLgQ
Message-ID: <CAMRc=MdpuRhbCXZd1xkRH4Rs4g=iGRa1oaeN6vcmP3CjcJpydA@mail.gmail.com>
Subject: Re: [PATCH v25 06/10] power: reset: Add psci-reboot-mode driver
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>, 
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, John Stultz <john.stultz@linaro.org>, 
	Moritz Fischer <moritz.fischer@ettus.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
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

On Mon, 14 Sep 2026 16:59:10 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
> there is no common driver that handles all supported psci resets at one
> place. Additionally, there is no common mechanism to issue the supported
> psci resets from userspace.
>
> Add psci-reboot-mode as an auxiliary device created by the psci-devices
> driver. Define two types of PSCI resets, predefined-resets and
> vendor-specific resets.  Predefined-resets are defined by psci driver
> and vendor-specific resets are defined by SoC vendors, under the
> psci:reboot-mode node of SoC device tree.
>
> Register the driver with the reboot-mode framework to interface these
> resets to userspace. When userspace initiates a supported command, pass
> the reset arguments to the PSCI driver to enable command-based reset.
>
> This change allows userspace to issue supported PSCI reset commands
> using the standard reboot system calls while enabling SoC vendors to
> define their specific resets for PSCI.
>
> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  MAINTAINERS                            |   1 +
>  drivers/firmware/psci/psci-devices.c   |  71 +++++++++++++++++++++-
>  drivers/power/reset/Kconfig            |  10 ++++
>  drivers/power/reset/Makefile           |   1 +
>  drivers/power/reset/psci-reboot-mode.c | 104 +++++++++++++++++++++++++++++++++
>  5 files changed, 185 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9c0334ee2ed2..1c0f111ba197 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21933,6 +21933,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/psci.yaml
>  F:	drivers/firmware/psci/
>  F:	drivers/firmware/psci/psci-devices.c
> +F:	drivers/power/reset/psci-reboot-mode.c
>  F:	include/linux/psci.h
>  F:	include/uapi/linux/psci.h
>
> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
> index f1eca61e3269..43e6743202f9 100644
> --- a/drivers/firmware/psci/psci-devices.c
> +++ b/drivers/firmware/psci/psci-devices.c
> @@ -4,19 +4,86 @@
>   */
>
>  #include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/psci.h>
> +#include <linux/slab.h>
> +
> +static void arm_psci_auxiliary_device_release(struct device *dev)
> +{
> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> +
> +	of_node_put(dev->of_node);
> +	kfree(auxdev);
> +}
> +
> +static struct auxiliary_device *
> +arm_psci_auxiliary_device_create(struct device *dev, const char *devname,
> +				 struct device_node *np)
> +{
> +	struct auxiliary_device *auxdev;
> +	int ret;
> +
> +	auxdev = kzalloc_obj(*auxdev);
> +	if (!auxdev)
> +		return NULL;
> +
> +	auxdev->id = 0;
> +	auxdev->name = devname;
> +	auxdev->dev.parent = dev;
> +	auxdev->dev.release = arm_psci_auxiliary_device_release;
> +
> +	if (np)
> +		device_set_node(&auxdev->dev, of_fwnode_handle(of_node_get(np)));
> +
> +	ret = auxiliary_device_init(auxdev);
> +	if (ret) {
> +		of_node_put(auxdev->dev.of_node);
> +		kfree(auxdev);
> +		return NULL;
> +	}
> +
> +	ret = __auxiliary_device_add(auxdev, "arm-psci");
> +	if (ret) {
> +		auxiliary_device_uninit(auxdev);
> +		return NULL;
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy, auxdev);
> +	if (ret)
> +		return NULL;
> +
> +	return auxdev;
> +}
>
>  static int arm_psci_probe(struct platform_device *pdev)
>  {
>  	struct auxiliary_device *auxdev;
> +#ifdef CONFIG_PSCI_REBOOT_MODE
> +	struct device_node *reboot_mode_np = NULL;
> +#endif
>
> -	auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
> -						"psci-cpuidle-domain", NULL, 0);
> +	auxdev = arm_psci_auxiliary_device_create(&pdev->dev,
> +						  "psci-cpuidle-domain",
> +						  pdev->dev.of_node);
>  	if (!auxdev)
>  		return -ENOMEM;
>
> +#ifdef CONFIG_PSCI_REBOOT_MODE
> +	if (psci_has_system_reset2_support())
> +		reboot_mode_np = of_get_child_by_name(pdev->dev.of_node,
> +						      "reboot-mode");
> +
> +	auxdev = arm_psci_auxiliary_device_create(&pdev->dev,
> +						  "psci-reboot-mode",
> +						  reboot_mode_np);
> +	of_node_put(reboot_mode_np);
> +	if (!auxdev)
> +		dev_warn(&pdev->dev, "failed to create PSCI reboot mode device\n");
> +#endif
> +
>  	return 0;
>  }
>
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index bce996bbef28..5c349f41e097 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -360,6 +360,16 @@ config NVMEM_REBOOT_MODE
>  	  then the bootloader can read it and take different
>  	  action according to the mode.
>
> +config PSCI_REBOOT_MODE
> +	bool "PSCI reboot mode driver"
> +	depends on ARM_PSCI_DEVICES
> +	select REBOOT_MODE

Needs: select AUXILIARY_BUS

> +	help
> +	  Say y here to enable the PSCI reboot mode driver. The driver
> +	  registers with the reboot-mode framework to configure PSCI
> +	  reset commands, which are executed by the PSCI driver during
> +	  psci_sys_reset().
> +
>  config POWER_MLXBF
>  	tristate "Mellanox BlueField power handling driver"
>  	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index e31cab4ba78e..45d8aaaffaa1 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -41,5 +41,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>  obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>  obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>  obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>  obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
>  obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
> new file mode 100644
> index 000000000000..bf2dd6626feb
> --- /dev/null
> +++ b/drivers/power/reset/psci-reboot-mode.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>

[

> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kconfig.h>

]

Why are you including these?

Bart

