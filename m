Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98433C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RL7ikpdpwTIHUvgLFfPq1GGLDdUjM4D8YM1CAoVeQq0=; b=JNhcKIN1MdT/3x05QNWDDAsFFD
	7kqOxZcMePRuwnJY3Y1UxfQMmGINYXamRWSsh0OpxT/P3b10LaTggTB68XGDEGtYybLegS3fgw/jR
	fcNylQGj9QxYhVLDzWVHLxKxg2Ey1+tCwdAUHn+1qAgkeTs+vHLkF59t4xvwWyfxc26kV2r6Gbvbl
	lyAMpR3n50YN9S1xLrnZhasHdfula7Ycs4XLe27kAarQw0SlxPeSlCOEKySy9cbgP6tdzjhCEhwVe
	0pAFkoiMTriL/0w7/ImuZim4RyWhJGFR0ezmvLTJind4gf3bVvzZ5RnRw7EohApwoiRKLqqPqHxjx
	iWBD47Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy2l-00000000OKY-25iL;
	Tue, 25 Feb 2025 16:44:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmx9S-0000000078l-2Oyo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:47:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4399ca9d338so35613655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 07:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740498436; x=1741103236; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RL7ikpdpwTIHUvgLFfPq1GGLDdUjM4D8YM1CAoVeQq0=;
        b=Yb2g8TOQhfwNbPdBmc64YpgQHrCihDasO5ZmHMTqNYck7EDBaDit77lUtt26qfnrvx
         2x5ewg1+X1kTonyg7ul/4xf9xONS9HTRClJZNhPbwcQgBfdRvoUuYULMLyIrpLBwoA2u
         zsQhNwUgSuJ3OawkmlThQzMVNtWFg/xzGeNQT5cioK196A+BPuoSp+D6XPw3wEMVr1Cg
         I9Pj3n1S0cJdeZK2NsEC/iOJOryRuKBL0ekNto8eGFZgd6mI4e+vue9lBDEgPtJxLlBl
         3O3Exxf1vOoo+KkTWsUk8VSb/p3I+rCHwunM6WZaLNayvp67kcZFh2tTLdQdDmY1pcvs
         TiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740498436; x=1741103236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL7ikpdpwTIHUvgLFfPq1GGLDdUjM4D8YM1CAoVeQq0=;
        b=araoiD821/df3mud74iA8Z7EdS4LBYiU29/eLxtt09NURT1tyjMFQPUptQWmd2WB5i
         fcl/07mRHOdt7cRvJhGyQHdpuIPFzs+6JhI1+pGc3yFuUyzew80zaPxp4MWmDP981eiY
         AZrfiz6qG7CkL0w8N72WtUev3MwR+DheG5foU1pVAhXFTnFVIYpzO+5xhpRkyNeawdDT
         veVbUTh72EBmxAN+Ju31nVG5E3LxK2s22g7H2rF7pL3LyCkx3PAECU/NHd6Xi/XLzSHr
         s1F3Lvr+ietxJiHXJ5Lm946eq6fDGLMyPEPtb37LNnmLpWvh1jmlv9tHhy7llsdqK+wJ
         VinQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF1N9Rtuae7rpb6tc7eLN7vf9V/EDH3LdLDT4aKg1Lp55+heZFo1p0b5T/53g/hYxsx6qcsUxbXyn148D6kp8a@lists.infradead.org
X-Gm-Message-State: AOJu0YzZAvJTbJL2ur1W/bAPtFn2tdYOE984TSWc3P7Yx7gHMM6fzBik
	CHNQnNfl1lsRhvvEPREacblxSQzfKGmcU79Qv/0CoToCokDcFrW9AnjykCn537g=
X-Gm-Gg: ASbGnctfU7ZCD+4GvprTRCH6FQwJwOzcQHOj39aGlEz0+kTfo5UiPOHFoagXeJhHzHx
	GhUQI4UiOOJOsTX1FWQpZb807R5uDiMHjMr0bjOUHAUkESTRZJ7q9kQa16kdGLBUYVAdqlnmcxN
	usMBpjEaFsoa8UfcGfQNpcUVwZreSFzsbt7oKGFhPWTyI9PX9GXAfmJDISSRT7sZqq+xBlDLF8o
	31jtNZFCz1X0wim2E9/qP2NGDyuhIBS58f5TNBm1NGhRjMrKv7TTHGPL1+dSPvALrRO70DhBKhg
	i0L6TYGwms6Kjq+wDAD0WrxIk0PdLcPzXzSjSdxWFFL1QA6D2LN9IRQ9itueAY1NRo/q
X-Google-Smtp-Source: AGHT+IHtPuDfuhLmrc1DEpJvBrIbtOvABx17RUyOzeb8wjvJkw062EMza3VLmzP2KVFZ1hOuW1Hblw==
X-Received: by 2002:a05:600c:4753:b0:439:a1ef:c238 with SMTP id 5b1f17b1804b1-43ab0f3cc86mr32918495e9.13.1740498436294;
        Tue, 25 Feb 2025 07:47:16 -0800 (PST)
Received: from localhost (p200300f65f083b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f08:3b04::1b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02f23c2sm147993495e9.17.2025.02.25.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 07:47:15 -0800 (PST)
Date: Tue, 25 Feb 2025 16:47:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Jiaoliang <yujiaoliang@vivo.com>, Oliver Graute <oliver.graute@kococonnector.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe
 unused
Message-ID: <6xoycaft6wnd4sm74f2o4koc7lvyl2mtxp2kc6lc4dzpjvby53@ejm5ssbfzbph>
References: <20250225145332.1116557-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bmiwcubc5vrvxiy6"
Content-Disposition: inline
In-Reply-To: <20250225145332.1116557-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_074718_610899_029298E4 
X-CRM114-Status: GOOD (  28.65  )
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


--bmiwcubc5vrvxiy6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe
 unused
MIME-Version: 1.0

On Tue, Feb 25, 2025 at 03:53:26PM +0100, Arnd Bergmann wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> When compile tested with W=3D1 on x86_64 with driver as built-in:
>=20
>   stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunu=
sed-const-variable]
>=20
> Ideally this would be referenced from the platform_driver, but since
> the compatible string is already matched by the mfd driver for its
> parent device, that would break probing.
>=20
> In this case, the of_device_id table just serves as a module alias
> for loading the driver, while the device itself is probed using
> the platform device name.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Link: https://lore.kernel.org/lkml/20240403080702.3509288-8-arnd@kernel.o=
rg/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/input/touchscreen/stmpe-ts.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchsc=
reen/stmpe-ts.c
> index a94a1997f96b..3900aa2e3a90 100644
> --- a/drivers/input/touchscreen/stmpe-ts.c
> +++ b/drivers/input/touchscreen/stmpe-ts.c
> @@ -366,7 +366,7 @@ static struct platform_driver stmpe_ts_driver =3D {
>  };
>  module_platform_driver(stmpe_ts_driver);
> =20
> -static const struct of_device_id stmpe_ts_ids[] =3D {
> +static const struct of_device_id stmpe_ts_ids[] __maybe_unused =3D {
>  	{ .compatible =3D "st,stmpe-ts", },
>  	{ },
>  };

Following this we have

	MODULE_DEVICE_TABLE(of, stmpe_ts_ids);

=2E

With=20

diff --git a/include/linux/module.h b/include/linux/module.h
index 30e5b19bafa9..014f033ef1ba 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -250,7 +250,8 @@ extern void cleanup_module(void);
 extern typeof(name) __mod_device_table__##type##__##name		\
   __attribute__ ((unused, alias(__stringify(name))))
 #else  /* !MODULE */
-#define MODULE_DEVICE_TABLE(type, name)
+#define MODULE_DEVICE_TABLE(type, name)					\
+static const typeof(name) *__mod_device_table__##type##__##name##_ptr __at=
tribute__((unused)) =3D &(name)
 #endif
=20
 /* Version of form [<epoch>:]<version>[-<extra-version>].

the warning goes away and stmpe_ts_ids isn't included in the .o file
without having to add __maybe_unused to the driver.

I would consider that a superior approach.

Best regards
Uwe

--bmiwcubc5vrvxiy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAme95gAACgkQj4D7WH0S
/k41fAgAsiG8eMcqxYHNh+Ky669sked7nMyC/TQEQFV0SUv+wg92u8/vFDlkldP7
H6WjVz3r08uWIyg04k+7e2ybBjuwwbRgCfHMDsht96y2I0dFuviQ+krb4laT1lty
TJm0S+x18lKbJ+/wChNRi2JJ5NImAyjHS++f7KzDKWCo1pkNYk4R+mEUkdPeT1T7
EEY7bC3rgUELAmTkj2+wJCkXgXpLH98JXtQK8d5jjhouR1XpfsGFYf2dk+jKRG80
lZOE50QtJYOXkT9u0RLFU4R2dAMwsSEWB8lWbbBPiOY9dGdYvSb0+h6/4haQflbG
0i7od2UQ4QTAXLquHYDOUHpV3+yyuw==
=/Pv1
-----END PGP SIGNATURE-----

--bmiwcubc5vrvxiy6--

