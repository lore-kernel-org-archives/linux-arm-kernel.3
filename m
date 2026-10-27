Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0C4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JPKkLEjT;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/9wjUU8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kvHpdbzr181XbRpEgtV1R2oktcYB29tcS5XHBNv0lQ8=; b=JPKkLEjTO8BJWasWj3x2kNSVFL
	rC33xF17c4V+viMovfAtKxwF0FbTipwyfaaiuMF20tZv/dRj3eHOawOVEbIOVRaBMhGf00WgODM3o
	wNUQQJchImrpDsn2zgiy3nBW3FtidFL6YN5TiJ6fKIqbtcpjjnMrXziS4NqgJR6u/VLbYyYQeNm4V
	dLgc+PNTIW/QH9VYIBBj+arBZ6FAn2wyK7enh7mTRTPD1h4wZYCI+qUsLUafcGamkcWHh51lEEloQ
	Jj8yeeppLriKBV4zxNjQoOtSb8A1F7Jm1xr+UGZnPDIDBUsRQ+FNUWtunB1h/3mT+dwJHdYYzcujo
	+APJrc9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLk65-00000005MzL-3Eon;
	Tue, 27 Oct 2026 16:32:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLk63-00000005Myu-3KGO;
	Tue, 27 Oct 2026 16:32:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 652D540F22;
	Tue, 27 Oct 2026 16:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C18B21F01825;
	Tue, 27 Oct 2026 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793118743;
	bh=kvHpdbzr181XbRpEgtV1R2oktcYB29tcS5XHBNv0lQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L/9wjUU8d3mrJwpelfh/WNYBeL7ClsTN5Z/FIX9bgBT1bfIhFUN3uaTN0CEBEiPwu
	 QCRNL0gSXhd8ncuR9jPx5QFJNPcHNPAo2d3R8t7++MKn7Z48961Ce4h7KI5UDuxYl3
	 07CrG3a8hujQ5s9l2pItC+VbFzItUn9n97KARlIuArpKZleglBPKNFp5J5a03ALXbf
	 sg0amAQcUKZC/SyPFhVmBuCHVm0vaQpfcM88JU8TqsFkaVHbuf+VmMkShkS6NfPvvY
	 oESgVQBE981tciY4ny4xpyD9tT8Ki/cRNVBY6Y4XeWq89PigUFKMseSmjmbEXl+SvT
	 n34tFbBgT8Gow==
Date: Tue, 27 Oct 2026 17:32:20 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Gregor Herburger <gregor.herburger@linutronix.de>, 
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org, 
	Gary Guo <gary@garyguo.net>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Message-ID: <auDRHk8eaYife2zH@monoceros>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wczsomz7ltpapr6j"
Content-Disposition: inline
In-Reply-To: <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--wczsomz7ltpapr6j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
MIME-Version: 1.0

Hello,

On Fri, Oct 23, 2026 at 12:15:56PM +0200, Andrea della Porta wrote:
> Add a hardware monitoring driver to support the fan tachometer on the
> Raspberry Pi RP1 southbridge, found on the Raspberry Pi 5.
>=20
> The RP1 PWM controller block contains specific MMIO registers that hold
> the current fan speed in RPM. These registers are periodically updated by
> the RP1 internal firmware based on the tachometer pulses.
>=20
> Since the Linux PWM subsystem does not currently offer a framework for
> exposing integrated hardware tachometer readings, this driver is
> implemented as a standalone hwmon device. It parses the
> 'raspberrypi,pwm-tachometer' DT property to find the supplier PWM device,
> establishes a device link to ensure proper lifecycle management, and uses
> RP1-specific PWM functions to retrieve the RPM values.

I wonder if the tachometer readout should be a counter driver? That
would allow this driver to not be specific to the RP1 hardware.

Best regards
Uwe

--wczsomz7ltpapr6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrg0hIACgkQj4D7WH0S
/k4tWgf/aBdc0sompTuoqGx4glA5Q7tPemfla+YycjTGdxt9ZwZgvezbioJbkniK
oTXSogrYNoBat5wjHuBQluVrr7TxDUAYcPemNasPLXXw8YsFbuQ6VkxeNJxnoFLI
efQX1S4xPFPOZogKw/pXdFopxrV3J+SGNyNzIKp5CLBHu+MipL78wMBX4W7j2IL8
Fda5MbTg+pbz8BNA5NNmr1xbwLLt+hSSGommcetIOv16gzgyrKd0vZeEtFTsFQSS
NQcPN9XQYOp9unKPk1L1FKip3M+uew5pmOyMYgGBhSoSVetzagYc7FF0YQwK6+Ai
TrVi1WtPSfetPZ6w6o39mL5AThZ+Pg==
=1ZwV
-----END PGP SIGNATURE-----

--wczsomz7ltpapr6j--

