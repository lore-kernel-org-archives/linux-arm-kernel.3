Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAC2F30922
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEfzI4bwyIyQ5K6mPYSPQqidGNbxC6lZIoIi1I4MKwE=; b=otEf1MeGi9HbFQbQJk6lvCe1jb
	4pR40GYVUexyeCu/J4+31N7X1XNt/lBM3L6slzn5wbus7awHOXgCbM8poZKrAtiPQS222OySZm/dt
	ZDR7GrEAP7E4+ri3qtu3CgcXgcRb37kJKI+k8edg1B3NdAcZAmDlEBZX78MEMHzUG2L+jEEqZaHgz
	VycKZANEwW0BiOW5OJYVWQhMvv4VqYfmr1qQ9iaFfZT5yRwgWNJcmngyCm3Pslzw6QwFr7YZIbvg+
	jnYYDk7mr3CsbLp1bOESJyxVVXs8+9wtMP2hZosx4iV8hhccpTFrI47i4bZiZbRxL5GkgGA5VQyg4
	JEbSCJsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5XO-00000001Uyx-2SZl;
	Thu, 05 Mar 2026 10:02:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5XL-00000001Upu-0Y7C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:02:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B872244728
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 10:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98514C2BCC4
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772704949;
	bh=qancUPGQlWGf8hQxZmA2OZYFGJe2twK4fVy4hczDVK8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Kc38H1iAv9fLqRNrQYjFQV/jfuvCSyDroN7z6gupuUQ2S33kswfJalFOuU/xd3vZN
	 uiRd1zMshnhrfwemnIHd8aW8Y3c2miVrw6/MYstXe/f6Z7jN7ttOK589C9RhQjRG2u
	 X5sZFUcrkutBve7vN5bXPCaTl6W8kU9Se+AW5CrQB599KuLDMMXuyvMgD2q30iXbNc
	 +OjCKpcCWhNzARCiCwIQuk6H8V1HIeTNyH82u6uT1rvoUMj/QqcLlLhRSrx73bFsL6
	 YDKFSFVd4TGkglXomapJE+IcAz4luQ3qAPuBwJig1EIpIPGU6Ph0KDAz51iyGqocRO
	 mtU176lxxg7UQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a1282bc6aaso607061e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 02:02:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXYwo1HuuGQg3qX2bqWLAQDqLaGs72SoRS88wlGuJFjl7SyWB4gF4bOtaUzJQKJ6WMibfCHgZUeAGEB9+FN9ruC@lists.infradead.org
X-Gm-Message-State: AOJu0YyjLjPml1frj2sZffnSXmfVZWvlaxtViIIBJIi1i0NqXtWMiITK
	jTpMHxeaxz8/nsRTtRiI2dgF5lf6m6HNU0Cpp3a6d5ocd+1rG7q9oAI+Qk76DIeR59KHAefUv4R
	Rs1r8CzKs15oFZPpT2WW/omrSher4qd3F+/Sa2VdOIA==
X-Received: by 2002:a05:6512:24c4:20b0:5a1:2f0d:f31b with SMTP id
 2adb3069b0e04-5a12f0df52cmr468009e87.21.1772704946649; Thu, 05 Mar 2026
 02:02:26 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Mar 2026 02:02:25 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Mar 2026 02:02:24 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 02:02:24 -0800
X-Gmail-Original-Message-ID: <CAMRc=MewwLTsaHCOR2iVYZRM6kWptQfZuTe=2i_pfpTwjFKEpQ@mail.gmail.com>
X-Gm-Features: AaiRm50EHWCJJDWv4SLBavCKeEqVwYW6a5qLRhI6LypsfduB5BiXJsaabZSs-7g
Message-ID: <CAMRc=MewwLTsaHCOR2iVYZRM6kWptQfZuTe=2i_pfpTwjFKEpQ@mail.gmail.com>
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, John Stultz <john.stultz@linaro.org>, 
	Moritz Fischer <moritz.fischer@ettus.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_020231_222600_2C085F62 
X-CRM114-Status: GOOD (  37.36  )
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

On Wed, 4 Mar 2026 19:03:06 +0100, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
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

Have you verified that the faux device is actually getting bound? This is not
probe(), you don't supply any faux operations when calling faux_device_create().

You should pass the address of this function in faux_device_ops instead of
calling it directly.

Bartosz

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
>

