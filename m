Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF0FCA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X75G81sRknseJqb68jFj/W+PfQkeYzrGsC87DcEgJZ0=; b=MvhwwMPUtvF90ZqRsn1UYl3puS
	wVgG97iEP5neYRxthyjaiKeNGgDc4ZVDoHJ6iaVG8CJtotqdd7CxDBmP96Z0ENTNCEOxtRGsQQDr3
	5E6Yy8ouH9Hpo4F8z0n1GPLk+83/xxxV8FAMJfBhriPH0DkB82LFgbEVpMMpHE8CtRTRcTini6i0Z
	2ZLRqwgbJ4o4y+H3FVMf+oEXuEurwfFhrvTezxLsFsW1rDk3+i7iuB2yl596HUNg/he2EYW3QU0jU
	LxgjeGFnj4sGnWt4T6D4T9D1hwP7d5LV3qbTQkcZwaRgMHp8L3sa6OKl5xjVTAqx3+JqUzYQKSg8G
	VBICV84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrTj-00000005kN9-2k1f;
	Wed, 30 Sep 2026 10:23:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrTj-00000005kN2-1ATC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:23:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CD6B043E15
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B369D1F008A3
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790763838;
	bh=X75G81sRknseJqb68jFj/W+PfQkeYzrGsC87DcEgJZ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nvaDK8p6Fwb00T8VTqDSVzM335/T+3Garv4vnlCFuNWWJNTg3aDnhVmT/GeODWZZS
	 YSUXpIvWE+4DlNr2E7C/fOCoS6LucXC4dHhsBY1nYWux5LIzJWDi3uQtGDpKLB5SrG
	 Kha8q0FNonI7i4zYyFP+tnnKUxfdK/RmhgRG59OvAGJSzFv/PN3kiR7Zo3bzoqsjHC
	 HzdncTSl535A1lkvhF5gEbdzvQLJVo6BItMh1Y81B31Ix5NcY2rro3XhIyvX2UbtJ3
	 YBD6gpTug34zF6hT8aF6/odEYkTGsbhCfLkk/Ccg3je8HYpjYblsjGKg+grv9FHpZ6
	 pa+0/62IOaVzg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba379d8804so1164760e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 03:23:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycEFAqprPBu3vZVc6pn3VQtMiht18W+fpiNQPVgJFHjG8nA+4Tv/zl3BnyLk8Xkz7AtYfF//6iYufHBcGVMlsN@lists.infradead.org
X-Gm-Message-State: AFq9FYI08zHdEOQ0eXMXWEqOaGeoiGEUoxToxlnlgymZkN/D2ZuIlV9K
	mJSzGJUhh5Rj4ncOiKxhOqBCiutc+I2q16IlmJhiqDXOTduXRpneiL3PfHUr0J2IPtWb4+32wbz
	hOzi51r9CGixw3P9sKXvzD7SgiKwdxC8=
X-Received: by 2002:a05:6512:2394:b0:5b8:d406:4705 with SMTP id
 2adb3069b0e04-5ba405f46f1mr361647e87.21.1790763837413; Wed, 30 Sep 2026
 03:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com> <20260930-b4-cs75xx-v1-5-4617c4463529@gmail.com>
In-Reply-To: <20260930-b4-cs75xx-v1-5-4617c4463529@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 12:23:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLnCPMmpza8efzf6oud1C-DPj6yTkECcdg9A1uB90r+2Bg@mail.gmail.com>
X-Gm-Features: AclHuK9uEIgg0bTDrefSpGkScH54YNTqnVwftBwkG2jX_u5dFR_KcXW91K8sjhs
Message-ID: <CAD++jLnCPMmpza8efzf6oud1C-DPj6yTkECcdg9A1uB90r+2Bg@mail.gmail.com>
Subject: Re: [PATCH RFC 05/10] ARM: debug: Add Cortina Systems CS75xx UART0 support
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
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

Hi Filipp,

thanks for your patch!

On Wed, Sep 30, 2026 at 9:00=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> +++ b/arch/arm/include/debug/cs75xx.S
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Debugging macro include header for the Cortina Systems CS75xx UART
> + */
> +
> +#define CS75XX_UART_TXDAT              0x10
> +#define CS75XX_UART_INFO               0x18
> +#define CS75XX_UART_INFO_TX_FULL       (1 << 2)
> +#define CS75XX_UART_INFO_TX_EMPTY      (1 << 3)

I looked through the other serial drivers but this appears to actually
be unique and
not derived from some other serial port, so:

Reviewed-by: Linus Walleij <linusw@kernel.org>

Sashiko is blathering about big endian support, I think that can be
safely ignored.

Yours,
Linus Walleij

