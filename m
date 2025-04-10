Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC0AC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amQTBAOZwMkJ1j1LtN/s0dLA/fANsCSGlX6qX2vDPVo=; b=T4UKqSM7jR16/9E+LEDdswODFL
	a1DEOjNj2dBwulqc9BF1txfBYNolCqSCnCPO7Vpbbj0UYmmjNDC/cwjD0VOASC4AsQY5a3Z2KExMw
	Tzxrfkhy+KKZuxqOak6t1DO/kVlbDnd8G3ItmMTlz5ffJykop8thSBaLpvTB/E7FNGQtsZ4xZtsYv
	IkacrOebsLJg0rKKuViFaorwXM18GISR3UiQVN3fJdR3HqWDW71/FDSwL0WOYpvjhRBD67CNozYX8
	sXgG8o0qF9i+JmFMeudC7aWSer/4JgxIxY+XwiIvZEZ/G0ASVTIp/s5MLq0Q3tYiy6rSi/o8kR6j7
	7eUoRAVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wAZ-0000000BT6n-0eJB;
	Thu, 10 Apr 2025 17:58:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vOz-0000000BK5J-0KgU;
	Thu, 10 Apr 2025 17:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=amQTBAOZwMkJ1j1LtN/s0dLA/fANsCSGlX6qX2vDPVo=; b=xmuRXX4ckQGKPcGs/K603KyGOs
	QmoAeM637i5YHNIvTohfYiqLxX93Z3FRa6YXYpZ3sxWZQaV+btppFVPLy85jiSRgABw3vFLLBk6LK
	xaO/iLPaVu5lFyziZmfyk26lo31+TSjMFLJb1ZwR28icKNlvd1R5aSjMBK+W8E6ffK54=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2vOX-008i2l-LS; Thu, 10 Apr 2025 19:08:53 +0200
Date: Thu, 10 Apr 2025 19:08:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
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
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v14 07/16] net: mdio: regmap: add support for
 C45 read/write
Message-ID: <50c7328d-b8f7-4b07-9e34-6d7c34923335@lunn.ch>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
 <20250408095139.51659-8-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408095139.51659-8-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_100921_118422_97EB5D7D 
X-CRM114-Status: GOOD (  24.90  )
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

On Tue, Apr 08, 2025 at 11:51:14AM +0200, Christian Marangi wrote:
> Add support for C45 read/write for mdio regmap. This can be done
> by enabling the support_encoded_addr bool in mdio regmap config and by
> using the new API devm_mdio_regmap_init to init a regmap.
> 
> To support C45, additional info needs to be appended to the regmap
> address passed to regmap OPs.
> 
> The logic applied to the regmap address value:
> - First the regnum value (20, 16)
> - Second the devnum value (25, 21)
> - A bit to signal if it's C45 (26)
> 
> devm_mdio_regmap_init MUST be used to register a regmap for this to
> correctly handle internally the encode/decode of the address.
> 
> Drivers needs to define a mdio_regmap_init_config where an optional regmap
> name can be defined and MUST define C22 OPs (mdio_read/write).
> To support C45 operation also C45 OPs (mdio_read/write_c45).
> 
> The regmap from devm_mdio_regmap_init will internally decode the encoded
> regmap address and extract the various info (addr, devnum if C45 and
> regnum). It will then call the related OP and pass the extracted values to
> the function.
> 
> Example for a C45 read operation:
> - With an encoded address with C45 bit enabled, it will call the
>   .mdio_read_c45 and addr, devnum and regnum will be passed.
>   .mdio_read_c45 will then return the val and val will be stored in the
>   regmap_read pointer and will return 0. If .mdio_read_c45 returns
>   any error, then the regmap_read will return such error.
> 
> With support_encoded_addr enabled, also C22 will encode the address in
> the regmap address and .mdio_read/write will called accordingly similar
> to C45 operation.

This patchset needs pulling apart, there are two many things going on.

You are adding at least two different features here. The current code
only supports a single device on the bus, and it assumes the regmap
provider knows what device that is. That is probably because all
current users only have a single device. You now appear to want to
pass that address to the regmap provider. I don't see the need for
that, since it is still a single device on the bus. So adding this
feature on its own, with a good commit message, will explain that.

You want to add C45 support. So that is another patch.

C22 and C45 are different address spaces. To me, it seems logical to
have different regmaps. That makes the regmap provider simpler. A C22
regmap provider probably is just a straight access. A C45 regmap
provider might need to handle the hardware having a sparse register
map, only some of these 32 block of 65536 are implemented, etc.

So i think:

struct mdio_regmap_config {
        struct device *parent;
        struct regmap *regmap;
        char name[MII_BUS_ID_SIZE];
        u8 valid_addr;
        bool autoscan;
};

should be extended with a second regmap, used for C45.

	Andrew

