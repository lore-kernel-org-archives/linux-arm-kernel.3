Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F407E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 04:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=piW9kHZgsyQb9cy9HU5rDPdSyIGIWO93TJJ1y0kDyvc=; b=uvDQ3Q4ZVTlp67
	ALOetNrLmSY7broV8I7OLTWntGsv0zeX09Uj7Amb/dSFfClYrtijXHnkxA6tTEdHKwQFXWcLpvOsF
	z0Agux/KUwZQuL4KgIQCkCqOg9blG5jg8hFDkNCNp7G9p3y1Ykr/pWh2n72/mcoPeHeNi/fs8D5wg
	0uqDcjykFcBH89YCBk9M1Gzv5Eg4YWqJ7/qI90wKeNv8DK0Rtk2QY/esfP9BzGN7ihdx03oVJenE8
	haUlRhNdzTdbJQ4J2NJKhwmF/FEn9zGawxPIQrMTElw/O6y/qOgJAJeK7VQNAokSQhJOZAWHR3j9D
	GT+lJPIIS2eWHRPvWFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ3In-0000000Eimi-2b61;
	Thu, 05 Dec 2024 04:17:21 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ3Hm-0000000Eigr-2Np0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 04:16:19 +0000
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53de556ecdaso517314e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 20:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733372175; x=1733976975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=piW9kHZgsyQb9cy9HU5rDPdSyIGIWO93TJJ1y0kDyvc=;
        b=sUd3DsijoOtFmqNHXXZFPBsZJzPwsHuzcHIEJD4llHNCt+m71ZfullvJxiqovWEffn
         ZshIEo8J1bQE+AR57tUnBgbp7z7tdzGd1JDqichCuBR621sRlxNCc/PKOnxnQ+VVEivY
         AaCrcrWn+L1/VE376YRr7JOzc/45werZAuAE2PYjpkroT/L5vfrziB+Ndxp7KCtEGTiQ
         AjPywnc75LrRt5ZyRhmFMV57cfFZWfBZ8hG2o5OVB1nRsntLpGQyWpJQvpy21ttbmmD5
         F5/O3hanXavmUaEUSvHb1BvbzzTqhxKueblCCtIyrd9vSRGkspMIhAcZ0YCHGWVWhZKZ
         /otA==
X-Forwarded-Encrypted: i=1; AJvYcCW6QDCvC9jUB3LELK4ikqWRgjb+LTocQXpWuipcKyEnUU2Y0rAZbpz/izg6lr8L9aVFdLeJ5vTMVsj/pVZCYxMw@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc9x201cSapk72fDgLHb769JHRhqMGwKwHUzaTwbVusO7/mMzj
	ZVELBG27zADNNHCvROznQJTl4pZWlQFO3rx14EyqURiYWK8sUvZhGUlusivX
X-Gm-Gg: ASbGncvXaH42Is73ERGFK4RboBZMRUZbCLQQxH5Mj0pus/OudqHuMt7mgkHTqnJmzt7
	kzfC/tZOUOHYmExS24VZyCFVW4bkuIb1zWULhNTitardFh3HoDnQ9Zwqfq5CZ4j+DwBG3xkYLy0
	j8UvL+LTK4xK2UP1CqMk9ECM+XT+E4vQHwL0zT0VS/UGbu2B/Po+cjsijTtImhy/sdflyvc8IYH
	Y1+n8dyR12biniMi7C99dLT2ttifZuDkM+0RLDpZmEbVrlLUWhEq2ULeeE7Huq6HQY8pSq/PI7T
	9xr0uNE=
X-Google-Smtp-Source: AGHT+IHQhY1Yfw3DDgF6FtM9oyKkYIGO5ql8Mh3ABZSTdG9LXZ66VpVOR2lG2DiG7ATJeZi5U53CwQ==
X-Received: by 2002:a05:6512:4028:b0:53e:1b94:727d with SMTP id 2adb3069b0e04-53e1b947326mr3991937e87.10.1733372174734;
        Wed, 04 Dec 2024 20:16:14 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22947411sm99093e87.42.2024.12.04.20.16.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 20:16:14 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffd796ba0aso3811821fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 20:16:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtzf3dcKXQ7WuVlTQohTB7rzGjMo59V8fyEBjQmAZfOjC4gFN0BntCXD2gwSQKOB4vyTuQJscH6AIrdeVJqcz9@lists.infradead.org
X-Received: by 2002:a05:651c:1501:b0:300:1889:6340 with SMTP id
 38308e7fff4ca-30018896590mr21262461fa.13.1733372174094; Wed, 04 Dec 2024
 20:16:14 -0800 (PST)
MIME-Version: 1.0
References: <20241203203824.23306-1-simons.philippe@gmail.com>
In-Reply-To: <20241203203824.23306-1-simons.philippe@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 5 Dec 2024 12:16:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Uv3SVQSqox85qt_05aVvX0oCynNRoaN9BA1Nha3eo8w@mail.gmail.com>
Message-ID: <CAGb2v67Uv3SVQSqox85qt_05aVvX0oCynNRoaN9BA1Nha3eo8w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: rg35xx add missing regulator-ramp-delay
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_201618_604784_D99C9304 
X-CRM114-Status: GOOD (  16.55  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Dec 4, 2024 at 4:38=E2=80=AFAM Philippe Simons
<simons.philippe@gmail.com> wrote:
>
> AXP datasheet says that ramp delay is 15.625 us/step,
> which is 10mV in our case.

(CC-ing Mark for knowledge on regulators)

If this is the property of the PMIC, it probably belongs in the driver,
in "regulator_desc.ramp_delay".

The "regulator-ramp-delay" in the DT can be used to override this
if the board has excessive ramp delay due to other design reasons.


ChenYu

> add missing regulator-ramp-delay to dcdc regulators accordingly
>
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> ---
>  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts    | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-20=
24.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> index 80ccab7b5..b6e76a804 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -238,6 +238,7 @@ reg_dcdc1: dcdc1 {
>                                 regulator-always-on;
>                                 regulator-min-microvolt =3D <900000>;
>                                 regulator-max-microvolt =3D <1160000>;
> +                               regulator-ramp-delay =3D <640>;
>                                 regulator-name =3D "vdd-cpu";
>                         };
>
> @@ -245,6 +246,7 @@ reg_dcdc2: dcdc2 {
>                                 regulator-always-on;
>                                 regulator-min-microvolt =3D <940000>;
>                                 regulator-max-microvolt =3D <940000>;
> +                               regulator-ramp-delay =3D <640>;
>                                 regulator-name =3D "vdd-gpu-sys";
>                         };
>
> @@ -252,6 +254,7 @@ reg_dcdc3: dcdc3 {
>                                 regulator-always-on;
>                                 regulator-min-microvolt =3D <1100000>;
>                                 regulator-max-microvolt =3D <1100000>;
> +                               regulator-ramp-delay =3D <640>;
>                                 regulator-name =3D "vdd-dram";
>                         };
>
> --
> 2.47.1
>

