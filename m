Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63470CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI2XcWaMkZXf3XlixG2IPGL+6e9Vy4tl86zb1yjrRNY=; b=fjkm57spryfWj4KNMOQ9vL6PBt
	i4bX7C5YdV8Kaie8jVIQ6VwcKFRTRmxnQOlTHAMQwmeBLmf2G6/49z78k3KTBxA+EkyYiZmrftvVV
	EHDuVeP+h0loisK4PtTa0WZ5xNlsQ2gsJg2OUOnjI/BfMWNztb+YzrjSXzyAespAjMUc2LyTLVj+w
	pMNbYAcwOGcmVVzgXpmXy8xMcowRWlMIfq1xTgJfWIwpGkoGYew71UB9aYbCI2QZ5nQJFzfZSkBhw
	1pkDCpo6HmwYSdAPTZWaarXu4uRK9TpQ9euhnFF92ZfKzlcQ50yaGGhhfGA7CHlW7+v7dk0VquLf5
	H670CGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Fo-0000000HNkB-29ZL;
	Thu, 21 Aug 2025 15:31:04 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3oU-0000000GoEk-3U6t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:50:40 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7e872c3a0d5so76224385a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 04:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1755777037; x=1756381837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI2XcWaMkZXf3XlixG2IPGL+6e9Vy4tl86zb1yjrRNY=;
        b=YrLJ11/xcen83cyqerh5e449b4Nob7At5hWJbVJD/agUb0Hu7btC7OXF83L1Icwoia
         WTxmTOd2MjAkPQgeKPEUSEcbkES9IAq7YbuKaGo/1wPi7x1Rl9VDcWmZB2UNA4LZpWsY
         cJnB9atHfnGHVeB0Zl6HjqBPIQ9VvBxTtm255ok+7N8uZ7kRhLj1pfdPpOQRuk8Y3+Re
         s1UiIVKjHvgMZ1Ba/2aLsFMvUBEBOA4snGfcwgdGkJjmErfrHWIxQsnRxPo+xF9jWzoQ
         ++Xr2Thigl6UwfBglJawkFOKOm6RnXuwx65+tGov2iGEMt5xCxXyAyyJ+4MxOLzVK6AM
         szjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777037; x=1756381837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI2XcWaMkZXf3XlixG2IPGL+6e9Vy4tl86zb1yjrRNY=;
        b=fxnPfn7BMaO2Y33Ekdfe/rVA4YT/JVZbStBqjaOATJI0YSfU5a1uK9bIHfmNQBtjvo
         6zzvQYflTiYPoGdX7zkSCw9tyKRt2Y/jbprWZiKsQ6fvK8uF5fBYr0G328COlEbtBlr2
         jOWtTAUB7YdAoEWQEoZ8/Pp/iNuQ+LRQcIBI57xIu4+Jgty+msQbJlECgqGeLZx36wvx
         2hrPmkygKQ8MJWT3LY8HtwNmxVvJ/8jHmEH2XZVAOLKwgPB3wuLOswAhdA5PkRQaeZ/A
         DBxcEn4TGA8Ui8zuGfGaFtsOVZs+fnuGYkbM7dysH8OiD+/JCkkiyjc2erzFU9Nny2XZ
         UMvA==
X-Forwarded-Encrypted: i=1; AJvYcCU7OFa/5QoePnbNa0iPPgbTkHVuTqlTCvusOrGB5NhWDsaaHtAnwEYdPdztuZrw6Au2XK3FQoibC3ZtNRhSPHgO@lists.infradead.org
X-Gm-Message-State: AOJu0YwrQ3iuWyYGRG9i06wK3YccthU+GKjFRxWLrUM0tKEPCVDaeIth
	OyJJfPJZafXv6H07v0+TRbxcdmeeOTsac9nQ7uceDj2qGUh4uEoLhRGThCszf14PgZKbqAhEcSY
	XIAC3nLGZUPFBab/Qq/AlYoGWTrMY4BhAWu4Siqce
X-Gm-Gg: ASbGncsIWiozy9fj23A2owbJ1qUedMG9i5hzbsC541+ybQd8sfcurDmVjsewbUKwdHB
	aLrGhb24gDQJ+eqcsnP4k9R3ONoU5T7OXCVslBRoXT5zRJ2ji8VF97BnpHN4Gf4JJOg9ZdlsRcs
	vnyAlsx1Qj8+Mle7lU3VQALgm6SsMGH0zmGEhhDRGRGiyhULcZ12J5m7Ifwo7m8GBp0UySXF3R0
	1lhZWUHEg==
X-Google-Smtp-Source: AGHT+IFXgN4z+V5r61maVUoVH7Q+4oGAXqZzaV+iRCJ0lg/aewM1N1+KmnykJmm4zHXRs1rwg//XUIeBfKZTRO4+v7g=
X-Received: by 2002:a05:620a:4548:b0:7ea:5aa:84fe with SMTP id
 af79cd13be357-7ea08c78a25mr207064785a.2.1755777037356; Thu, 21 Aug 2025
 04:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250821080723.525379-1-zhao.xichao@vivo.com> <CAHp75VeDvK8cOr=rVGj_hVX5YzXM-UqrWRBgUrhiA1wzYn7C_w@mail.gmail.com>
In-Reply-To: <CAHp75VeDvK8cOr=rVGj_hVX5YzXM-UqrWRBgUrhiA1wzYn7C_w@mail.gmail.com>
From: Crt Mori <cmo@melexis.com>
Date: Thu, 21 Aug 2025 13:50:00 +0200
X-Gm-Features: Ac12FXxGX8W0hsOM6YtKDXVSOgl06ennUByjlBCRIy2fIDyre-p0gjpggdKZ2cA
Message-ID: <CAKv63uvfHYATd7ZFweZ0LMfTLt-idHVgYJqOV8PvzaNeigbt9w@mail.gmail.com>
Subject: Re: [PATCH 0/7] iio: Remove dev_err_probe() if error is -ENOMEM
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Xichao Zhao <zhao.xichao@vivo.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andreas Klinger <ak@it-klinger.de>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marius Cristea <marius.cristea@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Gustavo Silva <gustavograzs@gmail.com>, 
	Tomasz Duszynski <tomasz.duszynski@octakon.com>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Per-Daniel Olsson <perdaniel.olsson@axis.com>, Waqar Hameed <waqar.hameed@axis.com>, 
	Yasin Lee <yasin.lee.x@gmail.com>, Julien Stephan <jstephan@baylibre.com>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_045038_870026_363033B3 
X-CRM114-Status: GOOD (  15.82  )
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

Sorry duplicate - as I commented on driver.

On Thu, 21 Aug 2025 at 10:13, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
>
> On Thu, Aug 21, 2025 at 11:07=E2=80=AFAM Xichao Zhao <zhao.xichao@vivo.co=
m> wrote:
> >
> > The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
>
> when the error
>
> > Therefore, remove the useless call to dev_err_probe(), and just
> > return the value instead.
>
> In favour of this series,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> (yes, I indeed looked at all patches in this one :-)
>
I am not sure I agree with this. It provides an error message with
reason and I understand we want as few as possible, but this would be
a valid remark inside the logs, but without it we only get error value
to figure out where it comes from?

> --
> With Best Regards,
> Andy Shevchenko

