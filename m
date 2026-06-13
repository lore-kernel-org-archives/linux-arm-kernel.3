Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAE3CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHs9yK5AtFf0IN6y8bIIPCYpjsJCXaUVqV8EKE6IMM0=; b=pYdU2+9nqYE0bRTWYRw9QQ7C4n
	PqggEb77HM7dTOBaHFJQJRGBM7QbU6nbrfmaVA2kRiwYEnnX+kyWdoCIzZ6O0TO6yGVDDCWdUsEm3
	tFVUIfLC0ToZSz/g9dbAREg1FwB7ur9jh4qAMLMdtjOi3Y/eZ1673/jhkjvMbUmnHlGxT+L9fd710
	YOZIroPHs3mV5i1MXYZg9gSyKBeuniI7H0jAat0lW6LX+RMITGjb72/2eoQTFSFlOzdDv0wvK3P7O
	LiVjn92JWTH/6tXqKD6d6cqHbcHtNl3VpW6ShfsecmYfgv7nME40O9Cs6s1O98Gh32vPLdRModx4Y
	XmtaXPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJpI-0000000C5m3-3ULA;
	Sat, 13 Jun 2026 08:34:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJpF-0000000C5lh-3bya
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 08:34:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490b7866869so17172455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 01:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781339683; x=1781944483; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QHs9yK5AtFf0IN6y8bIIPCYpjsJCXaUVqV8EKE6IMM0=;
        b=tOS5Q77jG2fcf1/ZF7DjTwzDWM1UISp5xU5SMrW88pbIyesj6LoJozvf2Tfl/wdQXt
         w2Rzm2eN5GJTXxUAEjW3ODhHOPGMa4O8BQ4MZKYX2STIIgipWCRnjQHVTmDkptbX7stw
         LFKPBnPDmundpBQn3ABGJ77NqgOVCXrTV6Wjr9SCTJ9XszX3tctcz2iI1sbTjXgunysB
         JxGxU42laheE7cKc0tZfd8iIcr41jOZ6lerxeDl43ixKac77CrJ/QXxq4ppv8Bl3URNV
         D4xNE0lUXuK9eI9JTULy/4sOmfIx0UKrXNm8k1PL70W3fyChn/7mDpXxlmKr+tdym/i5
         rbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781339683; x=1781944483;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHs9yK5AtFf0IN6y8bIIPCYpjsJCXaUVqV8EKE6IMM0=;
        b=RP+OmxjNY0ZmktZ0XqN6cm4EEKGijxO80Yryyi4+bCRZtfxwHdDQiSYYP7wsAF2rhu
         q92Pqf74Oerq23mtl/1wzSZX2I4zzjjWMTxPoJuoV+p2UtXPqzb8nRQuTEC0UFs463A1
         BUzzoOnsSoDJGTKt58oQdHiIQYwauoTMT1yNHETcuC9YCgFIb8yHtZsh6nzfDPx+/sVi
         jjxHeWomnfNOKztH6KKeurWCcEIkeZ5/aemaA6IgYswgrUhKThwafdNWunEaq6y6rcY5
         vN08FT0UHAzQGAXdqfPQ2tyL9u2+cHo31xJ1nDkXecgodRI/kXqZ1V/gyk+rhv9aqJUB
         2j5A==
X-Forwarded-Encrypted: i=1; AFNElJ/dAB4u+5RuIGdY/I+zf7uYlmZZX72VsjdZg4M4awDJpSfCb//ZvdRvHmz3IsDXqN79/s9VRzjAH69rOd2+dDfA@lists.infradead.org
X-Gm-Message-State: AOJu0YwHtyjqmc78ghcEqosECR6ClsKeW8BfVQxPkBG5kZx3UaCirasP
	LXfcUWZIUA6mnUyL5Qy6MmCVvyXpRT9xNJSSp1o83vsAdpTFS9Bb4zhRntuvCGC/83Y=
X-Gm-Gg: Acq92OHAP6LBzNp9YjuZjYyFGSZ/b4ay7KODsU6WzM8Yl7Uy5zcOzbPdR5UFmiVVhQ0
	U1fn9AwvjGdB+0ShYNu3mBt89nHgCTjkDq2xa4/0PcgDznMJDnx1BPp/iNuGXg9kj0s9deQSfNK
	vcG+dhXyNb2Lyq0TUsenFOntyQ6hV8lPzYHx58+2gJ28feldPaymWWzhq0O+pLpaIz7QMzdABqn
	9Vj3/YzLmJ13ZuhmgsffQ7nvsmDEl5s4Cu+gDtRe7WorMXhk0m6958/ut0QF65Vlxwpjj8xP8ot
	PTNaFnOknhblR89Rd0aMRon1WbnRP19XG07Lp3GWiDItdRxhdNO0x67zhgqSXmArWcSPT3B+Xgd
	uqpu1arT6i4yZfVhs9EMvDsi1ac2/XRs0bE+3u/dHSHBFXE/toFlYm9g//YJHAzm80Tbvfi4YP4
	1y51z9aN+dJz/2/nn7SIKsmAlU6mfWoupUOA2rVUwIj4X6Ll+zfEJKJAWWK0pIYUSC6fD8j+XzP
	sLnCi6GPTksc5UDFw==
X-Received: by 2002:a05:600d:8494:10b0:490:c7dd:de3e with SMTP id 5b1f17b1804b1-490ec521187mr55836955e9.31.1781339683115;
        Sat, 13 Jun 2026 01:34:43 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203d05d1sm72320885e9.12.2026.06.13.01.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:34:42 -0700 (PDT)
Message-ID: <b428d57ba5464f1226daf099877f4c25fa4fc191.camel@gmail.com>
Subject: Re: [PATCH v4 6/7] arm64: dts: allwinner: a100: reserve RAM for ATF
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Samuel
 Holland <samuel@sholland.org>,  Hans de Goede <hansg@kernel.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Andre Przywara	
 <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid	
 <lukas.schmid@netcube.li>, "J." =?ISO-8859-1?Q?Neusch=E4fer?=
 <j.ne@posteo.net>,  Eric Biggers <ebiggers@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Luca Weiss <luca@lucaweiss.eu>,  Sven Peter
 <sven@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
Date: Sat, 13 Jun 2026 10:34:42 +0200
In-Reply-To: <_6NEZ78hR8a_3V2bhBAGoQ@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
	 <20260605070923.3045073-7-alexander.sverdlin@gmail.com>
	 <_6NEZ78hR8a_3V2bhBAGoQ@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_013445_917657_060DEEF7 
X-CRM114-Status: GOOD (  20.65  )
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

Hi Jernej,

On Sat, 2026-06-13 at 10:22 +0200, Jernej =C5=A0krabec wrote:
> Dne petek, 5. junij 2026 ob 09:09:20 Srednjeevropski poletni =C4=8Das je =
Alexander Sverdlin napisal(a):
> > Add reserved-memory node carving out Trusted Firmware-A region spanning
> > fixed 256K from physical address 0x40000000. Even though Allwinner ATF
> > itself passes the address range in the fdt to U-Boot, U-Boot currently
> > only reserves this memory internally, but doesn't carve out the region
> > in the fdt passed to Linux.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>=20
> NAK. It is job of boot procedure to properly inject TF-A reserved node.
> Any issue should be fixed there.


like in commit 0d17c865118881609ea7e381c7cadbb7979cc596
("arm64: dts: allwinner: Add Allwinner H616 .dtsi file")
    Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

? ;-)

> Best regards,
> Jernej Skrabec
>=20
> > ---
> > Changelog:
> > v4:
> > - new patch
> >=20
> > =C2=A0 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 16 ++++++++++++=
++++
> > =C2=A0 1 file changed, 16 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun50i-a100.dtsi
> > index 7cb06b19b5a5..d8391663fd1d 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> > @@ -87,6 +87,22 @@ osc32k: osc32k-clk {
> > =C2=A0=C2=A0		#clock-cells =3D <0>;
> > =C2=A0=C2=A0	};
> > =C2=A0=20
> > +	reserved-memory {
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <2>;
> > +		ranges;
> > +
> > +		/*
> > +		 * 256 KiB reserved for Trusted Firmware-A (BL31).
> > +		 * This is added by BL31 itself, but some bootloaders fail
> > +		 * to propagate this into the DTB handed to kernels.
> > +		 */
> > +		secmon@40000000 {
> > +			reg =3D <0x0 0x40000000 0x0 0x40000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> > =C2=A0=C2=A0	timer {
> > =C2=A0=C2=A0		compatible =3D "arm,armv8-timer";
> > =C2=A0=C2=A0		interrupts =3D <GIC_PPI 13

--=20
Alexander Sverdlin.

