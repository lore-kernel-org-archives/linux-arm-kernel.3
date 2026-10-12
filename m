Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3F0CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Or7TLUPFjMr+wK/HbcxUvax7JxHwIuJv5EQuNkgXqs=; b=sqG7KRPNkqhwfRlzNcgCxPlAm4
	5vH/Va7CAk5x0f6bX6kdFQri9CDAY+Bxt7QMTqBelvS8u9YDWjIKMVHaVJxH5SOdz6vnaoITIPPW2
	bEo/f2zgOWnnfO3o7SSwC+dZiwbMx4rFJfWPC7icYLuFq8Q5Hs0AixbOstBYm/Dy23tImWzvo4txY
	9eP+bo8yqsytW+s6egeqxxLXwXc7wASMWnlxRZOoMYuiO+m9XKAmWBHnuLpejymbf/xS7fK++U9PW
	AQct9fZP7nBajyntlZmwR23WwxRkdkf0AtMrN0A235sxU+2MVbcScC+PZhyD14J2OqbeoY3QqUYrD
	af8yuvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGA75-00000009nsb-1bzq;
	Mon, 12 Oct 2026 07:06:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGA74-00000009nsP-1j1I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 07:06:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA5874482C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 07:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A1E1F008BC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 07:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791788781;
	bh=5Or7TLUPFjMr+wK/HbcxUvax7JxHwIuJv5EQuNkgXqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fTGyQ5krnt3K4KWTWK4hLtJ/elOPo9RESlojr5vWuuz5w790N2V2y1OAJAARJ/bGl
	 Txgkjtj9O3ajJqQX8BdReV7OZVl2jRUiHbUSvH/Hwz62fNVKeXgAqyNbQ7A+nHTZDB
	 cY8iDuCbPoIITXS1NgGkaBdVlq8jfvIb3J1lX9bjBuZorfOIiegkGv7MSGvvXCTMcc
	 QBhBn8gdHLQkz1R+AGzjTl2nne7lSljP0chstwuUjW/N0cSBwdAK0lbp2xg+vpG7BJ
	 69spnMWqt8ksZiSwy/4MJukY/TAgPon9IT5volsKgrLa306GaKymqyEQWeg6fqxAYf
	 7B2CJZaBYzdDQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so10823481fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 00:06:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0oYEet4NIvXS5sOheiphiFjxz5qrGwNJHNSOsL66dt/rs2f6TqCTqLMTms6JY1kqU7HSp+qB3y/AczYN9QFct@lists.infradead.org
X-Gm-Message-State: AFq9FYJ3sM6aVlWzO0Yl3EqajFUKxaJaUuqQJvnMt8afRF4EDDZZkLeP
	ci7rY1583bbkydapA5MlD+mFTIrb00QLT+HeWtfm9q9ggZas2BPJKG2QdWZ1qptI8wqmMgGjK1S
	02x6emv1sSolDmE0NeOHbuAAwf0C8oag=
X-Received: by 2002:a05:651c:4206:b0:3a6:58fb:8540 with SMTP id
 38308e7fff4ca-3a9c5366e70mr19126061fa.19.1791788780083; Mon, 12 Oct 2026
 00:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <20260921-cv75-v5-v8-4-282ff5d98dda@ambarella.com> <CAD++jLmKF5XxHsJX29sdXC_6JHKn-7HkE=N+TKtk5xODtQj3_w@mail.gmail.com>
 <b2256847-3ec1-47e8-ac79-ceca86eb09e7@kernel.org>
In-Reply-To: <b2256847-3ec1-47e8-ac79-ceca86eb09e7@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Oct 2026 09:06:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLkrXXg9xrhAZ8HETc5Qcv5BbkY-ibjvzBmE5WZVqDEGWQ@mail.gmail.com>
X-Gm-Features: AclHuK82cVgFxHKCaa4i6hk2Uz8RXgvi0_EuZ5dlLOwXcpR-STCWez8_fKxlZx4
Message-ID: <CAD++jLkrXXg9xrhAZ8HETc5Qcv5BbkY-ibjvzBmE5WZVqDEGWQ@mail.gmail.com>
Subject: Re: [PATCH v8 04/18] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
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

On Fri, Oct 9, 2026 at 8:17=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
> On 01/10/2026 09:03, Linus Walleij wrote:

> > On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
> > <devnull+longzhao.ambarella.com@kernel.org> wrote:
> >
> >> From: Long Zhao <longzhao@ambarella.com>
> >>
> >> Document the CV75 pin controller binding using generic function and
> >> groups properties for pinmux configuration.
> >>
> >> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com=
>
> >> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> >
> > This patch 4/18 applied to the pinctrl tree.
>
> There is a dependency, you cannot take this patch alone.

Oops, but is it a DTS dependency so if none of the other patches go in thro=
ugh
this merge window it'd still be OK right?

I think the other patches are still being reviewed and we are at -rc7 so..

Yours,
Linus Walleij

