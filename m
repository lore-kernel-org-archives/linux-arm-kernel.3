Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59586C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 02:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jzo4rhQ+WeKcNvXBIQdH7dAAfdtRqh5eeYkH7PHUZy4=; b=VnI3ZR3H3ylTMn9HP0pj4FXn2m
	gBie3aW9uLDPvNu6OVYNunV5Q1J3uafYkjvTcBkVk+ry0PlIMS+g4gW79CznRr+L5UgPQ0BImXxt2
	ogjsORd2fCSGtyo5WNMyuzLUOmyFNol7Y1k+TF769o/JlaKeXOuev98G2+dTVRuyNjQ2iFJTPs2/w
	JjoAd4x9Gqaiko04aVMxanJ5BJYDckgeB7xNcuSQyinuVVPRb8LJhWp2K++Z5DGzI1lXTYcw+JTcJ
	i49bdOEic2x/cfvoL8fmmgEgF/XOqhdz6TqPNFABErIZSK2wtut2nFmNufr1QCqvtesc4cJhUlnuu
	gGqtIWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Dq-00000000s8m-2myn;
	Tue, 04 Aug 2026 02:49:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Do-00000000s8E-1Kcj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 02:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Jzo4rhQ+WeKcNvXBIQdH7dAAfdtRqh5eeYkH7PHUZy4=; b=YZ7vMoQ5Iojjf89ZaYL9j3LBDq
	8kv3nZFltbzLYRfA+m0MGYkQdhKWq2bQYAivWbSYWmGfq2dOJT0ww5sXfWF7fNQZ1yzW9PPnkrFRx
	B69bhbbxGPGybiPuEGQQBKyQ0/2uc6DKVDYYrZ9ZUTZBIq6IiABAam+L226HykoA2xIY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wr5Db-00FtlS-Kf; Tue, 04 Aug 2026 04:49:27 +0200
Date: Tue, 4 Aug 2026 04:49:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Liu Changjie <liucj1228@outlook.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] net: phy: maxio: extend PHY ID matching
Message-ID: <d0f8e198-b999-4f99-b09c-9bf34562398d@lunn.ch>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
 <20260803101452.2993721-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803101452.2993721-5-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_194940_351750_B086BC33 
X-CRM114-Status: GOOD (  10.99  )
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

On Mon, Aug 03, 2026 at 12:14:50PM +0200, Andre Przywara wrote:
> Currently the maxio Ethernet PHY driver expects a PHY matching exactly the
> one ID provided: 0x7b744412. The Maxio MAE0621A-Q3C model used on
> the Allwinner based X96QPro+ TV box uses a slightly different PHY ID:
> 0x7b744411.
> 
> Replace the "exact match" requirement with the more relaxed "model
> match" version, which ignores the lowest 4 bits of the PHY ID. Both
> PHYs should now be recognised by the driver.

Is there any documentation to suggest this is different versions of
the same PHY? The datasheet sometimes document the lower nibble as
being version.

	Andrew

