Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F85CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 08:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d27vDqN+JHw1+uJquBYSsbfwHP1Sqq5k0Pnf9NNAEn8=; b=29DT4Y/wDPlQrrqW1U7z26YaHx
	JqEFrAwh5ABe4MTFMojGCxHWHb22DR4KG+AcaNIhz/D6F2D/KBeOJNaKNi27Vd3zgnMCs/mvlFpLB
	97uAUQcKFst22RVSlIjgbk01D2EyQUElY7Ngs3CAzjQyZJYbXv/jA2vAiIQrW7ms4Ia1Owt5zZG5v
	bzWOeKSe3nUhSWWpfRc1C17JryRh1STs/ToP70SBKDX9Zr6s6T7YmbfGCEgX6cYrMommZOciymZoB
	xFHP0gdr1Thx0P+JYsU7XVHD+i2ZIWpIkxm31K6Ey/7eC6dS2izLm1apdOaExyySQh+wv9+WYFkkC
	Zha1dRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKusu-0000000FiDE-27cu;
	Mon, 17 Nov 2025 08:46:52 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKusr-0000000FiCl-3FJr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 08:46:51 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-429c4c65485so3332801f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 00:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763369207; x=1763974007; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d27vDqN+JHw1+uJquBYSsbfwHP1Sqq5k0Pnf9NNAEn8=;
        b=IGPZ+UCB7nylzNaPmzoBqHbyXwfu0Zno4Dq1JXs9tTnXQRJfmoX2Ry8Fu7UWWLdRf4
         nLGJzWMy0+8idw16lqqCDbSkAUxp55a9nj9c02t1ryJvnmJCJWauAlKht576LtQjhVyD
         iKW9XZOw/sgQxG3ftjYOhkLME07n5K7tlP+vgkPzJvP6scaCuo38rHYVqLNalupXyZrW
         xAjeYglsGKwbzoHBnXkXLdQMf+aXp/akrngqCnruqDLAPH0107euqEXFEhdtjwzmsK0M
         YJIJ6azqYg0qIxDEFfP/MUMED/n29UKc+W55zGhsptlbCQ4ppHtJ7I2yv4/3IpnDUn+1
         bilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763369207; x=1763974007;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d27vDqN+JHw1+uJquBYSsbfwHP1Sqq5k0Pnf9NNAEn8=;
        b=Kd6woNVqd8b8EbgR08OiEohZwbqcedEOB5Zd5L3sCr607t8GpJGx5Of5QhBJDCcGjQ
         sZN2rd3UQWdz6S3BuEkPFCm/IILReOTqjzBj2l7cfp6tKRZ1sN0B56qT2mXS7xDy1Z5U
         Kckdhn5/59uj6R/DlIwBYMNF8aNGd4kenpt1h8ci9ixeHLyIZV/qYHXEYxYBbCsTSXdi
         nKTu5u/dwtRvvMAgm/xcxI0T6ywKGOLeigQp9STXkjDGmVjoMlgghTIdUanJrCip4DYC
         Dmb38jYKAVBE9zXy/LTqAbNqgwxHe5zRO2q9j9WERORte2FgK5zdyWSnsHLSAVbk1FIS
         DnMg==
X-Forwarded-Encrypted: i=1; AJvYcCV7PyHfwhu4oy6rwPkXOzA6iUCS3uf276wlPhoSM4fhZGIsaSmjYmyxZoV+C6vcZ3JySuTIKwhl9u2MBrnfY+In@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7+V3lk598xYhIj02UdONBKDkHlfCdVhkS8+hUHDv+sEUs7T+I
	dtWyrtam8i2OFPcNONMTgZSRzDHnd0+B/DIIesRbNaMY0cnJUBiFcO97IOJke1HpVoE=
X-Gm-Gg: ASbGncsm8KIHRNeiQayNdIoyGcQztQCmlRibsB9V7/zHSC4vU9unh1TYqBVPeg9FXuB
	dKkmixEiQiVRQ5SEFlvKwpsJ5ETArWWba01pJXv8PHRwkHGIbwwo4Z+W2zCBV321IluxYkYJTGW
	O86g7hP150H9/5LFPfXOJc+KIY5LZ+/u79XtOFBd9tW+W1v/2daVruIPKJJLpZe0dbFSFKAp2QP
	rMnP6CuOtSfxzbgQ9sLgWmBk455FewXRCixde+PaVR8ZyhJIT9GxwE3ZucIGBILf4HdUMuujbA3
	DMje7f8Ijf7m81d7NRbJ4N6s5b/SyQDkuFm8ZJp2AnOG8jORosAZK3GrFavkBJ2wqgoqSYVK19s
	cV8PYYEgKWd/nAv9j8zu1FMfcbZxaGjkHTe1Nu38et14/2gB2ZMPER1TkufCkDxUTU1dKy2V+hP
	Ua3m5q/Wyp+Y6l8YvMwR2ec1gQIXFK
X-Google-Smtp-Source: AGHT+IHwkyRbcMxnSU28LuZ9foW7wfrOf8fSpE3f89YPvs1x9ZEE9MUab9lKz3FiPMeNgj6Sk2rsIQ==
X-Received: by 2002:a05:6000:2306:b0:42b:5521:31ad with SMTP id ffacd0b85a97d-42b59384ffemr9496363f8f.49.1763369206970;
        Mon, 17 Nov 2025 00:46:46 -0800 (PST)
Received: from draszik.lan ([212.129.83.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae2dsm25605597f8f.5.2025.11.17.00.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 00:46:46 -0800 (PST)
Message-ID: <5a8b54fe20dca15e08dbe1f91232bddb95484a94.camel@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: gs101-pixel: add all S2MPG1x
 regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Juan Yescas
 <jyescas@google.com>,  Douglas Anderson <dianders@chromium.org>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 17 Nov 2025 08:46:52 +0000
In-Reply-To: <3ddf1b76-8376-4d56-837f-c9b06d04af94@kernel.org>
References: <20251113-s2mpg1x-regulators-dts-v1-1-80a70ef42be1@linaro.org>
	 <3ddf1b76-8376-4d56-837f-c9b06d04af94@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_004649_859406_6979470B 
X-CRM114-Status: GOOD (  13.46  )
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

On Mon, 2025-11-17 at 09:11 +0100, Krzysztof Kozlowski wrote:
> On 13/11/2025 14:31, Andr=C3=A9 Draszik wrote:
> > +			ldo12m {
> > +				regulator-name =3D "vdd_cpucl0_m";
> > +				regulator-min-microvolt =3D <700000>;
> > +				regulator-max-microvolt =3D <1300000>;
> > +				regulator-ramp-delay =3D <6250>;
> > +				regulator-always-on;
> > +				samsung,ext-control =3D <S2MPG10_EXTCTRL_PWREN>;
> > +			};
> > +
> > +			ldo13m {
> > +				regulator-name =3D "vdd_tpu_m";
> > +				regulator-min-microvolt =3D <450000>;
> > +				regulator-max-microvolt =3D <950000>;
> > +				regulator-ramp-delay =3D <12500>;
> > +				regulator-always-on;
> > +				samsung,ext-control =3D <S2MPG10_EXTCTRL_TPU_EN>;
> > +			};
>=20
> Please add here brief comment that ldo14m is to be defined per-board.
> Same for all other cases which are missing from common DTSI.

Sure, can do. I assumed commit message would be enough.

> > +
> > +			ldo15m {
> > +				regulator-name =3D "vdd_slc_m";
> > +				regulator-min-microvolt =3D <450000>;
> > +				regulator-max-microvolt =3D <950000>;
> > +				regulator-ramp-delay =3D <12500>;
> > +				regulator-always-on;
> > +			};
> > +
> > +			ldo16m {
> > +				regulator-name =3D "vdd085_pcie0";
> > +				regulator-min-microvolt =3D <725000>;
> > +				regulator-max-microvolt =3D <1300000>;
> > +			};
> > +
>=20
> ...
>=20
> > ---
> > base-commit: edf57d8dafc63f9298a209e518ea6a2e0df78ed0
> > change-id: 20250603-s2mpg1x-regulators-dts-aea4bde3dff9
> > prerequisite-change-id: 20250603-s2mpg1x-regulators-7a41c8399abf:v4
> > prerequisite-patch-id: 9d4a1e0afe6eb45dcd35a9537b7d5b4e35e801c3
> > prerequisite-patch-id: 928fd84e5f6207a2fd98dd8372a91df0776ecfde
> > prerequisite-patch-id: b87abb6b9a8fc104f0f752bca0e9347d17de72e0
> > prerequisite-patch-id: e053834e5bec411f5c512b63a3528e49aad11ee2
> > prerequisite-patch-id: 4fdd195c0b3fea537144ac8d82bb40a38cbde117
> > prerequisite-patch-id: cc716fef97d6c25c0589d7269b8f34e04ea96216
> > prerequisite-patch-id: 20ff503abaf2fcaef4328e1f8009ed3df242bad3
> > prerequisite-patch-id: a0d80e8f49401dd79a7e4dda2517e00228aa3087
> > prerequisite-patch-id: 2368af876ec7c643d9765d3fb1e9bc4991023a18
> > prerequisite-patch-id: b70d5648790458e72db82e26b180bbd7301469b3
> > prerequisite-patch-id: 92be1aa6f95b2a5795df84e11a602e97a41b2938
> > prerequisite-patch-id: 86625bb109da618cbb8aef07fa717257918077b8
> > prerequisite-patch-id: 2016c6cd5e0d51daddada37232e3b99c8f4ad77b
> > prerequisite-patch-id: d323362e84d3991bd949745579aec34897620321
> > prerequisite-patch-id: b1571de42ac7dcf0fe8ddb77650a656244ff751b
> > prerequisite-patch-id: 44ea2393bc4df716427cbac9b7f080a683ba1c0b
> > prerequisite-patch-id: c968c5b557897767bfc2629de79b1ede8ab48767
> > prerequisite-patch-id: 221800199a94e12e928dc9606c82b6eb33cffa3a
> > prerequisite-patch-id: c76d8055f620e0b5fa81101a31db08fd5a60e773
> > prerequisite-patch-id: be0027a934451be02b1c4653bac8b6bc2ae2bd85
>=20
> This would block this from merging, so then please add RFC prefix. But
> probably these are not actual dependencies, so they should not be here.

I added these to highlight the dependency on the bindings updates, to avoid
validation failures. Looks like the drivers in that series will need some
updates, so bindings will also be delayed.

I'll send v2 of this here once the other series is updated, as I don't
want lingering DT validation warnings :-)

Cheers,
Andre'

