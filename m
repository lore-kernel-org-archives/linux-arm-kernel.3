Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A89EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1eBjozoNuRF1SRfHVlWdXHtFeACQZPvHsgrTM6WN9s=; b=DUYO033W0KNtrckeq6qNRqbUCr
	h5LLlRl6VwFE62oHpiCnjoDmK9r75/pwemVyyEP7F9IMSn1wCPCodzuwSnILSafbju2TPZnhX6eQZ
	M4yoOqeXvU3N39MNvaxcLdlJpBlhjy+rYWc9hCF7Zc57wrmNL1LwCcRCxAL5h8f723birOqxHOxiE
	OCEhPmUrbAB6PyYd487rBwfL3G4m9FplHv8c+NDQ0qXOyrg3P9r2pRCkwODvZXOC/ABX2TY/hC7RF
	bW2iS2IKMhQLziAhlE3ERH4h9toLKvs9SHldqeMV9LwOI6XjTvx2UroGNmA+WXu51zA+Q37OQIvFn
	UMHKc+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFhC-000000086Rw-0JjL;
	Wed, 12 Feb 2025 16:34:42 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiF9i-00000007yPS-1lOe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 16:00:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D74B4442F8;
	Wed, 12 Feb 2025 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739376003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1eBjozoNuRF1SRfHVlWdXHtFeACQZPvHsgrTM6WN9s=;
	b=CtyxxtQrKkXhLEK27onKf7pLUVHTqU6rJ6GqsIIoOBDdn5+aoiWOqOaGohmUj5wYIWTLmm
	tHISVD92pszINkDKtayJc0i22GXH23j3Xjasdu5e8BU03ckal4CTw5juS4HhsvoYvQGbki
	7K1N+Vy3JW564uFPcoLKnhrsdRMcOtkrRnQfNp8xSDz4bR93HFDD3AvG8xvMvle2VHL6kh
	NuqSJBLKae9r+aEPJ0CzcwWT8aQ0KRPTrFfrgs0oTkGFyczWlX5L5Bjd9yuy5hTpKRzTQi
	GjbstaOz2XFK39C5abxl8aLci/7CSAallJKj7kD9AKOgdA/LkHJAAESMHWAZ6A==
Date: Wed, 12 Feb 2025 16:59:58 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com, Andrew Lunn
 <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 05/13] net: phy: Create a phy_port for
 PHY-driven SFPs
Message-ID: <20250212165958.6baaf294@fedora.home>
In-Reply-To: <20250207223634.600218-6-maxime.chevallier@bootlin.com>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
	<20250207223634.600218-6-maxime.chevallier@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_080006_610737_4B30C714 
X-CRM114-Status: GOOD (  17.54  )
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

On Fri,  7 Feb 2025 23:36:24 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Some PHY devices may be used as media-converters to drive SFP ports (for
> example, to allow using SFP when the SoC can only output RGMII). This is
> already supported to some extend by allowing PHY drivers to registers
> themselves as being SFP upstream.
> 
> However, the logic to drive the SFP can actually be split to a per-port
> control logic, allowing support for multi-port PHYs, or PHYs that can
> either drive SFPs or Copper.
> 
> To that extent, create a phy_port when registering an SFP bus onto a
> PHY. This port is considered a "serdes" port, in that it can feed data
> to anther entity on the link. The PHY driver needs to specify the
> various PHY_INTERFACE_MODE_XXX that this port supports.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[...]
>  
> +/**
> + * phylink_interfaces_to_linkmodes() - List all possible linkmodes based on a
> + *				       set of supported interfaces, assuming no
> + *				       rate matching.
> + * @linkmodes: the supported linkmodes
> + * @interfaces: Set of interfaces (PHY_INTERFACE_MODE_XXX)
> + *
> + * Compute the exhaustive list of modes that can conceivably be achieved from a
> + * set of MII interfaces. This is derived from the possible speeds and duplex
> + * achievable from these interfaces. This list is likely too exhaustive (there
> + * may not exist any device out there that can convert from an interface to a
> + * linkmode) and it needs further filtering based on real HW capabilities.
> + */
> +void phylink_interfaces_to_linkmodes(unsigned long *linkmodes,
> +				     const unsigned long *interfaces)
> +{
> +	phy_interface_t interface;
> +	unsigned long caps = 0;
> +
> +	linkmode_zero(linkmodes);
> +
> +	for_each_set_bit(interface, interfaces, PHY_INTERFACE_MODE_MAX)
> +		caps = phylink_get_capabilities(interface,
> +						GENMASK(__fls(MAC_400000FD),
> +							__fls(MAC_10HD)),
> +						RATE_MATCH_NONE);

Shoule be :
		caps |= phylink_get_capabilities(...);

I'll address that in V2, my bad...

Maxime

