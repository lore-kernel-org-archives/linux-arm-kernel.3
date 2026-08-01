Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFEBC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OzuU/6al2UfdQ5v0OA/wKgoPuo/ckl60pBteNAIG7Bg=; b=HB4+uIChYICKSG/2w7q5kDnRGZ
	pSWzXx0dR104Y+KPmyQj+K3sgwa1AI6FkCSqny4udvjqsUnT6zYg4Id2XGuGjXRuVQvjs2kHVLXiA
	DxSBNXMAZSpWEC69DH2sXO7NzjDTaZ4YsoSPb3cdUR17sw4fK0UWoq+Wgq4uhoKK2kzKGduIZR25f
	QdORvOrIc5a/TVAkeERa7nStYsk1/SVXit5MN0kZPyornplz8w59jp2pk+vu5VgZA97xO09AaAF8D
	twHbGw9TqfSR7MI4jmfRop3UqacISQCy9IqefmzCLrzhQH0DjYbD6Ig/sqV6oHKpx4M7rMhA5fKIX
	cPS+aONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGtu-0000000F5WS-38wX;
	Sat, 01 Aug 2026 21:05:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGtq-0000000F5UY-2gfW;
	Sat, 01 Aug 2026 21:05:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OzuU/6al2UfdQ5v0OA/wKgoPuo/ckl60pBteNAIG7Bg=; b=cajt7qcbPewc6StlNWT0gPfcpr
	q1nmIElq44xq5JoRJv2z6hW6LnevssnezFbfyt45BhYJQL/mPv8ejmUUcBMqK1mlF4fqo5BcXomXE
	g5siVixGy1UBu3H1zIsM2t1ozEzlsdvxC/HTOTWlaoTZmo3N1DzCS/TGNSeBZ5SSQJ5g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wqGta-00FQKK-Ny; Sat, 01 Aug 2026 23:05:26 +0200
Date: Sat, 1 Aug 2026 23:05:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Coia Prant <coiaprant@gmail.com>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 05/10] arm64: dts: rockchip: rk3568: add XPCS and
 fixed-clock nodes
Message-ID: <0e9d16df-7332-446b-9321-ce3de3111ffa@lunn.ch>
References: <20260801142244.679437-2-coiaprant@gmail.com>
 <20260801142244.679437-7-coiaprant@gmail.com>
 <2847036.GUH7pLUipS@diego>
 <CALj3r0gqvFZPb2SKRMPwf9chCx076rwCnXEoOMFch_V-fOKV6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALj3r0gqvFZPb2SKRMPwf9chCx076rwCnXEoOMFch_V-fOKV6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140542_685490_FF794793 
X-CRM114-Status: UNSURE (   5.87  )
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

> During my tests, I found that the 125 MHz clocks (`xpcs_gmac0_clk` /
> `xpcs_gmac1_clk`) are actually outputs of the Naneng Combo PHY
> (SerDes) when it's initialized for SGMII/QSGMII mode, rather than
> independent board-level oscillators.

Do you have documentation for these Combo PHYs? Can these clocks be
enabled/disabled? And how is the Combo PHY fed with a clock? Does it
have an external oscillator/crystal?

     Andrew

