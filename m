Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0E0C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 00:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=; b=KZPCFvjsamG2F5pYSTyghAdBT3
	TTT2NzA/FZlrV+gn4EhzoFkqdqvmrsUWJwPmBF5NiBEb2ryoQ6NE0N1/Gbzpd/QyVWOYxxx9PirgR
	Jr7+8tQd5SoQ+3OrDOHUtj9PUCl+exnaUkgdmquuQLLJF+P03qNGCbBQQWBWz3APB0Fwn2cyLtqje
	igK5l1pBobSVPB6EprGuS49l2FblyBtP9VW6/OjR5Qvfgelur8/bJAKU0BnR2QN1ahKNUDwxa0XbC
	iVF7QvYB/ozigF3X8lFJSb9GM/NrIqCiOo2Ok45tp4WEydnM+ZFhxWPVc08qCoIcW9oNOdqHHo4zE
	LgbzdVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9jA-00000008VcL-14E2;
	Wed, 11 Jun 2025 00:54:04 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP77F-00000008BHj-2grZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 22:06:47 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55351af2fc6so7162641e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 15:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593204; x=1750198004; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=aPz/QhUiFkpv9RnOsHIKthTQAFt7JEQzmRzeMmZ8RqwxopBY1lXqDlluyCsvU2hsBI
         jp4/5z0pzRTsNfu2yx+Sqpx5YZbi10hJokRA3gdxEwgBc/QjLA1SWDJRb0Xv7kFJ2i0R
         mOZPmytGq66SML3OmsuJRae3/lGWqJtUQDyrPtr8xms5fLwjfgj/MrCgozxmDisZIp9S
         c8/Y1FI1ZGSeFFr/n+pcaAauT5uiqVhOKEaSdNNy7LJ7vCJyZV0fBlq0cVKHaqMjHErD
         /Upad4Eqrs/8gPXTHkWYtTi0VHIYc4dM37ZmEtAVG4LX6MD2ecYhGFmZI8dE4WsItuRA
         dSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593204; x=1750198004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=R5IAYKZP0g9Fe85DtbnEGt10YMtJhWiyZSttxPtKlasTzywfhlJfxY2h0o++mx7zqM
         ZPVeQCadP7T+YOxYQHpvAyuA7K4E966eA0cB0gvbYW37OSdaYHfZVjqwzN7PJfl7Gcpe
         5WF03eFWk9k+9g1CaJFlJr+uYaKfI0BWYhvsTFSHfIJPn0v8+HRaeYm0r7is6QNMm4SY
         JdyvQMGG0oVmywpV5TMa1X39ifSfM2EpetWENDfbzMiyYqYYEbCThD20g7Up5ZtVza/9
         XBqn2jWf/R06U1Yp7RSeywTJ/74jf0she4XLDc7FjJ2jaoXiAsDQ4DulMIJcr85r2B0p
         nVDg==
X-Forwarded-Encrypted: i=1; AJvYcCVLuIuCG28ZqeQrE7ZG3vpEU7Kdwi3oNgAeJoyZB8Scj7Tz9xZj0hl40HVTcaxXnmIGZ0L0mqr7S+Ry2M5A20zs@lists.infradead.org
X-Gm-Message-State: AOJu0YwYcHGC5BJ81zAk6MKCV9/YcwyI9NIz3WB1GR2aea7mWf1RY4gq
	D++PZoa6taiD7qWNlixrclP8UsbVuhN/zEpbJ2GJhkTXGV98ohDRagkMzfRzC5bbIms3CezOklt
	ctd3Iy6t9UYLhztT5CDGEGmjD4FJtUD+tOnzwcixLSw==
X-Gm-Gg: ASbGncs5d8louJ+HtxeyPIcwdMoUp3MiKTKtrH4zQO/AEArIBqglccJmEXQKxD2Iwr/
	xPjNPOyimYMDVRLMaEoStCeXWxBIhpjwTialdPkC2DlxHgus++NzYLAHb1zsxXMItDkzK0kvCLX
	fAViWK77pmngf2S081tHr47ioTJupGGf9u8YAvWIo8TZg=
X-Google-Smtp-Source: AGHT+IGlqZqOxo94Fq1AxRXbuSE8IQ4NwQa1mjzmaOgaM7Du8n0a08UJH2Mj9vvFcKeYpn253k3S/NXDYuSRYxggVL8=
X-Received: by 2002:ac2:4c4f:0:b0:553:659c:53fa with SMTP id
 2adb3069b0e04-5539d4be3f5mr111095e87.5.1749593203962; Tue, 10 Jun 2025
 15:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:06:32 +0200
X-Gm-Features: AX0GCFsQuNMrR1lnqoFxpoWnn4BCOjfc6g0nU8IoyS3i9wf_s_1MzLLDkyq5jQE
Message-ID: <CACRpkdb8GBwtOGQYrVkxiv8ZCjEE6pkQ_kSEutY2jYG0bUbFVg@mail.gmail.com>
Subject: Re: [PATCH 08/12] gpio: nomadik: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_150645_676591_7915259C 
X-CRM114-Status: UNSURE (   9.27  )
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

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
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

