Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E080C35FF9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZp/H4slk78IiHDNm1oAqEElmdRePMABQQlvBKJ8MF4=; b=zRNJ0DG9eNNObXRdeZuOixBt6s
	wsS7de4lpKq6cr+jhWPOHzMAxM5PpnVWVBtwTBrB7dVOQmnWGx7knRhrpJQAcjsq3jKGCCtwuL8is
	lC9pTPrpzO0OOsE9HHMuJ2+FmV9SnH9O1O+S2v2ONW7b3xxRsCHTik27eVv1kRmQpOtzxbeNr3PG1
	C5xRZdxMxrtT7+6dE3vgcfuJuL1fi180zhAySQJtYPlxSHxU89cYQl/Emq9oaniuGMa2KAFjY9KUq
	tH7+A+XEYro12v66tXYJ8CJPI78h0qukgu+DUckgC28A2q+dkNbjiP6LIBK6TyM9UQdUuBRLB5Ctn
	yilVMPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCqq-00000003EQj-3lNp;
	Mon, 17 Mar 2025 15:58:04 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCkj-00000003DQT-1FbG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 15:51:46 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-549a4a4400aso4826884e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742226703; x=1742831503; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qZp/H4slk78IiHDNm1oAqEElmdRePMABQQlvBKJ8MF4=;
        b=lVK0Xex1hv1CeT+bFiyZ6TIcXcnaR27fDz3V+EiuKQLb2vbIczGON3N4dkZ3C4DqgM
         w2GrwEk16cApB95SW4TYopHBfPHJaUoyXU7VpDNoRG/x3GWPbxatR2sRDl5tmuyuF90A
         3yBH58rH4LRnTc5EwaWFTY9D9jujZvdOWQiNKwcqAvL+rJJOuKWGMSuV2QWC1oN/9Heu
         3327h3AyCX25OdroHkWXCUB/o83yMOUkyL9jdCff5d5TDS07BkdRJ4gIm8Oo3D/fOON5
         4JwcgEn23nGW1FXJwRbhOYttkB1whT7hH2tMOI4Ao9ly+6x7CuavvcG2uFILocQyCenl
         dAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226703; x=1742831503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZp/H4slk78IiHDNm1oAqEElmdRePMABQQlvBKJ8MF4=;
        b=Mv9tPBeGsXTL9HjnQAnakLzyJ/QPM+SFUp7+QptBrxglfWIoHsevVCpGbTDMW7SNrK
         67ZmpEfuDnUDLofUwSE4s5fIqkmsUNUbC6JvsbECHNFjZKvmJJ43WVc2l8D21Cef2A0v
         uR2375gcjlJy5aNJXDwJ+NsEXgVJbp5wPDqVOvztFQRM4FRauIVdf49oaF3JuvsUyoez
         xhZSUH8btAwrQzezpNdmfirYYe+3oJSY5bHdqD6hC6eFSHLbdUb4RIhK/EpSNjzzOCP/
         OlwpJCNbWonxn5aWxZ9MufHoSxf/J3c/aNt4aIPpvApmOes+D89WX1xYNB3Y4g0kdgAj
         PJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCWEZXIR6W2pIYtIMDlY1+sCCOrVGTaj1hmmIAnJKfKuMKi9NnvxZit0H0VxiRLUXmshteDZ9ZB2c5JFo79OqPu5@lists.infradead.org
X-Gm-Message-State: AOJu0YwBksfcr68PqssBjHxtNl5CvnyEfsvlSKU90HH7mOadoFoLgXV1
	rk0I3gNfPhPJ1DA2GWutOrccOvThqzEdW47dzJnyX483AIjzXhd6
X-Gm-Gg: ASbGncthpMHo+mtQra3L3RF691WY9NiwjYC0Ar15gsgGpCQFHlwoHBzeq3ardSoxsxr
	KVqdnqbkBI9QMuFZPWW128/CKXg/tvuGenAPoP/AziQdAvB0hszevO+cqhLwUP8hdJeBwntMmkO
	foo1iVmeOF8CdQRcYYn5ZVHnYwisItVL8kMwTNJcAZvBJFvMK1kgFZJY/YKBknNWHGFykOQQYhl
	f/VPGDIJpGafFwG/6z/CzWOGZyKEk9bOYS44KEt8tEvPar3WcGTo7TUQ5pv50AvaTiInePZD5Fk
	d3C6SULlkY/OF4C5X4fHiGshsReHdca5OpSt0fxDrUTdQZV4NDVYaNN+FdPm0A==
X-Google-Smtp-Source: AGHT+IGvE83lD5O75qXN7tU8+BEUTnVmyQ+DR7gPnljh2efy53y9OxWZRbn1FAQt9KPWJXz11ev7ZQ==
X-Received: by 2002:a05:6512:398a:b0:545:2335:6597 with SMTP id 2adb3069b0e04-54a03d02bcfmr277694e87.50.1742226703043;
        Mon, 17 Mar 2025 08:51:43 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c0a39sm1359539e87.65.2025.03.17.08.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:51:42 -0700 (PDT)
Date: Mon, 17 Mar 2025 17:51:38 +0200
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
Subject: [PATCH v8 07/10] MAINTAINERS: Add IIO ADC helpers
Message-ID: <a94e347b7a1dde5329bd20a34f2be99c598bf5f5.1742225817.git.mazziesaccount@gmail.com>
References: <cover.1742225817.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jMWN2jjOy9xOrAbO"
Content-Disposition: inline
In-Reply-To: <cover.1742225817.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_085145_341785_4C1E1C47 
X-CRM114-Status: GOOD (  10.53  )
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


--jMWN2jjOy9xOrAbO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add undersigned as a maintainer for the IIO ADC helpers.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
v2 =3D>
 - No changes
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


--jMWN2jjOy9xOrAbO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfYRQoACgkQeFA3/03a
ocXx1QgAlMDxwtisjRwLvP8KziloblMOlFslOnZ48Q2HXhA3yRy/A2Xx0ls1xQJp
ChvCUhSiCnQbRqhx8R/4teE4qVQVNynkfbQ2Nv6S9/dc6O4SK7fPqRC0CKk8veFz
bcVWJjuVASjtXvT1uzWgPJIgnDrLeURUNeLuWDEpI5QOcc2P9eiyNOM6gi4GJRNO
v24yX4+JJ9+zC1x7o+er+8PvhFMfqNFQB8ne6YGKs8BobomFtN0OSNEaJB+9LUbr
VopSHM181zpElcvGxK9KpROKKQYANHZTf5jMq43PS+rsiifxT3YjneZ2KmRO2OJ6
RXM+hI/GkXu3MN8wUvzZ898RghADng==
=dZAB
-----END PGP SIGNATURE-----

--jMWN2jjOy9xOrAbO--

