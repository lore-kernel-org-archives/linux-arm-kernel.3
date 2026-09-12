Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AE9C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vpbPu9jcQEsTCTK7x4pEBBMtkMi3dU8hXU1oyt9GVw=; b=28NaO4z9RoXDRJbtPm8WUfkeUX
	02j5hMDwtjriUxRCgANukayFe4wDNWO4x26ZQapxkElreGWQphPXidHEhxUz3IpFtkdEZm63NpID5
	r0wvJxgyjR+DOlGMfIyCNcsYTCeoXMCzhINnqNtz66/05CRX0F5cj1/YpNh/fXxw2jJAkdNgH2WDW
	ut5KPu2QdMwfWni0Nl+lCTKeyqJpsJ8RoBBm2oexVaFaHUWihqS8UYserJNY/O32hcTXkqqOHtIfS
	LR9sfzPPk4qYlMy9dwVCosuqQT6Vv+U1Ihyi1QrZQv3Slsf24ROhRvQfbRF3Dp7dMBUYbCqzy0cjW
	mDBoRAVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5U6z-000000018z5-33II;
	Sat, 12 Sep 2026 20:14:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5U6L-000000018fS-3JJt;
	Sat, 12 Sep 2026 20:13:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B4F560235;
	Sat, 12 Sep 2026 20:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143511F0089A;
	Sat, 12 Sep 2026 20:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789244008;
	bh=9vpbPu9jcQEsTCTK7x4pEBBMtkMi3dU8hXU1oyt9GVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rk6mlEAeaZM8mmVSYk0pcBV5CodH80Ur56P9YjthcxVPSIUrLewhHLN7mR/woE343
	 M+6B+UIKBfo+nVIdvzK74bm4ZnYYiK+gYgxzRGZC+GfQDVWTkZz9xqe9ZzrD3n7Fni
	 9sbI0wXWQJlCazp4hw8iXY3Ba5OvY353yjUVCR3rMQiyymGAKsndO3wnlZk1CLTk74
	 gULzpAvu1HpFLfvkgJQ55r9/0bV0uwBgplNcgUbvElyjxX1pGDT8ynZ3QpXY1QZwXi
	 m78Ue7X679q+qpQW7CfmDHwIyx2pF88Ac++KlhJf281tQXStKliYoQ4J4smoA7kaGB
	 K4dHtNZ7ar3+w==
From: Jakub Kicinski <kuba@kernel.org>
To: coiaprant@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	vkoul@kernel.org,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	romain.gantois@bootlin.com,
	hkallweit1@gmail.com,
	neil.armstrong@linaro.org,
	linux@armlinux.org.uk,
	shawn.lin@rock-chips.com,
	david@ixit.cz,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v4 06/10] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Sat, 12 Sep 2026 13:13:27 -0700
Message-ID: <20260912201327.127042-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907153713.2572547-8-coiaprant@gmail.com>
References: <20260907153713.2572547-8-coiaprant@gmail.com>
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
---
net: pcs: xpcs: add ANRESTART support for SGMII link recovery

The patch sets BMCR_ANRESTART together with BMCR_ANENABLE when configuring
C37 SGMII in-band negotiation, and clears the latched CL37 AN complete
status before doing so.  It also restarts negotiation from
xpcs_get_state_c37_sgmii() when AN completion is latched but the link is
reported down.

>     On some hardware using the DesignWare XPCS IP (e.g., RK3568 MAC side
>     SGMII), the PCS does not automatically restart auto-negotiation when the
>     link goes down and comes back up. Without an explicit ANRESTART, the link
>     stays down forever.

[Severity: Low]
The changelog describes a user visible failure ("the link stays down
forever") in long standing shared code, but there is no Fixes: tag and no
statement about which histories are affected.

The only hardware named here, RK3568 XPCS, does not exist in the baseline
tree: searching for xpcs_rk, rk3568-xpcs or pcs-xpcs-rk under drivers/net at
879e280b8486 returns nothing, and the glue driver arrives later in this
series ("net: pcs: xpcs: add Rockchip RK3568 platform glue driver").

Could the changelog either name the pre-existing commit being fixed, or say
explicitly that the affected platform is introduced later in the same
series, so that stable tooling does not have to guess?

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index 0337e2bcc0125..50b9cdf94fdaa 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
> @@ -816,9 +816,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
>  	if (ret < 0)
>  		return ret;
>  
> +	/* Clear CL37 AN complete status */
> +	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +	if (ret < 0)
> +		return ret;
> +
>  	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
>  		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> -				 mdio_ctrl | BMCR_ANENABLE);
> +				 mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTART);

[Severity: Medium]
Should the comment at the top of xpcs_config_aneg_c37_sgmii() be updated
along with this change?  It still says the opposite of what the code now
does:

drivers/net/pcs/pcs-xpcs.c:xpcs_config_aneg_c37_sgmii() {
	/* For AN for C37 SGMII mode, the settings are :-
	 ...
	 * 5) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 1b (Enable SGMII AN)
	 *
	 * Note that VR_MII_MMD_CTRL is MII_BMCR.
	 *
	 * Note: Since it is MAC side SGMII, there is no need to set
	 *	 SR_MII_AN_ADV. ... There is also no need to
	 *	 trigger AN restart for MAC-side SGMII.
	 */

On the default path this same function selects MAC side SGMII:

	} else {
		tx_conf = DW_VR_MII_TX_CONFIG_MAC_SIDE_SGMII;
	}

so the restart is now issued for exactly the case the comment says does not
need it.  The new DW_VR_MII_AN_INTR_STS write is also a sixth step that the
enumerated sequence does not mention.

If the databook statement no longer holds for these parts, could the
comment be corrected, so that a later reader does not remove the ANRESTART
bit as a mistake?

> @@ -1093,10 +1098,15 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
>  		return 0;
>  	}
>  
> -	/* Clear AN complete status or interrupt */
> -	if (state->an_complete)
> +	if (state->an_complete) {
> +		/* Clear AN complete status or interrupt */
>  		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
>  
> +		/* Initiate the next round of AN */
> +		xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
> +			    BMCR_ANRESTART);
> +	}
> +
>  	return 0;
>  }

[Severity: Medium]
Can this sequence get stuck if the xpcs_modify() fails?

The latched status is cleared first, and DW_VR_MII_AN_STS_C37_ANCMPLT_INTR
is the only thing that brings execution back into this branch:

	state->an_complete = ret & DW_VR_MII_AN_STS_C37_ANCMPLT_INTR;

So if the clear succeeds but the restart does not, every later poll reads
ANCMPLT as 0, state->an_complete stays false, and the restart is never
retried, leaving the port down with AN idle until something calls
pcs_config again.

mdiodev_c45_modify() does a read followed by a write, so there are two
places it can return an error, for example a bus -ETIMEDOUT, or with the
Rockchip glue added later in this series the pm_runtime_resume_and_get()
error path in xpcs_rk_read_reg() / xpcs_rk_write_reg().

Both return values are also discarded and the function still ends with
return 0, so the diagnostic in the caller can never fire for them:

	case DW_AN_C37_SGMII:
		ret = xpcs_get_state_c37_sgmii(xpcs, state);
		if (ret)
			dev_err(&xpcs->mdiodev->dev, "%s returned %pe\n",
				"xpcs_get_state_c37_sgmii", ERR_PTR(ret));

Would it be better to assert BMCR_ANRESTART before clearing the latched
status, and to propagate both return codes to xpcs_get_state()?

