Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386E3E69EA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjRZn9m36UpoMU1YfOpgfL0cMt4DBCuwE5rzTlpXXfM=; b=BTJWKml2w48zducpqwgqt6wvin
	cRj4zqs+rIvOiWm8S3LsXlUQ/EVgdCnJC68r7nCGokZ+/uokaxNEWse38MZdinb75yU8UdqXOgIyM
	X7ht4IvXWieeZIitFWxRdZxFQFl/Cwkhr+DwSeaynx8oG6KCUdbCjb+rB5EOFSKf9Pq3tynHxB3R6
	lc3tVbfT4X6Q1c68BOblk8xDdAAa5hA01WtqhMGq9T576bWMo/L4kcJDQJdMmrojBHbE4r7ibIDxz
	xTnskJ+zQ+x3ywI0pfSzqB0/F10i6d9uOwa/egJMAJh0xFuEJlyrptNB6Asbugc6eTL+mZ/rInKzk
	IU60qDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQbG-00000009AAn-12Q6;
	Tue, 03 Dec 2024 10:57:50 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQKx-000000096ak-45Be
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:41:01 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-385f4a4093eso1323600f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733222458; x=1733827258; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QjRZn9m36UpoMU1YfOpgfL0cMt4DBCuwE5rzTlpXXfM=;
        b=g9l4tO/EevOAWyCHopGnKi4EnyJwcyvd1d+ndqicYLtpKrmnLBQXaqamMA59siOXy+
         kBzrybh5TNn+HgxOsHlefZwQt1uCBcgaLvkbwvYA104w1Yx7/ZGfNT1er2zN3zqQ6Zbk
         HbAbb4enHxN/EnPrlJFTzlTQQJT2AOiWTmQ7VNvKce/dr/1Le5VbKUxEJr6+Eqgk95Ti
         1GvHsGDl8btfm72I+OsJj5IoM5GYBIe/1mxn83wgyPRkjd16NXfkiDxV5BDSdHinhM9G
         fKjAaqq3ruUNoMhPFtHlWoKg4BR+JM3+fyAR4LO2WT/3tPMjKz2hnGTh3vb5W65H10Js
         BD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222458; x=1733827258;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QjRZn9m36UpoMU1YfOpgfL0cMt4DBCuwE5rzTlpXXfM=;
        b=H5vgGBw9Q8FIu1ADvB5rO0P/6YBVckSCyKDVxjaorj1t5oETcldt1VQrwJ/qfJHGlC
         pD2E6i29uJKrMdpan6W1Xp0ruNrECDTzN3Sh4/+rH6H69CU+WC7HWwj/5pGbboRGHq3p
         Ydv0S3qej3SVGnoLgirz+M5Z/RaTwERrcC1j5WWh9c7VWLEJhhsHQIhblk0YcISy7Ea6
         mpRVJv1XL3qELLtCMvbYMdo6YtWmhVuh//xwPM8Eb5QSWY4GupcXtJdlZqhvx6Ma7kDS
         Praez7DKJIl5MjfL+fuURgim402wYB31qSbrUiKDQ8okR5o0chukBsWitsLiNgwnY64i
         kchw==
X-Forwarded-Encrypted: i=1; AJvYcCX9wGyla4fzFNMxH1L7qHsbPf/cs8qZIRU78P4MK1gmO0uLxdIpt70fWRRyV2jiIAqSrKahB8gCCKZBfG2qp10X@lists.infradead.org
X-Gm-Message-State: AOJu0Yymihhu+uObemcb6aeY563/W96c0heceltSNIuvJGItCqE6VZ05
	USed2kqTg/gTCQXymw9DksIT0QU5GG3mnCrRAGnfgG5Xb18QuB94ko6OTsp/evg=
X-Gm-Gg: ASbGncuoSt49/dxRjTLnGpa/+/8u6rRAMUFGM2D/359xvp/HXwig6OzEdZsqkwbbcpN
	hQ4ZRdU5F5hxL+ZKXUalB0K/u9+l//Ar6/Q1QgEdG7zmocG7lEWhTuun9WNTLj76hewbRorOWz3
	heZ731QFAtjEKeIkIUMtCh5aG+/4gU3D+2qUGfIDWMMjuCKnIylI4V858ejmQpVX/jDkYfeu8na
	v7fuuuxredr+NcknQ2YAzihfKchOioUZeSHMR0vXCThOsGDnugZHOI=
X-Google-Smtp-Source: AGHT+IEIQMRTqJYQglD4CUOE9KJIR7TrCdL2VS3fYUudSCxmJ2z/a94ILKbvxrjP3h0f3AYq8lLHfA==
X-Received: by 2002:a5d:5988:0:b0:385:dedb:a12f with SMTP id ffacd0b85a97d-385fd3c6547mr1799666f8f.6.1733222458153;
        Tue, 03 Dec 2024 02:40:58 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ee2c7559sm6885746f8f.12.2024.12.03.02.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 02:40:57 -0800 (PST)
Message-ID: <30b0995903fb7db3f866d1304783d878f563fe2f.camel@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: power: supply: add max77759-fg flavor
 and don't require nvme address
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thomas Antoine <t.antoine@uclouvain.be>, Sebastian Reichel
 <sre@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Dimitri Fedrau
 <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>,  Peter Griffin <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 10:40:56 +0000
In-Reply-To: <575b3275-b2fa-4e5c-bb6b-759394b02e18@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-2-98d2fa7bfe30@uclouvain.be>
	 <e23721ebd766f410103ddfb8705f3d7d6e5ae3e9.camel@linaro.org>
	 <575b3275-b2fa-4e5c-bb6b-759394b02e18@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_024100_011986_E3F9EBF5 
X-CRM114-Status: GOOD (  13.45  )
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

On Tue, 2024-12-03 at 11:23 +0100, Thomas Antoine wrote:
> On 12/3/24 08:12, Andr=C3=A9 Draszik wrote:
> > On Mon, 2024-12-02 at 14:07 +0100, Thomas Antoine via B4 Relay wrote:
> > > From: Thomas Antoine <t.antoine@uclouvain.be>
> > >=20
> > > As the Maxim max77759 fuel gauge has no non-volatile memory slave add=
ress,
> > > make it non-obligatory. Except for this, the max77759 seems to behave=
 the
> > > same as the max1720x.
> >=20
> > What about the battery characterization tables? Aren't they needed for
> > correct reporting?
>=20
> I checked some other patches which added fuel gauge and other bindings an=
d I
> couldn't find such characterization table. Can you point me to an example=
 or
> explain what it should contain if there needs one?

I haven't looked in detail, but there is


https://android.googlesource.com/kernel/google-modules/raviole-device/+/ref=
s/heads/android-gs-raviole-mainline/arch/arm64/boot/dts/google/gs101-oriole=
-battery.dtsi#13
https://android.googlesource.com/kernel/google-modules/raviole-device/+/ref=
s/heads/android-gs-raviole-mainline/arch/arm64/boot/dts/google/gs101-raven-=
battery.dtsi#13

which include
https://android.googlesource.com/kernel/google-modules/raviole-device/+/ref=
s/heads/android-gs-raviole-mainline/arch/arm64/boot/dts/google/gs101-oriole=
-battery-data.dtsi
https://android.googlesource.com/kernel/google-modules/raviole-device/+/ref=
s/heads/android-gs-raviole-mainline/arch/arm64/boot/dts/google/gs101-raven-=
battery-data.dtsi
respectively

Both overlay
https://android.googlesource.com/kernel/google-modules/raviole-device/+/ref=
s/heads/android-gs-raviole-mainline/arch/arm64/boot/dts/google/gs101-raviol=
e-battery.dtsi#177


Cheers,
Andre'


