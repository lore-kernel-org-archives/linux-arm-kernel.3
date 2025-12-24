Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F16E77361
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSdmNzll22GS36dUZyYftlYEWLa006on7/6Z+DJM0ag=; b=GqE/pagilA315XhrLa/ebYG0OO
	onPjhAKQFiYaFhNG3HF6NVpRexY4BymuFNS3ulN+2asPQV4+8hIJtRzbbcloSLpqaGCt7zPM0ggBB
	kJhbufTXne8QR2tQCrUk0bMbewU4nA+D5iovNXNU+0linOveI14aRMhTfXi4A09WE1hSfNJNKusHF
	vum/qHXolwDZZH1W6mPXhD8zDCssmYNHU4rqJvJSYCNQajET32pAjIu9GMtvpplY1TYkZEmRDAiWq
	uDSWXUYOklgsDadGLHK8Q5USyMAqNGNOzGrg7DVPC5eTlm0SqNT7AZYrlPn3wS8ctHVXQA1/td2PN
	o+XOv6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYR8V-0000000H9i0-3MdL;
	Wed, 24 Dec 2025 15:50:56 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYR8Q-0000000H9fw-0rwt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 15:50:48 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4eda6c385c0so46455511cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 07:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766591445; x=1767196245; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QSdmNzll22GS36dUZyYftlYEWLa006on7/6Z+DJM0ag=;
        b=zQ3f85byWFbxl9Va1N3O0YNR26Pw56d0d4QXSLs/m5mXk/vBnTaPorvn19crIFwIL1
         6e048PaqM4zSkN1QyD7oFQbjlwlSb8wmM41m5rgNQBxsL+bBZptb7gsu3UGyU+MB09Ma
         0vRn9DhUVV7szzxXHMTdk5PmTBurQwoYineZI9GQzKV++1TScH8TkbXhwvKPIYLeHDj/
         hq5bFyCrdIS+qobi3Bq7PQuQSVvO2vyW3G3BOiIqgl9K4dgor1zoCMv/9cBlxWm/Wt5f
         jENUdf97dtdYIb+Y9/HMY6vchK1rVQ+gY9SGTWMYidR3ArIQaS0mn5FDG/eBRyxBasgm
         KbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766591445; x=1767196245;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSdmNzll22GS36dUZyYftlYEWLa006on7/6Z+DJM0ag=;
        b=alUae/YcYq6FSp9TDiZylt18joIF2qyaNKQ7E4351zyDYrcyI9LnZ+sfgRRynkJtNk
         2LO7ntBivUB0KYOFZXjORaT4vflf+H8vW0SoaA+YiBNKM3VQsk8huXJBPnr48kC4ZUxO
         EMX/4q9ZT0G4ZSi2ke2AH7Gh60Dn/86dqRf0YUWCYU+so0Vqr8SmxarukJAGQLbQGr0B
         S/6U0Mw5H+6cH3LCZvyw8DApj3G8kbjjp6GidsYvpBB5TW1wthY03gf1h2eCg+hUING9
         JIvhuKVPLBLZQUt2+JDdF1CT6ZQ+IPscERFs/aQD47h4C/LRBJvQleCfZccAajHzM3ar
         lG4w==
X-Forwarded-Encrypted: i=1; AJvYcCUMeGjVYOc0AC/dW8oW3Qqyd0/jp6M6zhwxrelCl6mY4DD60yv0n3IUZqNC4wBimX4lPPLKjOihgqu2xj6opFuc@lists.infradead.org
X-Gm-Message-State: AOJu0YxzqzV0RyPHMVPnZc0/3puPZtPZREQJjlTO0oMRf1SLru6nOVaS
	EuHodKCZtNpX4ElezyAHfInuWgcS7Y6/yILlJASrSerISnl+NIjoDpyrrJWF68yoZLg=
X-Gm-Gg: AY/fxX4wftkrMA59Lk5jQ9G4K0DD4eIC0tN0PgQ5phyWL7Hzh/Y88gEt6FLO8rwZ56J
	fxDN/iNLDdF5a7DOC8fhptIXkqX2OwlkPuzC2v1dOrMhaIYfwG+s7qZxBVKiRzSgJVJhyCheHMT
	WJoKLFjuJC1Mxjvdt3DCuFImG+qfL81dyUdCTr2C8cjic28lmUE/xmE6FcWrq87fzBU2SWcccjm
	Coh35DYkQEIYwJYgJ+WHBKHMtBXkKjPcbLJh/mhecHesmKZTS8iZTPSg/PmMcLXmcdl6nzHJcGB
	o0Nz5S1xgjfh277v6WgLgfDHxJFdMHObKXhFGlYs7SLwXvPxYS+PR7kf9/c6ThPgsPrxIx7eQI2
	gN6jELZkmFUsDZRHD2fPNs7lUyTPr3XAf6gzCBuCYM/+aQuCMPcYBJdfMVCtqRO9487ypjOvJLM
	Wl92N4gDdui1bg3IhS
X-Google-Smtp-Source: AGHT+IHFpvl7atlI/XfDElSp1cFHnazASDvVJwr4LLKxB3XCrMdiPROiP2O9X2LigLf12PzE9tOSRw==
X-Received: by 2002:a05:622a:4013:b0:4ee:4a8b:d9ed with SMTP id d75a77b69052e-4f4abda9f56mr233284001cf.58.1766591444898;
        Wed, 24 Dec 2025 07:50:44 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62d53dsm127169351cf.19.2025.12.24.07.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:50:44 -0800 (PST)
Message-ID: <d09691bfde08f80e4cb47cc365d86bd53d0aaa7c.camel@ndufresne.ca>
Subject: Re: [PATCH v2 15/22] media: rockchip: rga: share the interrupt when
 an external iommu is used
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, Michael Olbrich
	 <m.olbrich@pengutronix.de>
Date: Wed, 24 Dec 2025 10:50:42 -0500
In-Reply-To: <20251203-spu-rga3-v2-15-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-15-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-6E1pOz363AUSc4hyqasF"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_075046_270611_592156CC 
X-CRM114-Status: GOOD (  16.68  )
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


--=-6E1pOz363AUSc4hyqasF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> From: Michael Olbrich <m.olbrich@pengutronix.de>
>=20
> The RGA3 and the corresponding iommu share the interrupt. So in that
> case, request a shared interrupt so that the iommu driver can request
> it as well.
>=20
> Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index f28ec88c186fa..1bfc4021f4a7b 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -718,7 +718,8 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0		goto err_put_clk;
> =C2=A0	}
> =C2=A0
> -	ret =3D devm_request_irq(rga->dev, irq, rga_isr, 0,
> +	ret =3D devm_request_irq(rga->dev, irq, rga_isr,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga_has_internal_iommu(rga) ? 0 =
: IRQF_SHARED,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(rga->dev), rga);
> =C2=A0	if (ret < 0) {
> =C2=A0		dev_err(rga->dev, "failed to request irq\n");

--=-6E1pOz363AUSc4hyqasF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwL0gAKCRDZQZRRKWBy
9LU3APkBQSKkig2rWR6l9nTBHBKlDlfrlSgOBpfmOmasl3/xlwD/f5YFD3P7hHgs
8Jh8k6G/iOd6tWyXItvEbDbD2Trhzgs=
=KLzg
-----END PGP SIGNATURE-----

--=-6E1pOz363AUSc4hyqasF--

