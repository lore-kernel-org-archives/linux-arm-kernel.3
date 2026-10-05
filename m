Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC69DCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 13:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Or8bGKd328cjwT8opyEZlfDyIVPvTUBoe+zbP1elmYo=; b=nyVVGp9mGgVIrgP+5l3NTReNAP
	7caBRFmnHmDrYAo5KiI3lim61izHhs4cgY7NhrbH6G4Khr11Vkk7Fs5xiN0eMi2MSeF3EMd1cP0KQ
	BlO8XGfwCXGSbikzS4gZKjTfUHtRQouGsZ7TWfr26/lFOvCSgt96CPDU1tGjPTQSVedH++0jNPPzS
	t/hcv9nQ9MWW5XlsV3UWsWh9fDc9nyNuNXhf+IzP9Lagy7xN1Ux2kYUtpEhJsA1rPA0CH+s7UKYEZ
	eboInTE2f1QcgJby0brsOnfkdDKulJ591cCF4t8ipknn/RtNWqJ8fIQ45orf+k3rEepGk9oj+mRzO
	XIsHtVXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDirW-0000000GYH2-0kI4;
	Mon, 05 Oct 2026 13:36:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDirQ-0000000GYEg-2jO8;
	Mon, 05 Oct 2026 13:36:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1388E60A64;
	Mon,  5 Oct 2026 13:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D251F00898;
	Mon,  5 Oct 2026 13:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791207367;
	bh=Or8bGKd328cjwT8opyEZlfDyIVPvTUBoe+zbP1elmYo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VB/Kis31yp9kknyjWLppXvf5/9uVnI20+ZnC5JqOwjgd5VGolKJLtr4GgX5A0aK3F
	 5qi3AJiSmy/cyjYXOeisSUjtYRLXbkxwYLxQxHzQodNVnJs5xVyHf/dsgoW8HuqtTM
	 GGZ8l2+v4yS+4BY3d/+yGLOv/BFO9nfaWi8OdxsvEqjTYqcIKEgtKrACvQIA9LTDQl
	 t0jz5KHyRfdRsz+zTzKFZePwb9T9iLYJpmJSzePfG7G2oLCvWWIyo9clqU3jkO/Haa
	 A3ZNYY4VMjR00Iq3ewzfo4unC2yhW7GhATyhFqoIxDXo+oRvyMF+2JnUWkSCbQT7UU
	 XBXVWO5Dmiz0w==
Subject: Re: [PATCH net-next v5 3/3] net: dsa: let user ports wait for a PHY
 that probes late
From: netdev-bot+sashiko@kernel.org
To: f@lex.la
Cc: linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
 olteanv@gmail.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 conor@kernel.org, f.fainelli@gmail.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Mon, 05 Oct 2026 13:36:06 +0000
Message-ID: <179120736615.434549.15639450340100893930@kernel.org>
In-Reply-To: <20261001130208.105558-4-f@lex.la>
References: <20261001130208.105558-4-f@lex.la>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch arms phylink's self-requeueing late-PHY poller
  (pl->late_phy_poll on system_freezable_power_efficient_wq) for…
- [Low] The comment this patch adds on struct
  dsa_switch::phy_may_probe_late (include/net/dsa.h:458-460) says a…

--

net: dsa: let user ports wait for a PHY that probes late

This adds a phy_may_probe_late bit to struct dsa_switch. dsa_user_phy_setup()
passes it to phylink so that a user port can wait for a PHY whose driver
needs host firmware and probes late. mt7530 opts in.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 7781a63b4e6fd..e4c155605e27f 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -3548,6 +3548,7 @@ mt7530_probe_common(struct mt7530_priv *priv)
>  	priv->ds->priv = priv;
>  	priv->ds->ops = &mt7530_switch_ops;
>  	priv->ds->phylink_mac_ops = &mt753x_phylink_mac_ops;
> +	priv->ds->phy_may_probe_late = true;

[Severity: Medium]

With this opt-in, phylink's late PHY poller (pl->late_phy_poll) can be
pending on mt7530 user ports. Does anything on the switch shutdown path
cancel it?

mt7530_shutdown() and the mmio shutdown handler both call
dsa_switch_shutdown(). That function closes the conduits, detaches and
unlinks the user netdevs, and clears conduit->dsa_ptr:

net/dsa/dsa.c:dsa_switch_shutdown() {
    ...
	dsa_switch_for_each_user_port(dp, ds) {
		conduit = dsa_port_to_conduit(dp);
		user_dev = dp->user;

		netif_device_detach(user_dev);
		netdev_upper_dev_unlink(conduit, user_dev);
	}
    ...
}

It never calls phylink_disconnect_phy() or phylink_destroy(). Those two
functions and phylink_fwnode_phy_connect() are the only callers of
phylink_late_phy_cancel(). phylink_stop() does not cancel the work either.

Suppose the PHY driver binds shortly before a reboot or kexec. A poll that
is still queued (up to 30 seconds out after backoff) can then run after
.shutdown has returned:

phylink_late_phy_poll()
    phylink_attach_phy()
        phy_attach_direct()
            phy_init_hw()
            phy_resume()
    phylink_bringup_phy()
        phy_request_interrupt()

Could this cause MDIO traffic, a PHY soft reset and config_init, and an
IRQ request on hardware that has already been shut down? Could it also
leave that interrupt enabled for a kexec'd kernel?

For comparison, sfp_shutdown() calls cancel_delayed_work_sync() on
sfp->poll and sfp->timeout.

>  	mutex_init(&priv->reg_mutex);
>  	spin_lock_init(&priv->stats_lock);
>  	INIT_DELAYED_WORK(&priv->stats_work, mt7530_stats_poll);
> diff --git a/include/net/dsa.h b/include/net/dsa.h
> index 5d12191b6f6f5..f7e78c3a123d3 100644
> --- a/include/net/dsa.h
> +++ b/include/net/dsa.h
> @@ -455,6 +455,11 @@ struct dsa_switch {
>  	 */
>  	u32			dscp_prio_mapping_is_global:1;
>  
> +	/* Drivers whose .port_enable copes with a NULL phy may set this to
> +	 * let user ports wait for a PHY that needs host firmware.
> +	 */
> +	u32			phy_may_probe_late:1;

[Severity: Low]

Is "copes with a NULL phy" the whole requirement for opting in?

The only caller of .port_enable is dsa_user_open() ->
dsa_port_enable_rt(dp, dev->phydev). When phylink_late_phy_poll() attaches
the PHY later, it forces a major config and calls phy_start(). It does not
call .port_enable again with the new phy.

gswip_port_enable() already handles a NULL phy:

	if (phydev)
		mdio_phy = phydev->mdio.addr & GSWIP_MDIO_PHY_ADDR_MASK;

So gswip meets the rule as written. Yet the commit message says gswip must
not opt in, because the PHY address would stay wrong until the next open.

The same applies to qca8k. Adding an if (phy) check around
phy_support_asym_pause(phy) in qca8k_port_enable() would satisfy this
comment. A PHY that attaches late would then never advertise asym pause.

Should the comment say that the driver must not depend on the phy argument
of .port_enable at all? That would match the reasoning in the commit
message.

> +
>  	/* Listener for switch fabric events */
>  	struct notifier_block	nb;
>  

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001130208.105558-1-f%40lex.la

