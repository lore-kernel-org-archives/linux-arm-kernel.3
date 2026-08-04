Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29084C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 02:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoFvMGhDfDOW3E0MWAosEdNVj/krmvIXG4EI2giGr74=; b=Dgz5UhmL0l5ILNL/P7qz6Mzef2
	x3rIQ1zfFM6n7IPO08z4FggnY/3gYjD4GlqdonM3A3lBCMA93/AbuvnYX88ZXVe9794WB9LH34ETQ
	Cwpep0MwboxZBwrT3eGWVeaSw1OaxgXEZQsro4LNAKxJWYxsW9Xl8uP6YUv2Z+4frRdxgQu1kxuoG
	dGTXs4fCtLHJ6EGitzvTGVarAItK1s8+/paT34tkAfjyQ6MJQshbB9UHtpCLkXhted5VNSQBdJDzv
	4HNasRZy4MHJ2va8DCR7JnskZVeAYn2AWqjjFBM4r799hI3S6Ybg+ggIe79As8Sla5kepC2BaWb5q
	OcQ3srYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4bG-00000000oj8-3L5w;
	Tue, 04 Aug 2026 02:09:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4bD-00000000oij-3y2a;
	Tue, 04 Aug 2026 02:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aoFvMGhDfDOW3E0MWAosEdNVj/krmvIXG4EI2giGr74=; b=RbyfqlqHrxEumvBY/2y7FRqbcl
	pAYtP/nvcihbG9J88Ay7b7meG19LkAVtrDkZtk2kOflzK/VAfb0Hd/N86Q5IKWdW6GeAYd0ddSzVT
	WuqgusIf6vUidQ6HV9ohD3M1u2kA0xg7fi3ZjlGH8jqUPKiI3hNwHHmZYxm3/HyKgeVQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wr4ay-00FtKw-Ek; Tue, 04 Aug 2026 04:09:32 +0200
Date: Tue, 4 Aug 2026 04:09:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 5/5] net: dsa: mt7530: serialize the regmap IRQ
 chip like every other user
Message-ID: <33c097a2-6b88-4b43-b378-c9c90988c9b9@lunn.ch>
References: <cover.1785368701.git.daniel@makrotopia.org>
 <b28df01d04c0e50c3d44ca2f29b12260bc32072d.1785368701.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b28df01d04c0e50c3d44ca2f29b12260bc32072d.1785368701.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_190947_982293_151FFC5D 
X-CRM114-Status: GOOD (  19.64  )
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

On Thu, Jul 30, 2026 at 01:15:06AM +0100, Daniel Golle wrote:
> The switch register regmap is created with .disable_locking = true;
> every other user in this driver calls mt7530_mutex_lock()/unlock()
> around it, which takes priv->bus->mdio_lock, since the underlying
> mt7530_regmap_read()/write() issue raw, unserialized bus->read()/
> write() MDIO transactions.
> 
> mt7530_setup_irq() hands this same unlocked regmap straight to
> devm_regmap_add_irq_chip_fwnode(), whose threaded IRQ handler then
> calls regmap_read()/regmap_update_bits() on it without ever calling
> mt7530_mutex_lock(). An interrupt firing while another thread is
> mid-transaction on the same regmap (e.g. a paged register access, or
> an indirect PHY access) can interleave with the IRQ handler's own
> paged access and corrupt page selection on either side.
> 
> Use struct regmap_irq_chip's handle_mask_sync hook to call
> mt7530_mutex_lock()/unlock() around the mask register write regmap-irq
> issues whenever a consumer of one of the mapped sub-IRQs enables,
> disables, requests or frees its line. This needs a per-device copy of
> mt7530_regmap_irq_chip, since devm_regmap_add_irq_chip_fwnode() keeps
> a pointer to it rather than copying it.
> 
> handle_pre_irq/handle_post_irq, which would additionally cover the
> status read and ack write the threaded handler does directly, bracket
> the whole handler including its handle_nested_irq() calls. Lockdep
> caught this on hardware: those calls reach phy_interrupt() for the
> per-port PHY IRQ lines mapped through this chip, which takes
> phydev->lock, while phy_attach_direct() and this driver's own indirect
> PHY access already establish the opposite order (phydev->lock, then
> priv->bus->mdio_lock) elsewhere. Using them here would close that
> cycle, so they are not used.
> 
> regmap_irq_sync_unlock() also has its own init_ack_masked path, used
> by this chip, which unconditionally does its own regmap_write() to ack
> currently-masked IRQs; that path has no per-driver hook. Together with
> the threaded handler's own status read and ack write, these stay
> unprotected -- a narrower, harder-to-hit gap than the recurring mask
> sync above -- and will be closed once the switch regmap moves to
> regmap's own locking in the driver-wide register access cleanup.
> 
> Fixes: 254f6b272e3b ("dsa: mt7530: Utilize REGMAP_IRQ for interrupt handling")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

