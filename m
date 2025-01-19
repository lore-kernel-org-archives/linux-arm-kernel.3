Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479DEC02187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqXJtOIf4rCW4A5e2bQ1EyB3uRGWzyR+eKwMln2F0eU=; b=bGuP9ru0tz/EUHkOZpu9Vfomix
	x4/yShInNBtQRIEzga64vzlXxTYd40nHJ47iBknYmTRKPwXCPBgJNWJL6tddgezpPkAc/XpRr91Tj
	99PS2mF8pyDX93KCLZM21hYuk07AWAWR5SGx93iWFYqIWCJ8kryNIIBUmypk7AypTg86FsTJd0+3V
	NOD3aHWE/AKLXIhZq5wZ73/WemUezoa7YKZjjSN6uQj14ayT32y3dG8GAKDQfeNtrpFMU0m+E6cB7
	zK38UkmQ2NdahNdjeIkESGK4tHKvD1oqEAElP3jiZGBvoXAeI6Kjcorp3AjUbM1O56qe5s0VjOlIp
	X8iQx+bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZZAj-00000004C4W-2nMd;
	Sun, 19 Jan 2025 17:33:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZZ9S-00000004BpB-3Xk8;
	Sun, 19 Jan 2025 17:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AqXJtOIf4rCW4A5e2bQ1EyB3uRGWzyR+eKwMln2F0eU=; b=Dpa5oybnNfPHVmxV3G/PBBg4wO
	ePgzRXYgm9RJQ+5DVbWvV6RQeGb6G3Pji/0gWgyWvwVydMdgJmjCfe5oqfSAmkXCa6raJn2TsBodQ
	OkLck7d8V2VdHcoV4XPy0srE7ynBEfLEYZXnQTzAED9gj04OJ5ihlKCXZYBjCbXH9Es8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tZZ9E-0066tP-JT; Sun, 19 Jan 2025 18:31:44 +0100
Date: Sun, 19 Jan 2025 18:31:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next 3/3] net: phy: mediatek: add driver for built-in
 2.5G ethernet PHY on MT7988
Message-ID: <df67baa5-0f3d-4a42-a327-00452787908a@lunn.ch>
References: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
 <20250116012159.3816135-4-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116012159.3816135-4-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_093158_895413_09281ADB 
X-CRM114-Status: GOOD (  13.56  )
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

> +	np = of_find_compatible_node(NULL, NULL, "mediatek,2p5gphy-fw");
> +	if (!np)
> +		return -ENOENT;

The device tree binding need documenting.

> +	/* Write magic number to safely stall MCU */
> +	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x800e, 0x1100);
> +	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x800f, 0x00df);

0x1100 and 0x00df are magic numbers, bit 0x800e and 0x800f are
not. Please add #defines.


> +
> +	for (i = 0; i < MT7988_2P5GE_PMB_FW_SIZE - 1; i += 4)
> +		writel(*((uint32_t *)(fw->data + i)), pmb_addr + i);
> +	dev_info(dev, "Firmware date code: %x/%x/%x, version: %x.%x\n",
> +		 be16_to_cpu(*((__be16 *)(fw->data +
> +					  MT7988_2P5GE_PMB_FW_SIZE - 8))),
> +		 *(fw->data + MT7988_2P5GE_PMB_FW_SIZE - 6),
> +		 *(fw->data + MT7988_2P5GE_PMB_FW_SIZE - 5),
> +		 *(fw->data + MT7988_2P5GE_PMB_FW_SIZE - 2),
> +		 *(fw->data + MT7988_2P5GE_PMB_FW_SIZE - 1));
> +
> +	writew(reg & ~MD32_EN, mcu_csr_base + MD32_EN_CFG);
> +	writew(reg | MD32_EN, mcu_csr_base + MD32_EN_CFG);
> +	phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
> +	/* We need a delay here to stabilize initialization of MCU */
> +	usleep_range(7000, 8000);
> +	dev_info(dev, "Firmware loading/trigger ok.\n");

We generally don't spam the log for "Happy Days" conditions. Please
only log if firmware download fails.

> +static int mt798x_2p5ge_phy_get_features(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = genphy_c45_pma_read_abilities(phydev);
> +	if (ret)
> +		return ret;
> +
> +	/* This phy can't handle collision, and neither can (XFI)MAC it's
> +	 * connected to. Although it can do HDX handshake, it doesn't support
> +	 * CSMA/CD that HDX requires.
> +	 */
> +	linkmode_clear_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT,
> +			   phydev->supported);

So it can do 10BaseT_Half? What about 1000BaseT_Half?

As you said somewhere, 10/100/1G are not in the C45 space. So does
genphy_c45_pma_read_abilities() report these features?

	Andrew

