Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4CEC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 18:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3xxa/UfKWm1lC1tilX+p+SRJDIy4wByBvzeQKGwW04=; b=H3KMvvMO8yHV4wXXSBCcRK+biL
	Qes04PyLnm3Nq1L/92yad63W6inzATkL0+HA5I2HLOaPsaq1+YB9NBqLK8zWd6tCVYhGGvJEyrfLA
	RV+5YdE0Wq4VlXgn7MnwsTtL/fAkhZxrElENcgqR09mhmZpx1KY/+hDsG38Re23H1OySqP+anLETb
	PHbAWc5b2W+eaRiVKuAtNRozKo3z2twWaR/mWre/PmYqUfsH5ZveoMxM1vvK8pVCrj4AqW6vBTd7O
	uzlxO7pMY/0eoV/GZo/irFCtFOQTCYr2InnE3K79klYOZTQ8I9pTgbTkjCGiwBGaEsfLEYDl584Is
	2hXmwj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPRo-00000008cDD-34Aq;
	Fri, 07 Aug 2026 18:37:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPRn-00000008cD5-2gLS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 18:37:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C65E43F47
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Aug 2026 18:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF1F1F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Aug 2026 18:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786127850;
	bh=q3xxa/UfKWm1lC1tilX+p+SRJDIy4wByBvzeQKGwW04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KQRVxtckuLH/m7yt3Iktutu+xJ4K2kgbvJM3L3zEwZBuKeQfR092h5gGUV4/yo+t7
	 mMSv02m9Rh9TJ0u6Jiv+3E2lS91YwCEdb7G6zaFDJiYsBflX2rmA56BEJE0VtB2XzV
	 qw7AvWhoAhnk7DAAmD2wjT6bj7bBoO76YlbNqGBOzpnty5YmkL3U1goFdU52IrMqte
	 EwHCgvOhpEuT3TrN9WL7+iSKogjZAm3f6UYYe0LeeviRnKzL+jJVt7wefejNzjMDeq
	 NhR8qIgzeheJndiOXOYpLO5JUZLZPJI2voSC7/x5FtVBtiMOXqr6cOQwI+O5IhCVfm
	 C7WzTRgcr4wPw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b159850b16so3578921e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 11:37:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqbK3TtRdeEpKZs/4M9HLT6Z8G7wAZvEVfPdjf8yluOcyBzWwxblV9UnP0Kk/LcgipuJfK8iTCqKFfy0bpvFPaf@lists.infradead.org
X-Gm-Message-State: AOJu0YwQd/6tMIKkO+QU2c3GmAnKd/OPynDWC2zAT6mZjH8iWsD6cCm4
	2+k+biLUYBa12AY5RNEUO0zW7lLbZDqkgkVK9eawQ3X4k0GVro+RUeemt/rtGDYfoUK94rGRVEN
	8B3Vl/lHiZuAMduvu+E9YxNQQxCnGhHY=
X-Received: by 2002:a05:6512:689:b0:5b0:129c:ed76 with SMTP id
 2adb3069b0e04-5b2f4cc0f56mr3883853e87.29.1786127849010; Fri, 07 Aug 2026
 11:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-8-6b09707c5fe9@ambarella.com>
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-8-6b09707c5fe9@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 20:37:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLm6HzEU1TM-c=Vtjv3FJEBecVP7TyxSgq_Q0zF-YwT6NA@mail.gmail.com>
X-Gm-Features: AUfX_mzYw0ZkQMsDh4exCkqu18ubdjPO_uZyWXIwif8s9Ss1BlcTUbv5W-M2nk0
Message-ID: <CAD++jLm6HzEU1TM-c=Vtjv3FJEBecVP7TyxSgq_Q0zF-YwT6NA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] serial: ambarella: add Ambarella UART driver
To: longzhao@ambarella.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, soc@lists.linux.dev
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

thanks for your patch!

I know this driver has a long history and has been refined inside
Ambarella for many years. However this is clearly an 8250
UART derivative:

On Thu, Aug 6, 2026 at 11:34=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> +#define UART_RB_OFFSET                 0x00
> +#define UART_TH_OFFSET                 0x00
> +#define UART_DLL_OFFSET                        0x00

RB, TH, DLL sharing register 0x00.

> +#define UART_IE_OFFSET                 0x04
> +#define UART_DLH_OFFSET                        0x04

IE, DLH sharing register 0x04.

> +#define UART_II_OFFSET                 0x08
> +#define UART_FC_OFFSET                 0x08

II, FC sharing register 0x08.

Compare:

include/uapi/linux/serial_reg.h

#define UART_RX         0       /* In:  Receive buffer */
#define UART_TX         0       /* Out: Transmit buffer */
#define UART_DLL        0       /* Out: Divisor Latch Low */

#define UART_IER        1       /* Out: Interrupt Enable Register */
#define UART_DLM        1       /* Out: Divisor Latch High */

#define UART_IIR        2       /* In:  Interrupt ID Register */
#define UART_FCR        2       /* Out: FIFO Control Register */

This hardware is clearly using the original 8250/16450/16550
tricks to save address space.

The only difference is that your registers are spaced out
with a register shift of 2 so 1 becomes 0x04, 2 becomes 0x08
etc.

It's not even the first doing this, e.g. the DesignWare 8250
driver does the same thing.

This needs to be rewritten using the 8250 library in the kernel
under drivers/tty/serial/8250/8250_ambarella.c
or similar.

Probably you will get much less code to maintain and a few
features for free when you do this.

Yours,
Linus Walleij

