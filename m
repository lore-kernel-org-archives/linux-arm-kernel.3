Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FAEC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+1Ngscj1sLQkaXbBjPeNhRnXqru6dzUdV9MGLQmLQU=; b=h8NU/t3FWQEgk3ni8hbumcoi3t
	iw491JZfIeGKUekkFDfRlwi+brOwFBubObcdygD9A0Qe+chu7tgeWTRIiNvlhw7jRdv4xc7US8j63
	HlWWiPxQrs4M3Lb7KcF/UipHofe/fZnQHA10jEdSo3jHJ++PhHTgl8VW9GQniGggjfD8Q9m0SsYAn
	SNjhmsNispwhkcOs51suLahGi2NCc/cjTweinznolqb0NZYpvNU0IdHTtnCmI0RHwr1F7cugoknPJ
	Hzq8FbVavp1l3GfR3NdhiwEf5vdopmf5NkHWC3jYkD5FQyoxsfDGe9ojDl1UtZo3DtgSLUZgTYuqC
	jOzXDrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7MWp-00000008lj6-12lk;
	Tue, 22 Apr 2025 22:55:47 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7MUw-00000008lPu-2Sdu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:53:51 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aca99fc253bso818806766b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745362429; x=1745967229; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+1Ngscj1sLQkaXbBjPeNhRnXqru6dzUdV9MGLQmLQU=;
        b=a0wWMc6DZROqxYtMQg/L9NXMcFIyvJ9SSDODfQ/z/fRr1gVoJdsBsHxT7CB4BHTyaN
         V9lgaUYB/B+COwzbbHTXrtcAbiNiygHekx8mhAqvEn6+iMs8H1KWyUXTAfN4cdraRU96
         8/RY1QT/M69PSsasC2nqpw8ehu4BdjPePpkwdXeRZZtHJCwpahoRAaWzAc9Gmy+GlVZq
         3/TO7u/v/OrVVGxD9ihsSpHPx9qkOlx1gf2KEHeHbOFxlLEWwLauCDpgGTB2qqsxcG7g
         HQdyJ2ywz7Bb1xz7pbmi8ADcVEmdGxxElIpSOf54Ya8zA0A5Fxse9bDXCPX+ZaXwR1ZS
         XGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745362429; x=1745967229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+1Ngscj1sLQkaXbBjPeNhRnXqru6dzUdV9MGLQmLQU=;
        b=ZFoBuhP5B5jYm1aH/wT23W9OUQeDA/0vrlRYO1PvAJ129inR2a3imJK3QyfhBtZBjn
         dhf9gB34W9Ts/tFU1GDZ8u363O6wIdZ/NtAU7Ka+3J1r05BM7TjDBANcs4lRaefmcZEK
         91cKwKhVLvg0EUmHB3zoQ5pGuhlkb1tNsTUjTaq22V6s5Rn70x2GSDepbfdtLAbD5qkT
         2/zr3uw3NgyxusBLpR3igkCvmQozS2V9XI6HFefFqqwtslQYAsDu2wun0GSa89+RrBMh
         xSV+APZk4u5xhemucoW3AOdNpI4FqzTTA3Fi0XexlGR6oGMDRiffqFvFcFGgm9b8nKIO
         dRtw==
X-Forwarded-Encrypted: i=1; AJvYcCVEwDHHN868D6AUAWG2Z/xIRbPTkDhxr6Hj3EV7NExIetTjzeB6dplDtgT3dhUCYG4SJJUjGZSkZbnMLup4mD6z@lists.infradead.org
X-Gm-Message-State: AOJu0YzvuIFywQaV038D/3lwO9TZJZPbenqltmYhEVs9zOLhlUce3f9A
	1jHkw2OUQDRnHl2hZmqmbrClWcZIdsYO40hTIErdTpgBycw2izHKlWhwKCuF16/ODQt9uUYyxz9
	GvzbpEcXV658VFK+hvPTDqrBaICk=
X-Gm-Gg: ASbGncvIqMMbAQMJm1LmBFXUt+ua/LKnNCCRrM5gqSjr+y1ByHd9EBBvm43O5sNJVlP
	Zcdf7e1VVvz3IuhZD4aMnWNHgKBoDaA1CtS2eiLeS0qDOg5fmc+y8YIHW3OujtI6zxpd3d0cKdh
	1N5HLP3BN1zr9JwphaPR1Vwg==
X-Google-Smtp-Source: AGHT+IHMPrXJqYYAB6pAgjxvZ17pVvfJXLHs9OfoWIoo18nkISokZoisDnXlemOEpRBjn1DUA8AriHhqSMFKfX2dk+I=
X-Received: by 2002:a17:906:da81:b0:acb:ba0f:4b0f with SMTP id
 a640c23a62f3a-acbba0f4c70mr579009566b.31.1745362428662; Tue, 22 Apr 2025
 15:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
 <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-4-3fd36475c706@baylibre.com>
 <CAHp75VdqanGpwB5raE8AmH-Tmb82N9yYmhB+k_rQtc2_Zb8HQw@mail.gmail.com> <55f8a997-77e7-4d07-aec2-8d20f56314d0@baylibre.com>
In-Reply-To: <55f8a997-77e7-4d07-aec2-8d20f56314d0@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Apr 2025 01:53:11 +0300
X-Gm-Features: ATxdqUH1YUeTsEMT0CwtykvmoOSl52HrGojQPmTu1v6wjba29-5vfKptJFLiT2I
Message-ID: <CAHp75VcoXwBNYmpNNCWbp1mOtJ6UJoKfxymRBRok91_NS8RcTA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] iio: adc: ad7380: use IIO_DECLARE_BUFFER_WITH_TS
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_155350_627954_8D6B9FE3 
X-CRM114-Status: GOOD (  12.37  )
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

On Wed, Apr 23, 2025 at 1:41=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
> On 4/22/25 5:33 PM, Andy Shevchenko wrote:
> > On Wed, Apr 23, 2025 at 1:08=E2=80=AFAM David Lechner <dlechner@baylibr=
e.com> wrote:

...

> >> +       IIO_DECLARE_BUFFER_WITH_TS(u8, scan_data, MAX_NUM_CHANNELS * s=
izeof(u32))
> >
> > Btw, why not DECLARE_IIO_...() as other DECLARE_*() look like?
>
> IMHO, namespace should always go first and people who write DECLARE_NS_..=
. are
> doing it wrong. :-)

Not really. AFAICT it depends on the globality of the macro. Those,
which are defined in types.h are all DECLARE_something(). Which makes
sense. So the Q here is if the IIO macros like these ever go out for a
wider audience. But in any case this can be amended later (with maybe
a bit of additional churn).

> There is not existing DECLARE_IIO_ to match anyway.

True.

--=20
With Best Regards,
Andy Shevchenko

