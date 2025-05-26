Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D621C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 14:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTUQIv6xtVQdEIhWmKs1GCL0HyslUp2+oj7lqnt+NHQ=; b=y9xzGs2j3GlktBGFOfet4tHKsM
	31+xWD2QHvPK5WcGAvexjzKXh/v6V/GAdvVM/0wdjyAxr3V2tw23kulgq7RlBi6yeLV4TjZq93yVr
	WbG4DHCSOyhpQlw3RyiGO5Due4fOhHH4eWz00UGh0EI1v3aHzrmBFNjCBMxE2dljDCPkdqIPv5LBp
	rDR3XE5EWezOCLw5++/Edxzuo+22rVVm0efJh0QijGTn5eYfGvXOCdWUDOn4K6F3SKLmBvcW5xFo8
	NA5I4JpxwDbeJj1NBjwEYQ/CiMqntIShfnshG+oC9dXLGonGgJUHltSHFOrxX5QJ6H6OW8g8HSdAM
	N79/s+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYdL-00000008ysd-2xJh;
	Mon, 26 May 2025 14:16:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYbE-00000008ygN-3hnv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 14:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gTUQIv6xtVQdEIhWmKs1GCL0HyslUp2+oj7lqnt+NHQ=; b=Ci1RKDb6871pfBSzyscgJXu0GQ
	rqWL6a6oZXu1JWVoZrzBArnlLSOMg0jGzEsX9C+54h22e0E79PbXd5vCv/kb/scMxfqVR+0Sy5rkj
	FTHPaIn1AIf27eudzyyjNlNPfgrVDJ8XFac94nsGGF8cxeHADlC+aoh5itlnIaFaCM44=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJYad-00E0Oq-Sg; Mon, 26 May 2025 16:14:07 +0200
Date: Mon, 26 May 2025 16:14:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow runtime
 AC200/AC300 phy selection
Message-ID: <4a2c60a2-03a7-43b8-9f40-ea2b0a3c4154@lunn.ch>
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
 <20250526002924.2567843-2-james.hilliard1@gmail.com>
 <aDQgmJMIkkQ922Bd@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDQgmJMIkkQ922Bd@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_071444_920838_F055C3AB 
X-CRM114-Status: GOOD (  14.71  )
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

On Mon, May 26, 2025 at 09:04:40AM +0100, Russell King (Oracle) wrote:
> On Sun, May 25, 2025 at 06:29:22PM -0600, James Hilliard wrote:
> > +	if (!nvmem_cell_read_u16(dev, "ac300", &val)) {
> > +		const char *phy_name = (val & AC300_KEY) ? "ac300" : "ac200";
> > +		int index = of_property_match_string(dev->of_node, "phy-names", phy_name);
> > +		if (index < 0) {
> > +			dev_err(dev, "PHY name not found in device tree\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		plat_dat->phy_node = of_parse_phandle(dev->of_node, "phys", index);
> > +		if (!plat_dat->phy_node) {
> > +			dev_err(dev, "Failed to get PHY node from phys property\n");
> > +			return -EINVAL;
> > +		}
> > +	}
> 
> 1. You are re-using the drivers/phy binding for ethernet PHYs driven by
>    phylib here.
> 2. You need to update
>    Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
>    in a separate patch.

A real user, i.e. a patch to a .dts file, would also be good.

  Andrew

