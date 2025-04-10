Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFB8C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 20:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpP8724RjBuTtHqPoOQEYb+UxkeI+0f3hSg/HwAnRco=; b=jJ2m76nMgGPOPnskYEllE/XTC8
	NoCSFu8XcrImazRSKZk6XcsFl227HoBhrTpdT8YZQNp/YSHr9iYQUl0aAvuxbpSqcriDhNRfhQtVD
	xM1rX9x9QXGm0nfGLS2MVNsazhJd91UrOfQGH30eZTI0qp1W4ISSKXTv7fcdncO5gG/IgM7QkMb2G
	KMn2Ph4JWig3PY1aq/zs+qhtzW8IUMXBuxFnAmleHat3SoFgApBMo+FhRQqVsj92NIUfHI3dCG944
	yvTBh1FxXPSCvFNoyzPe26iCe4V8AO2deKokhtu7D0G5uPOVHdR5NfSKX5TAkHIg9IJu683OcmH8e
	84YulPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2yz1-0000000BrJf-1lpU;
	Thu, 10 Apr 2025 20:58:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2yxC-0000000BrBO-0Daz;
	Thu, 10 Apr 2025 20:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OpP8724RjBuTtHqPoOQEYb+UxkeI+0f3hSg/HwAnRco=; b=icN/Z1BFMHxh7eIZg8j2CW4tVW
	hHIGaaBjnmXtwawWDpVZLt1mP/C20pZ3xlQkC948V6q2MhQSSSK7Tru1fr0GAbOlCQSK7+Z4DfRQm
	nWs1pZ21+QvE3vOvDVz97G4MfajtZDrGmk5nOCpaXAqwNOwo4BNWzW3ORkg97kBvJPww=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2ywq-008jEk-I3; Thu, 10 Apr 2025 22:56:32 +0200
Date: Thu, 10 Apr 2025 22:56:32 +0200
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
Message-ID: <5472c608-df78-4433-a086-6ac9323d9d35@lunn.ch>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
 <20250408095139.51659-8-ansuelsmth@gmail.com>
 <50c7328d-b8f7-4b07-9e34-6d7c34923335@lunn.ch>
 <67f80275.df0a0220.39b09a.dd38@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67f80275.df0a0220.39b09a.dd38@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_135654_101735_0FABB78E 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

> Hope you can give some guidance about this! Happy to split this once we
> find a common point on how to proceed with this.

One thing i'm failing to understand is, why use a regmap at all. For a
single C22 device it make sense. 32 linear registers, nice and
simple. They could be memory mapped, I2C addresses, SPI addresses,
etc. The regmap implementer probably just adds a constant offset and
does a hardware access.

Multiple C22 devices gets us into a two dimensional problem. Multiple
C45 devices gives us a three dimensional problem. Mixing multiple C22
and C45 gets us a four dimensional problem. This is a long way from
regmaps nice simple model of linear registers.

What does regmap bring here?

	Andrew

