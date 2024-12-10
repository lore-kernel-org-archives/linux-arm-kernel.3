Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70717E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXp+qtxYbr5cJiQYFPqHbEdcMH4PcZUu6E1u3pNKqeQ=; b=m/4Ee9YEKnqbJzNxsIGAwxbteU
	NylFt3AKsAD8hNkZzr3StykD6m0zs9xum2o9esDhHbNhl+RIBCI5MAToRV0CQobFriDqd5q0XD3Jx
	WZtoLf0c8hSWwvSh4oBfTIGa50LDkQ4N7weMcn0PBc6JfVng/rSdDH1dyxMkTUiWKnZmgK3WKkbHh
	BlNYIbloj2lJ57cJxag35MI+trGrOoN8Lo2QhL88f8OQ1HBby5LM2vJATgjcsI+yUjhIcPxhfuejj
	M4Z512nnJPv0Pi7nC7CXP9tYYmIMYxa2EX7Io3q/yL8fwrtr+/izyVi6yS9D1GfVbtjfDy0dTDJ/D
	uc66nVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKpSb-00000009tAC-3Xjm;
	Tue, 10 Dec 2024 01:54:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKpRY-00000009t2U-3X53;
	Tue, 10 Dec 2024 01:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SXp+qtxYbr5cJiQYFPqHbEdcMH4PcZUu6E1u3pNKqeQ=; b=PrHYY1z8LaYBGTRjlMabb+CPuG
	yslmeEFU9rTTL0FCGvDhAUjzexvuxZAG5WSJ/dh4SGH0pXKnkwtnvkPnPzjw33K9/pENQff2qj99/
	vcta6hGz06pCRWoPP7hyhazcKoOzSfovgx4MV8bFzLb8n/sAF2DelRYbaFhPM0BM02S8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tKpRO-00FjyY-Aq; Tue, 10 Dec 2024 02:53:34 +0100
Date: Tue, 10 Dec 2024 02:53:34 +0100
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 6/9] net: mdio: Add Airoha AN8855 Switch
 MDIO Passtrough
Message-ID: <5aec4a94-3cea-41a4-8500-71472fae51d4@lunn.ch>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-7-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209134459.27110-7-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_175344_878346_CD49019B 
X-CRM114-Status: GOOD (  12.09  )
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

> +static int an855_phy_restore_page(struct an8855_mfd_priv *priv,
> +				  int phy) __must_hold(&priv->bus->mdio_lock)
> +{
> +	/* Check PHY page only for addr shared with switch */
> +	if (phy != priv->switch_addr)
> +		return 0;
> +
> +	/* Don't restore page if it's not set to switch page */
> +	if (priv->current_page != FIELD_GET(AN8855_PHY_PAGE,
> +					    AN8855_PHY_PAGE_EXTENDED_4))
> +		return 0;
> +
> +	/* Restore page to 0, PHY might change page right after but that
> +	 * will be ignored as it won't be a switch page.
> +	 */
> +	return an8855_mii_set_page(priv, phy, AN8855_PHY_PAGE_STANDARD);
> +}

I don't really understand what is going on here. Maybe the commit
message needs expanding, or the function names changing.

Generally, i would expect a save/restore action. Save the current
page, swap to the PHY page, do the PHY access, and then restore to the
saved page.

	Andrew

