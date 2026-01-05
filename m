Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D16C79F8A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcK9JhgklTlks/dbMU+80cGJYIWzHkB6Fy6SWnC+6X4=; b=Cd8+UVrki+f1Rhp5I5YkuXNIt5
	TycQG5fZhca0xV0St0gKfx3YQi17m1wV44MswfwEJaK4tJsBA23LMlL2Astxw5//rLfo9/cBElhlS
	zClD/Uhkbx7EKnpxKayiyr3l863h7hm3RxrMfO4m1uCQla5irTacoKAEfJGaP+ZIxeOn6jjiU+oTM
	Tfn/xb2D1EvrpSPQC+LGjE1Wj9shyXdI9U5hy6HDf7iw7fXgiitnwZ3vaj8YXnH87ZJjOKKstw3zc
	MDbevOVfgOtCTqM4I8TLSWhM1khTHo46dquagto7GXTFQbOLglOdHZUwJypuJ7fxdKZqwr7yp+sZx
	PB7CvCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjzL-0000000BKhV-1YE6;
	Mon, 05 Jan 2026 12:47:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjzJ-0000000BKg0-1aCI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:47:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B9F040DC8;
	Mon,  5 Jan 2026 12:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3606CC116D0;
	Mon,  5 Jan 2026 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767617227;
	bh=DcK9JhgklTlks/dbMU+80cGJYIWzHkB6Fy6SWnC+6X4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nz5BKJw/SW7aFh5PDOn4mjTKTV+LFDrfIA0RGg+0ukrtI/PWWaAkWyRxPhjHOORJ2
	 F/w6WBFrMWFgCSU2ISdgFwjDlN6RJQGUpNtbSDFRgxj0nCBCNDcP/L8EDfUCsH9gEc
	 mlu4FBl2Ci2EU2Ws0he3TS3VVhUptlYr949Nb1Pt3prNClT7c60WGSzHXKmRhXNJ6j
	 AahYn0rfC6Gh2cHn5zTWUzZEAv/8eKMksb2N723rGz9Dh7iCNZ/zP1/Y/1u5wxBIyA
	 1Un3saqGObtBBTQaXpEhtVjmp3anbCGER1NIrZ5yjgzlo4HO5YIiuhg64BQYow0aEu
	 K25kQXvV5JU6Q==
Date: Mon, 5 Jan 2026 12:46:57 +0000
From: Mark Brown <broonie@kernel.org>
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
	lars.povlsen@microchip.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	luka.perkov@sartura.hr, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 04/15] dt-bindings: spi: at91: add
 microchip,lan9691-spi
Message-ID: <2ff4b417-871b-4b0e-a4f5-424ce535ebd3@sirena.org.uk>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-5-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L5qsEAHx6q9dJj52"
Content-Disposition: inline
In-Reply-To: <20251229184004.571837-5-robert.marko@sartura.hr>
X-Cookie: So many women
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_044709_442618_5D8CFE88 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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


--L5qsEAHx6q9dJj52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 29, 2025 at 07:37:45PM +0100, Robert Marko wrote:

> Document Microchip LAN969x SPI compatible.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--L5qsEAHx6q9dJj52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlbssAACgkQJNaLcl1U
h9D4Xwf/SR39qhC6yLd9TVLdTbJvbv9td/1UUXSFHjr1far0W1wTnHIk9agrEcs+
/CUvNmq9Xga7s68neH9NM4e3phBnJZt74a3J3zzhvBekn3xXCyKfmhw9WFU+rGGC
dLJg/c/VyK4Dzfq6tzvajmvH8NYGkfWsf8TDYMAQkWfyFf3iASqrWODzvobA5l8D
f4Q5wCZqo6GnSlAfW2+galQbUNMK85g0ponFRfi1JfjuTyYb2ZKghpKWLJGOTJzj
PMinOleBkv3jp7jH4T6Lh+DiCyhddXuYJhoGGfDIlnhZrm+1fCifyVtpxwbXKXH3
bT3c73me1CxD3Ncn8Q6E2gOrpidxdg==
=VKTA
-----END PGP SIGNATURE-----

--L5qsEAHx6q9dJj52--

