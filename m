Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A7FC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Tr7ht9RaQ1mmZzlO0RWE9wqu1IpyyKJ3Q2xB3+M7QM=; b=oUTzbRNZttiTtZJEMZFXuTKFfw
	jc5a69c9BnJA6dGDMk8b18mB8JtKB9xFAIL/EK6OLHskgvfdMD5ouDOKsuWZfhfDkERXltIxBt8g1
	ManN1WnsenqnH5ove20OdJlYm5QI4FzfwDLvJ6rrfiljWJ76OgWUPWkQbLcjLtAIZuUto7HlPmirH
	27rMFRe2A64DAuDX5l7hK5P88FBQ0TcBk9H2+gkA8NYZqbWhvZvAezwP1CYW481liZvwZjID/pjBh
	zJopLZ5yvkiGT6ezdgF2VNxPbiViige4zvzGOB6irzY6SxHqrcZE4okFtD+Fs70Cd9xmq6LQQI2vG
	S5ZmbshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbQM-00000001RuQ-1zYu;
	Thu, 28 Aug 2025 12:08:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYC5-00000000pjM-2pwo;
	Thu, 28 Aug 2025 08:41:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3EA5600AA;
	Thu, 28 Aug 2025 08:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17307C4CEEB;
	Thu, 28 Aug 2025 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756370476;
	bh=3Tr7ht9RaQ1mmZzlO0RWE9wqu1IpyyKJ3Q2xB3+M7QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+HJy0Ew6hxAO2ybuI1qit4HkoBlZ+7pblW6gIadxFLxIlQlYDAJ55feMih3YrlkG
	 U/OQWKmE/4fIKVNQMqQzwFvDc3o/1U7xVm6gSEdDeCI5Z9IunyRsh7TlxXEIlRwDBU
	 tKeZ1J3RpTChQ3ALGyv/P+B5yQea2XBiaxUz745RBIt9UJxfNT0OPIwEEmcvgoZ1JO
	 BxDiW8gmo2zQlj6iqsRWaEwTjnAX+ojxq9lDBHc2d/9//CpdDzqXwjxd9Cfe9yAPzE
	 /Yj45O64u0VGI9XSt2XEMa2C7ZoHxNLnyQY9zT+LQU5UQ6McM9rQtRxUj2hTcNzLhc
	 7VcwBTal4Mo4Q==
Date: Thu, 28 Aug 2025 10:41:10 +0200
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tim Harvey <tharvey@gateworks.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jean Delvare <jdelvare@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Nikita Travkin <nikita@trvn.ru>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Mathew McBride <matt@traverse.com.au>
Subject: Re: [PATCH v3] dt-bindings: mfd: Move embedded controllers to own
 directory
Message-ID: <aLAWJn4yKukvaIro@finisterre.sirena.org.uk>
References: <20250825081201.9775-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ok3vOuHD1C4RwPWT"
Content-Disposition: inline
In-Reply-To: <20250825081201.9775-2-krzysztof.kozlowski@linaro.org>
X-Cookie: Filmed before a live audience.
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


--ok3vOuHD1C4RwPWT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 25, 2025 at 10:12:02AM +0200, Krzysztof Kozlowski wrote:

> Move several embedded controller bindings (like ChromeOS EC, Gateworks
> System Controller and Kontron sl28cpld Board Management) to new
> subdirectory "embedded-controller" matching their purpose.

Acked-by: Mark Brown <broonie@kernel.org>

--ok3vOuHD1C4RwPWT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiwFiYACgkQJNaLcl1U
h9CEPwf+J550xIwuw8AaUZo+9pOj1PHT+041UckMzvPlutaXGGQ0l4+E8dgv/+F5
axHPEuZztWIxiajWwLHso4HcDQbXtz7U1ALEbjoR8G7/JPWMxQpS0eO5N1bRmUOj
rc6R/jGPW+GoVTTmHjq0++Xh2GRWNt6QnW4HzGnn0RwHwxsRYmk1Yr6y2j94fhNP
QiAb/bFASf2nQ7bV1md6JI9BUwyrwJgqBI0/pXB7fzptET77UeuwX+D3S3Pl/zll
mFnmPDlfcdfIRP3D4HydviJc9WBRhkXmcnRa51abojkg2IcABSiTgbW4juQomD9G
7CJMLCouGZOv5SS74saYf09DXOJltw==
=G0XQ
-----END PGP SIGNATURE-----

--ok3vOuHD1C4RwPWT--

