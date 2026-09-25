Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D231C98325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 02:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Onm061uyZBZ6jk/XlnSGK29UlUQPLuEGtTxsmYUpuT8=; b=jyL6KqHtf2oeDLR4/9depKjIq3
	p5vFkvaWOiBJ0bMAtRAXkXwgydl4uewRUmPolXOxGJceIs9LWcw39mYDxwYzX84U6VfhDDdpCDfId
	YZW4N9FEhlIj7kMRr2qGv+GQH1F0Zyp/BWeI/HBtPtCTXgPf6fboOUz7pBftX7szTsPPt7LyZASsj
	u+eWqk9X+3vazOLkVZcelwZPXFmBGWpmUIfb1dHbnlE59nyFZ1q5iyy/iIqCPD0mzW3hMPzHpU+xY
	ghim9AdNT+OuZv+JXMaE1Z8goAxc7gGFzPrReDdjwvauIfu1u8RoW6EpDQ17L7uPS8/5xtR3dQEFn
	yFoSOU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vIJ-0000000CVxa-0vzJ;
	Fri, 25 Sep 2026 02:04:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vHu-0000000CVly-0LEc;
	Fri, 25 Sep 2026 02:03:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC26A44511;
	Fri, 25 Sep 2026 02:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F111F00898;
	Fri, 25 Sep 2026 02:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790301823;
	bh=Onm061uyZBZ6jk/XlnSGK29UlUQPLuEGtTxsmYUpuT8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=M2eYEdLuUcb+C96LVFVRHO6lU0WuUABDd/6eda+sMlv6S2mdAbIP8kJMRY7+v9veI
	 sKQzI7EWmlp44LMD42zzzCf1bb08l6EedRWjeRtJaVRP2m8UMZcVn+hMQVv33TciGy
	 9ajXZFWVbTBZTB/0MlXlcD2rhyU2ojVJHt8Y/Z0yf5IZRWl6yPxZIOklYDJkZuUHdJ
	 UJCZT//s2z8uwqrMVS4sfC9BruK0m8CIhokBqPAy1TJueKBaAOf0nch+S0vHG8zq6B
	 Vwgevm3DTWEzpE9EsnDwgF7GjnKkEkAcBaPSnp1twV2kAe+inoN1F4C97bVp34drRF
	 C19YS3EzQpSFw==
Subject: Re: [PATCH net-next v10 06/11] net: pcs: xpcs: add ANRESTART support
 for SGMII link recovery
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, vkoul@kernel.org,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 romain.gantois@bootlin.com, hkallweit1@gmail.com, neil.armstrong@linaro.org,
 linux@armlinux.org.uk, shawn.lin@rock-chips.com, david@ixit.cz,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Date: Fri, 25 Sep 2026 02:03:41 +0000
Message-ID: <179030182177.2160803.5520238845817839542@kernel.org>
In-Reply-To: <20260922200336.2201212-7-coiaprant@gmail.com>
References: <20260922200336.2201212-7-coiaprant@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In xpcs_get_state_c37_sgmii() (drivers/net/pcs/pcs-
  xpcs.c:1110-1121) the ANCMPLT latch is cleared first…
- [Medium] xpcs_get_state_c37_sgmii() now mutates PCS hardware state
  (write-0-to-clear of DW_VR_MII_AN_INTR_STS and the BMCR_ANRESTART…

--

net: pcs: xpcs: add ANRESTART support for SGMII link recovery

This adds BMCR_ANRESTART to the C37 SGMII paths: xpcs_config_aneg_c37_sgmii()
now clears DW_VR_MII_AN_INTR_STS and sets ANRESTART together with ANENABLE,
and xpcs_get_state_c37_sgmii() clears the AN latch and issues an AN restart
when the link is down but AN completion was latched.

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index 0337e2bcc0125..8c3875b6985b9 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c

[ ... ]

> @@ -1093,9 +1107,18 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
>  		return 0;
>  	}
>  
> -	/* Clear AN complete status or interrupt */
> -	if (state->an_complete)
> -		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +	if (state->an_complete) {
> +		/* Clear AN complete status or interrupt */
> +		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Initiate the next round of AN */
> +		ret = xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
> +				  BMCR_ANRESTART);
> +		if (ret < 0)
> +			return ret;
> +	}

[Severity: Medium]
Can this ordering leave the restart permanently disarmed if the xpcs_modify()
fails?

The latched ANCMPLT bit is the only piece of hardware state this code uses to
decide that a restart is needed, and it is destroyed before the restart is
actually requested.  xpcs_modify() is a real read-modify-write:

xpcs_modify() -> mdiodev_c45_modify() -> mdiobus_c45_modify() ->
__mdiobus_c45_modify_changed()

and that last function returns the read error before issuing any write:

drivers/net/phy/mdio_bus.c:__mdiobus_c45_modify_changed() {
	...
	ret = __mdiobus_c45_read(bus, addr, devad, regnum);
	if (ret < 0)
		return ret;
	...
}

So on a transient register read error the PCS stays AN-complete and link-down
with no negotiation started, while the latch that would have re-triggered this
branch has already been cleared.  Every later poll then sees an_complete == 0
and never re-enters the branch, which is the "link stays down forever" case the
commit message describes.

The commit message says:

	"If an MDIO access fails at this point, it indicates an
	 unrecoverable hardware condition until reset."

Where does that reset happen?  .pcs_get_state is void, and the caller only
logs the value:

drivers/net/pcs/pcs-xpcs.c:xpcs_get_state() {
	...
	case DW_AN_C37_SGMII:
		ret = xpcs_get_state_c37_sgmii(xpcs, state);
		if (ret)
			dev_err(&xpcs->mdiodev->dev, "%s returned %pe\n",
				"xpcs_get_state_c37_sgmii", ERR_PTR(ret));
		break;
	...
}

Nothing sets xpcs->need_reset, resets the PCS or re-arms the restart, so
recovery seems to require an administrative down/up to re-run
xpcs_config_aneg_c37_sgmii().  Would it be safer to issue the ANRESTART first
and only clear the latch once the restart write succeeded, or to set
xpcs->need_reset on failure?

[Severity: Medium]
What serializes this new register write against a concurrent
.pcs_get_state call?

phylink reaches this callback from two paths that share no lock:

drivers/net/phy/phylink.c:phylink_resolve() {
	mutex_lock(&pl->state_mutex);
	...
		phylink_mac_pcs_get_state(pl, &link_state);
	...
}

drivers/net/phy/phylink.c:phylink_ethtool_ksettings_get() {
	ASSERT_RTNL();
	...
		phylink_mac_pcs_get_state(pl, &link_state);
	...
}

phylink_mii_read() via phylink_mii_ioctl() is in the same ASSERT_RTNL()-only
category.  struct dw_xpcs in drivers/net/pcs/pcs-xpcs.h has no lock of its own,
and the MDIO bus mutex only makes each individual transaction atomic, not the
read of DW_VR_MII_AN_INTR_STS followed by the clear and the ANRESTART.

So can an unprivileged ETHTOOL_GLINKSETTINGS query (or SIOCGMIIREG) racing with
phylink_resolve() clear a latch belonging to a negotiation the other caller just
started, and then issue a second BMCR_ANRESTART that aborts that in-flight
negotiation?

Even without a race, the read of DW_VR_MII_AN_INTR_STS and the subsequent blind
write of 0 are not atomic with respect to the hardware latch, so is an AN
completion latched between those two accesses silently dropped?

Before this patch the callback only cleared the latch, so the state-changing
write is new here.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260922200336.2201212-1-coiaprant%40gmail.com

