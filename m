Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAAEC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlyZp0Y8DtkcpxZgedsAGdv5R+a3YrLHF+oXTMTBElQ=; b=hNN5ERXCQrT2+FSeXhxd5JU2d0
	fAwLh3TAuzhUxBAldvuKS3DMh6iwnelAtxPJ01VCjpZV3CkYi/4t0b+meJB2zQXrU/f0p6kChkO3h
	S2XyXjy7oMZ2ZhDG65W7byhL/5jJzDPDshXLyaKJjpH+de1wJcRjNy+emIYwHztKYxtR/9J348ZMm
	ScaMEVbYJg8nQJBuVLVGPGx8R7IhxC1C3EtdYVl0smvfehCj0dv26HgU3F8UPubk4go4vXHAGzANQ
	2+JmYZysoOufjmTB/e1FRAJJ7hPJTCa3Ps4x3gb3DW8NT4BvnFF0wlIKejpk6jDccVj4EvYt3JP/f
	eB3TOrvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bJQ-00000001hqm-3JMW;
	Mon, 21 Sep 2026 10:31:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bJN-00000001hqW-1BWQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:31:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DA4B601F0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 10:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2832B1F00898
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789986708;
	bh=wlyZp0Y8DtkcpxZgedsAGdv5R+a3YrLHF+oXTMTBElQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=VPU9tO8HyjXQg9hPxqUgoZx3O6CP8/01/4vHCoV9a260fK4Edl4qoUs+qxH+0w9mU
	 /5PbomemBtITMx8M4jPCzMgYYqXJj29ejgQxRuZ7nfDXRhpvSCnfAfq0PzVuwTrsSp
	 zXUnpRfk0O7lMWJs/JP+bvv+OxbUdcmSMVhRYtRNjZ/sYH00R643AQ46wExjKB8MVI
	 W+OaB1cE9LYQ94n+pR3PBMMrsDzAAic54alptXlheNRDRm6xKvkbXgplTsQR7wCyIs
	 DRqjS7+wMN3k2cvyOY5A49srIrlgWXZUGdYkRX2KSEmgR8Mpx84plERTRO3wh5SgAJ
	 5V5AHaHTG1cww==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff16c0e6so19216531fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 03:31:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzPrZiC5aqaaXQqASdQzh9t0mpUUU4WDoff0YoyNT4aIHh3U3JeyR9/plI5lSPu8xfTbuZxG6w4H9DtO+O39VKI@lists.infradead.org
X-Gm-Message-State: AFuF++l4vN4VzzUv9HSdM++r3E66ocM2RGAdRmuDnrm6HIE+/uAW/EJ1
	hgT22bBFRf9Z0gRozodZtOo/U5WONJbUyALz2eqkWY3QEqM+E6vxi8mpGosZ/MLcInBpE4dhvlz
	SDSBqrJGUOxc0W19h4v4KNfD5KY0ilYWbNXKrJK0QOw==
X-Received: by 2002:a2e:be8a:0:b0:3a3:74b7:fc0e with SMTP id
 38308e7fff4ca-3a5fc03636emr22688931fa.26.1789986706801; Mon, 21 Sep 2026
 03:31:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 06:31:45 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 06:31:45 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
Date: Mon, 21 Sep 2026 06:31:45 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mf-0oLOPZsPboE0dzOGE2AzNE0LXmv9fcmgWO47FtGu1g@mail.gmail.com>
X-Gm-Features: AcwNN1UZiDNcMAJ4MNmlX-UMIL58DwmKhOHQm7KWs4DW0jTpzuluxkWRRETFZSo
Message-ID: <CAMRc=Mf-0oLOPZsPboE0dzOGE2AzNE0LXmv9fcmgWO47FtGu1g@mail.gmail.com>
Subject: Re: [PATCH v8 00/18] Ambarella CV75 SoC minimal bring-up
To: longzhao@ambarella.com
Cc: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 21 Sep 2026 06:23:19 +0200, Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> said:
> This series adds minimal Ambarella CV75 support for early bring-up with
> a serial console: DT bindings, RCT clocks, pinctrl, PL061 GPIO via
> gpio-regmap, 8250_dw UART quirks, ARCH_AMBARELLA, CV75 EVK DT, and
> MAINTAINERS.
>
> This is a single unified series. Please apply via the SoC
> tree; subsystem maintainers are Cc'd for their pieces.
>

As I said before: this brings in a lot of potentially conflicting code into
drivers/gpio/ so I'll need an immutable branch to pull or I can queue the GPIO
part myself and provide an immutable branch to other trees.

Bartosz

