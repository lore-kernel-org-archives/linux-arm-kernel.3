Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C6FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iw/s6OMG43ULsx4UXStKq7FqeOmxKAHk2WEArxE2pKc=; b=TMsi9ZlLLMmj0U+TTqHo1/NYCU
	Kcop0mdCVmAlZHIqQfKNUqfN/za2D1GcvHotPVTw7L3SnvQfsrjE9AJqisL0fJ9+AWuF1RrzNyyt8
	1XrsdZIEUE5GIH1Xp/6sQj110cByR3aKtyAys7EJkZpA9UkC6OBtA25t5JZc2NOpNuT2eMZY6ERTT
	zfNNWGZZa2OEY9GrsMF+Ht+90yYCw6l7rdRP5ipaICWq/vydwZ1WzF/qD1W8B4aG/qk2rKiWdSuO0
	xnLsRK3cal2wjrXLggrtzYCmgkJmVnnmGyRhGidxmXYB6x3FTpO2Xh+oE7ZAHWNkLC/0F3ytqa1OU
	jhWu5L9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbWi-00000002SsF-1Ded;
	Mon, 10 Mar 2025 11:42:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1traxb-00000002N4M-07ph;
	Mon, 10 Mar 2025 11:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Iw/s6OMG43ULsx4UXStKq7FqeOmxKAHk2WEArxE2pKc=; b=EORwAhbX8xg68mKTCSZ8Cd4emp
	72FX7gvakjH7BgEDp4dCeBtZPaJNNudFmrcMoRorA8RboAINJFMXRmz18BuRI6UJOfG6NlXKAnStJ
	U1Bnz8sje/QPQhE/CsOk8XVVF2PoXdiQRWlXF9NWW22HVFvkHssgad2+BiCfQll4YgFMwGm8R+fXm
	VaFTmKi+Me65kz+CCSq7Qw6IgNgT2YUC11negNR3qvEFMmsdhU1LzWuRLB4SjEEIElcFl+iS+J8UB
	yQO4ntjt19o3zayOgCKopfjtDFP7Zdg/LozF+SZ6mkUBHm/Poj9rXthJJLKwvw0NzzvM9yqbfC9sf
	k8tjv3Ow==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47598)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1traxJ-0002RJ-11;
	Mon, 10 Mar 2025 11:05:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1traxF-0002PQ-1W;
	Mon, 10 Mar 2025 11:05:53 +0000
Date: Mon, 10 Mar 2025 11:05:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v12 12/13] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <Z87HkcdK2QTjooDK@shell.armlinux.org.uk>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-13-ansuelsmth@gmail.com>
 <Z83WgMeg_IxgbxhO@shell.armlinux.org.uk>
 <67cec5a9.170a0220.93f86.9dcf@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67cec5a9.170a0220.93f86.9dcf@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_040615_070427_255AF387 
X-CRM114-Status: GOOD (  17.36  )
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

On Mon, Mar 10, 2025 at 11:57:41AM +0100, Christian Marangi wrote:
> > > +static int an8855_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
> > > +			     phy_interface_t interface,
> > > +			     const unsigned long *advertising,
> > > +			     bool permit_pause_to_mac)
> > > +{
> > > +	struct an8855_priv *priv = container_of(pcs, struct an8855_priv, pcs);
> > > +	u32 val;
> > > +	int ret;
> > > +
> > > +	/*                   !!! WELCOME TO HELL !!!                   */
> > > +
> > [... hell ...]
> 
> Will drop :( It was an easter egg for the 300 lines to configure PCS.

That wasn't a request to drop the comment, just that I didn't want to
include all that in my reply.

> > I guess, however, that as you're only using SGMII with in-band, it
> > probably doesn't make much difference, but having similar behaviour
> > in the various drivers helps with ongoing maintenance.
> 
> Do we have some driver that implement the logic of skipping the bulk of
> configuration if the mode doesn't change?

For many, it doesn't matter, but for e.g. xpcs, there may be a reset
of the XPCS when the mode changes, and there's workarounds for the
TXGBE - both of those only happen when the interface mode actually
changes.

Re-reading my .pcs_config() documentation, I really ought to mention
that .pcs_config() will be called for both interface mode changes and
for advertisement changes, and should not disrupt the link when
nothing has changed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

