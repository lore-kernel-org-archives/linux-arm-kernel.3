Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939B9E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 12:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23yyLAUmU38oAd1esFZmS79hTf3OpT0gcNBA6YL/4Qk=; b=vZG1XdofJB4tgqleTnbC8G6YdW
	k+gOgQt424EgLBf6LUYopFjNL6hng7UwDV6JkPVvW1iuz8rosWNSZyyp3jgtKB1B1rnilWV44BxQR
	xx6/wf3pIUGau8lTXqqsZUdM7gdGzTkiZyhfoq7pkB3m113sQErwdOU8IYBZlMNda8bErOhUuOw/p
	s96hcNs/0+8JwnxMSmYLPs5y1x/ZJailmydws1DwsiYSCnCd0lLjWT3Tg79YJSnAKqb98CwmyNWhw
	6KTurjrFMWdFpHQsjOMuop7EvzVGVOvf4C9C0ja8al0njGmoiqhPtpSFZq7a/48VBjLEiy1zJznYi
	DtPMYTRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcTk-00000004w8p-09SO;
	Fri, 20 Dec 2024 12:51:40 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcSZ-00000004vz5-3kt9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 12:50:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53e3a227b82so1626955e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 04:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734699026; x=1735303826; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23yyLAUmU38oAd1esFZmS79hTf3OpT0gcNBA6YL/4Qk=;
        b=K3JWgqI5KUAWwWB9f/GatKguUFmd6/pK3matqvEG9lZznkJWCrbbGkOpS02DJpD7Sg
         AGJASSNpk7JhzmZp9VBRV9j6Ro/ejPP4lOdUkgRarmRGc8f98N26HiI+1iYFxbj4cW1D
         xA0FmrSYl+fqldnfyTgG1oKTJri2RWhOjYeBMUGyAXyiCzklUPrjwCyfHALpTIOqUNDu
         K0uxXkN9s6PktmJPgYqrILlTfavaYJ2K4uofLgnWqJSfllB5gm3BeTwwTZHZWRGmETVU
         +TBmTcFUImxafO6NmS0Gs9lJwqptnHqWDdu5sk7AYJxcsFTYJ7Oe+3MbUU+YKP+vQw8X
         30dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734699026; x=1735303826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23yyLAUmU38oAd1esFZmS79hTf3OpT0gcNBA6YL/4Qk=;
        b=hH3d+TVtzJF+BNiBX5eVJp6ydVDvTRTExJxmP9zkAx2HIt7yO7sksSVZAg1EuqRFte
         NyALpS+wtnQGoOJ5Ib6X0voWQTDqG23t6/UVA4bMSosjQbzdghiic7eyBFb1FafXuHa6
         RVjiIPxHAboQ/pne0hsDBk11SRQj+RkooiM7D2NavDdrQZfc918oli93v97ZjnoAqbGW
         K/y5JU7Hy0vCbJnz4IbUoVXd+AbGYH9uvGI5GKoDcDQdViIDgixFnEF3HAW3BSgAE5h7
         AL/iSLL8fiYleMW8T1KGlWcSETv/CPtyAt3xCFm9jXX+MKcg0vE4rznhebrA4uRK2Bkp
         ACLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtChWVavsptut2BShFgoFo0WAYYFaloHlbC4moVf8ZakZxUDctxOo1NrcFKVzvoyux+xhytqG+wRW32lFdaQLz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2xIWvMYFK8BnMCER6jqkPWwS1j34QsO0UEEEQPpdao7Ts4NCn
	eblFKVw9nu8pTlSvr0JO3KkYgXRgh7NlanK3vs2RwylLf5eCfyTeBSa0K6S5Ci0sNxKcqjFfEPa
	m8ld3TdHWudL4vYRfVnjamzD2pm/C3PW2t51CUg==
X-Gm-Gg: ASbGncspJJptkC/jKgXPGubftnRYQWGLmSTJeQxLtIWMuaLezBS+uaiHLmJRFjcGDyx
	ivPVdE3nNk3+Ix4nmJ4Y8eVLzvihEOKmQ2xJuEw==
X-Google-Smtp-Source: AGHT+IEq0umBuo+QunFadHysq7OsYI2Y7tvIXeWw5zlZVNnR52GFnztmzdoIaD2+Oknhcicnm0deL9Ked/qTjsh4Vwo=
X-Received: by 2002:a05:6512:3a91:b0:540:2a6e:3882 with SMTP id
 2adb3069b0e04-5422953c3a4mr859365e87.29.1734699025929; Fri, 20 Dec 2024
 04:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com> <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:50:14 +0100
Message-ID: <CACRpkdaB9kqcjmhaXd5RxpYvqdSVMZkj0wHAtEgdqDs03+wzJg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names property
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Stefan Wahren <wahrenst@gmx.net>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_045027_984097_5376D968 
X-CRM114-Status: GOOD (  10.73  )
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

On Thu, Dec 12, 2024 at 7:36=E2=80=AFPM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:

> gpio-line-names is a generic property that can be supported by any
> GPIO controller, so permit it through the binding.
>
> It is permitted to have a variable number of GPIOs per node based
> on brcm,gpio-bank-widths, so define an arbitrary maximum number of
> items based on current users.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Perhaps Bartosz can just apply this one patch separately?

Yours,
Linus Walleij

