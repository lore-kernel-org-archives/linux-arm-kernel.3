Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D503C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fbV+eT9jOuG2Qn7UfINqLkpoy41J2mIUSyeK6YfW10=; b=STVWomKxgqoZOQIQzA5ww5sBYl
	N0haAu9VTZ936A1gdxwb9Zk2nUZQLweE3ZAf2masCVIx5XEyKxZF69qXoWX78Mgjf3ZFml+oiFSxx
	kIDsErot4taI2duKM7XzrTr3eKXb27Nj7vwlYxrMF2LaDCg0TxOmcVIb84fWOBr6BWo+wWh3Y4h4U
	v8wSm0sUvIQ/zWBY5N7XMEE7KBa7AqPqGAam6yluVDY0lmFVSnVFnUot+efR+IRAQTJpRxTpZ9ACS
	ZSrZN3R1WtQ/7qE22ojx+jd6g4Cpq1P3lOpRpzWFWGJxOKo1Z1q7WrkmL+5sdNqbe0qdV1+5T20ty
	3Hb/OR+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4kEr-0000000FEz2-0c9k;
	Thu, 10 Sep 2026 19:15:13 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4kEo-0000000FExx-1JVc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 19:15:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4858303de5dso93135f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 12:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789067708; x=1789672508; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fbV+eT9jOuG2Qn7UfINqLkpoy41J2mIUSyeK6YfW10=;
        b=gt+IZVfpKo/XCw8emf97Pa1r48yncnBFwTEN/K8qjctT7cjebkzDVO7p/j2HCOag/D
         wxI3QwoZKIMi3aKAAzBZr2bUWcQBdxRrRUDqIKaCx7UMi4uhXK1X5t3pjpkAdt8ly0Wo
         LBJJQwDFT1aqVRPrG8JppRuxijYvJVYeHwk9yt93n21+8GfXfa7SIcNNqHthWyxRXdAQ
         aagzkz25qzy/p+7osLtizHqHzc5HJF8rr2bGMnZxUjI3rq3ZLeK3n9U61zbeY2w22eSC
         +1U2wkw0wCZcTR+CuvYMmMhVxOSLkwLshHXQSS+bidk4rod/zhBRRr5KL+ufR5ZirxKk
         xPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789067708; x=1789672508;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4fbV+eT9jOuG2Qn7UfINqLkpoy41J2mIUSyeK6YfW10=;
        b=CmeRTixkwJ2phDU26DGjtZVeK6eOCPq7usRHxG6HqRWEOERDiBy8sNonQDfphaXxNg
         TmPV/0lJTwt3dmRJwWbofO7pQqXmCSQFjvEsesMCV2GXYlzPX0JAqJBCE7MVh3UGcVoo
         T77QerLLLn2FT+J8brZ58qi96nseibGcLokJ3ErOn8YJfCjCPvriMQlNDgGNLe6PV83Y
         8haTAP5sy1F7hriRhLg9K/k4mvDcigh4Zi9KUaWctyv8PQMyHaTfD0UHyWj6+WzdARQU
         UYELyqFRapJ9z8dayZS/CtL0dFdCsoDs4ZatxvlBBaPeVHm6R/h3FJ9AGe4bYIs6fzOB
         vsmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwA8A07qJR/FoonP3PQCdutjR5NfMURJciV1uX0nDdGMfpslCpnVf8VQ2Ml04foPVAwqoWTCclFhwWRurSkLFaZ@lists.infradead.org
X-Gm-Message-State: AFuF++kvIkRocX9xEz7MZgM/1XNV2P4rKduZWgpNnIXy2WgVqvKIHSXB
	CH0AABf6UsU9VCnooLgWXsliyUPV37aasXcaWrikxHFkO54ulO67p+A/
X-Gm-Gg: AYBFou2TFOgh8L7oD5haIEDT/KozUTRc1NKwAZm5O4NG1vw0/7iIuB/V/qFeds+SPcY
	r6/RUdZ42wmiK6hV0gZGIXCJWSB6INmX4VEo2VTXAGDGCedRG3z84gNQ9dv/6MP8LqzduAO2VFN
	xUK4p0uh1AzHWB69ABODF/ZLMzEk6XkLjt2KYrq6SjPt/kWOcCC0Kj36nt+HnJjf8LLiuPmdkm4
	dq/laOKLI8dYcjo7xqeSmcUNQ5zxT0kqYaktAsO7EpiMt+Kd44tvJRDMgo6gcWLzkb8SFpMzEqR
	mfja3z+HTgKEtTLK1kLy/ZjMaYClz2iIZwzuDXAHmOr5ykZX4UdMlcBQVhIssS9E0wM0q86rwk/
	n8PdC3DPYTWrG9yWE7GzFa49hsbxilTUDI9JDC59xEyZp+f+5/Tvy2WTZCZLDocSwLBSgkSvWlr
	KBQXKJmZL+OmshhcqZC5YrO0QMS2jKdcMxo7tSUU8f2CNRF6ksmJW1yomEd+A7ecC7BGMxpGMVx
	K9s3KTnOg==
X-Received: by 2002:a05:600c:a07:b0:49c:fc6c:be0d with SMTP id 5b1f17b1804b1-49e619bd19cmr5097405e9.19.1789067707645;
        Thu, 10 Sep 2026 12:15:07 -0700 (PDT)
Received: from strix.localnet ([197.250.227.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a33d72sm4385485e9.2.2026.09.10.12.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:15:06 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Subject: Re: [PATCH v11 05/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 10 Sep 2026 22:14:54 +0300
Message-ID: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
In-Reply-To: <20260910161711.GK1051768@google.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-5-f8ad59c6426c@gmail.com>
 <20260910161711.GK1051768@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartKW3nFVAkQr2M_09ZHSiKcQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_121510_371900_1AB578C9 
X-CRM114-Status: GOOD (  29.24  )
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

--nextPartKW3nFVAkQr2M_09ZHSiKcQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Date: Thu, 10 Sep 2026 22:14:54 +0300
Message-ID: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
In-Reply-To: <20260910161711.GK1051768@google.com>
MIME-Version: 1.0

Hi Lee,

Thanks again for your review!

Am Donnerstag, 10. September 2026, 19:17:11 Ostafrikanische Zeit schrieb Le=
e=20
Jones:
> On Wed, 26 Aug 2026, Stefan D=C3=B6singer wrote:

> If you use of_platform_populate() there is no issue with this living in
> soc/.
>=20
> You cannot use the MFD API outside of drivers/mfd though.

I'll keep it in drivers/mfd. of_platform_populate would force me to expose =
the=20
inner split of the CRM devices in the DT, which Conor and Krzysztof advised=
=20
against.

> > + * Copyright (C) 2026 Stefan D=C3=B6singer
>=20
> Are you sure ZTE are okay with you Copywriting a driver for their IP?

This is my free time work reverse engineering work, not something I did in=
=20
coordination with ZTE or payment from them. I only took information about t=
he=20
hardware from their GPL dumps and not code. In my understanding the copyrig=
ht=20
of this code should be mine, and putting (c) ZTE would even be misleading.

ZTE provided U-Boot sources on request. Their kernel sources were already=20
public before. Sadly they provided no material on their LTE components.

I didn't explicitly ask them for permission to upstream self-written driver=
s=20
for their platform because I don't think I need it and I'd just expect a=20
request like this to languish in their legal department.

The kernel once had support for a related zx296702 and zx296718 support tha=
t=20
was removed in 89d4f98ae90d ("ARM: remove zte zx platform"). This code was=
=20
written by Linaro and I believe commissioned by ZTE, so I don't think they =
are=20
upset about me doing their work for free. At some point I'll resurrect some=
 of=20
the drivers from back then, which will then of course carry the appropriate=
=20
Linaro and ZTE copyright notices.

> > +enum zx_device_type {
> > +	TYPE_INVALID =3D 0,
> > +	TYPE_TOPCRM,
> > +	TYPE_MATRIXCRM,
> > +	TYPE_LSPCRM,
> > +};
>=20
> What do each of these mean?
>=20
> Is the nomenclature taken from the datasheet?
>=20
> If not, can we improve it to make them easier to read for humans?
>=20
> Failing that, more comments would be helpful.
>=20
> > +
> > +static const struct mfd_cell zx297520v3_topcrm_cells[] =3D {
> > +	MFD_CELL_NAME("zx297520v3-topclk"),
> > +	MFD_CELL_NAME("zx297520v3-topreset"),
>=20
> Why are these works concatenated together like this?
>=20
> Same with zx_device_type above?

I don't have datasheets. The names are from ZTE's mmio defines, which I exp=
ect=20
to match whatever is in the datasheet.

zx297520v3 is the name ZTE gave that SoC (printed on the chip, in their ker=
nel=20
sources and boot messages). Yeah I wish it were less of a random string of=
=20
letters and numbers. I believe it should be in the MFD cell name as a kind =
of=20
namespacing. In the (unlikely) event hat support for a different ZX SoC is=
=20
added some day it will bring similarly named "top"/"matrix"/"lsp" controlle=
rs

topcrm / matrixcrm / lspcrm are the names ZTE gave the 3 clock/reset/misc=20
controllers. The DT binding docs in patches 1-3 elaborate on the respective=
=20
roles of these controllers (although that understanding is based on reverse=
=20
engineering, so it might be wrong)

=46inally, "clk", "reset" are the names I gave the child nodes.

Rather than write zx297520v3-topcrm-clk, zx297520v3-matrixcrm-reset I cut o=
ut=20
the "crm-" part.

Can you think of better names? Are you OK with the names if I add the above=
=20
explanation as a comment - a little bit shortened, and making sure I don't=
=20
repeat information that's in the bindings more than necessary?

Cheers,
Stefan

--nextPartKW3nFVAkQr2M_09ZHSiKcQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmqjAa4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi1l4P/j2RW0zmocuD81Wb5sZv
znns4ujhGapOszlboqNQmeHKggVJawfrXfzWDfrJjPPoh/CtxKqMnktV0jNxud+F
2epOFBD7UpM75AM6FVhx++ol5zDBVsuGFUjJMTmJ8m9jji4bNEuZcD2mTtlAt9Hr
E19NYXZLQ1QsWdUi05+JaAx40GfP3swda/sENz78aOm4KNkcbbnE9OGaG4JaTbb5
xfNh3OZ5AlBeIKlfsZFdtJSKsb/iBpEIc24hMHVaWm+h+KjbFKpP4034lGwshYzT
tB1BoP+jJ+ebVTKzKTpT3xiuW+cLQDegDAyKhzYZulk4ILuzIq7JomMVn4P8UzHR
3YNTu8DdCEZbAqDDMNlWWTkpYRPTSvYtSbivB6DeCM6oO46o7WvlnFqcjWRqN4/z
j0s062KBfAkiodcaVaeLCjmg6aPqYKf0/yjhDTsjZRiDSn6nIs58JPh8PNhfgNhw
4XHOVKRhzTYxOrOJxP33xgwbQf9IeJQT6n3UFqw62ieLCpR5uFd31vIHHS+bH2kd
dAv3ER5fhNZcladCb4H4Nbx4TwiQ+ry3+KIPEJWre3zFNW0F79AGo1yz21/Buy6h
NBjFRtosY8KazSjZqVHFdCn9N6N0X+1x3R79gJgTRSXrCbk/icBx9pACGfOb0pET
wvukjxM7IWssDtOA0cwG+zAr
=PTj7
-----END PGP SIGNATURE-----

--nextPartKW3nFVAkQr2M_09ZHSiKcQ--




