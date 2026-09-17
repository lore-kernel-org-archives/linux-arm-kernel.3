Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78113C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohFhOKmj5KjBiRS1qNEeimlr+wI8OrtG53flHdiDhJg=; b=ZctwFOPJCsK+hN4JN0SgLhld+M
	Zc3Oo77EYQ8YqyujWgAQgAksFQYdwpv/fP5np3YyS2LhsCJejUBHcPlKaAWa3i98Yghh/j8vAkIoE
	ZysCYaTCrlNMhrhVbQTVYSvZNR9pirNwKqPdU55hhwQ0fVL+Dnf5vpz2mXW0w+NVC8/N2P1I16nfi
	T0gP6NpcX14bv7z0jd+cOZVDMkUT0BqGef0YCvyZFsxedO46rDB8SNAb/IvE5Shut7z1B/ZQbVI92
	3S6W57cDi4NJoXxPp21a7BseQdXueLJBHiWoEbpb+rvXfhkY+MNFb7Jtwdc1FHy5x1q0QMnXFjOMx
	lxgbiuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J3K-0000000CUHp-1a4x;
	Thu, 17 Sep 2026 20:49:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J3J-0000000CUHd-3210;
	Thu, 17 Sep 2026 20:49:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD4D2601EF;
	Thu, 17 Sep 2026 20:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A261F000FF;
	Thu, 17 Sep 2026 20:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789678192;
	bh=ohFhOKmj5KjBiRS1qNEeimlr+wI8OrtG53flHdiDhJg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oin3mRsI5SfVAT1XCKM7RjJ7Ml0i+MzsxJGKdT+ZJw313W4Wihy0hVJqO4YXQyphk
	 xtsfyEVjiPWp8jsHpQBfFkIHA5pm17lR/xUM9mp6OCFj7R2LTAqfgitrzD5A2PDduO
	 pU3gV/TWZhlZ3o1DKjU6Y6P1ZhXIMBNcjBe1MgM7j2G+yZhAgsxAu8GmVoBituXb4+
	 KcMbDZP5fdOGatMldAt3AXX+8PBp6Jf6OLomR4ToBN5KSThZ1muN8KhYf1Z7H7N/Xy
	 cMqJGPMnmioyT7CPOJ1kVAKObaTIuYL1rAuvepibTVn+TpHVpDjaxabySffjnnBt9I
	 zY2neZnKUMGtA==
Subject: Re: [PATCH v2 net-next 1/7] net: dsa: mt7530: get ctrl phy addr using
 a function
From: netdev-bot+sashiko@kernel.org
To: cjd@cjdns.fr
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, linux@armlinux.org.uk,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
Date: Thu, 17 Sep 2026 20:49:50 +0000
Message-ID: <178967819074.22033.14878291873627875469@kernel.org>
In-Reply-To: <20260915174643.253660-2-cjd@cjdns.fr>
References: <20260915174643.253660-2-cjd@cjdns.fr>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 2

- [Low] mt753x_ctrl_phy_addr() (drivers/net/dsa/mt7530.c:49-57) reports
  the !priv->mdiodev case only via WARN_ON_ONCE() and then returns 0 — a…
- [Low] The commit message states the control-PHY address is found by
  'taking the address of mdiodev (the switch) add 1 and modulo 31', but…

--

net: dsa: mt7530: get ctrl phy addr using a function

This replaces the MT753X_CTRL_PHY_ADDR() macro with a new helper,
mt753x_ctrl_phy_addr(), which warns and falls back when priv->mdiodev is
NULL. The intent is to give MMIO based MT7530 implementations a place to
supply their own control PHY address.

A couple of questions below.

>     The MDIO MT7530 has 5 integrated PHYs, of these, the first PHY has
>     the additional registers that are used for such things as configuring
>     the clock configuration for the switch. The switch is typically on
>     MDIO address 31 and the PHYs are 0, 1, 2, 3, and 4 with 0 being the
>     special one. So taking the address of mdiodev (the switch) add 1 and
>     modulo 31 finds the first PHY.

[Severity: Low]
Should "modulo 31" read "modulo 32" here?  The helper computes:

	return (priv->mdiodev->addr + 1) & (PHY_MAX_ADDR - 1);

and include/linux/phy.h has:

	#define PHY_MAX_ADDR	32

so the mask is 31 and the arithmetic is modulo 32.  For the typical strap
described in the message, (31 + 1) % 32 == 0, which is the first integrated
PHY, whereas (31 + 1) % 31 == 1.  Perhaps "modulo 32", or "masked with 31",
would describe it better.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 14692497e1a61..54d931002bc14 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -46,6 +46,16 @@ static const struct mt7530_mib_desc mt7530_mib[] = {
>  	MIB_DESC(1, MT7530_PORT_MIB_RX_ARL_DROP, "RxArlDrop"),
>  };
>  
> +static int
> +mt753x_ctrl_phy_addr(struct mt7530_priv *priv)
> +{
> +	if (WARN_ON_ONCE(!priv->mdiodev))
> +		return 0;
> +
> +	/* Default is 1st PHY */
> +	return (priv->mdiodev->addr + 1) & (PHY_MAX_ADDR - 1);
> +}
> +

[Severity: Low]
Is 0 a usable way to signal the !priv->mdiodev case?  0 is also the normal
result for a switch strapped at MDIO address 31, so callers cannot tell the
two apart, and none of the three call sites checks the return value.

There is a related question about what happens after the warning fires.
priv->bus and priv->mdiodev are only assigned together in mt7530-mdio.c,
while mt7530-mmio.c mt7988_probe() does:

	priv->bus = NULL;

and never sets priv->mdiodev.  So the WARN_ON_ONCE() branch and a NULL
priv->bus are the same condition, and in core_write()/core_rmw() at this
commit the warning falls through into the bus dereference below rather than
aborting.  Note mt7530_mutex_lock()/mt7530_mutex_unlock() in the same path
do guard on priv->bus.

I could not find an in-tree path that reaches the warning at this commit:
core_write()/core_rmw() are reached from mt7530_pll_setup() and
mt7530_setup_port5/6() (ID_MT7530/ID_MT7621), and mt7531_setup() runs for
ID_MT7531, all of which are probed through mt7530-mdio.c.  Later in the
series, "net: dsa: mediatek: support PLL setup on MMIO MT7530" adds

	if (!bus)
		bus = priv->child_bus;

	if (WARN_ON_ONCE(!bus))
		return;

to both functions, and mt753x_ctrl_phy_addr() gains an ID_EN751221 case
returning 12, so both aspects are handled inside the same series.  Would it
still be preferable to return a negative errno here and check it at the call
sites, so the fallback value is not a valid PHY address?

>  static void
>  mt7530_mutex_lock(struct mt7530_priv *priv)
>  {
> @@ -63,32 +73,30 @@ mt7530_mutex_unlock(struct mt7530_priv *priv)
>  static void
>  core_write(struct mt7530_priv *priv, u32 reg, u32 val)
>  {
> +	int ctl_phy = mt753x_ctrl_phy_addr(priv);
>  	struct mii_bus *bus = priv->bus;
>  	int ret;
>  
>  	mt7530_mutex_lock(priv);
>  
>  	/* Write the desired MMD Devad */
> -	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
> -			 MII_MMD_CTRL, MDIO_MMD_VEND2);
> +	ret = bus->write(bus, ctl_phy, MII_MMD_CTRL, MDIO_MMD_VEND2);
>  	if (ret < 0)
>  		goto err;

[ ... ]

> @@ -99,6 +107,7 @@ core_write(struct mt7530_priv *priv, u32 reg, u32 val)
>  static void
>  core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
>  {
> +	int ctl_phy = mt753x_ctrl_phy_addr(priv);
>  	struct mii_bus *bus = priv->bus;
>  	u32 val;
>  	int ret;

[ ... ]

> @@ -2674,8 +2679,11 @@ mt7531_setup(struct dsa_switch *ds)
>  {
>  	struct mt7530_priv *priv = ds->priv;
>  	u32 val, id;
> +	int ctl_phy;
>  	int ret, i;
>  
> +	ctl_phy = mt753x_ctrl_phy_addr(priv);
> +

Same question here: ctl_phy is used unchecked as the address for the
CORE_PLL_GROUP4 read/write and as the base of the EEE advertisement loop,
so a fallback of 0 would silently target PHY address 0 through 4.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915174643.253660-1-cjd%40cjdns.fr

