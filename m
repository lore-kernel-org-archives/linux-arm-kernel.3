Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B793C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 13:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57RWwzvbEDf7DvtJW9GsWV6QWqUGcL9KWR4klLOP/3A=; b=MoKbLIRsD9hnowckEiyNYlYYAX
	VOqkfBp3K5k89GsJZi0cWEJyxJ67JEesmJKDTFVG/+1HU2KY4mnlExTw8z6h8f2qEGjaFZlGfCmoE
	+5pKZ621KzqRTneM7LxFu0rN6z5vJLNbz5LSRGltRxmvIZlHbi8VrnpZ3aiRk/MtzcRlo5HMGTKtO
	RF1yVPwz6iNvYtFTWbHZZ0GFt+upL8VwU+f9sdMy0qlpOloASy7cM7yzqyw0d1LHrQyqD7J9kezpP
	w47yGczqtnq0p2LzP0zoRShUanY0r6REtmNmheh8oPkjeQgEZd2Tn0Fo2DW49nPjh4M9/u68SeFAa
	+vfOzlug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OrX-0000000CFdC-1niO;
	Tue, 01 Sep 2026 13:49:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OrV-0000000CFcn-1CDt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 13:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=57RWwzvbEDf7DvtJW9GsWV6QWqUGcL9KWR4klLOP/3A=; b=BmPHjLdmp5W9SZiMNWvuxvdjCj
	Wa9un9M1cecMTXAQROipZ+eaiy+P0Ic3OnFb76MwkN2bBLa66Z6TuTC3TsfDt94pdBw0UaGoMBezy
	B3I32EJxW+9swJ09kjtNwPPvdOjptdI793sgwStqwh+HAIQ1q8OVQRXfODOcjrhAH7f8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1OrA-002Mbr-FD; Tue, 01 Sep 2026 15:48:56 +0200
Date: Tue, 1 Sep 2026 15:48:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add UltraRISC DP1000 GMAC
 support
Message-ID: <910be156-b631-4b62-972a-79d9a9e38697@lunn.ch>
References: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
 <20260901-dwmac-ultrarisc-v1-3-f19454814bcf@ultrarisc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-dwmac-ultrarisc-v1-3-f19454814bcf@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_064917_323069_4B62E8B0 
X-CRM114-Status: GOOD (  17.64  )
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

> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * UltraRISC DWMAC platform driver
> + *
> + * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/phy.h>
> +#include <linux/platform_device.h>
> +
> +#include "stmmac_platform.h"
> +
> +static int ultrarisc_dwmac_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get resources\n");
> +
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return dev_err_probe(dev, PTR_ERR(plat_dat), "failed to parse DT parameters\n");
> +
> +	plat_dat->phy_interface =
> +		phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface, true, true);
> +	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
> +		return dev_err_probe(dev, -EINVAL, "unsupported phy interface mode\n");
> +
> +	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
> +}
> +
> +static const struct of_device_id ultrarisc_dwmac_match[] = {
> +	{ .compatible = "ultrarisc,dp1000-gmac" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ultrarisc_dwmac_match);
> +
> +static struct platform_driver ultrarisc_dwmac_driver = {
> +	.probe = ultrarisc_dwmac_probe,
> +	.driver = {
> +		.name = "ultrarisc-dwmac",
> +		.pm = &stmmac_pltfr_pm_ops,
> +		.of_match_table = ultrarisc_dwmac_match,
> +	},
> +};
> +module_platform_driver(ultrarisc_dwmac_driver);
> +
> +MODULE_DESCRIPTION("UltraRISC DWMAC platform driver");
> +MODULE_LICENSE("GPL");

This looks to be 90% identical to dwmac-sophgo.c.

Do you expect any further changes to this driver? Is everything
supported? Are there more clocks? A GPIO for WoL?

I'm just wondering if the common code should be pulled out, or even
dwmac-sophgo.c made generic so it can handle all plain boring devices
which have RGMII delays and not a lot else.

      Andrew

