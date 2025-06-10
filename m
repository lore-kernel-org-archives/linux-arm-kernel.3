Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD7CC71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 00:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=; b=oDQMEFKI24jcx7qD5x7T9/Lzu8
	tQGcJgtWqpGQG4FKDeDqql4Bw/Ld+7TNwRDzk8Tm1aDBDYIGPQqbPmz0rbFAJNa+QzpoFQhW/GF6z
	/5NG48t+f1jfdMqiOLD6WUTChFPnFHUVdfqm8Fr6/3b0LhTSBsJG9FhnQ5miVfFRvFAUdPnpC3/H0
	NmepTnf6X89JTDVX10a+BT7YNSOfho4gzeKwuU9FszasZHfrpQdEY2+4Np/s7gQIXPeol7j1/vyLt
	cd9Rnyu7jIafuTU0JmoQFJnbYr+HGzSLPdgiFA8qFWupRSmJYTaFC4c+l17D1DdPyyJBas50qgN7b
	LTJfdv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9jB-00000008Vd9-0X6i;
	Wed, 11 Jun 2025 00:54:05 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP79J-00000008BU7-1GL6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 22:08:54 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so6438042e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 15:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593332; x=1750198132; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=;
        b=N9FLxPGDajkGEA+DV6gR4dka+cFq/uidV60Rx1Lt3wgwBmhbYlQUaeTqyoXGmPckUh
         f1KiD8dSuQS9+MaRXfOzKJpEI5qeZPHN/2bKRXI6PDSRRXMvewK3G5y9yHqXIHJcA1Yj
         5NJee85RKID/xaFvTNfxH1UMB7FAvMqCehxcoZvWpjZOrWAmVT6Zd48G13YbWMFgFN6Z
         oq9BWzuigYU09n9CDBsVsZZdwKv/s7IszAQqeXD7uX9Q0m0DAEBW7ScybVRCNYmndOMZ
         uRQSnR1claQ5inJUSV+lESGeefJYWyJJwXxNzs47oAivXEkgLalCKLbzEVPfVW/LGsRx
         EfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593332; x=1750198132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=;
        b=N0BSVhqGIS3iEGhj/8c2jfy759gQE26rTurKDWpO1XOudpeQbV9nYhVr0pJjefpGzc
         k7MQ+dWJzJg2NtDOev0iZg4Lpe/jmUaWi6smpJi1cefmrhiWAr7gAL0Dg8Njc9qGBHwb
         uH75jjd7JDi+uekw0N1pzhY1pxZ6STFMuev5a1n+c/ZRJMdFupzd7u/TqcAvoFGFSyge
         3yZFNqiKfXIb8oxvih1pPlKcQNl/z4X/3AsyzPhDn97HkYzFibfVbzZr1iyuEuVDffMN
         2wdnWVnmgPnKCtrlsR0t1UDQ0OyGYWYCR2AS6+Mxc+AUQ1DokXwhDnSx86wvy3oMWfaR
         tiXw==
X-Forwarded-Encrypted: i=1; AJvYcCWiGo6n5CV4Uv3AVa2TlQtsE6wUeiY5ljmpjCP8+gRCMJivSDO8/zkVZ7R7SL4w/KmuwiM1/emd9VoMLYFi+pZP@lists.infradead.org
X-Gm-Message-State: AOJu0YzWpswi3UOvgm76uMAHNNomkENAjldPeNuv2d8h5FN73OCYqpZR
	aYWXFvZ6+9gjIWIN1VSPefgwsVzAKR0/CFL3cYbGAELBKV5Z51IlCbvGJofY9ovgpEPdMTOxxU+
	WpRSSWsYiH6IZ7yzdfqiYGn/rVgVTiJ9DPfysv68B8w==
X-Gm-Gg: ASbGncuBIstcf1izXgjYLJphS+k0H5dfmooHYBdKY01PFBrU/JCXJEzMO5E4r1bJjif
	j9WQ8LU7sTSndxWeKVzoappUkfbYh7ZpIOpXskPB9LpDG7+ImkZyS2Y7wnjkIPLGUaUp77IkyS1
	8t+5VVP/9tB1zHelcbrc8DoLC8Y1P/UFBfXjJ8Beup9AA=
X-Google-Smtp-Source: AGHT+IH8MetiTltiLxVsoQdcqnz9SyKbfeIivBe6BgaYPax7FqypUr47bqpDDYKrtQHdmKVxRlIZT6Fr1Q1yswx0lfM=
X-Received: by 2002:a05:6512:3b96:b0:553:202e:a405 with SMTP id
 2adb3069b0e04-5539d327776mr135286e87.0.1749593331540; Tue, 10 Jun 2025
 15:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org> <20250610-gpiochip-set-rv-net-v1-1-35668dd1c76f@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-net-v1-1-35668dd1c76f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:08:40 +0200
X-Gm-Features: AX0GCFvL7R8uIhwfFeu8Zy5wwVjWQCtUtnOLFaGyd-WVGbMxfXjNiZWqOaZW5QQ
Message-ID: <CACRpkdb+1uYy92975JbFUgvO0GWZBru1A8gOsF_VY-opzxopSQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] net: dsa: vsc73xx: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-can@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_150853_343682_2E183B41 
X-CRM114-Status: GOOD (  10.40  )
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

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

