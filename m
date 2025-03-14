Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09374C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 21:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQMpACQDEvSJ3LL9uNYMMa8tYX+iwHFV5B8Acn+A7NM=; b=vDx53VSryQdq2zQiypUm9QqNhw
	7dmY8DpcOCUsMnQHlBqd4HXohVxp6l+4MXruAbpk1RBJ49zzGtBPl8qqolbgI3JjWSJ76p6p35P0s
	bEn8Z9IMxBCH70bG++UKrQGlnbGbIoGjt84zeOU1niC5Xl3D4cLFWjxzpup6UYeIWurCQR3WjGHdx
	jDBpbyFSaJj4tTrIDBqcsdJdTSTzyVEb/ZNnl7Fu02J7N2i4hHs4LCCMUJSzyFh1pmcs5rO04l+3U
	oRrdp/XaB4M/yIgVQBBXC72Xj3VhQrmZYHDafG8qRShjxOw0+JWCTIYGIwZ4JYqPsKNlZtyi0j1Rg
	eqThUcfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCCT-0000000FHPf-3Sk3;
	Fri, 14 Mar 2025 21:04:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCAm-0000000FHAN-2Uga;
	Fri, 14 Mar 2025 21:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jQMpACQDEvSJ3LL9uNYMMa8tYX+iwHFV5B8Acn+A7NM=; b=xC6gYtgIocDWFn1aEV572tI1rw
	4fXPLe1O5+oujAN9PJs24k6kXQSQxVEU40H29/f+KYsjCjSZ6xx3V0PYBozfywta9s9hmqdYDNDeY
	ofbtmn+L1Jo3VcD3VRLUdtLwe56mIxxCwLNpOqB4BY19h1NMuqaR9eHd9xslqIKTB9c/JJVJUtEim
	8Svo9GUhQLumK7nMjrtf/SCnxtM9tkCBecoIqgyO8oHkW57zAhKWLz58lU+4f4c54WoPVjYQmgwa4
	P++O7POVC46szY5kYCkAauBaVkOz71R4qEUC0AEPQvQNzLORqBtY6/VeyQHNKjy7fq4I4OZfNIGQj
	GjiXqeuA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45512)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ttCAO-0000r5-0z;
	Fri, 14 Mar 2025 21:02:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ttCAH-0006to-0T;
	Fri, 14 Mar 2025 21:01:57 +0000
Date: Fri, 14 Mar 2025 21:01:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [net-next PATCH v12 07/13] net: mdio: regmap: add support for
 multiple valid addr
Message-ID: <Z9SZRDykbTwvGW6S@shell.armlinux.org.uk>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-8-ansuelsmth@gmail.com>
 <Z83RsW1_bzoEWheo@shell.armlinux.org.uk>
 <67cdd3c9.df0a0220.1c827e.b244@mx.google.com>
 <0c6cb801-5592-4449-b776-a337161b3326@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c6cb801-5592-4449-b776-a337161b3326@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_140228_637735_1A6905D2 
X-CRM114-Status: GOOD (  22.21  )
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

On Fri, Mar 14, 2025 at 08:41:33PM +0100, Andrew Lunn wrote:
> On Sun, Mar 09, 2025 at 06:45:43PM +0100, Christian Marangi wrote:
> > On Sun, Mar 09, 2025 at 05:36:49PM +0000, Russell King (Oracle) wrote:
> > > On Sun, Mar 09, 2025 at 06:26:52PM +0100, Christian Marangi wrote:
> > > > +/* If a non empty valid_addr_mask is passed, PHY address and
> > > > + * read/write register are encoded in the regmap register
> > > > + * by placing the register in the first 16 bits and the PHY address
> > > > + * right after.
> > > > + */
> > > > +#define MDIO_REGMAP_PHY_ADDR		GENMASK(20, 16)
> > > > +#define MDIO_REGMAP_PHY_REG		GENMASK(15, 0)
> > > 
> > > Clause 45 PHYs have 5 bits of PHY address, then 5 bits of mmd address,
> > > and then 16 bits of register address - significant in that order. Can
> > > we adjust the mask for the PHY address later to add the MMD between
> > > the PHY address and register number?
> > >
> > 
> > Honestly to future proof this, I think a good idea might be to add
> > helper to encode these info and use Clause 45 format even for C22.
> > Maybe we can use an extra bit to signal if the format is C22 or C45.
> > 
> > BIT(26) 0: C22 1:C45
> > GENMASK(25, 21) PHY ADDR
> > GENMASK(20, 16) MMD ADDR
> > GENMASK(15, 0) REG
> 
> If you look back at older kernels, there was some helpers to do
> something like this, but the C22/C45 was in bit 31. When i cleaned up
> MDIO drivers to have separate C22 and C45 read/write functions, they
> become redundant and they were removed. You might want to bring them
> back again.

I'd prefer we didn't bring that abomination back. The detail about how
things are stored in regmap should be internal within regmap, and I
think it would be better to have an API presented that takes sensible
parameters, rather than something that's been encoded.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

