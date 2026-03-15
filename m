Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B99F30271
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 16:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtOvFFiP0+lMSVcZtAaRoqq6E60ERprmvv1E9itwsLk=; b=q1CVPLBq2Eg3S7NKXG+Eg55/e1
	opXaJTUHel7cwAs1qTi03P36VTBsB/KvDXKgF+EQezK58YMUJ6HKgfPX+5ajim9W8nyDFqygJTXpq
	IWZTLnRtxHT8TeeNWCYtraY4JqLEq2qT1tZGycG80UCYR/N+W/Wq3/ern7C00JExl03uGPN2Fguz3
	OndFYpFMLqLQ6JouvRJVHLXe3QTP4AUzHpFkJmr0/kX5l0JNBFzDIyD5+nMpRpOz2k6bc/JH4Nwtz
	XUrY5cnOh/VH08BjCMeHrAh8AkRrPUZlornn/EAtw3hq2k/Wzlscfzq5/B83VdSBpKnkxUmnOe5rA
	MO1pdqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1oKC-00000002j23-0I1v;
	Sun, 15 Mar 2026 16:28:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1oKB-00000002j1u-0688;
	Sun, 15 Mar 2026 16:28:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AE3660130;
	Sun, 15 Mar 2026 16:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97E1C4CEF7;
	Sun, 15 Mar 2026 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773592096;
	bh=xOjKR0tFQLh7NVKP3TuLU6yEiJpBek/7xxzo0eG2SsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g7LkekBrPJ9cKt/zbK+Lo5Xfhdj3uJc5sNkE8qRDj9+aYIpOrz7GPNnbQ4TdC8GUc
	 6GmCGs58jD6kKrvf+CAztmbX8gJTuPsJ6dgzCfxBWtRG81On1wtBnirmdNnJ3MFxgQ
	 a6Jm3xF0RzTobFkLPSN3HzEjy5Iheldwz+WvOtjtfqzADfEbbZVoesidFnPkw41qte
	 ydXYJS/4EmXl14omp/KQBYmMlQhC7uhtCHvFw2na3xwE228IBwvydRweuL4woSjER0
	 WAsbhlPqvR5a6HR26rn2XBjTcAuIzzxZ9o8ylRAbYiUmWnWMd1AF50dSs0n0sdoXXV
	 UoqKB4okRRJcQ==
From: Simon Horman <horms@kernel.org>
To: lizhi2@eswincomputing.com
Cc: Simon Horman <horms@kernel.org>,
	alexandre.torgue@foss.st.com,
	devicetree@vger.kernel.org,
	alex@ghiti.fr,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	ningyu@eswincomputing.com,
	linux-riscv@lists.infradead.org,
	krzk+dt@kernel.org,
	davem@davemloft.net,
	andrew+netdev@lunn.ch,
	conor+dt@kernel.org,
	weishangjuan@eswincomputing.com,
	kuba@kernel.org,
	robh@kernel.org,
	edumazet@google.com,
	pjw@kernel.org,
	rmk+kernel@armlinux.org.uk,
	palmer@dabbelt.com,
	mcoquelin.stm32@gmail.com,
	pinkesh.vaghela@einfochips.com,
	linux-kernel@vger.kernel.org,
	pritesh.patel@einfochips.com,
	pabeni@redhat.com,
	aou@eecs.berkeley.edu,
	wens@kernel.org,
	netdev@vger.kernel.org,
	linmin@eswincomputing.com
Subject: Re: [net-next,v4,2/3] net: stmmac: eic7700: enable clocks before syscon access and correct RX sampling timing
Date: Sun, 15 Mar 2026 16:27:35 +0000
Message-ID: <20260315162735.1427325-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313075416.1607-1-lizhi2@eswincomputing.com>
References: <20260313075416.1607-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
net: stmmac: eic7700: enable clocks before syscon access and correct RX sampling timing

The second Ethernet controller (eth1) on the Eswin EIC7700 SoC may fail
to sample RX data correctly at Gigabit speed due to EIC7700-specific
receive clock to data skew at the MAC input in the silicon. The existing
internal delay configuration does not provide sufficient adjustment range
to compensate for this condition at 1000Mbps. Update the EIC7700 DWMAC
glue driver to apply EIC7700-specific clock sampling inversion only
during Gigabit operation on MAC instances that require it.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> index bcb8e000e720..b230bc5b902a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c

[ ... ]

> @@ -61,8 +81,26 @@ static int eic7700_clks_config(void *priv, bool enabled)
>  static int eic7700_dwmac_init(struct device *dev, void *priv)
>  {
>  	struct eic7700_qos_priv *dwc = priv;
> +	int ret;
> +
> +	ret = eic7700_clks_config(dwc, true);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_set_bits(dwc->eic7700_hsp_regmap,
> +			      dwc->eth_phy_ctrl_offset,
> +			      EIC7700_ETH_TX_CLK_SEL |
> +			      EIC7700_ETH_PHY_INTF_SELI);
> +	if (ret)
> +		return ret;

Does this code leak the enabled clocks? The function calls
eic7700_clks_config(dwc, true) to enable the clocks, then later calls
regmap_set_bits(). If regmap_set_bits() fails, the function returns
without disabling the clocks.

Looking at the caller in stmmac_main.c:stmmac_dvr_probe():

    if (priv->plat->init) {
        ret = priv->plat->init(priv->device, priv->plat->bsp_priv);
        if (ret)
            return ret;
    }

    ret = __stmmac_dvr_probe(priv->device, priv->plat, &res);
    if (ret)
        goto error_exit_init;

The exit handler is only called when __stmmac_dvr_probe() fails, not
when init() fails. This leaves the bulk clocks in the prepared-and-enabled
state on this error path.

> +
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_axi_lp_ctrl_offset,
> +		     EIC7700_ETH_CSYSREQ_VAL);
>
> -	return eic7700_clks_config(dwc, true);
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_txd_offset, 0);
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_rxd_offset, 0);
> +
> +	return 0;
>  }

[ ... ]

