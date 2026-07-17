Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89984C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6dliTL3upPz3AWTcFuW/Bf8sQHGqFSf/FvFJ52AEJY=; b=2hgnROCp3mszL+FzpuChsT9yw9
	VCeEeX3axt26eBkv9Shawz/VKSTPxZ2Y6EM3u/012LATzr2T9ILOEckfEi8LizDJgEJ/h7l4yhDBT
	h8i6G4leroxx8iovCL2a/vPIXfX9Q11fuq3hIv18SKWL43O39jfdmLGIW+hQRq0Vi2AxbeSWEVl+X
	MVLsBHhVwKmUUGI4j4MktMScK6bnTx4Mr/6z6nzxlI51AhRjK9L19ZAzlFDyQyZFGp5x3mPSlSZCf
	peDmd13/x3Glo5JVaSXcrZWVqQcap7ZwVl7L2PZgPlRyeaXckEZXt1Kjn3DDd0Ej7+S1eu4Jy6ywj
	710KpmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhHE-00000002D6N-3a5K;
	Fri, 17 Jul 2026 12:02:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhHA-00000002D3c-3fXJ;
	Fri, 17 Jul 2026 12:02:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3F1460A6F;
	Fri, 17 Jul 2026 12:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A1A1F000E9;
	Fri, 17 Jul 2026 12:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784289763;
	bh=M6dliTL3upPz3AWTcFuW/Bf8sQHGqFSf/FvFJ52AEJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=afG26BD5DJqcY9jFPHWwLoeF+nbY3GkVgbzmYISsj7xeZVCukUAa6Tdq4RdHOi1kv
	 VhO0c4wlgnq8/uJ4G1UyEHvTyxI9wOPKKaqgViGb19EFGyS0cg19B9qoWfDnJR0YZm
	 xD7VopeVKolG7iP9adxYqAQAtLV8auh9YJx/PsTDMa4HNn8peJiYCom6ppiEpBE6Ri
	 O5VPY2KO8x4IepP8GFuNG7upUnYOFwAgzIaIiRLTvysiIiBbNcvkYDfO9/wew8cRsb
	 l3JKPUr7GFFU/UKQZM1P948sh1G9gBvmTEg4KhGcT678i50OfZ6MBUBq9hVbqmsveD
	 3Nyo9BqNTTjfQ==
Date: Fri, 17 Jul 2026 13:02:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>,
	Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 6/8] dt-bindings: spi: dw-apb-ssi: add Axiado AX3005
 SPI variant
Message-ID: <6d69cfd0-5f3b-4324-8d64-b4695cbb3e92@sirena.org.uk>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-6-c429095143ec@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="70M3+S0UoM/WolbI"
Content-Disposition: inline
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-6-c429095143ec@axiado.com>
X-Cookie: Enjoy yourself while you're still old.
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


--70M3+S0UoM/WolbI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2026 at 08:51:13PM -0700, Swark Yang wrote:
> Add binding for Axiado AX3005 SPI controller. So far, no changes
> are known, so it can fall back to the snps,dwc-ssi-1.01a compatible.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

If there is no need for things to be part of a multi-subsystem series
(eg, dependencies) it's normally better to send each subsystem
separately.

--70M3+S0UoM/WolbI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaGdoACgkQJNaLcl1U
h9CYYgf/a6ZXfaJE/jmFwdCosDxknw75RDj7nPAqr8ZtQ6OEKCVRSIVBgwrMG1B6
7TPPAIzIrDPqOWeb/BZihDW7BKUj2aDsl7pZivADMe0txrRhev2UcBUZUMxW1sXn
DgyCTELlXBzkCAltV41zPIZTn6Rwcy8lHkkDXAfh0JGD5azOUiDxKAusCY9IhML1
YtCaED6Zm325NAZ+cUqXIKy177WK3d4XQrt4N/qPahtGnlsER6BwUocE9HGNpNLh
l3iTBw5h+slXmMR6H40Ax4/E64jiKe5RpDEW3MeDQgZLROX+xs5G+fp3eE5NGFPQ
Z9zQeNxaiqK3XtZlukPgm9tW3O9UDA==
=i8XU
-----END PGP SIGNATURE-----

--70M3+S0UoM/WolbI--

