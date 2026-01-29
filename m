Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC96D358F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 09:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBEuUKm3CTEhZbUSYiZHW4S8x3W6gWJD2S3ajlPUN4Y=; b=g5QoGyiM+9nfzJJ2JzBXto2P6I
	/CwRfm0a7/DelnrkJNqdYxUsbajXI4h9PKrb/cza2hLM9enbWL2KDMZG2fboAJeRt9DjIm+4FFnGC
	PoZ0BO7qGN88E83Ix0DYvv5D/nKzh9se5gq5PReynAMD11AmajlsWJ6yxbWMkX4otVhjy7ZJYJ6cZ
	dFzV+Ccvw09Cwn9Z3q1TPMBZ+oAmHbZpqVtoK4RirLURwa7Hf1IJbFdvDeFp+FPJ5X/Y4QUt4YMBc
	i0Ttj6zHUiyMyi7Euuf/VrIuJL8VfX7+w2JAdjXJ3i5HqsZmLAY8MRJcA0w9ZnUBkQU7Qrjo1IBl3
	bp86QDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOjE-0000000HXGY-379p;
	Thu, 29 Jan 2026 09:54:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOjE-0000000HXGL-0Ti7;
	Thu, 29 Jan 2026 09:54:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FB726001A;
	Thu, 29 Jan 2026 09:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A56C4CEF7;
	Thu, 29 Jan 2026 09:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769680458;
	bh=EnOTj/7CZJ9tyZqdurXyWWI0fv+qLb1PjDZ8+646Wj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uKX7li8JfZPEdKeB1hBz8vBzLGN3uCNhd+sHkwTGTkJD5nNgCGxu88Shq8feblZWM
	 7fb/NUtu1fVDkPOIYo0mlr8zHv9A3KUBNPNnN1Pt50ZycH3lvLgXAl6H7J0xaHtEid
	 rApdiYCn5zrDIUovDT7gonalq6ycUOIABp9ypiyB4yhTDtiWsRx3XOZBjw3xUMqi+A
	 0HkyXHWBY0bPE/9w0XWx+R9T+w4uw4MzzSx1nzr+MWICq1lAr4FInbGkUX55Y2+ZgH
	 LICcilYOu7iiKrVFCMl3SjduswdnI20aCMusYEipXRpakmFazkmWpSEqzOyec3Ck3v
	 OPQKsuwm5Yl5g==
Date: Thu, 29 Jan 2026 09:54:13 +0000
From: Simon Horman <horms@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com,
	p.zabel@pengutronix.de, linux@armlinux.org.uk,
	ghennadi.procopciuc@nxp.com, bogdan-gabriel.roman@nxp.com,
	Ionut.Vicovan@nxp.com, alexandru-catalin.ionita@nxp.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, Frank.li@nxp.com
Subject: Re: [PATCH 2/4] phy: s32g: Add serdes subsystem phy
Message-ID: <aXsuRTZUUnw0kdzV@horms.kernel.org>
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-3-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126092159.815968-3-vincent.guittot@linaro.org>
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

On Mon, Jan 26, 2026 at 10:21:57AM +0100, Vincent Guittot wrote:

...

> diff --git a/drivers/phy/freescale/phy-nxp-s32g-serdes.c b/drivers/phy/freescale/phy-nxp-s32g-serdes.c
> new file mode 100644
> index 000000000000..8336c868c8dc
> --- /dev/null
> +++ b/drivers/phy/freescale/phy-nxp-s32g-serdes.c
> @@ -0,0 +1,569 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/**
> + * SerDes driver for S32G SoCs
> + *
> + * Copyright 2021-2026 NXP
> + */
> +
> +#include <dt-bindings/phy/phy.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>

Hi Vincent, all,

I think that you also need:

#include <linux/iopoll.h>

So that read_poll_timeout() is declared.
Else this patch causes a transient build failure
(for x86_64 allmodconfig)

> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/processor.h>
> +#include <linux/reset.h>
> +#include <linux/units.h>

...

> +static int s32g_serdes_phy_set_mode_ext(struct phy *p,
> +					enum phy_mode mode, int submode)
> +{
> +	struct s32g_serdes *serdes = phy_get_drvdata(p);
> +
> +	if (mode == PHY_MODE_PCIE)
> +		return -EINVAL;

This is part of an AI Generated review.
I have looked over it and I think it warrants investigation.
For information on how to reproduce locally, as I did, please see [1].

[1] https://netdev-ai.bots.linux.dev/ai-local.html

  This returns error if mode IS PHY_MODE_PCIE, but this is a PCIe PHY!
  This looks like a typo. Should be !=.

> +
> +	if (!is_pcie_phy_mode_valid(submode))
> +		return -EINVAL;
> +
> +	/*
> +	 * Do not configure SRIS or CRSS PHY MODE in conjunction
> +	 * with any SGMII mode on the same SerDes subsystem
> +	 */
> +	if ((submode == CRSS || submode == SRIS) &&
> +	    serdes->ctrl.ss_mode != 0)
> +		return -EINVAL;
> +
> +	/*
> +	 * Internal reference clock cannot be used with either Common clock
> +	 * or Spread spectrum, leaving only SRNSS
> +	 */
> +	if (submode != SRNS &&  !serdes->ctrl.ext_clk)
> +		return -EINVAL;
> +
> +	serdes->pcie.phy_mode = submode;

The AI review also suggested that it may be unsafe
to set the submode after s32g_serdes_phy_power_on()
has been called. And that there is nothing preventing that.

TBH, I am unsure if either of those statements are true.
But it seems worth validating with you.

> +
> +	return 0;
> +}

...

> +static int s32g_serdes_get_ctrl_resources(struct platform_device *pdev, struct s32g_serdes *serdes)
> +{
> +	struct s32g_serdes_ctrl *ctrl = &serdes->ctrl;
> +	struct device *dev = &pdev->dev;
> +	int ret, idx;
> +
> +	ret = of_property_read_u32(dev->of_node, "nxp,sys-mode",
> +				   &ctrl->ss_mode);
> +	if (ret) {
> +		dev_err(dev, "Failed to get SerDes subsystem mode\n");
> +		return -EINVAL;
> +	}
> +
> +	if (ctrl->ss_mode > S32G_SERDES_MODE_MAX) {
> +		dev_err(dev, "Invalid SerDes subsystem mode %u\n",
> +			ctrl->ss_mode);
> +		return -EINVAL;
> +	}
> +
> +	ctrl->ss_base = devm_platform_ioremap_resource_byname(pdev, "ss_pcie");
> +	if (IS_ERR(ctrl->ss_base)) {
> +		dev_err(dev, "Failed to map 'ss_pcie'\n");
> +		return PTR_ERR(ctrl->ss_base);
> +	}
> +
> +	ctrl->rst = devm_reset_control_get(dev, "serdes");
> +	if (IS_ERR(ctrl->rst))
> +		return dev_err_probe(dev, PTR_ERR(ctrl->rst),
> +				     "Failed to get 'serdes' reset control\n");
> +
> +	ctrl->nclks = devm_clk_bulk_get_all(dev, &ctrl->clks);
> +	if (ctrl->nclks < 1)
> +		return dev_err_probe(dev, ctrl->nclks,
> +				     "Failed to get SerDes clocks\n");

If devm_clk_bulk_get_all returns 0 then this value will
be passed to dev_err_probe(). And 0 will, in turn be returned by
dev_err_probe() and this function. However, that will be treated
as success by the caller, even though this is an error condition.

Perhaps something like this is more appropriate if ctrl->nclks
must be greater than 0. (Completely untested!)

	if (ctrl->nclks < 1) {
		ret = ctrl->nclks ? : -EINVAL;
		return dev_err_probe(dev, ret,
				     "Failed to get SerDes clocks\n");
	}

Flagged by Smatch.

...

> +static int s32g_serdes_parse_lanes(struct device *dev, struct s32g_serdes *serdes)
> +{
> +	int ret;
> +
> +	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> +		ret = s32g2_serdes_create_phy(serdes, of_port);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;

Perhaps it cannot occur.
But if the loop above iterates zero times,
then ret will be used uninitialised here.

Also flagged by Smatch.

> +}
> +
> +static int s32g_serdes_probe(struct platform_device *pdev)
> +{
> +	struct s32g_serdes *serdes;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	serdes = devm_kzalloc(dev, sizeof(*serdes), GFP_KERNEL);
> +	if (!serdes)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, serdes);
> +	serdes->dev = dev;
> +
> +	ret = s32g_serdes_get_ctrl_resources(pdev, serdes);
> +	if (ret)
> +		return ret;
> +
> +	ret = s32g_serdes_get_pcie_resources(pdev, serdes);
> +	if (ret)
> +		return ret;
> +
> +	ret = s32g_serdes_parse_lanes(dev, serdes);
> +	if (ret)
> +		return ret;

The I review also says:

  The probe function calls s32g_serdes_init() which enables clocks,
  configures hardware, and deasserts reset. However,
  s32g_serdes_parse_lanes() creates PHY providers via
  devm_of_phy_provider_register().

  Problem: PHY consumers can start calling PHY ops (like power_on) as soon
  as the provider is registered, but the hardware isn't initialized until
  s32g_serdes_init() runs afterward. This creates a race window.

  Recommendation: Move s32g_serdes_init() before s32g_serdes_parse_lanes().

> +
> +	ret = s32g_serdes_init(serdes);
> +
> +	return ret;

nit: This could be more succinctly written as:

	return s32g_serdes_init(serdes);

> +}

...

