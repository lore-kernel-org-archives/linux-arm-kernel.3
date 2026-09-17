Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3E0C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQHMw6r6nqwobnl9nv1snvYpl3KQBT9u5YNt9xRmdv4=; b=R42OeSmAXtIpKnqrRGRTPR5rEs
	AyibkMwfAYukH3LOh8EllJ/uwXx3v1ZAt1ckSvw5Wo570mIXIz3jVuBkrCuUa59GUWTufxgFE6HWT
	HhmLSxRJs7nDIA3ow20+OTIH16f/qp7x1WTpqZadi+X9f/Q5lzoHonVKi8PsmLKN/zl47JQl1UHVl
	kAFJDjpS+YlNwUTlJcd0drj88MxlpaIv1W5Lqqmf5uKqbRH2fX/X7XF5jf5CJYwcsjDEyVB8sA6X3
	KwrxQvvH9wgMh4wFEkrewDp+Su/RHNK9NPBxdgvD4/uZ6W6IzsL9nxPPwKQ9ZlvgtVSK6ltgaE346
	iT2V1o1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77RQ-0000000AtRN-3D7a;
	Thu, 17 Sep 2026 08:26:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77RP-0000000AtR0-22uc;
	Thu, 17 Sep 2026 08:25:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18352447B3;
	Thu, 17 Sep 2026 08:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D30A1F00898;
	Thu, 17 Sep 2026 08:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633559;
	bh=mQHMw6r6nqwobnl9nv1snvYpl3KQBT9u5YNt9xRmdv4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cdNRKdw15K5pQanHCrNPdxNthlj1Wz1E7eRdhwDsu+dg5M4IqH7Ut6mgSe0GKuW5i
	 YhJJjlq15CyKVda7Vh3xhD8QY/S0oKPif8dn4HSfc1TdH5s235WOGP525F+m8Etvia
	 kQpY17cfhtSebIklwbVJV/t/35NjQuaohRy5fSs12+0xirreM5aORYHWofIDW37S46
	 xEkC8NeDd5JQrBMMpPbMTJ6N0IoXUe++s0kowXwIQdUnxbHwK0zpCm0ko5q5TeDwUw
	 oeq+SB1KjqyZq8enUKaobM1YDqbGmkzGi/aI0djQl1Y4oneNqxopdJYKKrBrDAsUah
	 VOi/JAzMex0TA==
Subject: Re: [PATCH net 2/2] net: dsa: mt7530: unregister the switch before
 freeing its MDIO IRQs
From: netdev-bot+sashiko@kernel.org
To: f@lex.la
Cc: netdev@vger.kernel.org, chester.a.unal@arinc9.com, daniel@makrotopia.org,
 andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Thu, 17 Sep 2026 08:25:57 +0000
Message-ID: <178963355760.22033.11986863924471016494@kernel.org>
In-Reply-To: <20260914202421.2737079-3-f@lex.la>
References: <20260914202421.2737079-3-f@lex.la>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 0 (1) · Low: 0

- [High] Incomplete fix: mt7530_remove_common()
  (drivers/net/dsa/mt7530.c:3593-3602) still calls…

Pre-existing issues:
- [Medium] Power-sequencing ordering on the MDIO front end:
  mt7530_remove() in drivers/net/dsa/mt7530-mdio.c disables…

--

net: dsa: mt7530: unregister the switch before freeing its MDIO IRQs

This moves dsa_unregister_switch() ahead of the per-PHY interrupt
disposal in mt7530_remove_common(), so that phylib frees the nested PHY
interrupts before their mappings are destroyed. The reported symptom is a
remove_proc_entry() warning from irq_free_descs() followed by a NULL
dereference in handle_nested_irq().

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 3e61eb3c2b1e2..90fd04665ebf1 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -3593,11 +3593,11 @@ EXPORT_SYMBOL_GPL(mt7530_probe_common);
>  void
>  mt7530_remove_common(struct mt7530_priv *priv)
>  {
> +	dsa_unregister_switch(priv->ds);
> +
>  	if (priv->irq_domain)
>  		mt7530_free_mdio_irq(priv);

[Severity: High]
Does this reorder actually close the handle_nested_irq() fault described
in the changelog, or does it only close the phylib half of it?

The parent threaded interrupt is owned by devres.  mt7530_setup_irq()
registers the chip with devm_regmap_add_irq_chip_fwnode() and keeps only
the domain pointer:

drivers/net/dsa/mt7530.c:mt7530_setup_irq() {
	ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
					      priv->regmap, irq,
					      IRQF_ONESHOT,
					      0, chip,
					      &irq_data);
	...
	priv->irq_domain = regmap_irq_get_domain(irq_data);
}

so free_irq() on the parent and irq_domain_remove() happen only from the
devres release, devm_regmap_irq_chip_release() -> regmap_del_irq_chip(),
which runs after mt7530_remove() has returned.  Nothing in
mt7530_remove_common() disables, frees or synchronizes against that
parent IRQ, so the regmap-irq thread is still live while
mt7530_free_mdio_irq() destroys the mappings.

On the thread side there is no zero check on the lookup:

drivers/base/regmap/regmap-irq.c:regmap_irq_thread() {
	...
		data->status_buf[i] &= ~data->mask_buf[i];
	...
			handle_nested_irq(irq_find_mapping(data->domain, i));
}

mask_buf is read there without data->lock, so the thread can carry a
pre-mask snapshot past the filter.  Can the following still happen with
this patch applied, on a part with a PHY_LC bit latched?

  regmap_irq_thread()			mt7530_remove_common()
    read_irq_data(), PHY0_LC set
    passes the mask_buf filter
					dsa_unregister_switch()
					  phy_disconnect()
					    phy_free_interrupt()
					      free_irq(nested virq)
					mt7530_free_mdio_irq()
					  irq_dispose_mapping()
    irq_find_mapping() -> 0
    handle_nested_irq(0)

kernel/irq/chip.c:handle_nested_irq() has no NULL check:

	struct irq_desc *desc = irq_to_desc(irq);
	...
	scoped_guard(raw_spinlock_irq, &desc->lock) {

which is the read at handle_nested_irq+0xac quoted in the changelog.

Is the driver-side disposal loop needed at all?  regmap_del_irq_chip()
already walks the domain and disposes every mapping, and it does so in
the safe order:

drivers/base/regmap/regmap-irq.c:regmap_del_irq_chip() {
	free_irq(irq, d);

	/* Dispose all virtual irq from irq domain before removing it */
	...
}

Would dropping mt7530_free_mdio_irq() from the remove path (leaving the
disposal to regmap_del_irq_chip(), which runs after the parent IRQ is
freed) be a better fix than moving it after dsa_unregister_switch()?

> -	dsa_unregister_switch(priv->ds);
> -
>  	mutex_destroy(&priv->reg_mutex);
>  }
>  EXPORT_SYMBOL_GPL(mt7530_remove_common);

[Severity: Medium]
This is a pre-existing ordering problem and not something this patch
introduces, but it interacts with the new placement of
dsa_unregister_switch(), so it may be worth mentioning.

On the MDIO front end the supplies are dropped before any of this runs:

drivers/net/dsa/mt7530-mdio.c:mt7530_remove() {
	if (priv->id == ID_MT7530) {
		ret = regulator_disable(priv->core_pwr);
		...
		ret = regulator_disable(priv->io_pwr);
		...
	}

	mt7530_remove_common(priv);
}

After this patch the whole register-level teardown reached from
dsa_unregister_switch() - internal PHY power-down, port disable writes,
and the regmap-irq mask sync that clears the PHY_LC bits through
mt7530_irq_mask_sync() - is the first thing mt7530_remove_common() does,
i.e. entirely after core_pwr and io_pwr were released on ID_MT7530.

Can those writes still reach the chip?  MDIO writes are unacknowledged,
and regmap-irq updates its mask_buf shadow regardless of what
handle_mask_sync() returns:

drivers/net/dsa/mt7530.c:mt7530_irq_mask_sync() {
	ret = regmap_update_bits(priv->regmap, MT7530_SYS_INT_EN,
				 mask_buf_def, ~mask_buf);
	...
}

so MT7530_SYS_INT_EN can be left armed and MT7530_SYS_INT_STS latched
while software believes they are masked.  MT7530_TOP_SIG_CTRL's
TOP_SIG_CTRL_NORMAL bit, set in mt7530_setup_irq(), likewise has no
teardown counterpart.  Should the regulator_disable() calls move after
mt7530_remove_common() instead?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260914202421.2737079-1-f%40lex.la

