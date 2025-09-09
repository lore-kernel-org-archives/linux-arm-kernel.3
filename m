Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFA6CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=; b=VWwWW6vU0qve9w+fBQGVG0rWkH
	6w+ruE3ApOVIdZlj5PElDxM9Q8CoWo9UjQNGfxxnCbklpTWTnnFKxtoboyqC6ts5rOVno5Sgg6UET
	cwjfvKzdSWDVR6vrva3jY6viQWssOr7dSNXmvl8OEEBFC9WIhHipqx0cCP1DCbeyk0k0LzH8TFXAu
	FhzMT9GcKBYtk48ayUcYnvs8yCimDRLM7ro5a4Lbnt3kewl5lQSTScqLtD0ZpB7egJ9ujKVUa1i3I
	+BeTD+lBzwgogXsoOUhFDMAyhwG2kvkib729KVyxGD/6TLLctSCxk52DwHD+I1b7GyYAXHkqagf9f
	T/78FIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw20u-00000008vpk-1BGc;
	Tue, 09 Sep 2025 17:20:16 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyq7-00000007YfG-1t7f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:56:57 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso6682759e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757426214; x=1758031014; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
        b=Sp8d2xwmKwr3jVr5l9GXWmWjIi2tquewIqa+ZdWdW4Fylf7gKvhpj+hFX43xSvACv1
         cxvMXotkw9Nm8EW2KGfoscZsjYtWyRPQmMzW0z5BM3EpoUWmIDCbVTcwtixKPryiAtOv
         W041K98FfQyU0wCbje7kF7xU37YcXbx+rBXNION5MndJARMAd2Z3BHcn4vzODJb1o30t
         W83oOjRrxccGo+b+z6agsUAAkOJmiZQhBmGyKYZYHFQasanA3wQJPG87YaNzlKda0axL
         gy8x3++EYVVBlyZKBn4SP+7w1CIMIDpFkOjdvkwO7xDRszuqDyddS2T1Wgj8+PQ/Qk2w
         mY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426214; x=1758031014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
        b=MQjLXvgpAP1gh8AYOeRW171H4Cje13QnOjWHBc0i/xNdoWW7H9sVzivnOUsWMy8zaX
         FyH6ojAvYZHHv9geiVRD/XozU19Blx/Y4C0Mqerab5dNzPCHYsN/KpFO/7aLyiolYf4f
         N4S/v5ny6E0aRxz27hWQl3A6WU2y0dAT1VfCXqwRSVfCtXXjdv/vom3Y3T+BfccOwHM9
         27fauZA27BaAWDjOIfqLEA5CMt2036m1Fw4hdp8E3MipkqPdVtPr07ga3V8IgHu8Bcgy
         UX7GmvYuoBubXHQGUn8HF6wO32IvXm5DN243CuhnetLcK1D95lAMcIcBoBj2ViTNVGoX
         OYOg==
X-Forwarded-Encrypted: i=1; AJvYcCWB2MGVjXZsOH5QOptBtq9R5bSnke31M4pqbwLBTizVOM0qb4kcxgNqwadbaQbdDQaDQGRqBO58+pacbgQIBlDO@lists.infradead.org
X-Gm-Message-State: AOJu0YykiITswsG9h2oERiZrYQtpeRQeJXFlhgI68+KMFmJW4iOzeH6s
	DLnsEW+t9cL5cgrKM4RhT+tzxbzQCUYve7CykbdrWWqPbPG45lmWUZ4UiEwreh4mq9uVKj2UFjB
	ZerOH5iH5AbfHqJ4fQIi/Vw0jp5vFwSlR8/qyopg3nA==
X-Gm-Gg: ASbGnct8eY/GxH+v/gdO30grTMCywxm2Og/tZlo8jvVjouFHyKwp5txsMxQHYMkkBVs
	mA8PsxAiRZj99XKdYnOJo0RUGwfkFWvd1KoX4+GvOUCimK923Maas0gkf5TJk7jh+77MUs3ufEi
	YbXx/hwRi2cbTDvIoAfkkHP7AYpd8DygSJ28ak4nrvqyC4iWbfSRUjhDcFY57sbkNq1oTyXMdwH
	zlROqAfPHZWyA8K4bBPe54U0ranFw0ZLHOnefbw6jp8K4f61A==
X-Google-Smtp-Source: AGHT+IHBxkyJPoP3osXnpgBU6pdsryw/ot72GCgtbXz1ukCkdeMh24NQ6AJOJ87AcYe5pD0xcM8OlZUSXTQKermPfKE=
X-Received: by 2002:a05:6512:b8a:b0:561:9635:5af5 with SMTP id
 2adb3069b0e04-562619d971fmr3883543e87.48.1757426213571; Tue, 09 Sep 2025
 06:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
In-Reply-To: <aMAv3STeZUdSQ14p@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 15:56:41 +0200
X-Gm-Features: Ac12FXw-xJdDcWBTzEH08jjeniZk8zNeWwiQ6jDsDwHAH3I_S_ZPt9IHyI66KLg
Message-ID: <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_065656_126188_CECD97BF 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> TBH, I think those 6 all made the same mistake, i.e. thinking of the comp=
ound
> literal as a cast. Which is not!
>

What do you suggest?

And are we not allowed to use C99 features now anyway?

Bartosz

