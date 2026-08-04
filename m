Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA42C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEI0tsAN27gcGUyJPUFdfbIkSDOcl8zJRY+yO6IjA8E=; b=jnXMVU0Kel5H4LiOnz1CZZTC4Y
	edpz+nymGNuTGvzfKr9eyMjBNx04+RuGV0FJbGnYW4GEeG2fOkjph4JZbFPcDQnCjasKIb5YLz3uy
	AG+gMUraAqSgpU8j2pK9T8lWcGjPMzwW9Cicu57XUmboEsyBBoIiuGTNaNvXnvAFRXto5LFy2r4ff
	5sWE2pKUZzwIrIWlLnXUV23qT0NM64sj8pteK1Z6JpSCowhLAtLRda+Y0V0ZNnncy0tnSrJCmJ7ni
	pgPcf2Dw4yMBX8UWhCIv4udd6uRtK3nEIlvgujLQBhIaKRGjKqTvEZmmD9Ifvz3fACOO9rba6rvh8
	OkQHHWuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJ6Z-00000002Vok-3wTc;
	Tue, 04 Aug 2026 17:39:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJ6X-00000002Vny-2ZJZ;
	Tue, 04 Aug 2026 17:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iEI0tsAN27gcGUyJPUFdfbIkSDOcl8zJRY+yO6IjA8E=; b=yoyLWprDwgxFu5mYAEn0SWOsHd
	Oi46csV9zN33JyPIvHApKBtCDW42AQUUUlGXzFn6E7Dze5qPN7pVQwVvCWC4K1hG93ghBJ021aTf0
	ySxCwlGTz8UX6CmusMreZx/UoBOyZxDReyZBxhEut4FvMZpxKWFxCBhafQuqyXb/cWCc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wrJ63-00G1hx-Un; Tue, 04 Aug 2026 19:38:35 +0200
Date: Tue, 4 Aug 2026 19:38:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, mfd@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 00/21] net: phy: add X-Powers AC200/AC300 EPHY support
Message-ID: <9dd29610-d9e4-48f2-9638-2c92863626f8@lunn.ch>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <aaec8809-8218-4412-a60d-931406dbf287@arm.com>
 <CADvTj4qCYjQHOQn1jRTHNNL=xeX6z3Dgc-PLwOBUvX34AU6cuA@mail.gmail.com>
 <AGtA6uUwR9yJMX3xYVDz6g@gmail.com>
 <CADvTj4qBhiPczrP9YC2uTW3xss3W7ghoBzbctM45yUROfsgPhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADvTj4qBhiPczrP9YC2uTW3xss3W7ghoBzbctM45yUROfsgPhw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_103905_649673_B4EA8AAE 
X-CRM114-Status: GOOD (  20.52  )
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

> The AC200 Datasheet V1.1 and AC300 User Manual V1.0 block diagrams show
> effectively the same EPHY organization: MII/RMII, auto-negotiation,
> Auto-MDIX, 10/100 transmit and receive PCS/PMA blocks, LED and
> clock/reset logic, a PLL, and the EPHY analog front end. Both variants
> also report PHY ID 0x00441400, and testing shows compatible link-side
> paged registers and behavior.
> 
> What differs is the surrounding control path.

Which is still part of the PHY, needs driver code, and so should be
part of the PHY driver. 

> AC200 is configured
> through its RSB/TWI-backed MFD registers, while AC300 has a separate
> non-PHY MDIO control endpoint.

Which is an implementation detail.

> I do not think the control-provider reference is artificial. It
> describes a real functional dependency: the Clause 22 endpoint cannot
> be accessed until the selected package-specific control block has
> powered, calibrated and configured it.

Nothing too special here. There are PHYs which do this, in the PHY
driver.

> I also do not think a bootloader fixup should be the only supported
> selection mechanism. Boards using the same compatible have shipped with
> either package, and the SID field provides an authoritative package
> selector which Linux can read directly. Handling that selector in Linux
> avoids making support depend on a particular bootloader implementation.

There is a trade off here. If the hardware design is just ugly, badly
thought out, poorly executed, not following the industries norms, we
want to push back on the hardware vendor to make the next version
better. Until that improved version comes out, either the vendor crap
driver should be used, not Mainline, or we try to hide away the issues
in the bootloader. A vendor which actually cares will improve, they
know what Mainline means. And for vendors which don't care, why should
Mainline care, especially if the issues can be pushed to the
bootloader.

We don't want to mess up core Linux code to handle one broken device,
that just makes ongoing Maintenance more expensive for everybody.

> A bootloader fixup remains compatible with this design. If firmware
> enables only the correct provider, the fixed-description path is used
> and Linux does not need to change the tree. Runtime selection is used
> when firmware leaves the package variant unresolved.

So i would not try to fix up the unresolved situation, just do a
dev_error(dev, "Please upgrade your bootloader"); and return -ENODEV.

	Andrew

