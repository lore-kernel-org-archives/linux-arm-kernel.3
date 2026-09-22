Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E27DC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDqW6T/eleBg+IVifKo8eY/xxzZd9a5JDL8hnibllLY=; b=FIrZ5I81x1Io7b91onCu+CAmDi
	LPwbBds2eixaGHmAMwCz6g5TtgyEBB+rXx7VNyE7WIS+a4QLfEjrWWitr3u5l2nkLEwhSkoGN6FAl
	qybA+VIoiEPNV+A7qLsv4wO4T14zV9QUYi+wkT8fcTEQ9cDnzDAqhFegthEMSMABWBFL/9734qsYx
	P1pYfuwBC0WWET+oaET3KRSntoSDQed9JIdGNE/rWmQvwdYmORMKg2mBY8lOOP0oxc9OOtO9TWKMJ
	0fq4Fk+/nOXlLIUozmg+psp6SbxMFGRCpOclkPxRyT0SGuStRv3ewNZnhCvZbaKq8jyLixw/rin9B
	SknuBsYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uxy-00000004Vyu-1lPs;
	Tue, 22 Sep 2026 07:31:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uxx-00000004Vyh-2vrb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:31:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DCC543C20
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A7F1F008A3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790062261;
	bh=oDqW6T/eleBg+IVifKo8eY/xxzZd9a5JDL8hnibllLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=g40mb1a26ZyzUuelCX1OT15116nPGtMHhS3st5kgkA5BYA13xkFrwXZ8ZMIjNKgzP
	 f+8z25rLZezINkew+GWFVkmeLqBqHbo9W4pqzeNB64rGkOa5Nr/kL3ee66cm+trXg/
	 BjF8gbfJ649PEU0cfdu1HNRsl5nQyLTE4GnTI0AZkxvrHm6GbrLzmy7M1HwD4MzmP8
	 Ep/8BbY8GVbh9r7NwvcU6i3mAvTdiaVWzkrgRSbq4j4KbdMxSTvy9w7hnC8ptZkL6n
	 mWQWh3nd1Xped7TnIzYwQUaWXqmOzQH5MwOkjXcQDBMu643kxwjrWJsWVvmU66AOrq
	 oAEdpl6lTCKEg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1e428so1303932e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 00:31:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBztDo4nW15nFmxMDkGQcb8xbKokoqaevRVe3kqdxg6GPP30NQ9CN52flywpI11l7sbZ2+H8YY/qd8gC3McB5z1F@lists.infradead.org
X-Gm-Message-State: AFuF++kjVHt3jrhuI6GO7r7KcKni30omc1YdLZSyMpmkkck+BqWJkZ1Q
	KjlwRXsX1LibNysFsE5o/s6MCQ/iPjWndaFn3ZL5ahTg3dsXDfPPn6Rbbn2c6yoB1BtCdAgvxC7
	pyoD3p0WnaDZh4Xg5JlKur4Fq+EkDUKo=
X-Received: by 2002:a05:6512:220f:b0:5aa:62df:cd0f with SMTP id
 2adb3069b0e04-5b8d28f3a47mr591510e87.2.1790062259696; Tue, 22 Sep 2026
 00:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
In-Reply-To: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:30:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLkCNkcf-gn0FgvLZZTibLUvbKaH6L+=nRqkNZr2iKFqsQ@mail.gmail.com>
X-Gm-Features: AclHuK8hX4pHeDwobDyuxDvOk77GoFqK-3FPyH55F8XUpLTG8sIcoklXJFAKFds
Message-ID: <CAD++jLkCNkcf-gn0FgvLZZTibLUvbKaH6L+=nRqkNZr2iKFqsQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] Ambarella CV75 SoC minimal bring-up
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
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

Hi Long,

On Tue, Sep 15, 2026 at 1:15=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> This series adds minimal Ambarella CV75 support for early bring-up with
> a serial console: DT bindings, RCT clocks, pinctrl, PL061 GPIO via
> gpio-regmap, 8250_dw UART quirks, ARCH_AMBARELLA, CV75 EVK DT, and
> MAINTAINERS.
>
> This is a single unified series. Please apply via the SoC
> tree; subsystem maintainers are Cc'd for their pieces.
>
> GPIO data path uses gpio-regmap with two layouts (ARM PrimeCell and
> Ambarella). IRQ stays a custom PL061 irqchip: a linear domain is
> created after gpio_regmap_register(), attached with
> gpiochip_irqchip_add_domain() via gpio_regmap_get_chip(), and the
> chained handler uses gpio_chip as chip data. gpio-regmap girq and
> regmap-irq are not used.

You patchset is big and complex yet you do quick respins.

This indicates you might be using an LLM.

It is required by kernel procedures to disclose this
with:

Assisted-by: LLM

added to each patch, if this is the case.

Yours,
Linus Walleij

