Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB98EE498E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 17:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7UUAxBiz2VNPSI7n0ZU15lbc01uDl6QBt1Zyg5SYlg=; b=pUfEMOS7scyxNSZO8AnFmMUEbr
	aue3OvwKUE6LaGQNZ9EOJpGZtgr2j13iKEtYAGbcl3T3Oe5rohPEXL0z6gJasRrb2/gYFTRQKiVki
	NmZjKeAznZOBG1ib8IFiZ4lHrgh80jXo61a2t8phzXfDFtkhNp26+fGVdupQwZN0ssq0XHn+cNYVe
	SO+lpY7wJdW2gNGjxaBZZlCvIYuYyL/XuHSTa7scciv41jomxW9GsNUvD/pPAf3KsJiBCGKQy3TV9
	bs0grJ7R0yIjt96TJ/OAeSPwzXeTwjkColnjQE+lUeE84/jS4mPuMqPmDm81+lDDn1/3SdQobjLVz
	snm17oGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadpH-0000000598F-2q2V;
	Tue, 30 Dec 2025 17:48:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadpG-00000005985-3zVU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 17:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09C7860017;
	Tue, 30 Dec 2025 17:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA01BC4CEFB;
	Tue, 30 Dec 2025 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767116885;
	bh=N7UUAxBiz2VNPSI7n0ZU15lbc01uDl6QBt1Zyg5SYlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iskjk0ukY1R3GMaQ4173SEL1UBw1S23M3vuCmZpUxD6ByaTFqGNWya1PiPjLxhx2X
	 LR6my8/W09bViFJbO3An9D/BSikw8KBehDvWvmzYHw4KmWmnchIBsYGbEo9UCrVVPe
	 ikCNEbAeSkSDXJEXgJi1/RIU13aRPX+QQJ/i0D8WAjFwFvt9mhJBLrbRy1vmGemVIY
	 Wwh7XDzIRw+ZrzYM9xSgPnZT9IIyvBm8uIYl2/sQligLHSKK4qUlwYsLQesw4OGUUl
	 bwq4aN/0jDRyQD1Hl6RlBXHKdH7xySJ7mEia1rzZARx3dbdtC5wnYwG14sVzJWsJMi
	 +pH9dnWceBcgQ==
Date: Tue, 30 Dec 2025 17:47:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au,
	davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
	lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org,
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, olivia@selenic.com,
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	broonie@kernel.org, lars.povlsen@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v4 14/15] dt-bindings: arm: AT91: document EV23X71A board
Message-ID: <20251230-imprecise-cohesive-25a1f0ec1896@spud>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-15-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZWjypDN5GPfEBIGy"
Content-Disposition: inline
In-Reply-To: <20251229184004.571837-15-robert.marko@sartura.hr>
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


--ZWjypDN5GPfEBIGy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ZWjypDN5GPfEBIGy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaVQQTAAKCRB4tDGHoIJi
0ufVAP41AIR3LR0nvj27ohIxrkUaPNdUAsA77vMxPkkpcl6SgAEA2oZF4ChuF/6n
1N8HRuxXSCp7DSjp7VlfsdsWNtMzeQo=
=pUr1
-----END PGP SIGNATURE-----

--ZWjypDN5GPfEBIGy--

