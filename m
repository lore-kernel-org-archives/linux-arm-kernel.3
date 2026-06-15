Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96274CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJEnxYGCbj5TvE1QVpgrLjoHAqGb8zTkxlQcMAr3Mig=; b=3gd0HdiafPVgR230bgYe9ZpugT
	VKXf1WHJ7X5IfOG5pquZGz3yW7UwEe+o7P96uKIC2xTIXC746HnhjZjPe4ilqPmY7xusSvGJq33PE
	FpP/LzvWpuUJ6r+bhUx6ZfNeDP+JkqGy3ea+NRwjMHSOlRkjkiPNwyUdyCP1aGb8yzRymmOQ5J4Ah
	UAQvMzSq2+MNKwoke4UkxK7kvLTsGJvoxFOEIZxyXfMwUkMSySXy9IAbyuhYpYDbnmB86DBx+scAU
	u4D+brh0UdUUYzmdPyjOsKsnmA5BuhoQ/aO5VqlJ1mI2y/nnGH2PXa1Ko4eXvkVSKXCCjDPgY9ZxR
	qyZ0e20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHAl-0000000EyOX-1SKh;
	Mon, 15 Jun 2026 23:56:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHAj-0000000EyOO-1V1D;
	Mon, 15 Jun 2026 23:56:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 959B0439E6;
	Mon, 15 Jun 2026 23:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6311F000E9;
	Mon, 15 Jun 2026 23:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781567812;
	bh=lJEnxYGCbj5TvE1QVpgrLjoHAqGb8zTkxlQcMAr3Mig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kymMV65vyu5+28IZrhslIGMndd1tbyO2pRIHwA8OvR/XcWwZyOu922lY3xxiesC5h
	 nNEc553Wo/AmWZ/w+wXm06HfQw9BEX2VGQKNkMpzwTr+c4O+fyg4pzNFtA1eIjTDBS
	 op3wV7lBYkR12fZAw5YLpvbkZrIYMiDVH+k89T/qxL+rb1iWy+pgGT1Yy6X8tAP2gx
	 SYz31a6Yt3F0jcSXSkJFxMEe/S1N9330yBfItlAA+R8jr048bdDaugarWPFZ6TzZzs
	 S7n/ecuxY/pE1dLYa4UJzJSNzCroYSMveax6meWUL6rJVp8QlDk91kgPEnPG1yh68n
	 hyjVXOJOiPzPA==
From: Jakub Kicinski <kuba@kernel.org>
To: daniel@makrotopia.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	chester.a.unal@arinc9.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 5/8] net: dsa: mt7530: replace mt7530_read with regmap_read
Date: Mon, 15 Jun 2026 16:56:49 -0700
Message-ID: <20260615235649.1060736-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <c6fc9cfae9762bf8d8a136339c91d4a76a307355.1781312667.git.daniel@makrotopia.org>
References: <c6fc9cfae9762bf8d8a136339c91d4a76a307355.1781312667.git.daniel@makrotopia.org>
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
net: dsa: mt7530: replace mt7530_read with regmap_read

This commit removes the mt7530_read() wrapper and converts every caller
to use regmap_read() directly. The WARN_ON_ONCE / dev_err and the
return-zero-on-failure behaviour the wrapper provided are dropped.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index fe7e4ab5ae9c..4168adca949f 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -152,28 +152,15 @@ core_clear(struct mt7530_priv *priv, u32 reg, u32 val)
>  
>  
>  static u32
> -mt7530_read(struct mt7530_priv *priv, u32 reg)
> +mt7530_mii_poll(struct mt7530_dummy_poll *p)
>  {
> -	int ret;
>  	u32 val;
>  
> -	ret = regmap_read(priv->regmap, reg, &val);
> -	if (ret) {
> -		WARN_ON_ONCE(1);
> -		dev_err(priv->dev,
> -			"failed to read mt7530 register\n");
> -		return 0;
> -	}
> +	regmap_read(p->priv->regmap, p->reg, &val);
>  
>  	return val;
>  }

[Medium]
The old wrapper guaranteed val == 0 on failure. The new mt7530_mii_poll()
declares val without an initializer and ignores the regmap_read() return
code, so on a failed underlying transfer val is whatever was on the stack.

Looking at drivers/net/dsa/mt7530-mdio.c::mt7530_regmap_read():

    ret = bus->write(bus, priv->mdiodev->addr, 0x1f, page);
    if (ret < 0)
        return ret;

    lo = bus->read(bus, priv->mdiodev->addr, r);
    hi = bus->read(bus, priv->mdiodev->addr, 0x10);

    *val = (hi << 16) | (lo & 0xffff);

When the page-select write fails, *val is not written. mt7530_mii_poll()
is the polling callback used by readx_poll_timeout() in mt7530_fdb_cmd(),
mt7530_vlan_cmd(), mt7530_setup() and mt7531_setup() with predicates
such as val != 0 (post-reset stability), !(val & ATC_BUSY) and
!(val & VTCR_BUSY).

Previously a broken MDIO transport produced val == 0 and the post-reset
poll deterministically timed out. Can the new code spuriously satisfy
the val != 0 predicate from an uninitialized stack slot, then feed that
same garbage into (val & MT7530_XTAL_MASK) to choose 25/40 MHz settings
in mt7530_pll_setup()?

> @@ -365,9 +354,9 @@ mt7531_pll_setup(struct mt7530_priv *priv)
>  	u32 hwstrap;
>  	u32 val;
>  
> -	val = mt7530_read(priv, MT7531_CREV);
> -	top_sig = mt7530_read(priv, MT7531_TOP_SIG_SR);
> -	hwstrap = mt7530_read(priv, MT753X_TRAP);
> +	regmap_read(priv->regmap, MT7531_CREV, &val);
> +	regmap_read(priv->regmap, MT7531_TOP_SIG_SR, &top_sig);
> +	regmap_read(priv->regmap, MT753X_TRAP, &hwstrap);

[Medium]
Same concern applies to all the read-modify-write sequences in
mt7531_pll_setup(), e.g.:

    regmap_read(priv->regmap, MT7531_PLLGP_EN, &val);
    val &= ~EN_COREPLL;
    regmap_write(priv->regmap, MT7531_PLLGP_EN, val);

If regmap_read() fails, val is uninitialized and is then OR'd / AND'd
with constants and written straight back into PLLGP / COREPLL control
registers. Was there a reason to drop the wrapper's return-zero (and
WARN_ON_ONCE / dev_err) behaviour without either initializing these
locals to 0 or checking the return code?

> @@ -1010,7 +999,7 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
>  
>  	mutex_lock(&priv->reg_mutex);
>  
> -	val = mt7530_read(priv, MT753X_MTRAP);
> +	regmap_read(priv->regmap, MT753X_MTRAP, &val);

[Low]
mt7530_setup_port5() declares val as int, but regmap_read()'s third
parameter is unsigned int *. The previous code hid this through the
u32 return of mt7530_read() and an implicit assignment conversion;
the direct call now passes &val with mismatched signedness. Should this
be u32 val; like the other call sites in this file (sparse and
-Wpointer-sign would flag this)?

> @@ -2436,7 +2435,7 @@ mt7530_setup(struct dsa_switch *ds)
>  		return ret;
>  	}
>  
> -	id = mt7530_read(priv, MT7530_CREV);
> +	regmap_read(priv->regmap, MT7530_CREV, &id);
>  	id >>= CHIP_NAME_SHIFT;
>  	if (id != MT7530_ID) {
>  		dev_err(priv->dev, "chip %x can't be supported\n", id);

[Medium]
The chip-ID gating in mt7530_setup() and mt7531_setup() was previously
deterministic-fail on MDIO read errors (id == 0 after the wrapper).
With id now uninitialized on failure, can this check spuriously match
or mismatch on garbage and either mis-bind a wrong-id chip or refuse a
real one?

> @@ -2690,7 +2689,7 @@ mt7531_setup(struct dsa_switch *ds)
>  	/* MT7531AE has got two SGMII units. One for port 5, one for port 6.
>  	 * MT7531BE has got only one SGMII unit which is for port 6.
>  	 */
> -	val = mt7530_read(priv, MT7531_TOP_SIG_SR);
> +	regmap_read(priv->regmap, MT7531_TOP_SIG_SR, &val);
>  	priv->p5_sgmii = !!(val & PAD_DUAL_SGMII_EN);

[Medium]
And here, p5_sgmii is set from val & PAD_DUAL_SGMII_EN after an
unchecked read; if the read fails, would this latch a wrong p5_sgmii
state from stack contents and then drive different mt7531_pll_setup()
vs. GPIO mode programming below?

The commit message says:

    The WARN_ON_ONCE error logging is dropped as regmap provides its
    own error handling.

Is that accurate for this driver? regmap_read() does not zero *val on
error and does not log; with all new call sites discarding the return
value, the converted paths appear to have no error handling at all,
which seems like a behavioural regression compared to the prior
wrapper. Would initializing the affected locals to 0 (matching the
old return-zero-on-failure semantics), or checking the regmap_read()
return code at the sites that derive subsequent hardware programming
(chip ID, XTAL select, PLL RMW, post-reset poll), be appropriate here?
-- 
pw-bot: cr

