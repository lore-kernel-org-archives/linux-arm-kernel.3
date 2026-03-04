Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF15EB7ED5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aakhmee/raU7jdKZ9tPN3MemCiopLrjwJ8yjHuKYiX4=; b=hbgQJQxnzSPkph2H17CJuvpBoG
	JnCJKjBkCEJ1hoZoc5qbf5QaS2gPsm29Moxatim8q9Vaoq8RHwPe4+7uDhN0fAnJSoiOgRMtLB3eP
	ndAnIbqbyJyCPyM6DetzLhFItgg5TeEWEpuvRKfPr5hqTej32tVbmix2DZfC9fX6sawiATZYRoS0s
	TRBLRWDR2UxDUPatLcFBkXyVHiSo7dFYeRcVkTU+GXtyJEqBqkqi7Gx8AoBpBNApA5mtnEfhsPzTk
	Y91CnZ115+XCNwy9TzGcvBBuuNgsqOvp+RiFXDhW+/PZuBpsGODQHBACC0w+Qlen//suL16nmeq4K
	5s6Z+UFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxke6-0000000H7qf-3zgQ;
	Wed, 04 Mar 2026 11:44:06 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxke3-0000000H7pA-1eUY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 11:44:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-439b9b1900bso2262406f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 03:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772624641; x=1773229441; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aakhmee/raU7jdKZ9tPN3MemCiopLrjwJ8yjHuKYiX4=;
        b=YKlRV43+LaHq+i8lBLocjPVRGSHi1Wsm4tue4jYYp6NLHH6CBP0OcRh4xqWiqY+lNK
         ktDgrBJn7HHqos4YnLKSja02r9cXppXjD4o1FacZnUpIKknECjjFTm3DpDd20Ywhf2Pk
         KgWgSnfb/jCxm7GYb1izyYoKhVoG+UZmAc54qlaf06jWAlvBTEdZaPkHNNplFMBlexpD
         oDXQbyACjqqG3j4rJyYhq/GGJjdREtJRGBsenizEctR04fnfB6Jp9/2++AqaKXR1dix/
         PeWPIufTol7nx1RoTPw5FufQPm63U9wM/PpzJoM4pS95AEs9PiWyRj8j+M3eUQ0oMl+h
         xPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624641; x=1773229441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aakhmee/raU7jdKZ9tPN3MemCiopLrjwJ8yjHuKYiX4=;
        b=VGyjxAa4pJcKuS+Mz3sTl+uUEi0xTUYX7ZIl3Gb0IxOs6HkDShzJBvCBovCGYTZ+fo
         Ic/PJWBd4edAMzi3CRmNiDZ+QOCpYUXtRKxKu8dMRbyDQmIJ2yQqDp7hW1cxM8XFRWEC
         wX/ZAPYfyQf1SIW2WlL3JnWGvfpDLZ0T5qg/lvF6gEwhIDkY2gtLIrvMrN74Tz950yNw
         V2BgaeMwn+cTbaYfWCA4ViGpRbEMlSoQ6fnWj5raBVpBIHbnivRYIaqoBV4t2R0bc2xd
         1TaqsCtB5I+wrkXZ2rVTF0rCsm0Nmtn80YRJF8wqmG2n7lvEl6R8gkJjYz/ZSq2zjGJp
         XjaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW41SzSLfb28gkO85wmx5mP2JplcF7m/Mou70PPOr/kmDb6+XnMxZjOA16q4Pg/ujTs/2nPadfLAnkP03gsQgIi@lists.infradead.org
X-Gm-Message-State: AOJu0YxYBk9ptBUF2m+k1kFKWNiNFihBFxf0LRRumpi/9eHG8gkEM5PP
	bcgDaq2LIIRYNyPT6YozzJrzPPi394K6kYRnG7+iKUcwxTH+M3/xfGcU
X-Gm-Gg: ATEYQzwo0FaXsN+7WuMBzlgikmLoSSkAIlyw18MnzWvp7/NN/sKaxrwKy7EvIyoc6IP
	qTE+PM4xjo8AFDjGwe9I/6j90Iu/gdCwVJrulnDCnjZ8VKz2n1YPQLczV57TQYxcFROPGU4g/W7
	c16xis8iTxuNVRxFM/y8lqTHc1NL0SwFEF+9GuyTBeJtphcQvzQ21KhYhNziR5L1eIvmUcV8yAn
	9oktbZd9S0X0qhkS1grDkZmDmLwU2YDs6gERywwVBWdZYHKr2aWTn9g+AKdIgjx65RS/koUExPe
	IQC2xmhZybob1GfOzTSPiWGuAAHg99ANxJCZpFnOF1ulxqRAogeBW34AWRSuZ+fnbdRu4Mje/kp
	KAmxWDOMdKRaMydzAKifixX2+31lsdgrGf28Atgsa/SeHMF8dOcNL/sDAlU0D6OGivHmef9t4IY
	1WYU52vsibwRDQcpmBbu0Cq36Cf9XO3mo=
X-Received: by 2002:a05:6000:4381:b0:439:b3d2:376c with SMTP id ffacd0b85a97d-439c7f8f93emr3259733f8f.12.1772624641267;
        Wed, 04 Mar 2026 03:44:01 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm27413229f8f.18.2026.03.04.03.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:44:00 -0800 (PST)
Message-ID: <31e0d644f251ae29063ef5575fcb851034ab6fd5.camel@gmail.com>
Subject: Re: [PATCH] iio: adc: at91-sama5d2_adc: no devm for nvmem_cell_get
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Rosen Penev <rosenp@gmail.com>, linux-iio@vger.kernel.org
Cc: Eugen Hristev <eugen.hristev@linaro.org>, Jonathan Cameron	
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Nicolas Ferre	 <nicolas.ferre@microchip.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, "moderated list:ARM/Microchip (AT91) SoC
 support"	 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Wed, 04 Mar 2026 11:44:45 +0000
In-Reply-To: <20260304041843.7709-1-rosenp@gmail.com>
References: <20260304041843.7709-1-rosenp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_034404_791847_F5FB7AEF 
X-CRM114-Status: GOOD (  15.05  )
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

On Tue, 2026-03-03 at 20:18 -0800, Rosen Penev wrote:
> There is absolutely no reason to pospone cleanup of this post driver
> removal. Just do it immediately.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

I guess we do not have that many users for nvmem_cell_get(), otherwise a ne=
w __free(nvmem_cell)
could make sense. Anyways not related:

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/iio/adc/at91-sama5d2_adc.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> index 69bb49434f90..255970b2e747 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -2259,7 +2259,7 @@ static int at91_adc_temp_sensor_init(struct at91_ad=
c_state *st,
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	/* Get the calibration data from NVMEM. */
> -	temp_calib =3D devm_nvmem_cell_get(dev, "temperature_calib");
> +	temp_calib =3D nvmem_cell_get(dev, "temperature_calib");
> =C2=A0	if (IS_ERR(temp_calib)) {
> =C2=A0		ret =3D PTR_ERR(temp_calib);
> =C2=A0		if (ret !=3D -ENOENT)
> @@ -2268,6 +2268,7 @@ static int at91_adc_temp_sensor_init(struct at91_ad=
c_state *st,
> =C2=A0	}
> =C2=A0
> =C2=A0	buf =3D nvmem_cell_read(temp_calib, &len);
> +	nvmem_cell_put(temp_calib);
> =C2=A0	if (IS_ERR(buf)) {
> =C2=A0		dev_err(dev, "Failed to read calibration data!\n");
> =C2=A0		return PTR_ERR(buf);

