Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8094CD29C5A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 18:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zvLu/l2gPZv/fOEvzqCDdJNqA6ygc0q6Qx7osq7M50=; b=nBZ7ce4iVRgA4SFMpCVoY5T9Oi
	2PNI3jOUtjvchbbC0y9yb5zAP+dgcilw8CuyG+7Mh0JgAPlBhULkyACbImCNHV5P+0kiPpI0Dzx9S
	4GPQZ5kJF1IWG5pZn7K6GZjOykkDx1M8P+6luqtU2jVVH5R1/fqEHNImgduwayDIIBy3KCxhtPaYR
	WpKqpwSedHmZk+i9iUCLiBjtskprwQYltnIgZTZmDsqr5n/nWyvZMxrmRvnrAeyC+Tg0e0Hnc5ikZ
	VqrIyBtqK00UkKtaSTDa9UHbpeCHXcVgC0w0+ydKR4m6qf0Bfc8KO+3KSyopNUxNa+4+0G65jcx5c
	53qE5eLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhu9P-00000002ivy-1lRx;
	Mon, 19 Jan 2026 18:38:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhu9O-00000002ivp-0LwE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 18:38:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2443E60054;
	Mon, 19 Jan 2026 18:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A820EC116C6;
	Mon, 19 Jan 2026 18:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768847932;
	bh=TJG3FfXkTRkE2CcE9n4ac0NG1if2XpQ6DPf2Wc7Uvr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XIoG2b55slYzmKtI+uPZ2lT+jERhCK32XMEJgtiinrAmgw6BlUSFeb7c+7YIdQjJt
	 EcNuYC4i0e0zi9SlcdEtvMI0/deLdMmoso1ECjFoiYz9BCoebA8DiCccITzEDcxmZd
	 D/y6fGcDPoOlktHzYud6yqmcsONYGCwNLQ6KRP5DNIxUketUslPPul/D3y0TrnoJ3H
	 29qeG9TZslgAVMzV2MDNUMBLKTaOPVovAeKVGIVoafN2d9zaCt4lwONQCyapsOetz7
	 A7bOQY2nsSO593ZPk+moHk0M+YM1I5Uvowrln+PE3pgp/sEJ7LzMd6JS945OJ245Ni
	 FHdC7SI4r5Xlg==
Date: Mon, 19 Jan 2026 18:38:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
Message-ID: <b9ad8ab8-7985-4c89-a82b-c7f31d32c167@sirena.org.uk>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
 <20260119-spi-xilinx-v3-3-4566c33bac0d@nexthop.ai>
 <8436e914-429f-40b9-8e6f-ec3b02702cad@sirena.org.uk>
 <69F83558-4675-4FC2-8656-BC6E3481AD65@nexthop.ai>
 <9e559e33-4f2f-40d4-a15f-584548bd6057@sirena.org.uk>
 <05D2CC15-DD6B-40F0-BFF0-3264D4FF96ED@nexthop.ai>
 <b1b79de0-a078-486d-b3e9-96899354407c@sirena.org.uk>
 <3D1B59A7-6E57-4C8C-AA95-EA7AA115264F@nexthop.ai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yr3Zwye/gBaAHNhT"
Content-Disposition: inline
In-Reply-To: <3D1B59A7-6E57-4C8C-AA95-EA7AA115264F@nexthop.ai>
X-Cookie: Does not include installation.
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


--yr3Zwye/gBaAHNhT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 09:47:11AM -0800, Abdurrahman Hussain wrote:
> > On Jan 19, 2026, at 9:32=E2=80=AFAM, Mark Brown <broonie@kernel.org> wr=
ote:

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> > You are just bindly making the DT properties available as _DSD
> > properties on ACPI systems, ACPI is a completely different firmware
> > interface with it's own idioms.  Does this interface make any sense on
> > ACPI?

> From the above link:

> "The special DT namespace link device ID, PRP0001, provides a means to
> use the existing DT-compatible device identification in ACPI=E2=80=A6"

=2E..

> Is this not appropriate?

This was specifically targetted at some embedded x86 systems where there
was a goal to reuse device tree bindings for things that just can't be
expressed well in ACPI.  _DSD is generally considered tasteless for more
server style systems, AIUI the general approach preferred by ACPI
forward OSs is to use some combination of DMI quirking and registering
with a per-device ID (like the per generation fake PCI IDs that Intel
uses for all IPs on their SoCs).  Just blindly accepting _DSD can end up
with something that's not used because it's not what the ecosystem
wants.

--yr3Zwye/gBaAHNhT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluejcACgkQJNaLcl1U
h9D9WQf/ejnLfZnKfjoUOCRr/OyYxlYQYG5/C3z0oW96iVMkZ+jfUoRQQU/a71PA
2gjGAH06p0iahNbsNf7b8Fn8YUbs0MJQyW5mUbW/IvEUupw0PCTCaAn6+9tOoxxr
iU6/mcgBeIiBLLnoxtEswwp2oV4pWyB8MDmgcKMCH9XOuaY+nlRNubw1vbl/Jp3F
ZNFvouH7n0jPA6bGGCTzNdIYPbT8+sBO9SOouZ/Nc/i98SaMpn4PWN1Y0YHWQxeD
ti4uBjNPykGDfxV2g1Hm+e4cSuxnoxgmPrBidLkPpPJGbhGpHdybpHmi+tI/cTDI
9b6E6xiSjFbyTNzrn9LFxgTZObk8hw==
=8AUl
-----END PGP SIGNATURE-----

--yr3Zwye/gBaAHNhT--

