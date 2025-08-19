Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1609CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 11:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOZDAaZrI66ydwRO+2rFbEiHfOOLnYyWJFOFD28ZEkM=; b=yFuUQ3jXpGXRABCbKsK17FpE+m
	odxH62ufAAxu51JN/Ao5bKmDG/CMFD2z8qwvOMWUX4SNhuYj0+oP8Kw6y6jYFjuuti4WpZA1I1uLN
	aor78ZgFpcSwXZA21wmUyGUMZF2zN57YZNHWKH23UFbw9ZceE507UcwUDF0nDkH0oL0IRb9r+nrCo
	HhKMxpsbLTQs3gVeT4igDfpxpNjJiOFHfGQvNuETM8OheLD7FSyX5eW/NEHSzpujWHJSqI0e/Cf4o
	8P8xJAXlFpbdPef4YrrFCeaU6mpUhmGCuF0nbyM0D5t7mRc5JUKQpwoHD0Z1IcTwZVTp7bnXxuKW6
	ZdUH7gIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKcm-0000000AIUM-1RZS;
	Tue, 19 Aug 2025 11:35:32 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIt0-0000000A0ll-3pe0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 09:44:12 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55ce4b9c904so5729715e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596649; x=1756201449; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOZDAaZrI66ydwRO+2rFbEiHfOOLnYyWJFOFD28ZEkM=;
        b=s8+8f/mJ+05GuL51DnrubROt2SMs+c5mky6qfSmHhxNj57vgwVJWB136KVyArdwmqj
         xhp3uQyTdvEy3Frzrh4GzN6XSvTZezTj5J6C9Cc4xt2Veg1WDqBwcIZ3Y8oBuIez/tzG
         j5nzM/PTgLiMHPn/nHtlxUSki53e9OxXElu8UIl7Ki8YkxVZ4O9epMD3/Cz6cFUueXDS
         TC5xrKSYFNDpITYZA2Eho/Yq7OrTNaJfPjHpEeltzpsuaKnLMsFZVgBjeg6RRdShUGID
         vuAihFmJvCz5KU/ivJhJOJzUW6DcJMgVMmgUIFC8SQERje7QQPBRrbu5pye3+HZyeZJx
         OKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596649; x=1756201449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOZDAaZrI66ydwRO+2rFbEiHfOOLnYyWJFOFD28ZEkM=;
        b=hb5Z3DG+JfT3TMYvkqpgNhF8y2hKdBOZqbapSTQk03kQuAVOM71Qe8wKyYimczaWde
         BpxHyx5usBV0TzOmAnQW8gVvd5YUtYr/7GnwuWub57ugacQcKgW9gCQ88jDXGPzbCudJ
         jCCc5YyWOVwLE50LgpOcoKgrYHonklDZtSPLxjFpElHDlnv+XiZ6W7HU+0zQZATmWqmS
         IWI1+1b82hmWMPvewnsz+pGhKaRqJFjPQFikG/D4gvF2qQ7FdhhHhf4AcmVZbWwitPty
         FX2xt5wZS0RrxUMuVwCZ0GPQZ0kVtCXkOHcd8GnKmVN580pQLJEdRaX+MG4a0o2VHzEv
         9fqA==
X-Forwarded-Encrypted: i=1; AJvYcCVn1/Zc4l+NqqsRosTc7N5pJOk00ZHVaIenfUhc0Ys6U5ZIXPBFtJIfKPputSM9IBKDMTp+/B480yZF2j60A18U@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6oHBt4o7rXIQzQYHyNS5kEdin9rA3cNSKDpI/tr0DaxPn3PVl
	4kqf5vahmTHsSIPfDwO+A/gEHxWmlyMS0XTFws96q9oH2x87QnYjBZPFs+zeEySMGQ1Oug0Fn2S
	GWz9u9QySbC3aphMDkGcP1l5kMtFhk+bIaHa3Hc8i1w==
X-Gm-Gg: ASbGnctwKk+VgtAYxdt7SkNluYoyz0x/lsounhL2Pkxr5myaCNiVj/uSdDP+holobR2
	vPaMQnz3F+F8SXsDJZxoqtS2jHddW1MDkAEHgnKHZaZVT8+H2GvrxkIORnfBCe809QOOaJQVUYs
	EJ1aqLpyHrcGsNkJqRqU+n9A10nrn3RlrnibBU9lyqTnIn75wLwOwHr8QmH6sv+THnQZuGzCsPy
	x8pjHsLePyW
X-Google-Smtp-Source: AGHT+IEb5axoDvieP94ahUcvQF4Cdj/DI1kgL87CBZO05dhRfNXWtWdEPdVzxE8EKpKiDOV7nU9/phOY4imeW35mO0s=
X-Received: by 2002:a05:6512:3984:b0:55b:79e8:bf83 with SMTP id
 2adb3069b0e04-55e00e3ab16mr476219e87.14.1755596649121; Tue, 19 Aug 2025
 02:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
In-Reply-To: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:43:58 +0200
X-Gm-Features: Ac12FXxWHK9Y341YvKoMtvojeGQDJurTuXUIgTK46n0rp4Sv0-QLWOBJFmGfpkc
Message-ID: <CACRpkdYungF_01g0XO=u7meo7pq+9y2YHP5XCBDtKHByee8yPA@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: replace legacy bgpio_init() with its
 modernized alternative
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_024410_949290_BE199692 
X-CRM114-Status: GOOD (  10.73  )
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

On Mon, Aug 11, 2025 at 5:02=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> We are in the process of modernizing the gpio-mmio interface. This
> series converts all pinctrl drivers calling bgpio_init() to using the
> new variant from linux/gpio/generic.h.
>
> Linus: Please create an immutable branch containing these commits once
> queued as I'll have some more changes comming on top of them - most
> importantly: removing the old interface. I will need them in my tree.

All patches applied to this immutable branch based on v6.17-rc1:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Dib-gpio_generic_chip_init

Then I have merged this to my devel branch.

Yours,
Linus Walleij

