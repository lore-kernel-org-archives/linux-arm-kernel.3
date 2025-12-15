Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93784D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8orsyhAP5bzSwM/KHKWlgWDXWbCHovTI6KWadK9YNA=; b=NOpkuTdQq2yZC+0nccmFk/+6xA
	hobWZy3dTF9pBFKMU3+qzg9oB81JMDvj5G1Z26J3BRHArNBlT2Q3HTuBh77CLPwwW/2MuARGo8kN9
	+FNGQmbAP0xyURP/R3EvgrtpI4Dijtr9ANVhilcJ2rkryCSbotvm4AqK7wwemjJIyLih6ag6chuUI
	cDmfVkrPdtwadB6qRyG6toD3k66qdxDanYRbOXTwHkwLd6jolcm0i8KrA+VaBcMAFPNJ+ME5nniaJ
	Kk+R8i/CTKTO03Ojr2xPAdJfmBxRyq2R5uu9rghTY1uCLsbTqrME4tT6KHbRFs2ixwy+3pcH0SnmB
	FJCAI/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV962-00000003il3-1Xir;
	Mon, 15 Dec 2025 13:58:42 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV95w-00000003ijs-3LH0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:58:40 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8b23b6d9f11so382199885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 05:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765807115; x=1766411915; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z8orsyhAP5bzSwM/KHKWlgWDXWbCHovTI6KWadK9YNA=;
        b=aYDep7bZNa7+V1fWueISPvapYkXSathmgmeJGHgU7QDJAJ+pxRxBCErywOIHix26JD
         qY8B8fE5InRxPdLD1qvkolTR1NPvF38rr85i7QjCgeSKXdHX/eAd+vMWccBrAPQ3vTVH
         cbSeSyx0b0eYzkwrPyRnTNrBt2oIDR9DebWW6IlsdjRIxlLfQuLm5kNy9IHoQ0LyeHGV
         VlmT715Nn8dZAizFKQvVC3KdaVnLhWniRGjRFb4AjDZ2Hjx15wRjfEIUJ6L3J1vY3pbX
         2o/O9WFPiMtcLbkAdfLz0cHyEHk4yweSDkoaY2Nn9batB+WugP0kDeKuGNPDE9LkHEZH
         L/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765807115; x=1766411915;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8orsyhAP5bzSwM/KHKWlgWDXWbCHovTI6KWadK9YNA=;
        b=JQdVKcJlDFq6annQByXhXMAF/G8xS8Q5BqJh0s5TDVNIjiHohPORejfPOFaW7hgXCy
         TSy2ba0uEbPeFOgqH0fGIENQMiOizxfKsmJ+HD9/JNYWRKHNFPRb9qqXezghXVMASru/
         /pm5m9D2QfTHzeKrRJM/gQ5IG5Hr7/snXIVCH94gO6bU0kxxIYR/su43QDGQXFP3qUB6
         8MQWvobfrpGPOKQ+YgD0WVRkFpSTgLCJlfGb4GWaxlLspITtreFN0xghw+4ckC4wQzwI
         GkvTmQKIRJAO8Roe2lYVSfodUnRUdMnw4oygtWu1naRD6N1n6mweNcGArc06mB95MJWE
         myow==
X-Forwarded-Encrypted: i=1; AJvYcCVb5iOLe0ZJ+JYz9xoGQ2SdJSXWK9vZ08hyZtYh3LGoGUS5vf9BdODItaP8UaxHtLsxMD6go6WyIMw35AZ/iUq5@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ4zPaGDJGwb6effwgRRongmFK3lnaBtPovpbx/r/hJ17mjpdY
	8IEQhQdfiLA1bIgcF9HKU1W56D0Z5G/6pM4Uhe2Vqmwwj8pqh9BZ3+Y4KrWO2T3FqoU=
X-Gm-Gg: AY/fxX42rWtOwjKiR2a8MfQEePC68wK5xt3xWEhk26W2lLT05qew1l3BInAsZaic/Ix
	ffU9Lx9stZ0uwtpprjvY7Aehx3P1VWHHAlJnDoxNInVEyawMgFz8i4975/QeFOCFgJi2eBrYDnK
	jRtz3ZWkQ4VSqzJllRuSqfZ5AkbxkCNmAMIkVqgTn73IyNzI9Gp5izxVebfBu9YLuW3nqM/0TX+
	KYeUdB3KupZtY7NuHOUUxo/tXkFzo/YsAJdEnJx7drJkJmI9mmX16XgdIAsichtHub7h31pSCpd
	9/NFyDM6FALB2FsdAIS+e+iU6ubdvzMT0OhkJgY4PCjbco0LdkjO/ZpfIHoT70Ly1ej8xjmzItt
	UVVoqdibrGuLxD9x715NbdkxZcxIHuB4xIdZFrD1dkNwmsNKGlP0HdeUpHcX6qJ2IyN62nvadse
	DL0wDQ1qeLbld7MZYI
X-Google-Smtp-Source: AGHT+IHCJspCKUvkOG+Xo70rNhXmh6KZCM3b8s+rM1WOTs7Ip4vAkhAuAFKg19FdUxMEjoF51Dgt+Q==
X-Received: by 2002:a05:620a:178e:b0:8a6:e2b4:ba73 with SMTP id af79cd13be357-8bb3b334244mr1520231085a.51.1765807114979;
        Mon, 15 Dec 2025 05:58:34 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4d24bsm1131976285a.50.2025.12.15.05.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 05:58:33 -0800 (PST)
Message-ID: <04287d0b6207c98f24112b492b9ee52f0889da39.camel@ndufresne.ca>
Subject: Re: [PATCH RFC v2 2/3] decoder: Add V4L2 stateless H.264 decoder
 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Zhentao Guo <zhentao.guo@amlogic.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet	 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Date: Mon, 15 Dec 2025 08:58:31 -0500
In-Reply-To: <9ab31529-8146-4ca7-8389-04c69f7d1b49@amlogic.com>
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
	 <20251124-b4-s4-vdec-upstream-v2-2-bdbbce3f11a6@amlogic.com>
	 <9b74086ac938475328904960add2c284b81efd4a.camel@ndufresne.ca>
	 <12f26bf8-409b-4206-a39b-4bb2a14edec0@amlogic.com>
	 <f9c113914290a0701614c64b5e2167d4b3e21646.camel@ndufresne.ca>
	 <9ab31529-8146-4ca7-8389-04c69f7d1b49@amlogic.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qBzEoaReG3EWP7r7Fagz"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_055836_907499_3C08F437 
X-CRM114-Status: GOOD (  16.05  )
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


--=-qBzEoaReG3EWP7r7Fagz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 15 d=C3=A9cembre 2025 =C3=A0 10:15 +0800, Zhentao Guo a =C3=A9crit=
=C2=A0:
>=20
> =E5=9C=A8 2025/12/12 21:51, Nicolas Dufresne =E5=86=99=E9=81=93:
> > Hi,
> >=20
> > Le vendredi 12 d=C3=A9cembre 2025 =C3=A0 12:11 +0800, Zhentao Guo a =C3=
=A9crit=C2=A0:
> > > > strcpy() would be the preferred helper for this, no need to fill th=
e
> > > > leading
> > > > zero liek this, see include/linux/string.h
> > > Ok, it should be more suitable to use strcpy.
> > I have to correct myself, I meant to suggest strscpy(dst, src, size).
> > Passing
> > the size for safety seems important, and unlike strncpy() it takes care=
 of
> > the
> > leading zero.
> Yes, we use strscpy() for copying all the strings.

Indeed, I had miss-read, then you simply need to remove the code you added =
to
force the last byte to be 0, this is not needed with that function.

Nicolas

> >=20
> > Nicolas
>=20
> Thanks
>=20
> Zhentao

--=-qBzEoaReG3EWP7r7Fagz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUAUCAAKCRDZQZRRKWBy
9AuCAQC5OW8TUz9HUz9rqFtRU/k9dXVqrmNFo5ppn/oDw9vXZAD/XbR9uAxf5plF
ozw8abhWcc2hYmCZKWQME9F0PeJQfAM=
=Wm8u
-----END PGP SIGNATURE-----

--=-qBzEoaReG3EWP7r7Fagz--

