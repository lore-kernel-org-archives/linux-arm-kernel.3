Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1E7C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 11:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+i4xJvJbpZzCybARuAVvhYy0NukRF5a36xdEaqg/UOk=; b=3PsuQz5IXG2KLS6cqiszkcX5i6
	xTN/CI054ed0isbVf1ZoO4BReq/Bc16WulTe/bbkdTkYXLPrIZVSQnbuqJYEDOAR2fqKWYh49qrPq
	GSEM4ySZOKfJKqFl3Vfl3hqeyijkpcZOHkBzDV/pXIqsl6gHK4HrIkiKBKdkOafbVZSg1IJE8jeFi
	GTQW00AEEy2ueUamEjUa8Y7DCwH6vwqpOhKZ4EBat5/ke2qfRld/a3Ceu6lw/uDvTumfMNKGkMqmd
	p8J4vhWqhTmq1R0I/0+/qqOkDjJDrOnm1aAY3L0CYghrohy3SWsDMuHGs1dOjllFr4zRAfuxitxeg
	zuuB5wIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zNe-0000000GUNG-33TN;
	Fri, 11 Sep 2026 11:25:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zNb-0000000GULV-23NE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 11:25:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5D0F41885;
	Fri, 11 Sep 2026 11:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3321F00898;
	Fri, 11 Sep 2026 11:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125914;
	bh=+i4xJvJbpZzCybARuAVvhYy0NukRF5a36xdEaqg/UOk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=B2582l490FLyblbokIDflmio7hWcERSDpKlYd8VL+OChurbUdUVkzSLtGF4bTFFZv
	 LTR1AH0wX7FJa3oJxIj+mQpFCMU9nSIRiehf96dZF5W3gtbFXmYhJiU4YPGD4/hfeh
	 5bJoVZOiSaj70v7tLHaztGCtJerUKT4TFlnnzUUns8iyKMfJzGMZlSMUUkgGuxvPjX
	 es6h3tlXL87uL/vskOkTDR+SX3Jvu+uRUq628dX1HNdSzXUvn27eO9gTGh5phzUAZt
	 M0k5x+zTpEAj8zNjyrjw8fuduasacX/KYpk18jvHFkEgQY7TJtGBWpw+ZhgxSpcrHM
	 hg3I8LSMl8agg==
Subject: Re: [PATCH net-next v2 4/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
From: netdev-bot+sashiko@kernel.org
To: mohd.anwar@oss.qualcomm.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, richardcochran@gmail.com, andersson@kernel.org,
 konradybcio@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
 joabreu@synopsys.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 11 Sep 2026 11:25:12 +0000
Message-ID: <178912591286.219967.4678568368277035940@kernel.org>
In-Reply-To: <20260908-shikra_ethernet-v2-4-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-4-bbe3389d0652@oss.qualcomm.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 0

- [Medium] In `ethqos_rgmii_macro_init()`
  (drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c) the patch…

--

net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void

The patch changes ethqos_rgmii_macro_init() to return void because its only
caller ignores the return value, and it drops the speed validation from that
function on the grounds that the same check exists higher up the call stack.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ac7d6d3e205a1..44270c25d874f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  	return 0;
>  }
>  
> -static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
> +static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
>  {
> -	struct device *dev = &ethqos->pdev->dev;
>  	unsigned int prg_rclk_dly, loopback;
>  	unsigned int phase_shift;
>  
> @@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
>  	/* Select RGMII, write 0 to interface select */
>  	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
>  
> -	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
> -		dev_err(dev, "Invalid speed %d\n", speed);
> -		return -EINVAL;
> -	}
> -

[Severity: Medium]
The commit message says "the speed validation duplicates a check higher up
the call stack".  Which check is that referring to?

The only path here is:

  stmmac_mac_link_up()
    -> priv->plat->fix_mac_speed()
      -> ethqos_fix_mac_speed_rgmii()
        -> ethqos_rgmii_macro_init()

stmmac_mac_link_up() only bails out in the default arm of its speed switch:

	case SPEED_2500:
		if (interface == PHY_INTERFACE_MODE_USXGMII)
			ctrl |= priv->hw->link.xgmii.speed2500;
		else
			ctrl |= priv->hw->link.speed2500;
		break;
	...
	default:
		netdev_err(priv->dev,
			   "unsupported speed %s on %s, leaving the MAC disabled\n",
			   phy_speed_to_str(speed), phy_modes(interface));
		return;
	}

	if (priv->plat->fix_mac_speed)
		priv->plat->fix_mac_speed(priv->plat->bsp_priv, interface,
					  speed, mode);

so SPEED_2500 and everything above it are accepted and forwarded verbatim to
fix_mac_speed() regardless of the interface mode.

ethqos_fix_mac_speed_rgmii() does no RGMII-specific speed validation either;
it only distinguishes speed == SPEED_1000 from speed == SPEED_100/SPEED_10
while restoring POR values and bringing up the DLL, then passes speed
straight through.

So the removed test rejected speeds that are invalid for RGMII, while what
remains upstream only rejects speeds the core does not recognise at all.
Are these really the same check?

A speed above 1000 does appear reachable on an RGMII port through a fixed
link.  phylink_parse_fixedlink() keeps the requested speed even when it does
not match the validated supported set:

	if (c) {
		...
	} else {
		phylink_warn(pl, "fixed link %s duplex %dMbps not recognised\n",
			     pl->link_config.duplex == DUPLEX_FULL ? "full" : "half",
			     pl->link_config.speed);
	}

and phylink_get_fixed_state() then hands that speed to mac_link_up() via
*state = pl->link_config.  With phy-mode = "rgmii" plus
fixed-link { speed = <2500>; full-duplex; }, does 2500 now reach
ethqos_rgmii_macro_init() and silently take the non-1000 branches
(BYPASS_TX_ID_EN set, POS_NEG_DATA_SEL and PROG_SWAP cleared,
PRG_RCLK_DLY_CODE = 5, RX_PROG_SWAP cleared on pre-GE3 parts) while neither
MAX_SPD_PRG_2 nor MAX_SPD_PRG_9 is programmed, with the DLL already locked
by the caller?

The "Invalid speed %d" dev_err() was the only indication that the RGMII
configuration is unsupported.  Would it make sense to move the check into
ethqos_fix_mac_speed_rgmii(), before the POR restore and the DLL
reset/enable sequence, rather than dropping it?

For reference, no later patch in this series reinstates a speed check:
ethqos_fix_mac_speed_rgmii() and ethqos_rgmii_macro_init() still accept any
speed at the end of the series, and the newly added
ethqos_rgmii_id_macro_init() is equally unvalidated.

>  	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
>  
>  	if (speed == SPEED_1000) {

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908-shikra_ethernet-v2-0-bbe3389d0652%40oss.qualcomm.com

