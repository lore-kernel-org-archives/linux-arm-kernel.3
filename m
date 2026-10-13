Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1C9CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 16:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eldS8GplNjgTNKWeHV2zLRcIwD+JHyo0Mc6Zm17nTyg=; b=Iy83tvqBfBIv45FYytb6BCZZ6k
	Etl/ZefH8dY4sdzDiFk3OtEVHw8JR0ickAIuv75CY3X/Ss9Q5/pkO/1yf22eFnq8sZkXAD+NuA506
	0XzvVjOTPvziN4m64xn6M1KtLImcdLQV5a+3hzQkvUR52Aj9/FWxWa2F6n852V8NisF3gNlBU3rde
	bBJPHpJIYLFyRmZlaaZE6XbRgz5G337/MgAuhFWVO7npYlDkAKhMjuXbuba5ckTyOW9mBF6RRbWRF
	N9MnRp8NrwgkTjO0jN/1uMphCdAhLtr3Amxco3GHgFMtNNbiADiZz88BlKIqil4z3GlS09YlJ96NP
	BrlLZk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfk3-0000000Db9U-0dQY;
	Tue, 13 Oct 2026 16:52:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfk1-0000000Db8y-3FPW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 16:52:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DA1A60A5A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA51E1F00898
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910360;
	bh=eldS8GplNjgTNKWeHV2zLRcIwD+JHyo0Mc6Zm17nTyg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SJEUpDdwlT97nO6lc0n/R6Oe6uXVsnSWlQ0PeDy68BYviEoMgIWrnSABf3oPREArF
	 KT92We0VmupMcw/WlzrS1W2uypvCMnqG4UJlLxrY+JdQaE2iCNsdGjUbZmCkRgVbjq
	 LetOsuaXa0B8VBYz1dPLtr2qQQpSwp5KqmjHKQPC7Xep0RSFtXcZ3TIDQ4cDAgZYDq
	 i6OJQMYhDTTFYSZ0ejFn1IoXo4MgY9WDYSnaN1KnRd5XeTgMwwQT+B0U2D/saX5pmb
	 L/CNyWm1cXwvXzKrBYPRujo5jJN3PJC7m5D50N0qIx8ENFaEWI4fJhfZQ/dhRkGZvb
	 39rAOgxT96J3g==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3aae4d5f740so6539711fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:52:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz6Bj9v/E5zKQjYhpU5Ql3lkpjEFXo+bJ1oJFt1ws53TVLMW96cXVv6dmoOPPKZi3l8eChjb3eq/k3m0tF9BHXk@lists.infradead.org
X-Gm-Message-State: AFq9FYLFS3BKbj85wbwxP1Jo2wToaSkojor5bEEhNUaKdhIH95R7QBfd
	6yvuaM7ef8yWbHmHev/jmUpFB6opnZWjP5G+Yo3oF/RYa0GLBhQ4pEcibrrDptUbd3LAXUi+lH0
	BopjZrr8Sv5Exn6hEAWFcNLE2xXj73QM=
X-Received: by 2002:a05:651c:b0f:b0:3a3:52a7:3a1d with SMTP id
 38308e7fff4ca-3a9c5125e97mr30998631fa.1.1791910359553; Tue, 13 Oct 2026
 09:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com> <20261013-gpio-mxc-cleanup-v7-2-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-2-c4d769587d3e@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Oct 2026 18:52:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLk1CC+hKyjRh=-dJ8M3oeMqo_8AVkNCUEUxpTRX1=SXDA@mail.gmail.com>
X-Gm-Features: AclHuK_VSzCmWjCTJqET6DItFfQvgfiwDPO4tQVVwYVu_IZrlaY_9fZ_pvqLqPA
Message-ID: <CAD++jLk1CC+hKyjRh=-dJ8M3oeMqo_8AVkNCUEUxpTRX1=SXDA@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] gpio: mxc: fix both_edges bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
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

On Tue, Oct 13, 2026 at 8:04=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> gpio_set_irq_type() can be called concurrently for different pins on
> the same port.  The IRQ core serializes per irq descriptor, but
> different pins have different descriptors, so on SMP systems two
> concurrent gpio_set_irq_type() calls for pins on the same port run
> without mutual exclusion.
>
> The read-modify-write of port->both_edges is performed outside the
> port-wide scoped_guard(gpio_generic_lock_irqsave) section, so
> concurrent updates for different pins can overwrite each other,
> causing missed interrupts or stuck IRQ lines on dual-edge triggered
> pins.
>
> The original uniprocessor MXC SoCs were not affected; the race
> became reachable on multi-core i.MX7 and i.MX8 SoCs that reuse this
> driver.
>
> Convert both_edges from u32 to unsigned long and use set_bit(),
> clear_bit(), and test_bit() to make the modifications atomic.
>
> Fixes: 910862ec092c ("mxc: emulate GPIO interrupt on both-edges")
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

