Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BED0C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCvgBdrIzmyxvo92jPpKMB/LyPu8S/mztJbd6iPipx0=; b=uoJXFuOjrdRE0WoFeJeH4n3maW
	NsLVdl+0cOwv9i0Mq6a+Xntuo59AEZqeW3nPiQGN9aIs81XIYdltypCyW/e7yHqzgjwNciIwvzq0W
	M3KYiAbG4xu+7D2pgIQXlBsz3iCAu4SUzDu43E6YheH0KGYM+0swh6oB1JhNa9u2Yur2qJa6bfRz4
	x5Y/OCp2YeSgwfBGBXUsza6MTBMDEgsQfl6pNKmH9DTa4C/n3rSQzaM0yRwMjBseRwXz25ND+4oXW
	uvMDVomO1Xc/PTwN4+2Xf5hJUybYESr8IaVF2gm9M4b8XToMubgAZ4K8tDYuOwIYIb52Qm4qBMM1K
	lGLt/JMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtqd-00000007mMI-33v2;
	Wed, 02 Jul 2025 09:33:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtUW-00000007iKs-3s03
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:10:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso42052765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447455; x=1752052255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCvgBdrIzmyxvo92jPpKMB/LyPu8S/mztJbd6iPipx0=;
        b=Agw4LxOG+ee/WxFdEXFgkvSB3FyWgRmnkPvaj7yq9TtJXbxK9yu9nh+Gmc6Rs1EE7y
         duiVGeC8T/e2Fz+uSfKE0D5nRWHnMPLhPsmeB63HXHLCqOYPvoF/lhNXmE+tnsyX+ILz
         OGAVIV17dLUhoUQ9N4SRNZRW3WAEv30dfjfQRLCZqjEBa5ETMrycrWTZlrfOWT+Pjki0
         /DybQJyjkDC7/Vzw7J5AIVCawVHbXJXYkmch5gjwDRorfzGXfSMhhQ78zD7JAullxQgX
         1Oh6TVoA3D9bZQNfJ2lvA6vFFS/vKPF4YGpOq/Nws0SjMW7zAb2q+6ZukdF3S/RnXH//
         K6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447455; x=1752052255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCvgBdrIzmyxvo92jPpKMB/LyPu8S/mztJbd6iPipx0=;
        b=P1/ZJB0978s+sTZt7RkKB9OoKInHhPMspq42jdEk49L2YL1g4isord7L/HICeafmpx
         ZbaO6MBHvV4AEulqhZEl6k78z+IjKQYDhrfF225YZPA0wao9L1kIKMAb1s0WCae0PYdT
         2F6uL1zRFP8jAU6VMELfykSb8ly5ou1g5mGD9aPEn2qXhLqpifYoTHxQCNec6sQmEfDv
         tbOieIcaTrnj+c1p1C44Cik2OwDhLvIIucxZqeCjYGEspDF7Ol/6JUAlNu5WAVd/Zrqw
         k0sV2co74EcTKXJvsPuOB4CzMoEJsSBlyxnOENCp7chPVwzk1Nlui8gyZExwj2MrPbwq
         IClw==
X-Forwarded-Encrypted: i=1; AJvYcCUVmqoXcHDMoy6hh986qY2Q7Uz+lA2l7nT4PW6q/ZqEwbys1XwV7k8reP6xI1lVjyDYgm8SasUCFZPisCwDNmvG@lists.infradead.org
X-Gm-Message-State: AOJu0YxPMn+akWiPT3GIEyYLj51nSxHXDxn/hjgbu1gpYn6wW404Anx0
	ppupKikRpVEHBXjo9SQCHXlDgzhrNae6TmPhxlEywwEnJkUQzLeaT8AjIPENKA8JqWs=
X-Gm-Gg: ASbGncvyC6ckqFKp98Fs1MSUVyOoacH+Fik7Da6LoQHYE2U7JHkOBZcnRh2DjjWUVwc
	5t/kHHWECc0lfqaFiVFJ6U4/NeBx7hRp57MD8IghkJtA6wDoMTOJVf5L33R7mqJM8HI57wCoMhJ
	1/nkcph3/gWh7wzKnqEQo3t2S0rDrarCJUCMvo0nHvyF07uN8xZuZUQzB3X/UcJ1uy3tsEYKcQc
	nNXjeR8VAxV8ilWtJs3hF8X/gK5ufK1K9NvsFyhGqbU91MXPKZnQ1RCv9WTxfok2SQJzD1JAS9E
	MH+6Gd0xtucna82UbjQLmI9O4lUSML0VvNrxp7I/jhbtx6IRN2jmg/5XqrEZ
X-Google-Smtp-Source: AGHT+IE2uNkHx82MMiG8CGeHGUvRcCCh7iICIVjsq7NBy92UZNfJfN/G6zonzIOaQuM2K57woKCLRg==
X-Received: by 2002:a05:600c:6818:b0:442:ccfa:1461 with SMTP id 5b1f17b1804b1-454a36e3ec8mr22278755e9.13.1751447455288;
        Wed, 02 Jul 2025 02:10:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe28dsm192866295e9.20.2025.07.02.02.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:10:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Thorsten Scherer <t.scherer@eckelmann.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Wed,  2 Jul 2025 11:10:51 +0200
Message-ID: <175144745011.23577.5985560691841779187.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_021056_962956_8352DA9E 
X-CRM114-Status: UNSURE (   9.76  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 25 Jun 2025 12:33:23 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO drivers.
> 
> 
> [...]

Applied, thanks!

[01/12] gpio: sama5d2-piobu: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/df213abe6913cae8d1d69efa66b725831f63e663
[02/12] gpio: sch311x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e932e894aec6ee22d7314f74e0a27db244a14fdb
[03/12] gpio: sch: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/883c7eb2c4a9e143b2662ba754f9c16fb31adced
[04/12] gpio: siox: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/d5297b0f861a124efe7965619212a632d5138281
[05/12] gpio: spear-spics: remove unneeded callbacks
        https://git.kernel.org/brgl/linux/c/e9a5f9ac245fd58b8477f1d2fe5a077803631460
[06/12] gpio: spear-spics: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/70c8f51ff68147176a41d549587a67ea377ed2e2
[07/12] gpio: sprd: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ae35dd91ad2ea4ae446e74364edd6428a26f5080
[08/12] gpio: stmpe: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/c9148553ac13565ad06d83d7baebef133245ebe6
[09/12] gpio: stp-xway: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e87dff29ff6b919f64ca25b066c44bbacdc08ac3
[10/12] gpio: syscon: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/c203705c9b46ad0b66ef3bdc93ec9073b00efed1
[11/12] gpio: tangier: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/f3c9b6a51cb31a8816feb801c8c8a2265432143e
[12/12] gpio: tc3589x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/b033bc5a9a7d95b8dc206dd7455a033b0670d8e7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

