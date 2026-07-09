Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A957FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBd5FZlnvt8qVr2rngfOj7JDFYfjWL3zYZADR3eYLyk=; b=T+JkUSB2Ls6c7WM7i54TZ6YWzc
	HaBPNojwqO2V3ZusBtWzVOuKkXDO6jx/vraumSHORLLUhUN3JvR4J7XJIBsFsoDOvZu4ThLxrducG
	d8HsOF5D4X5p37vOu0yQfwCPLyqQJZejAZitvEiZA0wFRbVtdbvnT23+PYP5QSoMGKq3Zu05gHXUV
	3xeY8SkdsNvAqMwCaLb6R7AJslrw79iNRSHNtDN8LtznXecYgNRxcRxU7qbkMst9y8ETb8Ox3rJTO
	dZ/I06d9n713xniS0t/E84x0CzJ/Nc6SHZaNeA6odNkaD/qgjJK8cjBcWPojGiQ5WB+vVM5Yjujy2
	wCkepFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whssk-000000039tY-0Cx2;
	Thu, 09 Jul 2026 17:49:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whssj-000000039tF-253K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:49:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6E69600C3;
	Thu,  9 Jul 2026 17:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A27C1F000E9;
	Thu,  9 Jul 2026 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783619392;
	bh=hBd5FZlnvt8qVr2rngfOj7JDFYfjWL3zYZADR3eYLyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cEH1Ar+WKXKW6YA0WgeZ/lEsARR8htYetFG2gY3KS8ziCfticL5f4wReoaglGBy+a
	 qbMvDnS2oBoZTixdYA2WLV2UmBhpkoljeqcvFP8Qk/F9/W4BY0cKR0+gpW/yS7uQ2b
	 fatfF6XsyZrqqjB1VWF7VNXpvuaIbwUtXcNlhNzqP8bkj+IkdpFjctF0MSCwHqzxnl
	 9Xr60ctiYa8qZPUxWySkCuuCUNqk0Qdu+FtrA1VsJbzErP3b8Pv1aui/DzVrmtkGmk
	 9TgjiBk63COV6FrB7y2ChDEwuVvmNURMi+l7heD7UP2Gbv5pfkO6SixBYJLSMdFYUn
	 6Yx4TRXofoAUw==
Date: Thu, 9 Jul 2026 18:49:46 +0100
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
Subject: Re: [PATCH 03/11] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t6031-aic3 compatible
Message-ID: <20260709-scaling-hazy-d36fb3250e7e@spud>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-3-55b305833123@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YvWdE4NKYv9MtnVB"
Content-Disposition: inline
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-3-55b305833123@jannau.net>
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

--YvWdE4NKYv9MtnVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--YvWdE4NKYv9MtnVB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/fOgAKCRB4tDGHoIJi
0sWmAQDgI9YuXyIQ2dvOC29etmaIiA2e0+V2dcHZZj/zfXGaMgEA+iHj5g9V6QLu
EK0XK2Fi97uP+qZrW6GzdHciVlCoqQ0=
=BvyJ
-----END PGP SIGNATURE-----

--YvWdE4NKYv9MtnVB--

