Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F93C3ABAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2j3vmWcblMpAFi5MSBk2qMdY2/rE/Q+wya2rcoXjQ98=; b=gGf7IlV6AzXFswNAwQITC3h/eD
	BJ16gEP9ZkdH60EdOtMN6tE5VHhJivQ0PqR8/TNl10sRfuP5IhWBJkC3Dh6jIs42gjET7Uw7nYah9
	4vbRFf/khVwVQ2OkPUPniSGFpvaVJR6GQ/K1H8o7kdcRvGxXVFcOdBCJm3fgebCVWVB3vSmZkK8vx
	0KMHxMgGfQHrPyZ0sugJI5dl88WYcOQwqs/S7n0fAQd2P+wFr8veB/x+m5gFSxWQwfDxmmzvztE4/
	cXcBXw9DZgcFuto37Wlm9vN3NglrNlCxg87PwxRjeg0JPIlsBR6777gvUYfdSl2ofkPmJtaJIRY2v
	iZ9s3x7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mnN-0000000A6nb-1QMF;
	Tue, 29 Apr 2025 15:22:53 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mJX-0000000A1Il-0hv5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:52:04 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso9885487a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 07:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745938321; x=1746543121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2j3vmWcblMpAFi5MSBk2qMdY2/rE/Q+wya2rcoXjQ98=;
        b=MyHFeW5TuKahM3lYV3lOeGYtpGFoDAx5lTtvz90QQ2BuU89VI9Qk9c/iRJOg6O95dF
         +LIINRgDyBFw5fbc49S5STxfde6iwa8Da8gYTLUvFBpfiSYmCy5a7A+751ZvQJBKVb5D
         T7xqV3AEsjEAE/ngkGc6Kqfcisa0l+LAX8zS/byJBtES7cR5Hrmo3snBua7WNGGBbmOF
         R01B4YvqkIaE7g9lXHDypwBjYgH1ZaB26FWsR0hjQriwGEc/dQOQdKJhQkQlGsNTZEPm
         C2RYKT/MGkYzOVxM/OiooWRP6aUimRPJRm6DThSvR1lFPoV6k/sQJfFxzQh406Dp5E6c
         mqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938321; x=1746543121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2j3vmWcblMpAFi5MSBk2qMdY2/rE/Q+wya2rcoXjQ98=;
        b=I1JJqcc6jL5hVyZj1LRh2ouXY0Lzbmv3+Xzbxaohma3VL13Jn5XbVdrErxL0FhbgGN
         nIsfQaesQE9UMRV7/L7tRcqfJIu3ua5NhN7drzbeSdi8Ty9buhseR0RBOUmYKrQnA0e3
         Kzzf2IIvYel9rMFjEc3p952Zmo4U6EIuuVXZKlZcWNq5z9UxJdhtvAD/ogcbCHG4Ns/k
         +xK4WCOLQziyyOXHIoe8ORCOovbpm/S2a5WIUnRFStdW7TrWqQezLNzjNAsa19xXKHIG
         hVxPmJ1j0SU7KWMaNiBKy+enK0IzXbQSI1zn+2J6peGvqk2X0DI/OwY/jYY1rBX9u0vf
         hHtA==
X-Forwarded-Encrypted: i=1; AJvYcCVyYDCNT1/d551f8JO2z+ohzzfM7JJnK8gOiGts0K/kTORAhQ+1UiLncbfwaei1+hBtmKtEgcwvGIXuKyNm9jq7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6fryEyRBhXGz86KOzmw8URBTFevNH100jXce7PB8k1GHS3VGn
	E6+z++dfgW3SrBaosrLY01lis1XJw/DlzN01dD+qUIkbw/Qt3UqT
X-Gm-Gg: ASbGncvlo0kF3YhnAzx5LHPJzE/3S9EGa3oTB2B+wio7PGYQv262IgJn3OaxRxQbqbU
	jVDYl8Olior6+KdUizUJudr2T3XAJHL9z6kzcE1CcYx0V8dzgNWUGUm1xf5WVqC5QWxigaFYv7w
	/I5fT5tkLSnlu83ZD0+f78/ATakLj5qR6X5/En1CFxZJY2LsSJTZx1a7M4TKzmhXkHnUl9NZs7Z
	A9pfKgRuw/uBVArgRsouLlz4a+0WgLcYzejbjzVE8ap2kR41HGrKQAS/ZsevdKDOBfG1FhyxkEe
	JxWXDd2RQI7yLzvj5UkRyd0TRdk/kbS0CaT/HX4f5y0NzZ8qlb9cSf15vPxA3VvfSbW3Dki9+4u
	q8aoNrt2T29xlQqaF
X-Google-Smtp-Source: AGHT+IEz06/+DeCVuRvMFYjbMCHdLWSGqTMxg/VP6erFPSJQ+to0uxlq6imsOijDrrRMdG90WDzVxA==
X-Received: by 2002:a05:6402:348f:b0:5f8:2436:1df9 with SMTP id 4fb4d7f45d1cf-5f83afc1b49mr2846758a12.10.1745938321060;
        Tue, 29 Apr 2025 07:52:01 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7038340b7sm7414214a12.79.2025.04.29.07.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:52:00 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org, samuel@sholland.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Date: Tue, 29 Apr 2025 16:51:59 +0200
Message-ID: <5880182.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <34e30bf2-6f80-4c43-9e52-c1ebe0521c43@lunn.ch>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <2219754.irdbgypaU6@jernej-laptop>
 <34e30bf2-6f80-4c43-9e52-c1ebe0521c43@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_075203_204710_780F6415 
X-CRM114-Status: GOOD (  20.52  )
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

Dne ponedeljek, 28. april 2025 ob 14:37:48 Srednjeevropski poletni =C4=8Das=
 je Andrew Lunn napisal(a):
> On Sat, Apr 26, 2025 at 08:00:49PM +0200, Jernej =C5=A0krabec wrote:
> > Dne petek, 25. april 2025 ob 17:34:14 Srednjeevropski poletni =C4=8Das =
je Andrew Lunn napisal(a):
> > > > > +&emac {
> > > > > +	pinctrl-names =3D "default";
> > > > > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > > > > +	phy-mode =3D "rgmii-rxid";
> > > >=20
> > > > So relating to what Andrew said earlier today, should this read rgm=
ii-id
> > > > instead? Since the strap resistors just set some boot-up value, but=
 we
> > > > want the PHY driver to enable both RX and TX delay programmatically?
> > >=20
> > > Yes.
> > >=20
> > > There is a checkpatch.pl patch working its way through the system
> > > which will add warning about any rgmii value other than rgmii-id. Such
> > > values need a comment that the PCB has extra long clock
> > > lines. Hopefully that will make people actually stop and think about
> > > this, rather than just copy broken vendor code.
> >=20
> > I spent quite some time working on ethernet support for this board. Once
> > I've found PHY datasheet, I confirmed that there is added delay. So this
> > particular board needs "rgmii-rxid" mode.
>=20
> There have been numerous discussions about what these rgmii modes
> mean, because DT developers frequently get them wrong.
>=20
> Does the PCB have an extra long clock line in the TX direction? That
> is what rgmii-rxid means, the PCB is providing the TX delay, the
> MAC/PHY pair needs to add the RX delay.

While schematic is accessible, AFAIK PCB/gerbers are not, so I can't really
tell how long it is. But without this extra delay, ethernet doesn't work.

>=20
> Ignore strapping. That is just a power on default which gets over
> ridden once the PHY driver is running.
>=20
> What PHY is this?

Motorcomm YT8531C.

Best regards,
Jernej

>=20
> 	Andrew
>=20





