Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7398EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 03:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=py2x/3nEfcl/m+IfkfLCFYgC9n67Yc5sv7N0ha3Enew=; b=Cmc1qhEUgHExfKSk4cciM1KTQT
	cSUw60EP483jcDZBRpfPIlCmXVpq8dU9nCptgV5d5ObSjyrPWehgMm01MqzIsHrH0IruPYnPgSiaW
	CyZLF4RIIbft7tChRtEYq2LIFrK/koBYAzq9UBKOv/NiBcIfuGhovBO75uv7oO1CEUBq0ajxk60UY
	ChnUMvVsWiE60ExsNTXIRTyQJM868080BL2E7HdT8rdrl00yD+45EBMfv5xc3rDrXvjv/DqRaHaNS
	3nClw0IY/sJLcUY/a9bLusybh3mxYc0UkDCHzV59/ds1yahbn4tPEjjlyP5ZdDilXKBUG28HpL+OK
	r+I2I5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYei-0000000C4UW-16fm;
	Thu, 12 Jun 2025 03:31:08 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYcU-0000000C4Go-0whK;
	Thu, 12 Jun 2025 03:28:57 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5536b9be5f6so373380e87.1;
        Wed, 11 Jun 2025 20:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749698928; x=1750303728; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=py2x/3nEfcl/m+IfkfLCFYgC9n67Yc5sv7N0ha3Enew=;
        b=ewl6I2C+6xmWZe8kE7nJQ85J4dS7TrUjzE9OR4hAfji0N/VAGSnHVJTCn+c5pCnxnf
         LlB+NUiQRHSAnlvDkPb7FbjySfmdSOCYbuaU2YBYwh5xhYdSr8f3rWr+6UL6bViA5dNm
         qQPd1oBxR0lSLB9oK74pZOZp+fubEgzH6jtHP6YPlvGaZry3/5K2JF4RtwOWmSJ55geW
         d33l935MviU5qoLKz0f98J1N6rqq52+w7667WiVIU0oMnpLPZrbaI0M3c2dWMEe9z3Qh
         zRKw81XdSKuy8V5obmfrwU/KpBv/PaHalNhF7BRLfkd1cypKhZCHDbUE4q5qFawk5b1+
         ai+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749698928; x=1750303728;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=py2x/3nEfcl/m+IfkfLCFYgC9n67Yc5sv7N0ha3Enew=;
        b=J6VtMIdoeVTCzEB/RJc8PaKogA5WfIiVXJvSX37lx03ehUJvmXvOunIYQxJYz9LJX8
         vgqbYYK/csMmIJmgozzRhTPBVB3zHA3ODWLPFlQPN80yj0RNo7NzKLSCFlA6d5I54QiK
         4E9qoq15BRnqWz7AGsdtaIcnOPvyXe14sq4XfML2rgzt/KUeb1fC+cUulfjmU/HHXOIA
         zkcBe9UMpUw39kGvxFaFrtg9vWCCJVnEIpldkZ9tD+Tj/VJ+bPXTxV53fAPXl9/NQJzv
         zNqaIEpHfC7FeIpCylKYBOAAvJB0YbsSiiib/VhWbDMDQO9DE7z+R+8CQJsEDAwjX/0y
         8/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCU7v/Rn9cUpVJ2ET6IdvToS8jA7Huw1sjEkNUGr73JADhjVz0GUgWdg/J+CgeSwiOm2PoWW6/i+uazA6pDPFhVk@lists.infradead.org, AJvYcCUtnCgc1FPlIexJNlLoKnDiVix183FLjlwbqJkdrgNEc2XJ0uj0oYDXctVYmLCLJ4r7TgcS96X9ZznMRroHI2Q=@lists.infradead.org, AJvYcCV9kgvqIlulrKwll3W59MAcEjnVDet5SmI6ll6naeIRBqQ5/J72jzxjQLCB+vXlyEMvHClLUy9rxqrXSBT33u4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDBPtl/q6ipuAcFcvMNFnOefqHm2SuA7+yCw1Z8wrW0FSuPrcQ
	tvbMP8j/9Hy4nk/XSge8BKQqCq7VmBDhc21p2iJUL5TTk4u041vRpKOU
X-Gm-Gg: ASbGnctuq44u1/Jx5pI5ypBGCmv59hX1SyGdq0yCg4oDbUVlGQDnn8B9L0QDsvko2fx
	R8MG/d7fN4Hn52CioHISswTm+SQmCygDMjJRiwASACFN0ZwRpoBkCrs38ooXElob3Yce9i0zW+1
	n3QPRK+72U+AcllRvw6ve4/aPr/l39L8TTnSC2m2eIKhRpuN7fhVY/Fb0WD5gxabjU+2FWyaPn3
	Hbv3TxaJeKaXFqwHweuJxZLTNZBIOPLydo86nthPWonGrJZDpqQ0tnJNDVEP8hE3DLT5vuI9vbr
	rjxEmJNCrrq1F9JEjBcnmyF9byVPbLNBO0c7EHyL5RaVXxqrNCi5TpVRgQE6Lmh8LQLRaJlO
X-Google-Smtp-Source: AGHT+IFzDApZL1pHjb5MwmdwMyKHvI7xFwnWpTu5M5Pu8keW8CYw7rmotHQw4lDjGUz6wII2O1nwJA==
X-Received: by 2002:a05:6512:1047:b0:553:25b2:357d with SMTP id 2adb3069b0e04-5539c269200mr1758603e87.52.1749698927857;
        Wed, 11 Jun 2025 20:28:47 -0700 (PDT)
Received: from localhost ([62.89.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7003ee4sm87044e87.123.2025.06.11.20.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 20:28:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 08:28:21 +0500
Message-Id: <DAK8HUY0VT5Y.1YRMH2LOHDY8X@gmail.com>
Subject: Re: [PATCH 21/28] iio: light: veml6030: use = { } instead of
 memset()
Cc: <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
To: "David Lechner" <dlechner@baylibre.com>, "Michael Hennerich"
 <michael.hennerich@analog.com>, "Lars-Peter Clausen" <lars@metafoo.de>,
 "Jonathan Cameron" <jic23@kernel.org>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Heiko Stuebner"
 <heiko@sntech.de>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Francesco Dolcini"
 <francesco@dolcini.it>, =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, =?utf-8?q?Leonard_G=C3=B6hrs?=
 <l.goehrs@pengutronix.de>, <kernel@pengutronix.de>, "Oleksij Rempel"
 <o.rempel@pengutronix.de>, "Roan van Dijk" <roan@protonic.nl>, "Tomasz
 Duszynski" <tomasz.duszynski@octakon.com>, "Jacopo Mondi"
 <jacopo@jmondi.org>, "Jean-Baptiste Maneyrol"
 <jean-baptiste.maneyrol@tdk.com>, "Mudit Sharma"
 <muditsharma.info@gmail.com>, =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 "Andreas Klinger" <ak@it-klinger.de>, "Petre Rodan"
 <petre.rodan@subdimension.ro>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.20.1-4-g02324e9d9cab
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com> <20250611-iio-zero-init-stack-with-instead-of-memset-v1-21-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-21-ebb2d0a24302@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_202850_263581_D114D978 
X-CRM114-Status: GOOD (  14.92  )
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

On Thu Jun 12, 2025 at 3:39 AM +05, David Lechner wrote:
> Use { } instead of memset() to zero-initialize stack memory to simplify
> the code.
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/light/veml6030.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
> index 473a9c3e32a3a53f373595a5113b47e795f5366c..0945f146bedbda79511e70415=
8122acaac5e60c1 100644
> --- a/drivers/iio/light/veml6030.c
> +++ b/drivers/iio/light/veml6030.c
> @@ -892,9 +892,7 @@ static irqreturn_t veml6030_trigger_handler(int irq, =
void *p)
>  	struct {
>  		u16 chans[2];
>  		aligned_s64 timestamp;
> -	} scan;
> -
> -	memset(&scan, 0, sizeof(scan));
> +	} scan =3D { };
> =20
>  	iio_for_each_active_channel(iio, ch) {
>  		ret =3D regmap_read(data->regmap, VEML6030_REG_DATA(ch),

Thank you for the patch, it looks cleaner and simpler :) I trust the
sources you provided, but I tested it with real hardware just in case.

Tested-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

