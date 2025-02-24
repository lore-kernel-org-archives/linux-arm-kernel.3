Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B5AC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lvtg9LiT9FPYIsAlfx6bzRkO3KM227JB/0Q4qpEPDEo=; b=mZP9BZ3fWd3GcSmkNdb8BoLY48
	4oMxaFxGF+rjEnlZ9xlphK8Rs8H0tSU3V7/ycO8pcJ3e56W5BWvo9KBNsqAGhTYukCYRR0xkuQwPo
	RqbRODIVObgYqnsDDwuc9FMfuXLChLO7wa8fTedK/zT/wUDaiw1614u0l/i+UtJOdBwYVLoZcguds
	+Xw6iNxYTQTWRWwhmQJqu4y2gd0FNfyg/BzSb0wSkBD51Kz5H5sy0UXPzN+oxNePLIlcAEXNT8def
	xt4eDdkVdX4ylN6rqDUhnOF1oyCT7QE8yWc1BrnqbU7+Nhj3DpqE2p0H5Vkt7fQw7S7GbwANNGBd+
	wCX571dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdUN-0000000EsGV-3KJW;
	Mon, 24 Feb 2025 18:47:35 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdHP-0000000EpcA-1rZ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:34:12 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-309311e7b39so43331671fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 10:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740422049; x=1741026849; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lvtg9LiT9FPYIsAlfx6bzRkO3KM227JB/0Q4qpEPDEo=;
        b=PZ4D5CRO24Fc28pITQHX1VsSbN8/JekEGTB/2B8gifcnBwIX4p+MZ3EHvHMLhG8klA
         +5LH4T26LFz03S95R+r39BaSUYeJUYjv6BU+lbZ+9XTTDNVlYqBIApJkmlnW5t9EQHyv
         o/b79mhzxwidW5u3Yimx18cIs+8mr1/d0AX+psl7zoz3aAho3lGHosAMkFJppGc4oT4u
         Dm+TVR2e79OipdfydrHugrVYwhxRoHDpT34Vl/gJZHoQ/JSeh/dnJ9cbS2XoQiY2aoNQ
         jO1syjYw3IQ81/V2Te1K/DQAHh6yB7GDM8F9KtOfOD4KukRAsrSWD+3m+ePCVMDZO53Q
         ArGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740422049; x=1741026849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lvtg9LiT9FPYIsAlfx6bzRkO3KM227JB/0Q4qpEPDEo=;
        b=nky3bdaKTe6VQhELf5DLZp744k1mIPRAZlIljiS+QGyqv9qeMp1F9MKx7ZeiquMMLs
         4jWRdxhD0LHx4YgqhC2mR9VYYM9wh3lUXbu2lN3SBoXV0HC/cvi3+OyO0eHF7bEPtO0r
         G5bVIfAQepkPR4VpMyFEfLNW/AsQ+Be3a2fN7FO/DsjGNGiuWCy/32WTiCkxjQi3WkVN
         DzGXp7Syw2anD86+pOktVOxUreMqpMPP/8mFob7SeyJ9DWFX+VQtbzI49iFUsoH832xl
         qdxfIb5ZFktWuMSCLbJlN4Hmrg1OIy/4X/hMbDQE6Sdn3sbfeu+w96IaMMEexzA4wZHS
         pM8w==
X-Forwarded-Encrypted: i=1; AJvYcCWrGQmdz2CS+6Npg45ROsdYa5cFqKP4UCgPrbjioA+/ZiTDVwoiE9Yv7nYMhL5dJ0TbDuP0z3WPUHWmA4uZFigz@lists.infradead.org
X-Gm-Message-State: AOJu0YxreOZ2v8kKd77dbPFDPi2+2sw1TSzRmv//FIvyarxXFs26Pyu6
	KDh0WnBYPgELGiOB16OwAspJKLdfURzUx3G2pvdKmVNPsnoI5JUt
X-Gm-Gg: ASbGnctz5uHzk4rzyRGR0rBLcspiacJt519XWVNf4jhufJQ2jHvcwN2Z+UYrdkeWyPs
	qREXLQXjt6Y0LDToCW06VgZI3yfQGrvSgrd+BPWxK5rrKYg57bQ4B0G2VkB4uy/2g21ruek+RfB
	JRIWSJz1IP4344GLnJja4F9GFLV2dlhyZ9ysblbut32MJFIr45p6biQ5dbPFCZUSw7MT4YOEH1K
	qpMnOqQdy7KL9CbjVotLaEjrXQMCKfKZUh+GQrU2rr+/YJBRUHwU5Ifvq5vC0K417YI9P+7WmPX
	x7rfCSt/6a/hkBHO0iuaVLrqPaQNhIA3
X-Google-Smtp-Source: AGHT+IEnOT33v2tdUxI89+C2mfa+nuzArxhmJ+3qGyLgimw3UzsP7sWa0GhRzJ9QUi85xzA0PWfy3A==
X-Received: by 2002:a05:6512:1244:b0:545:b28:2fa2 with SMTP id 2adb3069b0e04-54838edd962mr5783123e87.7.1740422049175;
        Mon, 24 Feb 2025 10:34:09 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a81ae82ecsm22381fa.98.2025.02.24.10.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:34:07 -0800 (PST)
Date: Mon, 24 Feb 2025 20:34:01 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v4 06/10] iio: adc: ti-ads7924 Drop unnecessary function
 parameters
Message-ID: <38d39befcca110132fd4349c87fcb5d7ff51a2c8.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8S99u4QPCxXt6129"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_103411_495202_6A04CAB2 
X-CRM114-Status: GOOD (  16.71  )
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


--8S99u4QPCxXt6129
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Device pointer is the only variable which is used by the
ads7924_get_channels_config() and which is declared outside this
function. Still, the function gets the iio_device and i2c_client as
parameters. The sole caller of this function (probe) already has the
device pointer which it can directly pass to the function.

Simplify code by passing the device pointer directly as a parameter
instead of digging it from the iio_device's private data.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
This commit is compile-tested only! All further testing is appreciated.
---
 drivers/iio/adc/ti-ads7924.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7924.c b/drivers/iio/adc/ti-ads7924.c
index 66b54c0d75aa..b1f745f75dbe 100644
--- a/drivers/iio/adc/ti-ads7924.c
+++ b/drivers/iio/adc/ti-ads7924.c
@@ -251,11 +251,8 @@ static const struct iio_info ads7924_info =3D {
 	.read_raw =3D ads7924_read_raw,
 };
=20
-static int ads7924_get_channels_config(struct i2c_client *client,
-				       struct iio_dev *indio_dev)
+static int ads7924_get_channels_config(struct device *dev)
 {
-	struct ads7924_data *priv =3D iio_priv(indio_dev);
-	struct device *dev =3D priv->dev;
 	struct fwnode_handle *node;
 	int num_channels =3D 0;
=20
@@ -380,7 +377,7 @@ static int ads7924_probe(struct i2c_client *client)
 	indio_dev->num_channels =3D ARRAY_SIZE(ads7924_channels);
 	indio_dev->info =3D &ads7924_info;
=20
-	ret =3D ads7924_get_channels_config(client, indio_dev);
+	ret =3D ads7924_get_channels_config(dev);
 	if (ret < 0)
 		return dev_err_probe(dev, ret,
 				     "failed to get channels configuration\n");
--=20
2.48.1


--8S99u4QPCxXt6129
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8u5kACgkQeFA3/03a
ocUP/wf/VssnGJzhil921kJivWyVXzSnMaeybHUgfqTjw5Zs8pEJEjyxYGmfB0di
tjOo9fM6CU6pCBZ3XAkIo/2gIF6tF/T1WqB3fi0FCoEaBom/Yi415/zqjSVEBEiB
Xf3hFCVZ4JdCkVfk30vXw7hRKFPg6gaVwl+pNTRVWUXEUUVAYuuUCHNcJm7Xl9t0
jBu2CWoYYda3OcfMZ0Ur8P8ilEnUuLQ1xUB9L5gTjS07zBUZKwGsXOUWcn1zzQl2
xBOhyA8kKiUUExnjupG8PFetjj2J96xvb8CKUhFYlL++kxVjSV69p5rrNGJNfoME
uHF7y3m7tQKmP0+oXv/AlOapJUp5BQ==
=3pau
-----END PGP SIGNATURE-----

--8S99u4QPCxXt6129--

