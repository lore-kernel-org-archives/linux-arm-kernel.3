Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F0CCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nX1pFx+FeZOIPK/bjg7nevn3cc2xoOkWy1jCEDOPlPU=; b=vscSa37lGDcqDo4sURZjhi8r5m
	ldvXNnmRoWikSJwC9wYdO22cassJz7XRkRz+g3sN4c4kuLJAR8wQul6P+3HUHtxx9H+Tsl046nWX9
	Q0vYGIjLTz7EW1ew6lI6lJjm5oJJ74qIxxzIjFdh14p7mx3RyPtWo9Y81fxwjt9ziTKUNJGQLTXOq
	gkN9POyHfCw+IKXsl+zt364y2aoez/SNLWYO9NC/BixyPphRooiXKkHHNIWp9y5To5OIDzNMJqTNC
	xWJ8xUnWpEQrFmxnwLBawiSMxvo+9AnXIW8T3IaQ9Il2ASTvFsoiAO/dcgwBCaDzIvr8zVu/XaTHa
	+ZutX59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoB5-00000001Ww0-1Vuu;
	Tue, 26 May 2026 09:34:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoB4-00000001Wvh-1kUR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:34:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B270600AB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 09:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541691F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 09:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788061;
	bh=nX1pFx+FeZOIPK/bjg7nevn3cc2xoOkWy1jCEDOPlPU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OARhKexMO/WCnGvxp3eKjONr4YnCE2DJryoun7Pt8CDuSE4bME1pYLihfskin0DwA
	 6BkRAnj1sKA+3Fm4+q2lKRfh26On8vJldTEdh+EAUuzG4IxPTg63lrS/Zh8KFrib31
	 dHGxd/3BjgTTPbmKCNwmB/aAjZ5zjLQPYvNfqfXl2HoAL1zLbSOiwqa6si96foJHuh
	 sZ2zyrZdQxIkUwFZplMwpCSR0WeGznQSS2BXwGcgdalWGc/NGx7fYquYUjlGkoKHEo
	 9EVR55gcecJA/jidHhOiPk9K2a6+oD/awDj7NFIsNTmviU3LgZPbumF8UszclkX1p0
	 bVN6NjfYL2wqw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso10223470e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 02:34:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+A5iAeKXwnbjp3PuLgc4aS5pUDh2iLNL88fOQamWez3yzNLLu/+XGEG3TrNBn2XHMbkDHMsupDvYcSlLTD/DjJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8aLR4wFDU2i6/xRwve2NsUBGC/myYxNbVzCm46nC0F1LqTpCc
	18acgnsF5PazWpSIp4k2FNrv9EZc12MBkKzc8BBI47erMScy/kmIzx01RXBkNKn2sYjfeisXt6R
	ruWRebplTESJs4VqO+PQJ/zm2KCjI1qk=
X-Received: by 2002:a05:6512:3d1c:b0:5a8:881c:74ab with SMTP id
 2adb3069b0e04-5aa32370be1mr5852861e87.13.1779788060036; Tue, 26 May 2026
 02:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260517171405.3697469-1-paulk@sys-base.io> <20260525233808.20e75a21@ryzen.lan>
In-Reply-To: <20260525233808.20e75a21@ryzen.lan>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 11:34:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLmF8j7JthzvdzCtmcjzv7ZEEy23aCH3cLm9WtYJnUJLJQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jd-YQzV669AM8QSfdYLTsbrJsEXog3VJKPpMH3e7dMGHTfGiQX2mIvASI
Message-ID: <CAD++jLmF8j7JthzvdzCtmcjzv7ZEEy23aCH3cLm9WtYJnUJLJQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Implement function_is_gpio
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
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

On Mon, May 25, 2026 at 11:39=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:

> And what about the IRQ function? Isn't that some GPIO as well, or does
> that not count for the purpose of the function_is_gpio() callback?

The purpose of the function is to tell the GPIO subsystem if a pin
is muxed into GPIO mode, and by that we mean a driver using
struct gpio_chip, so we can approve a request of gpiod_get*().

The struct irq_chip is often orthogonal and I think it would usually
"just work", and a struct irq_chip unrelated to a struct gpio_chip
(i.e. there is no way to actually drive or listen to the lines) is
something completely separate from struct gpio_chip.

Yours,
Linus Walleij

