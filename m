Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB63C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Swft9UILAtkQmCs4YgSGLeRiuZYqDElcjNWNFS7cu68=; b=JDcdgnb+rEZrZ7Ot4QYzMPxlZP
	YUNlfVmrVLIxDtYOd+nvNwweTz6bsHRV1Oz/QhtPVA0NX5obZ3Z8M69inzB69zzYMrHig8vAnNbRA
	YdUQcNUgLEXSt7lbo4VGBnP0eqT7SDoXzxYh5Ig0gCHLC5FgOmBDSlEMXrDTR1C/N1lMdmxi5Q4c+
	yqmjcW/FqutKNG3FNNVewrbMwxpsXSJrwEwGQPNw8mCAb7dGdK9xp/bGhRE3WLz2nMdQ0M8d59PvR
	5EInIiU6P9LRFqJpVZUeI3NJJFE3YR5Hz39SpQrfcMQsqv81bcM9uyc84kesMDWIQxGn1BB8np9M8
	w09OgWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivLy-0000000AYNk-20dn;
	Mon, 04 Aug 2025 13:35:50 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuz3-0000000AVGM-341A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 13:12:10 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ae35f36da9dso827292966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 06:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754313128; x=1754917928; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Swft9UILAtkQmCs4YgSGLeRiuZYqDElcjNWNFS7cu68=;
        b=CgSCvC/QOKROHsb0OdvFSVbPOzWvBGM2inlTwc4/ljdAOBNHe2aYLH0tyC0nV1+xVS
         IM96dqB4WphUT4xkfxTVcaqmYlQlTxz2iLzMrW3A34v+cbafLf9/knqXc9gudHi6PDsZ
         CZePlGyXoDhggjM6JyO8GifM5gQMHqH74NK085rZVYNI/M/+Pj4ea06HqQDN1N5pjLEt
         qiMMRBYPKV8YwhyZz9PjAdXda1ywj3ghWzf/qYPZzoUaG87iTf7gamKQlKwX0zj1QNhR
         rUQatvYO7DcXoukA5n0/v4qKifbFJPt8Et6W+tUTAUMMTD07c1HiE7v34zy9XSTGmXEU
         o5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754313128; x=1754917928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Swft9UILAtkQmCs4YgSGLeRiuZYqDElcjNWNFS7cu68=;
        b=Kg4YsJwXCvtCxQzgDvfAhKRaFNySXU2QQVBuBH3pyxc15etGptGbhPiJYPpqrmIbfY
         ycqDL3TmzguoWMmiqIfVBCfFfEdvWRUR68Jb+dVwoNfkpXX+eOou5AFjvn/j8iqgrk+o
         MIjtsirjwCSekRn4guWHVnaQTwkD7xjEnsOl0yDCE8TGveBzSuc/IMgdgUooPZkF8zns
         7lADthwO3gN7vauIQ316gWOW4UndmwxKAhbePmVnEOmC7yil0x/qNAJzpU/XdDmPJoEm
         ZMiIarZ6yrZMj0oKlGNYlymxwqB1vpREa8HqfO7ad8J0UqqBBrvOjjjNBa99xmfRiT6+
         ujmA==
X-Forwarded-Encrypted: i=1; AJvYcCVmIzp9FwWAPwjm6enlwozTV3Yrns9pF1chlQzfvblEGa8gJZCbGt+34ZpK2kw5obMnHwDzA+fWQVjrpD6cjvPM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2ekgCXMz3RQMiZdD8jYJlww/Aou+js8u6L5/fQAIdVP+/OWiP
	BKKc+1E74/WdLXPQ2LM3x0tjmfexXATKKh0/Nma1rNGLL2KIjTkOw1mqHsC0MEJwx39hkCRWKi0
	uKJ130a41sCLNUrw3zWZt3kFBzfnAwog=
X-Gm-Gg: ASbGncsK48GzVOhyZbej76Ye8G+fHNrjkthttLIQgJR92xYFooHtBL2yhOuE1rDJtEG
	iNbicgZVeomQPXMJBzonujNT5JJ2wxItid/EjSkisdmnmQQAzK4LMG1leYvGxQmNodCB2Dw542S
	hdZytISDaWm929Sf/QG7icsad5n5vvXdTo5WqxIyIUoNxhqzRA8hStNQ2L61XEzQAyP+8M8iHWS
	rdoUUUmPA==
X-Google-Smtp-Source: AGHT+IEHpdX2IDILP+rJpjx07e9XErIuO8k7iC1fwdeX+yStcAEloVb0r8iAfKXkonrvAZ/UiYSW7MHTXgCOPTKvHw8=
X-Received: by 2002:a17:907:2da5:b0:af9:341b:7fd7 with SMTP id
 a640c23a62f3a-af940230215mr810789666b.49.1754313127995; Mon, 04 Aug 2025
 06:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250804100219.63325-1-varshini.rajendran@microchip.com> <20250804100219.63325-5-varshini.rajendran@microchip.com>
In-Reply-To: <20250804100219.63325-5-varshini.rajendran@microchip.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Aug 2025 15:11:31 +0200
X-Gm-Features: Ac12FXw0lMHcmKSaxDiokDDn22qbztJNg7JO29s19Gyej8dLjMMZT64fvF00ezs
Message-ID: <CAHp75VesaDaMNpfdtxg_LSqjRL28YNKNFOBkCcdkF8B6Mp2J7Q@mail.gmail.com>
Subject: Re: [PATCH 04/15] iio: adc: at91-sama5d2_adc: update calibration
 index, validation condition
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: eugen.hristev@linaro.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, srini@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_061209_770383_881B8415 
X-CRM114-Status: GOOD (  15.68  )
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

On Mon, Aug 4, 2025 at 12:03=E2=80=AFPM Varshini Rajendran
<varshini.rajendran@microchip.com> wrote:
>
> Add additional condition for validating the calibration data read from
> the OTP through nvmem device interface. Adjust the calibration indexes
> of sama7g5 according to the buffer received from the OTP memory.


> +/*
> + * The calibration data has a TAG to recognize the packet
> + * The tag has a constant value "ACST" with the ASCII
> + * equivalent 0x41435354. This is used to validate the
> + * calibration data obtained from the OTP.
> + */
> +#define AT91_TEMP_CALIB_TAG    0x41435354

Just add the ASCII representation into the definition name.

For example,

AT91_TAG_ACST

or

AT91_CALIB_TAG_ACST

or choose the better one, but with an ACST token in it.

...

>  enum at91_adc_ts_clb_idx {
> -       AT91_ADC_TS_CLB_IDX_P1 =3D 2,
> -       AT91_ADC_TS_CLB_IDX_P4 =3D 5,
> -       AT91_ADC_TS_CLB_IDX_P6 =3D 7,
> -       AT91_ADC_TS_CLB_IDX_MAX =3D 19,
> +       AT91_ADC_TS_CLB_IDX_P1 =3D 1,
> +       AT91_ADC_TS_CLB_IDX_P4 =3D 4,
> +       AT91_ADC_TS_CLB_IDX_P6 =3D 6,
> +       AT91_ADC_TS_CLB_IDX_MAX =3D 18,

This MAX naming with the trailing comma is odd. Either remove MAX, or
remove trailing comma, or explain why moving from 19 to 18 has no side
effects here.

>  };


--=20
With Best Regards,
Andy Shevchenko

