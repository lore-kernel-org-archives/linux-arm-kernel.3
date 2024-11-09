Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B09D5E372
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 13:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+Kc0rzleBniDws42taDJiRijBO7TNIofluEdMhVLBw=; b=PzFLUteNeBozBr1KL1CIxo5Zim
	FRA3RoBz80KyyWuGE9qs4TF416o0r0/1qy3h4TLiZKf2K2MglwxgDI/cXPWKOVAdWztZW2oWzneod
	lDBSQ+cP8XLa5Cxn0+QHc2qiMc1Ge4MYJ4lfndkjf5FCsfmTgoPvXnXrO1tOyU+JKaDmJDGmtjsHp
	LWYxicfoOAC/cdrRQHggcRdhb6eZVlNTGfJbkY2Fuh0+6t6zcklv5hJ54OC7hrBp+di+8luFU+3cH
	jJgcLkjqhB8UdbruBiftKMPkyntMnw9J+vZ9f6yZtSE/CW0r6U0DGjbu3PYonWcZYelIaqjaBUypP
	ofmoDMug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9lyS-0000000DR4K-2Pth;
	Sat, 09 Nov 2024 13:58:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9lwh-0000000DQvq-208s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 13:56:13 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37d447de11dso2266503f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 05:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731160569; x=1731765369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+Kc0rzleBniDws42taDJiRijBO7TNIofluEdMhVLBw=;
        b=VsCFDYYT95l0woSZsQsyP0zxa6CtjS78A6CA+9Orb0K4463+5iNSp5ZP9exFksIA6U
         XGFKi1W3a8W9nbvpf+xYLusO9LmGkE3TVqryvLtVSV5stbXmqnpdd0uzEUuoHTulY2YQ
         ArDAKf/sudy8CG99UqWwed8+nJ3Mj72d1llrp9Ql9JC9ywq0UR/SoNyB9bvLaOlShsyu
         +mpUicTGpBunViMCV2DzlUkCwejFdliwzTCTb4oNaaXp5X4079sCVcKPfBmkCL+eEde9
         MAc95ALdue2FgZgcbAd+IDhFy9D0MzGaBu80qAxAl2DucpRw98U6fGeuYNPMlHlWahFg
         5siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731160569; x=1731765369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+Kc0rzleBniDws42taDJiRijBO7TNIofluEdMhVLBw=;
        b=sfUbsLleK3xWeorv61vH+se3/M0PevAuZ3dR8Bq4h4ZE81cR2pretcEjs6/pXIJ0Xt
         gMw2gUdZj0BvtK+IZsZ3tgOlMhRmOt7A1QS47sBwwlh+ZmaPIt2sCPp8wMotIxgzELFh
         sDVKnsQ7/dIjvt/tdi0Azr+I9xh7MVZ9bG0gDhUAb8GkDVSwLUS49HxKOdas2qUDF6ts
         A/xhNaMXxdKYE6uqUDv2kkJ+Plze0PBOKuQpRhVd6M6zlLR2NCkiJVlEasHbGMHU5r3j
         5NtlyJodvTyyNtZgUuAuiyVF7xnGC2OY9dj8sErEcLaLX2SlWW+cvT0uzF0NDlnOTBak
         uS1g==
X-Forwarded-Encrypted: i=1; AJvYcCVJb3HLHf0i66IXfgWAjKce2nr6rH4gSV1b+0iSLhMw+AJKdxyP/OTkXvhH93ozt/jkRghStmzGuiuJXuiSy/mv@lists.infradead.org
X-Gm-Message-State: AOJu0YxqJAwFXNGLyo7ZVf67gS31ngt8jtCi8F50O7WjjGWEEhUPPvMH
	fT2SFQ506Pu6opgcqJSXLeZXk4zK9x5Nh6worqvaY2ytEqUkHp8t5zQEXKiNB6k=
X-Google-Smtp-Source: AGHT+IFsS2LMq6BH18aGRCC9suSXqIwBnIqgdOjirnJVxP9+m+h71xqEBknv7upPJ7jntZEG8ZeeBg==
X-Received: by 2002:a05:6000:385:b0:381:e702:af15 with SMTP id ffacd0b85a97d-381f182fc64mr5833268f8f.37.1731160568840;
        Sat, 09 Nov 2024 05:56:08 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3194:2330:43bb:8a9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05c18e0sm109576935e9.28.2024.11.09.05.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 05:56:08 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/6] gpio: Get rid of deprecated GPIOF_ACTIVE_LOW
Date: Sat,  9 Nov 2024 14:56:06 +0100
Message-ID: <173116056404.6855.877058419163067768.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_055611_810095_DECFB6DE 
X-CRM114-Status: GOOD (  13.27  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 04 Nov 2024 11:34:18 +0200, Andy Shevchenko wrote:
> This series targets the deprecated GPIOF_ACTIVE_LOW as only a few users
> left. Convert those users to call modern APIs and drop this legacy piece
> from the source tree.
> 
> The idea is to route this via GPIO tree, please Ack.
> 
> Andy Shevchenko (6):
>   Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
>   Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
>   leds: gpio: Avoid using GPIOF_ACTIVE_LOW
>   pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
>   USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
>   gpio: Get rid of GPIOF_ACTIVE_LOW
> 
> [...]

Applied, thanks!

[1/6] Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
      commit: a04abf25fb1ac47dd2bf1e1b7ca24ca78688b175
[2/6] Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
      commit: 081aaf2dfcfa10fa5cb5444b77b154cce4355708
[3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
      commit: e6a2f0ea519fd2478920d02ce3de07a14fe36b2f
[4/6] pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
      commit: 15998583b19749e63c5cd0431a2517f524352762
[5/6] USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
      commit: 62d2a940f29e6aa5a1d844a90820ca6240a99b34
[6/6] gpio: Get rid of GPIOF_ACTIVE_LOW
      commit: fffb9fff12250018a6f4d3e411f9d289210da329

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

