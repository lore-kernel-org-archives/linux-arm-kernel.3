Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80CCCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SHmDoHdQmKTfiI5PMccAlbyA1V46slp40pEW9LImx8=; b=bZp/ypppHCt6R4QVtASemCbDTU
	vrpueesMcjFLRCtERcoCHkPCs0qMMFXBeulXIiqMO+uTluH0tJeKC5jOrbRYmyOQPlT5M2YUuepfa
	+dlPu2rjDeb1k7kWGPQj+CxV0Aw6V4RxjxFrUyGN01wuGrWtVsNjhYXLlEgWL4b26CUuQr1EWvaeS
	Mh20QJXYBt1+aj7K1Lt5HBHWVNHtwG6NBsdDRQNmvDYSxN3Fx3uhT7Nd+DluD56czqXc9t+I8QCRw
	1C9eiAegKHTnGQHdzbOPXjRwtYBpczHDn2jwylwJy9FLbCX6P9af4jm3ajiGMPe52esaBGgKzLMyl
	QAB9c2XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CBG-00000002YYy-2547;
	Tue, 07 Oct 2025 18:12:58 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CBA-00000002YOX-0V9V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 18:12:56 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-85c66a8a462so940969885a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 11:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759860770; x=1760465570; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8SHmDoHdQmKTfiI5PMccAlbyA1V46slp40pEW9LImx8=;
        b=lkVfnqXHyX5PPXgSWaE3luVGYHYx/zEWR0Os2DIKritXG9ppgBPb9Rnc5M/lAClA2I
         TjinoBni0SgwCRDcFTq7+lvrtlcWp6yoGSI11kZWCf916wUKjJ4Q3R8AyuFhPTlNT2s+
         uF79n5HCKMy3Awfoh4y96vcmFbyAZ2bVlX8pWT+AYdOdL3dlvZzDZ3UtuvnPgmRPIFpO
         oHQH9kjDyA8XDxxTw4kCJ62IYq+C10D2LlMk4Ye9UcUg7yp/X+gqn3kWzTyX1Z7pm5tH
         QAJ9iEKFtK7HppIut83m/OhNCiptPz97tSZGZ0xG8dvtQyNEqQrLbJD1G923SxxynEN4
         tccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759860770; x=1760465570;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SHmDoHdQmKTfiI5PMccAlbyA1V46slp40pEW9LImx8=;
        b=FitapBWovrpGi0h8hgVpy//5B+S4R30T4rp3mIe/NpieFaEzCNNh4W2NkWmx+ukAI/
         j/K1cp953qnKzlQoGD7CvWiNv7jyceL/6yfMHnx9YWW2LD9bIDwuLAmkQ+/2hyWIr+tt
         0vKz/Xo8GYMJlWIjlNewZMleMsQOmFVfOMcM9NT1oockUbqY+AQNRu6Xtv1eyq2GMQ3r
         Dd4gq+XYJJkEJ8oqZyiPD/fgwmbxIuoNTFy+lHN1oFZIDFCW8aX86YuRzNSLxBISpseD
         CprGTZt5B6M3HKzaKFxIXKJsa14tTksZmTS+xBey6e/fCBj38XPSx1SzUNuOhaoDjaWy
         MNsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBUWHHyragpEjeRu2r+bb+2m9X4CpTuUYp9sFWz4NweuNUKH+M9KLL+qw5p9+7ZZq+QBNv7DvU8bt3kwOQZGB8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu7Jb07K16dhf5aHIyI3cIqNqRAfZmySaPiPBAVotz8rbjPz1M
	4Adv0a8+IS534iT7IebnmvOwfcEVK5PfUTE6nF0zEksXjQKt9iynlhI7dJ2j59PV+SA=
X-Gm-Gg: ASbGncuf9YngxMPMBl3wd8cJ7p7mAiOrl0mhQ3e5LJC3bSUmDycH9vV6ZRudyejk6/T
	fCgoT/0U9CRueWg6Fo4mS8bzdHN5XmuHWXw9wJDNY926RZ6NoAlT+DhK9aGUbNS/iVvKsf+c5F0
	LPteyvrPZaHfnf04GA3GM138Fmacot+xED79WbUXFP2SuXBVvtkPtAvaS4P4Whp+tS1xya82vQC
	S+qqTu+8AL8Zfc+CfRmwPcmOz76WWTHHSWYVbqa2vg8aUdUWTOeHGH/0VpCu2F51N2S4lWaM2io
	TftO2Mnq2YTbEaqqGpnjPbm7+r2IxcF3vbGX1hmXKZOndJRv6eNr1SQiyrLVVEXqNhQ+h2CtJEk
	sPcA/SaVhuwh9/S1qUTsLb/PjI2fWjYA29+C1EQmoq3hC0lB+LI0j
X-Google-Smtp-Source: AGHT+IFJwiFyqdn6vHfsVW5AqTzfPU59JdPTe9jsCTVyjegINt2FetoGEQEhtGUGJnu4FO7lY33Vsw==
X-Received: by 2002:a05:620a:1a8e:b0:878:671f:7395 with SMTP id af79cd13be357-8835410ff67mr108686985a.69.1759860770343;
        Tue, 07 Oct 2025 11:12:50 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-877794b8c0esm1649064985a.45.2025.10.07.11.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:12:49 -0700 (PDT)
Message-ID: <dd5f934f222116a29ef5ec19a52a9b3ae7433de9.camel@ndufresne.ca>
Subject: Re: [PATCH 13/16] media: dt-bindings: media: rockchip-rga: add
 rockchip,rk3588-rga3
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sven =?ISO-8859-1?Q?P=FCschel?=	
 <s.pueschel@pengutronix.de>, Jacob Chen <jacob-chen@iotwrt.com>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Tue, 07 Oct 2025 14:12:48 -0400
In-Reply-To: <c4b0f1d0-cebd-4381-b2c0-20c177c0732c@kernel.org>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
	 <20251007-spu-rga3-v1-13-36ad85570402@pengutronix.de>
	 <c4b0f1d0-cebd-4381-b2c0-20c177c0732c@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7gUIbCmFrGsfnm1LXQ2d"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_111252_234487_3173BE59 
X-CRM114-Status: GOOD (  19.59  )
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


--=-7gUIbCmFrGsfnm1LXQ2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 07 octobre 2025 =C3=A0 17:38 +0900, Krzysztof Kozlowski a =C3=A9cr=
it=C2=A0:
> On 07/10/2025 17:32, Sven P=C3=BCschel wrote:
> > Add a new compatible for the rk3588 Rockchip SoC, which features an
> > RGA3, which is described in the TRM Part2.

Please write something here. You can't explain why RK did this, but at leas=
t
explain what are the differences and additional feature. It should also be =
super
clear through your patchset everything you didn't support, since when readi=
ng
your set, it really have nothing extra implemented.

> >=20
> > Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> > ---
> > =C2=A0Documentation/devicetree/bindings/media/rockchip-rga.yaml | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > index
> > ac17cda65191be047fc61d0c806f806c6af07c7b..11e86333c56aab55d9358dc88e45e=
7c1eb
> > faae9e 100644
> > --- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > +++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > @@ -20,6 +20,7 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: rockchip,rk3288-rga
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: rockchip,rk3399-rga
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: rockchip,rk3588-rga3
>=20
> There is already rk3588-rga, so please explain in commit msg
> differences, including compatibility or lack thereof. I am confused why
> there are two completely different 2D accelerators simultaneously on
> that SoC.

It is quite strange hardware design, but this is really how the hardware is=
. I
personally don't expect an explanation from a third party. Its a mirror of =
the
VOP2 planes really.

Nicolas

>=20
> Best regards,
> Krzysztof

--=-7gUIbCmFrGsfnm1LXQ2d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOVYIAAKCRDZQZRRKWBy
9Go6AP9e4y2IiSL2I+67c8y9Mn1TNSV8ucapX8SFj5r6BqkeaAD/ebUK9jFL041m
do23vyGkPpDC61NKSkX4f+0FGc9xDwc=
=HOjH
-----END PGP SIGNATURE-----

--=-7gUIbCmFrGsfnm1LXQ2d--

