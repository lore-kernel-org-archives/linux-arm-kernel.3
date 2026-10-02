Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767DFCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sE8bXXV2aYl7I0eHUtl6v66dSznCvnKz176VEoS4MxE=; b=oXIAytGEcvggxPHL3M2lSiyHUk
	oajXXCHbNyovAvoLdqbakGQZ6qMSi8UclpgZpRtRNk6iWCTWu+CVpp0J9I3U08ucRvDeGFyVxuXYY
	DoxHLYpru2JE4B1tadyQ6nTgXACD+rogvIY59epFBGV+yD4J5FHvy2NX9cKWBbQ8NGfcUYg94sJz/
	8omtzNJmNGCQd1W9yu4nouSzdZqouJFm/hAzTu1QzNPC50eQGgwyI5WrqWWs6lTg5QA1PqNkDdrWn
	oR8D4M2w6lQYRDpp8HV8G4sKPssdbZ5FpXHAiQexm4FBPMD9Ja0H3tKEqT/zjCcBjRPFUVi0Exi/a
	uUszi2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdLq-0000000BfT8-3INh;
	Fri, 02 Oct 2026 13:31:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdLo-0000000BfT2-3x7y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:31:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 35D2043D09
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 13:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143E81F008A4
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 13:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790947860;
	bh=sE8bXXV2aYl7I0eHUtl6v66dSznCvnKz176VEoS4MxE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=c08MIF6TFp30XoozLY7hPI62jW6F4+6WRpgGc2EtmTP+G4FwJQVXYA/eGHiXdPDvw
	 PFdVCsOa/uGQ1MT0aLyDNlZImI/l0vr4SnlEApZXHOvkx2lahiHpGecTGwvILw7Oco
	 +KB7mdwVnROvDiqP7l+wEFso8/6SJCodlQvs027oUr/pthm9oWwrIK4RscxB77l2Ot
	 KAiZ1jGEy8NOKqSSZZVLs+ecAO3afa5565KAiyHSGeWOBHseDy8THd0kDgn32c+JTe
	 iRSXH9OqMboU/QkNoNu1UNRK7aBpkBhGY+UeA/I6UkvWr4Q/EUNL2k+r8pigRgYbV2
	 kO+du45rxPing==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a782bdc1dbso19188851fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 06:30:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwISmMThglxBWHuhqgBFr9UTkiBekz5ii1pJNfM+w0NxC0oLSJiO4xmqEyoGPHQBz36XAyz605Gz3sqbnBUWTTU@lists.infradead.org
X-Gm-Message-State: AFq9FYLJRMC56EAm2LqEmcJvn3vWY4W7t43Djh4ckFOClHOZMTDsVZMN
	RTcNOYgJmpBWahjM6r9bRyZ1/MkGumhpcsDzWIXpV1auFenfBhvbVRswrdHw/qmQEDztPOw7xVe
	M4w2nSb7uiXgt9bUpKZrl/mp6pQkRzD9dNJuHu4aEUQ==
X-Received: by 2002:a2e:9fc6:0:b0:3a6:10d4:61c4 with SMTP id
 38308e7fff4ca-3a887813cd1mr7252281fa.28.1790947858689; Fri, 02 Oct 2026
 06:30:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 16:30:57 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 16:30:57 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-6-b24e2348e8e1@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
 <20260928-arm-psci-system_reset2-vendor-reboots-v26-6-b24e2348e8e1@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 16:30:57 +0300
X-Gmail-Original-Message-ID: <CAMRc=MdSfBvZF4UJm=eBBD-GAJD7oFw3e+6UJeoXgidoPGzm-w@mail.gmail.com>
X-Gm-Features: AclHuK9NRrBpOxbdKY64qOqdzxHen1rX4zRRIEbqfUSn0FJYeFcgfvAtIpYZWTI
Message-ID: <CAMRc=MdSfBvZF4UJm=eBBD-GAJD7oFw3e+6UJeoXgidoPGzm-w@mail.gmail.com>
Subject: Re: [PATCH v26 06/10] power: reset: Add psci-reboot-mode driver
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulf.hansson@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>
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

On Mon, 28 Sep 2026 08:09:18 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
> there is no common driver that handles all supported psci resets at one
> place. Additionally, there is no common mechanism to issue the supported
> psci resets from userspace.
>
> Add psci-reboot-mode as an auxiliary device created by the psci-devices
> driver. Define two types of PSCI resets, predefined-resets and
> vendor-specific resets. Predefined-resets are defined by psci driver
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
>  drivers/firmware/psci/psci-devices.c   |   4 ++
>  drivers/power/reset/Kconfig            |  11 ++++
>  drivers/power/reset/Makefile           |   1 +
>  drivers/power/reset/psci-reboot-mode.c | 104 +++++++++++++++++++++++++++++++++
>  5 files changed, 121 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 70a11f2ff61d..1007d5cd2e13 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22058,6 +22058,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/psci.yaml
>  F:	drivers/firmware/psci/
> +F:	drivers/power/reset/psci-reboot-mode.c
>  F:	include/linux/psci.h
>  F:	include/uapi/linux/psci.h
>
> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
> index d23befc490ed..04f24b8d9943 100644
> --- a/drivers/firmware/psci/psci-devices.c
> +++ b/drivers/firmware/psci/psci-devices.c
> @@ -20,6 +20,10 @@ static const struct arm_psci_device_info arm_psci_devices[] = {
>  	{
>  		.name = "psci-cpuidle-domain",
>  	},
> +	{
> +		.name = "psci-reboot-mode",
> +		.of_node_name = "reboot-mode",
> +	},
>  };
>
>  static void arm_psci_auxiliary_device_release(struct device *dev)
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index bce996bbef28..f165a41d40ed 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -360,6 +360,17 @@ config NVMEM_REBOOT_MODE
>  	  then the bootloader can read it and take different
>  	  action according to the mode.
>
> +config PSCI_REBOOT_MODE
> +	bool "PSCI reboot mode driver"
> +	depends on ARM_PSCI_DEVICES
> +	select AUXILIARY_BUS
> +	select REBOOT_MODE
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
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kconfig.h>

Huh?

With that removed:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

