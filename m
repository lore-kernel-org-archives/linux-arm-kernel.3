Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62D7C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 19:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Tp6jQbur2uPrp6S/Am4jXNTxdawW/c11k2ZMTBdl30=; b=ebhDhwccx6ukL5+jLiJLPHxapm
	7pPDMBzSGMGr9V/IouhknHouSOk0QtbddvFOpmM+4C/QzP77XuvFtIOt8QsvOro/JjRybynypPobl
	4CWIzYYQACxLO9VwVf+5Ga6vcH3nQwY1nJoUeiDwv0y7SMihd3KM0eOiq+52UyKUGlPhS4MiQkvz3
	T8YY4MysIQxEtAo2Dteo4CY3efu93qEJGrf9i0DJsNea303a5b6BDzy4URA9AIFgADxU9z/aX7zBN
	3h1WrynPWFcadTntRP6PQZird7NwqrQPwhDB4RRpJ6gkloiZCJkR4b3gjTh8l3MlvtUIOeed2Pd+3
	SoZwwykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qnG-0000000AfeJ-33iM;
	Tue, 29 Apr 2025 19:39:02 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qlK-0000000AfU9-3qBY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 19:37:04 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso1394829366b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 12:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745955421; x=1746560221; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Tp6jQbur2uPrp6S/Am4jXNTxdawW/c11k2ZMTBdl30=;
        b=T5WmtbQpqdCGGEnD71TXd9sBKQ0Y2UUYjmWUehM+0NX5XVh8C9/11GZoOdG/S7Oz8e
         FCED4ze7cwz+3IXqArEu0uRJuLHiRWjtROxxncdkENC6n3GCwah5YbQtzU2G3QfXuSY0
         TR0J89Xn37XvaINo9bkqH0t2CF4gC0i3p2rvwO6V+FTXKpyCe0u3ZrpNRpRrnjwHnN7C
         x6yN5477cFLNKkfsDzJRtUKKVWea4c1sQVDZDmKYAfBxV8P9qnxJRlH9iZtEDp4H46st
         ceUbSbLkTm9sue9gg1kzl5zqpaAxJHB7sdtehI/C5steflx+jMLCrqDaxikLUiDppDJ5
         xgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745955421; x=1746560221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Tp6jQbur2uPrp6S/Am4jXNTxdawW/c11k2ZMTBdl30=;
        b=k0d4/CS0aMksX6gEECOS4uKcE/XAIeo7uP1Bo31Crr+JmDI513ymQrgNjTEB7LkTsy
         3RMCPS5AKmNycZSbzh0ppHuHpVsaWFfDdbGN8sZIJtboJB3bvEMGQ1RkQfjVbVNRwJq7
         vOcwZ2Owiv+IZxNZOTAdIuNOfuhnf/s6EFgz0OUvso0Vy0483O6Ue+qsXxCBDHHK4Tbx
         7PZM7tcOjZBTc0mEU/huKdit1znHvBGIA4doIpp0I5hfXlFPGXWz8I1vaBE0i5f3Hltp
         YhNEVagzeAgAILxwsR9WeUAoBA3LRC25zaM/5tsN9q8yzJLyxa8QT/B467tRTDePtUDC
         DZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCUVuofx7Jyk+UkvOlfbd+aqvY2zB2bTX9+KRLWNxquciozzrP6U/kl8VMHnK1egCKanRCG1MCJiH6Ccs0HZ862q@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnbnx1oVR4KvUvHxr9eKj7Vfj+6vWL2W2vhTwR63C9Ybv9IR82
	81iInsr9dycsC7U1FkX6/tE/cD3YERyLDeAYX38796bdcg9sCkPqbyoADA9JnPAAlEiXrrOqYwT
	2+IXo9hb+/SvzuoxvFaHCmL3XbK8=
X-Gm-Gg: ASbGncttzd+MY+IYS0I6YDC5NnFUhJ763DMtr/fMNuXngnR3C8mq1vZOvLE3BPu0D41
	w8htLJ/b4nv09XFw6dsGc3XALhESx2O+EYhj8UIyQ7gZvLotw6J/QVK6+CQnUyKGh8F6ooyo45d
	lbXV5HQu4Ia3bMeObwXIgDpw==
X-Google-Smtp-Source: AGHT+IEdsoIHAufNtJaT4e5z5ds/k/kKnJc+/x9kYEJiD5thFR4klPRX4LXJHI2J2frB9Rw/oGoqyvr69rpkRppUdB4=
X-Received: by 2002:a17:907:9801:b0:ace:c225:c721 with SMTP id
 a640c23a62f3a-acedc56d9cemr51735966b.8.1745955420643; Tue, 29 Apr 2025
 12:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
 <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-1-6f7f6126f1cb@baylibre.com>
 <1d90fae5-9c58-4a77-b81c-2946e7cc74d4@baylibre.com> <5c762653-b636-45bd-8800-e804ad8dfda5@baylibre.com>
In-Reply-To: <5c762653-b636-45bd-8800-e804ad8dfda5@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 22:36:24 +0300
X-Gm-Features: ATxdqUE34hEo360r8C9Web68AMwiNqGY2UEskFkoO_CVQ5Qq3fMSkPAEA4zL0cU
Message-ID: <CAHp75VfcmvLhBDjbu6x46wGyzG+i7=rVypzSm11qzWN9Qq_rew@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
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
X-CRM114-CacheID: sfid-20250429_123702_972327_0CB53FB8 
X-CRM114-Status: GOOD (  28.16  )
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

On Tue, Apr 29, 2025 at 10:31=E2=80=AFPM David Lechner <dlechner@baylibre.c=
om> wrote:
> On 4/28/25 9:12 PM, David Lechner wrote:
> > On 4/28/25 3:23 PM, David Lechner wrote:
> >> Add new macros to help with the common case of declaring a buffer that
> >> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
> >> to do correctly because of the alignment requirements of the timestamp=
.
> >> This will make it easier for both authors and reviewers.
> >>
> >> To avoid double __align() attributes in cases where we also need DMA
> >> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS().

...

> >> +/**
> >> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer wi=
th timestamp
> >> + * @type: element type of the buffer
> >> + * @name: identifier name of the buffer
> >> + * @count: number of elements in the buffer
> >> + *
> >> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_DM=
A_MINALIGN)
> >> + * to ensure that the buffer doesn't share cachelines with anything t=
hat comes
> >> + * before it in a struct. This should not be used for stack-allocated=
 buffers
> >> + * as stack memory cannot generally be used for DMA.
> >> + */
> >> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count)   \
> >> +    __IIO_DECLARE_BUFFER_WITH_TS(type, name, count)         \
> >> +    /* IIO_DMA_MINALIGN may be 4 on some 32-bit arches. */  \
> >> +    __aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64)))
> >
> > I just realized my logic behind this is faulty. It assumes sizeof(s64) =
=3D=3D
> > __alignof__(s64), but that isn't always true and that is what caused th=
e builds
> > to hit the static_assert() on v3.
> >
> > We should be able to leave this as __aligned(IIO_DMA_MINALIGN)
> >
> > And have this (with better error message):
> >
> > static assert(IIO_DMA_MINALIGN % __alignof__(s64) =3D=3D 0);
>
> I was working late yesterday and should have saved that reply until morni=
ng
> to think about it more!
>
> We do want to align to to sizeof(s64) instead of __alignof__(s64) to avoi=
d
> issues with, e.g. 32-bit kernel and 64-bit userspace (same reason that
> aligned_s64 exists and always uses 8-byte alignment).
>
> So I think this patch is correct as-is after all.

I'm wondering, shouldn't it be better just to make sure that
IIO_DMA_MINALIGN is always bigger or equal to sizeof(s64)?

--=20
With Best Regards,
Andy Shevchenko

