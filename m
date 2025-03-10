Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4466BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YGvj5iF7isPICFknfIGBgf8Vkx+OSuL7svbCQwNvKw=; b=e+8elnFzNOWB8pAYWmNnuajx96
	92jf8gtisoMrlP0brEMrY34FLnpQQPhgquWCIJaCz+ecmADuavEo5ciiQmOEh20ad/9zfzzZPvKy0
	pdxnmwUISWRRU5jLd727d7QbRFoV47FuE8MO/L8n0xLR+8PFnoFu8h+lThhktBRWplGYCJnM5G7Sy
	RKjQaIsLNFXwKoyrGsA+IzoLA75Y/jgFU9No/P5iScYDFdnzcDujGqJQ9OPCwAC/jq5hLLscdXwa4
	ZGZXFoxDxWR+roiku1+25D7LcrDdG2qYTuFgjAahMUIcfPvtUhh/WvLEzGhC3ruHbhqqfPDaHTEbt
	2Q6vvOjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdel-00000002rl7-0JgF;
	Mon, 10 Mar 2025 13:58:59 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcgt-00000002hmr-1aLV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:57:08 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54957f0c657so4924817e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741611426; x=1742216226; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3YGvj5iF7isPICFknfIGBgf8Vkx+OSuL7svbCQwNvKw=;
        b=YrU4/HP51K+XLyjF+Jy5MPaSrPAmoWJrupxh91maNsuUP0mGFqWXtQHsd0z2L58mvi
         ZUi3OHP1jiHgvYi+pSoZnCOGalCwS97MpTiO/xkYZuK2vxMgO00XCfjrZrKyN/AMMmLn
         BXJgAIBY9nznZsivWbqBbVG/BxfKY5NNluTarsVAQvunwSUXrItsI9cwe3uc6wgY5eN7
         rY1cmt2gB7TUL1khR2qVs1FIjCC4NHnqSvlvBXOQ38cOg2BtASRtGrFrpDd10HNjTYu+
         FNjTuB1BN6dPd3lk9Ih2pUk5KH9N71jpkznxwLrh/l8IIrp3ry1dV9+l7NBHZDEvHVDv
         60zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741611426; x=1742216226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YGvj5iF7isPICFknfIGBgf8Vkx+OSuL7svbCQwNvKw=;
        b=RDcQk/qJEZnU7PSw6lD5Tyf98VKW1ePNb6GcTBYBMsXBm3p4SG/WM8Fj5aTOy2png3
         aV4RoStlZsRkLXd79uiXAs6W+gRMcv/EJoItcvp2o6jfXOGhYr1QutsYHhmbVjrw4KLj
         9PAO9bGn7+TJcK3eMCxka7RT4PyX4HGlOZzHOB9nCpbXkf0N4UYQnjOHHqE+s74rHVrw
         54ZguldAA5imABZ3CdaJMBRHIQvt4aAKMtv99h5dcyGrgVErHkb5tv9+SOozFxocc3J2
         AMn4A0/0yydH8MqXzDeGOUq80q6VjItOcIJeHbnk96b68vPch9YTfi/5sUA3GQTYMM3o
         x5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCX0hpY5cji1UW8yJhb5bO5PZEMV4FAK5tT3FYSkZxZx/S9BZd7wqfvxi+se+2D8yL3sjzZJq3UGZJaYwrpgDyVB@lists.infradead.org
X-Gm-Message-State: AOJu0YzaB8aLzyRfzuGRcWA4+2VqMrA5B3AC2dbXWm4UxE+rmmOzptks
	lCfRSGlSAyjeQK2bxPU7s05Zdq1VEfJLPuEc2iPSpe5tKpDRnp0/
X-Gm-Gg: ASbGnctg79mNRSuro+8tyCQjmQgXRjaZiKrzXxJDs9Yy0pdLTK/ssbuodiu92uioSiO
	YFnmxodwjHo9m/dYmrI1DjhAavXDE/y1SmuOeF0koqTD+ICgWI7+CG3eOsGaaNUSPkWXEXOe0xE
	vUc03VcbC/HtGCr96HdfqnFMI68qBGrHl2lArctwoWgkJ4+oujSkopgidhD7l9GFbsLfbA+YmnZ
	+J3K++kPjs5NtBfx6UG6XP5/aITbcpP5yjslpendAENM2XruwlD6xFi3sLaskZRxysYGIbMe6Wl
	h7LpDxBBd9kE7BHSaMXpWglKKHl8OAcPbvWzF0JyDmg/1PFKddm4bxvZ037WSQ==
X-Google-Smtp-Source: AGHT+IF1vXuuBbI7nLmEiCd1MxAiAY5UstFD2g17yL/xAwUgcupEf5SWUE4YyitfHSkIrkHA8dJSBQ==
X-Received: by 2002:a05:6512:b0a:b0:549:8c0c:ea15 with SMTP id 2adb3069b0e04-54997d99dbemr3607673e87.0.1741611425535;
        Mon, 10 Mar 2025 05:57:05 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549a17fb84csm548493e87.250.2025.03.10.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:57:03 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:56:59 +0200
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
Subject: [PATCH v6 07/10] MAINTAINERS: Add IIO ADC helpers
Message-ID: <e180c9de76bc478b5f25ab6f5f22377cd359d485.1741610847.git.mazziesaccount@gmail.com>
References: <cover.1741610847.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w5HoDH4+gEC/QhC5"
Content-Disposition: inline
In-Reply-To: <cover.1741610847.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_055707_414348_6E89741F 
X-CRM114-Status: GOOD (  11.59  )
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


--w5HoDH4+gEC/QhC5
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


--w5HoDH4+gEC/QhC5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfO4ZsACgkQeFA3/03a
ocWNqAf+IQRt3DbNgMIf3rJrd2r+owYri/t5E1ozJOi1oIR58An+x6UmSCHr5dJv
cDtlgGwGxpuGc3iPKf37jVUxxk5kp6JLA8NCuBXKc2tLL1Qc70DU7f19BKuoSsK1
eizo1NIesoCze4Rl/q7Fnkh+KjVhvmqjM7N7L8e7z54XTXxlWnKzXXVuEcYW2DBZ
qgaMrb1PiAebugxTKLNi5Vp83oR83dfsWOggg99Tcoy8YLRckErdPegMIo2wnG3f
xRvwu6TPWSHBpWdBM/WGvHbViyzVDblOoLkhGZ/Mgc0AY7LYZDQ/Q1hiSwl2W+27
let2ZeX5sAhxe8/7wNcP++cQwQTrJQ==
=+UhA
-----END PGP SIGNATURE-----

--w5HoDH4+gEC/QhC5--

