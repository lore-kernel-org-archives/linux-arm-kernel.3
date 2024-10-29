Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC16D2AB3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crdT/4LE3Ch8R4sVRW6FF4fO9QpC+e/qUd0YNDPGHR8=; b=Xc5KuIDdV03tAVR3AbG6zw+4iA
	u0Ge7bTCu122gZeOnn5e5SUobKyy2Y3hVVhipNh3npM50g9rg6fn1XpqEe0gQzk6bR4k/eGXAWxxP
	hFIQyXygAtQI9dr+SqrCqp0T2RoRm4rYbmauDEnZLJlCxKpsEDRjI3Wdp/zO92nLOd1YwOwAysaFn
	RKOwIDtA3jEEMIqMyXZ+mLtQsSq5i6X1+L6P5q3tuaxYytoPFR/5fceq2t8DGZV7oGH2IjjG9DkjN
	9kPMhxL61+gXpilOwiQwHSZoz5SDToZJJccEd96rCBBI+qH0RPgugiCHD6+H3/XyVpck4B7rtN7Nt
	7YKIMJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lnT-0000000EUXs-3Uyc;
	Tue, 29 Oct 2024 12:58:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5l92-0000000ENPk-3nwf
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 12:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=crdT/4LE3Ch8R4sVRW6FF4fO9QpC+e/qUd0YNDPGHR8=; b=cqZPO8Hmho5x5TK5A57n1vJaQZ
	TnVR4xwAuL48YHu6Sop1jsegQyS9C61uPvATtdjJtrivAgF2wF9gVqg+TFpAU8w5DVXIMrHNuOdf1
	1iAIVyQNDjvWU68LxtS5iGrLV1puqZOLogkxl/wknt3VyYS3XPQTbozVIMGAtelJNkXvVLF0U3TNc
	U8Udt6acf5SR5qRv0QPQ22dnciefP5jTI+K89loH3P33n7VeWBJViQSdz5XKtqZrhH1zULc60o2zq
	lGbuXWpMvMEMQ8GT34n1g/HFVLxplc/491skwY2YiR4ThpMjYWsvvnTCAV1CjRIbns9Y6B/DkM/sP
	ZQBxUaTA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5l8z-00000009tMI-2RuI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=crdT/4LE3Ch8R4sVRW6FF4fO9QpC+e/qUd0YNDPGHR8=; b=DwRKOyWGbuOvzXY8/pNS9G3gvj
	akLbPChN8d3H10IX00VkcqIZZ9ZsEZP2UQRRPtDgJiZAV1oNgKNhuQiObASqE11+uCVuW/8TbdOLp
	OO+eBC/HmmfYh1YaTLzqOFg3iThMgQmkVGv7aFwkKCm9CLLv1QrQzavaUuzYPZ/y6ZjI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t5l8a-00BZPw-Vp; Tue, 29 Oct 2024 13:15:52 +0100
Date: Tue, 29 Oct 2024 13:15:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
Subject: Re: [PATCH v4 14/16] net: stmmac: dwmac-s32: add basic NXP S32G/S32R
 glue driver
Message-ID: <c902dc2a-9b2a-44a0-be1d-88fb150f4f17@lunn.ch>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_121618_035656_5F62AA89 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> +#define GMAC_TX_RATE_125M	125000000	/* 125MHz */
> +#define GMAC_TX_RATE_25M	25000000	/* 25MHz */
> +#define GMAC_TX_RATE_2M5	2500000		/* 2.5MHz */

With the swap to the new helper, i think 25M and 2M5 are no longer
needed.

> +static int s32_gmac_init(struct platform_device *pdev, void *priv)
> +{
> +	struct s32_priv_data *gmac = priv;
> +	int ret;
> +
> +	ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
> +	if (!ret)
> +		ret = clk_prepare_enable(gmac->tx_clk);
> +
> +	if (ret) {
> +		dev_err(&pdev->dev, "Can't set tx clock\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(gmac->rx_clk);
> +	if (ret)
> +		dev_dbg(&pdev->dev, "Can't set rx, clock source is disabled.\n");
> +	else
> +		gmac->rx_clk_enabled = true;

Why would this fail? And if it does fail, why is it not fatal? Maybe a
comment here.

> +static void s32_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> +{
> +	struct s32_priv_data *gmac = priv;
> +	long tx_clk_rate;
> +	int ret;
> +
> +	if (!gmac->rx_clk_enabled) {
> +		ret = clk_prepare_enable(gmac->rx_clk);
> +		if (ret) {
> +			dev_err(gmac->dev, "Can't set rx clock\n");

dev_err(), so is failing now fatal, but since this is a void function,
you cannot report the error up the call stack?

	Andrew

