Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D060C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 12:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O62I4pFc3JnVqx9L8an5wgvbSqIo9PimfybTZS4SMIw=; b=W6Gh8WokWV7M8m2Xe9mTEF2Q1V
	l1JcCc2L6qvlvaCpq7TEqO00l89MAN75hegMPpg58SPHwv6T12eIa1muc/frz3VchmjxzrrEIOIQ/
	baprDmxhL65VAIRb23N1gnKG14u/FqTxIHJ8ZsLet2rUq8iqtasS339h8AqQcjzGtFf6/1ldf34I5
	uOOD+2CDl4KB0s5CGXIXEdS/cp46InTGZugAz4gvAuOZzUdEhyG3GsyVXjmQst05jIw/Tr4k+vLjq
	6SdPHRZFdvVhijad8n3OdRVIbTP8wuiOan5ogo5U4+N1j+tnfrrV39BFalOjern/9YP4TQlqye/io
	zL8jHH+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEolR-0000000CMIl-03vN;
	Tue, 13 May 2025 12:29:41 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEohO-0000000CLrI-1hIp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 12:25:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A251D1FCF1;
	Tue, 13 May 2025 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747139126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O62I4pFc3JnVqx9L8an5wgvbSqIo9PimfybTZS4SMIw=;
	b=IHJkIko3+qalmEz8B4hLfVjusGl44dZ59bGzjjqjVhrQFXY+txhj9bLFMSXaze5sw2eK5h
	NBLMAsLniDK/yGv+bi5y1aE05NqCF22O07Uu++x1HspcYgAZD952b/uQH1LbiYDe1QnkN+
	5XSx5EdkpI5TtUIKj+qZcVPnMEE1kFkTosjy/gNKQKT9gNq/wj7ZqO3ma3VLc+p3y6sfjC
	+6ZF0SAAZ6xodv9wx5RvtLY7lVqtFmcxp1HDq0EKo/uQNi8usMAo8FnnOlXgucYM5xYQKn
	AK31XYK5/Xz8j459TG6lPe0OKr2ZEGpa52c4ZG0wG7mOgahF3Rmmhdc8VuceyA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: davem@davemloft.net, Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?B?Tmljb2zDsg==?= Veronese <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v6 05/14] net: phy: Create a phy_port for PHY-driven SFPs
Date: Tue, 13 May 2025 14:25:18 +0200
Message-ID: <5411380.WoAhosY9oF@fw-rgant>
In-Reply-To: <20250507135331.76021-6-maxime.chevallier@bootlin.com>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <20250507135331.76021-6-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4316204.q3hVSFHU5c";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhvdelkeevgfeijedtudeiheefffejhfelgeduuefhleetudeiudektdeiheelgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_052531_071282_D4E6DA85 
X-CRM114-Status: GOOD (  14.92  )
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

--nextPart4316204.q3hVSFHU5c
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 13 May 2025 14:25:18 +0200
Message-ID: <5411380.WoAhosY9oF@fw-rgant>
In-Reply-To: <20250507135331.76021-6-maxime.chevallier@bootlin.com>
MIME-Version: 1.0

Hi Maxime,

On Wednesday, 7 May 2025 15:53:21 CEST Maxime Chevallier wrote:
> Some PHY devices may be used as media-converters to drive SFP ports (for
> example, to allow using SFP when the SoC can only output RGMII). This is
> already supported to some extend by allowing PHY drivers to registers
> themselves as being SFP upstream.
> 
...
>   *
> @@ -149,6 +151,21 @@ void phy_port_update_supported(struct phy_port *port)
>  		ethtool_medium_get_supported(supported, i, port->lanes);
>  		linkmode_or(port->supported, port->supported, supported);
>  	}
> +
> +	/* Serdes ports supported may through SFP may not have any medium set,
> +	 * as they will output PHY_INTERFACE_MODE_XXX modes. In that case, 
derive
> +	 * the supported list based on these interfaces
> +	 */
> +	if (port->is_serdes && linkmode_empty(supported)) {

The "supported" bitmap needs to be zeroed out before this check. If the port 
has no mediums, then the bitmap won't be initialized at this point.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart4316204.q3hVSFHU5c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmgjOi4ACgkQ3R9U/FLj
287DUhAAngbhJUwLCvBnV5PWgoxzylrH4wZtZlKTuz1naWUfoB3fHZM+QTzrNVsB
0+/GfPFTYYVb/3zeAbvC13AGxQIgZzCA/Xcmw4kDgzNV49gmyoGrxCkgug1BhMmS
EXMueGmXF7bFuJ4L54czImHNdOa7olxl0F+v1XiSy46wmjD+39CDaEJhcby+hdC/
LtzODlMPJiYd3nXRda64cERU+maoEHWw3ISNuoyv0uYFle9svUK/XJnLYHMzbSKS
O69wa+Q1ESB8z3hNEI1gJn7QKleb01DIqY90pK91O2Lc5D9ZZSsBR50wxRW16lzd
4tRHtX1r32BhS5A2YqrT3UsVQhh4gegJqqSnRBnNVp7+1FNWKS7d/1Y8kpehPxVC
3JBoEK87/ULYiWYXpSbd/ZO0Wb+HwQIW+rY3YhyaGJIPNY6xZt+EcY+h0H5jmhM7
Lcv+48vReuIOkgiQOWEmeCKCpWG818kQXuXGjNy4gh7eSTYVD3g603tLfGJUczT3
B9cBN83/o72XNqJqjLUSbYWRx02/8teT7uje1lydlnHwApD6bEXVr3xv8vNOxcgo
bCqgZQpnFbLu/auEs/8j1Wgn4Ajc98CYnu7s8+gtBr+rfFkiMh3IPc7RLklDiG/e
DGI0Q5r4LD4dN/nsA5bSg5mpu3llpwS63eb59BQNueO6hiWpX9k=
=Wa24
-----END PGP SIGNATURE-----

--nextPart4316204.q3hVSFHU5c--




