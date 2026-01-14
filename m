Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976EDD29FF0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 11:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McwtWZarGy/mqfWsR4TlM8acbCbH3jUkpH7EWjhWvVM=; b=hek99Xp0/XOJ34u2kP59fD+qbO
	VTpCj7u5ECtb9PhsvLAblhbbrF9Xz+yxC10UeF+Dk5bWbqtH+doRtGdysT47cpj0H+8AbYSl1PZJt
	K2fMCaOWSIMUAU9lfaW+RI/6Ikc20NAte1uztyxHvkYla22rB3gbYbc4GyBh56zhojPM1xT8UGEKi
	MF8vWSLAP+o5G0LaqrfaR3xs53k8gmeENSrdkMECBq7RZZO+xUlzfEaaeUw9Jz2ZffSoX0hCbBQPw
	Ukh8RHEkiA/3r0y11UEM2rRD/rRyKA8oxxpuYFIAwYOvePxISgSQUjDnTr0lebeVAiL2y9GmIEAmx
	hnqOC/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyvi-00000008w8r-2cRY;
	Wed, 14 Jan 2026 11:20:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyvh-00000008w8L-0In3;
	Wed, 14 Jan 2026 11:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=McwtWZarGy/mqfWsR4TlM8acbCbH3jUkpH7EWjhWvVM=; b=gZ6PmiwHIfB854+dG9vt73Im7t
	2kdtPYgmfkRV2BphL1R29H5oW0Gj/FJrlCQsObnNQLjSVJBnteCQdetqEs3ffrz+Bfx/eKYTpB6ud
	J016zR8KZ1Al4rd7+1/KZ8EdcgYg/lQfXmu6EafpD8gLtxY8QH/37ukyefnG9w3Tmdurq+dQMlqS4
	Cg3T091d1D9Xi41DGlTwVdNWkFSR7UCE4ESmtUAeo+LW24fhYig4Mrl7iQIS51xrN5lJO0IBluIbX
	saiPmjqcVMldWjfko5VolZ6jCG21BqiGxg1nlefdzzbCdRMduWrBwJ3b+bSQ4K2JtNDlUndOdNOTd
	EjAgAMLw==;
Received: from layka.disroot.org ([178.21.23.139])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyvd-000000066ow-1N4v;
	Wed, 14 Jan 2026 11:20:47 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9FCD525F65;
	Wed, 14 Jan 2026 07:00:03 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMC-TBv38890; Wed, 14 Jan 2026 07:00:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1768370402; bh=McwtWZarGy/mqfWsR4TlM8acbCbH3jUkpH7EWjhWvVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Lg7DywJZhDrdYLigBJpXvVi+gvXfb1x0GbLK8LVmtJSXSuAGZIdWUs9MR6HMf4ubX
	 5hkran3Z6nplnFonZjtC+A87JXkLh0Fg3eiyY9qBOuA7NBwHovXBmvVcpR8q6CcAU7
	 WjQBWxPlVNT8sy3WM+1iMbQaE3xHLMynnYHrLjC5MqmevEwCpl+NQFWvjh7XczrnOz
	 BFTHteGavPoJiVPTbZ2nVRevuSq+BA/U3IydVFb91n66OvE+t5rKLqyG7JPdYfufYI
	 dEmUjuZa1NQ+H4zisfuPuG3sYZ+FUuWJuI68NnE4Uor4yX+ZyzDZl4KirHhVDjrEjQ
	 n1T64K/DHjQfg==
From: Danct12 <danct12@disroot.org>
To: guptarud@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martijn Braam <martijn@brixit.nl>,
 Kamil =?UTF-8?B?VHJ6Y2nFhHNraQ==?= <ayufan@ayufan.eu>,
 Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Add modem to the Pinephone Pro
Date: Wed, 14 Jan 2026 05:57:03 +0000
Message-ID: <6468173.31r3eYUQgx@melttower>
In-Reply-To: <bcee4f0b-6159-46c9-81ba-ec2970994613@kernel.org>
References: <20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com>
 <20260112-ppp_connectivity-v1-1-284d6e83b212@gmail.com>
 <bcee4f0b-6159-46c9-81ba-ec2970994613@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6104322.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_112045_444696_02434B54 
X-CRM114-Status: GOOD (  11.61  )
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

--nextPart6104322.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Danct12 <danct12@disroot.org>
Date: Wed, 14 Jan 2026 05:57:03 +0000
Message-ID: <6468173.31r3eYUQgx@melttower>
In-Reply-To: <bcee4f0b-6159-46c9-81ba-ec2970994613@kernel.org>
MIME-Version: 1.0

Hi Krzysztof and Rudraksha,

On Tuesday, January 13, 2026 7:22:33=E2=80=AFAM Coordinated Universal Time =
Krzysztof=20
Kozlowski wrote:
> On 13/01/2026 07:42, Rudraksha Gupta via B4 Relay wrote:
> > From: Rudraksha Gupta <guptarud@gmail.com>
> >=20
> > This adds the Quectel EG25-G modem to the Pinephone Pro.
> >=20
> > Co-developed-by: Martijn Braam <martijn@brixit.nl>
> > Signed-off-by: Martijn Braam <martijn@brixit.nl>
> > Co-developed-by: Kamil Trzci=C5=84ski <ayufan@ayufan.eu>
> > Signed-off-by: Kamil Trzci=C5=84ski <ayufan@ayufan.eu>
> > Co-developed-by: Ondrej Jirman <megi@xff.cz>
> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > Co-developed-by: Danct12 <danct12@disroot.org>
> > Signed-off-by: Danct12 <danct12@disroot.org>
=46or clarification, I did not add my Signed-off-by.

I'm pretty sure the original patch came from [1] which was a distribution-
specific patch applied on top of [2] Linux fork, which does not have a Sign=
ed-
off tag.

Please remove my (nick)name, Signed-off-by and Co-developed-by from this pa=
tch.

>=20
> You need full names.
>=20
> Are you sure so many people actually were co-developing this?
>=20
> Best regards,
> Krzysztof

[1]: https://github.com/dreemurrs-embedded/danctnix-packages/blob/main/pine=
64/
linux-megi/dts-pinephone-pro-remove-modem-node.patch
[2]: https://codeberg.org/megi/linux

Best regards,
Dang
--nextPart6104322.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE8JqTPA/gMx5VjKThZsq36qRd14EFAmlnMC8ACgkQZsq36qRd
14GLtRAAraxXEz2JwF+2pZPPGY143ElMBaBuVO0UmPiP2C1cgLHQpW9OvoXnT082
XGSl3jpjKBZH60MiWAHq3mp26nKLuByjCRklsIdG/eHxThcGYVbwi0xJS0BIus0I
kpmR8X7lkdLYL4lndob6xE6xAdFmgqypI3DjpedjGQO/en+eoGqN7+lGODGa+iUU
VJDs3OZDj7UMThD6+GepJgw+FS9SGwnsgeJRZou1HNaupaoQ/Bsrc1OA9S3SKlpD
fDIrKchmHglpXhoC88bHf2VPO8Z0leT//+A0sDCTqeboDodlplrNLya+iIxGVBDF
C2qJVGnee0oD6NJXtU7nhT9g0i16A86Ea+H6vT8VzNBFvA2RBZRRrXmCgH2SzqRr
4/ycWKfhjLgALVty/q9wOE1lk5pejnX616zWikS1UKWi+nxyE0iq8SKnGi7CBHvz
Jn3n+BWyEiVPp/EFbdRbmLcDcmOYdfD3FLaiaaUz+F9uBV6D5ug8JAL/sn7bor/0
0LAQJ35PRi4MRYIyRq1XH2r56MYJEKcda0HQVVnsFoknnR5RCX2hr9t4j4K2ufnz
DxA6bpgIhCN58BkA2NOsEL9JvxKCs6DFDVQj5MSW8feG3pdkO+ICaqvvrFtIfiP9
Niu4Mr5U495aCGIDCEIrI4V+mBuKGZsduMyD19lzUA4/RhhHshI=
=AxqS
-----END PGP SIGNATURE-----

--nextPart6104322.LvFx2qVVIh--




