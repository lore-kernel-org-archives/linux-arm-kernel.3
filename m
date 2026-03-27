Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A2310ED67F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPPYocuUBXPy2wdG98THSkLN72eWv5yH+XvTNZRpRRU=; b=43NI++lgn1eWOvY/SGhpSESyQX
	/fYawLHkQ6jJuRcw0T2251WMQ4/DefATGrOvgKzaQIcZkEDyHN4MGw3uSNc+dxIsfL5i4dtAPwmGd
	v+wR3JoTGRs9gv4rQwBrP9K45hgA7TWp4RLApYLp0uVhhMedCfa0rS7qmmyUAVXlkcnfVUgIjRIWc
	sMdMNHqaSy4zwhP7IOsEBC6NQc6k99augiXBx0S3A7lD6hKmOBsbqknbGsdtPLPOPsL6XRaKS6ojL
	V4aeIP3VVR8EdcHPdINJLMuYv2+hayIhnIpcTxw4er3pAwZ9xk3zaxlzlu2n/4efV+Gdw8RHhnDkp
	/qQpvceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67xY-00000007a0y-34wj;
	Fri, 27 Mar 2026 14:14:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67xX-00000007a0r-0TFS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AE1260054;
	Fri, 27 Mar 2026 14:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930A1C2BC9E;
	Fri, 27 Mar 2026 14:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620886;
	bh=qPqhXIZEh2rXfAvjqpbkl201qZ8hQu6n4t47C0tLHGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dV7GswrKCep2a8/NuZfNSdQYjFPcjv5a6gK71sp1PUb/A70WKDQTupDeWUrmjO9l9
	 xao4SdEBEWbqIl8lHUVJhXMjJJHEg4Kh+cv3lI52/TwYgVBkmCsEk+pCLMMHeblSxG
	 K2fBf74e61ysAiSZbdzXOx6Ob4Z55TaTbfj8IbLfYRCXi6j7yKm+xJYyzZyICRvD2X
	 lzhr1DwsZaAB6kqKHBlSnYm35ukmqPRp4CG1JFLbeOYQ79fDvk6aAxpiuuYnp7SDj9
	 4Za5ms5/pjGEBMxVPRgXCuR5lY/dIxtv68mEcx4pyY91X6vM7iEAXnEKI85VJVLp21
	 3lahvR5qcugrg==
Date: Fri, 27 Mar 2026 15:14:38 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
Message-ID: <acaQzmVhO50oAbbE@lpieralisi>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
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

On Wed, Mar 04, 2026 at 11:33:06PM +0530, Shivendra Pratap wrote:
> PSCI supports different types of resets like COLD reset, ARCH WARM
> reset, vendor-specific resets. Currently there is no common driver that
> handles all supported psci resets at one place. Additionally, there is
> no common mechanism to issue the supported psci resets from userspace.
> 
> Add a PSCI reboot mode driver and define two types of PSCI resets in the
> driver as reboot-modes: predefined resets controlled by Linux
> reboot_mode and customizable resets defined by SoC vendors in their
> device tree under the psci:reboot-mode node.
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
>  drivers/power/reset/Kconfig            |  10 +++
>  drivers/power/reset/Makefile           |   1 +
>  drivers/power/reset/psci-reboot-mode.c | 119 +++++++++++++++++++++++++++++++++

Add an entry into MAINTAINERS.POWER STATE COORDINATION INTERFACE for this
specific file because I'd like to keep an eye on it, if you don't mind.

Creating a MAINTAINER entry just for this seems overkill to me, it
does not look like it is done for other reboot mode drivers.

Thanks,
Lorenzo

>  3 files changed, 130 insertions(+)
> 
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..529d6c7d3555601f7b7e6199acd29838030fcef2 100644
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
> +          the PSCI reboot mode arguments and passes them to psci
> +	  driver. psci driver uses these arguments for issuing
> +	  device reset into different boot states.
> +
>  config POWER_MLXBF
>  	tristate "Mellanox BlueField power handling driver"
>  	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index 0e4ae6f6b5c55729cf60846d47e6fe0fec24f3cc..49774b42cdf61fd57a5b70f286c65c9d66bbc0cb 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -40,4 +40,5 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>  obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>  obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>  obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>  obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..86bef195228b0924704c2936b99f6801c14ff1b1
> --- /dev/null
> +++ b/drivers/power/reset/psci-reboot-mode.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/device/faux.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/psci.h>
> +#include <linux/reboot.h>
> +#include <linux/reboot-mode.h>
> +#include <linux/types.h>
> +
> +/*
> + * Predefined reboot-modes are defined as per the values
> + * of enum reboot_mode defined in the kernel: reboot.c.
> + */
> +static struct mode_info psci_resets[] = {
> +	{ .mode = "warm", .magic = REBOOT_WARM},
> +	{ .mode = "soft", .magic = REBOOT_SOFT},
> +	{ .mode = "cold", .magic = REBOOT_COLD},
> +};
> +
> +static void psci_reboot_mode_set_predefined_modes(struct reboot_mode_driver *reboot)
> +{
> +	INIT_LIST_HEAD(&reboot->predefined_modes);
> +	for (u32 i = 0; i < ARRAY_SIZE(psci_resets); i++) {
> +		/* Prepare the magic with arg1 as 0 and arg2 as per pre-defined mode */
> +		psci_resets[i].magic = REBOOT_MODE_MAGIC(0, psci_resets[i].magic);
> +		INIT_LIST_HEAD(&psci_resets[i].list);
> +		list_add_tail(&psci_resets[i].list, &reboot->predefined_modes);
> +	}
> +}
> +
> +/*
> + * arg1 is reset_type(Low 32 bit of magic).
> + * arg2 is cookie(High 32 bit of magic).
> + * If reset_type is 0, cookie will be used to decide the reset command.
> + */
> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
> +{
> +	u32 reset_type = REBOOT_MODE_ARG1(magic);
> +	u32 cookie = REBOOT_MODE_ARG2(magic);
> +
> +	if (reset_type == 0) {
> +		if (cookie == REBOOT_WARM || cookie == REBOOT_SOFT)
> +			psci_set_reset_cmd(true, 0, 0);
> +		else
> +			psci_set_reset_cmd(false, 0, 0);
> +	} else {
> +		psci_set_reset_cmd(true, reset_type, cookie);
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int psci_reboot_mode_register_device(struct faux_device *fdev)
> +{
> +	struct reboot_mode_driver *reboot;
> +	int ret;
> +
> +	reboot = devm_kzalloc(&fdev->dev, sizeof(*reboot), GFP_KERNEL);
> +	if (!reboot)
> +		return -ENOMEM;
> +
> +	psci_reboot_mode_set_predefined_modes(reboot);
> +	reboot->write = psci_reboot_mode_write;
> +	reboot->dev = &fdev->dev;
> +
> +	ret = devm_reboot_mode_register(&fdev->dev, reboot);
> +	if (ret) {
> +		dev_err_probe(&fdev->dev, ret, "devm_reboot_mode_register failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __init psci_reboot_mode_init(void)
> +{
> +	struct device_node *psci_np;
> +	struct faux_device *fdev;
> +	struct device_node *np;
> +	int ret;
> +
> +	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> +	if (!psci_np)
> +		return -ENODEV;
> +	/*
> +	 * Look for reboot-mode in the psci node. Even if the reboot-mode
> +	 * node is not defined in psci, continue to register with the
> +	 * reboot-mode driver and let the dev.ofnode be set as NULL.
> +	 */
> +	np = of_find_node_by_name(psci_np, "reboot-mode");
> +
> +	fdev = faux_device_create("psci-reboot-mode", NULL, NULL);
> +	if (!fdev) {
> +		ret = -ENODEV;
> +		goto error;
> +	}
> +
> +	device_set_node(&fdev->dev, of_fwnode_handle(np));
> +	ret = psci_reboot_mode_register_device(fdev);
> +	if (ret)
> +		goto error;
> +
> +	return 0;
> +
> +error:
> +	of_node_put(np);
> +	if (fdev) {
> +		device_set_node(&fdev->dev, NULL);
> +		faux_device_destroy(fdev);
> +	}
> +
> +	return ret;
> +}
> +device_initcall(psci_reboot_mode_init);
> 
> -- 
> 2.34.1
> 

