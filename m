Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C6CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlKzPg19q9e2Gdbh8JVXe+cxB934h6FFCKt4x5J53+U=; b=gWAduHxuKWNJs1wedDpHcHO2i3
	nb/I3F8F8/M+htA6t4mN7FTD2/LCIDHhqIgTjNUDmPmAoYVHokDScxpu6xPYNFIf/SXt/w8RT/qjx
	WPW3GR+4e6xanOT3uSz7TSapKVwK0BYoUJuJrez5IPLWn4OWsdv1x964reKLBxkhSpa5kDdZpoHmV
	bAcLsHUjaa1euR67MZ3NIA3o12mMclmwIXhZaEPGgSTYZDkMZR+u4taqhQMfSlSR7B5Ts+nXy88bb
	YgQpeCC8GYP3At/xYpzdxpAJEs+1rwFApwuy0a78mNTZk6xSxW9ajrLOZ4cFKZ4f8SEigWWh8y1iG
	8DsMgzbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXIw-0000000Gw9X-32XA;
	Tue, 30 Jun 2026 12:11:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXIv-0000000Gw9E-2Cw2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:11:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 00803600FF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 12:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9291F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 12:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782821464;
	bh=LlKzPg19q9e2Gdbh8JVXe+cxB934h6FFCKt4x5J53+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=L5u7gC15217FP42jNRkdZlGnyZX2bgEt4eFCQcJ99qR8yfCcWsESGjkGHTG8Mvp37
	 hGSw/oVRSXSEBjniG8GyeVutSuwycJOjXkV5O5rNY6ysM5uK9nsP+GZJqFRUCN7gEi
	 X0555pMw/kbVxRLJqbnWqvmcfSwThLdS/4LyUPTkrErdILChw7313PVmkXahrv/mHB
	 p901xREZMeE1Js4wnFumWyuXj6BuWRMb87RQJ39ESxJTkMydRfBUAHESKeeDlfyZvs
	 ob0gf7e7DnVrLQ9Ymuo10HdHoKfiH7MaSuXQ/DJOysoWKzCtLGtVHdSvRsrjulKwLZ
	 mqX+WzZqXqD1w==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39af6402933so30915721fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 05:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RomG6K8/45lcaFryliVW3CTn/ppnnt7/PDtJWzZ3K3Qy8WUwWkQ14Cr1ShfVSSTgT389JkvH/Tm6Bvc25wsCX2i@lists.infradead.org
X-Gm-Message-State: AOJu0YyzBI7E5B/pTqehMIXV8MkHPDLb2pZbcu9yoOsdryYYndZtGnv0
	bZ/BJSEn3+yGxaK15fts0KMnVbgNQYe8wgk/2IwZbSpd7cbvi62Qu2X4BTj0bPtSfAlRa+w4XvU
	ft9VzfwH0CdjyRKtz/WOxijjPU0+nQ0A=
X-Received: by 2002:a05:6512:251:b0:5aa:6aba:76f8 with SMTP id
 2adb3069b0e04-5aebdbbd837mr608304e87.30.1782821463509; Tue, 30 Jun 2026
 05:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260617220451.15298-1-daniel@dragonzap.com>
In-Reply-To: <20260617220451.15298-1-daniel@dragonzap.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 13:10:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLm3gY=vMdbZ6Ep=9g8RhLu2=cgj64QYi4DZdfXK_wdPsw@mail.gmail.com>
X-Gm-Features: AVVi8CdvBjKnXgZXbX-XFU1uvMDAmDnQyRuTcGalVAa5xmjbxsVhewZ7HUZKW9g
Message-ID: <CAD++jLm3gY=vMdbZ6Ep=9g8RhLu2=cgj64QYi4DZdfXK_wdPsw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Don't remove an unregistered GPIO chip
To: Daniel McCarthy <daniel@dragonzap.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Wed, Jun 17, 2026 at 11:05=E2=80=AFPM Daniel McCarthy <daniel@dragonzap.=
com> wrote:

> If the devm_pinctrl_register() function fails,
> bcm2835_pinctrl_probe() calls gpiochip_remove()
> before gpiochip_add_data() has registered the GPIO chip.
>
> This means that upon failure the gpio_chip.gpiodev
>  is NULL resulting in a null pointer dereference
> inside the gpiochip_remove() function.
>
> Remove the unnecessary function call to gpiochip_remove().
> No GPIO cleanup is required because the GPIO chip
> has not yet been registered. Without this change there
> is potential for a kernel panic upon registration failure
>
> Fixes: 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio hogs")
> Signed-off-by: Daniel McCarthy <daniel@dragonzap.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij

