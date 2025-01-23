Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F18DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 09:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2YlYlx83cyR+45tTYr17HHrjYcIDaSt0mPlw1nFDgA=; b=aww7XNoawc4bp1XwVN5N+X3833
	APYMmSZdx+/pRZeY8GNFDpHB9XweOKZu3bQuyXDZOmsnvWtJ4sVXANdBMf5av2uVUDTWdrCkDOH/9
	IsBu2bfZLP5hX+s3/Jz5yKXGmv+fglUy38TAVBfMe6WmKp+USkgS5uOO6SXTtuZSCeXlNzOgiLEIu
	E0/O8YDKL330TXMiOZhA9Bmp5oofQR+4S05jEziC3+OXHpfSWAG+hQ4rE19B+1vm6La2cxkzulm4d
	js71O3t3BpR2MHl5xZnjxFCNCALVb+gGjrjJ9BlL0kGEKQwF9r8Y7LeyThAj+rkGw8ZU6ZRtxjk4B
	1caDuPsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tate5-0000000C6wL-1293;
	Thu, 23 Jan 2025 09:37:05 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tatcm-0000000C6ji-0W9o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 09:35:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9106560008;
	Thu, 23 Jan 2025 09:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737624939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2YlYlx83cyR+45tTYr17HHrjYcIDaSt0mPlw1nFDgA=;
	b=nMLJB4cULhW8v0VbdR2QbZ9njGeqo7RCBUWP9SbAAB57ymSLCOKNqSLwj0ilbF7cHjwTKJ
	u4RHUQunWxctad88+JkgqGPeWyNFhfz+cB0kZ0HAcPDsL7zB6psDwSVX/5Jrk2YyLf3i7s
	D7/w8xN9cEm/LcM5//Z4wuS6g5+rFx9l0Hjf2hAlo8xYjIySsjMfQD56BUAQUwqe3skYHB
	DNU62quUCtH+Su5BFE95ZN0BYB3LUkwuDvd2QiUXSufJeBb2iPAioM5f0xQJpCt6PrRPtx
	DF0RxnxzRaZCIUl/iMMqtTqc+FA1Ihoh6V2AV59eQvCg0tUv561BTBTxHaNcvQ==
Date: Thu, 23 Jan 2025 10:35:34 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Subject: Re: [PATCH net-next RFC v2 2/6] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
Message-ID: <20250123103534.1ca273af@kmaincent-XPS-13-7390>
In-Reply-To: <20250122174252.82730-3-maxime.chevallier@bootlin.com>
References: <20250122174252.82730-1-maxime.chevallier@bootlin.com>
	<20250122174252.82730-3-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_013544_428748_E6BFA52F 
X-CRM114-Status: GOOD (  14.38  )
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

On Wed, 22 Jan 2025 18:42:47 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> In an effort to have a better representation of Ethernet ports,
> introduce enumeration values representing the various ethernet Mediums.
>=20
> This is part of the 802.3 naming convention, for example :
>=20
> 1000 Base T 4
>  |    |   | |
>  |    |   | \_ lanes (4)
>  |    |   \___ Medium (T =3D=3D Twisted Copper Pairs)
>  |    \_______ Baseband transmission
>  \____________ Speed
>=20
>  Other example :
>=20
> 10000 Base K X 4
>            | | \_ lanes (4)
>            | \___ encoding (BaseX is 8b/10b while BaseR is 66b/64b)
>            \_____ Medium (K is backplane ethernet)
>=20
> In the case of representing a physical port, only the medium and number
> of lanes should be relevant. One exception would be 1000BaseX, which is
> currently also used as a medium in what appears to be any of
> 1000BaseSX, 1000BaseFX, 1000BaseCX and 1000BaseLX.



> -	__DEFINE_LINK_MODE_PARAMS(100, T, Half),
> -	__DEFINE_LINK_MODE_PARAMS(100, T, Full),
> -	__DEFINE_LINK_MODE_PARAMS(1000, T, Half),
> -	__DEFINE_LINK_MODE_PARAMS(1000, T, Full),
> +	__DEFINE_LINK_MODE_PARAMS_LANES(10, T, 2, 4, Half, T),
> +	__DEFINE_LINK_MODE_PARAMS_LANES(10, T, 2, 4, Full, T),
> +	__DEFINE_LINK_MODE_PARAMS_LANES(100, T, 2, 4, Half, T),
> +	__DEFINE_LINK_MODE_PARAMS_LANES(100, T, 2, 4, Full, T),


> -	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full),
> -	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full),
> -	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full),
> +	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full, K),
> +	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full, K),
> +	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full, K),

The medium information is used twice.
Maybe we could redefine the __DEFINE_LINK_MODE_PARAMS like this to avoid
redundant information:
#define __DEFINE_LINK_MODE_PARAMS(_speed, _medium, _encoding, _lanes, _dupl=
ex)

And something like this when the lanes are not a fix number:
#define __DEFINE_LINK_MODE_PARAMS_LANES_RANGE(_speed, _medium, _encoding,
_min_lanes, _max_lanes, _duplex)

Then we can remove all the __LINK_MODE_LANES_XX defines which may be
wrong as you have spotted in patch 1.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

