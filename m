Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25AEC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZr2FikKI33KDHEnzqoeN/VTnNw+pox/jCxpOuAG6zQ=; b=x4UkXskEj5J3JW4KBLoNC4VpQe
	veTJuZjCSezSHPytcmkrTrRW4M8+dhDta56TxP3vppdjUimRyTDRpGkHfMQOAyp26yMluLVKEsaiy
	p5on30UIPpWrIwdM2br1vbppusWGgG2TcSZSTL3zZ+LqMEHzod6KNOnJFYxwkz2SeSUSWqSJEUlYb
	iA4KNkLtqpPvGyd/XjPyDXOo3VmsMe1TmSDvdfwLI5VbjSyKwzSSPSdMSKAi12Ub1JpSTQmQMr/VN
	+hS2jbckTScDTWV6JVu2r2cmVPDWj9DykDYVZJfk2KcIl65ewUC0pnH/Cz+54VXZuNjfFPqiJoZkm
	FqFhT01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Bw-00000002aGe-1HxQ;
	Mon, 14 Sep 2026 07:33:28 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Bt-00000002aFh-0pZY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:33:26 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485933b2522so1420312f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789371203; x=1789976003; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZr2FikKI33KDHEnzqoeN/VTnNw+pox/jCxpOuAG6zQ=;
        b=e/bZpOdaiQLqSVBaG8IWyYyTWz5SjayhFwRfKIUJnivMDE5Ovtf3KEV127/sRdps5K
         YmsIP/gbc1BnG4ugSdqq1MvxfCvKo4CwNRTFdyfkgAkITluOW6/lrh+d1wXJSOMW1+0+
         OI5aYYtc+/f88pnEx7MA8LraQyXQAEls5Mh4g3s3iObW34g6mxATB3RSmyGnv2HFP0uP
         7vBDNGAx65L92cYFGkNhTwtBabE3op+PLiItOa3Ua9SXWQHe09AJoly0DXONIS3/RxjS
         f08z2xQU/EzW+PM1+rJo+IJ4yGPl38zg1zg7X5gmx8iHnYjQEz5X7ba5wGb401dP00yx
         tJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371203; x=1789976003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZr2FikKI33KDHEnzqoeN/VTnNw+pox/jCxpOuAG6zQ=;
        b=WGAlwrFwZAXALsF7+fNglYmE6LyIET1NDeyx+DASR4GD17J1lD9UhiKaD/7kOzE1zS
         6XPVInRZaeFFQRanOXYUre3PGSPJdbhN1wXZoljs0QssaSuKYQjCULLTKmJ1Dq8gJjL6
         p0n1IFNpYpQ7CiwZ6QPubD3Iibk3/N/lTQ2Q9lf0zV+20IZf+jxjpO9jpqb4XJZEAgOj
         i2ldb1pp5aEPV+pypBS1Jf7FMuogTLnAVsGJKLMYuce7dIX5411p0/8XKVRszQhPGnxV
         cPx5cHsUMPLug61s5nFCMvKHwfF8Bwiw3u4vPiZpfdVFzn4cQBDUZ9rUOe+DpdKIVzDT
         x6gQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhRvikpZX/r9cv1ucw0s9aL2lU20rGUaiKhGBtnR/ZzPze+WTHMv5Xy5zgiU0R35KCHYcAffsD0cqMw5Q5JIru@lists.infradead.org
X-Gm-Message-State: AFuF++lnbaWnG1wpg/JfPzxPRtiwteozurYZpFR7VY6dTShqYtyvSFrH
	53E0044AVoJb7cr+BZKf660qcJcz9nZ68TWmNyb8/jhPohVhgkWk1xGlzc81MZ1CP5s=
X-Gm-Gg: AYBFou18XNvFOLLw1UR5Z8r6jq0s2eBCwXdlchFzdcFbAGYYg15YYmwNXPyM4NHrr7n
	8VVom8cRUqRYKOVRFaSDm2Y3LySvXH+nAJqERZq+/HYeU3MBs0FpxEmxEX4EKunwzN+HL+7R6bO
	zMj9dhFbeJ/tNv/OpxkzRtNp4meEVecDKQjFg+7axtpNTUhrIo7hPdvewpHjVzveyj8J8r6aL35
	OucPdqL5oLOUSbA9snFffsqfiLQvoL+VYvyFqBmUptDqafGFb2x7K6Gbbf95WUbVzIhEg2T8x1p
	Xv5W3WjuqDKd/4QKBDngOmMvrqoi9ujBp68DaX4a34TOmSDfwJf0Mk0rW624eFQuKelro5/1qkW
	wqsWB3AQrMWZV8AJ6KDOQcR8HRqNpKFh3iuqtPv0oBqHu1um+6cNjlWSrRz3RZ9VPPiQmN8q5KV
	NdLi9BKqHBu/B0KtXbVw+VhT5L3QNyAqQ40yNkev2+bBZMQccX0gjKyqKwxuIFRqGJ8+8YqQy9q
	kUQOd1/l8gCRaohT2+rCVG9FT8G9mwJgOd0rDLA6wgvLiPaqTN1dnZjsvzq36ISl34xiVOe
X-Received: by 2002:a05:6000:470c:b0:486:f770:9e87 with SMTP id ffacd0b85a97d-48702aacef4mr2464666f8f.5.1789371202652;
        Mon, 14 Sep 2026 00:33:22 -0700 (PDT)
Received: from localhost (p200300f65f19a904d5c06a7863c841d4.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d5c0:6a78:63c8:41d4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-486eb2ed106sm24129793f8f.1.2026.09.14.00.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:33:21 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:33:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] ASoC: meson: add audin main module and I2S formatter
Message-ID: <aqeiUfIyeW2mapm_@monoceros>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
 <20260912-audin-v1-2-7fbefe928711@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4kuywhcc5gf5klas"
Content-Disposition: inline
In-Reply-To: <20260912-audin-v1-2-7fbefe928711@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_003325_255028_9771A42E 
X-CRM114-Status: GOOD (  14.43  )
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


--4kuywhcc5gf5klas
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/6] ASoC: meson: add audin main module and I2S formatter
MIME-Version: 1.0

Hello Valerio,

On Sat, Sep 12, 2026 at 12:14:32AM +0200, Valerio Setti wrote:
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the include for <linux/mod_devicetable.h>. That latter header is
supposed to go away soon and injects a lot of build dependencies into
your driver.

If you want to go full iwyn, please use <linux/device-id/of.h> instead.

> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <sound/soc.h>
> [...]
> +static const struct of_device_id meson_gx_audin_of_match[] = {
> +	{ .compatible = "amlogic,meson-gxbb-audin" },
> +	{ .compatible = "amlogic,meson-gxl-audin" },
> +	{}
> +};

It seems to be subjective, but I think most nit-pickers in the kernel
prefer { } over {} to match the spacing in the non-empty initializers.

Best regards
Uwe

--4kuywhcc5gf5klas
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqnoz4ACgkQj4D7WH0S
/k6wBgf/VDlnoO5+iXo8tNZhitG0NPObCWmA3qnUxY31Go2pWwo5D7mENYe58DQf
LbOjfyHM3rG5ajmQJpNpoxoWanM8pHm1pbf7WjzZXg8WxLPnc6Y6QmjA5rC1Rsoe
OaAlq3aB/SmDTaIo9WzaLTYU/UhsFNVrWjtqGWhRXgGod17Q1r4iEW6LZadLjsyw
8xYNabxMGbQJVZK8cXM2tJCC9n1O51+z8w01tQyZ4ze4J3Xw7v8uRXbDezOIqIee
/+z7LE3HPZKG04IMtzYplulwe4dmSdjkf81QWxDR5SFxRrlxNaSuxE12LKJ4DSS4
GL20Mp6Pvdl/Kqd1PwrNPdwUx4BNlw==
=LwSM
-----END PGP SIGNATURE-----

--4kuywhcc5gf5klas--

