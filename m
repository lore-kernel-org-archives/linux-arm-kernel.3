Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB077CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Mnmx2sgw4WEslCg4DD/AvZUrJvXuGMClCMNCsJPvEs=; b=b6gvu28mVqitDI7lGg+PwxM6Tl
	3XoigjcpRJ8kNzJUlr1HrwmCBClZNxHFkNJnG8GlrBforTaFjhyBA+owtdNdbiqMAq3TU74iV5Oet
	Uzn/GfsiyQl12w+3/5dnWlodMT2XjRzpTfTAOlesIr9w7E/+VTwSM5zKpVNZgpZ7od9LlzN7TuN0Q
	GPZ+ohgCDUCysq/Mw5TKmdRp/EJQSvI7peXc38vf6ulQop/kgI1oM9B29JUrg7/B92FsyZpr3W+xr
	ffDB5M+ySDOGZfSDaZOqLvab8forkjBpyHfowIlKwdWg5H7kgzpaluVSPLmG0/Wl0snu+sANAddDW
	lMhybtgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxPsz-0000000Emz7-2Q7e;
	Sat, 13 Sep 2025 13:01:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxPsx-0000000Emxy-17Gh;
	Sat, 13 Sep 2025 13:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22D0942CBB;
	Sat, 13 Sep 2025 13:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1000C4CEEB;
	Sat, 13 Sep 2025 13:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757768504;
	bh=AomHbXjj2ZCUcLKxzCjlmTkzRv3ch6j47Nsf97s7m28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+NnwqsdjYqUUU5iDKDNJ1RiHTJ41S+3Q5XcrXwOvxElRasNhNUyyKz0q22WSbK24
	 Iv9gkT9b9xl9pVbotzkof4Al5C1TtWA/zJrlymNERSHnY447cR/VRfac1D31t/WBCw
	 lkpDKFRO4rZuYPCIK+IwL5DSMBBgvRSaEhd2tjDlXb2Eu1QTM1LbcNOMxi6n2ISqCi
	 9KEA4/V+KEHgPDpRaU/FAhFE7YMpYwJ8mVKeqt0yjjadCUEguXponQbyqPn99Kqbla
	 MeTXIG6jKyUr+OtDEB3CQ4jdTOXrWDRYPTr4tajuv7QT78p/rTgjVv7fhvHHI/VCYq
	 X9j/XgJIxBfFg==
Date: Sat, 13 Sep 2025 14:01:37 +0100
From: Simon Horman <horms@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v17 6/8] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20250913130137.GL224143@horms.kernel.org>
References: <20250911133929.30874-1-ansuelsmth@gmail.com>
 <20250911133929.30874-7-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911133929.30874-7-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_060147_325148_D6BB81CA 
X-CRM114-Status: GOOD (  15.65  )
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

On Thu, Sep 11, 2025 at 03:39:21PM +0200, Christian Marangi wrote:
> Add support for Airoha AN8855 Switch MFD that provide support for a DSA
> switch and a NVMEM provider.
> 
> Also make use of the mdio-regmap driver and register a regmap for each
> internal PHY of the switch.
> This is needed to handle the double usage of the PHYs as both PHY and
> Switch accessor.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

...

> diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c

...

> +static int an855_mdio_register(struct device *dev, struct an8855_core_priv *priv)
> +{
> +	struct device_node *mdio_np;
> +	int ret;
> +
> +	mdio_np = of_get_child_by_name(dev->of_node, "mdio");
> +	if (!mdio_np)
> +		return -ENODEV;
> +
> +	for_each_available_child_of_node_scoped(mdio_np, phy_np) {
> +		ret = an8855_phy_register(dev, priv, phy_np);
> +		if (ret)
> +			break;
> +	}

Hi Christian,

Maybe it cannot happen, but if the loop above iterates zero times,
then ret will be used uninitialised below.

Flagged by Smatch.

> +
> +	of_node_put(mdio_np);
> +	return ret;
> +}

...

