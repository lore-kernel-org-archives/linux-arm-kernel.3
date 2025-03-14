Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0D6C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 19:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14q1zuoC/RYgpg42ycjqCS4ie1FHZTJiWO21vFg6qTk=; b=ABEaiTxAUuiV5pajo2fvMqtw2H
	J4zjhYDES0V86XFBk8bzxHeZqy6pdPDo2aEhuDodaq1D5EChLwcHsCYtvS/EEDOkPG77D8Ykqti59
	jKGUjcl3Csc/tusX45FlCBa5c+xRpMvFyymBHTluvAUCkN+os0TN74ekHzXjcKePg2RvDrlp5jMeE
	odgEAaXNTy10rNHX6WsiA1WdYdHQ9Zh1gE4pJbDKh4+ga5UBaDoUDR9zA4FvRPxR1TFepc1szOhYi
	uP/jnfi/e9hueNOTZ62LqqYi3cWjQg1QT6ICcSIElizicKjxMiwc+AOFJbK7S44YnEwCiWKAf6SAL
	kBO5Iz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAYf-0000000F6Lf-0Eq7;
	Fri, 14 Mar 2025 19:19:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAWz-0000000F6Eb-0w2w;
	Fri, 14 Mar 2025 19:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=14q1zuoC/RYgpg42ycjqCS4ie1FHZTJiWO21vFg6qTk=; b=Axg7LZJgdNjewBL3JmJdJjRst/
	x+jKPP3zJ0C+xYYh9xUgnBH1pROTkSJ0lR28U4q6kclRSU7gfyGVxoJEzNWkYluenQIkMYN/tHsEs
	jwlKbjzT8MOPsstAZgrAr7deVqqDqD2BHYSVuejuSKEG/zgHZE3gFV9+gIuUwKuX9gtA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ttAWg-005Nnw-Nm; Fri, 14 Mar 2025 20:16:58 +0100
Date: Fri, 14 Mar 2025 20:16:58 +0100
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v12 09/13] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <2253e19b-2115-441e-b78a-3c10d61f2fad@lunn.ch>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-10-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309172717.9067-10-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_121717_262993_E18F860B 
X-CRM114-Status: GOOD (  12.10  )
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

> +static int an8855_mii_set_page(struct an8855_mfd_priv *priv, u8 phy_id,

phy_id is a bit of an odd name. __mdiobus_write() expects addr, since
at this level, it is just a device on a bus. We have no idea if it is
a PHY, or an Ethernet switch, or anything else.

> +			       u8 page) __must_hold(&priv->bus->mdio_lock)
> +{
> +	struct mii_bus *bus = priv->bus;
> +	int ret;
> +
> +	ret = __mdiobus_write(bus, phy_id, AN8855_PHY_SELECT_PAGE, page);
> +	if (ret < 0)
> +		dev_err_ratelimited(&bus->dev,
> +				    "failed to set an8855 mii page\n");
> +
> +	/* Cache current page if next mii read/write is for switch */
> +	priv->current_page = page;
> +	return ret < 0 ? ret : 0;

__mdiobus_write() should only return -ve error code, or 0. So you
don't need this.

	Andrew

