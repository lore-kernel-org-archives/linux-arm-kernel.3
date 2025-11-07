Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAC5CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 16:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWo05EnOi9/03+u8bn3n24GhXxRQ4Bgj2L49SL9N0ZI=; b=4L1AjbkGMVT0/fNdQO+YQD5L1O
	Ryelg/yw0VG5CBUGBPKxb3UmRLBEgNQWqu7uddD6NKPfMgxTW08KVuNryeR2c9zgM1lNoGKQFG4JD
	BKjK7AeZqm+fKqbPKmTLQ21OirhZKQu3pBKN1anKUaJMdXc6g57+HsizxE4VJ/Xjqx7q2FtR4b7s4
	TFvM2E4NIL5ZEpZh1gjCxAjXIweuh1bFyQ/zCT7ZtwCWvPocQvj2Im5IDZ/C+cnJr6nCcj1aPPO9y
	kiPJdTq7fzk1smfrYRM+t127rIANbOFitYFUGF0ETfMu8+VHfavSfWy0wPMzApaB1C1r7rtit8wrL
	7uceTa+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPOk-000000006G2-2eq2;
	Fri, 07 Nov 2025 16:33:14 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPOh-000000006FL-0nuN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 16:33:13 +0000
Received: by mail-qv1-xf41.google.com with SMTP id 6a1803df08f44-8804650ca32so9642956d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 08:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1762533190; x=1763137990; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AWo05EnOi9/03+u8bn3n24GhXxRQ4Bgj2L49SL9N0ZI=;
        b=ebqa8aV/ow8dVDiR+Pl7sAuU4zulRiayaillipF6lJ1dBOr0ryiaKbvc8lKEqJYi7l
         QyOqwGBMy/bqfk52b51FaJGwF0rgZH76yLgxnys8W9lZ8pbhj4aVSh4fn7yDquyvBdNd
         ILaSLojtNv8gBPQ7vCwlKw0X1Fj3pKd3TJHOi3BMo2DPWhvnRrOckgU1NKSpzUYVZetX
         e1oDmUnzqrCMdYGetCUomyvOXpdtwFAm5ZeydfzYMWpimJ20hd0A9KJDGOXrc5p4n4ij
         ebfNI+kUhxAhjCFiTIc3aO/ASiB/8CvCEBpas/WFtGzmd0HE/rzOlCr7ahnAYDTlMSJ7
         df/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762533190; x=1763137990;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AWo05EnOi9/03+u8bn3n24GhXxRQ4Bgj2L49SL9N0ZI=;
        b=oodGaOT5teMZITEpc2C6OyO6tddFpuUkzLYc4+l9uhJ81mE+ImzwJ/XR7iUT6bRfun
         A/ifWT3yEfKQxOFOSMablUF33YJycAL60c1U/7+ChPFMZ6FuZSSPdKC4fmhKwoZWStXx
         6B2c/8e/KtbeiNSez5tROtBHBTS0QMdl0qHg6WwkFnh0MW0GfZjRQxrnFq4C3fC9KY1U
         lRFIynW5dR7qUjfxMb1kUEvAQ4t0A162c8ULCaRSts+DfJMKEHGE6gmPKc9inCCXVQ3d
         cZrwHhOfCKTjydAddcJeY2gpesLh258luM5a309+Jru6ENxTWCPW4Zs3tIPKkGS1YXOJ
         Q3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2y7xOHfH/gzbDcFRLArAGFduBpQesOQYetBQ7j5tqOOKzCFS88F2YM2ZUYlembJ+1qgmmUJ2g8CxmMQz3WwjO@lists.infradead.org
X-Gm-Message-State: AOJu0YyUaNl8OsiR4+/A+BEgtfvoWLBaAE7vq92IHDBJ0x9134Q0RtIC
	X3oA/yHlrblPFlHnmKJWN0PL3d1oYw6rZ73TET1SEs1L0EP3fbzX+tE3oXNHXeKUyls=
X-Gm-Gg: ASbGncu4ORxCF3l/LkYUs9N3chLQ2seDSy00aOtCoZyc4ibYCDNUs47u0wM/A08puIv
	QynSBuH6ka4XKpEXWKrl4bxo0WWBZrhMw9W3wuji4CbqMdA/OXbqOIZZ48YONnRp5N70LxN/+Zj
	nuUXndg3XcF7bry6AIHUH2P7H1r16XX2Vv9VdKC7XmY9uk0zpbFwGiQ1ebUrkgHj64oSekhQl5z
	wCnU22uEi4eMsQ70LsZmTARKQTrFD8eSLJxGqkwBLFliMmw6j2cAXXaOE/Yo8PuNftVPt91ypq2
	d+Jx0p6C7/2sEcgTcB6WcYltcRhfUtFXERtIwY8f4VgxlNuCnOEn8ljMsDAZazRnaA/8gah86vr
	wRuCXDgLD593whchvPH+IjgqCmxYEQ8I6cPkyZJGBsHbNh8/x4CXeZeqtqQnCmtxDnEERUOqQkC
	FesoPhaw==
X-Google-Smtp-Source: AGHT+IFsPMhSdrmOZ6ahN3sPxnvKd643mstGo618XCLtPRJlduqW3IJUvEqzr1ydUpduU0yqXdCstw==
X-Received: by 2002:a05:6214:482:b0:87c:2024:4d5c with SMTP id 6a1803df08f44-881767a96ccmr45493816d6.35.1762533189704;
        Fri, 07 Nov 2025 08:33:09 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:ef24::c41? ([2606:6d00:11:ef24::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-880828f4192sm43277236d6.14.2025.11.07.08.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:33:08 -0800 (PST)
Message-ID: <4cbd47f8211e3e1a038857f848ad4197d95bd31c.camel@ndufresne.ca>
Subject: Re: [PATCH v4 3/5] dt-bindings: media: Add the Raspberry Pi HEVC
 decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 07 Nov 2025 11:33:07 -0500
In-Reply-To: <20250701-media-rpi-hevc-dec-v4-3-057cfa541177@raspberrypi.com>
References: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
	 <20250701-media-rpi-hevc-dec-v4-3-057cfa541177@raspberrypi.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-3X+v+qqpBxti/ZHprAy2"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_083311_249425_0B7EB528 
X-CRM114-Status: GOOD (  25.32  )
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


--=-3X+v+qqpBxti/ZHprAy2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 01 juillet 2025 =C3=A0 17:01 +0100, Dave Stevenson a =C3=A9crit=C2=
=A0:
> Adds a binding for the HEVC decoder IP owned by Raspberry Pi.
>=20
> Instantiations of the decoder IP can currently be found in
> the Broadcom BCM2711 and BCM2712 SoCs.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20
> ---
>=20
> Updated based on the thread in v3 [1] with Krzystof to drop to only SoC
> specific compatible strings.
>=20
> This still feels wrong to me as this is NOT Broadcom IP - it is solely
> owned by Raspberry Pi.
>=20
> It is the same situation as for the Raspberry Pi ISP Backend where
> it was proposed to have
> =C2=A0 compatible =3D "brcm,pispbe-bcm2712", "raspberrypi,pispbe";
> in [2]. That proposal was viewed as acceptable by both Rob[3] and Conor[4=
],
> and the binding given a Reviewed-by by Rob[5].
>=20
> Yes it is found as a block inside an SoC, but the same could be said
> for a Synopsys I2C controller ("snps,designware-i2c"), Cadence ethernet
> MAC ("cdns,macb"), ARM CPU (eg "arm,cortex-a53"), or any number of other
> examples. They are all 3rd party IP blocks found in SoCs, have an SoC spe=
cific
> compatible defined, but acknowledge the IP owner and use a common fallbac=
k
> compatible where possible.
>=20
> Please could we have confirmation that this really is what is required
> by device tree?

Its been approved like this, are you confortable with that now ? If I'm rea=
ding
this correctly, its common practice to add and use a SoC specific compatibl=
e
just in case some variation exists. Its quite unlikely in this case of cour=
se.

cheers,
Nicolas

>=20
> Thanks
> =C2=A0 Dave
>=20
> [1] https://lore.kernel.org/linux-media/20250423-media-rpi-hevc-dec-v3-3-=
8fd3fad1d6fb@raspberrypi.com/
> [2] https://lore.kernel.org/linux-media/20240213104405.GB5012@pendragon.i=
deasonboard.com/
> [3] https://lore.kernel.org/linux-media/20240215140058.GA4147262-robh@ker=
nel.org/
> [4] https://lore.kernel.org/linux-media/20240213-landlady-backstab-6e7da8=
24c99a@spud/
> [5] https://lore.kernel.org/linux-media/170932821578.3062059.181501592562=
47255021.robh@kernel.org/
> ---
> =C2=A0.../bindings/media/raspberrypi,hevc-dec.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 72 ++++++++++++++++++++++
> =C2=A01 file changed, 72 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec=
.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
> new file mode 100644
> index 000000000000..fe3361bddd1f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/raspberrypi,hevc-dec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raspberry Pi HEVC Decoder
> +
> +maintainers:
> +=C2=A0 - John Cox <john.cox@raspberrypi.com>
> +=C2=A0 - Dom Cobley <dom@raspberrypi.com>
> +=C2=A0 - Dave Stevenson <dave.stevenson@raspberrypi.com>
> +
> +description:
> +=C2=A0 The Raspberry Pi HEVC decoder is a hardware video decode accelera=
tor IP block
> +=C2=A0 developed and owned by Raspberry Pi.
> +
> +=C2=A0 Currently it can be found in the Broadcom BCM2711 and BCM2712 pro=
cessors used
> +=C2=A0 on Raspberry Pi 4 and 5 boards respectively.
> +
> +properties:
> +=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: brcm,bcm2711-hevc-dec
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - brcm,bcm2712-hevc-dec
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: brcm,bcm=
2711-hevc-dec
> +
> +=C2=A0 reg:
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The HEVC main register reg=
ion
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The Interrupt control regi=
ster region
> +
> +=C2=A0 reg-names:
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: hevc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: intc
> +
> +=C2=A0 interrupts:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 clocks:
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The HEVC block clock
> +
> +required:
> +=C2=A0 - compatible
> +=C2=A0 - reg
> +=C2=A0 - reg-names
> +=C2=A0 - interrupts
> +=C2=A0 - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +=C2=A0 - |
> +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +=C2=A0=C2=A0=C2=A0 video-codec@7eb10000 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "brcm,bcm2711-=
hevc-dec";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x7eb00000 0x10000>,=
 /* HEVC */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <0x7eb10000 0x1000>;=C2=A0 /* INTC */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg-names =3D "hevc",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "intc";
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <GIC_SPI 98 IR=
Q_TYPE_LEVEL_HIGH>;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&clk 0>;
> +=C2=A0=C2=A0=C2=A0 };
> +
> +...

--=-3X+v+qqpBxti/ZHprAy2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQ4fQwAKCRDZQZRRKWBy
9JiWAP9aJDUC+DwYY4YEakcAJEpmjHTtr46zD7hn3ACBBR4/agD/V2BqBy+VHQKe
BnFBOdM8RMAcrD/5z9Gr8HaJXTJpvgI=
=djZq
-----END PGP SIGNATURE-----

--=-3X+v+qqpBxti/ZHprAy2--

