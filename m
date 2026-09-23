Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E407C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 22:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLaZ6QMAlChH6Bas+cLTUExn52jNXV5CR8pfGjWWblA=; b=2iZHpVdy/7mS18Xb4eCmWowb+Z
	sRzuJjW/kTBTbwBLiFBjOCkmEuJ4fgAYuVXt+EG/5ZFoAepoM/jcnjjl72zUZmSefEp1tz+vCBaYL
	F+f/g6j1wpC9gJweA+ZXa5Tr3DLsVbQqYDK6gPgJKoZKTx/HSzkkIc6IWWChegmJFLaQlAQnRiopt
	LO5C/Mplu4p/e4HChMY49hHCz6EE14MMblMKKkBlGsDy/tXOezyGQ+S+WB2Gh7O+HU6r1/5WfHCHK
	E29gWXYoTDuRBgwQcNV8xYc26nLlQoqS947uZSzjAUhw4b9Zw6ax2WTBbrgyShIoqb4+DyelmHj7/
	2LENiJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9VFJ-00000009dLD-3E7f;
	Wed, 23 Sep 2026 22:15:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9VFH-00000009dKg-1A3L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 22:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mLaZ6QMAlChH6Bas+cLTUExn52jNXV5CR8pfGjWWblA=; b=iNuptB2oIZhXrkQPyxHmWroghF
	onbceDSy5Aw6UTSEruhdhedVchiiIiwpBpcRkJDV/IenuwgLaaqGZbwrdhek5HrabtFtYXPJLVxWf
	lYJJOVf2J2fSDQ/JN6oPtHWm/32fpHCs+FIKA/vR4iq+yjUE6NcQ0vRgjjy8iLA4RirA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9VF2-006sqK-7V; Thu, 24 Sep 2026 00:15:04 +0200
Date: Thu, 24 Sep 2026 00:15:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 0/5] net: stmmac: Add support for Allwinner
 A733 GMAC210
Message-ID: <d02ff8f9-c708-4319-922b-69ab085ed9e5@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_151519_320724_709F5680 
X-CRM114-Status: GOOD (  11.87  )
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

>  * Tx-delay: The vendor kernel ships with a Tx delay of 2.16ns. It may seem
>    to work at first but breaks under heavy load. The vendor kernel is
>    configured for an external RGMII clock, which cannot work on the A7A:
>    the 125MHz input and 25MHz reference output are not wired to the PHY.
>    It was most likely not tested on this board. A 1.62ns Tx delay works
>    well.
> 
> DT example is available here (gated on CCU and pinctrl mainline support
> currently):
> https://github.com/jbrun3t/linux/commit/aa6f3a5ce4cd6e09ff9be1828915bfe8e87c57df

&gmac0 {
	phy-mode = "rgmii-id";
	phy-handle = <&ext_rgmii0_phy>;
	phy-supply = <&reg_swout1>;
	pinctrl-names = "default";
	pinctrl-0 = <&gmac0_pins>;

	tx-internal-delay-ps = <1620>;
	rx-internal-delay-ps = <1800>;

Something does not seem correct here. rgmii-id means the PHY is adding
2ns of delay. The MAC is adding an additional 1.6 to 1.8 ns. The total
is way too big when the standard says 2ns.

Is the PHY adding 2ns?

	Andrew

