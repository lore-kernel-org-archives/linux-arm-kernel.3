Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFB1C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9335U4BYdb3Rpl+HkVOVk0Hdu7mYIBHGPUHbDc6Yk8=; b=TAA3WzXR3lKbvUTNcE2t7P0E4L
	41cVJBEgDAbTI4+Hk9AZAQ3S12w+Tw9LtMB4MnEn3YeTVDKTEKw1XcabUTusTZmHs1iOc3wUkr7Xl
	scMWqJZA+5TwR9qkMSNmmi4VgYa0QtkXwxU+sbsRZhQwfmaTJ62Fma8Q6irqkwD05fiOvi6wmx2aD
	yxheLlLOQqAeluCR7m9A0KOw8qrHu1TV+dirm0Cfkkp0Gba1RSdnuiIfRuq+fKD1F5tQ+YWAVqYaV
	BkPW0IiNMIF9EGDjvq0luujBLAhMQy//BaUBhX2nlIdWKae8uPvj3Po36wQiL7uausgxvD3Bz1X30
	mXR6tLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjlO-00000007Jmd-1YFx;
	Wed, 05 Mar 2025 08:05:58 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjjm-00000007JWb-2Ml9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:04:19 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30b936ffc51so43315331fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 00:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741161856; x=1741766656; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9335U4BYdb3Rpl+HkVOVk0Hdu7mYIBHGPUHbDc6Yk8=;
        b=NuBs9jcvOpLpcGBEixTIF5syz47NjWkmReJ6Xc7VX6yv5TUWScO9zpiqWmJAZULu8S
         yKH08OaHI/IITm/ISmeiqOO0PYanKcJsTJt2YkWUppDK5twZa8bjynAosLbu9GeyNEfS
         6q4Gd8FFE8caH48f6VOt1NrmsMzrTpygXoN7jXNmtPA8MlvM0CIFrYB1aKD7MB0LYErk
         iNmBs564MwIgRMC1bYcmJoTtqiZgOc02wXcc2ZFHoJijYsU5/mfrq5iGb0dHGi2tFzhs
         GD4rqv4l9dPSdlJvl0ryR5+HXAz/Zn/kMrqsN0vwuTx8MfaWxYliPucuUV9A0U7ve83B
         Gxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741161856; x=1741766656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9335U4BYdb3Rpl+HkVOVk0Hdu7mYIBHGPUHbDc6Yk8=;
        b=j1ojB/zhZvpm8obQtULv+rLCzbDndTMcgpYV/6adxPpq21vGAVvOlcPpSkt0HftXtY
         nG5FmeaZ/YWUpuN5P2rGuc9SBHTtRaiCKp8wZhVEJjks2bNY7kq52pic2kOQga0fatHH
         GU24kGT1Cyim604ySdkBf+JomslDO1YkjXfPIQN1yqnRbJ/jkxrLjNVOBiiHu6dOi5LQ
         ZROkwCLyYLS3iNcEKTw8i7IP7KQQp1MhrN/V+6Xck2e+wGDIWd3upRbZFhaJ20fXUBXo
         xoBjM6bg13MgwymMlCylFRsigHO94P5PDCFmrQT2wl/Y7xjMxSOnvHAGuYp0ikeU+jod
         rMJg==
X-Forwarded-Encrypted: i=1; AJvYcCUiE14QiAZq1YROicsKkw/MZEa0yp8sovlH23sQptfhsLCEQ/rEWNtkLdtqec+gf0GSwBI9fJZZB+gv7A04uoD8@lists.infradead.org
X-Gm-Message-State: AOJu0YwNuqWsP12P5ixZBqyHxJeUlkr7/HAKvUByUVxATnWa0j5j9wU4
	w/JAVsvTqIQtq2kfV7OjXndrYvA6VjKUWZA1DyCRzm6UBaQPtmmgnVIeDCjMIn+E/awG0fmh/f9
	hakAZHOnH4nzQeFcki+9HjyErVCpyNKX3VzruQw==
X-Gm-Gg: ASbGncuVYKAoS8Dix5vSqL+asZEgoMO6SARqbmshRdIj84IO7UEDST1o93s3iZJnGW5
	fhf/Gsmhow9mZzkLoDgO3ALc2c6XzUwL91yhPEvo58cz2lBRUWhfOa2lPJ7DOk3MR0CsGPXoq7A
	RIk82UbX65TWUH6xoMKVDwSXTxPQ==
X-Google-Smtp-Source: AGHT+IHxONNXRxXY/9SA/ScuPloLBavDa3lTwDH5EUDUvtRMl6Gewl1QIgssFE88vQwX5zwh5iaHK2NYlKSskUdQiJc=
X-Received: by 2002:a05:651c:2128:b0:30b:bba5:abfc with SMTP id
 38308e7fff4ca-30bd7a427d0mr8296691fa.9.1741161856549; Wed, 05 Mar 2025
 00:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
In-Reply-To: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 Mar 2025 09:04:05 +0100
X-Gm-Features: AQ5f1Jr_36wy4P6iO_K8_dKn2UUlLFsUGnWdDx_V_chS6C1Pbzndlez70ok7ggU
Message-ID: <CACRpkdYTsym-YqV8CQh7up57q_R2ZGSnsCD8FiYSpQnS5CaFig@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] pinctrl: bcm281xx: Add support for BCM21664 pinmux
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Stanislav Jakubek <stano.jakubek@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_000418_605870_B0118D45 
X-CRM114-Status: GOOD (  16.80  )
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

On Mon, Mar 3, 2025 at 9:54=E2=80=AFPM Artur Weber <aweber.kernel@gmail.com=
> wrote:

> BCM21664 is another chip from the Kona line of Broadcom SoCs, and
> its pinmux shares a lot of similarities with the BCM281xx pinmux.
>
> Add support for the BCM21664 pinmux controller to the BCM281xx driver.
>
> This also enables pinmux support for the BCM23550, which has an
> identical pinmux config to the BCM21664 (hence they can share a
> single compatible, brcm,bcm21664-pinctrl).
>
> While we're at it - fix a bug that affected higher registers in the
> BCM281XX driver and replace bare "unsigned" with "unsigned int" to
> comply with checkpatch requirements.
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
(...)
> Artur Weber (6):
>       dt-bindings: pinctrl: Add bindings for BCM21664 pin controller
>       pinctrl: bcm281xx: Use "unsigned int" instead of bare "unsigned"
>       pinctrl: bcm281xx: Provide pinctrl device info as OF platform data
>       pinctrl: bcm281xx: Add support for BCM21664 pinmux

Bindings are ACKed and not much other feedback so:

I applied these 4 patches, I had to rebase the one dependent on the
fix a bit and then Torvalds can fix that up in the merge window.

>       ARM: dts: bcm2166x-common: Add pinctrl node
>       ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI

Please funnel these two through the SoC tree!

Yours,
Linus Walleij

