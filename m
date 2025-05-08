Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484B0C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Db9LjxuIeRocAHB3p/zvlDGjKId3tP1sAigufhRVP8o=; b=Ku7+ycuK7wPMn8SCMo1xG1FC6Q
	FZ1Ai8lImevgSEIzLYI0t81rLcvdmM0yQ2V61cIlsB0FAAjdnbJ9Lu7Av/fdxOyFsa4GLf5WRK4Bo
	//2PWHIYFmY4/nyTK3ZIdYquyinDovg0N+1IjXVMiJxft5q9M1hBJVrUV8jv3tv5ywq9vVURQYY1H
	uC6Elxv2p4CP1wuPYELQxhHoNMi3pmLGyRhQdo+UYP19Cz5sCHGkpEl6P1eIFCMdvAqE3mJt2z/8t
	rXi+HyYsE+AYjLTVa0UwIPMDjdXNm7CdmWw97EJwtTbITIn7O+jGjV705eoHMFfbUiCDvJg1PaChK
	6A4OPq2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwCF-000000003Vt-31Y2;
	Thu, 08 May 2025 08:01:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwAI-000000003Rz-0iKK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 07:59:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf680d351so10182145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746691173; x=1747295973; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Db9LjxuIeRocAHB3p/zvlDGjKId3tP1sAigufhRVP8o=;
        b=Ckdd6K3kE/RdGEQdwnjd5MkFUVThd7zCxtrDL/nMFxVYtkwYFWDxEyTBQx9GsvZ8WM
         8JBtAt4CL4TNT5b4jZBkOOOOpsxbY9CoW9D0yxNl7WR1UiCW+G7gfixN1ToLX52NQ1Ss
         ltZq/xl5B1G5f4iEyoqEVRFcLb6KvgYdGx/kLwZX7tbTJy1wHt19WSCQ5QKQ4nmCYRvX
         tP5M6vM1NHqXqBbIWo9gNaiz7l8DCE/z7Sq2JHyaRmfqUrkv7JCIPtwGHIaDd+6K4ufM
         Fh+v4cew8xRcEG/QHi25eZYEOP3oEE5XLJ0ahWI5+hbO+D9nblIDdu0iP9TOxlK9y4W9
         rutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746691173; x=1747295973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Db9LjxuIeRocAHB3p/zvlDGjKId3tP1sAigufhRVP8o=;
        b=oqLcNMKmDR7E0kfhRmsKTiH3ubPtLqmb7KhlDTLRjKl9zLwEcgWaTClvjjnYaiUxad
         NOazzB18z05c5G2+viOCTVEpe9G8M5D43RdDmSg2nKqjf2j/I99k5YYKh9z97h+zts09
         BKABSv/n8wUIsza4bpsr11/MbQxlNGRvBR9BDNUOzBZbZgs746HcNwqKoU/PRJUAYCe7
         MUH9L+eDOLGxh3cwU8xvqsuxQqSVXpCZPgep02pS6mA1fNLpJcSwERHAGybFEuSBct/z
         IV0UeOnZSSmcuhaSrjla9EnvptiiLyD8tXK1jrN7NIBHaL4+3T31m08L4cvR8iBDSaMu
         rT8g==
X-Forwarded-Encrypted: i=1; AJvYcCV6HDRLh5+ng2/WTaTBgt719iwrhRlRTujoYPdMmQMSGNWqbQp6dTcWzaPVRwUJCMplfPk7K4WpTmpmDOcrnkUv@lists.infradead.org
X-Gm-Message-State: AOJu0YwwjYvDMea9MDs6dKYmvio65nGHKLM4gEkl6ekEB5dO8AuA2w+z
	bSl0Z/ErTK473HXiJ84z/59Y5U9p+O2F3v+RCnGqp34ozdEXDBzeA8TlIw==
X-Gm-Gg: ASbGncvYBUnaOkUuiseYe8O/VchfH8XJpBXuyU4cDmF9mgBM0BZvb1LY+FQVrjWxaqs
	g9zDa0Bo1u9bJ9zZKLrlBwCtCUsdH56WH3mnZ95vyMC6HTT4brYETmGodr0+VZKaaF+2iO56stU
	m5/Ku15d1HPklpf23tub8dWR7PWGMh6ekaB9WaJaLZdKktJvc2sBCIBJYDdPlQ1etjmj7//VVxM
	a1DdWkh2cMF5XyLcTIW6VNRCNcTiFSNofvXLXuLbP6YTjxS3dGNfR2xPE0x+2T8JqAcrOWXmlQO
	HsjoH5pssQA/e272ntW2NohRkQjZUhynVMkN92E8vapOIEnbLCxQ/wW4bMn7AHXpY2oUTE6odrb
	XU2TN8WVRV26v4sbRdNpf12OCMGk=
X-Google-Smtp-Source: AGHT+IE8XCD7/PYMkt2ylx1/nOIpd4VBRT9tXMV4j1Un5IAz2BmunL2G1GCGow/bv5ib6VsDnRBqPA==
X-Received: by 2002:a05:600c:3150:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-442d02ef128mr19224135e9.12.1746691172350;
        Thu, 08 May 2025 00:59:32 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7b83sm26997065e9.33.2025.05.08.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:59:31 -0700 (PDT)
Date: Thu, 8 May 2025 09:59:29 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
Message-ID: <kut7odtjumfmqia7to75yda4qwtsyhwmm3xejkwtfm7yxyap5t@icfpljkitpwp>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-5-thierry.reding@gmail.com>
 <8a26a37a-26ce-41ef-96e4-10ee09ebe704@kernel.org>
 <12d0eac8-545a-4595-a1df-1dc52728ef54@kernel.org>
 <rz64mnhdb5vu42tcerlobmulkyxvpqgeeer43t57thwzxnrcou@6xcpuiiru66b>
 <0501c0b2-df78-4c93-9ca1-7f32767b0225@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ed4stfeyr2kqil54"
Content-Disposition: inline
In-Reply-To: <0501c0b2-df78-4c93-9ca1-7f32767b0225@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_005934_214030_EFEB001F 
X-CRM114-Status: GOOD (  24.07  )
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


--ed4stfeyr2kqil54
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 09:49:12AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 09:46, Thierry Reding wrote:
> > On Thu, May 08, 2025 at 09:40:38AM +0200, Krzysztof Kozlowski wrote:
> >> On 08/05/2025 09:39, Krzysztof Kozlowski wrote:
> >>> On 07/05/2025 16:37, Thierry Reding wrote:
> >>>> From: Thierry Reding <treding@nvidia.com>
> >>>>
> >>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>
> >>> Missing commit msg
> >>>
> >>>> ---
> >>>>  include/dt-bindings/clock/tegra264-clock.h | 9 +++++++++
> >>>>  include/dt-bindings/reset/tegra264-reset.h | 7 +++++++
> >>>>  2 files changed, 16 insertions(+)
> >>>>  create mode 100644 include/dt-bindings/clock/tegra264-clock.h
> >>>>  create mode 100644 include/dt-bindings/reset/tegra264-reset.h
> >>>
> >>>
> >>> Filename equal to the compatible. That's the standard convention for =
all
> >>> the headers since some years.
> >>
> >> Huh, I cannot find the binding in this patchset. Where is the actual
> >> binding added?
> >=20
> > The bindings for this are in
> >=20
> >   Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
>=20
> There is no tegra264 in that binding.

That's part of an earlier series I sent out (and linked to from the
cover letter). It's here:

	https://lore.kernel.org/linux-tegra/20250506133118.1011777-1-thierry.redin=
g@gmail.com/T/#m96bb396b352659581a9e71a4610c51e6ab4d5b6a

> The header always goes with the binding and the drivers.
>=20
> >=20
> > There's no 1:1 mapping to a compatible for this because BPMP is many
> > things. It's a clock provider, a reset provider, a power domain
>=20
> Sure, that's fine.
>=20
> > provider. These definitions reflect the IDs assigned by the BPMP ABI
> > and we've used this structure ever since this was introduced back in
> > 2016.
> >=20
> > I don't think changing the convention for this is a net advantage.
>=20
> Headers still should match the compatible one way or another. Can be
> nvidia,tegra264.h
> (because -clock is redundant and you do not want to use the actual
> compatible)

I get it. You want consistency. But what about consistency with earlier
chip generations? Do you want me to go and rename all of these files?

Thierry

--ed4stfeyr2kqil54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcZGEACgkQ3SOs138+
s6EagQ//UlzVoHHEdakhc24zRCO4VnwLEyoPYprmuWP80OUlNNOghNX4chLKZZLC
8P+djXVgZD5JeZk3SZm7DHPyzGbVtmLIrPtlCU4Wpb5p5K120/fXxyoIoHqxTyNS
PToYjUJEcwjs4TrqLmEL0+r6E25VPphKbwHDRkDfYRyrGLNKao2BfbwuBizYoJW/
anqIEhMFYCi91KO/tlYy0KwsKvjj9nmJDrfRixu3RdJQFygrsgV0Iv10qwPT8xs6
cu+apOBzLWrV/dPsyI0zh9A7TAaWz8t+XEyEnw21RKNRrhrp+4ugN7S35Jgboz5V
3p919umvhL3Eep0uuO+lKfXVG7IJ2k2IBNGIeopDnIFo1X3ZPtTmAiaSdAAdN1Zz
BYBKbUPHEm1dO91TWiX8g6Zt6Oso+pRQUNsFxofsywPsHrGIEWMQV8e9tsek2272
nySpApsAvwLHOVMn0G+ABe0+DlOcbS3nrF2EZURLVhRS1e0cX1tvA3N9YY5zuIut
TCvGPV4mTcZ1JelrkvnBMT/x+PTvmBtBgTSHI/p8FAElUdQ1csSe2ohlSaA2WWIp
5aTGr/fDPeSOM4cvu9Ynh1OQbG5VHXyhvlFsbEbZs9W7f/bGwl+ECxGAQsstmeQC
X/3ws7XFrWWTA+ijfuiuPBHw0KEe8wk1I8T8gu+43r5mA8ged/I=
=tIRR
-----END PGP SIGNATURE-----

--ed4stfeyr2kqil54--

