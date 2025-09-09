Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EF8CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ry5FSpI7dPZc6Kq1cRRqL+tbhUwVxII5JV+3rpol5sI=; b=GxWF9SkMfXGO6xNt5jcErSLCAc
	EcZQiQ1T2T01BGUkzALX0Sag4w94/Z+hYjzDKLd2fHQyxbzJjIePqokmM8/X9uDvSH2y5AkDKtEw1
	SF4o6prYte4rETR349RTF0gAsWM+l0DBZiiYUjb+mBIxC4BuvrfZMLI+xgIIuS5ILa+OdOh25JJqo
	lZ8UhHvhMa6ireqC+p2PM2OTerhSr75E+cPKIUPBh4W6lbpDgXW3bQQqH7le4vvhE34ojLOc2dDuV
	5Q5DfDaFpgtjoiJoDkVy2QLHAJ3Jm8YYZGcdqXQVhPx7xke18wes2nyYdRlTD6heYY/ndOk4W4Qlp
	X2SHr/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2LB-00000009CyB-2Nzc;
	Tue, 09 Sep 2025 17:41:13 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2L8-00000009Cwt-2Yck
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 17:41:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso3746410f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757439668; x=1758044468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ry5FSpI7dPZc6Kq1cRRqL+tbhUwVxII5JV+3rpol5sI=;
        b=CH5y5PwjjzlI1y5kDOZPsZujCclIAFk0DQ5AJpHTauMijfSJWH2ft2+j4lWXPAsxxb
         dGtweB5VrXo1ibdbS0UwPC/A7V1oBzNUa+tYH2vVfCMBYFJTuJxEKZecokEa6u5fJv2i
         VoXvCrtuRL7dtWXV30o+RRyYBeVW+80MMLw4Mlce7wSMFR7O3lcceD4yYIOC7F8O9TQK
         b2ofo+LHdaajg2n8XIkr0IcX9/25LsHkKmx1MXrFuIxoE0+7KODrZZ9aVVY6k5OyIhmT
         XB46SqB8oMDtWw10V/af1uEQofu2XvwtFuh6p9pZiyiPnZLyvLPvKfOr+tclfY2CuwKc
         8XFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757439668; x=1758044468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ry5FSpI7dPZc6Kq1cRRqL+tbhUwVxII5JV+3rpol5sI=;
        b=dTQgjk+0HdHEvR5bHkV3QEIcSsZnv7k8AewlqrJ403NI6OLLX85gYO3d2DrlAYeETe
         NJO1u36xY2bMKJncClyWgNf8VUr97PwJWAqlaTkqGaZkqGQSUbFuSYAowIoDHWmU6N4R
         8tp4TwK41KQpFOnQGQI9E93mmJ8jWEghQEFqaYtAhVhcxO3MEEGid1SUBYzYywsnDPcz
         xH1/b/YzfxMaCNEChMNfkh7ixI5nWv03KFGLadUKzli+cnlFVhgzwhKAlC0vwGaq97DV
         40y9MPDy4IryR48h3CtmUjjNErw8N+xheRI/U11GpMvNorwuLB5CwfuROpG0ceRNvIQP
         Lzzg==
X-Forwarded-Encrypted: i=1; AJvYcCUPD30YuyWejnUU4Wd4ZGP0SiHo91tNY9z858mAzvPm9OTLwE4tIjqMXpig4lLrXePJYSNyU7tjgssn9QT8AVip@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr6ToOVZR9j50igKVonTEuc5PlnNHh7LY0NSXXoIva4sMo/0ER
	5N1WVdcuQm0MK2dKovcn9igqNqJOP6MoQXpGjsEClGz0aSK4cuPaGRgQ
X-Gm-Gg: ASbGncteq6hvf5Hm0YzebRoC8f/Z8ezAcqe9MpyF51j8kkvKkqLJlAz8G6gQe0TDN8f
	yzyFtCG+6zhi+B8lq29LVehgGnQtiEFqCuidzt1i61lIgJF4FqrBl/h3vtTVSh9IF6dWu45UtDi
	W2nh74gAhIaNUyg5ghomS9MMAon8ya+pWaiWZPi5ykOlafquEslaRlNLsJCqSextzrMKgEO3yQy
	UidPvrSnTKnUXZK13WP7bmhkn6WqDdaiaFU46MwWrNByrW2i52MfH5cO09HFOa5svAn24xHywAf
	izGK4zwsIwYm6D6xYenw3/pFRJJv8m1ktFvOGgPZgyqlU8WcffLFJCchtz+70dJUR/WESXHOVbZ
	Pj2DRpLcHwIDNkgja9lSjWqDEppKVVRAsFfkdAtlIT50Zv+TkNSPXa2LGJ5xQ/nlVBMzbNHgYQ3
	2jOsXJLM3NzHOWTGzxNN8=
X-Google-Smtp-Source: AGHT+IG2uQ4FJ9P3y+p4jrZc5L4f0i9TvG505+l+khrDgQ8Fx5vRm9E1UHocXbYiO2BBq31vpy9atw==
X-Received: by 2002:a05:6000:2383:b0:3e7:438e:cddb with SMTP id ffacd0b85a97d-3e7438ed1c0mr10407637f8f.45.1757439668124;
        Tue, 09 Sep 2025 10:41:08 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm3366103f8f.60.2025.09.09.10.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 10:41:07 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: sun6i-rtc: Add A523 specifics
Date: Tue, 09 Sep 2025 19:41:06 +0200
Message-ID: <6189783.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20250909170947.2221611-1-wens@kernel.org>
References: <20250909170947.2221611-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_104110_670305_61769958 
X-CRM114-Status: GOOD (  18.65  )
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

Dne torek, 9. september 2025 ob 19:09:47 Srednjeevropski poletni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A523's RTC block is backward compatible with the R329's, but it also
> has a calibration function for its internal oscillator, which would
> allow it to provide a clock rate closer to the desired 32.768 KHz. This
> is useful on the Radxa Cubie A5E, which does not have an external 32.768
> KHz crystal.
>=20
> Add new compatible-specific data for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/=
ccu-sun6i-rtc.c
> index 0536e880b80f..f6bfeba009e8 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> @@ -325,6 +325,13 @@ static const struct sun6i_rtc_match_data sun50i_r329=
_rtc_ccu_data =3D {
>  	.osc32k_fanout_nparents	=3D ARRAY_SIZE(sun50i_r329_osc32k_fanout_parent=
s),
>  };
> =20
> +static const struct sun6i_rtc_match_data sun55i_a523_rtc_ccu_data =3D {
> +	.have_ext_osc32k	=3D true,
> +	.have_iosc_calibration	=3D true,
> +	.osc32k_fanout_parents	=3D sun50i_r329_osc32k_fanout_parents,
> +	.osc32k_fanout_nparents	=3D ARRAY_SIZE(sun50i_r329_osc32k_fanout_parent=
s),
> +};
> +
>  static const struct of_device_id sun6i_rtc_ccu_match[] =3D {
>  	{
>  		.compatible	=3D "allwinner,sun50i-h616-rtc",
> @@ -334,6 +341,10 @@ static const struct of_device_id sun6i_rtc_ccu_match=
[] =3D {
>  		.compatible	=3D "allwinner,sun50i-r329-rtc",
>  		.data		=3D &sun50i_r329_rtc_ccu_data,
>  	},
> +	{
> +		.compatible	=3D "allwinner,sun55i-a523-rtc",
> +		.data		=3D &sun55i_a523_rtc_ccu_data,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
>=20





