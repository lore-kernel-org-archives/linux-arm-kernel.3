Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4556360A2610
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 02:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xop1Ulsx;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZnxXNoL4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ig9ryT9lQ5WH61asJrWLJKKAff4oOz6FkZcoxGtITzU=; b=xop1UlsxPjUzJqzN4rfFTU6b8I
	aTRkgweSBUWsRl3gM8lOUB2ZGdpL691RP9gTHqHU+D+kOmVkrSgXe4nQCr8ktfCNmJ10KlfbfhN26
	y9ASv52rgfwNaSdRxYBQwvRfl5CtDRQ5Em6Zn3eOXJlZfl5D1EYcBByqnBLL6LHxVef9xVqEB537a
	HIF+CsAmMi4cC0en0V3c4PGgAeHs2kgvZKbqMcp3ziZX8kFvaw4dYBdYQhfKr5d3iIvQqDdKC02Rj
	NflHkPeiaskalap3Gn6tnMs7WPitCT7ZVerKERftF7noPpcWtqNSZeV4rktyoNlxERL+9rAC3ctd6
	yUYuknRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFTU-00000008AXj-0LuE;
	Thu, 29 Oct 2026 02:02:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFTS-00000008AXV-0rJ7;
	Thu, 29 Oct 2026 02:02:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 30F9541311;
	Thu, 29 Oct 2026 02:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5ACB1F031E2;
	Thu, 29 Oct 2026 02:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793239357;
	bh=ig9ryT9lQ5WH61asJrWLJKKAff4oOz6FkZcoxGtITzU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZnxXNoL4Q40oWbzyvpUY0pLFjvFN9FK/DXVtODmCrRREcQk6rgGKqY0vLZVrupTcn
	 kqh7lvT35zYATayZeC0ejUHkuQdv2ZSgJmuIaRab3Pc0l/KSN8qSk23jsWXdJeaOaQ
	 sGQZhBXkf8KdYVHpLtlQaIC2gSBtuY4oaMD44xeXNOnVgiVvQh7nsSjOq89cDQACEI
	 ALKTSCmEwHySp6di+9UQlBJOMzGZBCokVke1li215uVNRoTfBPqScGn5CfdUDUQmZf
	 VUbR2NhuIUm3I1FRtMaKPz50O45m8TzLhZe15/JveDUGw818MUP2rTq6fxHkmLOM7L
	 fjDEok5axoDNA==
Subject: Re: [PATCH v3 1/7] net: dsa: mt7530: get ctrl phy addr using a function
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
Date: Thu, 29 Oct 2026 02:02:35 +0000
Message-ID: <179323935516.3134.4150149245635529305@kernel.org>
In-Reply-To: <20261028011317.1557238-2-cjd@cjdns.fr>
References: <20261028011317.1557238-2-cjd@cjdns.fr>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The new helper mt753x_ctrl_phy_addr()
  (drivers/net/dsa/mt7530.c:49-57) handles a NULL priv->mdiodev by…
- [Low] The commit message says the control PHY is found by taking the
  switch's MDIO address, adding 1, and taking it "modulo 31".

--

net: dsa: mt7530: get ctrl phy addr using a function

This commit replaces the MT753X_CTRL_PHY_ADDR() macro with a
mt753x_ctrl_phy_addr() helper. The helper warns and returns 0 when
priv->mdiodev is NULL. It is also meant to give MMIO implementations a
place to supply their own control PHY address.

> The switch is typically on
> MDIO address 31 and the PHYs are 0, 1, 2, 3, and 4 with 0 being the
> special one. So taking the address of mdiodev (the switch) add 1 and
> modulo 31 finds the first PHY.

[Severity: Low]
Is "modulo 31" right here? The code computes:

    (priv->mdiodev->addr + 1) & (PHY_MAX_ADDR - 1)

PHY_MAX_ADDR is 32, so this masks with 31, which is modulo 32. For a
switch at address 31, (31 + 1) % 31 would give 1. The code gives 0,
which is the PHY the message calls the special one.

Should this say modulo 32, or say that it wraps around the 32-address
MDIO space?

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 7781a63b4e6fd..d10194488bdee 100644
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

[Severity: Low]
When priv->mdiodev is NULL, this returns 0. That is also a valid PHY
address, so callers can't tell the fallback from a real result.

At this commit, core_write() and core_rmw() then use priv->bus without
checking it:

    struct mii_bus *bus = priv->bus;
    ...
    ret = bus->write(bus, ctl_phy, MII_MMD_CTRL, MDIO_MMD_VEND2);

On MMIO devices, mt7988_probe() sets priv->bus = NULL and never sets
mdiodev. If the fallback were hit there, could the WARN be followed by a
NULL bus dereference in core_write() or core_rmw()?

In mt7531_setup(), the same fallback would send the CORE_PLL_GROUP4
write and the EEE advertisement writes to PHYs 0 to 4.

This doesn't look reachable at this commit. Every caller runs only for
MT7530/MT7621/MT7531, which are probed through mt7530-mdio.c and always
have both priv->bus and priv->mdiodev set.

Two later patches in the series also cover this:

  - "net: dsa: mediatek: support PLL setup on MMIO MT7530" adds a
    child_bus fallback and a WARN_ON_ONCE(!bus) check to core_write()
    and core_rmw().
  - "net: dsa: mediatek: support EN751221 switch" adds the EN751221
    special case to this helper.

That leaves a design question. Should the helper return an error for a
missing mdiodev, so callers can bail out instead of using address 0?

> +
> +	/* Default is 1st PHY */
> +	return (priv->mdiodev->addr + 1) & (PHY_MAX_ADDR - 1);
> +}
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261028011317.1557238-1-cjd%40cjdns.fr

