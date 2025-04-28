Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF184C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 19:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaMu0L4wBURz9xq4JXnOvgxpR2Jhc7zGFIG2V5tCWLw=; b=WU1GkrZGt3yMA/e3GF1V8YLtH9
	h5PDg0Fb/mW7ikoAnewacwinKww6Xli1k9OKK3ONtIN5Wx8U3xkjh2QrLNfEeC01vn6steeEyH2OW
	/r8du93BqK28wVf0X51bTTQWoXHfITSQBe5EwKd3uueAUbPL8GB8Y1BPehlaXTeinBGwmzllEyy77
	Ulbk18ySiHHiZxS6zprhzem9Hzl/9ppRdxDtxmkZ0swHTa/lvsxuJEEz+suLtaaHQRhE15Dw/Y4Hm
	kLUEu74V5FFwD2mkckb88GQuNhpFIoyplcFcKnRxX3TU2qcntzRFi50biykNbPWktqVWmrCFnoYZ1
	zr1oNHig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9URa-00000007Nti-1mXo;
	Mon, 28 Apr 2025 19:47:10 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UPc-00000007NZ7-2LGN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 19:45:09 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so4353038b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 12:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869508; x=1746474308; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KaMu0L4wBURz9xq4JXnOvgxpR2Jhc7zGFIG2V5tCWLw=;
        b=RUHaZKLX8jEuKQ0aEDVoSA+x4gWTEXO1zy9Q+M1Tl41avaTFBYmSMdFwfq3NZFs+FN
         f0bf2Ck2Hfdjo+ybm3eSFu44zaQXjvmwrlzoM5EGHgaRfg8HhrrbwCp49Fuei9gN4Ul4
         oYUWY/jiXb8w5DXUccQyxK1yAgpeVtpvm8+2oU0ZXgB0ulGaU8Wf8BSUo2xRNzE5HLw2
         Yxh2hB3hpGEjo3HxrBg7Xd2dq7Kz1+Jbes0GszPerVmpkNQ+HIND0st86MDBg/6EqdDC
         E+qcN6+dB+pxu/0gmZvUavGbPQrMngx6JHsz4pzPtWHz8ke5+KA/8tH/wrqRW/zuAELF
         XQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869508; x=1746474308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaMu0L4wBURz9xq4JXnOvgxpR2Jhc7zGFIG2V5tCWLw=;
        b=PqDBkkjvfZ4ggu09hB7DJK8ja2juhT9mErPHaUbr/Jbr5rAmQdonNpHDUKDMj2CUg5
         xRFHKXGVvQKRfK9wd3yxqQcHsNrOXHyQf6i0cVHLihj+iYAgWZgH5BZJe4b8uYwTB3R1
         4UKzVNg9cmHJi5z08fNoOXeADOGCyZvDLRbo2FAzKhLezxptzC0R5IvPSVWV/iViy1I+
         f3wNeZ62XsZXM6qx1RQ+zQe9Zz2MCM1eSspdTfERect28CQxk6tF0KoaKZkG4xjS09HF
         o4Smfk16AM9uQcR2rMUaEGF/pZnqPSHjXnAB7XpUTeVm9CtcDBPvrImA3cdq0x+SpLVX
         JC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUThImG30GlYhb+rXQFLIXmwNdznQ1logj9pc2ko3wgKRSF/SmTEKFhVIg4IuuZzOUN6WaL5x56qof7GXA4QOt7@lists.infradead.org
X-Gm-Message-State: AOJu0YyTiagL/0Q+ucUer+UZmuiR/E2OhfWRELZQ4Le9kzd2JuRWoAg1
	uLzp3o3QhRSOqZBJhhSFr5ynDFijJhnZQAROhuzE+VeppyumbvOJKaUCkplOkw==
X-Gm-Gg: ASbGncuH8EY00k8U5YPvFaMP/8xVzjQ4SZtz9HHTCraH30DGsEF8mj9E8fCNMhS1y4C
	K1kjIkVzj0F792VnogGEIW6fQv19AFx3K2cerlOpt9WyePkY/J/PVONQDLot3gDS2/A0xfgYwWz
	wAzZIvVWWOH3AQwoG5Hs56eMhpBp8HEYE5HxfnPjWjwhEgDUpzi0MgjcXRTWc1o2JPy3Gy0AN7Z
	kPKWwBwelTJh6sOB+LViWQCHX40vRQ/RtRohy1Vr3mJ087ixsWb9QsnztpiuzEm8jE95fPYBbvH
	46d/7+CUeOtYbIsyFZ7UlTvZtSLYgemNToWtHVXWUeoR1jUY3FAzV0ziUy3COXevTC4cBTpZwQ=
	=
X-Google-Smtp-Source: AGHT+IG6R82DFa9jAy922lzUHN2EAVQRNR18xiowU6WDSy9TAXdGrX8+WhcNG0tMNBGpq3fQ1R7ExQ==
X-Received: by 2002:a05:6a20:43a1:b0:1f5:75a9:526c with SMTP id adf61e73a8af0-2093c7e3860mr1003669637.13.1745869507413;
        Mon, 28 Apr 2025 12:45:07 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9abf2sm8338322b3a.122.2025.04.28.12.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:45:06 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:45:01 +0000
From: Benson Leung <bleung@google.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 8/8] platform/chrome: of_hw_prober: Support
 touchscreen probing on Squirtle
Message-ID: <aA_avWpDUMAvbRBu@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-9-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3yxgRYuYXTrM4tBx"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-9-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_124508_617730_F51E6308 
X-CRM114-Status: GOOD (  19.21  )
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


--3yxgRYuYXTrM4tBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:46PM +0800, Chen-Yu Tsai wrote:
> The MT8186 Squirtle Chromebook is built with one of two possible
> touchscreens. Let the prober probe for them.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/platform/chrome/chromeos_of_hw_prober.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/pl=
atform/chrome/chromeos_of_hw_prober.c
> index 10dbaede0541..f3cd612e5584 100644
> --- a/drivers/platform/chrome/chromeos_of_hw_prober.c
> +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
> @@ -59,6 +59,7 @@ static int chromeos_i2c_component_prober(struct device =
*dev, const void *_data)
>  DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
>  DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
> =20
> +DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(touchscreen);
>  DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
> =20
>  static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trac=
kpad =3D {
> @@ -76,6 +77,17 @@ static const struct chromeos_i2c_probe_data chromeos_i=
2c_probe_hana_trackpad =3D {
>  	},
>  };
> =20
> +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_squirtle_=
touchscreen =3D {
> +	.cfg =3D &chromeos_i2c_probe_simple_touchscreen_cfg,
> +	.opts =3D &(const struct i2c_of_probe_simple_opts) {
> +		.res_node_compatible =3D "elan,ekth6a12nay",
> +		.supply_name =3D "vcc33",
> +		.gpio_name =3D "reset",
> +		.post_power_on_delay_ms =3D 10,
> +		.post_gpio_config_delay_ms =3D 300,
> +	},
> +};
> +
>  static const struct hw_prober_entry hw_prober_platforms[] =3D {
>  	{
>  		.compatible =3D "google,hana",
> @@ -93,6 +105,10 @@ static const struct hw_prober_entry hw_prober_platfor=
ms[] =3D {
>  		.compatible =3D "google,squirtle",
>  		.prober =3D chromeos_i2c_component_prober,
>  		.data =3D &chromeos_i2c_probe_dumb_trackpad,
> +	}, {
> +		.compatible =3D "google,squirtle",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_squirtle_touchscreen,
>  	}, {
>  		.compatible =3D "google,steelix",
>  		.prober =3D chromeos_i2c_component_prober,
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--3yxgRYuYXTrM4tBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/avQAKCRBzbaomhzOw
wuHsAP9k0n2/zZ8JMwMbW9PvC1L4S+rXwkDzn4vNgVA9gpUADgEAqqQGBGFcOCTo
ivudInVAQKMFJJvenfbspzj/SwoyHA8=
=MQA+
-----END PGP SIGNATURE-----

--3yxgRYuYXTrM4tBx--

