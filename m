Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF33D44D78
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bd5qlV0ry9Timmvb34UfzsATtR5/fb6bpyJVQ5gjwbM=; b=ltEgtlYlqKJHnIE6yQF5FjYzW0
	gRJNnpd+ssWGNcXeYKilYwwlMD+iydYqAazztDGgIuWCYjuJVn8KbEosUt41rwCFRKsh0AMiow4Ul
	jQGb4dorJSEfYZ3RRmToSVcZ18SVA9lUZJDrhAA4ux3Ye7qMTOOQVQakeifZFEIcRM8C0dsIGoHyI
	NitHQpTA/yxiCI0PisxGf9UknaN51MKGwBsXAcLy+OyUX0YxXqOuJsN3ySb3J38ZT58/NwWGlxVTk
	nMynXWaNCMrbl/I4TYlgiXDS4m/CR6kF8kA2quuR92RCCnciyTcRep3gsJ7RRCalTvRJWggFqVPTQ
	39YMUAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hSn-00000003iOE-2jBa;
	Wed, 06 Nov 2024 14:56:53 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hR3-00000003i32-03Ut;
	Wed, 06 Nov 2024 14:55:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90631FF80A;
	Wed,  6 Nov 2024 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730904901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bd5qlV0ry9Timmvb34UfzsATtR5/fb6bpyJVQ5gjwbM=;
	b=TWdQIdLm7OWOZLR8j3B17CgfGIw2sp0Lxy3/CVYNHtmX8mzp5Zruai9XL4T6mFBDk8E2UT
	040oy2WNAJnzcJe60B4bCsIm+Cl0tmwnVoHdlzVm8E59f2Xu2/7zP4rYtr66+kNPfMZm5u
	M1+7Uwu7zO2FuC7xMkWRSU7lpD6ZboMMYsqC1wvzBwLwNNHbf2b/UF9SLJA1J+ZflYMxvE
	s7ByrDs5c7VfA4cpgptfI4y0FnWSpcHzWVTStnkQ1cs65EuQeAvyrJpQzQlrbNpPVAtbci
	BxQiKxnyJf9MhQXFeCP/nOXSsM6dMU91sHM/+YNmI8o0uyggUabAtNzFzzGOBg==
Date: Wed, 6 Nov 2024 15:54:58 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
Subject: Re: [net-next PATCH v3 3/3] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Message-ID: <20241106155458.3552cdda@fedora.home>
In-Reply-To: <20241106122254.13228-4-ansuelsmth@gmail.com>
References: <20241106122254.13228-1-ansuelsmth@gmail.com>
	<20241106122254.13228-4-ansuelsmth@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_065505_236645_F1F53B04 
X-CRM114-Status: GOOD (  13.82  )
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

Hello Christian,

On Wed,  6 Nov 2024 13:22:38 +0100
Christian Marangi <ansuelsmth@gmail.com> wrote:

> Add support for Airoha AN8855 Internal Switch Gigabit PHY.
> 
> This is a simple PHY driver to configure and calibrate the PHY for the
> AN8855 Switch with the use of NVMEM cells.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

[...]

> +static int an8855_get_downshift(struct phy_device *phydev, u8 *data)
> +{
> +	int saved_page;
> +	int val;
> +	int ret;
> +
> +	saved_page = phy_select_page(phydev, AN8855_PHY_PAGE_EXTENDED_1);
> +	if (saved_page >= 0)
> +		val = __phy_read(phydev, AN8855_PHY_EXT_REG_14);
> +	ret = phy_restore_page(phydev, saved_page, val);

I think this can be replaced with phy_read_paged()

[...]

> +static int an8855_set_downshift(struct phy_device *phydev, u8 cnt)
> +{
> +	int saved_page;
> +	int ret;
> +
> +	saved_page = phy_select_page(phydev, AN8855_PHY_PAGE_EXTENDED_1);
> +	if (saved_page >= 0) {
> +		if (cnt != DOWNSHIFT_DEV_DISABLE)
> +			ret = __phy_set_bits(phydev, AN8855_PHY_EXT_REG_14,
> +					     AN8855_PHY_EN_DOWN_SHFIT);
> +		else
> +			ret = __phy_clear_bits(phydev, AN8855_PHY_EXT_REG_14,
> +					       AN8855_PHY_EN_DOWN_SHFIT);
> +	}
> +
> +	return phy_restore_page(phydev, saved_page, ret);

And this by phy_modify_paged() :)

Thanks,

Maxime

