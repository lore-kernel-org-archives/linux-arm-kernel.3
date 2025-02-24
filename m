Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8994DC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wB6e0LbXYe7xZo2cDjAU++WyYsDziZwYbdBjD9+h5AA=; b=LT2sOZ7zSF8h+gQrrB8pGB/3SL
	vxTG+vfLQ6SJKuAJY9KoQACm09xcXmEG+oAJ9IWqPqXTOdFkguLrVlE16chV55ESTir8FBscOfvlj
	nWNWDPtH9ssxkwe+KvmFogDRn3Spok6ryaepzJ2rU08kIVNyjA8TZhZAAZBvfJDjRCkxnFecdpCfO
	lKv7IHxI1n5OGk9pjju77GhQ7Zn9ookJYYCrBqotv3VM7KCQwGBBGTJx3h4sOfgorBiFL913/isV+
	iHaisDrTCrHie74OlJmiuQBPJCwVNC5Vvnu9NdnQrsW21AVR7JgkYZoLm0+kYCaoUfeHsCvabJClm
	3RhDQaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdaD-0000000EtDL-2Pw6;
	Mon, 24 Feb 2025 18:53:37 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdIH-0000000EpuB-3vG4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:35:07 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30a317e4c27so41093781fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 10:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740422104; x=1741026904; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wB6e0LbXYe7xZo2cDjAU++WyYsDziZwYbdBjD9+h5AA=;
        b=mIC/5G7XZLXbnnSGMS9QxRMJO5VKzNX+i0emVmuo1krbaBe58Gv0gFncQQhiIqAY0f
         AwT01XhU011ks0oodiX6j+ZZKF2rx/pvKjzZTlZ5ua2kkehb5VsdqF/6KGv53fzegkJ2
         PgRcTb3fIpllnIcG6+oF+upmeuK6Wdu6iKOrLWY22+YDVFbXxs9CXl1esUinkAlgpp5d
         0VCEl0Hzts0F+QXNJb/NkwC3PHjbH8h8WLw9tg7mIKi2QG3lOZt4COtR027yu2C8YE20
         I+xV1LFSzPDf68K5054GfVUJyf4BqkpKexfhmkIUdbH0FoYUauf7Zsu16BrwI0BkjNvq
         tKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740422104; x=1741026904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wB6e0LbXYe7xZo2cDjAU++WyYsDziZwYbdBjD9+h5AA=;
        b=l5fkkAGB4ukus6Qi2nqtJ0Q1H456ENWqDBpSA2FKpGiVGhfwABls/M5GWDAaueUH5i
         y1zoHci6Z9/iiH9laQEOlFCnb4mhEPPEEj8Jueuhx+3hpRcB1jQaNCWJPl4FL+KUkRQH
         1PkZ448jvf52QuufRYb2gR8tyDXR+zj41LyWe6F38R5zSOMa6DvLZtVc4/xWSVooeCnF
         HxIbGhqKxQdtC0BklTncnf7xVNAWwey8aUlPF34j+bdnTYXZkNCX6Vx9kS6wjxzgI81e
         eIehuowffaerg4vWihUW0RbUoBPW+fSIBEeiCAMm/6pip1iTBci7hLbqBqwUCwei+6rg
         NCSg==
X-Forwarded-Encrypted: i=1; AJvYcCWN+7hIG6HwXqhMp7rdHLkuCAUyo4uKyP3UqMDG5Bz33M2P6DA8RwE1899zoZ3IjN76pSDLvfkEk6lBForh8Kw1@lists.infradead.org
X-Gm-Message-State: AOJu0Yylba1ugQoQXMJqK9G7uuJhXHlTeOavNmM7uju2z5sdWqO35PHE
	tzTjZqbXLDXCcPEU8PYYYhtP2ubixVZkcBZM70VMooCC4pDA7TsM
X-Gm-Gg: ASbGncvtstTxN9HlpFNhGCig8i0Ajim5/UVdya+WSJOq4+XShpHmd5PEVaEUNMGKSwL
	rDOGUA1XKwensi2mfXS49QdtqwWKdpHwiG/8nlIrPdrcVmw2Pn1SB+Kf9BdoK5SS+lVERb1QmOf
	aJB2YpLC1+6nGppGgCpnT04Mvm6Ek8IEVhtejtRCjrFKkds8qxBTy/GMa4zjfFPkfq3i1g7i3rZ
	DKvuxi0BBqA6Px+qqo2+vOnmZrTcfhz+UL/DKjSG3xR++zEvSbURdTA899BweAfkDbk37k4tqn+
	ffgkmmlCRblJAnJK36Do8IAf5XyyUZGe
X-Google-Smtp-Source: AGHT+IFs7Y+fPcBuO8FWsGzVtgW29xKLHKqg2RgdPdKlbhb4D5IMevpKDqe0ksSM6DR2potkoMrNfA==
X-Received: by 2002:a2e:81d2:0:b0:2fb:cc0:2a05 with SMTP id 38308e7fff4ca-30a80cba36dmr1382731fa.37.1740422103756;
        Mon, 24 Feb 2025 10:35:03 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819e0c3esm52791fa.7.2025.02.24.10.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:35:02 -0800 (PST)
Date: Mon, 24 Feb 2025 20:34:58 +0200
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
Subject: [PATCH v4 10/10] MAINTAINERS: Add ROHM BD79124 ADC/GPO
Message-ID: <3d7ebd442adbba2719c6028308571995ec10f468.1740421249.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SgT7ql4cmjy8U+5H"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_103505_971010_E7792668 
X-CRM114-Status: GOOD (  12.10  )
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


--SgT7ql4cmjy8U+5H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add undersigned as a maintainer for the ROHM BD79124 ADC/GPO driver.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
RFC v1 =3D> v2:
 - Drop MFD and pinmux drivers
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c1821fa8099b..b116a497d905 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20533,6 +20533,11 @@ S:	Supported
 F:	drivers/power/supply/bd99954-charger.c
 F:	drivers/power/supply/bd99954-charger.h
=20
+ROHM BD79124 ADC / GPO IC
+M:	Matti Vaittinen <mazziesaccount@gmail.com>
+S:	Supported
+F:	drivers/iio/adc/rohm-bd79124.c
+
 ROHM BH1745 COLOUR SENSOR
 M:	Mudit Sharma <muditsharma.info@gmail.com>
 L:	linux-iio@vger.kernel.org
--=20
2.48.1


--SgT7ql4cmjy8U+5H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8u9IACgkQeFA3/03a
ocUZ1Qf/T7ozsozyLKeP4mSUdzZsJgJMWnZtn+6t74wkU985+m34/PssYsyOgyn+
Z7JbMjLgd6UQxIoSFaswLl+lNarmqyDACVdrYY4MBivHyFsoPlheMNal5+9IKbpK
rklDqPdlKPuBH31oEX9gi4UpZqiZ/xSpJSR34czNzWgfD1E1PnjC/dCjs75zRUqr
ZlrC9O+eTKjOU36Au17YE+uIZenzVv0Xb7dFpkFr7GwiuX4q7TpmAgodk3AqfoXq
MWa3zS6UgTWRfk7uC2rGaq6CVDnPkf9ozF2ePIJyP0FkKQab+qiYOcJmqBo25cPU
rNO7SQR0wwART+pZH+q6w+G4ARMURg==
=LnpL
-----END PGP SIGNATURE-----

--SgT7ql4cmjy8U+5H--

