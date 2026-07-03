Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E061C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 21:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIo9hYtnwoa4lpPa7Xwa4If21J3/Cxx76B0qA8S5lPI=; b=hc81W8m86EJfO7Cx0eAGyEXCC0
	tlsm4SWrN83fZgNvMb+3l8tRz+jZc6yffEmmQpmn7VvphSVY0jaiNpdvtgqtqjqY+RN/t5yzNVBfT
	vSgHg4uvtmEkakisnXE7O3igRb2CJAf8ac5ffZQPdPuUURw9PVt5BDD6iN1j5hkG0uoWP0GVPiyw0
	zVFgyCkegfP/5ieZp6R4pO4ucgVpaUWmcXD2sSiiqJLAuaWu7zJqTb7pd4Kz6q6od8LjOHZUzTh3H
	4SxLlN+AxEOeTXRrhqRPjbTx4kIlja7KUSBA2b+xjw943Pq28ZX/FkXcb0b3vjoVU/E3pbpWOrXZ1
	+/hLpRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wflO8-00000007vt0-2KjN;
	Fri, 03 Jul 2026 21:25:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wflO7-00000007vsu-1dpu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 21:25:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 90BD260121
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 21:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472B31F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 21:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783113930;
	bh=ZIo9hYtnwoa4lpPa7Xwa4If21J3/Cxx76B0qA8S5lPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KqTeeiLt9q8my1JaabPQ4d0g9Esh/J3maPLu+iK7H1hO6K1bqE4EWchsDK412VC0Q
	 AZJv9cefjhqGy7A5jBCzKTWrd+YztayeCJEYkC4+44uxzAPj0DWrG+GwW7KMSX2bHY
	 2h4PbCSfDxlpz3ry1H/ru/U6XpBJEhje/zlG/vldx4ItSl7IhSc8nZSlw5Cmg9AT/8
	 gG5oq+fcBsjn/Vj6ihJY8R2eZTpPuZjZ1A6201KwXwkW4fGLEYt2k56381tpXcREge
	 +NWJSMquxweh3jlcC1zPd2QXUnCqx5kyRWbFNscbyOdTfQlJKnxOR4JhaRrqnAHR+5
	 6cNGCeA+tugJQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aebfa21c62so1156131e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 14:25:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RppvWiCLfxWV0WHRZkjU7AmQCJnteW2sM13qLTFEJabgZg8YbjRCm9NCbjVae37QrDQqsnAg9Jxp5VPcrq8PC9I@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6u3FOxWOgtYOpLI5WZc9tn02naQBZl8mknB41wzkDOVDc0d1i
	lYOwKIhSVeRDzvFI2FLaJXDbCO/OKL6XndlUyAa+TG1i95I5tYK3vlZiLJRDJggz1wYc+2/o8k9
	gKvXFU5EjY69T6G/xawrN80sbmI3dhok=
X-Received: by 2002:a05:6512:3f1a:b0:5ae:b0ea:d32f with SMTP id
 2adb3069b0e04-5aed4f7f8e1mr85238e87.7.1783113929001; Fri, 03 Jul 2026
 14:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260313000652.11470-1-andre.przywara@arm.com>
 <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
 <20260315014205.471d6834@ryzen.lan> <CAMRc=MeorQJvA8TBosjnDU+x-FD6GhkbXwXOjCD0nmCs16ERfQ@mail.gmail.com>
 <72ccedfb-742c-4af7-8439-0f37fff2853d@arm.com>
In-Reply-To: <72ccedfb-742c-4af7-8439-0f37fff2853d@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 23:25:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLn0BSwS1CZ22CbZQnY4mKzikRwJrfO4sV=WVsSG93WzJg@mail.gmail.com>
X-Gm-Features: AVVi8Cd-QlFZ2O4JbrCfo1X6e86n1ZAPD4Rw27tfv8nva12GIn1LhD3kssPEbgU
Message-ID: <CAD++jLn0BSwS1CZ22CbZQnY4mKzikRwJrfO4sV=WVsSG93WzJg@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Icenowy Zheng <uwu@icenowy.me>, Jerome Brunet <jbrunet@baylibre.com>
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

On Fri, Jul 3, 2026 at 3:53=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:

> Hi Bartosz, Linus,
>
> so I wanted to come back to this, posting a A733 v2, with this patch
> included, and was wondering what the consensus on this matter would be?
(...)
> So personally I am leaning towards doing the change: most users can
> typically adapt - or they don't care because they don't update their
> kernels (beyond stable revisions). And to address the naming
> ambiguities, we could push for more gpio-line-names. That would make
> finding a GPIO much safer and easier, and works either way.

I agree.

> But if this patch's ABI breakage is a showstopper, I would need to know,
> so that I can rebase the A733 pinctrl patches without this one being the
> first patch in the series.

I am *FOR* this change.

Wikipedia has some policy like "avoid copyright paranoia", and
some days I feel we need an "avoid ABI paranoia" policy.
Rough consensus and running code.

Yours,
Linus Walleij

