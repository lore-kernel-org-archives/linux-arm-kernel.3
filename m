Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88752C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 07:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFwqzBXDybwuD2vjc1RKwbgfdx/o0MRc2L5yNvshUHo=; b=chk7vl3evakqFtPRaM4mrFzIQU
	sOcBGCRGtqYr4IZm+/vhmsx752BVmZpBAfkbSgJsS477FMxJLOZvC7hbIVMnDLlZo4Zln6//B9C6j
	QzNH2jstzYSm9qdsfy8giggklR13sTVRbCswfGrzVmSbN6U3Hu2Xzp3J5SixbkhnTDbeQIAM25GT9
	MCJH2vcgEJv9YqJxZkB8F+CQXIJ0GWwYUHdzRik0zxcdwuZjUhtUKMduDgLipbBnRl2Kwb/XM6zsE
	vxblsBlEgg/RcTPspRRqQ9DJpERMtCiXoU0iZIeIhjor7PC7RMGFp9E3hzQARTBNjbYtex06ELBSz
	ODJyvucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdE2-0000000APgm-3KbH;
	Thu, 13 Mar 2025 07:43:30 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tscqj-0000000AL5Q-3Gjz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 07:19:27 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30797730cbdso6258531fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 00:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741850364; x=1742455164; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xFwqzBXDybwuD2vjc1RKwbgfdx/o0MRc2L5yNvshUHo=;
        b=S6x7d1O6eGx1sPFr+mubXRuPrnyV7ssFcvAG6XjyFzxWWoC4OfCoL3cfqzUUzeRtfW
         I5aeVpAYuuuKkcjna4Nc/QkxChuWz2ZCczHoHhmavHhq/2V6iUejnI3cjeBNfQ2JXfQG
         oGuonyyqv0NVhU5QJXB5ebdnl/SRd5Za8/6XXhqxqI66GHdlRq5chVB4XYHqeHG6Drg4
         6+v8wETSLvArL0mcG+y74LwEbLO0CJOokCAFvdn3gEHPN5tA8bC3nIsLQXWPhaAdUOeS
         6UziNbRzcMkwOhahtX/fupd3BFpjXkqELK/LhospVoW5uHdT6wlMJT8zE5s4aDZ+bQxg
         OriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741850364; x=1742455164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFwqzBXDybwuD2vjc1RKwbgfdx/o0MRc2L5yNvshUHo=;
        b=MpL/u2W7idsBx7G1JXoXOLjD4r4u8B1JyJHCkrbAEXxMKQqHy1YGQyWAMhnS9/yfBg
         JlEoPdKPDmI+/KFU5HQFwmRMqjvHwuLzGwGJgbdA0x28zh+j0V2BeqTOwPGqLEoOZ6R8
         2KvbFqz3BNlG82luzkDqZwnam/oBKZaaoo11SjMDk8OrNMsqCPAejnM7ZmC2+nK/IJL2
         i87VAXvpVb6R+H4Z0/OqsuW7KKLUtZpp9wpM1kr4Vqg7LG5xPvXdftszRmY59iXKix3n
         nd6rRlSU4H5cajSq2I2c1v082ghIHuRGVyUqAoj3MzYTGXBggAn3wpK5D5T3qZj36DeU
         7bhg==
X-Forwarded-Encrypted: i=1; AJvYcCU8JM2dIFV0Y0tLzDMSHCNdi17TbMNAfXLBhIvhnsGldFTPQFy38lQEZtWCjA9t2BhdQTR7EbzvcIihlD/70hND@lists.infradead.org
X-Gm-Message-State: AOJu0YyjAPYpZ2MaPniRTOu6S8bFkevDgo4Hb41MniGUirs9mc0gwNtU
	BVssAwrVdK79qgJ08dnOtm7K7Al3HBop2Qa7cVukAMYt19uWzyq8
X-Gm-Gg: ASbGncsAxadyq26xYQqbB6Q0+WX7W5zK9Pg5rpaX2f7hPudjGE0I4b+wRWhG+Ff7P76
	tQcHfrL72AXzN/1weL0I3Y9cbKvMsFHZRMgxEu4HMR86z9MoyKrOyTDNA6B0uEIZ027V86+AUKG
	1tGB8OFJ7c0BaLSmztSGTowdETVsCuTdJ6DoHV8ljlOfak/uWczUEKQI/v+GtCpW+DsVfubszQw
	Psu7HlETn9p8IF9gvTy7ds/piF51N5bCf8OvSTqQqRxK2j/cQkhG95YNZLJsVw+eETmJtxUxPql
	VeWb4/mbcto2aY+xDgNZAH7Ev++O0LdcpLcKiKWHamsVLtA5338=
X-Google-Smtp-Source: AGHT+IEjv3VEotqH5VFMYNkLSITb7yxLQ+/ZPsDGqrkSfM+X1MuBHj1FF3/q86MbLY14fdbT78uThw==
X-Received: by 2002:a05:6512:3da3:b0:545:1082:91a1 with SMTP id 2adb3069b0e04-54990e2bd29mr8607537e87.7.1741850363715;
        Thu, 13 Mar 2025 00:19:23 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8851c4sm117554e87.199.2025.03.13.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 00:19:21 -0700 (PDT)
Date: Thu, 13 Mar 2025 09:19:17 +0200
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
Subject: [PATCH v7 07/10] MAINTAINERS: Add IIO ADC helpers
Message-ID: <b1d1358a6e8f436fe6a6d5704e63abab660950c8.1741849323.git.mazziesaccount@gmail.com>
References: <cover.1741849323.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H8QAWWuku4uOTwSt"
Content-Disposition: inline
In-Reply-To: <cover.1741849323.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_001925_846508_C557C445 
X-CRM114-Status: GOOD (  11.16  )
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


--H8QAWWuku4uOTwSt
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


--H8QAWWuku4uOTwSt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfShvUACgkQeFA3/03a
ocXgIAf/SYEOEjN0fysrCaCgrEuPeg5uKTPDg9mCm7K35bm36KYpZkrUX4WcZFsG
HxF+grWO98il0+w8YpYtNFVU0ureaf+sM0frxSTd5Iv2BfQMa2flmcnrEqXPgPtP
FZ/hZA6gUAgExUU+fs+nQbSqLkYxuYp8z0NxwnipVYJz6JupSNgI3jevCBY/mXXp
Deb88x3LzC9x2iwaGd1yaMhs2JeSbkeZWSz0fmvinB0881zxkId2EvLR3eJ5NBuZ
pOJXGC/SACubM7oIo4BTJ3UQhODieMHUZEhaMgbxzwuuvpDWhCqwz90UvNj5ZSGy
jv61+IuPJ3I14vufpID4JxSi7Xe2ig==
=01Pj
-----END PGP SIGNATURE-----

--H8QAWWuku4uOTwSt--

