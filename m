Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DA3FCD0CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrhLqIr375zkIF1P8tW7+p8P3V9w1E/lvaNsvQiZRKQ=; b=x4G/Mc6gCWO59sRSba3ypeCEAK
	uGuEus4eiEyIgbOGopLdjyBDOn65nZbIJqI/0g0a9pACzI4pwIOYmmoxdv5BTCz3bhMuqKgmt8aUh
	47h75GAMZ6Hb8iLa1Qo4vLiLirMZqeLpeuvN1pZg7P31G9eAeEWeG9MBujj/0WpZjK5kay9ueQpaM
	Q32pqXB1i5luMw/C9eMHjDS0hvXQpjjm5IeqlglJuoL8zysWWdqcwwGGxDpVdZqC+kFBUwteVFRjf
	jaKPnBLGBq6YoJOsAmjvvOgrrNhh4EJOWOAM32x6+M4bjqkiuRPnXBA3k9hfmbtuffDqVEZUSFpmH
	FyL/mujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mCJ-000000082nT-095X;
	Wed, 18 Mar 2026 08:24:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mCG-000000082mz-1uLw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:24:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3CA5417BA;
	Wed, 18 Mar 2026 08:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53225C19421;
	Wed, 18 Mar 2026 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773822247;
	bh=zbrEzDQ0AblNhXke6/7cPNOTm3Avyhavj22x1LcfmRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FdWYyowzn9WA2aJGuHLNRqX/QEe2NLHcUNCkhDUY64ztt4svOZmzxFrWlzmUHI6xU
	 /uZ6hPer+e0gNtoBPTWwrX/4/7Y7NvBA8sBZlt870hhJjKBW7mlNFErn5jRqmcWzUI
	 ZvuE9nLCPHP31SJgQXUPwHPO6asgJzE8clgaERBQLzu6N9cYSGvueZs5NEtbkDxERW
	 0uJbhCBwzFOmdXng/YhTB1b3/JQeJfKObJH/IhHBdmBsZiqjuYj2FAYfYX/gYxNizC
	 3PxPrHxwNqCsWYeU/7l/EP6+bQvr/f/z2ZIb4fdI4QjIBTDeTbHHgHvFBmLlYCncbE
	 OJTQxjRlH3XgQ==
From: Simon Horman <horms@kernel.org>
To: a0987203069@gmail.com
Cc: Simon Horman <horms@kernel.org>,
	richardcochran@gmail.com,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	linux-stm32@st-md-mailman.stormreply.com,
	joabreu@synopsys.com,
	linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org,
	pabeni@redhat.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org,
	conor+dt@kernel.org,
	schung@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	davem@davemloft.net,
	robh@kernel.org,
	yclu4@nuvoton.com,
	andrew@lunn.ch,
	mcoquelin.stm32@gmail.com,
	ychuang3@nuvoton.com,
	openbmc@lists.ozlabs.org,
	peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com
Subject: Re: [net-next,v14,3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Wed, 18 Mar 2026 08:23:46 +0000
Message-ID: <20260318082346.1825390-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316055427.1310569-4-a0987203069@gmail.com>
References: <20260316055427.1310569-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_012408_554943_34B75B79 
X-CRM114-Status: GOOD (  13.12  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family

Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac
driver.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> @@ -0,0 +1,136 @@

[ ... ]

> +static int nvt_gmac_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct device *dev = &pdev->dev;
> +	struct nvt_priv_data *priv;
> +	int ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get platform resources\n");
> +
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return dev_err_probe(dev, PTR_ERR(plat_dat), "Failed to get platform data\n");
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate private data\n");
> +
> +	priv->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys",
> +							    1, &priv->macid);
> +	if (IS_ERR(priv->regmap))
> +		ret = dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
> +
> +	if (priv->macid > 1)
> +		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>                                                                                   ^^^^

Does this code return the error on failure? The dev_err_probe() result is
assigned to ret but the function continues execution without returning.

Russell King's v12 review suggested using set_phy_intf_sel callback,
which led to significant refactoring in v12. This refactoring appears to
have inadvertently broken the error handling here and below.

The code should be:
	if (IS_ERR(priv->regmap))
		return dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");

	if (priv->macid > 1)
		return dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");

See Russell's v12 review:
https://lore.kernel.org/netdev/aYsurPBMnzWDZCco@shell.armlinux.org.uk/

> +
> +	plat_dat->bsp_priv = priv;
> +	plat_dat->set_phy_intf_sel = nvt_set_phy_intf_sel;
> +
> +	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
> +}

[ ... ]

