Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E02C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bx3BgTooTYL0guog1felYiO9mnTJvslWy+4ToQynP7k=; b=nvmYpOjJDnUTTVVW4jjsiHoNzi
	TInPZ0kol5BMPYE+J1KIH0fI9W+xyHUCdUPNxPtzGby8s19+nNErPGx2HTBRt7+4UdZD4VoWFAm7B
	pPof9y7lTSKd4b0Gv4224G1FajrYHFpfjFzvt+b76KIx4sQPg9jW1JhT3lH1vZRJNE+Z84YzixDLz
	2RPz2gS7+Vziv4gIOXJq1uFJY1k9W81YEu9Y/MbM9QJpY7AG8Hfx9obx0sKeziavjr3FVL3tLYyeD
	l2eDCHMR8Qw/srrRn0ZSs7dA+fdUMYuWph+SFRmRBqklyYxpIN6E2LaQXHGafj+tfvy17BcRkca/s
	evk4nXLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsug-00000003AO3-3gSd;
	Thu, 09 Jul 2026 17:51:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsuf-00000003ANY-0Gor
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:51:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B29464021D;
	Thu,  9 Jul 2026 17:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A4D1F000E9;
	Thu,  9 Jul 2026 17:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783619512;
	bh=bx3BgTooTYL0guog1felYiO9mnTJvslWy+4ToQynP7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SXPYedCgYxx+7Oz66PS7V4uJNe1HUgHWtmdZ7FXSz2knXusHkYeD/tDagMm8xulv8
	 HnPx/rhrkBt/GlL9jEdrJaLA2ZEbafVRG5FZaOB26zAaf+SRlml60zpCWd50C6w0WV
	 njYvcYHTfZ5+FAYnmUwRBNBLKd2c9o8lxAYh2FFnK1NRfl6cfmTrQ5HIdamepb7UOi
	 ip0XZkyGBELNrufpyVDD258/AUwyyPrPTKS4EIP/OUcymDCN4HHko4TRx3qFfvToS/
	 0SBArDG62xAMBH0c+DYYRmI3d4KhcNAYS3WJZcUelZ1r5WPaygONrcGzEDUYPF7u4C
	 y9DrCbpShqQzw==
Date: Thu, 9 Jul 2026 18:51:46 +0100
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
Subject: Re: [PATCH 07/11] dt-bindings: pinctrl: apple,pinctrl: Add t6030 and
 t6031 compatibles
Message-ID: <20260709-maturely-bucket-bdb783907d7d@spud>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-7-55b305833123@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mL34U3tBDTFKGQuD"
Content-Disposition: inline
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-7-55b305833123@jannau.net>
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

--mL34U3tBDTFKGQuD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--mL34U3tBDTFKGQuD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/fsgAKCRB4tDGHoIJi
0lqNAP9xEFlSW0nO0NS0vr3KdZBfkVat1bW2xZSZFs9UkfkbQwD/TiAy3NUYm5Ky
zpK3kdm0OXNFnGRZR72FovJM0JtTtw4=
=hXy3
-----END PGP SIGNATURE-----

--mL34U3tBDTFKGQuD--

