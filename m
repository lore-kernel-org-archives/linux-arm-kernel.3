Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C92C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 11:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXfeL69njth1gQEctlUblNfdQfmto+YptObUfIhDkjM=; b=TiTFWT/Q0oHp+0gRaTRly0+vK6
	3/e98nOVOxt334+MURlijrJLoXZaMqZ3VUeH81+n6JfzuL7GwziKiE58sfAXPylwGUqAwp5zuVqRi
	ski6SKcUGhcdxTpO5Qo5ELzetuRWVaTlVM2fUDAItgg2RG4qJuElu9enVB3BHZZ66jY4pPyZkhclt
	bV1fQc/Z3hU2GTI6ImEgfoB2RLcCQf7i/q5RoJUjvhLMPgHoiK1mAXmD0EhJFAeTEC01G1iBUgp20
	MF0wvR48ubIqaGMiHLwYCxi8VpK/SltXvR547ZXY8Y4H/Ryi0NeLWk+6KFHDzoBK2xi6lG5Nzs+8Z
	ABzyhOYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zp5-000000099OT-3tbX;
	Mon, 31 Aug 2026 11:05:07 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zp3-000000099Nt-1i6K;
	Mon, 31 Aug 2026 11:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788174306; x=1819710306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YPMj4lSvftoy2mPSE2BoRYZKbnYiULh2Q6DhbTrJd2Y=;
  b=R/ZXyGK1Zdch0boXaQyMzwCdxJuMYDJ6fXPsnVbAUmBmwt/Edy7L4oTI
   snieILtod4eM30UuI2vSXIz4e/HlpNyHjlS93VKX0P//LdkmCayArf3x3
   RA6Vc0DQlMB3wyuRNLWQYp6yA7dQuhn5Q29Fb2k/XJqMcNkZjUY0xEb/w
   R16St3Huw4QjLi8VHuW7x/QMMc+gtqMYvVLSaJlmY/pLgBLihHLELetpH
   o3mgs31x0zY2dXcOadC4ZG1BLOtG8wur80L6kz/fPkJfvNKzWvE7GC39J
   nJdL2Gckv+mIj6dcxrk0rzw6Fe2pz26JhLJZzyMwQQw78E6W1Pla2c0ur
   A==;
X-CSE-ConnectionGUID: kv8PxsyXQwOvXZzn9YIivQ==
X-CSE-MsgGUID: wc41faTXROuXIXg3h4oOOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88431701"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88431701"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:05:03 -0700
X-CSE-ConnectionGUID: 7zOKNvibTQCwcwcmNeMpVA==
X-CSE-MsgGUID: v38GUscTSeeAtaGg45E8sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292272041"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 31 Aug 2026 04:04:58 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id F058E99; Mon, 31 Aug 2026 13:04:56 +0200 (CEST)
Date: Mon, 31 Aug 2026 13:04:56 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Marek Vasut <marex@nabladev.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 06/16] usb: typec: add FUSB340 SuperSpeed switch driver
Message-ID: <apVf2GL-r0Cm8Q53@black.igk.intel.com>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-6-c5e27cbc0795@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-6-c5e27cbc0795@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_040505_522694_1F800C61 
X-CRM114-Status: GOOD (  31.49  )
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

On Fri, Aug 21, 2026 at 06:23:17PM +0200, Fabrice Gasnier wrote:
> Add a platform driver for the ON Semiconductor FUSB340 SuperSpeed switch.
> The driver uses enable-gpios and select-gpios to control the switch and
> registers Type-C switch and mux providers for Type-C applications where a
> reversible cable requires a switch.
> 
> Assisted-by: GitHub-Copilot:GPT-5.4-mini
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/usb/typec/mux/Kconfig   |   8 ++
>  drivers/usb/typec/mux/Makefile  |   1 +
>  drivers/usb/typec/mux/fusb340.c | 169 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 178 insertions(+)

> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> index 6dd8f961b593..6a1da48a2a8f 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -12,6 +12,14 @@ config TYPEC_MUX_FSA4480
>  	  common USB Type-C connector.
>  	  If compiled as a module, the module will be named fsa4480.
>  
> +config TYPEC_MUX_FUSB340
> +	tristate "ON Semi FUSB340 SuperSpeed switch driver"
> +	help
> +	  Driver for the ON Semiconductor FUSB340 SuperSpeed switch, which
> +	  provides support for routing SuperSpeed pairs in Type-C applications
> +	  where a reversible cable requires a switch.
> +	  If compiled as a module, the module will be named fusb340.
> +
>  config TYPEC_MUX_GPIO_SBU
>  	tristate "Generic GPIO based SBU mux for USB Type-C applications"
>  	help

Why can't you just use MUX_GPIO_SBU (sorry if I've missed something)?

Thanks,

> diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
> index b4f599eb5053..ef8d2b05ff7f 100644
> --- a/drivers/usb/typec/mux/Makefile
> +++ b/drivers/usb/typec/mux/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  obj-$(CONFIG_TYPEC_MUX_FSA4480)		+= fsa4480.o
> +obj-$(CONFIG_TYPEC_MUX_FUSB340)		+= fusb340.o
>  obj-$(CONFIG_TYPEC_MUX_GPIO_SBU)	+= gpio-sbu-mux.o
>  obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+= pi3usb30532.o
>  obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)	+= intel_pmc_mux.o
> diff --git a/drivers/usb/typec/mux/fusb340.c b/drivers/usb/typec/mux/fusb340.c
> new file mode 100644
> index 000000000000..0f0e45743784
> --- /dev/null
> +++ b/drivers/usb/typec/mux/fusb340.c
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ON Semiconductor FUSB340 SuperSpeed switch driver
> + *
> + * Copyright (C) 2026 STMicroelectronics
> + */
> +
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/usb/typec_altmode.h>
> +#include <linux/usb/typec_mux.h>
> +
> +struct fusb340 {
> +	struct gpio_desc *enable_gpio;
> +	struct gpio_desc *select_gpio;
> +	struct mutex lock; /* serialize orientation and mode updates */
> +	struct typec_switch_dev *sw;
> +	struct typec_mux_dev *mux;
> +	enum typec_orientation orientation;
> +	unsigned long mode;
> +};
> +
> +static void fusb340_update_locked(struct fusb340 *fusb)
> +{
> +	bool enable = fusb->mode == TYPEC_STATE_USB &&
> +		      fusb->orientation != TYPEC_ORIENTATION_NONE;
> +	bool select = fusb->orientation == TYPEC_ORIENTATION_REVERSE;
> +
> +	gpiod_set_value_cansleep(fusb->enable_gpio, enable);
> +	gpiod_set_value_cansleep(fusb->select_gpio, select);
> +}
> +
> +static int fusb340_switch_set(struct typec_switch_dev *sw,
> +			      enum typec_orientation orientation)
> +{
> +	struct fusb340 *fusb = typec_switch_get_drvdata(sw);
> +
> +	mutex_lock(&fusb->lock);
> +
> +	if (fusb->orientation != orientation) {
> +		fusb->orientation = orientation;
> +		fusb340_update_locked(fusb);
> +	}
> +
> +	mutex_unlock(&fusb->lock);
> +
> +	return 0;
> +}
> +
> +static int fusb340_mux_set(struct typec_mux_dev *mux,
> +			   struct typec_mux_state *state)
> +{
> +	struct fusb340 *fusb = typec_mux_get_drvdata(mux);
> +	int ret = 0;
> +
> +	mutex_lock(&fusb->lock);
> +
> +	if (state->mode != TYPEC_STATE_SAFE && state->mode != TYPEC_STATE_USB) {
> +		ret = -EOPNOTSUPP;
> +		goto out_unlock;
> +	}
> +
> +	if (fusb->mode != state->mode) {
> +		fusb->mode = state->mode;
> +		fusb340_update_locked(fusb);
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&fusb->lock);
> +
> +	return ret;
> +}
> +
> +static int fusb340_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct typec_switch_desc sw_desc = { };
> +	struct typec_mux_desc mux_desc = { };
> +	struct fusb340 *fusb;
> +	int ret;
> +
> +	fusb = devm_kzalloc(dev, sizeof(*fusb), GFP_KERNEL);
> +	if (!fusb)
> +		return -ENOMEM;
> +
> +	fusb->orientation = TYPEC_ORIENTATION_NONE;
> +	fusb->mode = TYPEC_STATE_SAFE;
> +
> +	fusb->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(fusb->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(fusb->enable_gpio),
> +				     "failed to get enable gpio\n");
> +
> +	fusb->select_gpio = devm_gpiod_get(dev, "select", GPIOD_OUT_LOW);
> +	if (IS_ERR(fusb->select_gpio))
> +		return dev_err_probe(dev, PTR_ERR(fusb->select_gpio),
> +				     "failed to get select gpio\n");
> +
> +	mutex_init(&fusb->lock);
> +
> +	sw_desc.drvdata = fusb;
> +	sw_desc.fwnode = dev_fwnode(dev);
> +	sw_desc.set = fusb340_switch_set;
> +
> +	fusb->sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(fusb->sw)) {
> +		ret = dev_err_probe(dev, PTR_ERR(fusb->sw),
> +				    "failed to register typec switch\n");
> +		goto err_mutex_destroy;
> +	}
> +
> +	mux_desc.drvdata = fusb;
> +	mux_desc.fwnode = dev_fwnode(dev);
> +	mux_desc.set = fusb340_mux_set;
> +
> +	fusb->mux = typec_mux_register(dev, &mux_desc);
> +	if (IS_ERR(fusb->mux)) {
> +		ret = dev_err_probe(dev, PTR_ERR(fusb->mux),
> +				    "failed to register typec mux\n");
> +		goto err_unregister_switch;
> +	}
> +
> +	platform_set_drvdata(pdev, fusb);
> +
> +	return 0;
> +
> +err_unregister_switch:
> +	typec_switch_unregister(fusb->sw);
> +err_mutex_destroy:
> +	mutex_destroy(&fusb->lock);
> +	return ret;
> +}
> +
> +static void fusb340_remove(struct platform_device *pdev)
> +{
> +	struct fusb340 *fusb = platform_get_drvdata(pdev);
> +
> +	gpiod_set_value_cansleep(fusb->enable_gpio, 0);
> +	gpiod_set_value_cansleep(fusb->select_gpio, 0);
> +
> +	typec_mux_unregister(fusb->mux);
> +	typec_switch_unregister(fusb->sw);
> +	mutex_destroy(&fusb->lock);
> +}
> +
> +static const struct of_device_id fusb340_of_match[] = {
> +	{ .compatible = "onnn,fusb340" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, fusb340_of_match);
> +
> +static struct platform_driver fusb340_driver = {
> +	.probe = fusb340_probe,
> +	.remove = fusb340_remove,
> +	.driver = {
> +		.name = "fusb340",
> +		.of_match_table = fusb340_of_match,
> +	},
> +};
> +module_platform_driver(fusb340_driver);
> +
> +MODULE_DESCRIPTION("ON Semiconductor FUSB340 SuperSpeed switch driver");
> +MODULE_AUTHOR("Fabrice Gasnier <fabrice.gasnier@foss.st.com>");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.43.0

-- 
heikki

