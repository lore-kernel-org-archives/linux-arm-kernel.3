Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5592ACD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 20:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAkY0vj7iSY+sZjzSMZGpI/xkJ9Jb7vUa4k3TiZjewI=; b=tZ87+1mKlgR8wzRXRzgJ0AsNQc
	hmKo/lDnkXmBL5JU3CvM9lFj2JMnkIzpqCDhiWq26P9ncgf7mzTCoONfo5VA58iyoqRytn9cLcGA+
	qQd9O0Wr57NQnIso3clyCLq0MwoFNLFa4RXhpjD5OkD55j2zuUbxNRapJ2IT0PmWhE+ReZYlBBBSn
	k/1UWpsQCqY+nFYfeaL1UNpfX89A+/ngHnIzGQsZiV0JLOXQN4TfIBE1G4sxiB3E3sih/JKUiHl4o
	yT2vXCLNcs/lq1DV31zVBcmfvSuIHVoOVDYfdK7UIFaxwCUvxKvw4YaKyEG/ZTWBvoJUyYMVhwV5A
	GhCfb8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP4DT-0000000Gps5-1ocw;
	Mon, 18 May 2026 20:05:31 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP4DQ-0000000GprS-3M66
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 20:05:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so134143f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 13:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779134727; x=1779739527; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cAkY0vj7iSY+sZjzSMZGpI/xkJ9Jb7vUa4k3TiZjewI=;
        b=PG0V341TTW9LyAj/HL5n4ovUyZN6wrS0NJ7zhtxZENopBimyHV1T/CGyr3ad0vY+Ui
         2KD2Lh+YbRj8h+cJifnj8PJobJGSpCt9zeas79xTPtzb1OG50B5kAhIgu8Nht5dqkWG+
         C3thwBCm29OtOFlhcmGmYljgLhEA2JBEgR4KzR4suHawvLVoNUZ05wfXfz5oUOtKt2ie
         3NPTeOQXlBfkTpKQw5bWZJZleqEYCTm8UjDUqxTNQLzZvAi1xs1agc25dZDDPgNO/AZy
         CSZthTofBoAm0lo19gUoZQolE2fJVHsxZAGyd7NMLzYAVBL+Z9H7o1v2jC/QvHw6ohCG
         zhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779134727; x=1779739527;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAkY0vj7iSY+sZjzSMZGpI/xkJ9Jb7vUa4k3TiZjewI=;
        b=EForA4hBVR+m9VIiEht4Mn35puquLkEHLcftr9cWxZpti9EYs+GpboHGRfJk5O800W
         yLwjYDjRF50G53YB5ek8Y7g9MzxuqDJuIZu5Qk553D7DoS10wAvl9YeDUqjZnbJ3qvce
         pWfImUMP4YM3rTdzvxk94hRO3dzORXn5homCg+QgiPmca9ZZ0Zn8Ix5AhAToZ8EwfAg5
         QLeTqABP5CLvaHSFYesPCo1/Z4rQP7otLTsNHDPazAtlc9e8Mtw4Yxdtcpr5RAyeo+pz
         H4mQzlcV/DUkNqeeT0VzntULYQb1KB5MyAIXyqo+8rMvuBGDHmv6j/SpsgeX7zuS6h0u
         woWA==
X-Forwarded-Encrypted: i=1; AFNElJ/VcaDgdCx9pJZR7cWte6iP2DueyhWeupjK9hK95zQxjpScQ3kXeYg3akswBkOtAabi6BXRkMBB3URLJjdAZ6Az@lists.infradead.org
X-Gm-Message-State: AOJu0YwbwsJnZq7GNRDQj3P36QdYlBKoudd412RvjPz+gcnpCWOekQW4
	r0qS3AcWlYdrHwa7FRRzV+oCwDwkQIolAxwz9cggMBkab1HVLlgsG6sS
X-Gm-Gg: Acq92OHYxqZrIxEWMxQUOS+jSVfQk5lriBeD6FUjJXBrGWtY8egFEXwkz6zl703NsiF
	ROVtN/SaZtyrjofcJ7PUVTU9n4wxQnGlKeKp63HMiYzraM+QxFcG82pjHxWt08xYz43XfbUFBfD
	aZq9zaG9VRo7TjUBJXbEGQPYKQfPqJOJRzWLOCf+b1CPrDb5EzNalCCctqikNG0kVNvjoVqfIpv
	XnW8BDodtcsIFEkBs1FuOowAQzWlYoZ2nh4eSJgZQh60Cz1nOod6C9bI05kdOD3xkbkIPdf4GoG
	7VIlfo74nzqdgYhrNPdMDLf+n8Y51fQisokpFZSL2/puGsr0ujoBCRvokhS6Xy6LrmFx05IaTwC
	bouzv9hU4d8OUWfhGCGW9Eqffm1XDphYgIOUrGyEXIHgU2zDll52EQISH0pIAwYZxhczZMDmTh5
	4Mx1qNR+pYvIabQrySCuQaMHZZJJqjnpiSSEX+ULqqmvyutXerf/MgWW7J1TzFOGXn2myWSjNzs
	VI=
X-Received: by 2002:a5d:584c:0:b0:446:db72:e8ec with SMTP id ffacd0b85a97d-45e5c587281mr26781621f8f.23.1779134726576;
        Mon, 18 May 2026 13:05:26 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm40825454f8f.21.2026.05.18.13.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 13:05:26 -0700 (PDT)
Message-ID: <04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 22:05:25 +0200
In-Reply-To: <agr9m_tidBr6Cu2h@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <agr9m_tidBr6Cu2h@collins>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_130528_853828_01C238BA 
X-CRM114-Status: GOOD (  19.33  )
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

Hi Paul,

thanks for the review!

On Mon, 2026-05-18 at 13:52 +0200, Paul Kocialkowski wrote:
>=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi =
b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > new file mode 100644
> > index 000000000000..65b094f30bf5
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi

[]

> You should add:
>=20
> 	chosen {
> 		stdout-path =3D "serial0:115200n8";
> 	};

I actually have it in .dts, but it's theoretically possible to deploy
the core board in a way that serial0 is *not* a console, so the above
probably will not be valid in all cases in .dtsi.

>=20
>=20
>=20
> > +&reg_dcdc2 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <500000>;
> > +	regulator-max-microvolt =3D <1300000>;
>=20
> Should be:
> 	regulator-min-microvolt =3D <900000>;
> 	regulator-max-microvolt =3D <1300000>;

0.81..1.2v according to A133 Datasheet Revision 1.1 Jul.14, 2020?

>=20
> > +&reg_dcdc4 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <500000>;
> > +	regulator-max-microvolt =3D <1300000>;
> > +	regulator-name =3D "vdd-sys";
>=20
> Should be:
> 	regulator-min-microvolt =3D <810000>;
> 	regulator-max-microvolt =3D <990000>;
> 	regulator-name =3D "vcc-usb-sys";

I'm a bit puzzled here: datasheet says 0.9..1.0v
and it has no "Typ" value, similar to VDD_CPU, but
VDD_SYS is not part of OPP tables, so who is going
to adjust this? Or shall it be just

regulator-min-microvolt =3D <950000>;
regulator-max-microvolt =3D <950000>;

?

>=20
> > +};
> > +
> > +&reg_dcdc5 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <800000>;
> > +	regulator-max-microvolt =3D <1840000>;
> > +	regulator-name =3D "vcc-dram";
>=20
> Should be:
> 	regulator-min-microvolt =3D <1100000>;
> 	regulator-max-microvolt =3D <1100000>;
> 	regulator-name =3D "vcc-dram-2";
>=20
> ALDO2 is the main DRAM supply, this is the second one.

Core schematics mentions 1.1V/1.2/1.35/1.5 on this rail...
Currently U-Boot has CONFIG_AXP_DCDC5_VOLT=3D1100, but potentially
this is adjustable, right? At some point LPDDR4 chips they
are soldering today will be unavailable. And in the current
market it will happen rather sooner than later...

>=20
> > +};
> > +
> > +/* DCDC6 unused */
> > +
> > +&reg_dldo1 {
> > +	regulator-min-microvolt =3D <700000>;
> > +	regulator-max-microvolt =3D <3300000>;
> > +	regulator-enable-ramp-delay =3D <1000>;
>=20
> Should be:
> 	regulator-min-microvolt =3D <1800000>;
> 	regulator-max-microvolt =3D <1800000>;
> 	regulator-name =3D "vcc-pg";

Do suggest to drop vendor's

regulator-enable-ramp-delay =3D <1000>;

in all cases?

> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> > new file mode 100644
> > index 000000000000..ccbca5d0a40c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

[]

> > +	aliases {
> > +		serial0 =3D &uart0;
>=20
> The is best added to the core dtsi.
>=20
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
>=20
> Ditto.

But it only physically materializes in Helperboard, the carrier.
Potentially this one can be left floating or used for something else.

--=20
Alexander Sverdlin.

