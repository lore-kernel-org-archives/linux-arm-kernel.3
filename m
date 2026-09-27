Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E8FC9833F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 16:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=260s97xmu8zFr2zsFwdEpzWatQ1+IA3lnCWULTwRUcY=; b=Ir7dcUxU/0CQ5VOB9PE2rhV0pz
	OBzK/8nBY8OnpNgJais+cgsBPgC1XYKKE1uje4K0Ey8cxAFzsw5UnUpAmGV1trU9PtfhmrwFGhRxs
	uQlPJaxvZGfzYoaMJFR4msiAgX8XKym5hnukWT3/+of1QlOkRoCkJBTLcNN+ckBSdk1ooC8wINgId
	Js0XSDWCrRzoeJEFIVsXGvPzvM0Wk6/GXDQnE/jMOYhRYpIneCd7ygP+4bVSpaDoWOf+2qIQn6ckH
	27XiMICwCfjyqjoOcctgKoCYcb3NfGTvvE7bjlJ97YfAMB5WjW0k08vtenlZ8X7Z//dkHkrNXS8Wm
	YZMBEH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArlG-0000000GZmC-1b0Y;
	Sun, 27 Sep 2026 16:29:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArkg-0000000GZ5f-0CYj;
	Sun, 27 Sep 2026 16:29:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C412143E5A;
	Sun, 27 Sep 2026 16:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F9D1F000FF;
	Sun, 27 Sep 2026 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790526561;
	bh=260s97xmu8zFr2zsFwdEpzWatQ1+IA3lnCWULTwRUcY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iiEoH2i8VyKhpRnwyi0TmGQTxs0NI7Ek1IOo4QciPW41dzAT4kOFVgmlbN7Kb4tXD
	 +R/rp9EHahMP6mU1UqulOKsC/EepNoZvcxpBk+RQ1/El+WOy2noKdyFt2HvQakT36I
	 hg2DW9J4iZCOD93HDpaK2GTegDQFkgV5WPBfT6OyZf5E/0rCVMBmQiaXYYSR1lK/v0
	 y2Bgl34nzNP/qasFh32Jb0wNk0GEgss/4YpeEzgw0zCowH3HjGKtnVz+VlCViLBP0k
	 areTSI1UvGuEN1KcnkPzKS3HMF3GNUdaS8d6cBYXE4JeYxlltWBlfNSBoJntp9HV7O
	 dGhMQFUVJVAmA==
Subject: Re: [PATCH net-next v15 8/9] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
From: netdev-bot+sashiko@kernel.org
To: bartosz.golaszewski@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, vkoul@kernel.org,
 peppe.cavallaro@st.com, wens@kernel.org, jernej.skrabec@gmail.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 shawnguo@kernel.org, festevam@gmail.com, jan.petrous@oss.nxp.com, s32@nxp.com,
 mohd.anwar@oss.qualcomm.com, romain.gantois@bootlin.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, mripard@kernel.org,
 christophe.roullier@foss.st.com, brgl@kernel.org, radu@rendec.net,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dfustini@tenstorrent.com,
 linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 bartosz.golaszewski@linaro.org
Date: Sun, 27 Sep 2026 16:29:18 +0000
Message-ID: <179052655862.2160803.476962840384562724@kernel.org>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-8-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-8-e82f33720737@oss.qualcomm.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message does not describe the refactor boundary
  accurately.
- [Low] The patch deletes the comment that justified the hard-coded MDC
  divider ('The clocks are controlled by firmware, so we don't know for…

--

net: stmmac: qcom-ethqos: factor out linux-level setup into a separate function

This patch adds a setup() callback to struct ethqos_emac_driver_data. It
implements the callback as ethqos_hlos_setup() for the existing EMAC
variants. The rgmii mapping, link clock handling and several plat_dat
callbacks move from qcom_ethqos_probe() into it, ahead of support for
firmware-controlled (SCMI) EMAC variants.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ab1bcb7eb18e2..509a5368e69a8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

[ ... ]

> @@ -692,6 +704,58 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
>  	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
>  }
>  
> +static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
> +			     struct plat_stmmacenet_data *plat_dat)
> +{
> +	struct platform_device *pdev = ethqos->pdev;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
> +	if (IS_ERR(ethqos->rgmii_base))
> +		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
> +				     "Failed to map rgmii resource\n");
> +
> +	ethqos->link_clk = devm_clk_get(dev, ethqos->data->link_clk_name ?: "rgmii");
> +	if (IS_ERR(ethqos->link_clk))
> +		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
> +				     "Failed to get link_clk\n");
> +
> +	plat_dat->clks_config = ethqos_clks_config;
> +
> +	ret = ethqos_clks_config(ethqos, true);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
> +	if (ret)
> +		return ret;
> +

[ ... ]

> +	case PHY_INTERFACE_MODE_2500BASEX:
> +	case PHY_INTERFACE_MODE_SGMII:
> +		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
> +		break;
> +	default:
> +		break;
> +	}

[Severity: Low]
This isn't a bug, but is the commit message accurate about what moves into
the callback? It says the patch will:

  "move all operations not required in SCMI mode into it."

SCMI mode also needs several of the steps moved into ethqos_hlos_setup():

  - mapping the "rgmii" wrapper
  - setting plat_dat->clks_config
  - the first ethqos_clks_config(ethqos, true) call, along with its
    devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos) cleanup
  - selecting ethqos_fix_mac_speed_sgmii for SGMII/2500BASEX

Later in the series, the ethqos_scmi_setup() added by "net: stmmac:
qcom-ethqos: add support for sa8255p" repeats each of these steps. Its own
comment says the wrapper loopback and functional clock bits are required.
Without them, the DMA SW-reset in dwmac4_dma_reset() never completes.

As a result, the same setup code exists in two places instead of once in
qcom_ethqos_probe().

Could the shared steps stay in qcom_ethqos_probe() or move to a common
helper, leaving only the HLOS-only parts in ethqos_hlos_setup()? If not,
could the commit message describe the split more precisely?

[ ... ]

> @@ -765,21 +815,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
>  				     "Failed to get serdes phy\n");
>  
> -	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
> -			       SPEED_1000);
> -
> -	qcom_ethqos_set_sgmii_loopback(ethqos, true);
> -	ethqos_set_func_clk_en(ethqos);
> -
> -	/* The clocks are controlled by firmware, so we don't know for certain
> -	 * what clock rate is being used. Hardware documentation mentions that
> -	 * the AHB slave clock will be in the range of 50 to 100MHz, which
> -	 * equates to a MDC between 1.19 and 2.38MHz.
> -	 */
>  	plat_dat->clk_csr = STMMAC_CSR_60_100M;

[Severity: Low]
Was this comment meant to be removed?

qcom_ethqos_probe() still sets plat_dat->clk_csr = STMMAC_CSR_60_100M for
every variant, but the comment explaining the hard-coded MDC divider is
gone.

The commit message describes the change as code motion and does not
mention removing the comment. No later patch in the series restores it.

Could the comment be kept above the clk_csr assignment?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260923-qcom-sa8255p-emac-v15-0-e82f33720737%40oss.qualcomm.com

