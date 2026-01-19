Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F05FD29C4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8hUAQGe9WzHFrGctjM3f8nV/a56tXHP2sNdbESX5lk=; b=OZMC3iGWEPMxG9xDUy0RJifThK
	p+vSfstjDl5oKpxEB99qVj10dy5lnf+mmXWaFIdzuHGGalW/rnlQbXMsHQxLM8QOm42d85KRJKwud
	gaYecr3XfQnVaqSNe2JAGe7bnjWRWFMeZ5hyUQ35nz4FWQmo8XrXJZnRhT6S+4uEoM2priaHl0bSB
	Tu9AmyJ+j7jKf5qaLeUJyH8FyaEtDKfRFGxqbMlbHaS5qrbMkRwxhJ09vqfB1R3jTmoQOe4f5iuYi
	nNQdc+rR/6OBafHpH0egoqeT3U5XNUK2n79Z5wgYxaaH15EbB08P7Q/WXZnVRm0nEut12nd6mQ9v3
	iGfMTKaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vht70-00000002eT4-2VnY;
	Mon, 19 Jan 2026 17:32:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vht6x-00000002eSr-2Nmx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:32:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D7D560054;
	Mon, 19 Jan 2026 17:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A54C116C6;
	Mon, 19 Jan 2026 17:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768843938;
	bh=A/iKdKMRrQFaSFIv/yti57gG3uCmwDCA4fPwEwIAd2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1vWA/ThbDmFYpj53E77IY+FYA+F0yn5aBqz5KyYfgnJelVf181ZB4hOccmOIFuUS
	 0N/LfNhrBCyEeN49ROHXJ0Cxq/HFTVkk/UQE2sAC+DvHh79frOoyqnklHQnaZsWodZ
	 kf8GGoyccKhVGXxpMbn3AadPkYd61ra5NXXMvRMxG3bLP/Ghn1FKClRuQrUisqK//6
	 OuYcHNz2ZKoQXFTFZI6HIa6w+7dDZF0mljbLzVtaEQly+gXbBNIsF/1H+N31mk7u6y
	 nuSKbm9K4xWHHGACuiqGCWpWNAgz/K0f734F6RkynRZVZz2DVhxROlC7LXAKLeW5Zf
	 1aTcUGxCkpMLg==
Date: Mon, 19 Jan 2026 17:32:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
Message-ID: <b1b79de0-a078-486d-b3e9-96899354407c@sirena.org.uk>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
 <20260119-spi-xilinx-v3-3-4566c33bac0d@nexthop.ai>
 <8436e914-429f-40b9-8e6f-ec3b02702cad@sirena.org.uk>
 <69F83558-4675-4FC2-8656-BC6E3481AD65@nexthop.ai>
 <9e559e33-4f2f-40d4-a15f-584548bd6057@sirena.org.uk>
 <05D2CC15-DD6B-40F0-BFF0-3264D4FF96ED@nexthop.ai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FuAS2eueGrIYKRNf"
Content-Disposition: inline
In-Reply-To: <05D2CC15-DD6B-40F0-BFF0-3264D4FF96ED@nexthop.ai>
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


--FuAS2eueGrIYKRNf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 09:15:40AM -0800, Abdurrahman Hussain wrote:
> > On Jan 19, 2026, at 8:50=E2=80=AFAM, Mark Brown <broonie@kernel.org> wr=
ote:
> > On Mon, Jan 19, 2026 at 08:47:17AM -0800, Abdurrahman Hussain wrote:

> >>> Are these bindings appropraite for ACPI systems?

> >> Yes, the Xilinx IP blocks are memory mapped and work exactly the same =
on ACPI as they do on DT.

> > That does not answer the question at all.  Is it appropriate to
> > configure an ACPI system in this way?

> I am not sure I understood your question. What do you mean by =E2=80=9Cap=
propriate=E2=80=9D?
> This is following the same guidelines as outlined in=20
> https://www.kernel.org/doc/html/v6.7/firmware-guide/acpi/enumeration.html

You are just bindly making the DT properties available as _DSD
properties on ACPI systems, ACPI is a completely different firmware
interface with it's own idioms.  Does this interface make any sense on
ACPI?

--FuAS2eueGrIYKRNf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluapwACgkQJNaLcl1U
h9CZjQf/Ur8a5p0+EIw+7xw/rnSoaY0p0ub/FutvHYMSJWOUbUQQAOMQWR9gjK4A
dXzC6bUPBn8sJ7rv1lPArhLiRIV3LJTZc8zZqnkA3ilaU+6YHbFWTaZKRiJYhAXc
5GhvbBr8CSVm4eUIzAHvleXcvTYo5jV99EF6z0rlq59yCz3WsB6FaEPOlsVkE3jB
PnrCpdS44my7aEAJ+Z0LFefUsrSP/LSeWEYmT/rMs/QP3rifhX3tTPuggRKI8ym+
oGqMAq4OqN7hikNnxiUEA5KU8S2s/ejBjE9qJzmgc1ZsFhctwadnLv0w5rIShhfv
JPTUWw49fOmWds3OJkAfdnuqAyHx8Q==
=hAAM
-----END PGP SIGNATURE-----

--FuAS2eueGrIYKRNf--

