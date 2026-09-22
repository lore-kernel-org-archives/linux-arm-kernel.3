Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CAFC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNI2RG1atsZurFMJdOXWnbYTlb5ko4psBeGMfQ+vVKE=; b=v21morWWz05ci8KXvtr9Kfr7uf
	TsLBmIKTZmJinWUGk3ITbK4Xgw8jUOBUyTXbQNG8o5mOSxV/g4fZcee8v6haVhrATihk617yTN8u9
	1h3X5JEwAOA+OyjdAJHb6KCgOsudl9NdMPt92Mc8CuDC4th/QhSX1heLhN2ku8/Xi7aU6ZvsEnelh
	NaDWKtxfzqjaY74uPRhdlOxBhQo1oy5yGlsdzhYEgJ1rzgaFzABuNE3byDq8E/3gwj8R1vEKTQZKT
	yeewiNgOIolaG7Pj74B6lx+JQ9p/QHLCkWy+oe2A1XvEOgexppufXpaZ7kSpw/6u9SBHMRBtJQOh3
	wf7KJ81Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uqp-00000004Uvx-0wfq;
	Tue, 22 Sep 2026 07:23:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uqm-00000004UvO-3TsQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:23:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4814360210
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34831F0089E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061816;
	bh=JNI2RG1atsZurFMJdOXWnbYTlb5ko4psBeGMfQ+vVKE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=e+IbDqyUw66Zeh7VyyVmN9w/dRRelLSZr+2236hnv8ZZ1iHbYgeIUXc8hSbpRxe7v
	 riRiY5tfXhl2qvarbChYY5d9lgP6RbqXK+AxTAwcV7Mrk1zYP9zn4BRh0kzW7Qow8f
	 TAja/je5ontcSbc/UJKo0rSnC8uEyHxWwOP40fH6I3+JxAAcVAYywfc7wqi4N6qxMw
	 0rbTYYe0e/KNvvxCjI+N4DPMAhxj0n0L/9rA3yqF+WC3zJxAyVuk7onD0prutTgg9I
	 lmaIAU7GaXqRr4F4Qr97TRCgKbOVRcqA7iV94Ps9ZWa/KNNr6kyZoEsTZ9Od1jq4Su
	 yXbQrrcZH4/oQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so3519003e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 00:23:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAznm6QRXkVHP+LAIDiMRKhzhlXx/otsOdHq1xUEwxUHQYsYs+aiObytMl5m2NBSs0h1X0DyrZfGj5biVsIFF5@lists.infradead.org
X-Gm-Message-State: AFuF++mlUSdBGQDd5NUOI16Ch/qsnVkrQY3J73aywTRx7rL/OUm9mG7K
	yBGohcJRe5AKIE4lfza0gvpRouznpTnANK52GbkgaeREAfTixK3OCChtBDQPRBj7raOzfUfNfIm
	iOoyuX8la5BAuOP5YzE5YADluMwtx5xg=
X-Received: by 2002:a05:6512:1301:b0:5b6:1a7c:59e3 with SMTP id
 2adb3069b0e04-5b8c19503fbmr4179618e87.61.1790061814621; Tue, 22 Sep 2026
 00:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-10-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-10-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:23:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>
X-Gm-Features: AclHuK-GGgIaNnG4Ini06bdUeHp1yMKnL8W3pPhlAeCPufbAr8VMtoLalY_Q0rU
Message-ID: <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>
Subject: Re: [PATCH v8 10/18] gpio: pl061: convert register access to regmap
To: longzhao@ambarella.com, Wei Xu <xuwei5@hisilicon.com>, 
	Chanho Min <chanho.min@lge.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Long Zhao <zl020895@163.com>, linux-gpio@vger.kernel.org
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

On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Replace readb()/writeb() with a MMIO regmap while keeping the existing
> gpio_chip and girq irqchip. Use a raw spinlock so irq_ack() can run
> under the irq descriptor lock.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

It would be good if some critical users of the PL061 could
test this patch.

Wei, can you test this on HiSilicon?

Chanho, can you test on LGE hardware?

but it looks good!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

