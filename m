Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA62ACAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 22:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SWHpC7XT0boWgdfna8gc+pG3x0qlvgKa0qIbsC+iC4=; b=JRVoDP6kxkanfqVOGdKbX6TFm2
	2Sk5P50DWgG2n43y2pDtTQGoANE0On0zUlySvwWJd4zsb1ZGBtEApuADhgt3bWPuEX8rNgCbw1oHT
	W9MrzFiYU48216J7s2uakO8vhvW0cTGD9OPCKdw6OZIs/YDxMNthD2KdshJAkk2HeGTcIVWsTivfU
	sGW6H9mp1mtRsS9pUlh7ARh8dSfAHBIviV86WGdhvwvG5HIoix7KID+sB+u3gSbHDbp6++x+3jEp8
	8QvjX41+sFkfWgIdXJWekc6J4TFplVvzF2p02sY2/zzq2UtO//sfMkqsLJ2GHadIawH8k7bcoQp6Q
	3SjCYe9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Bhz-0000000F6Ll-1n0z;
	Tue, 23 Sep 2025 22:42:03 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Bhw-0000000F6L2-2onO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 22:42:02 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3696f1d5102so28938731fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 15:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758667318; x=1759272118; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SWHpC7XT0boWgdfna8gc+pG3x0qlvgKa0qIbsC+iC4=;
        b=kEC6QjFelSfCUaiMpAanQX2/76eylzbPfJgxtCu89ziERQBQOxdeB/TKd0sHZb2Het
         jXqZE4+z5eF/laW7BT1WPSzNhnMhb61MVd3OpAfVIO0bUcKFLD5EiWtcR8MXGxvTl7NS
         6vU3ZK+8EavMx4xvP1gnGSzZfrK3rwWAqOkv1y0U04EMt6U40GCXJVh5p77J/pZGYImw
         cGINLi6sALRFHaWRaWRgiXO/Qko6EcCxwN0SnBm6gu/Hh26pcBlVzqOqAK9rZAQlmjMX
         WI7GF4EcyBA4EYXtRqOB7eT+PvSeF1VajMRJbJ80QuUZ1WYxwXLuUDif/i5MqJqtraRb
         Fx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758667318; x=1759272118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SWHpC7XT0boWgdfna8gc+pG3x0qlvgKa0qIbsC+iC4=;
        b=h6sHe7R56TBsItjzxH/MUFqp+BNqfJKHLj4X3Vjq9GJptc9uc+YkSJdJ116N3L6OS/
         5tYq6r41dRU3heG4MXjzFzVMBy+BBPEZUXAMlS1tQ1HudvT6xcroPXiBAqrQtpaoE2MF
         6zHmqtNoV1mqQQKdxRFXo8JRS5ym8Go2kmO+tRDWK52UduKi82/x87gaHaMwIKZurdVn
         VUw1XjRB9nJ33/vIk5EitQQ/0sSRBqCSAklQtf43ynKFZXzcdgeElfkNYFmKXIq8Sb8O
         vIVLfG4u+itjsG1bZgMCO8WqMhzphrGsJ61lhZz8xnoIUFIUYK2Xai8uL0QU/gUwWyz1
         c+9g==
X-Forwarded-Encrypted: i=1; AJvYcCV0yV4UAYs3sVBvNn6WKdnqi765osCH1RIV82Abjqp52wUhqVCoTtDFDLkSLGftCyzyQiWvxmv4FvsJiYON5W1h@lists.infradead.org
X-Gm-Message-State: AOJu0YwB9gb++ZvniaU/KAtEggJZ9bYJJNhXlkPB3ZHxvXl3me3cihOA
	+QqV2CMPrKfv7S+9L9PF/7sViUKwLUunntqFsurOSnz7TVIRswM/WFX1k+zRsUI2E51FAK53bQq
	lf4bNLt+YDdvOnE0w+eu5/hzXAP0SqBPn4D78B3fGhg==
X-Gm-Gg: ASbGnctKzzQ91MaTZfJq9Vj59U2I4TOoXpZ/SPYHluLVsFkfHbgoXJY4P25cIuZrved
	AQqRjhDWcw+qB8lMncYzwXtfI86R7fPYhtjGPgnDXeJrpV6PUYTMepZ6ijBa9s+H67dYUUdydpz
	H7j7J/6Ekaq0qmejBK+VJHK9mqFRUNVZuR3WR66KdmzW5COz/qLZoCWkTtrr8QAw0iVbEaji8LP
	IFxhD8=
X-Google-Smtp-Source: AGHT+IG99GeGJ6EJmRFtaCX57MxbFFNDKEJDSpjz4IOp4Xv1ApJ9GNzknCU6gn3AgKwY56E7tlVN9VixGw0iGQWzSiA=
X-Received: by 2002:a05:6512:4007:b0:57a:7be2:21e4 with SMTP id
 2adb3069b0e04-5807051c520mr1245993e87.9.1758667317970; Tue, 23 Sep 2025
 15:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 Sep 2025 00:41:46 +0200
X-Gm-Features: AS18NWA87kQOtTQ-6Uw89hDflE_WXMd3ykrYMsrH2sWDsx3-k27OaCZ6EKQ1YIY
Message-ID: <CACRpkdY8AN5vRQEt=3QzdFdPkvx0FLiv7QmwZ=eqZBSn9sUtng@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_154200_721602_F72249F7 
X-CRM114-Status: GOOD (  10.03  )
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

On Wed, Sep 10, 2025 at 9:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The (typeof(foo)) construct is unusual in the kernel, use a more typical
> syntax by explicitly spelling out the type.
>
> Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-1=
3-9f723dc3524a@linaro.org/
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied.

Yours,
Linus Walleij

