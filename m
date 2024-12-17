Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B17E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 08:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGp2naDju3CENf7tcYGJw5g9MBEf4TS9qtH9hPAoTWM=; b=spkcER3L9t9vzfTey7jD2wpzYZ
	8/bHbJ4jx45QLWqPVQvHFPzqSPamDR6/Pi0dhl62hlV7nqttvM5C6+TPzLvFsiGsj7TUE0afkwXIS
	OAfv4fpLwVWUMxzuveFpoeCUX4PqD7YOFpu7uE3iYSipdnwq5n4Y6QuI2kXgoLxoS5sUVNFAm+QQt
	KOtW71b9me/ztKz7bgGnGvy0InqbDfUWyjh8Dan61lY+iaBAmZx0RW5bmfnnSx1tnezDykCV4GVeY
	z+PmxKHF1mK2HJP9jVeTsQPLho2ceYm8wOGeg1oZJoU0CDe2JU5zgdMWPS6D1NcuYSq4rfhZ/Jf2p
	PwIO7pQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNT4k-0000000Cj3F-3xpT;
	Tue, 17 Dec 2024 08:37:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNT3T-0000000Ciob-3G6d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:35:48 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38634c35129so3853151f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734424546; x=1735029346; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oGp2naDju3CENf7tcYGJw5g9MBEf4TS9qtH9hPAoTWM=;
        b=EkojYbeLzundyvdksOr+ubv4AJukYKw8o6AsvFqtI69tCylOtyzHvVFMTxN9b1Y3B+
         kT4kLMrptQ5vDoBHg2G7Xx69V7QjgiXeySm3R0+pe9p0eSRJze7zLIi+5LF66XGASA07
         EzJCcabyosjR7ImZRLmuKay6jBx8dzQRHFLvZ4b/cl+yPGU/utrc20m9u0H+6RV8IobT
         LUqM1eI/UkGlxChHILAP2QC5+nX9ZtD753e4rC1KdZLKxlUBlEyMnW83m6xmBBpGvwjk
         kEW3Rqi8HRKIOXE41g183XHjZWH7S5uNVLS7ETveAWzJa/NpVjMxUS5gzQTg/nRIdKfF
         rmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734424546; x=1735029346;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGp2naDju3CENf7tcYGJw5g9MBEf4TS9qtH9hPAoTWM=;
        b=eGnm76x6oQL7d9VMurTqv+IOI6bdhzP6pw5om3Vg1f6DQ5aCmUAgwCuW6aExwfYpzy
         u3myNjoixvHYivbRabpJgvTLBlpgXeG6KDVfJ6TRy3uxD9AblwhAQ+CSaJBvC7ezTmML
         st4LiQHgV8BzHjXytV641OgjbN/YKvX3TqN9e2zaBTRsFbbm3TgpvUsIPyjeNckdUBRv
         lH00QIIt8odr9ndOaC7vvFyFcpm+jfias+iDgc0tmboseXTUkFGLP3ggK+kjsIGZmd6c
         31HAkA4HQmkQm49s2ZVDMzyYkXf1uEH3JV4K+NzBUq9wEW3Up3qUlsttCG9IgNuZQs4n
         trVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdhj3nX8aB0lLaC2ls6GBEeWKXrx6nZZodCSRn7j9RNZJ4fJmJ9luue4rpxreLdx0zlT1AFJcmgdQZ1UrQaimL@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq07WBHtilxfNsfE/J/QgP7XsWgHpr7yAiQta2iADjmo6Yxyt1
	FWq7ccDI0mSm7pQRPB0eVKH++4/zO8IBaToltJVK9DeM7lrVkHVe8cqVpox8xNc=
X-Gm-Gg: ASbGncuZ6DiOoGfSDWQXr7hee8/r68JqfCMXwRPuVouvTYBQa11rO5gyoSs1sMOnD9a
	RWkGaLEAalrQlg2xbfQ6MewtB5KVKClwnW3ymrh3p+siUAV/sTiuwhUfog+ib8mSAvpgdLLXJgs
	z7ZbCpi7PLqf73llh3lmjpy5i6SiV6SFQs2ZG+hG5dWew/aYwSGOLoL8amoka1b0pIFtrrsc186
	KQydl2YXaDLk3ERPSj0LNgkNrB3llSug8T1xwXxovV4kSPa7w+ViKQL4o35
X-Google-Smtp-Source: AGHT+IHmaVzA+YB5mwrP2DxlfyoFUMTookYYnkdc4IP1vKUVoB3zOMtorvgOX4VjroHrHa2BsMY/HA==
X-Received: by 2002:a05:6000:156d:b0:385:f16d:48b4 with SMTP id ffacd0b85a97d-3888e0b994fmr12286812f8f.40.1734424546079;
        Tue, 17 Dec 2024 00:35:46 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8016083sm10393582f8f.31.2024.12.17.00.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 00:35:45 -0800 (PST)
Message-ID: <239cf14ad538285cea2f6ccdf2bd8fbdd2180bbc.camel@linaro.org>
Subject: Re: [PATCH 4/4] arm64: dts: exynos: gs101-raven: add new board file
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>,
 kernel-team@android.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
Date: Tue, 17 Dec 2024 08:35:44 +0000
In-Reply-To: <2wyjctwn443oxl633qwxsxmyzqhinssrkoafgqhcc34tqgwnh5@ymrr57jxdnl6>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
	 <20241216-gs101-simplefb-v1-4-8ccad1830281@linaro.org>
	 <2wyjctwn443oxl633qwxsxmyzqhinssrkoafgqhcc34tqgwnh5@ymrr57jxdnl6>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_003547_811757_FC4C133E 
X-CRM114-Status: GOOD (  20.67  )
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

On Tue, 2024-12-17 at 08:39 +0100, Krzysztof Kozlowski wrote:
> On Mon, Dec 16, 2024 at 01:06:29PM +0000, Andr=C3=A9 Draszik wrote:
> > Raven is Google's code name for Pixel 6 Pro. Similar to Pixel 6
> > (Oriole), this is also based around its Tensor gs101 SoC.
> >=20
> > For now, the relevant difference here is the display resolution:
> > 1440 x 3120 instead of 1080 x 2400.
> >=20
> > Create a new board file to reflect this difference.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > Note: MAINTAINERS doesn't need updating, it covers this whole directory
> > ---
> > =C2=A0arch/arm64/boot/dts/exynos/google/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0arch/arm64/boot/dts/exynos/google/gs101-raven.dts | 27 ++++++++++=
+++++++++++++
> > =C2=A02 files changed, 28 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/bo=
ot/dts/exynos/google/Makefile
> > index 0a6d5e1fe4ee..7385f82b03c9 100644
> > --- a/arch/arm64/boot/dts/exynos/google/Makefile
> > +++ b/arch/arm64/boot/dts/exynos/google/Makefile
> > @@ -2,3 +2,4 @@
> > =C2=A0
> > =C2=A0dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
> > =C2=A0	gs101-oriole.dtb \
> > +	gs101-raven.dtb
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/a=
rm64/boot/dts/exynos/google/gs101-raven.dts
> > new file mode 100644
> > index 000000000000..75fd34797fa9
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
> > @@ -0,0 +1,27 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Raven Device Tree
> > + *
> > + * Copyright 2021-2023 Google LLC
> > + * Copyright 2023-2024 Linaro Ltd
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "gs101-raviole.dtsi"
> > +
> > +/ {
> > +	model =3D "Raven";
> > +	compatible =3D "google,gs101-raven", "google,gs101";
> > +};
> > +
> > +&framebuffer0 {
> > +	reg =3D <0x0 0xfac00000 (1440 * 3120 * 4)>;
> > +	width =3D <1440>;
> > +	height =3D <3120>;
> > +	stride =3D <(1440 * 4)>;
> > +};
> > +
> > +&cont_splash_mem {
>=20
> Keep overriding/extending nodes ordered by label name.

OK - I had kept the original order (from dtsi), but will change.

Cheers,
Andre'


