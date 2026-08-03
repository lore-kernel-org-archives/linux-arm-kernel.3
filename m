Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF733C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqpuCmGbDC7MQgqg4rNwLa59ffLN5tM7+k6xoxCEPxg=; b=H5YMyTd642ptDVR1kt6lAGB+kt
	suf5uSsKuAi/EnPxasgCN3myp8pV4C4pfgDoIopI8iScgyGs2DX7OQ8nEo4v+aN80LykS6FNDbfGD
	i4/+dJ4LSa9TH1SlpWQmwFpvTmF2As60SfatExPQzoY99NF+c4qZ8+cdVZXeXSAs52HsAbprx4pPQ
	b28FH40iTjV7+QMhoj3wCthHt/MWWZub2li0wD4Jo32Oe7Q+eGSCN6D5KhLhhnLKd0AzcGWovA9UA
	Qhk5T8K2A3C+rvu6Am5A201DQljSkAopKQgZH5IreiUGyKvPcII0LxC/GGJR5VhnEt3tVdh1574vT
	c1TDHj7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt4Y-0000000HGB9-2m67;
	Mon, 03 Aug 2026 13:51:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt4W-0000000HGA4-2RGp;
	Mon, 03 Aug 2026 13:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uqpuCmGbDC7MQgqg4rNwLa59ffLN5tM7+k6xoxCEPxg=; b=M1H1iu/pjR8kYw7PfRwEcrhdUG
	Mmpf5DE9eGVvhtIB6rk06xkB1BWps31tCUziHtFIcdGiQHcjdPICgwrIDeT7j82klQNqStFTs3Khx
	gokx13xO1aev3e48O2pDastt4vTy37tA5ANceoV4o3b7dHqudb6h8H6N8brmXzWgq65o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wqt46-00FjZz-CF; Mon, 03 Aug 2026 15:50:50 +0200
Date: Mon, 3 Aug 2026 15:50:50 +0200
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
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
Message-ID: <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_065116_620267_7E08798A 
X-CRM114-Status: GOOD (  10.57  )
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

> +static int
> +ac200_ephy_ctl_set_led_outputs(struct acx00_ephy_control *control,
> +			       unsigned long outputs)
> +{
> +}

> +static int
> +ac200_ephy_ctl_set_led_polarity(struct acx00_ephy_control *control,
> +				bool active_low)
> +{
> +}

I've not looked into the details, but these look like pinmux. Does
this I2C device have a GPIO controller? Can these pins be used for
other things than LEDs? Maybe you should be implementing a GPIO and
pinmux driver. The Ethernet PHY driver can then just select the
correct pinmux configuration.

> +static int ac200_ephy_ctl_power_off_locked(struct ac200_ephy_ctl *priv)
> +{
> +}
> +
> +static int ac200_ephy_ctl_power_off(struct acx00_ephy_control *control)
> +{

> +}
> +
> +static int ac200_ephy_ctl_power_on(struct acx00_ephy_control *control,
> +				   unsigned int phy_addr)
> +{
> +}

These look like a regulator? The phylib core has support for
regulators.

Maybe take a step back and look at the overall architecture, and how
Linux can represent these blocks.

	Andrew

