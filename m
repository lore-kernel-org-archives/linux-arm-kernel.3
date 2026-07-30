Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4561C5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVGHrnlM8S0Tru24jhbKwCBMGMa41rcxjUCE1vIpC6A=; b=ZI6yYYt3RVgGyen4cQYuIPom5I
	s/9GMg4ZQOpfQSqeYaifovdcocYBKRx35Ae5d31xCrCkqrCGVyISYeIrLUq4NF7OMjclSOhZb+mD0
	UrRrV0FHzbnLADkQg+nlRZZ9KJNvB9Nv4LopfyrGup8AfFDFU1o6++YJWt78sbzbXFM3HozPosLrQ
	NZxm3XYBYi+wnKnp5aXEFt8uEj7tQ99UKAZbtfFRrIDS2b0h8O/zsALAWXuLLC8LSXTmB8+vLgKaI
	fjy+17g3QSqwr5GuqX2bVY/VSQc6ohmhQQS7DrwJdboFIHSpyaRJ0cNktBOXHGvb5dcFAMyzJTRcc
	yPA+4wxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWpq-0000000BHNK-3Dyd;
	Thu, 30 Jul 2026 19:54:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWpn-0000000BHMZ-18az
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:54:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so1365905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785441265; x=1786046065; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVGHrnlM8S0Tru24jhbKwCBMGMa41rcxjUCE1vIpC6A=;
        b=KBpTmAqtq37Q7jINUqu3dvbeGArg9Lraps9cJ4LODCaTi/isBYwAyJ4pFVTo7Kgdcr
         IvkY9QQ+iaEGPraFqndWS0GEQE7ChvYklg6tnawPEoh7IqkIV9NCPmI+nFjJ1jGSqVm4
         HuOE+nrQHndwizkA6GwW8AKzMAKX+J4wKPoYvvrIjNKSKc45aQw4k3d0mk1BsGWQbvuy
         OGxYeagGZ+soChKw0NpMAgm8Vt1DLWXqUArvqeAykL1XjjSa7Q/VvfD4qJb6VG4kjAfL
         6ta2bW3mHUjVoncLDBdI5K4GsLt+5eSsEhROCdLnQtgQ8H7wPPrUpvzB1y+SHiIzAMsg
         yBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785441265; x=1786046065;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVGHrnlM8S0Tru24jhbKwCBMGMa41rcxjUCE1vIpC6A=;
        b=AmlTu8BCfy9/jkshsd6MwU2ZVSbhBGjpFPZi0igbXReKknDneEHSx89p66oAcZqT3M
         dAx7cvd6v/kiRIsuvcNm8vOhh+O+Dvu8+gbCAESb1uSdxttN6pOJCVE5jEUWy5W6OlKU
         xZ9pSP8eRgHBTvd/lj+E/THF0+l16EfYIdVq5jSP+xpFSyO0e6GNS1K6lR7hRo7n3q/j
         22PVwi3poYUoFXDHS3y8q3mYtLXH0KLxy84UV5FjRS8GmUEMx+aKSD+sYhmtbtCSuU2j
         mXCyyKsUdxrok6NDtNXY9htZ0LYdm7fy9DBozy90XPcFgYdjALRCVjCuUoYXnYF2isyu
         IkxA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6YzKotUbu6TWZwkzee5lKIBy2Ewa0EzG9pthDzFRqTuk+tNg1FAylHqY+8V3z9/06DBvC6Fnwu4aiEg4Hs3w0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9ZkTYtTntMrnPMuauY9CKS6TEIHRFgEBC1aTc0TsYntq8XbVK
	aWq5jhrAA0Uw4wWM8Ae56GkNI6K05sP8IJvmDa9/3CyNbrQZPrBNK9WcadSjUOEO/0Y=
X-Gm-Gg: AR+sD12d6cWzucNMekqdjT6ZzhJXLAW/ts2l8xQo8TjRVxsB3sWKRAvqXBT09V5vlpw
	JlXlD8J+TsgOp1Xtj6FpvMhn70Qsn5ZAhSKUJxPdmVjTaw4VPOTbxC5jJfymIqxWSyad4G96b5P
	eVxGcRXTT2rAQ8TwkXee7qnGb73hFsBveYNJjanSzYR1pwsjc4ZVhfqC25/kQIxi2zXMcSaYGgr
	LAaJ4zCI7UFrDb9ucxmnUImfLLbc1U9R7wSoJe4UsY4y4FVvPj2TifRRVpezgFCknnkjh1Hj4IB
	ISieB8Bu6khfOjgfAifRcHMjtokxDvmFqbqASFBRZHaOhdFm724KAPZq5hpQGpKm6v78jOs3uDX
	IbzzbBB8Y7uWcVLkDw5J5t/KnmAAT6R1YiLNFy/OYxBaLCqMxuxZksgG2SbahJHNpRIytIIA4di
	elps5hduFy0PhZ/QmwO5clizevloM0UFXuSnhxb/MmOPspvI7cZ/3JC5aXqz0R87cX2Q==
X-Received: by 2002:a05:600c:a3a2:b0:495:6396:8b67 with SMTP id 5b1f17b1804b1-49800e89181mr42298655e9.4.1785441265073;
        Thu, 30 Jul 2026 12:54:25 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-498011f341fsm71200825e9.5.2026.07.30.12.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 12:54:24 -0700 (PDT)
Date: Thu, 30 Jul 2026 21:54:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
Message-ID: <amurhVbZi_y0N55n@monoceros>
References: <20260731-gp2ap070s-v2-0-1bdfee07d5ea@disroot.org>
 <20260731-gp2ap070s-v2-2-1bdfee07d5ea@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6iqq33laew6sina5"
Content-Disposition: inline
In-Reply-To: <20260731-gp2ap070s-v2-2-1bdfee07d5ea@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_125427_661215_A53AED55 
X-CRM114-Status: GOOD (  10.86  )
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


--6iqq33laew6sina5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
MIME-Version: 1.0

Hello,

On Fri, Jul 31, 2026 at 01:01:30AM +0530, Kaustabh Chakraborty wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

<linux/i2c.h> is enough to get the definitions for i2c_device_id and
of_device_id. Please rely on that and don't explicitly add an include
for <linux/mod_devicetable.h>. The latter is a dependency hell and is
going away soon.

Best regards
Uwe

--6iqq33laew6sina5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmprq+wACgkQj4D7WH0S
/k6zUAf/Sx1cl/BKPkqGFdNbaghmO2SASm11okWqQNPUBAASK9s2FJe8D7X0d2Pc
rxbD9qNMckkIkAmLcK0z25WgZBGBFp9p7JFMNNaNtODVdDrSzVAWkpVsCP+1KxKx
wpfH4GBPCJ7KZs5VSphtsnQZEUPocJI1S6+FR/2erYowET73idWdL578hdOguif3
gGC3nzPWAAeIr2NuLcA/wszaK7meQrPxhg24VjiqyZiKWV+sCg6btmb31dzv0U+w
iNJKNRoMfAACrLENOmFoF7u5Ca/msHAhYS5POf7oB3t3//qGzwY98+DPRHeZzWfu
loDsTIst5Wzn48eksG4i14baHoA+Rg==
=xgKb
-----END PGP SIGNATURE-----

--6iqq33laew6sina5--

