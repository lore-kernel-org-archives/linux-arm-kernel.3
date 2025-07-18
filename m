Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7593AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 17:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfdQECwsAKd69oCQQPZXeJ3b8ObsrMbJL3v2gq4m8TM=; b=BE8v0oaEslahrFsw3Id0KKfFyW
	T6LKWN9We1ROsZz5jRKLtvkPYQG2i/BsYfQw+lJV/UC1cxW3YXhPBYkHwm/3YGkkY377aKQq2ILOd
	fsyG8ZbLvgZOP+FYmE0Y7OkRiXDjW/9xEzJS8b8xOLw6RVlW6QT5XHhD88+PEDCA8jX1d127VafrD
	jLearSioUQ8pKmOBsUkWKf051RPzUNAIGN2CThridnZ2sNrxC7h/qJfaQxtZOVou0uc8Azbwvb3LI
	gZGOZOMgWUlSFdW/tJy40J0jQi9F2RMo53dmlV4E8dOZIYQDevPmdF6KN0uH9K/G3otrL+3hQ5t39
	CzmCVELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucp73-0000000DFdD-33Xi;
	Fri, 18 Jul 2025 17:43:13 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucoz2-0000000DEln-2h8Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 17:34:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6525444F8;
	Fri, 18 Jul 2025 17:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752860091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nfdQECwsAKd69oCQQPZXeJ3b8ObsrMbJL3v2gq4m8TM=;
	b=UmYIc2egaj26juBgJQR+c78DD5Csk9bBatZYAbTD3lMAHKw5HZFfAtWRzUVmfDvMUbyMKC
	tBn0jwwRswN43TxOcV3Gwgb548OHovR98Ju2XQFHASM/IOugi5oBAh3SNQGXr8YCG1SKah
	gnSSvFhz9xkVzCWeMh3COa/bcI3MWTS18v9ARc8qGNQKyYq+9YsNQ/UZosBqXlJQO6PQwA
	Uq5DG0mFC6xY0Boy7Rub7tgkBERWRL1swV8grxzHQZ+G3Fjz5jfR84JOn2svm1FIurvXQt
	EnuS4WcXvI+jnn+HrG7BNUjCzJ0WVnmH5VwSI1+RvtP/CpF0K6HpGHPWv7OwNg==
Date: Fri, 18 Jul 2025 19:34:46 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
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
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v9 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <20250718193431.147df503@kmaincent-XPS-13-7390>
In-Reply-To: <20250717073020.154010-2-maxime.chevallier@bootlin.com>
References: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
	<20250717073020.154010-2-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeigedtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduheemfegvgeemtgehtddtmeekvddttgemiegvtddumeejkegrtgemvdgtugefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduheemfegvgeemtgehtddtmeekvddttgemiegvtddumeejkegrtgemvdgtugefpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtp
 hhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_103456_813261_B68B9870 
X-CRM114-Status: GOOD (  14.81  )
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

Le Thu, 17 Jul 2025 09:30:05 +0200,
Maxime Chevallier <maxime.chevallier@bootlin.com> a =C3=A9crit :

> The ability to describe the physical ports of Ethernet devices is useful
> to describe multi-port devices, as well as to remove any ambiguity with
> regard to the nature of the port.
>=20
> Moreover, describing ports allows for a better description of features
> that are tied to connectors, such as PoE through the PSE-PD devices.
>=20
> Introduce a binding to allow describing the ports, for now with 2
> attributes :
>=20
>  - The number of lanes, which is a quite generic property that allows
>    differentating between multiple similar technologies such as BaseT1
>    and "regular" BaseT (which usually means BaseT4).
>=20
>  - The media that can be used on that port, such as BaseT for Twisted
>    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>    ethernet, etc. This allows defining the nature of the port, and
>    therefore avoids the need for vendor-specific properties such as
>    "micrel,fiber-mode" or "ti,fiber-mode".
>=20
> The port description lives in its own file, as it is intended in the
> future to allow describing the ports for phy-less devices.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

