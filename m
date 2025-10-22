Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ADACCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1wkwa2sbgbrgVXmpX6aURjXnmTYmvjQpNTyuKJo+Jg=; b=rZ/+pHisMfHJb2nKHy9yTSMr+c
	briVdhSxtEbhlFhxA2w1P8CWO97s9Eu6Y2qk7LuQYB1NyHSu+m1FWR6nJ8kHR1FplAmHOFj6sxnKY
	km7jiCaOFjD0I+M0+mFEsU9u2jV69xUJ97wWplcPwDDoExns/YunMG5JThfCqBgRe0CVihx0mRqLH
	tgMjnovULEKr4G0PsdAFqKma+cxwyvMmwHt7Y9QsFkTTyTQAwLLYhHKM4UZotMkcwWAI/+IIfpc3L
	dSpvR3fTiIVmB2YFaysofnNXdgnstII+so93mtosoTKJdeJItcZ/Z8a5H1/j5pDU2nU7JQVE8cjRu
	ua/Hrsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZZG-00000003A7k-35bn;
	Wed, 22 Oct 2025 14:11:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZZD-00000003A73-3Ery
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 14:11:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CDC4F1A15D2;
	Wed, 22 Oct 2025 14:11:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A568C606DC;
	Wed, 22 Oct 2025 14:11:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F9E6102F243C;
	Wed, 22 Oct 2025 16:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761142312; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O1wkwa2sbgbrgVXmpX6aURjXnmTYmvjQpNTyuKJo+Jg=;
	b=PlCr3ESSO1Lz6NgyqsmCsc1gCdHzwwzaG3F97GJRmw4UNWoV2zZ7Ztz+vBarrcv14hkeb8
	ZLPyeJOQdJJxqxldUujAfOpz33WY+OHATCTElWRKckQ/Ao6vOezLXmeOxFjsgz8Ib59lKc
	KOBnSv4diphrnuyCutb1P4DEV6thLTLIDScVZTqXqHAXxApOGGUkZyKzkHQfaJ5DMdHlIR
	UcoROB9m1xZ6RUPIQK45ACSpJdTwH8G7+HERmtTQdCAu98NXgRY+WY8lMt9LedzckEgQhl
	R52xwpALs7xqwSF7Kihb4yMXFpVU2h4Q5re8uyNBZYkMBuKNSFr+syWzkkktWg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Linus Walleij <linus.walleij@linaro.org>,  Richard Cochran
 <richardcochran@gmail.com>,  linux-arm-kernel@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  linux-gpio@vger.kernel.org,
  netdev@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
In-Reply-To: <20251014153021.3783485-1-robh@kernel.org> (Rob Herring's message
	of "Tue, 14 Oct 2025 10:30:19 -0500")
References: <20251014153021.3783485-1-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 16:11:48 +0200
Message-ID: <87ldl3rpp7.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_071155_941489_ED1D41BB 
X-CRM114-Status: GOOD (  19.69  )
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

Hi Rob,

Thanks for the conversion!

On 14/10/2025 at 10:30:19 -05, "Rob Herring (Arm)" <robh@kernel.org> wrote:

> Convert the Marvell CP110 System Controller binding to DT schema
> format.
>
> There's not any specific compatible for the whole block which is a
> separate problem, so just the child nodes are documented. Only the
> pinctrl and clock child nodes need to be converted as the GPIO node
> already has a schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

...

> -Those clocks can be referenced by other Device Tree nodes using two
> -cells:
> - - The first cell must be 0 or 1. 0 for the core clocks and 1 for the
> -   gateable clocks.
> - - The second cell identifies the particular core clock or gateable
> -   clocks.
> -
> -The following clocks are available:
> - - Core clocks
> -   - 0 0	APLL
> -   - 0 1	PPv2 core
> -   - 0 2	EIP
> -   - 0 3	Core
> -   - 0 4	NAND core
> -   - 0 5	SDIO core
> - - Gateable clocks
> -   - 1 0	Audio
> -   - 1 1	Comm Unit
> -   - 1 2	NAND
> -   - 1 3	PPv2
> -   - 1 4	SDIO
...

Why do you want to drop this information? Telling

    #clock-cells =3D <2>

is not enough IMO, we must tell people what is expected in these
cells. At the very least the cell values can be constrained to [0-1] for th=
e first
one and [0-5] or [0-26] respectively for the second one.

But giving their meaning I think makes sense. I agree, these should have be=
en
defined inside a shared header, that would have been a better way to
keep track of their meaning, but if we don't have that, I would propose
to keep the information here?

[...]

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/marvell,armada-7k-pinctrl=
.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell Armada 7K/8K pin controller

...

> +        enum: [
> +          au, dev, ge, ge0, ge1, gpio, i2c0, i2c1, io, led, link,
> mii,

I don't think "io" has ever been a valid value, it probably comes from a
typo while sorting out all the possibilities ;-) (probably a left over
of a gpio, mdio or sdio string).

> +          mss_gpio0, mss_gpio1, mss_gpio2, mss_gpio3, mss_gpio4, mss_gpi=
o5,
> +          mss_gpio6, mss_gpio7, mss_i2c, mss_spi, mss_uart, nf, pcie, pc=
ie0,
> +          pcie1, pcie2, ptp, rei, sata0, sata1, sdio, sdio_cd, sdio_wp, =
sei,
> +          spi0, spi1, synce1, synce2, tdm, uart0, uart1, uart2, uart3, w=
akeup,
> +          xg

Rest LGTM otherwise.

Thanks,
Miqu=C3=A8l

