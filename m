Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C86C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li3QA5jhePh5FJCxsTGQ3mc/L/J+Cb7RuE1tD5BgUSw=; b=ggrxs/dJWXUxKJyjyHKgcGyR5K
	06HlJk3e4uuSMZ4deXAZ0KSDtC0gJC5brhybR4s5sCbWnycX+7S/rF9IkWmot7fB91AMdzK8lT+xP
	1iylIsw7PLcs4nCBWRgO6TQ/fjv7zHbO8l+EXs5K8e4NaDSmEOgJThQ6vNj017Jv0SZ/QE0wE+7Na
	PwBf2mUOnNuGLfSahG/TBA+BM+TS3bKJFDGHryaVBM5uh8bLbKY7fAsdMQTHcGBGPE02sLRRstlGl
	32TCi0eR5+8l+kWmBYp+peAQeme6eUqEzjLYabNVLGg3yEDdKVuwA8nzvFy+Tr1m+YYrqKg3P896Y
	tcEmM9Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsuH-00000003AFi-3C1g;
	Thu, 09 Jul 2026 17:51:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsuF-00000003AFE-4250
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:51:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 513C961387;
	Thu,  9 Jul 2026 17:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C591F00A3F;
	Thu,  9 Jul 2026 17:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783619487;
	bh=li3QA5jhePh5FJCxsTGQ3mc/L/J+Cb7RuE1tD5BgUSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kYZLgxCo8ArpgvaVdVnstF1nHe1zJCI0CXN/jhl95TUoHlnLT5PPYpNrDy70SsLOf
	 M0iE5R4tMTDHgdxD/HeOxhM9/ZnhgIH0WRG3m8IyQOEaUFKB1WmzPTBAL4ET2nlQb8
	 X4nbb/lX8ALo0T42hyoGjTONe+vMnd1ODGXFkuwTDGATWyKo6/E2usOq5CNznwicuM
	 3wogAkwrJMBFzJ8VrdDoCLtpkHNMWOILfDHHprnsPqElmmQUjfLPKB6cen+s6Cx5Po
	 1zBrTLoH+09oUQvZKD7ur+JhoZURcq/HMg2mLXxkGmrY5B1+UV4SJdfDnQ29pY1BBV
	 UpXDf7S6wINxA==
Date: Thu, 9 Jul 2026 18:51:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 06/11] dt-bindings: watchdog: apple,wdt: Add t6030 and
 t6031 compatibles
Message-ID: <20260709-food-marry-ffaa9d371d44@spud>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-6-55b305833123@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZLhkp4lHQ2mZG5Ob"
Content-Disposition: inline
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-6-55b305833123@jannau.net>
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

--ZLhkp4lHQ2mZG5Ob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ZLhkp4lHQ2mZG5Ob
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/fmQAKCRB4tDGHoIJi
0m3zAQDv3jl6UL9b1Ac5LSnukLJWGHoT9ZgCYKH6bKOFw+YEuQEA0fQcrc0ZAUEt
9DluIdhfKw+qVQyFlfQFkY8iCPHESgI=
=3wLF
-----END PGP SIGNATURE-----

--ZLhkp4lHQ2mZG5Ob--

