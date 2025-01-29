Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9690C02190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 14:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRXaUYDpwPpub2ZkUhS7mQik3pW6CZUI57KwH1qopBc=; b=170kckLRgVbTfEBVmiuq4WkrR5
	JUjOj1jaS2QMtGvevMyDMe0aubqTlruZeK2HM9t6IocZsiqZ81yMeJfBXtrL+k+OGP/bEli/UVV/0
	bvpXUEP+Iy7KZlO9z8Kd1WF4rtb0mJ+wIuJKP2JMbz9Eg9t7DZLYiy9OpeLkPJsKh9P/0sgQAS0LH
	FcI5F2SM6eM3KlnU/Fd6F4SYQREJcOwEBVPpbIhGhGKFHXBflDfI0PA1TQoKmywezRcQqJeW3mX6d
	TZgz92tD1kEJE0Yy8iW6TRW/oZhXf+433MAh2lFDl3FS07kJJISUZd5xJ+iF7Z3WoXMCXcHkWgAD7
	0iXMNBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td9Ve-00000007Bqm-14ZV;
	Wed, 29 Jan 2025 14:57:42 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td9T8-00000007BXS-0OV4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 14:55:08 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaeec07b705so1318979366b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 06:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738162504; x=1738767304; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tRXaUYDpwPpub2ZkUhS7mQik3pW6CZUI57KwH1qopBc=;
        b=fJ3EOonvMg5aM3xTJ9ifQkyBWXE2QZfYKIxbEMYH9IvrL469mJWkMvosXWAugB0kss
         F+CApHza7odCsXc9/r5nXozUeZyPvLyTRns5AxLRkRxfTK3yyFmYQVMezlT3kjvqGgxB
         ToYEYo338JfgZ2DTCP1ZG+7Ab0t+xt6rHobF6S/QzXyl+mQ5ob6qaR5UAINbP77BkPm3
         qPJ7Mc30+w/Reigf1L2VkPbvHlwdtOBhBsynkM4S67qwKS9g9WHZgfiK5p3xmmiYpelK
         u63k4ftZwJc/3Pb3R+0JBCX4M+7241+v7lW5q9GX+3c8JYA/PNzCddRxvdcl/JooGxo3
         7fOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162504; x=1738767304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRXaUYDpwPpub2ZkUhS7mQik3pW6CZUI57KwH1qopBc=;
        b=LOigGsOWANnfazblBgGLG4LFx5/li9ygIABwEHGofUflXwz4pm4ZKJKXvBqbU2vbtx
         onbetqb6PEWhGUNU8fElGjiw/0Sz8wp3s+V4nkdEZBC8emZ1dPhGGexRNKzKnrDymFEM
         ktvoVpqPXR/KRBdxp4LC3k0S7Scw32F4OuszpmqI8vORxkORUKD8BYZQk4fBHinc6mlJ
         kukwIF8fBsDQsDhTWKJiD/TOw/jHEOzhrSOF9f3sEqDcHrf30XlTFdJoNaeoIKOicGH/
         i1f0bcE1jaMha7bO1NYCnD7ZCPyFmaISYF17pqJUH/9fSt2DqE8e2CftXa0lAgeNL19Q
         6e/A==
X-Forwarded-Encrypted: i=1; AJvYcCWnDWVIDO4xLU/i6kUOKfdhxIyLmH26D72SLcrJE/gBqpHZxBJ/c9A8zkUHfBH+xLo2G4X0AjWLunfia4diut2q@lists.infradead.org
X-Gm-Message-State: AOJu0YxdEFDkg/T6DGXIqPSu2DrzOviNxbTXPQfrxWFAAcNXx5fO2iPF
	WhHkf0OtKKwTpXdjSapPsrF9046uCfHLZIZw12pEmgJRCZq8cWwjM9T5zeEFV4c=
X-Gm-Gg: ASbGncsVy/OY6urz+fzucNhQTOOciHtmVrwD4jwixKIe/Dlb8dHPSjC3/d/48bv6gNP
	G7S1OlJsZK9qpWJuRFbK14gJj1JvfwL5GaRWsUgJIDrvbxsHMitcvd8pvOFA4S9918WNir6y0Hf
	7qoAGXuYCN4WN/yca+qP59CZYffKlP9l4HhyWv/llkNvWAH7OKHNtkllDWT+PLCGbGx9vdQCq7E
	1sc1OSbsQAUEl6Ww5dYuFMaiP6SH85tdRTmJMaDhrXYvVyi27V1yFhIKnyX9iGMkejbcpBIomlC
	xbsuJrAb/QwVi9eh5+Rk
X-Google-Smtp-Source: AGHT+IFer6WhX+yo5tVjXt4tHpAp4l/OJqlHH1muQaQvZOwPDcqkOcj3R7zSbWjFDVcbG92S8yScJw==
X-Received: by 2002:a17:907:3d8d:b0:ab2:c208:732d with SMTP id a640c23a62f3a-ab6cfdbc500mr364867966b.40.1738162504249;
        Wed, 29 Jan 2025 06:55:04 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab69c8dc921sm660475066b.10.2025.01.29.06.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:55:03 -0800 (PST)
Date: Wed, 29 Jan 2025 15:55:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
Message-ID: <v24wxcgyv4w4r5wa2i7ljbu365lfgp6yiqeoolpirbqkapl5wj@svzvaim77p6b>
References: <20250128172917.4565-2-u.kleine-koenig@baylibre.com>
 <fa163bab-1461-479d-b149-4e018935ac57@kernel.org>
 <kxdipj2oktcyivl7o7mtyyacqm437jm7dpjihi7e7hcrmll6xb@5dywwnt5wpz5>
 <7bef8677-b002-46bc-822a-16fc975d41b1@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o4mp4ofu7jn4scqc"
Content-Disposition: inline
In-Reply-To: <7bef8677-b002-46bc-822a-16fc975d41b1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_065506_395550_923D7958 
X-CRM114-Status: GOOD (  29.57  )
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


--o4mp4ofu7jn4scqc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RESEND PATCH] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
MIME-Version: 1.0

Hello,

On Wed, Jan 29, 2025 at 01:34:28PM +0100, Krzysztof Kozlowski wrote:
> On 29/01/2025 13:19, Uwe Kleine-K=F6nig wrote:
> > On Wed, Jan 29, 2025 at 10:27:22AM +0100, Krzysztof Kozlowski wrote:
> >> On 28/01/2025 18:29, Uwe Kleine-K=F6nig wrote:
> > I tried
> >=20
> > 	dt-validate -m -u Documentation/devicetree/bindings -p ~/work/kbuild/a=
rm/Documentation/devicetree/bindings/processed-schema.json ~/work/kbuild/ar=
m/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb
>=20
> That's unusual way of running the check, but of course might work.

This is what `make` does when running one of the dt check targets. I
didn't find a way to call this via make for just a single dtb.

> >>> +	soc {
> >>> +		fpga_axi: axi_h2f_lw_bridge@ff200000 {
> >>
> >> Follow DTS coding style. You just sent us something from downstream.
> >=20
> > Indeed this is from downstream. Looking at the matching dt-validate
> > output I guess just "axi@ff200000" would be appropriate?!
>=20
> bus@

ok.

> >>> +			compatible =3D "simple-bus";
> >>> +			reg =3D <0xff200000 0x00200000>;
> >>> +			#address-cells =3D <1>;
> >>> +			#size-cells =3D <1>;
> >>
> >> ranges would be after reg, but they are pointless here, no?
> >=20
> > I thought it's "compatible", "reg" at the start, "status" at the end and
> > the rest in-between in alphabetic order. What is the right ordering?
>=20
> DTS coding style could be clearer here. It exactly says what is the
> first, what is the second and what is the third.

I found Documentation/devicetree/bindings/dts-coding-style.rst now.

> >> Where is the child?
> >=20
> > I intend to add children using dt-overlays. I have a prototype here, but
> > that's still to embarrassing to show.
>=20
> The entire bus is in such case a bit confusing. If you have nothing
> connected here in the base board, does it really exist in FPGA bitstream?

I'm unsure. If I don't load an FPGA image, the machine boots fine but
IIRC accessing the address space results in an error. If I load an FPGA
image, its register space appears at that address. So technically it
might be ok to drop the node, but from a practical POV it's useful to
have it in the board.dtb to not have to create that note in each
overlay.

If that is good enough for you, I'll go with a comment in that node that
tells about the expectation that it will be filled using an overlay.

Best regards
Uwe

--o4mp4ofu7jn4scqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeaQUIACgkQj4D7WH0S
/k7ovAf/TsTzdxS7/CurCdb/NxP//rNr99mEWLIwsA6JTYw+gbBTIeeKYpj804bR
PYolN4JxpYDUEjFZIO16/Zc+4grByALz7isl/9DLEAT+4Q/V/tDzpjGavxpq3xU2
8ayyOt0HiM7ruJs8/j/W3hXOtU/Tn7UpzeCQS16I1Lf5DEriG7LcoGTopahyxVFO
namEEu/+WpISucQch9VlBDabTQzHHjtlgSXy99i0iedK+u8gaJ1NRXYdNXRU+WMP
drD38H2DYlz3SFq/t9hn7izqemo8pvXeATreDpVpuYsvEg1u9m1RLna+AtLKrpN7
CDUHakzxu3exWH/9WV70hnpb+RY48g==
=8/x0
-----END PGP SIGNATURE-----

--o4mp4ofu7jn4scqc--

