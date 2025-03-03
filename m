Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ECEC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKyByvqg+jAL9PKNdpeqdSWpvScxjw4N93b4UfEb/Uo=; b=4g9Olmn5Ur3AGcXb1DiTsmxFPe
	WtmojX66+G/UD2QFzn6hWXChtUWZDdweCvMdfzR5XDAhGAP4OzZG0toFEpKXxHx0G9cjn9A1kbyx5
	NsuqFPwH8lRVRFZHLzqOjwcJea5F8rKLuj1cE0VwdTBimRsXJJfWwX7TfIhxsh5NEnEoWqveaguwP
	dCrLnFx0c/jyARnnHwduIvxHIB3w/8RIWD5KTHiQA9dHmYwxNdJv4CXdxG+BPTQOSQhP6jVyEmYcC
	CO5YzkZbeqJfS74uU0DAm8QF+oERGeydVbviStyfRiIDZbNnGhZZtb4TRBQyVN+lg3KMAPBSeIFGE
	a36C0lcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4o4-00000000jIe-380X;
	Mon, 03 Mar 2025 12:22:00 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp43r-00000000aD1-1HuT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:34:16 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30bbbd0ea7eso7923671fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 03:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741001653; x=1741606453; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jKyByvqg+jAL9PKNdpeqdSWpvScxjw4N93b4UfEb/Uo=;
        b=QFn551rPnrsKVlpyfXrUUtPNRDBIhaeZ3i3TMwFF06yUMFQFU/vomedLYStICqDUWd
         k7I12bygmJIed0U1uxOIjAuicf8RwWYO5lraThIZxfQGSyMD69yFm/8y2b9aAlbafIix
         9ETNyjGeFhhXMtBeTEiZQeoj/69IvjBQ9wJpbopgK9NwNYKXU2jli3ifS1sdWLBAUwNe
         BlTVql4lec70w3qVAKM/xjVefWyfQJ4ADxvHD3isWGfzIgbcSaquOtJg5SIn9L4iSsct
         syaEnOFVcN6QFrnMvZ3zyaNu7wy/7Mp4MM6uDHeHlI5jrp+1mDdQ171++v3n9uzyDjcq
         OGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741001653; x=1741606453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKyByvqg+jAL9PKNdpeqdSWpvScxjw4N93b4UfEb/Uo=;
        b=T+wHwbBD7P1Ek4rG/xdOs3nikCyJQTMTTYfHAS+pD5RvBD2lPaOGt2u5jaVajOLbZA
         Lu6cmcXntrtTJoYaWMqq6c4jCykpDopWKmHNTfMu3wMRjpxqR4XCWd6aNe6ADN12wxT1
         o/oAqnhfJwdi7q0UCj6Ak/sXgFDggYVnwqchvDdm5mjwncJAz1pbQd31GzIC8nggV8Ff
         7UP4y/zyi61fJ+7dNLV7STD5MuvjrLbgXaKtXFffqtt0ii8QKQzhv69IuUre/Di7zrjK
         SkOcWm7hzOVDdqaqGrZABd7IofVhzH/NfseczFLXtDcRG1Pk5nV/3Ahr6kts+2GNYIQi
         lWrw==
X-Forwarded-Encrypted: i=1; AJvYcCUhWSsi7MwabwGj75df8BR8vFl7zfGUAC4/JKsRy0ArBf7uOhhyfawjRXTD1kTpucVQ0Is7VvZSWm/dCMgNGxCE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi++n/BKWJQ5OMsH7wtxvUJ/7s63by4TvUzsOOnutEfhsIc3Xb
	tOVyNjTeNmRYaJYP33/Rrww7xjYMKgHT0549QjDtrSsPLQS0/6JB
X-Gm-Gg: ASbGncuqJoxQI7P+BZWrZlWIG4YfSYOckNTA88V4OQ38/2uFolGIX4mMqi9cI68aRv+
	MDGwwws+foDp0JZ8QqDiqZczJR6XCcYpx6XPImQ0ZlfKslwBridhsuw1Oaw8UJtRuqZtVt4tbeJ
	mJ6+uuw8nHqlJFxEtjt/K2PwMd8vWoQu1VhOW0kzM8ed6m9sU5kaYd/ZJ0M5MxBTfzluKM+VVOe
	Buom+Q3E31DCkVClT1Y0nhRLSFSt1UrRvvnmp6voBp53bnBQDbQrrdn+bSGHVR+R3GY+mtUC+49
	DZV29tCrQXjBUYhczR/03ME8acNnR4PQ0kLsFh1Dzr+Be2Yz/chu4VBy0VW8kOdU10lU8Oa+KTI
	tMPeKuKe6WqA=
X-Google-Smtp-Source: AGHT+IH2q/EQ50OKDdOvQmK3DgcD8QV9qiZg9HjaiRlsRxpoAX3Icmu9TOCjXHgkc5dFCtxPesT+sQ==
X-Received: by 2002:a2e:9515:0:b0:307:dc1f:e465 with SMTP id 38308e7fff4ca-30b9326b162mr42530121fa.22.1741001653116;
        Mon, 03 Mar 2025 03:34:13 -0800 (PST)
Received: from mva-rohm (mobile-access-2e8451-125.dhcp.inet.fi. [46.132.81.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b86875b76sm14035841fa.91.2025.03.03.03.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:34:12 -0800 (PST)
Date: Mon, 3 Mar 2025 13:34:06 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
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
Subject: [PATCH v5 08/10] MAINTAINERS: Add IIO ADC helpers
Message-ID: <78c18b224cd18b1bd83eea51c7e52dcea28e3d50.1740993491.git.mazziesaccount@gmail.com>
References: <cover.1740993491.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5Rvc/P61F8vV1THI"
Content-Disposition: inline
In-Reply-To: <cover.1740993491.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_033415_345490_2FCE9B15 
X-CRM114-Status: GOOD (  10.98  )
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


--5Rvc/P61F8vV1THI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add undersigned as a maintainer for the IIO ADC helpers.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
RFC v1 =3D> v2:
 - New patch
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0..5b96fb864227 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11208,6 +11208,13 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/rc/iguanair.c
=20
+IIO ADC HELPERS
+M:	Matti Vaittinen <mazziesaccount@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	drivers/iio/adc/industrialio-adc.c
+F:	include/linux/iio/adc-helpers.h
+
 IIO BACKEND FRAMEWORK
 M:	Nuno Sa <nuno.sa@analog.com>
 R:	Olivier Moysan <olivier.moysan@foss.st.com>
--=20
2.48.1


--5Rvc/P61F8vV1THI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfFk64ACgkQeFA3/03a
ocUpgwf/SNY3Pn6d3XX6wgquUJWMeNypZTRBxzVX+t3Nm+6wYifiTOOpcNdIYHfV
UEO/B8hbJ6BzXcUxHFFEUnq5pTr/a1gbQvg+rtBnZiXV95/wnLJjJgx9guw7IW48
BjUoZhymuhP201Y3/EzSSXwe7MnrOTaUfcTwBxZQSsipdd8PK9co9V1EzEGGIeO+
LqTyj2W1KqdWOE5qqnTZhzLj3fdEYfJoxyUdXWiHJEcmDyoc9qZ0HNnsLa59j5Co
d+8xCLwqyB6CFOJWkl7gL/92nAyFvn1XzEvpuQGyz2Ouoo1cZexz/6s+UvexWkuo
Hh1QZj0U9ni99bqIrOfrEk7zUk5lMQ==
=gikD
-----END PGP SIGNATURE-----

--5Rvc/P61F8vV1THI--

