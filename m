Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF821C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pb4Mg6dXq8Zc8cfV2oGYuVgjq1Oqsvp9m5ILjN9M048=; b=eQBLltPkI98UdvqBJ6ObmMHGwP
	BEIoTOIbfEmRGty1L1s+kZIYo+UWKINP7+mbrrsR6m4RkLjHCbIaxYXZrWHqrNpmPvQmi17rBoeFH
	ElNqZXgKGnKxq415JxPu+tTij4gRW6z3rxPpSDLt7F+TcuM9180sEVzvIR4vmPhqKlXXxWcr4W/xD
	sykqTYyq6bmPNiNEXCnWjfWZmO3UAIrrqUSyIYduKsCDt+RxqHGL/o3YFxXV61PrbmkdKcEkUa6Lr
	atJzIsRiqspmZeNWLGO1pjrHPRQwqsdRM0U/CDyimFsDU2EBLS5BnNBR12UuJITISrE+KLG6Ns5QR
	YTsdBTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3D3-0000000CDv7-01SQ;
	Wed, 30 Apr 2025 08:54:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3B8-0000000CDk2-2MqY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 08:52:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A799A615F0;
	Wed, 30 Apr 2025 08:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941A3C4CEE9;
	Wed, 30 Apr 2025 08:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746003148;
	bh=7Cul/zndrL+/IVYzqfi6IU1dEFCIVPUdV6j259m69G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1lJ8wzZTPM8DhfyWr4/2HegX1ltD3jb9oyGwEsxQnggTzFu4BmhN+FDUo2zeu1RN
	 giDLlf5a2a05M1NTM0TyNM+3EdxGFIjko0NcwuH8tmM4waxKh+taOw9pETLP/OGysx
	 y6q41rNWMiXvecfuO5utnba6X+/RrlRRRG0Zyp779JD4OXsp8BT5vKLho9xhVLhP01
	 L3pek8e8yF1Kz3U+jqQ8zO6NCEaQ1htsGbDQh30QnW28U8lUEpb18UeDTpFssre9i9
	 UMhCihDPn7fYp+FgDTScyGj9IhAcqbLQNWIY9xOmFsozHxD0z0V8xLXR1vNNBZ07+D
	 pBH9xsh9vL2PA==
Date: Wed, 30 Apr 2025 09:52:20 +0100
From: Simon Horman <horms@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?utf-8?Q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v5 04/14] net: phy: dp83822: Add support for
 phy_port representation
Message-ID: <20250430085220.GS3339421@horms.kernel.org>
References: <20250425141511.182537-1-maxime.chevallier@bootlin.com>
 <20250425141511.182537-5-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425141511.182537-5-maxime.chevallier@bootlin.com>
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

On Fri, Apr 25, 2025 at 04:14:57PM +0200, Maxime Chevallier wrote:
> With the phy_port representation intrduced, we can use .attach_port to
> populate the port information based on either the straps or the
> ti,fiber-mode property. This allows simplifying the probe function and
> allow users to override the strapping configuration.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/phy/dp83822.c | 70 ++++++++++++++++++++++++---------------
>  1 file changed, 44 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
> index 490c9f4e5d4e..bbbe509f3bd9 100644
> --- a/drivers/net/phy/dp83822.c
> +++ b/drivers/net/phy/dp83822.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/phy.h>
> +#include <linux/phy_port.h>
>  #include <linux/netdevice.h>
>  #include <linux/bitfield.h>
>  
> @@ -814,17 +815,6 @@ static int dp83822_of_init(struct phy_device *phydev)
>  	int i, ret;
>  	u32 val;
>  
> -	/* Signal detection for the PHY is only enabled if the FX_EN and the
> -	 * SD_EN pins are strapped. Signal detection can only enabled if FX_EN
> -	 * is strapped otherwise signal detection is disabled for the PHY.
> -	 */
> -	if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> -		dp83822->fx_signal_det_low = device_property_present(dev,
> -								     "ti,link-loss-low");
> -	if (!dp83822->fx_enabled)
> -		dp83822->fx_enabled = device_property_present(dev,
> -							      "ti,fiber-mode");
> -
>  	if (!device_property_read_string(dev, "ti,gpio2-clk-out", &of_val)) {
>  		if (strcmp(of_val, "mac-if") == 0) {
>  			dp83822->gpio2_clk_out = DP83822_CLK_SRC_MAC_IF;
> @@ -953,6 +943,47 @@ static int dp83822_read_straps(struct phy_device *phydev)
>  	return 0;
>  }
>  
> +static int dp83822_attach_port(struct phy_device *phydev, struct phy_port *port)
> +{
> +	struct dp83822_private *dp83822 = phydev->priv;
> +	struct device *dev = &phydev->mdio.dev;

Hi Maxime,

A nit from my side:

dev is unused if CONFIG_OF_MDIO is not defined.

Perhaps it's scope can be reduced somehow.
Or &phydev->mdio.dev can be used directly?
Or the code guarded by CONFIG_OF_MDIO could be moved into a separate
function that makes use if IS_ENABLED to return early if there is nothing
to do (maybe the best option if possible, as it would increase compile
coverage).
Or ...

> +	int ret;
> +
> +	if (port->mediums) {
> +		if (phy_port_is_fiber(port))
> +			dp83822->fx_enabled = true;
> +	} else {
> +		ret = dp83822_read_straps(phydev);
> +		if (ret)
> +			return ret;
> +
> +#ifdef CONFIG_OF_MDIO
> +		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> +			dp83822->fx_signal_det_low =
> +				device_property_present(dev, "ti,link-loss-low");
> +
> +		/* ti,fiber-mode is still used for backwards compatibility, but
> +		 * has been replaced with the mdi node definition, see
> +		 * ethernet-port.yaml
> +		 */
> +		if (!dp83822->fx_enabled)
> +			dp83822->fx_enabled =
> +				device_property_present(dev, "ti,fiber-mode");
> +#endif
> +
> +		if (dp83822->fx_enabled) {
> +			port->lanes = 1;
> +			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASEF);
> +		} else {
> +			/* This PHY can only to 100BaseTX max, so on 2 lanes */
> +			port->lanes = 2;
> +			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
> +		}
> +	}
> +
> +	return 0;
> +}

...

