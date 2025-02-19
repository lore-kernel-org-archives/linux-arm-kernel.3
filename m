Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323CBC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNzXBsdWjpLDVsAJfw/fASRvRFeX+ndkn8tRpPOZpL4=; b=o5Y2AfnIZU5+HTnrUwek8XEaZL
	mBC92RO+H+bAd+xQ3uVUX8zGCrLMp+mXMKWr/vc0VGUPJXuN2jEs2mogFZs45wWbkICebBlQNCcja
	PSDBNuCXif08WEHuczlwTZcNSlg9WnLke8/C8i81PVrxCmbBsisnj0zcI3eivs5+FNKBEQ+blgPbj
	qbdA6zuwTOdz1vodXHEfzcUdfpe+gqG47EPehsQhOzp6spZu1iX+bUR9FUBXMyXiDBcdaVY+RY+5A
	Roqg7A7ayHSpQsZj3/lCuNjdOMk8ubPvOkWYsRjudYUAzD9we7m1k0TL1bjct8xZLBRxBSrNPpYvF
	omOogp3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjKd-0000000Ci4l-37Ub;
	Wed, 19 Feb 2025 12:37:39 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjEK-0000000CftO-24MI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:31:09 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54626a71b40so2570552e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968266; x=1740573066; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XNzXBsdWjpLDVsAJfw/fASRvRFeX+ndkn8tRpPOZpL4=;
        b=IQxGpoogsTc64J9My3CR2FpcvduivZXn7PSvWdw+uQFB3kioBzfRFV3dVRSSe8Dd4x
         1aAQFP1pCjE0C2EVcMQF4udv4hRLruBDFRypQURxZ0N5aoY1GU/gc7ToeAIgpRg/panI
         VZeD0shciMYp0c/bm/S0sOq984Sb/ifRJkbVI2jaWZQOZPIg60adKpASyCQizeSVDXL+
         RMsXhPX0eP1Spz1Jv2Bgr1VU3ibo34KIY3RE3p5wdnl99MP8UTmTvgplHnQo37DYLNT4
         cBDdvtDSW0LdLu+rWPKwZZ24buWw+vfhqAeUAoDDeNYpMPL66Ca+s9lNw+mCiWpC8Wod
         Md7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968266; x=1740573066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNzXBsdWjpLDVsAJfw/fASRvRFeX+ndkn8tRpPOZpL4=;
        b=Dr3ufBLDj+SGpJgxm93xG5iFr3kwG3LatkN9MQBHXh4cqo1Uh8NOYFQk8lVVYUaI7G
         HpLA5ZEntTsECBsh6ivZN2qxpyGnPKh9CplGYYy2LjL8tQ907ZmN5nizuohJkyHVZb+8
         V0J0UyOGm9Dx+deINlaU3Zm8FjkPqiG9bBAPVskmKhigYxlgo+SZM9DhPjlAIwknAAxl
         NwlmXqfIlyI/J/YxfAbMOaKkvcG3MkoP1N5zjzF1llMIcjF0gzAtXHMpPS44H2KZPOEs
         BS1bGbMBOT/EJIjS2H9QNHxdwRcbCgcDL/uSa3GPYY9sM/bgkZDPsPQ5aZQ8ST48e2fG
         NEXg==
X-Forwarded-Encrypted: i=1; AJvYcCU0rmEQhj+hQMiV1wqLbd5WdB76QQEghjBoegfDMMe//z0N4fPt4Rb0InDLpJlbo/S0BxOU2AHAVlsacR2HYhDC@lists.infradead.org
X-Gm-Message-State: AOJu0YwKBH3U5861ixfmMVKE9OKci0sE84jJepPH6o7X8FH3HIdhLJSK
	PKS5vjzVgCvTFjSL4kpaSxGrRm9FpRAeUE750K+Lf8dlZciy/kYE
X-Gm-Gg: ASbGncvBuvYHrYIiv3+x0V/3G45v86FnBkiqiN9b+eHZemvHAmd76wCa1jbMbpKJJzC
	BCEOp3YMNGxRtlWEo8tgwiwdIq+VcOhP+H+OFn9D3qDL6mBpNNHXGi1kLIbC2FBb+PPoYtKoZyU
	OI5kQEXdl/xyrYgIwfLkpqVx0DZwrYCagFNbpjPiastrAKW16XYsST2h8TSnH+gKEFiaiWbXJ8G
	jhDHYx3HHWOGMDPWxErzVjheZFZV/zE61L6Fdff6nU5rqYwyHSaMTHqlGjdGjMFSfthF2pnKh3D
	Gr6ASRlWX9K3zViCWU/3IQ==
X-Google-Smtp-Source: AGHT+IGbVYVIJzf3Ky5RtSpHDBC96A6gAGmLe92KwdhKJGUa87dA9Nei6u7W+ae65z5/SkdH7rRhrA==
X-Received: by 2002:a05:6512:114e:b0:545:b9a:b4b4 with SMTP id 2adb3069b0e04-5452fe8fd01mr6567349e87.52.1739968266349;
        Wed, 19 Feb 2025 04:31:06 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461cfe3a7fsm1193290e87.34.2025.02.19.04.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:31:03 -0800 (PST)
Date: Wed, 19 Feb 2025 14:30:58 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v3 4/9] MAINTAINERS: Add IIO ADC helpers
Message-ID: <65fa17207c7c716d66efb95733e6a37512465605.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x07A89EJB3DmszZV"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_043108_534218_0208CAEE 
X-CRM114-Status: GOOD (  12.29  )
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


--x07A89EJB3DmszZV
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
index a87ddad78e26..bfe2f53fa74d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11099,6 +11099,13 @@ L:	linux-media@vger.kernel.org
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


--x07A89EJB3DmszZV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1zwIACgkQeFA3/03a
ocU7HwgA0cGcPRNsovTvGC4vVEpqkMwltUbKNh1IXuvWu9i//o8vPhyV16w0TJ1q
qXjZOjCBIzR/Gh0OORKYMUYpGOlunAk49/h1mv5EeKEbg9H5buLgthjE7aBj1O48
fhz+HOVKIUJY9y7IkFjtVLqR6pHJfAjpqZ8HuubNkEKHegztdPvE8VjhB/4HDrxO
GAgNaEuUevO9/7tBnDLyr1qpo6PkVkIZqAziP0ApIdf7l8hlmabuc4XYpvu4U6xZ
pOpexx7LK7PCUUoaTXZX2sWrIxoEEQiM75Q5PPZvPvzftLgrCeDWy0u3syV9AO/J
p3ZuHFMAMr3oTFvth9KbobVJNmSfPA==
=TOaW
-----END PGP SIGNATURE-----

--x07A89EJB3DmszZV--

