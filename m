Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2F1C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5zlbJSpWOHIuaaWvEqgFmQJc2MPl83PxDlEmoP1fD0=; b=hUnUdzuhwlVDwr+V9SabfEaLsM
	w5vBe0Snmz4QvBg5AFIekk25qghTR/XV/Kq8f4vChYwNxZhpndPaTdcRfHdJEoPgKl0acBZFaGTGv
	DML4qWYQHT78cfqSncNSlyP8eD3A7DPyq5oP4eGIt3EAnWpwKXrb2s0mIlaDCOmEln60PXBlmS/d1
	e7crQffXDpsKYFpVk2YBgXc+qJDPtf6ApfCAfTeYYDlsrNkb7ZvhSv6RPGCPZKyW772mZPABMNX+j
	CKUolulrpK4bATplIXC4ZiRhkDq/lSCsxQvS718OlqKu78g8wQsOcykjpr/zoWkVFYk7RfiRcjJmP
	85CqoBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcEz-00000002S0H-0vot;
	Mon, 24 Mar 2025 07:28:57 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twc0a-00000002Q7g-3ExA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:14:06 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so4088930e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742800443; x=1743405243; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X5zlbJSpWOHIuaaWvEqgFmQJc2MPl83PxDlEmoP1fD0=;
        b=RR7SsxfWGn25U8auIuptF8miS5NwCLbVGmcLr4nmyko4Lxg4PKWL86KOaYCeAFRwxd
         o9uN4GuvHPIt0VNHbed1QxuG6VKokAJ+pnF5mURfsH3u1D9imDTQYSjzXQQw3EWGiaEf
         zlNI5S00dhJEyulPpvCwmblzz6GmB9oryYpyoNsZGEP8zOYRV8P6tCFtyv7yu7JP9rVu
         0EOukUnJQFDJdQhNq2zfIwKcPjV3u/Cg0ztZo+h8NNKXL5Omso7JTod15tgDbl1i/Y6O
         pm7hnQ59b2fx/NwM+JhUGOMegsSWU+iBlcykjF+AAbMcK14YSvnUHhJ12DPMwAJI6wx5
         DoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742800443; x=1743405243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5zlbJSpWOHIuaaWvEqgFmQJc2MPl83PxDlEmoP1fD0=;
        b=U01JzDpIu7AJuEJRKqiCIf+3ipaneK+pZ23+TLb1dI4FhrMD8xv0oOywgky2l6z3r8
         uMx1ZRLNoXTvxZW1VnbGoKAjvu/l4wFynsYGKFa85qS+BtvhK3/0nszia8hydNNjgz4s
         kB5fsYkxZpbxeKVCvvszMNMJpNa32EOOIecS9AxdKvBpjL/2WyIpRSk0tlS2ov+y22RN
         3jZFORd9mdeBK4w4Lwn2VTiOBAsS/qXKIyG+uxhuBm8lhB7Fm69+9xKzIMg1SpX5pV1x
         jDbDZz8TxzLRI1J+nzaIFR7MPgd+upKlBnr5SeDpYPc4T8oOY8RBZ7Vlu1WutqhgzshM
         RQ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcQgP5YBmSns+xWQOkRyVJ5BS3XaMvNnO6/auRLtKih8c0KhQcnDA2KhEOXVkOKapYtrz0y25H0GEG8nFpusEL@lists.infradead.org
X-Gm-Message-State: AOJu0YzVsfkfkknGQyDSjB2sVSOssv4SiNSzk5g/pZmLNShsk4ftiPNI
	LE6vm61ePhERwTKLKKvNKzARkEHTPfJgsDbseWZ0z5aK/h/Ep//h
X-Gm-Gg: ASbGncsr2QNP+ENXyDFwNzCP9HpgpkGpk/xuVIxv/4QwaZ3pY56kuIeo9ZWc2y+Z1IQ
	FYBaQs5JwG2neQYTYsEYjiThjMBlP40FQSK1FQeDSR4MgbPv7UH7ZqPJes1Ay3ptT8R0UKL4U40
	mBiBEZOcMW+iNgeq/OLc8wa/r+3Rbo4sRK70r5Q1/o/PJqluCiRhWZAZibbls64SPuOwF/tpQIR
	10bzl+WfOUFsmmuHxiVcBrPLlUPJRFOs9/sBridoTG5FS6if6K02kN3cLrh4Z5hRY9uPSGDZMVP
	x7GXCJCRSQMylAIiPVwYwrxOy9/c1dK/F+lQmRXSXdEs51kHAbM=
X-Google-Smtp-Source: AGHT+IE0hw/y0ZYh+MtPyuslvaGnvl9GM9JaduCS84yGygiOiK+LICzgtUkhqkQ6zjlppVQT0t4I/Q==
X-Received: by 2002:a05:6512:3a8f:b0:549:8f06:8239 with SMTP id 2adb3069b0e04-54ad6509abfmr3719359e87.51.1742800442609;
        Mon, 24 Mar 2025 00:14:02 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65081a1sm1027115e87.163.2025.03.24.00.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:14:00 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:13:56 +0200
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
	Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
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
Subject: [PATCH v10 7/8] MAINTAINERS: Add IIO ADC helpers
Message-ID: <1263c954cfb74223f322a9c31bd57f13d5516680.1742560649.git.mazziesaccount@gmail.com>
References: <cover.1742560649.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ewp2VBF8ttFnYinD"
Content-Disposition: inline
In-Reply-To: <cover.1742560649.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_001404_815606_EAE7FD7E 
X-CRM114-Status: GOOD (  10.97  )
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


--Ewp2VBF8ttFnYinD
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
2.49.0


--Ewp2VBF8ttFnYinD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfhBjQACgkQeFA3/03a
ocXCSwgAxVnQyxRhTT58mImS7G6uU/aFQDiXlM08CUZ9gObNjgFta9MMnPovZwHU
Nr4fO3MvZD4foJ6OMB0MVKDZlTX6KOg+K2o/delnE1l+tH9PCcPnTSm8Fc5H83Oz
QwMNIhQbwKN06KMJsRyVW5iNLPIwil2Uf/3+Q4J7CNbglnrlXsocA00rke/9BFRE
K2Y5r3WxJapmyacQHa0xauNlv9kPViNh9Vy0VF2io+oy8d9hNMzfQpGM32xoqmC2
+UTIlAzEplINymAM/399yLCxCT6t2lH13ZrjeTiKsc38DvXHyz3pE6K/xX38RE+G
I+1fM4p0O/8GpMnKLKGyWhk0IyfBTQ==
=vwYn
-----END PGP SIGNATURE-----

--Ewp2VBF8ttFnYinD--

