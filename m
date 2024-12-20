Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5B6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 13:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wb7iNHmEf3kwk8PZ83J0Vflb2+dZOrkblrsPmP2Xs6k=; b=zFJZBeYB4yUFcaqh0/dw855plB
	XZ/bXHkvMPKbcnyw05sAoYZmtusWCEqsoqwJq71smIXCwKdg24MEUJwi4BKlqBVuV6SkZfBFQJ1NC
	viB9E2LtvSM7J7UuRPQONeIhvDFx9Ua+6UBypriN8Pi8AkAb5ELQl+JSHNoGsj06x+ljOzxDYcgxQ
	6EJXrQshrxNb1oVEb+ZP0SterljawztHmH9lELPchGplu4JWsb5aDfUc6DTnwvh75SiJY1MDJIEKX
	EepakDHwS2nkrGe/iHf8bt/EUzOYaT/EFoDJ1uUxQNf0JXd62VCCW+dqLURJJRd5inRwAXJyXMBo1
	ReH1Kffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdGc-000000052A2-1C0s;
	Fri, 20 Dec 2024 13:42:10 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdFS-0000000524D-1Z86
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:40:59 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so2046145e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 05:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734702056; x=1735306856; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wb7iNHmEf3kwk8PZ83J0Vflb2+dZOrkblrsPmP2Xs6k=;
        b=HHUbAjUVgmjRtJpGV/W3k5mZoWeeBO/Fu4DxYlUOvVi8M1LBX/c8MYDS32IWImpLZz
         2A+0jXZIBj3riNe9pUEZ/YusQxfNvwDB4dwZU2Pl8AVx76A/C1dcXQ6x0rcxN4ljskYD
         MblT1WY8wDFC7f8llcDr+6N5Zj2zZVa0z8Cy8+/If8Pait2+QRpvxjT6YhkTEqsiyJNg
         gMaGkZ9wzw9EEbibFMUNhfHhh7uznlzVY+LIfQ1EVG003k87SpYlYCrifc9Sx1fAYl9X
         EYPbkOHCUGjLKHFLV+9yrP3Cozx/NP23sCQ8T2wDyVMmh2UIcFAmkYQaH8e0mimTluOE
         fRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702056; x=1735306856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wb7iNHmEf3kwk8PZ83J0Vflb2+dZOrkblrsPmP2Xs6k=;
        b=gD665BebeL34pNC5/bD0Ecv3NLw3QWzYP9WG9t3lRiuOrY1dg0iz1hPmpuoTxKghuq
         RMLS0Z4cMg2bxEbNrMUXZ1rpfmlmX22Y50zkDYNnJCjnxRfUgK4eN9eanHP2bAmchrFQ
         EtE8kNW6QtXhjAgh8lk7roUzv2cOF5qTCRsh3NOSjHyeVO+s22vrGX/nUkGAnEqTe2/5
         /qWq2KbkiZOF3axWsgSiQ8hiIJALunfjHqeNDSdSElOVfeK04N8+sX2RSjAZJ8j32l9m
         kj03jQUMZvsfxiA2jewIhXkFRx7NE15sMEckfVXqaX9B5UoOsy56m+m7GrrAX6u/9Wkb
         c/MA==
X-Forwarded-Encrypted: i=1; AJvYcCU7Kipb10klboWghKElt3VZdXRI7w6CIj+XW+c5cXPTPMRX5L2HZRljd161x88UuTvDWdD7iJdSUv65zD5/2UnV@lists.infradead.org
X-Gm-Message-State: AOJu0YxZpts67ZF0ofMS4HfY5+Gl2vlUKA3c0zOfyECg1qSCGcQZJTz/
	+Kp9uwxQiTyVWeTR0LFEQtamWJOumbEHGuVr68tZXjG9GbTWfpZHUJ1ryuSz3BMtWNpMM5ESNzA
	vVNWiGAH4KwCF6heWUBy0fNoLLHnFDnrJ4Wbw+g==
X-Gm-Gg: ASbGncvdiTYB2aSvTDw9og2cq7dLj++Y6t1/Bm/ekfj2b+KiydKFSjL3H8b3iovh30F
	ssSwbhzhwP0IXT+A4w/NjYcyTDhw67nxQULJB87bUpkNUNbkW0VxZBIcfqLfJL7RWFeXSSw==
X-Google-Smtp-Source: AGHT+IEMcr6UeakjvG9LcaBj7crEG/f7t7TlT4cYf0tYtIrj73ltbIs/soNZTMABMCsyh5ylcV4ql8R8oH3XQgmpM/I=
X-Received: by 2002:a05:6512:398d:b0:540:1a40:ab0f with SMTP id
 2adb3069b0e04-5422954b160mr821931e87.27.1734702055700; Fri, 20 Dec 2024
 05:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
 <CACRpkdaB9kqcjmhaXd5RxpYvqdSVMZkj0wHAtEgdqDs03+wzJg@mail.gmail.com> <CAPY8ntBJqukSJs7VUXvUFAsiKqNWknL8VjgtQG_VAEmw576EPQ@mail.gmail.com>
In-Reply-To: <CAPY8ntBJqukSJs7VUXvUFAsiKqNWknL8VjgtQG_VAEmw576EPQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Dec 2024 14:40:44 +0100
Message-ID: <CAMRc=McmtEuc06YdEOXho8hkW30hYEYOtbOR3+mttmg4yrzrxg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names property
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_054058_479621_9FE5AE11 
X-CRM114-Status: GOOD (  18.80  )
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

On Fri, Dec 20, 2024 at 2:02=E2=80=AFPM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Linus
>
> On Fri, 20 Dec 2024 at 12:50, Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> >
> > On Thu, Dec 12, 2024 at 7:36=E2=80=AFPM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> >
> > > gpio-line-names is a generic property that can be supported by any
> > > GPIO controller, so permit it through the binding.
> > >
> > > It is permitted to have a variable number of GPIOs per node based
> > > on brcm,gpio-bank-widths, so define an arbitrary maximum number of
> > > items based on current users.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thank you.
>
> > Perhaps Bartosz can just apply this one patch separately?
>
> I believe he already has, but commented against the cover letter
> rather than this patch -
> https://lore.kernel.org/linux-arm-kernel/173434013318.38429.8084137212485=
42013.b4-ty@linaro.org/
>

Ah, this is how b4 works. Even if you apply a single patch, it
responds to the cover letter (or the first patch in the series if
there's no cover letter).

Bart

