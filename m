Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCB3D25B7E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 13:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFkOSStkCuDVwfQzbGLnp4IzlBlAiO0sz+cD841v0dw=; b=mA6QIZwkRWQOwu0WYqtEY3Y6e2
	QtoDCnWEclmVgvoxb0rlmSmABxfaY1OJIVCUscqozf7ExNrMdoGYtpB/8YYgsYI2342UlH6mXZWRO
	MZhHimDTCZVk4uQgf+SJbGNZNe0E1vbDd6h6Nf/Zph3sIHMN8ZgCiSFQ5r0wbUJGfan0MB15bJT9E
	zDPIDrwrsIN6Vjp4DiZwKO+DW9rHE2w1eL7DHtqcviljdq42UQaUAGFWljPcETeB3yZytIA1YCWOl
	o+ACEj99giKzwAG4m8gVL63paHqdrmwTeOGOBqexbvC9lvU3rf57pCxpjyYzYhdaQ+Ffv1S1qqgzk
	6iX5Nq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5yo-0000000G6Os-3xk1;
	Wed, 28 Jan 2026 13:53:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5yl-0000000G6OQ-1WT3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 13:53:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vl5yd-000670-RO; Wed, 28 Jan 2026 14:52:59 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vl5yc-002vZ3-1y;
	Wed, 28 Jan 2026 14:52:57 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vl5yb-00000000BPZ-3Yu7;
	Wed, 28 Jan 2026 14:52:57 +0100
Message-ID: <52ea6b98b27235f10008406de45cdcecc2a7b105.camel@pengutronix.de>
Subject: Re: [PATCH net-next 1/3] net: stmmac: rk: fix missing
 reset_control_put()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Heiko
 Stuebner <heiko@sntech.de>,  Jakub Kicinski	 <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 	linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, 	netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>
Date: Wed, 28 Jan 2026 14:52:57 +0100
In-Reply-To: <aXn-7LWRk5cZjno8@shell.armlinux.org.uk>
References: <aXnrzIbZN-gaZTia@shell.armlinux.org.uk>
	 <E1vl3Fv-00000006v3L-215v@rmk-PC.armlinux.org.uk>
	 <c8a10b5355b750cfc83a7f746347175ab40b64d7.camel@pengutronix.de>
	 <aXn-7LWRk5cZjno8@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_055307_424179_4E1A8544 
X-CRM114-Status: GOOD (  29.76  )
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

On Mi, 2026-01-28 at 12:19 +0000, Russell King (Oracle) wrote:
> On Wed, Jan 28, 2026 at 01:04:21PM +0100, Philipp Zabel wrote:
> > On Mi, 2026-01-28 at 10:58 +0000, Russell King (Oracle) wrote:
> > > rk_gmac_setup() delves into the PHY's DT node to retrieve its reset
> > > control using of_reset_control_get(). However, it never releases it
> > > when the driver is removed. Add reset_control_put() to rk_gmac_exit()
> > > to clean this up.
> > >=20
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers=
/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > index 5f8d2031b97c..bc69cbb5a7d4 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > @@ -1784,6 +1784,8 @@ static void rk_gmac_exit(struct device *dev, vo=
id *bsp_priv_)
> > > =20
> > >  	if (priv->plat->phy_node && bsp_priv->integrated_phy)
> > >  		clk_put(bsp_priv->clk_phy);
> > > +
> > > +	reset_control_put(bsp_priv->phy_reset);
> > >  }
> > > =20
> > >  static int rk_gmac_probe(struct platform_device *pdev)
> >=20
> > This is fine because the driver sets plat_dat->suspend, and so
> > rk_gmac_exit() is never called via stmmac_pltfr_exit() during suspend.
> >=20
> > It does look a bit sketchy to release resources in the rk_gmac_exit()
> > counterpart to rk_gmac_init(), which never requested the resources,
> > though. Maybe use devm_add_action_or_reset() to register the release of
> > the reset during remove?
>=20
> Thanks, but I think a sense of proportion is required here. This
> patch is the result of introducing the ->init() method, and AI
> noticing that there was no cleanup of this resource. This was the
> simplest way to implement that cleanup.
>=20
> However, your review commit also applies to bsp_priv->clk_phy which
> has the same problem - this also isn't obtained in rk_gmac_init(),
> but in rk_gmac_clk_init().
>

> Given that, and the fact that this entire series is already
> considerably big (it was 21 patches, then 22, now 23, and with this
> it's going to become 24 patches) I'm going to say that this issue
> can be addressed at a later time.

No objection,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

