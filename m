Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C281AC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1IQnem5+1V3vvJSgA6Xjam0vT8Hi4iOlcZBMq1s+ho=; b=g2O4luVszy9MiyedL0vuPAiTLC
	OiZnzyTTuHKfE+VZRukozIBNC9Xi/ipN1ByuOCetvlWaauKUWrkS/OLMKAjoE4/9xoiKt6dcAeDD2
	RImHfzq56TrsSiqRKl10+f4RSx1fQ7uVi8X4iDbK6Yr5iCLRhOcRsflX5fkrKkjbDWJFB+NFWON50
	Mng7X7zbl1HZIsFEqRkVwtlZ8LxN/SsXQUQ7lyzvNOqUlxH8qKOYp/uQ70rjNeNpCREFA3KInrnq/
	5XWGKBtXgWDgxBd7xCm7+c77ddidzFO1CA6OaAtwYjAPlTwcS83HIpj+VzFkK8IrpmnJv0K6ISy7J
	bq5wblNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Gfo-00000005ShP-2653;
	Tue, 08 Apr 2025 21:40:00 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Ge2-00000005SWR-3Cjl;
	Tue, 08 Apr 2025 21:38:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-227b828de00so60681385ad.1;
        Tue, 08 Apr 2025 14:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1744148289; x=1744753089; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1IQnem5+1V3vvJSgA6Xjam0vT8Hi4iOlcZBMq1s+ho=;
        b=nH98RUBe3fE0nLfeOpJODE6RfimyTfgt9kfn5YQbI1+QZhC3DlcS2idtAn/VjnR8Mo
         q8e0FJI7dDIAcMiTzpaekciBVOgZlurYsBlXdkQUofAs+vgfitXBl8XfN1QhMRPtFQYb
         zlfZREZOcjPGZKNkljj8sOF8w97c6Nv1jEjg3kQ69ieJAYh177qOZZfSHK/skQEFDiLg
         o5znV5vx1xuB8BqgcNY8mar68M87znr2TNkotiLarm/LrImm4xMqxFV64QHBH2YqtpY3
         0L3yg6aCT3JRtOM6BSQwywsQzxnJx39de3ceLsfi8lsChXvaZD9HARJfW2BiTc9BXCgV
         8+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744148289; x=1744753089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1IQnem5+1V3vvJSgA6Xjam0vT8Hi4iOlcZBMq1s+ho=;
        b=qTdmd3XqAXijvhJN7iQ4pAD1wzMoqDIEoS+2/WY5ZHSrDiE+4iE4Nrp3YeGb9VWMbF
         hB5YTTCPFLOunNyZVi5otpYw42zUSUfsL2j4FwCTW6vV7iLZl7BVtT7zRHRgXPECurLB
         IoQOaBt+FLxmdEsgMM8Iy80DCzSqmajf4qldNSpRXZwgR/ScbKrNDLNtxJvlHAbCvpv6
         JxcvNm+wSO3Prgpp9kYxSnmLOFN24Zqb4+MftnmvNMc7Zyjbw5uV2c7316S5MRRWi8XK
         zdQ4k0jdObQBGOd2n7fzJ3FUnE64df9PKiX28QBnxNlTvG8821kNQlGQXq8TnqSu0bWw
         fvSw==
X-Forwarded-Encrypted: i=1; AJvYcCUvMY52evsus0/BcR7TeVvfOyl9a011O9KbUEFSrDye0PaJ4cIZtZw8yER+B3I82C9f0Tl8GBuRnUf1EYSU@lists.infradead.org, AJvYcCVtCTrtd5KEz1SgU/Y1JJHvjimcdHz409pkodPa0xQKQ+Fcx/Glra6Jd2IkhBz8gHdFEt5WHl9CKo4oHWbpsL4zxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8xKU3R2eLyibaLB3bZ3TDdrS2NAA1kE+O/f8+AgTr3nooLaO9
	dt6+g4PQxVULenSbkZ+e8cTbDDUDi3Oj24btRaXkbw1gfqUbSFNIzxfPGlxb6PrRaiyHAmK1ZM4
	W6VwaBsB/sjezhXq3+pOSDTeddeXy2Uko
X-Gm-Gg: ASbGncuZrqrbbxcp+IE5t5bodJX+I2H8urYDugY3J5/qeFsD6+rF3MiDRbBEDF7ef0J
	ZTSSiq+YltJBVTZ+zESvrXFYVVpK46hllw5tzBpt1zwFIWdMOL+BYnJ4ZceptXThmT6zHYAqsu/
	tJGTOpn/W8pWkDOdPGLw7kQ45l7yGPYSw5cedneJnsmFlhhmbFvSw=
X-Google-Smtp-Source: AGHT+IH5QfmQXLyEs8yLl4lnNgBrQz+0B2EeQlnngabquZiUIdHCYM/yaoQjm3bCiH0/CtFIBdc6DASRUSj6QcJIqNc=
X-Received: by 2002:a17:902:e94c:b0:223:f408:c3cf with SMTP id
 d9443c01a7336-22ac29a7d9bmr12335945ad.21.1744148289467; Tue, 08 Apr 2025
 14:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-5-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-5-c9d521d7c8c7@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 8 Apr 2025 23:37:58 +0200
X-Gm-Features: ATxdqUGtVxx8aXdM5QJbHejwtOyKwVkD40TpZrZvEEbdFgeGmw_KA4eTPuMlZqQ
Message-ID: <CAFBinCCk5MKNomc+nGMEOiwnU7NbfRf5dsVbKtEjxSoyOU_Oag@mail.gmail.com>
Subject: Re: [PATCH 05/10] pinctrl: meson: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_143810_800951_2E4AE1F9 
X-CRM114-Status: UNSURE (   8.52  )
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

On Tue, Apr 8, 2025 at 9:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

