Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13837C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 19:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSUTA5z36ql72JekD9ouDmOBEs0+WULpQCq7eoA298E=; b=u5uUyIA79ZQCsAc+gvo+QTuMbQ
	msKqQIiyuwHrU0U2AnEt2QSnVaMaXdOxYaFyLlNLfbgpwA/EsCZZSuymbZoS2j4JS8uBFwQ5GFjBL
	zkcl16XzkMYx9r3XF/79LFM/PQlv+fV9k2voXqL4YQjIJ8yd5oGfpGc5EdXe00T2G5tW4His07jiv
	Z1i+Ds7OufNO80zivmSnOv/HqA8NouMZiqF6oX5NivRuSnNHYlp/yfNagXTbzZ6WQhx1tE9BKTeeI
	VqwrtkfOih+0krzIjfohGxyRkRtmih98dHz3z2RAedqQi5EsZsX2s2KyOYu21wPZUNCZ4dWN3V2qX
	7n4Li2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttB2V-0000000F9hB-2QbU;
	Fri, 14 Mar 2025 19:49:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAud-0000000F90A-0ioN;
	Fri, 14 Mar 2025 19:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZSUTA5z36ql72JekD9ouDmOBEs0+WULpQCq7eoA298E=; b=SjdFy+Fq1Mqqp9/ZrB0+kU88+7
	1r5EbroNgCXtOKvAkjdplUsUIM/zYIsPWcrkuEKXEtUfc4T0or4pxqBqTcFQG4OeGMqCm/LN0NV5h
	7nybjoweSIZ2WsZN5GDJGnMHW6Ymd6cUBbFAYWSTHEBCCbYbKdasZMh+SV3gd9NCvpXU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ttAuT-005O81-8g; Fri, 14 Mar 2025 20:41:33 +0100
Date: Fri, 14 Mar 2025 20:41:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
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
Message-ID: <0c6cb801-5592-4449-b776-a337161b3326@lunn.ch>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-8-ansuelsmth@gmail.com>
 <Z83RsW1_bzoEWheo@shell.armlinux.org.uk>
 <67cdd3c9.df0a0220.1c827e.b244@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67cdd3c9.df0a0220.1c827e.b244@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_124143_213211_0A14D51E 
X-CRM114-Status: GOOD (  18.69  )
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

On Sun, Mar 09, 2025 at 06:45:43PM +0100, Christian Marangi wrote:
> On Sun, Mar 09, 2025 at 05:36:49PM +0000, Russell King (Oracle) wrote:
> > On Sun, Mar 09, 2025 at 06:26:52PM +0100, Christian Marangi wrote:
> > > +/* If a non empty valid_addr_mask is passed, PHY address and
> > > + * read/write register are encoded in the regmap register
> > > + * by placing the register in the first 16 bits and the PHY address
> > > + * right after.
> > > + */
> > > +#define MDIO_REGMAP_PHY_ADDR		GENMASK(20, 16)
> > > +#define MDIO_REGMAP_PHY_REG		GENMASK(15, 0)
> > 
> > Clause 45 PHYs have 5 bits of PHY address, then 5 bits of mmd address,
> > and then 16 bits of register address - significant in that order. Can
> > we adjust the mask for the PHY address later to add the MMD between
> > the PHY address and register number?
> >
> 
> Honestly to future proof this, I think a good idea might be to add
> helper to encode these info and use Clause 45 format even for C22.
> Maybe we can use an extra bit to signal if the format is C22 or C45.
> 
> BIT(26) 0: C22 1:C45
> GENMASK(25, 21) PHY ADDR
> GENMASK(20, 16) MMD ADDR
> GENMASK(15, 0) REG

If you look back at older kernels, there was some helpers to do
something like this, but the C22/C45 was in bit 31. When i cleaned up
MDIO drivers to have separate C22 and C45 read/write functions, they
become redundant and they were removed. You might want to bring them
back again.

	Andrew

