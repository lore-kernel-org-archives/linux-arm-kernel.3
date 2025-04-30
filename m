Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D160C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 09:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQU+bng+xkR7HviR9k3Fod5rLUwRR2Wp2EYNWSD72hA=; b=yVVm6giTmilHyeFIIPyZJo1zSb
	x+0TI8Bi/JEW0TVQsDM25pfPXkfppLMh1TAsNNe98RSwiJVJUa7pyrCOIgeQLwHSz8CgdJWvj/3+R
	gfLaZc0Pg42NWCNw8GqiUIwxwsOy8w4oGx1oncFdC9uShXPGtAXUK4hj/SiPOg7Zm1u9VZMzL6S4s
	thuJfEfKUeIm+k4o4fxZ0IPAdzT/wwjhY2OfOJn8dU63+WNsUz1jloB0Pi6uZggjXAQSV237pAtF4
	Fzsg69ItXMGiWMftmKzvfOTrKgN+CF9vmWeMPGtgYsGYoGu5auTobItUk5w9n/FiK6MYeQ3aGLepC
	WmlEyR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA41I-0000000CQG9-0kvy;
	Wed, 30 Apr 2025 09:46:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2nv-0000000C9IK-46br
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 08:28:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so61896625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 01:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746001710; x=1746606510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQU+bng+xkR7HviR9k3Fod5rLUwRR2Wp2EYNWSD72hA=;
        b=B9ZMs5JfIZ3f2MQ1FDsWPmOfv21b0F5qs/5J14Kys6qsMfqnJYuGXnE0UTPYXenWEV
         Qp5jmvlLnd15sKnB3GV2dDshaDdftJ7lsRLHrFH0i7ylsccJfFQacedH4Daw+/o+t4oF
         VH547y8lfNgQb8BORJwX0lLM9lcHCXlz8BWyocZcDmb3BnpniFPBLXMnrg6F/wzPpfUN
         u2/zOkbWUq9CENSvOCufkRO9d3ZT9WbXymUbffVL+LgUJJqhDsFWaC5vdPx9RBZ3AK0S
         h1bvbonlAY1wzM9pLoCE7zGlO/TITSZgVYDmIH6YyZgggFimJ2tMNVmbOYE/0MfITrZY
         MR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001710; x=1746606510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQU+bng+xkR7HviR9k3Fod5rLUwRR2Wp2EYNWSD72hA=;
        b=p8/F0mgoh5BY1WeLD51z6codQ8sI5XLNnNaDt1Uhlxq+RJbE947PqXpS2k00EV3XuP
         YXme+Yt0fZucDuKDl6M1wo4mHcN1t4uSHa3bisWI8LIWObzIqart95odX4NE+HGxVzuK
         iQB8mVf72hD+oOxXU7/UW/V5R0V2nSD3c9OP5Wx0aVffSv6Qp5dILK30x45KaFYbNwT3
         wJrHZJ8bTNL2SYW+w3s/lgWQhHVsGF4sqsaovnnpYEQR4ZgIljUBlp2x2Opizo+bSWQD
         7BoJLW+wXU3FazXGyio0+BZ2Uy9BYD1IPfqzbSnMZQADmTRcQwqWa5xL9r3qRNqc4XUO
         qj0A==
X-Forwarded-Encrypted: i=1; AJvYcCWboFS5AAcJEPEundxD8TcU/9XcztWuI8nr6ykY5J60nGUphBdaa8BJUrXhaGIYnhQitRAQJ2jeojv3EjteSCjq@lists.infradead.org
X-Gm-Message-State: AOJu0YwSlqUH6Q23UdTzekT7dR6p5Cfr7ECad9WH7hd0r+Qwf1E8h1YE
	qYjH5p7IAQLcRZa7pijoUW2p7EL+jaqPcYWGeomFfK226MkEx/YuB5v7G/PAQRM=
X-Gm-Gg: ASbGncudQWVCd/eWqD49tyUP+K3s+FytDldeTtcBAokP9SXfadEFIxx17PzqcRDBuaX
	18epq6EObKGvBg4ta1VfvIkIXXmWUhg6iradAXcS0b+c4fCJnIaa+zMAT6jJRnT2Tp3YtcgHkXb
	Aq9PfGT8XL5uUzVht6WqnW4WmMkAUeXHmc/wLyvSrkAPOvq3no7llIHoerLFiYAUsOkg6Y7weCV
	k9kaQLDnKM3iq09JbqgK4uS9FnYX/FH4qf54GFLsK2zbt4LPhynZX8mz2FSqS8/tkKmZrrm35Vn
	ddYYlZ5SjSWTNmpLGxC54OuHRvo4MVi5i5dEnGsNi9mO9sIp3Gf8
X-Google-Smtp-Source: AGHT+IHgMvuDAt895ICDc0XLDGqBuslTtH+D05AWu6mlFg6UPu208Udg0K1dATfjFDOpPEGc7f862A==
X-Received: by 2002:a05:600c:3516:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-441b1f61398mr18443775e9.27.1746001709493;
        Wed, 30 Apr 2025 01:28:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6298:7254:d3df:f23e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecedcsm16496835e9.15.2025.04.30.01.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:28:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value setters - part 2 for v6.16
Date: Wed, 30 Apr 2025 10:28:27 +0200
Message-ID: <174600170555.13323.4628945373721333783.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_012832_021163_2227946F 
X-CRM114-Status: GOOD (  11.02  )
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


On Wed, 23 Apr 2025 09:15:02 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> another round of GPIO controllers.
> 
> 

Applied, thanks!

[01/12] gpio: imx-scu: don't check the GPIO range
        https://git.kernel.org/brgl/linux/c/57bbc60be45b750073acc7d94aaccc4e652319a1
[02/12] gpio: imx-scu: use lock guards
        https://git.kernel.org/brgl/linux/c/dd6d13abb4c363f49ddca2697a781945cf80ad89
[03/12] gpio: imx-scu: destroy the mutex in detach path
        https://git.kernel.org/brgl/linux/c/68ef71400d0e7a9049c36cd0954ecc67521b0bc8
[04/12] gpio: imx-scu: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/40150dda92cd8718a367a32ac345dce05f788a16
[05/12] gpio: it87: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ef877a159072ca31ed183b086c41fb9951521886
[06/12] gpio: janz-ttl: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/3444049044ce24c2a2bc98c6e30d189451147b63
[07/12] gpio: kempld: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/0c5fa4ee5a2256cd2d37bd0d0dda5d4fbbb30281
[08/12] gpio: ljca: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/722332f58aa82b92c857b053426dd46e09988e38
[09/12] gpio: logicvc: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ba2ce44332142a86bb0e9246d40b97d6cc191c5d
[10/12] gpio: loongson-64bit: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/145c4d7052fd15d20e5165305b3296a026a40747
[11/12] gpio: loongson: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/7d34d9fbab771779a2b365934fdafff32bddd029
[12/12] gpio: lp3943: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/127da457c4e01bd6e4b8a126aaf1be1a6c03fc0b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

