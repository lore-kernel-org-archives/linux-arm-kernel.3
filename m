Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B949C624D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSJS2GkYexnr2R3qwinnT+ROgZLneAGoFNuJa+6p93s=; b=mQDyJH8SUUvjSur1JhtZq/DbjN
	pXF10Cvw909edqkRoEvkSdgts7jfc3800uqmXfZLwe/EX3jChRNqZRHP4bn0CYuBLny0/QLnHoh7U
	SeH5EqFE3Z/WDUVQnVvDO9ZFKFOZDsx+iyQfMZ88SNG99SJP2oYYzRgxOqmrIt6ZCH3chWlP2ptDn
	KqVrlXyYZCgs4aTNoj+COqlPldFebITKjIlZCqHezeuewdsUjvQG4rCdOZKRIhuvGO6wHuimMvYCt
	U7hzvLODbxARgZXddfPDEZ1ERsG6K/YvODVCtLV+DHHqoA1Ig5JUT/5nOrmGov1OEzDUxkwFu888P
	DYGCV2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu8bh-0000000GhAW-1Kmn;
	Sun, 22 Feb 2026 12:30:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu8bd-0000000Gh9l-43N4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 12:30:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso39283655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 04:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771763435; x=1772368235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSJS2GkYexnr2R3qwinnT+ROgZLneAGoFNuJa+6p93s=;
        b=kZiREeJvKt9QJUAosEAtF80fBget1+sHvv4Jlf2RkT7JYcWbNyzKnakyN7gA3oobuV
         GRXnvUHeSNVOseCt2vBAnAHFmX3ebFNYfSzBwZTLdeFeXVEr0qo5ot3FZ1UBj5LkJKMi
         75JGJIfpc4fyyCk7pVfhlFTgCV+z//p8SfyKwmFix+57w0cl6Xuq/5DYeb74CRPjcsPi
         Vv82hJpMiiGz7r5D6EnIL/Es0Ot59VMl8euoifppIP/lEWBfCQtgbrxPECKMSAbMgfFY
         H81wqOdK3dAQhp0SLpaOR+RjzmTp29NsjdXPj6r/7tQ/UZzFkS5+OjZBYQQGcWE1Ovx5
         AZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771763435; x=1772368235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSJS2GkYexnr2R3qwinnT+ROgZLneAGoFNuJa+6p93s=;
        b=LMVsnPUpVsdRB+S0s364RTRHFeRUqQe918iSl0ylYwjBDRaIkI1u4Ap45B9c34VYHg
         yOIzwt6YUv9J/Ui1o9+XysiPeJ7xpbOOZwClUEoCZZbCsGj5nK+PAWzR3h3CwTiNz949
         AFjD/W7P0lhIQRdcGhr7sSjJ+tD4Sj/XBD+Frip7j4vFS4O99VcFUcjKLLJstxzxSsEP
         kkyCZzkYgWnFhBuh4Se0eqatnZjbTyBT5Ic77RYhvs5Tha3GHNxZUeaNbYYVCD0epU6B
         anUPAlni9dzNES3pXgevbitqFFWk96y4L7VTCrSUdiNJoedQI4tkLxQHgJRBzcH51BGx
         ICnw==
X-Forwarded-Encrypted: i=1; AJvYcCXe0EUrKqKuiQ18CpJm2v3hE6Y9VlVqw0ZK1iwGh9EEuRlBGf0ADFzvynwiwnGrDG/DGWZcYufvXD91sHufcyKG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/LODMfe1mqVGWPNexyIWrr8c2EKWJ7mIvPuK883hthVfWokNt
	CN8insL2etWh5AvkEsd1mAyXzfjY/DeNHTZRxyHta3oW1zge0azzmPky
X-Gm-Gg: AZuq6aLjhjLo5jFVx+oAXai9H0OHeHoVf9Rl0ejLmIIEW/i66kLmdI6xMVBqCIbUlGY
	9oEMU7OT+Xr5uuhlH57yZCUThWOhWDyWHE++LUROQ4yDYhbt/eN/30KCvsMq9hOX3rEUoYe8U9o
	x1ztskR3lOpSNOfNrRHt+Ps4cZXKxXsHNdR62/jZsOj8SDb0iG3QPaqdPrrCArnWYtnSTGdIHJq
	g25YfrgJ0RMiKkVB6AUssPoffYH7nqZ780JvF4lE/b1wxJoZmon4C+JuGFsqJhMOWezzy94aJ1u
	ODtW3PbZZxrNczQAa8SzyUl/vN9r6EmmT7kRIDAPlNk98hULzOR6vzDL1rX/m6X+1Gq0ympFxop
	eNlgXySGHT8u+WCRQpbosSxPyxCSD+DPBC0mBjOjPsFQMEtR31qHhaMXGywzUNIugEKKpmpa89S
	g13Jzy1ediRm3rdeGMSwW3CSyelehlWsp78/PC3E4CEgliS4As8gnVdpcQtr4XQLcfCqzFK0BXl
	CziA7cMtEs0y6shzQ==
X-Received: by 2002:a05:600c:8183:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-483a962e09fmr77433955e9.21.1771763435348;
        Sun, 22 Feb 2026 04:30:35 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dd3391sm124921405e9.1.2026.02.22.04.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 04:30:34 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Aleksandr Shubin <privatesub2@gmail.com>
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
 Lukas Schmid <lukas.schmid@netcube.li>, Cheo Fusi <fusibrandon13@gmail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Sun, 22 Feb 2026 13:30:32 +0100
Message-ID: <2265500.irdbgypaU6@jernej-laptop>
In-Reply-To: <20260221183609.95403-4-privatesub2@gmail.com>
References: <20260221183609.95403-1-privatesub2@gmail.com>
 <20260221183609.95403-4-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_043038_056339_B61B2055 
X-CRM114-Status: GOOD (  14.53  )
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

Dne sobota, 21. februar 2026 ob 19:35:53 Srednjeevropski standardni =C4=8Da=
s je Aleksandr Shubin napisal(a):
> D1 and T113s contain a pwm controller with 8 channels.
> This controller is supported by the sun8i-pwm driver.
>=20
> Add a device tree node for it.
>=20
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 63e252b44973..8e38a0d95f5a 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -193,6 +193,19 @@ uart3_pb_pins: uart3-pb-pins {
>  			};
>  		};
> =20
> +		pwm: pwm@2000c00 {
> +			compatible =3D "allwinner,sun20i-d1-pwm";
> +			reg =3D <0x02000c00 0x400>;
> +			clocks =3D <&ccu CLK_BUS_PWM>,
> +				 <&dcxo>,
> +				 <&ccu CLK_APB0>;
> +			clock-names =3D "bus", "hosc", "apb";
> +			resets =3D <&ccu RST_BUS_PWM>;
> +			status =3D "disabled";

Move status at the bottom.

> +			#pwm-cells =3D <0x3>;

Just use decimal format.

Best regards,
Jernej

> +			allwinner,npwms =3D <8>;
> +		};
> +
>  		ccu: clock-controller@2001000 {
>  			compatible =3D "allwinner,sun20i-d1-ccu";
>  			reg =3D <0x2001000 0x1000>;
>=20





