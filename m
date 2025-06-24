Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0D0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEEqXQPzSi/2DYZkyERnStSQgx8nwqj2N53hxm8wTV8=; b=1K5Swml2aBfWNHVEVq+eAxqbzh
	fodTsqWYr/2XQBEQ1laExAjeRpIxFMVM0Cz/Qo7hqYN4pQToYMVqgWusxwgchDMhpFAEG4gvLT9NT
	Mj3u8v3iFiMLF7LV5d+SHox76vpHcOdE4ZSIwQ/pkLJsEmjiwFmxCez0h5FkGDPdAiQcJQ6aiPDQU
	J06WUuFwcmP6C1b0tKO2A+HfOULb36uDC0uOdWkEGWdTUXPrSt2jozQ1/CmMmD5ifJr6qCgerA5n1
	IDrhK2S9pxwdb4X1+Vhom1/alQiMib3z08ci05YeuAD4wwCO9eOZFPzhAE3cf0Boolce6cpAIiuv5
	lHiL+6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBXS-00000006ucK-2eZV;
	Tue, 24 Jun 2025 21:50:46 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9Yp-00000006dcH-0FTT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 19:44:04 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-551efd86048so850257e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 12:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794241; x=1751399041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEEqXQPzSi/2DYZkyERnStSQgx8nwqj2N53hxm8wTV8=;
        b=cVNk1bvu4uBUG/BE3cYh2ewON1HLoN8hXz3zXX+Z5YCF0TAzU7PAFOMjkfWbPWsSHX
         ezhhdiEgvDVRG/p/mNDoV5dxYCd6hfnBwhPslCIwzquY4DtQ3FDV+WIxj2jW3jUHANZy
         IMQFSHHbD4EjoKM3gqM/JmcMD0ouT7yrDB5Q0y2jKmCHY1NFJWa965k6J+gNaveJoqBh
         syjiK8VJT4XRk/IkLb7r8PlAZ2U51/RfRbpg+kmVz487gZj6lPVd7pn5oigdIJnWBMin
         ZPl/N1YcTwLKN11k5NkH+J97Qx98frzRCSXVJ+zY8So9dV3yVyGatI/sLxXolBUx8GeZ
         zBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794241; x=1751399041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEEqXQPzSi/2DYZkyERnStSQgx8nwqj2N53hxm8wTV8=;
        b=s/Vas+J7rLZ9lM557umjE+aNWOwErfKugQD4XdMoo/1B62BhdnaAWqW+6OBSSuKHyP
         +ozJSQIT1FU6Dw7SWYmUp9AVzxjiVqUAmaYyNVV1CxcAl0gz0th2d/PrJfh9djFgj1P7
         CCbufGW6PvzHT37EbITooha1CfQuKLwCUM9lYezhFsZT2qXABXHMGR+nubtgF++QEZIb
         lEVBkgjV5jtKivttd8E6Qw3wrgZO4p2UrPWkCBje2BNroTRaIwwbg5iaR9iSCCDQp/Ob
         PvX62TXO/JwSwrbX7NxWlv1Z9w+n/yuH+YIH11zpc8WhoTV0/2O9ui/SQG5vHU/D4fOI
         lDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYl5uM0V3dxCcnXRpz4ywh1m+AvKNRpLYTGMYBLNejJpaDhK6Xfx1zKtc9MxyXYPZUZox/3ykOWyPQvxK6Nf3K@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8b7qFpMmmRIR1onLyO8BUrXJ0/ZPNR3GrwRb8FKCjsybA8ylP
	8r09VkuTARegk0QtemSXiXjQ1fBRoPLj9Pl4JRXFH7T87mAa86yP9k0pNSBBPkUjGcIAF/PCqvT
	P71q3dsv+KRTUTvEC/aoTm33QALFP+zfCaOWt4Ti3eQ==
X-Gm-Gg: ASbGncu5qwBO5MttBUqhT1VgIU/HSC2kbnWNTg0JQt5uug4s0W4vEnY4ItVTNlpVYEN
	3jUMXEUrwBTFl1AA8i9ie5m8EoGPyefP4l4KROP3w36UojKUbJ9VOa3ui/3cVDN89f1xn4H2q5U
	Zit7CUBwxWuyWWA8EEqKYClGzuYm9MSKJhMzX5ya3zhac=
X-Google-Smtp-Source: AGHT+IF2ZsZmunuKbQXBbvrJ/CF+mo6d+N7b7ivEICTBxI/GH/HmsLM4r9Hm61QzUCqDuwsN/lGUxeELXR1RoBAx8E4=
X-Received: by 2002:a2e:9e4c:0:b0:32b:7cdb:aa4d with SMTP id
 38308e7fff4ca-32cc657b90dmr64541fa.31.1750794241285; Tue, 24 Jun 2025
 12:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:43:50 +0200
X-Gm-Features: AX0GCFvZTjr80iDIOZKB_55ymASKXhThtYvBCFl997kaJ5_-KuT-0OBBGsj3psE
Message-ID: <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_124403_099434_98BA495E 
X-CRM114-Status: GOOD (  15.77  )
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

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Ahead of removing struct bgpio_pdata support from the gpio-mmio generic
> module, let's add support for getting the relevant values from generic
> device properties. "label" is a semi-standardized property in some GPIO
> drivers so let's go with it. There's no standard "base" property, so
> let's use the name "gpio-mmio,base" to tie it to this driver
> specifically. The number of GPIOs will be retrieved using
> gpiochip_get_ngpios() so there's no need to look it up in the software
> node.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This works for me.
I wouldn't be stoked to see device trees abusing the "gpio-mmio,base"
property all of a sudden just because it now exists as a device
property though... I kind of wish we had a way to opt out of exposing
this to all the sub-property paths. But it seems tiresome, so:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

