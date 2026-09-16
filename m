Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30976C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbNOQo+fITL/YezhDRnlIYKOUp70KJL8OxpPSgtnAR4=; b=LrE5m97j20zIx8nTkaTW3+dZRl
	1CcVMyZxd6dnAz1BO1aFt7fyJBApKwxC832ZpjO8MNdAkRVQYlnxGwidTOfO2RVJPwzwfBsgGrHeW
	GZppvXxzHnB97r3NyZuPi8IwIAQA7YufgadVeSBHHuFNGgBh6/+Hp67zFIDM1LRijaBN0DxyLItCZ
	vv2ZCetp4Qluz8RSvPzIF06MaG5dtglPYsY8K3jaxE7xi9Twx149DFgQZZQ32Zz6BXJ7TwvNOBhaf
	zPE2VpjmeIrmSPgNqjzgReL1X9vwBeO7jex9wYAgHKfO9D/UgqnquJBTfpirAKKQMzElepi8u9AKC
	u0BFxJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lxj-00000008q2S-2ulQ;
	Wed, 16 Sep 2026 09:29:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lxi-00000008q2E-0UKm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:29:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B3F2143858
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947D81F00898
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789550993;
	bh=HbNOQo+fITL/YezhDRnlIYKOUp70KJL8OxpPSgtnAR4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=RXGN6Q6OG3ZqmOA+EqOmYMjzyXsouT9/duqse6VVDy6txHKqr4rsi+IwqT7Nbrz47
	 k8Z51jWHxL/XUhmUR7t+S3foO9mlS/tSggJOpQVFfcHqXbWS8CpBwCWxmcACeDF2aj
	 BxpkRO7bmpj1nhb4WegvhExiNrSZqAnhu0H3xjIBcZ2dzHV6+ceLNSmsoGa/aEjwKD
	 OgoAUxAUzLHvJjUOF9Tbh1Ox/3/knMWDyVQT600LmsSKHRFcZZFAgL1BSh+RJrSl7I
	 om2+u+TJVVTY7GeNqPDsgFptzqcmTTynlhkkxA1JfsslXkuVOGr50PDDnKikS1vCh1
	 Dazs1KLksmMIA==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a49bc59559so4877661fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 02:29:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9+8/4nx3IsopIuSNTvXUvivayup5XovT1x7cRm9iRvd1CCEbhrQsFSMVXw/TJ3u1LrfRtyM6mHVXqk4hQ0E9f@lists.infradead.org
X-Gm-Message-State: AFuF++ntglF/PXlQLplfmeDdCuzB+mWZvezvWM4xNMdiy61FD7PH+SG2
	tLB8P+Fjt0cHlgnQE3OEB0BUrkhRcn6YwHqYbI6ikgDjd13bRJf3sBS6xCo583x9G0XH07v8vOh
	KDUocoVgF+jc/BekYu0ujQu2muzvZz/+EUfZ8xBHhfQ==
X-Received: by 2002:a05:651c:2107:b0:3a5:a106:ee0 with SMTP id
 38308e7fff4ca-3a5dca17909mr3885151fa.24.1789550992173; Wed, 16 Sep 2026
 02:29:52 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 04:29:50 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 04:29:50 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 04:29:50 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdCWHQZ+CgW05jYA1GGJdMUwKJEBAiAvRCvx=UqvjLiUg@mail.gmail.com>
X-Gm-Features: AcwNN1XQMfOQSPN80c7M_tcu2-hP7ZzKFwZrSM1EUb4ujYz2zvehzw9bQteJEXc
Message-ID: <CAMRc=MdCWHQZ+CgW05jYA1GGJdMUwKJEBAiAvRCvx=UqvjLiUg@mail.gmail.com>
Subject: Re: [PATCH v25 04/10] firmware: psci: Add support for PSCI auxiliary devices
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

On Mon, 14 Sep 2026 16:59:08 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
> introduced, would also need to bind in the same way, leading to multiple
> drivers attached to a single device node.
>
> Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
> and registers PSCI child devices on the auxiliary bus. As the first
> user, register cpuidle-psci-domain as an auxiliary device.
>
> Update cpuidle-psci-domain to probe as an auxiliary driver and use
> the PSCI device node for power-domain traversal.
>
> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  MAINTAINERS                           |  1 +
>  drivers/cpuidle/Kconfig.arm           |  1 +
>  drivers/cpuidle/cpuidle-psci-domain.c | 31 +++++++++++++++-----------
>  drivers/firmware/psci/Kconfig         | 14 ++++++++++++
>  drivers/firmware/psci/Makefile        |  1 +
>  drivers/firmware/psci/psci-devices.c  | 41 +++++++++++++++++++++++++++++++++++
>  6 files changed, 76 insertions(+), 13 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 207a6e2db70c..9c0334ee2ed2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21932,6 +21932,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/psci.yaml
>  F:	drivers/firmware/psci/
> +F:	drivers/firmware/psci/psci-devices.c
>  F:	include/linux/psci.h
>  F:	include/uapi/linux/psci.h
>
> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
> index b88b01aa5829..f22e18b05053 100644
> --- a/drivers/cpuidle/Kconfig.arm
> +++ b/drivers/cpuidle/Kconfig.arm
> @@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
>  	bool "PSCI CPU idle Domain"
>  	depends on ARM_PSCI_CPUIDLE
>  	depends on PM_GENERIC_DOMAINS_OF
> +	depends on ARM_PSCI_DEVICES
>  	select DT_IDLE_GENPD
>  	default y
>  	help
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index b9e4ad7d43a3..0ce6a83f6588 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -9,10 +9,11 @@
>
>  #define pr_fmt(fmt) "CPUidle PSCI: " fmt
>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/cpu.h>
>  #include <linux/device.h>
>  #include <linux/kernel.h>
> -#include <linux/platform_device.h>
> +#include <linux/module.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/psci.h>
> @@ -122,14 +123,10 @@ static void psci_pd_remove(void)
>  	}
>  }
>
> -static const struct of_device_id psci_of_match[] = {
> -	{ .compatible = "arm,psci-1.0" },
> -	{}
> -};
> -
> -static int psci_cpuidle_domain_probe(struct platform_device *pdev)
> +static int psci_cpuidle_domain_probe(struct auxiliary_device *auxdev,
> +				     const struct auxiliary_device_id *id)
>  {
> -	struct device_node *np = pdev->dev.of_node;
> +	struct device_node *np = auxdev->dev.of_node;
>  	bool use_osi = psci_has_osi_support();
>  	int ret = 0, pd_count = 0;
>
> @@ -177,16 +174,24 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>  	return ret;
>  }
>
> -static struct platform_driver psci_cpuidle_domain_driver = {
> -	.probe  = psci_cpuidle_domain_probe,
> +static const struct auxiliary_device_id psci_cpuidle_domain_id_table[] = {
> +	{ .name = "arm-psci.psci-cpuidle-domain" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, psci_cpuidle_domain_id_table);
> +
> +static struct auxiliary_driver psci_cpuidle_domain_driver = {
> +	.probe = psci_cpuidle_domain_probe,
>  	.driver = {
> -		.name = "psci-cpuidle-domain",
> -		.of_match_table = psci_of_match,
> +		.suppress_bind_attrs = true,
>  	},
> +	.id_table = psci_cpuidle_domain_id_table,
>  };
>
>  static int __init psci_idle_init_domains(void)
>  {
> -	return platform_driver_register(&psci_cpuidle_domain_driver);
> +	return __auxiliary_driver_register(&psci_cpuidle_domain_driver,
> +					   THIS_MODULE,
> +					   "psci-cpuidle-domain");
>  }
>  core_initcall(psci_idle_init_domains);
> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
> index 97944168b5e6..68e381f1a618 100644
> --- a/drivers/firmware/psci/Kconfig
> +++ b/drivers/firmware/psci/Kconfig
> @@ -2,6 +2,20 @@
>  config ARM_PSCI_FW
>  	bool
>
> +config ARM_PSCI_DEVICES
> +	bool "PSCI auxiliary device support"
> +	depends on ARM_PSCI_FW
> +	depends on OF
> +	select AUXILIARY_BUS
> +	default y
> +	help
> +	  Say Y here to enable auxiliary device support for PSCI.
> +
> +	  This creates auxiliary devices for PSCI functionality implemented
> +	  outside the core PSCI firmware driver. These devices allow PSCI
> +	  child drivers to bind through the auxiliary bus while sharing the
> +	  PSCI firmware device as their parent.
> +
>  config ARM_PSCI_CHECKER
>  	bool "ARM PSCI checker"
>  	depends on ARM_PSCI_FW && HOTPLUG_CPU && CPU_IDLE && !TORTURE_TEST
> diff --git a/drivers/firmware/psci/Makefile b/drivers/firmware/psci/Makefile
> index 1956b882470f..8e75a0ed6f74 100644
> --- a/drivers/firmware/psci/Makefile
> +++ b/drivers/firmware/psci/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  obj-$(CONFIG_ARM_PSCI_FW)	+= psci.o
> +obj-$(CONFIG_ARM_PSCI_DEVICES)	+= psci-devices.o
>  obj-$(CONFIG_ARM_PSCI_CHECKER)	+= psci_checker.o
> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
> new file mode 100644
> index 000000000000..f1eca61e3269
> --- /dev/null
> +++ b/drivers/firmware/psci/psci-devices.c
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/init.h>

I think you need module.h not init.h.

> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +static int arm_psci_probe(struct platform_device *pdev)
> +{
> +	struct auxiliary_device *auxdev;
> +
> +	auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
> +						"psci-cpuidle-domain", NULL, 0);
> +	if (!auxdev)
> +		return -ENOMEM;
> +
> +	return 0;
> +}

I would prefer you to move the code between the patches a bit. This patch
should already be introducing the full, future-proof infrastructure for
registering multiple auxiliary devices, so maybe add a static table with device
info? Then in patch 10/10 you'd just extend it for reboot modes.

I'd also not add any ifdef guards here and lesses the build-time dependencies.
You can register the device alright, it just won't get probed if the reboot-mode
support is not there.

Bart

> +
> +static const struct of_device_id arm_psci_of_match[] = {
> +	{ .compatible = "arm,psci-1.0" },
> +	{ }
> +};
> +
> +static struct platform_driver arm_psci_driver = {
> +	.probe = arm_psci_probe,
> +	.driver = {
> +		.name = "arm-psci",
> +		.of_match_table = arm_psci_of_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +
> +static int __init arm_psci_init(void)
> +{
> +	return platform_driver_register(&arm_psci_driver);
> +}
> +core_initcall(arm_psci_init);
>
> --
> 2.34.1
>
>

