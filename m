Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546C5FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqgLR4kLcZ3dVxyufDuvyUApdY13Qe9rdCefZi95EbU=; b=pi4ndvUX1zc86494I26Bh0x5QJ
	wgvwHZ/CyvXoi5mnsRjYkR5fJuZCnQUrEbN5H3mur+gL34YJsCs638yQjhVFtcnJuiCtvDo6OZgnE
	S29E4Q0p+xC4cpqYhXI+T+MtZ9HVndw+4BLu9rL0xZbgbCjxz3cK5p+B5RZjJpWhuvarX1UhssC8H
	s1GPSO1XfXeeFH7G1dZFZ322Jj9Aq96tlmF5ETLMlzdP0D+5VWupeuDg+Z0QmFTZWqQWRJfbzir3Q
	C3EfzpIOG7f9IerS71fCAbtSQgOVPCz2hIJ0MzPL5YV7DXJm4wl22t600TCI4DDRdi1AqvOD/y6R8
	eIn/pcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfvw-00000001CoE-3Ejq;
	Tue, 28 Apr 2026 10:44:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfvv-00000001Cnb-2YMg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:44:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 015B16014C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 10:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE67C2BCC6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777373090;
	bh=FqgLR4kLcZ3dVxyufDuvyUApdY13Qe9rdCefZi95EbU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sVI2mEYcNZo3zElrN71gZ01aE/edrfg24MyDvV/q4whvGK6NzNKp7um0sb8tuhhkl
	 AUpJW4jscW3CTv79fkvs5vBrjr/bLxW1vulToVwJ7gi2rhub2tkljh1QvZyhcoQ2ET
	 /emgjy+0Gbit4OGu1oSNJCA88VgYG21wCuhfQs36R9gaJ1EjVx7MY6+E8f/0ilOhjo
	 cJOSSvQGradYNjyGmmkwWfaY6NxrTZtTxXXjYcBmmv/i6Z/dP/zGCGec9zzF5Y+cQM
	 49Uw801N9fhauFf4l3uzwzHxqDzuusy467199gLbO/MPBYrrxgmwejnuriKQzHJfUK
	 MmMSHUfKtIymg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38df1889fb9so109062451fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:44:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8vg1kegU6ryC23fXvbnJdYyCyOKO6io1OkQui3ScqHAzsLgG9Q/gjXycMse7WGf9Cq74GVe9MFrlAm/L7V8PcO@lists.infradead.org
X-Gm-Message-State: AOJu0YwMSqFzC8VgAdTGMcTkDuxzmwWzWiXPLu8c5/8zhCrqGwa6OTQR
	XVC/zQSJo2RZf0jvjiEt/9VyvcI40X/sqh9ADbyyzcX1LMIh03PUSOjlo0YdElcNFPeQh0dne0f
	Z3eipoxekMMuA1mhZ/+QTepIJ9z0azbY=
X-Received: by 2002:a2e:a994:0:b0:38e:b7ba:106e with SMTP id
 38308e7fff4ca-392411f5110mr8948921fa.31.1777373089357; Tue, 28 Apr 2026
 03:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260427021021.2049015-1-wenst@chromium.org>
In-Reply-To: <20260427021021.2049015-1-wenst@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 12:44:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLnP9HvWPQg8WqoFkgRoFCWjkOUsRAgtnks4mEhHwYRt+g@mail.gmail.com>
X-Gm-Features: AVHnY4If7KtbqOFGA3iu1y5UjbNKnCzQkoWDNIerMJA6Wxu801qNzEULw2AcZ2s
Message-ID: <CAD++jLnP9HvWPQg8WqoFkgRoFCWjkOUsRAgtnks4mEhHwYRt+g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: paris: Directly modify registers to
 set GPIO direction
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, Apr 27, 2026 at 4:10=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
> the pinctrl mutex. This causes a gpiochip operations to need to sleep.
> Worse yet, the .can_sleep field in the gpiochip is not set. This causes
> the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
> whether it can use a spinlock or needs a mutex. In this case, it ends
> up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
> takes a mutex. This causes a huge warning.
>
> While this class of Mediatek hardware does not have separate clear/set
> registers, the pinctrl context has a spinlock that is taken whenever
> a register read-modify-write is done.
>
> Switch to directly setting the GPIO direction register bits to avoid
> the mutex.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

You are essentially decoupling the pin control back-end from
the GPIO front-end, can you try to do this a more friendly way
that doesn't wrangle registers out of the pin controller like this?

If you insist on doing this, you also need to DELETE the pin
control back-end function
mtk_pinmux_gpio_set_direction(), which is what gets called.

Yours,
Linus Walleij

