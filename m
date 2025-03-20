Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2AAC36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pmd/n1xd7k2T8XMZPqYkLOsLsUUybFUobREHXbcUvsY=; b=PjnD0J0tL0cDlVbjkWo0TEBP/3
	jnlvlXdP4To9EZjGZDG3AkK/JApX9UoAUJCJbt7djPP44oAQh9t7n/e19DBlwD5rkT1u00ORTkWvs
	geGjjtrTfQxoAzKOOitBAhfa54I8Pk1QRGgYW2zf9PECf2u062XLaNeY9b2Ib1aOLaVYCncknf574
	V57zyY23JcJwh3c0/3fxqILuw3EuIQUyE7pZMfWjkRHKgiIspl5aJD1pc/4BVpfybDqR8fK+8nUy6
	nLJDP+YwSPOAnkfzCKHAQqINEpfI+S9/uqkggpbm/37QJHP3U+I6Q2eWQy/C51VGLuBAjiZjkWKis
	23hV2bjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBHI-0000000BX1y-4Bop;
	Thu, 20 Mar 2025 08:29:25 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBAW-0000000BVtQ-0a0z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 08:22:25 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-54991d85f99so1785836e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 01:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742458942; x=1743063742; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pmd/n1xd7k2T8XMZPqYkLOsLsUUybFUobREHXbcUvsY=;
        b=WbabXw5yf6LYAQz9bhqZz7kULyAy1sEgCI1m8hfsBsBvutSfQv7xzc+T/iHjCnRGtm
         VSqhJY4WY9sHvEXVEBXod8i4iFnQZsC/W3UHponjagzfQOJw//OLsL5WpV+5y8bruFar
         MbBKRADhlgQ/NgU04P8UizMf6n1P9rV+V7hp0KM3d/j7aYW9BcgLd3PSqusCC15OTdi6
         DBRip1zRnXg79tBaRvNkbUlo102Jd3BTlgV39oohqIx/17HIEmUCGZtYdn/jnSo5VVR4
         xd65GBV6/cMdPsnDpJNuHWI3FfQgohqJ+2CPjyhDC1tyQg2ys+1outW4tcIV53AD60ra
         /4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458942; x=1743063742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pmd/n1xd7k2T8XMZPqYkLOsLsUUybFUobREHXbcUvsY=;
        b=cj5UmNoKOuG+sRiwkDUa0U4ootG0en92QO6ZI8idpl+ukwuXzdf/vDuBX5v1KCr3OF
         58Yo/+4zZiOfrF4ubNiaX1j4qGi8sm2nCkredufVV0YF8DjIHpVLL+3z5ULwUaT25zIZ
         Xt0czhXvtTeizUHWG/vbNg54YmJLEZjlNv3v+xeb1ENYTSzS7ZAg6AL2AuP3xGkyLB0e
         VsBKh9lS5d88/mMr6dFRTfRQEY/SJX2oMgQc2FU94pVMs34DCJzSr16TxkbFdP6257IL
         +X7cmSyku0amdwr1IwgJyRukK1sPuqTRAsB6HNMqgSf+U+qudCeAAwvpc2aAslPcu+Xl
         AHEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmciuZ0efiCAfpeuMAL3u1cnfGsFn7Y1Qa2LsX7lhawGi3EAj2+HNST7nETcWOMfUumCM7ChdQd2vFOG9N8/06@lists.infradead.org
X-Gm-Message-State: AOJu0YzjwBQhI9W6s7mQbtK5OAxJMY4pEV6Ep++b03p+GMsrthRM18n6
	MqovS16HnglUhSWwBIHsmGHhxllJA8KvfqlHTH9X/XKv0wSh7YnX
X-Gm-Gg: ASbGncvbTjO7u0bFuEpHhyZGDnt6S8XiwVp3Kng3Mnt2T1Xhm9MDiF97d69FUJhDLLN
	stf6FZxCOAKmIh6LMsgTz9bhlRG68zXQB7OlT5CQ1EF9wFqtoUyxhDk3ZgEfSsUd625g+mBNIQw
	4ly82pXjVyw9BmQTtFWFtLcMdfPgffK3vxm5TL0zEWbx/ObNPyurwkAY0G6kmspfUJbzLWjPwbY
	4MTJX7HhQr3lYbTW+MNtiJAjkUJTi4+hH39MIrNtgH6enkH+7DQNHaCPj9SgZktrldLmUtm3ntC
	TgGrRSUrTiod2H1gm/gLzZWCEq25Z/M0vnoNibJqYV8PtIj3Mus=
X-Google-Smtp-Source: AGHT+IGN7jQq3CGHj0RH91IeY9Q032+tQbArvaah7gKQeusMKWEMnoW/5Hlgr2n0AqqsWIEjFWFNPQ==
X-Received: by 2002:a05:6512:1596:b0:549:981b:169d with SMTP id 2adb3069b0e04-54acfa81f3emr851829e87.3.1742458942033;
        Thu, 20 Mar 2025 01:22:22 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864d7dsm2141832e87.130.2025.03.20.01.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:22:19 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:22:14 +0200
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
Subject: [PATCH v9 7/8] MAINTAINERS: Add IIO ADC helpers
Message-ID: <c81db29201f10b50f03971bc43fc6fc1c63ec4c8.1742457420.git.mazziesaccount@gmail.com>
References: <cover.1742457420.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LU4zmYhbxNu61z52"
Content-Disposition: inline
In-Reply-To: <cover.1742457420.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_012224_169345_C7C13856 
X-CRM114-Status: GOOD (  11.25  )
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


--LU4zmYhbxNu61z52
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


--LU4zmYhbxNu61z52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfb0DYACgkQeFA3/03a
ocVHKAf+MPHPcl8h0q9Jo2dudYpTD2nDzKrEj8KICCiF9YQvvTj6RSGXVd9Z6GuP
wYX9UYNaarCpcpiEwOh3jytWvUcVHt+9fxwz3Z4ObFLXUqHQTg4ymKwT2zOWUDYq
6ukaqXl+8NSVAoXVH4FbjfZsfiMWb3TeXdckgpEBCBIl9/rQIzf0X5V7H8RQke23
P0gNLTiQJI4H+OymLXMlNYIkVPaZ2JFwEuiP+ZHYyuJvOvj4MOKT7t5coSbcs0T6
JqoYlU/55pcjASW4oTUL7VhWMjnL0UXLJLRjLJjJwMs1/iZuwpKNXrTKKYewEts9
1tvceWn+PujhGuuNVmJTjoZH1mnJNA==
=oGui
-----END PGP SIGNATURE-----

--LU4zmYhbxNu61z52--

