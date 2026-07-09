Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF71C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+A9BMRv9yHaVLHQkjFgdnp+jwn6wvcmIrFf0EkusFA=; b=Rvk5m+X8cyUKKK2c8KQWOld6H1
	oxwALoY1KtF1QXqzmE/BxyMQTfjrwzuqVMg3tt3IS+KBjMrzrUC2p+7XDMxU7qhvTLpwCTaDPN97g
	0h2cXB/Ous8rQabfCUnM8LeZsZd3ZH7N72eoqw+GLmUSXxmKbzh+JRwa6EwFFUvqT/TG4zB5OJXgP
	hXRJgjiNTd/pNn2j2LC1fAbVtZbMNNYDKqBFt373SOWSl4Cm8T+y2lMFBU5YyKA75+rDxzLGX4zsp
	qwbK0rXwxBsk+4HaTv4S0RJkK9LvcjhviNxJMLZOVDtTo/SI8KBAhiUEDNewayAyB8SRSRkeLfye3
	e5f7JrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsqi-000000039Yu-27Z4;
	Thu, 09 Jul 2026 17:47:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsqg-000000039YJ-38Ie
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:47:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18E9542A24;
	Thu,  9 Jul 2026 17:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1741F00A3A;
	Thu,  9 Jul 2026 17:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783619266;
	bh=V+A9BMRv9yHaVLHQkjFgdnp+jwn6wvcmIrFf0EkusFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jJg2f5PA4HOWOSqPDmrQ6bzLA87RyF4lQvMnzYhNoLH2WGh9A6XR/AiOGtCj7qbU3
	 axg/3h20acUYf7cYdMtVX/swHgwT3zhD4k/wJfPXG0HZBA5T6xk45nRV1lmswKYjC9
	 1MoRed5+bWdPy5TiYJ9Iko6P8IX3/Gh9VK7VSF9K0ajeq9NnEd0HXoHGmL9L5SDAsf
	 UqPsaPEJ8srMoSsBOFQ06BOrxtzeneQEgcl7N4XIQXT+PfJilp2rQ5Um/1CqTp/qKo
	 DbENCi6KGtFYJ7q99hdkI4uCq6V3j5+Mb8k8Ph6w63lwmWn3nBjK+o0lkX1mLGWa5S
	 sTJQTfQeHloQw==
Date: Thu, 9 Jul 2026 18:47:40 +0100
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
Subject: Re: [PATCH 01/11] dt-bindings: arm: apple: Add M3 Pro/Max/Ultra
 devices (T603x)
Message-ID: <20260709-impeding-tingling-c5858eb0191d@spud>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-1-55b305833123@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bxu5bU12IrhANRf8"
Content-Disposition: inline
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-1-55b305833123@jannau.net>
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

--Bxu5bU12IrhANRf8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Bxu5bU12IrhANRf8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/euwAKCRB4tDGHoIJi
0oaMAQDp6Y7KdZuOmjlVBWtA3Gpr3+7rjZ7sL4v4P+s/DitrvgEAqeppjCBkR3AA
0/ciCC4d5WbZN5gzHADvGfZ9RrIh2wI=
=GNtW
-----END PGP SIGNATURE-----

--Bxu5bU12IrhANRf8--

