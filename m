Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EEAC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIkYf97P4n3NLrtzlwokY4ULnxlvFjbpCf7nMOEO/04=; b=21qzXpsUm4rNnhdjHlzYIsys53
	j1Uuzeg2QrebfrqjKbUQWRmtSQRBid3XdFIpqYhgbQ6Fjg5QzXqg23hJqz6hfY8BXKzgweoI4bQ+P
	LRjYEiRCM3/bwb8IiRxkLl1gOlU5YYW6GuD34r9gqiX36VED+tPMboLDsrA39XT3n31SaZSuXJ9Pf
	4Q53bUYbNsHW0yN3w+HPFEQRAAYZnu74e1lkbmr0kQ4JPJhvFebf3GYXtNND5yFInldzHsxR9CiaS
	LmL7PB4nx4eZuFF8tSh8aj+loBRNmwgy64z93w/xJRkeVN6xdX8557fsdGZLtyTsoRxZImsiwgOj9
	VfZi8VIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdYk-0000000Esxn-3QYz;
	Mon, 24 Feb 2025 18:52:06 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdI4-0000000EpoZ-0qk6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:34:53 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30615661f98so45764291fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 10:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740422090; x=1741026890; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oIkYf97P4n3NLrtzlwokY4ULnxlvFjbpCf7nMOEO/04=;
        b=m2CDpTUe/NADttkDt1Pk1FCTtRv1g5BpLpoHWScjsWAFETb+I4T6XaWFPE/2ejxX7w
         6AwfCRBZWdOtOP+kmxHp+ljB4IFxZiCbCCGUu2gRcERKgOF+4/U1gqzUrw4PftUVs8fC
         69xxefHO95mC7AYmHzpt+tPI4LQ3ej/eeP1L+4wpz7zofFzYIr+PzKSGdYb/Uymrhxy8
         mUcgDABgeJ0cvtDJ8+c6Vd+7x8fgdhqYqlpDNkg+zXXIgsDrfhIiAolWl5bfZG0NraT9
         JhKIgUjxebvf8ZX84/CjzKvXB0AEdAVZTNB1lL3Kv8cE0/xgzRgA+4c/8tLrDyEw4RQs
         G6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740422090; x=1741026890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIkYf97P4n3NLrtzlwokY4ULnxlvFjbpCf7nMOEO/04=;
        b=QfSTLJ8ut5+CyDtQsFj9B0XG3/Ob6DWTAlG0xnL44AOIbKVCPZo6wiTG/SEMLRYqnz
         V4NxD/p1K3g22URdFK7a4fU2aKLpvIkyhq9RynbBuz6bapBE0CGG5mqxF4mxbFxdpnzr
         dCvbSNvTp1QoH4youvmbj0GOYnVQarPcdGnpVB1uXkstdsBBtamQSJdnCY71Ynh6h8/w
         3PPhB2X4WvygQgUwB267so+GBLIRhm4SdQe2aTPXTeM9zBUTzCxORudRH/qoj1UH2qAu
         CkROK7w4dp3tKdwTNoCtejoToYA1ZY6pJ6MirQF2F2IBVaRfcpCSlH5FjD1aWVnc1tgQ
         Jh3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUi3aAb0uJJTkPA3FDZRzd2NN885QfPw68qz06q/T/Lv/L7C8S3QRKbh5IYvlsr1z317gYGBx6vVF/PPUrFSIrh@lists.infradead.org
X-Gm-Message-State: AOJu0YwHtZYf7epk77qu7+IPe6Y6k5CcI4msB2ANWIulIDHymUyuSXhg
	H9VrHdhEDMgWL/IMrqDbmRoaePFP0oSvzFrTW0nPVWzPZZAT6B4U
X-Gm-Gg: ASbGncst3srzzkNY/ObTO8WO0/XOLv3xe/i3WgvRUVTDLxukTRteg03sE41hG+iBbq2
	fAnBEnZ5eSXZf4Af2qC8wV1OkSCsHRJHKx2CupwQRFM6/xFxf3dNNvODfS9oAh9bu/FF27s7OV0
	BfqGWoNyr+ooMn8zThG6lbi3P+eN58Uzu2AgOArX02Q4Vuk0Y4iXRbTnhlMHQ4u2jensdfkAQ09
	2HxyX7gjgHhpHCWS0vvYCJvLYSnxvx9gOwtPX5cLWMeYvPiQtcS9bAMDceP5DVdrnY0qZOUVUlV
	9rFDfUw5oDqchUGe7buBQ2IstkK1ZbvU
X-Google-Smtp-Source: AGHT+IHlnu2JCoyY3lnko7RRFUdy6VX59uK9aMyzAe5hg6Irx/qYyxzQ9YwTyDI8XMZofmwi5dO6yA==
X-Received: by 2002:a2e:b8d1:0:b0:309:2627:8b04 with SMTP id 38308e7fff4ca-30a80c247d9mr1391031fa.9.1740422090039;
        Mon, 24 Feb 2025 10:34:50 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819f4f4csm52781fa.61.2025.02.24.10.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:34:49 -0800 (PST)
Date: Mon, 24 Feb 2025 20:34:45 +0200
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
Subject: [PATCH v4 09/10] MAINTAINERS: Add IIO ADC helpers
Message-ID: <b062f5bda18027f0c0065f2188066857f8a7d573.1740421249.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="79e9OjSnaY+N0AU8"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_103452_246755_5C3944D2 
X-CRM114-Status: GOOD (  11.71  )
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


--79e9OjSnaY+N0AU8
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
index efee40ea589f..c1821fa8099b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11200,6 +11200,13 @@ L:	linux-media@vger.kernel.org
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


--79e9OjSnaY+N0AU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8u8UACgkQeFA3/03a
ocW+9Af8DzpO7JQvFk19s1ybEKwla19U9LNwZ5BXpTh5F7Sbx9QSapqq4w5p3Ijx
n1Nbw7YsRZQbIYwgPxStUkCvZBpBDfJE13MTYfUxkOBeOGCVMAAnaCnfEkcxGh3Y
a925YCi71Zvym2z3CEYACgy3xnJJz9lcIVJJxGgd31r+SU/WLJOl1Pz4I0y4rGDU
H76m8ZBZD3J4TQXZ6Tv2pCGQLcHC+iwBBusM1gdSUiZLaPOSOBajG03Fs/WEF5VR
sQJ4h6TLnt9o4jAi6nWhACiOJCr7mRl5Qk9MtmA41fvdOtLbVLNusbAyBg/SxvHp
5gmIG9ti8cVRqLbOOZy1Ht2BGlxwdQ==
=2wGR
-----END PGP SIGNATURE-----

--79e9OjSnaY+N0AU8--

