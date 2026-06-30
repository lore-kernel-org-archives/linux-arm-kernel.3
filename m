Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDBFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x56Pt80l7vEIHB3QHUtNi8HkIWEoiB9UTmfQ7Zpg0a4=; b=tAtE1y6p1tciKBhoJTZFGgrACQ
	pG+Aad74lI44qmEQjEOkjB9BKf7nEhArceU2adxLXUm51OdUsiYHzvkH9HUEkC1e9OssbWdtjHFoZ
	1at2PMhQmIP4Rt2yk5aqMtdXE22c8VYOXf3iJlf2hDJmnZXpu2g6MSIppJM0qxGU/h9aatv7qq/cF
	3JvNiAo6Gi8dV5yhx4GjsNduupvz/5uqFPxfcLWyRDpGUhLf10uC9P8eyWImjiOQX8z+5F9NMys4d
	bLQ0/TvME0kpgxiDLqZCobJ3iFbLYl7OE8xQc8GLCydda4STQdz8/zvxrFcFgTnHDTp4UuKGDRDvg
	AkTeYmzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYLj-0000000H8dS-1bzr;
	Tue, 30 Jun 2026 13:18:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYLV-0000000H8bh-3PV7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:17:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45DFB601F0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 13:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDFD1F01560
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825469;
	bh=x56Pt80l7vEIHB3QHUtNi8HkIWEoiB9UTmfQ7Zpg0a4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OxwsS6XOVVi6xS/NMEzxnmZ3K0ByzFjRO4VA9oj9hZfIC921uKeF4/cCoar7+RH/h
	 OKYLA2xml7rXOxgoWspQdQADG+VFW+zWQdCoKZ7a2JeEEFDJel3Xpru3ZqT5tiXw7a
	 OM1rlOlvXmvZJ9J6Iw+rq+k0+k+qMDykkA42BW8W7lSmlPeq0HBZ1SJ02pJDINZLcS
	 fxX82/fp2zOyW2XxSaW43DGppZQjqiiWLhaDOelScrEpRAT1W9oxai+TaTUfwfuKmi
	 XzpQSzxio/giiLP3LeFTRS1NZrEWe8U8MkA+BwR3k4XhDGOVkUPnobypnGyUWmHak3
	 DFThktgx7hQCg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aea0fff535so4659178e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 06:17:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rowx2NhkRhoBWlD6AN/n6pYrXJCERblFsRmEveQa+7sYI1OMQvgsyeesKiKLXzHbPvWAKDIdaC3o/It6fOofcxV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/tUcDzTjHuKyx1ylIWElJ6s2e9gHfjgn4rjlMfOiU0arREpq9
	qSWmgQNzDOlddF+mLMn3Hj6R3LbAQwDQxvTCE743grL1VhJS4JPrT3L3b4bOiEmTTv50wZ0E8D1
	DRrjCa9IiBhyG7YCoXI96Gfl1lo4YZQs=
X-Received: by 2002:a05:6512:1189:b0:5ae:ba0d:7097 with SMTP id
 2adb3069b0e04-5aebdb9aca0mr1136620e87.21.1782825467698; Tue, 30 Jun 2026
 06:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260622092335.1166876-1-eleanor.lin@realtek.com> <20260622092335.1166876-2-eleanor.lin@realtek.com>
In-Reply-To: <20260622092335.1166876-2-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 14:17:34 +0100
X-Gmail-Original-Message-ID: <CAD++jL=6pqEA0-vs_J57MnhmLmLwrTj7-syOL8E7PLYW-vUBvg@mail.gmail.com>
X-Gm-Features: AVVi8CdwgtcknNrciI5bYwSnH2bFysjttC1zWzWDoBamu5PfRAkvToiEh8EArtE
Message-ID: <CAD++jL=6pqEA0-vs_J57MnhmLmLwrTj7-syOL8E7PLYW-vUBvg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, mwalle@kernel.org, andriy.shevchenko@intel.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Yu-Chun,

thanks for your patch!

On Mon, Jun 22, 2026 at 10:33=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add the device tree bindings for the Realtek DHC (Digital Home Center)
> RTD1625 GPIO controllers.
>
> The RTD1625 GPIO controller features a per-pin register architecture
> that differs significantly from previous generations. It utilizes
> separate register blocks for GPIO configuration and interrupt control.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
(...)

> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  gpio-ranges: true
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2

After looking at the driver I must challenge this binding.

Your driver is full of (offset % 32) and even (offset % 32) *4 to just
work around the fact that the hardware inherently has 32-pin banks.

Instead of using twocell GPIO and irqs, just use threecell, interrupt-cells
and gpio-cells 3.

First cell is bank, second cell is offset inside each bank.

For Linux specifically there are helpers for dealing with this in gpiolib,
and further you will be able to use the GPIO_GENERIC library,
while this is beside the point for the binding itself.

Yours,
Linus Walleij

