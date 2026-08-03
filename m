Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB190C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjGnRhqiS2zR9pg/cS0bmUcMR7HXnniURrzPMgHT88o=; b=v+iderPxiGM3+6ZA2o7dXRWq0P
	sBeK79m8uwraN1+wXQ2xpRn20tI79C04rJl+80C8eGkDHwiFAmerzSNYL+7qlmsm6Q8zrLPPbfPwe
	gmqZin31OunkJ61IZ0mg9NU+xcCmayCZJvE1+7Gh68rayOzp6+ICSky0SMpu40GZyLW/PyKyNRmGR
	Iu2W84U0UoEmckDC8xIXAnnPyLXu7HWTn4ose6qgoENZnoBDMlcvFT4XLRWnWQ/hXzk5MpNSl2V/h
	XW5mlwuTcyX8NFjBJd1n2Zc6cRRtIYFLtZHbN0DQwfnw0/amSQIdnyaFL1Vg/aqEi4eKPZAPYVT08
	rrdy3XDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqseC-0000000H9T3-4663;
	Mon, 03 Aug 2026 13:24:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqseA-0000000H9ST-3LN5;
	Mon, 03 Aug 2026 13:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BjGnRhqiS2zR9pg/cS0bmUcMR7HXnniURrzPMgHT88o=; b=hTNo4kYpDqH3mP4IY1TuWvaCxA
	vg3na+Y9lhkpy4DSwX9ezau9vRGNVL4ghFQVMpBlW33l6CEeJ+C3mUY/pjGZdiSbH8ccinWMZYuyt
	gSjwEHXBcG2GxicNPWqF2C6Z1AY7di6zKVxx4gG/CzKeVdaCDpNpUWYINVRuX1lx8gAg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wqsdu-00FjCh-44; Mon, 03 Aug 2026 15:23:46 +0200
Date: Mon, 3 Aug 2026 15:23:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
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
Subject: Re: [PATCH 15/21] net: phylink: allow PHY-autonomous EEE without MAC
 LPI
Message-ID: <ad954550-9dec-4e0d-8636-0b6cb379421e@lunn.ch>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-15-0a53cd9e21cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-15-0a53cd9e21cc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_062402_837277_6C731F51 
X-CRM114-Status: GOOD (  11.84  )
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

On Sun, Aug 02, 2026 at 11:14:25PM -0600, James Hilliard wrote:
> Phylink treats a MAC which implements its LPI operations but advertises no
> LPI capability as incapable of EEE. It disables PHY EEE during attach and
> rejects ethtool EEE requests. The same problem occurs when the MAC supports
> LPI on another interface but not on the interface currently connected to
> the PHY. Both cases are incorrect when the attached PHY can generate LPI
> autonomously without help from the MAC.

What you are talking about is SmartEEE, or other such names. It is not
part of 802.3, so there is no agreed upon name for it.

You are correct, phylink does not support it. It also needs a lot of
thought and careful design, which is why it has not been implemented
yet. Please search back through the netdev archive and find the
discussion.

	Andrew

