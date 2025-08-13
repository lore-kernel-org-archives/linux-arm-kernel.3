Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE2EC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKZQpIZ4aFM4Uz6odoT3GA7xbAwznTjRoJh5bhe9kDg=; b=0qj6idT9TISy8Dng+kxuWCul4m
	5uleBGMLEsgrQ0MUQmtrVbvxtuRLRDxXM5XzBe3hsVMwGj23NXiUGQaitlABrzgMQS+SIGfSaKyjV
	f7dHutW8OJIhc3JItOIZKUDVPnEjMlL9u5YBI9tTK47hPXMMJ53aqzSqv0nSxUsQ5b1tgmYfeGSaD
	DOhz1hKNRN58e/L0HSLSBj0J0UQcWe+THy5mRX5Of1xrLCHopURNdXRsKQ+qza4on5VPodL7RTO/6
	Ohmfl07VBThj7mSZEc/xNQiAxJAC86lAJla68yqxhC2um65qJyl7rJWv1KwwGGfQu/PPA35Ei7VR/
	iE6y5AJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPR-0000000Eqf7-04Ur;
	Wed, 13 Aug 2025 19:45:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFak-0000000EcDJ-3c4T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:48:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 585135C6887;
	Wed, 13 Aug 2025 17:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71D5C4CEEB;
	Wed, 13 Aug 2025 17:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755107330;
	bh=PKZQpIZ4aFM4Uz6odoT3GA7xbAwznTjRoJh5bhe9kDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phpPg1Exg3UZg/3X5vqDi0IIoOXur7Ew7OgygBNbeyISgO0CbuT6OwqY8PLlxWnip
	 6jJ4vTHI04+L0/Lb5acfN1N/1vTw7gcYWXBIgO5u9P4EZIKN2u9VYgRiaZlkXhRkPA
	 58JuJsn1mFC7L2YHVA0Nz5ZiUveJxME/ZYAoZ/rHcJqataQANA1jVJF+uuVqNRWVWY
	 hqid1EvlgT92U+hYHlPXGBjwZtnjoUAJh4KsgCPSvicPlSEc9L+ImgCSQUCzR5+RJ3
	 reF5t+vD478IYy3pT1nnuMHxvpxZhkAYnVWgMKD2N0qa2p9WmWtQ+TDQRDPToAbSiv
	 P6V6io0ovyyAg==
Date: Wed, 13 Aug 2025 18:48:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, lee@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v9 6/9] spi: atmel: make it selectable for ARCH_MICROCHIP
Message-ID: <e629381c-2ad7-4693-892e-1d896db2bceb@sirena.org.uk>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-7-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Le9MbVgkKAcD0eI8"
Content-Disposition: inline
In-Reply-To: <20250813174720.540015-7-robert.marko@sartura.hr>
X-Cookie: Turn the other cheek.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_104850_942000_EC7695ED 
X-CRM114-Status: GOOD (  10.14  )
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


--Le9MbVgkKAcD0eI8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 13, 2025 at 07:44:42PM +0200, Robert Marko wrote:
> LAN969x uses the Atmel SPI, so make it selectable for ARCH_MICROCHIP to
> avoid needing to update depends in future if other Microchip SoC-s use it
> as well.

Acked-by: Mark Brown <broonie@kernel.org>

--Le9MbVgkKAcD0eI8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmicz/oACgkQJNaLcl1U
h9CwBgf9FMNxW0CB5IeMi0N03NdPh3cHrdyQTVznm+0Ttm4BbWAlmjjmhfOAg8JF
OIXZnvuk0IuAXUYGKYLNVuT4kRGXqgZKY7e1WqpkhsAfEam9ECXsRxc+w45KVL2A
Yni2+VdRQ+jB9nB84kRCVLpTDfymidB9CtYv//Fuc5YKwLqXPb28HXsnvMyrAQSV
HvOsLtfR+ImALUhvmAgYLbr1nAgEwdZoEV680HNFdrFVyd6NnFJHyhSZP9br6p68
KnlRw8CzokHg6rHDkthrZsHzf4x8wPfB/+QBzuzatBkzW/Z1x8Hgec/b4UUgM0hB
Vtj4AJLk/ypd5d2EH+NEmUdcy7H/UQ==
=vPOw
-----END PGP SIGNATURE-----

--Le9MbVgkKAcD0eI8--

