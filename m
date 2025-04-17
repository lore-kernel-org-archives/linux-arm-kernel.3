Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962C8C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 07:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9yxI+Mba9CUaTNrgCthTIf1TjoMCLU0SYdNd1ClZ+0=; b=3nOU0ttcXp5XOQg6WmBrfBTdol
	3cX4vvCOMMq3dIdNiDnvz7CWcOvmcxuOJNeTzx++k7k9QPhmJl85NNDRni1yQZnZD+z6YAZnSKsN6
	Kvmd0QgXKK1PpaWDLwEL67G0JTLEm6lEgCbLFokVXXqFvcNRM5WOkMAeiwk/KWjFz2hevjuiIvcy6
	FGSI8grf2qzFBtm9iQiQpswS0Pf8VEQU0d/16ImlM5Q6UB5WY4vv4aE/3iR1KhWyIUhXvkG1oWuto
	aQepcO8NqrFkuEeD1dgj5vv8+xORNdMxFLDRCuYzJpZQ+n5hZJ0tWZqLA/XlAqf+Vlsyy+eUKVK2E
	LcPL9Y+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Jv5-0000000C9NX-0RdE;
	Thu, 17 Apr 2025 07:44:23 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JtE-0000000C9A9-0IvZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 07:42:29 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30db3f3c907so4345921fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744875746; x=1745480546; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9yxI+Mba9CUaTNrgCthTIf1TjoMCLU0SYdNd1ClZ+0=;
        b=gNp9ipHUsWot6aFeTtt032914AYndjs1S2Ve1bXu/kafY/+0lkzRYbAEUoEJ+A5ceY
         u8qCSjYUtRJjzcsWcBQdrePXwZmxEvepuOKeBbCP8Hx64ARAC5sQKenMheRpRtkmgGyj
         ak1Fh47mF3e8f2L23EowxvzaN5PTWmjtqrAj1sGXRNtNbcHX2Qkuv2pzDjYatc/roFgE
         iY1Zb0oG8+YAX+fcxAo9xyKP/3j8tBb6hpO+qWofHnchdARWMOPl8ka8BkmIhyX3QWot
         FfmPjOGfJjpkyQ3hEEybTX4OdD6Ncw6rayfXzx+E+dj/gQVy4/OJuSOGgmoyoP0KFJFs
         7wOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875746; x=1745480546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9yxI+Mba9CUaTNrgCthTIf1TjoMCLU0SYdNd1ClZ+0=;
        b=oVUDOLuMNSPdov3Dp7pMO06S1HB1f2pSl5PA2RS4XKvjxsSsmQyXklzHMQ9iDEc6XJ
         CmW4AorHbCNVLi2om4LNiuIGxxT157L+VwEV5fNOO0zADhLKJwWyYlWUqKJmgfTbv/cJ
         rjPIaK/sy9x8dUr83eFEtnqgHgnvZ+lpo2qa605rRrnvuaQTuT+flAqimwLFFhKhfNJX
         dCF3hmb59RJjooC1yys0Dcq4Y+dJkZQoJkK1rXSwMfGS+V1MnsUjM2obYtn6MKyU13Ao
         zq/dntEAFKCaR1SpmqpwRBmUEwmKPMY584MhyAvq3jsxfT4DFRw6YM1wccCPsTM85jA3
         JwwA==
X-Forwarded-Encrypted: i=1; AJvYcCUNB+S/SGC90sCn7ktHqFh36BFhpTGl69FctH9EmBJRv+4KLDeKsHSzzLJpfQAgPZLtXQi8OV6ZbLPnMEscCXT3@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhroy9YJmcMymSWzrcObC4qhXxTrPLOYNoEwehdPioH6PCq6E2
	tTO/6wjg93iRV39SIQfM/k7NJcynh6ZoMt04p9cLzT4G3d5yl7UielYFCZ36TPSbiC01uAarAh3
	EPryYFRc6WZm6eCCFqKcoVnB3FMfwkB+wGCD1Kg==
X-Gm-Gg: ASbGnctsXRA3k6EKM9iKC2wZgmBVzCVWdmbsIbxSq3zefKZ4iMeZ0jFcHOuHy8Fmi8h
	s9QXa7h7CAAI8jNwfKLDZilPCcbAhIHFzxyjRtt0cUBEnioUghSwQxsf0DSV05l93TuRx8OZjgU
	Jl5WmyTS5KsfTpVI9wmbNRkw==
X-Google-Smtp-Source: AGHT+IGS1IRdJZGaZOGBt2o7TAzE4ajC3kXe2lrY8hS5Zx1+HVIOORQPGpXWTLFIUHBjt1Qe5pOZPC9xWwoJZ+1T0rQ=
X-Received: by 2002:a2e:ab19:0:b0:30b:a20b:eccc with SMTP id
 38308e7fff4ca-3107f6bde0emr19717881fa.11.1744875746101; Thu, 17 Apr 2025
 00:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
 <20250416223706.GA3230303@ax162> <CACMJSevPHdo9ZGaOyGV8rrhJHTN4+-0UB0+sz=Z5jc_eZybjcA@mail.gmail.com>
In-Reply-To: <CACMJSevPHdo9ZGaOyGV8rrhJHTN4+-0UB0+sz=Z5jc_eZybjcA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:42:14 +0200
X-Gm-Features: ATxdqUEL04h0FlK145WkXx_Q9dTs068nZ1YOBn95bqrfuRW3dCGJeGM7IpJjU74
Message-ID: <CACRpkdY5KJzCk1sfznG6DFMmX9T=pu=im_a6jTeAT68pO9SBAQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] pinctrl: sx150x: enable building modules with COMPILE_TEST=y
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_004228_112418_EEAF83B6 
X-CRM114-Status: UNSURE (   7.82  )
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

On Thu, Apr 17, 2025 at 8:42=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:

> Makes sense. Linus: Can you just drop this or do you prefer a formal reve=
rt?

I just dropped it, no problem.

I'm amazed there was not more fallout from the patches
so all is good!

Yours,
Linus Walleij

