Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F79CE9B247
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8HVzWzouKm2cXoM/hnZEz9vy29hL3PfIfqqpzFCC/o=; b=AQNJKmFNHwBM+VQy060Wf9gcu6
	nJr1JS4G83LwoR+UbsZrrM5pIWoZw0OqAtZws1/t2O+R+iHbla7P2ingAVk/HTwB17jLfxuf3hSSM
	/HO/cPiLzXYKL3tV3/dvAbZgwplMjk+htNLtjMyJVjEhQ/n5/9cpg1lKYY6Flzq3kdXHro3YrS32K
	T6xefzZqXXKikLG68DPqXwrriPaP1tGOYlkLVQHIL2a2oXdwDJ5Im3UJEON6RDluJYhnBEVaBXg1C
	6QCGvgHmmIAhT5UkZgMrgginPI8g13Ufgn7jjUJluzXYmcpP5PvNWikQWZFm63y2Ev2yhjGqxkDF8
	CtGRoBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vup5p-00000001nlZ-2t1d;
	Tue, 24 Feb 2026 09:52:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vup5o-00000001nlJ-29Hs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F69A61332
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 09:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3773CC2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771926755;
	bh=m8HVzWzouKm2cXoM/hnZEz9vy29hL3PfIfqqpzFCC/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TRe05JmOj0zrjkSzFH05uNJmpKrg9ivJSnNZidMu2MnVIUKZF2E8qd5SAYZSngaoY
	 O8vAPho2SoADBUurJnXaYQXTbwAs3BDM/1FyCQJRti9EE+T6XzDiKFI5obf+Kg+X3t
	 XxWheObEfdxROoSp6FAspV52lwIO7siyrt+q+VrDk/Ubp6/DpoE4jG0h0VGtGXMHOr
	 ot3zk8ELoOgk40t1EzX3B802yz94IAaFlz3R6aUQf11S+whbKxHnzKlO/9PsUtuYuB
	 67GU4vmMijyDU8a2MtR+3fW4D8MnvGrTnc7bjoj2cPaE3OeRz8B9v8+7nH24XsKtVN
	 jEXsifY9fwq+A==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso5013564d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:52:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUI6vqi2Rbsjytl+Ri8Bws/VxrUkeVK8KlURey24DB8R4d42Ul8OlNo0SaNeq+0GjMeeP/j5XTEfkZMSo/UgYIF@lists.infradead.org
X-Gm-Message-State: AOJu0YxBfZMdKdBWzROUNcgMvhX0b1CS7Ey5lim/vLOYwAQeMOuHRQOZ
	ZxCPgpo8+y4LsORcNbC0bXPgUFWlOgL5N7kOCGrTVQc+7EdFtt6h0K39YdFJoW89YZGOtM3tAeB
	XK4dMCd9wi6bAt69gKpO0zZ7H5ScSG98=
X-Received: by 2002:a53:c94e:0:b0:64a:df24:813a with SMTP id
 956f58d0204a3-64c78ace3b7mr7721765d50.29.1771926754578; Tue, 24 Feb 2026
 01:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20260224092419.1275016-1-wens@kernel.org>
In-Reply-To: <20260224092419.1275016-1-wens@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:52:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLnKxDi1GCp94zAUKhwBvQwVAdT8bgNyw5XM2+PTOhxq1Q@mail.gmail.com>
X-Gm-Features: AaiRm52BGBXQpCSo4y3loUoixsBJESk5D9jZK8HxDIglW3gm2oXSHNiHQK0JrJg
Message-ID: <CAD++jLnKxDi1GCp94zAUKhwBvQwVAdT8bgNyw5XM2+PTOhxq1Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

On Tue, Feb 24, 2026 at 10:24=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:

> After commit 471e998c0e31 ("gpiolib: remove redundant callback check"),
> a warning will be printed if the gpio driver does not implement this
> callback. The warning was added in commit e623c4303ed1 ("gpiolib:
> sanitize the return value of gpio_chip::get_direction()"), but was
> masked by the "redundant" check.
>
> The warning can be triggered by any action that calls the callback,
> such as dumping the GPIO state from /sys/kernel/debug/gpio.
>
> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Pulled out v1 of my tree and put in this one instead!

Yours,
Linus Walleij

