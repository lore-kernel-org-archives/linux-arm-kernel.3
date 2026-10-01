Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA78CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 19:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxCWISzbU0IXRc12DxDKUphueVrKbysRD9EKFe3TIvE=; b=bqkOFdm19uVLWheYS5deZWoAAU
	6s/VsoSqmH0ghGX875y0kdeqWUzeUU4en8z2FsORkh13TbjTPR58DqEEeX6bIDOwwI90NEBymC3sp
	ybrnZaN3sWXYDFb/P0ebXgk8LG5CZRr96LAkOqbNOhyf+KvSjbmN+grY9bPXXavzKD31s82SKMZrS
	5Wa2zbRTSRQylVDTFEsSv9/DrchOsyX4OjiXhe9CPAmNkCh58lPHrMF4rIciRazHAn/kGDe8JAN/K
	QSCC4wX8LhF0AWxSuwwXmJc1ejdIbNsEgblBopqjCTFMXmEGqq4sEn3bNeR7W3B5BnujYnWiudaii
	KPe5v6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCML9-0000000A4Nq-0HD2;
	Thu, 01 Oct 2026 19:21:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCML3-0000000A4Ma-3kM1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 19:21:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E45F4181B
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 19:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411731F0089A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 19:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790882465;
	bh=BxCWISzbU0IXRc12DxDKUphueVrKbysRD9EKFe3TIvE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fvm4NUKds+Zu8wrn2D8F5EozOmlUF37voRlk7UMJjayTCs4tOMWvfu2czPLFecz8M
	 Se2Id3O7FlBuTKPDKA8TmURR8yuCTXpt4Hi/xxr51q6GzPGcCyhWIM0L1Gyqfeyqow
	 goPGMwlOgEw0dpAY/s1QtKs0yZika9BvUtr9eAEpz1FcVq9xdv3Sj8gCIIMaRI+1g6
	 vJZu8zUxiyxz5voA5GesRL9ktiv1ePETwCkJrCdpVGjdzph5z1kBtI1MZ/wbJCW1k1
	 5wardAfPmqPO6Pih64+/J+RfWWRf3dEI2rbeUZT32i7Z5cO6L8Hd2rpoQoNCGQZDdh
	 TXHapX7sG4YLQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3d84150dso2238648e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 12:21:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwCFVBVnaMKDXAepCK3zt3dPKOGVu7vSXkxVqBN+JILKzbDcP6931f6M8PzN+fGBHuIfxZ/w2OQWXzsMGmVx1sR@lists.infradead.org
X-Gm-Message-State: AFq9FYJU4ykKcBbyKNQA9OB3iIoYfvtxVTuDskgmKK/CLjLpbXVnjs6l
	Y/MziPhfKS35BCegE812nDZ275w5QMT60n1bV0JodlH1Pd0UbSEEqNUZmooAmG5NI+ESGmdEsCL
	Atiw9C5youU0xTalxuWhWeUpVGzSGScI=
X-Received: by 2002:a05:6512:6681:10b0:5b8:f4ad:6e4b with SMTP id
 2adb3069b0e04-5bb9bb10485mr52668e87.18.1790882463996; Thu, 01 Oct 2026
 12:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com>
 <20261001-cv75-v5-v9-13-486cc289a4b8@ambarella.com> <2026100140-overbite-mundane-fc79@gregkh>
In-Reply-To: <2026100140-overbite-mundane-fc79@gregkh>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 21:20:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLnv1Q7ChHuLo=ad9edqhZL8MNaMab8huMAepK_LwqVzGQ@mail.gmail.com>
X-Gm-Features: AclHuK-xwkb5oiKwTZeGukzhni2eOhkFeU3cVe4kmkvR6xpTKv4UHYXaQGsg3Rk
Message-ID: <CAD++jLnv1Q7ChHuLo=ad9edqhZL8MNaMab8huMAepK_LwqVzGQ@mail.gmail.com>
Subject: Re: [PATCH v9 13/15] serial: 8250_dw: add Ambarella CV75 quirks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Oct 1, 2026 at 2:52=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Oct 01, 2026 at 08:41:02PM +0800, Long Zhao via B4 Relay wrote:

> > From: Long Zhao <longzhao@ambarella.com>
> >
> > The Ambarella CV75 UART is Ambarella IP, not a Synopsys DesignWare
> > licensed block. At the register level it is close enough to DW APB UART
> > that a full custom UART driver is unnecessary: reuse 8250_dw with a
> > small platform quirk.
> >
> > Quirks:
> > - keep IER ETOI (bit 5) set for RX timeout behaviour
> > - skip set_rate; baud clock is managed outside the UART block
> >
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Long Zhao <longzhao@ambarella.com>
> > ---
> >  drivers/tty/serial/8250/8250_dw.c | 32 +++++++++++++++++++++++++++++++=
+
> >  1 file changed, 32 insertions(+)
>
> When you submit lots of different subsystem patches all in one series,
> it's hard, if not impossible, for subsystem maintainers to take them :(

In my experience people do this in cases like this it is because they
essentially dump out their "bring-up" tree, the thing they have
booting on the hardware so they know the pieces work together.

Long: can you split it up in topic branches and work on e.g. the
serial driver on a separate branch?

A better way to test the whole set of patces is to just create a
mixdown branch where you merge all the topic branched into
one "test" branch, then you boot and test this before sending
out each branch separately.

Each topic branch can be versioned separately with b4.

Yours,
Linus Walleij

