Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80924C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+40RmltfMANyPY+1QTgar9RnRnjYDGniubr9OVcwfG4=; b=WHFpKl99Ci/ChURg+VelFock/W
	40v5RvlAKtoF2NOLr2BLJTRXoJh08iQ13Tbt4upLo8V8CSGR78l0VCuV/qTXFCOwTdzVFK0eZ0/tV
	uQvw0cpa4w3JB0FbEDnJg+saw5NnxO5f4eene3sP61VAz0v8iC6x+pYtZJkoUoIxHhcrg7WevLhpE
	AkqD0ZYgEyI/83JyOs18j5WuczS5JpAsaE1kDpOv43lWrOwvxtOX2sLd/wgGJlu+khscpFPzAJOmZ
	CvDcGHjlliOIfXyVqroctWRvXnHgwo3VQ83cZCtOdiPT86JBtgZlwPCJzgPisKoNXjIFrHw1BVNGU
	jScP9g4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRKB-0000000FGXi-2GMq;
	Thu, 16 Jan 2025 14:58:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRFr-0000000FFbX-0KSq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 14:53:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43690d4605dso6706295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 06:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737039233; x=1737644033; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+40RmltfMANyPY+1QTgar9RnRnjYDGniubr9OVcwfG4=;
        b=uN19FOfc8mBfwAUX/OTHcCRAlaegatqPeBqfYbwV33/C2UCtBOKs4LRIOWELbTlX7m
         l8Wa7n6wvaXPy0qEZ7pDia9bo/S90+yJGHaT9tkkeyUzG4fYshzvmD4XEof57ECODpCh
         YdzDZt+FQXqwyDPyogJpD5L4Df/0QuVB6qjdpbLuxDWQSaD+BKcHz8RzU546gCCozgkN
         Ap6aCoJPsLw46ahsuqKNTKsnP1jyfREKpVuiNCC6CPz/aFtqcWcYdwsK1tghUH1bf0Oo
         Ns3Lo7c6bqQCK9/PcBG4G0vn7jtzZaRli7sqU13yZgtKu6c5cosjeNiuRf7Yoqqo8o1P
         Bmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737039233; x=1737644033;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+40RmltfMANyPY+1QTgar9RnRnjYDGniubr9OVcwfG4=;
        b=QFp2Ldpd9v6/M0LL7i2Y3aDzjIUUlajnUIz0xVci7P8EmpKxzSrmFNWDmvAHGh88gJ
         55fl6+420RksQU/6LYWz+FBWXgApSm7rkmIUiLTLuhhytsSgRZ81Gt2vgUu/4iP/Dx/g
         mWTRuPACvqOl8rJzt/1Mdhn1NR0kzXoPRNW5lsmvWojADbpl1eplUQ21b3U6/jYuxy3S
         rrFqgiRdVULYI5E1c9Ehi45jaz+lQnrxMzCCYGhzml/FH+zibzLu8imRJfr1G3NCmCIX
         eUnAeri46TsbmFmF0mTBWfUDsaoTbTj9/SCooXJRakbc8RD5L9CD2l3kIKjD0ZcOmXRM
         cJ4w==
X-Forwarded-Encrypted: i=1; AJvYcCVlHDkDHIDBvtRpqWlEoSffNoKP66L3SSdDBWSuLFhIeHyM7hEA43t/+fjB1L5WzjGZmTy6i2JYdsyF/uu4ETJ1@lists.infradead.org
X-Gm-Message-State: AOJu0YwO3D//ndbLF6USwJ5tdEao9EMaXcAdbFG/+0MIMQ0XknrUeozX
	DvA0n7ACEWHxWs/jg1btso15xfxJoAI67jRpNDyz17V8SX0m7XSgnjGX2UuqdHA=
X-Gm-Gg: ASbGncv6ymrKpIwtl1idjw5cYMIDThNlGyRArNvtFJVy8NGqAOnT5z0q6t1NRW46c99
	3sCwOVyuZgqFnN4Vn5f+QHwf29Ja1SEAAZhjYajsECxjxghq1QL8uJ2a/tj8wpgy3JPEQICLBAJ
	jccEtE4CCPkBT2QhtznOKqzlkf8zEsyD4BU177bSe230Te/7rfMGaBB+t1ztaFtezwd2u6rIIlX
	t7vAXTBp6G6M2XOIET5mCZulTNBossfNhBwkZ4WJ+SvOxFW1KwutmMj0I0=
X-Google-Smtp-Source: AGHT+IE3zET7LUBf5Xl5nUv66mL3sWpnOxRP3nAF8WgDEzvt7rB31XYs3LBWYqwaS9CKz65z3GQHAw==
X-Received: by 2002:a05:6000:4612:b0:38a:39ad:3e2f with SMTP id ffacd0b85a97d-38a872cb1e1mr29373964f8f.2.1737039233420;
        Thu, 16 Jan 2025 06:53:53 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b5asm74199f8f.21.2025.01.16.06.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:53:53 -0800 (PST)
Message-ID: <3be2a6e263f127bbc3331b6aeb533fc0ba636772.camel@linaro.org>
Subject: Re: [PATCH v3 0/4] Google Pixel 6 (simple) framebuffer support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, 	devicetree@vger.kernel.org, Alim Akhtar
 <alim.akhtar@samsung.com>
Date: Thu, 16 Jan 2025 14:53:46 +0000
In-Reply-To: <173703609099.1976411.4033971019635742956.robh@kernel.org>
References: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
	 <173703609099.1976411.4033971019635742956.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_065355_119336_76AC52E9 
X-CRM114-Status: GOOD (  42.25  )
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

On Thu, 2025-01-16 at 08:02 -0600, Rob Herring (Arm) wrote:
>=20
> On Wed, 15 Jan 2025 16:11:08 +0000, Andr=C3=A9 Draszik wrote:
> > Hi,
> >=20
> > This series enables simple framebuffer support on Google Pixel 6 and
> > Pixel 6 Pro.
> >=20
> > Even if simple-framebuffer is deprecated and DRM should be used
> > instead, having it available in DT is beneficial for several reasons at
> > this point in time (the phone uses an OLED display):
> > * energy consumption goes down significantly, as it changes from white
> > =C2=A0 (as left by bootloader) to black (linux console), and we general=
ly
> > =C2=A0 don't run out of battery anymore when plugged into a USB port
> > * less of a burn-in effect I assume
> > * phone stays cooler due to reduced energy consumption by display
> >=20
> > Since Pixel 6 and Pixel 6 Pro use a different resolution display, this
> > is the time to separate them into their respective DTs, and provide one
> > for each of them. There are other differences between the two, like
> > battery design capacity, but they don't matter at this stage due to
> > incomplete upstream support.
> >=20
> > * dependency note *
> >=20
> > None (anymore) - earlier versions of this series had dependencies, but
> > those are all part of linux-next already, so none remain.
> >=20
> > * dependency note end *
> >=20
> > For those who want to try this out:
> > The stock bootloader disables the decon hardware trigger before jumping
> > to Linux, preventing framebuffer updates from reaching the display. We
> > have added a work-around in our Yocto BSP layer for the time being
> > (until a proper display exists upstream). An alternative might be to
> > port and use uniLoader from https://github.com/ivoszbg/uniLoader, as
> > seems to be done for some other Exynos platforms.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > Changes in v3:
> > - back to using separate DTBs for Pixel 6 and Pixel 6 Pro (Krzysztof)
> > - update name of common dtsi file (Krzysztof)
> > - use 'memory-region' property from the start in patch 2, don't
> > =C2=A0 introduce it as change in patch 3 (Krzysztof)
> > - Link to v2: https://lore.kernel.org/r/20241220-gs101-simplefb-v2-0-c1=
0a8f9e490b@linaro.org
> > =C2=A0 and https://lore.kernel.org/r/20241220-gs101-simplefb-oriole-v2-=
1-df60e566932a@linaro.org
> >=20
> > Changes in v2:
> > - We now have a generic gs101-based Pixel board DT, which can work on
> > =C2=A0 any Pixel 6 / 6 Pro / 6a
> > - Pixel 6 (Pro) are overlays onto that one.
> > =C2=A0 This has the advantage that all boards can be supported without
> > =C2=A0 having to have a full copy of the DT for each of them. We still
> > =C2=A0 instruct kbuild to create merged DTBs (in addition to the DTBOs)=
 so
> > =C2=A0 that existing scripts can keep working while giving the option t=
o
> > =C2=A0 just apply the overlay before boot (e.g. by the bootloader).
> > - The binding has been updated according to the above points
> > - I've changed the simple-framebuffer node to specify the memory via
> > =C2=A0 memory-region instead of reg, as that avoids unnecessary duplica=
tion
> > =C2=A0 (of the size), and it avoids having to specify #address-cells
> > =C2=A0 and #size-cells in the chosen node (and duplicating this in the
> > =C2=A0 DTSO), which is otherwise necessary to keep dt_binding_check hap=
py
> > =C2=A0 and DT validation working in general.
> > - sort overriding/extending nodes ordered by label name (Krzysztof)
> > - format patches with diff.renames=3Dcopies (Krzysztof)
> > - dependencies have been updated, see below
> > - Link to v1: https://lore.kernel.org/r/20241216-gs101-simplefb-v1-0-8c=
cad1830281@linaro.org
> >=20
> > ---
> > Andr=C3=A9 Draszik (4):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: arm: google: add gs101-rave=
n
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: exynos: gs101-oriole: config=
ure simple-framebuffer
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: exynos: gs101-oriole: move c=
ommon Pixel6 & 6Pro parts into a .dtsi
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: exynos: gs101-raven: add new=
 board file
> >=20
> > =C2=A0Documentation/devicetree/bindings/arm/google.yaml=C2=A0 |=C2=A0=
=C2=A0 3 +-
> > =C2=A0arch/arm64/boot/dts/exynos/google/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 267 +-------=
-------------
> > =C2=A0.../{gs101-oriole.dts =3D> gs101-pixel-common.dtsi}=C2=A0 |=C2=A0=
 22 +-
> > =C2=A0arch/arm64/boot/dts/exynos/google/gs101-raven.dts=C2=A0 |=C2=A0 2=
9 +++
> > =C2=A05 files changed, 58 insertions(+), 264 deletions(-)
> > ---
> > base-commit: 4e16367cfe0ce395f29d0482b78970cce8e1db73
> > change-id: 20241216-gs101-simplefb-8aae80278ed7
> >=20
> > Best regards,
> > --
> > Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
> =C2=A0 pip3 install dtschema --upgrade
>=20
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/exynos/=
' for 20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org:
>=20
> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: phy@11100000: 'orienta=
tion-switch' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/phy/samsung,usb3-drd-phy.=
yaml#

These are emitted because
https://lore.kernel.org/all/20241206-gs101-phy-lanes-orientation-phy-v4-0-f=
5961268b149@linaro.org/
hasn't been merged yet.

Cheers,
Andre'


