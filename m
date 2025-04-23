Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA209C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOfLM7JjriZIicDn/FCwjvt9wB+7R2BYhmdG/mdWeLY=; b=VODQkhRO1eyTltLPMlS5JyEqN7
	rN39tvTq2S6sbrzO1MX0UOuqHv6JIvuJvWrDS1KVYVEaQmtmZtBLCKndaPeVHtago5TMEaN5eOJc+
	HAKzcyXpMDjaVc5P/d2kMYW7uG9/eYXZZja5yT7E9heoiQZbcv5YP0j6AXkFt+Rvk/la53J9mN91f
	SWGbWZmsBIBDdVLGI7wZpxO9gZafYSO4OGUMwlE0zIN9f8MzI+7AziY4nKrRIUpqMK49H8PPLhDSY
	NGYAM6anQbAlCrrBRfjL/7+JcKv850VBqn0jU1m0hkKpvG0MV+Nef2rkjXnRzANzIi9RCNRW1ak6W
	NU6i1djg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8R-0000000BNKp-0wia;
	Wed, 23 Apr 2025 17:43:47 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cGk-0000000B0Xp-3bx5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:44:16 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ace3b03c043so21966b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 08:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745423053; x=1746027853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOfLM7JjriZIicDn/FCwjvt9wB+7R2BYhmdG/mdWeLY=;
        b=DcrNESkvC1RXcUsxvyBoWMSUEzuz1xdObJ14tU5LjHEKJ6AuTkizrSJJWSdYsjgizD
         HYTTUsmwnSmY6Kl9vyRnrbwXV0KJ3Qb1+SpYJqTBBFBPQr/gy9vllrsIf61Hvk4mnCZx
         Zw7EJYlxx7FM3p+hwHYKj/HqjsUa+Quh9+mr3wzCDzm7/iXPoNceC0fFejuSUAv6TLl9
         nC/qc4XcYOIlxQkIXYlzeoC5MSJDDTEG2bp7iwUdTTKxH6D7LNwTIoOjwyqCIGgrfO16
         k+BPLElmoFRa2KzTMvE5yqw56GKQ9r19T1ApQcrItlSMImobRHLXqIMtwLfN+MkGgcf7
         rQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423053; x=1746027853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOfLM7JjriZIicDn/FCwjvt9wB+7R2BYhmdG/mdWeLY=;
        b=lKyWo28dzBlEKUWlg7OxocCVMm28KHZ0y4YRGbxWGsCiq/MqsO43/qsuguoOiLDPz5
         TWQS1+d0KTu0HdPaistyURwdesKXS9ZjcGSIcDVffy2ItU40rphf39G1d13F3rsdi/5O
         ivOLJnWTRsEqeW56BDVfR3np1sKLdVW1zDQrdbQd41Outwtuj7Sa/m06gM/EU8RsGqiw
         68bgSkDw3X4YJU06fI1AoFRpHkdGY+A7eROO5SekZ6JD1GuTR8to+gbgjBJY23BBiG+H
         XZF67mg3ni+3jAqqEzJKQMy6Ywc+Bffx34RBWG7D+hV3G63ECy2pxXQaD6R2GjcbxX9U
         SvJg==
X-Forwarded-Encrypted: i=1; AJvYcCWj3bMn3wN+F8JvA6hoWG4P3gHGyuY2ybNm6EYO+grehr7tKR0x5J9tgy4ohquO2GoLu9/B77rStJ2+IA0OpF1W@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2zm3Q3tX7W5OAT6x92Q2Yz+ww6f0zLaNIfCIEWtDo5KW14tKL
	bOWQaIkm0w+gK1YV7xclCSWxeXOMXS1+kr/scPoPQi6ZKPSy8YhPEOwlyfOYDtbshMfGn2x5RkJ
	0sXvawFreidEDqfHqySZonNNQfVI=
X-Gm-Gg: ASbGncu8HMX8SrCcDcnmwRSdFXIoa0U0WY/n3iix4ofPipXf2ZktblPvq/MJCklLzzh
	pe1YYjGMvPucldlysDVgLbWzRBdglfOiq9ZI9f1d0Vbi7xJS5ZOEhR0GiFD7XZjnNNeGP2uxUzC
	fR3L3E46B0XQXmJcGKP011CrPM
X-Google-Smtp-Source: AGHT+IEh10/g6UpR5zcfKcRlJ1eIFJJL8RU3TUMydcbdyNHCTocp853352wJl3uZig94uDrY0mqj8Z/xpS4+8NeuIZ4=
X-Received: by 2002:a17:907:1b25:b0:aca:a3da:80b8 with SMTP id
 a640c23a62f3a-acb74e10307mr1496886266b.55.1745423052773; Wed, 23 Apr 2025
 08:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
 <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
 <701bfc6a715046044dbc789f1c11c7f85395c7a8.camel@gmail.com> <b4218efe-3785-4065-a3f7-57824e882f09@baylibre.com>
In-Reply-To: <b4218efe-3785-4065-a3f7-57824e882f09@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Apr 2025 18:43:35 +0300
X-Gm-Features: ATxdqUFnVmc8eal9oBgTUwd0yi1TwsVHD4EVlbX0omsSpj6kupk_A2ZmCeLZVNo
Message-ID: <CAHp75Vfa0spzCW8WmR32N7u55N89kxywK5uuYMZDJUNHwSZoDQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
To: David Lechner <dlechner@baylibre.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_084414_897529_164F9AF2 
X-CRM114-Status: GOOD (  15.85  )
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

On Wed, Apr 23, 2025 at 5:51=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
> On 4/23/25 4:18 AM, Nuno S=C3=A1 wrote:
> > On Tue, 2025-04-22 at 17:07 -0500, David Lechner wrote:

...

> > On the other hand, as I mentioned in V1, I think that an assertion or
> > BUILD_BUG_ON_MSG for making sure 'count' is a compile time constant exp=
ression
> > would be helpful. Sure, we'll get -Wvla but some developers might still=
 ignore
> > the warning and send patches with these arrays. So, it would be neater =
if we
> > fail to build and force them to fix their code.

> BUILD_BUG_ON_MSG() won't work because it expands to a do/while loop which=
 won't
> work in static struct declarations. But I can try to see if we can come u=
p with
> something that works.

I guess Nuno is okay with static_assert() and TBH nowadays the
BUILD_BUG() as is most likely historical.

--=20
With Best Regards,
Andy Shevchenko

