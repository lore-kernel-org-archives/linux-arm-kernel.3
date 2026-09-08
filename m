Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADE8C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 12:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ewf6TAC6datJbrIguz8TlCYfKFGg/5aYhxsRPBSYo4=; b=4S9GCM75es+kNwAULLp8DJLuHj
	GB5Z8rbp6T98Kvbi2gIR9BwMoKxacsH2YN/L8yodoJMG1gy3saOVf9VItcAn/W0Z+qJCb4uP8NLuW
	SEGksiCJuyxQUxkmfAaCNtDDTY7BCOIWXAyzSzKeZdDVOqrUbFYr8VbCcBkUJcs024cKnq6IfvkXo
	WMwFt09v8+j7UJhxSRHc87Y6wb6gTMhz29IGaOG4q9CHydXN0/DdTOvSDqfOyZengcxjnkywO9lJt
	oxmR8OWYOUIgVLaBsvIE+fKyHX0HjMREXwWVqwkO0ws2aiQaSjwC99zeiek6eclZi/C4oWvTLCljW
	qdojmbTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uXc-00000008y1H-3s0c;
	Tue, 08 Sep 2026 12:03:08 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uXa-00000008y0e-1mpe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 12:03:08 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c663437fe5so2004023e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 05:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788868985; x=1789473785;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2ewf6TAC6datJbrIguz8TlCYfKFGg/5aYhxsRPBSYo4=;
        b=oy1zqqH3rvEwx1LIxzR0MuW1jYK1b9tyYWR+xOjYfktW1CaeAuMN9l0z4MLwHnMmMg
         sRXM2tv76/In9lih/FsDywi4Vn34JtzdmLiuwuHJFz1BNmQZVX7AceWHrdkuPQ1PqrmT
         /YHQhQePqPFDLANutB6jxR+sdtT8FqOR8/zcsbEG5poihs9Efj9GZ/n/Uw9aVqEywvLy
         LqDIwuWOoPoev3WUIxlruksnSY87oE2nqvz8jefz0N+OOcBOd6jSXjJgxUIGQPAZnUfw
         ZVUTWNuqaBmRJyf61aw3IRzubK5v6Yfd9xpFyOW/F8K8wGaQPPQ/0A5d1ksiOtmyZxb7
         6cDQ==
X-Gm-Message-State: AFuF++lx7mByQPDOo7kbYnDjFuB3CzZxSKA8ryROmls6Jfax7zm1z5LQ
	QTsrSy/RoFOP9dm5Av4LIjLnB5pbmFmRSEV3jqLFEuxmYNyLK0kIcTI6z9dyluVS
X-Gm-Gg: AYBFou2vim/7xi4lLgj3+weTi/P0wVBuEWI9Jg33RlHLYiugucNQAFcQ4uVOmPwxECm
	CvmMTHaipfumULpVXYV5h9A6OFz1uxfLp7Qr/44a2bhrTnJp6K+npy6ijcU2djmzUw+0SBwXxdz
	HfrPV8IPx+5KNE84iOe1C1h+E5dxZO2w0KtvyVxBCHYjhVRb0Sv2qGU8iRjhO9RrAAJaUCjHzMg
	eWFXoafxV6xAjbsn0Z+SxF0oKWN0I+RF58mM1hZ3QSz8jAtUBmdwqJU8CZX6tPMH9KFbskAZnRt
	9f5zO8xL9ekLnRZQmvIQUDa2A+fqrVOTiSF91yNJmcaS0YwaDWHoW2wUgy2fApH9AQoPhAtH765
	nt3TL/8j+oXfK/luHm4/d5YhlvpLa4ZLNs48SvylGJAlaqgKpgJBO1hxTF/InABoK0HM9wGJ5+k
	9MOo3wqH0JBpibZ1kjWIdh2ACRWGAOO02v+3WrkkkMepR1IpLauFTKRjbIPvBDvUTIcs9wSJrIw
	x5EukT0X4c5OJSozJad5+IrHOXZsTTQiY0h1ndu
X-Received: by 2002:a05:6122:2187:b0:5c1:25d4:e29c with SMTP id 71dfb90a1353d-5c7ed0b2b83mr13290996e0c.0.1788868984464;
        Tue, 08 Sep 2026 05:03:04 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3874acsm9389080e0c.15.2026.09.08.05.03.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:03:03 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c56dbc3a51so1649779e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 05:03:03 -0700 (PDT)
X-Received: by 2002:a05:6122:2187:b0:5c1:25d4:e29c with SMTP id
 71dfb90a1353d-5c7ed0b2b83mr13290597e0c.0.1788868982949; Tue, 08 Sep 2026
 05:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:02:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
X-Gm-Features: AcwNN1Ut5SdzvrXN_MrghHd3UEoZOGWpEZlnNMWeOIWmWWDEytJDRzefIJak2-I
Message-ID: <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_050306_474629_449B3353 
X-CRM114-Status: GOOD (  27.34  )
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

Hi Marek,

On Sat, 8 Aug 2026 at 04:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add a DT overlay to bind the WaveShare 2-Channel Isolated CAN FD
> Expansion HAT on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.waveshare.com/2-ch-can-fd-hat.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso

> +&{/} {
> +       /* Fixed clock dedicated to SPI CAN on 2-CH CAN FD HAT */
> +       clk_can0: clk-ws-2ch-canfd0 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       clk_can1: clk-ws-2ch-canfd1 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       /*
> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
> +        */
> +       spi-ws-2ch-canfd {      /* SPI_1 */
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               compatible = "spi-gpio";

Please list the "compatible" property first (everywhere).

> +               sck-gpios = <&gpio0 10 0>;              /* CN7 pin 40 */
> +               miso-gpios = <&gpio0 9 0>;              /* CN7 pin 35 */
> +               mosi-gpios = <&gpio0 12 0>;             /* CN7 pin 38 */
> +               cs-gpios = <&gpio2 13 GPIO_ACTIVE_LOW>; /* CN7 pin 12 */
> +               num-chipselects = <1>;
> +
> +               can@0 {
> +                       compatible = "microchip,mcp2518fd";
> +                       clocks = <&clk_can1>;
> +                       /* CN7 pin 18 */
> +                       interrupts-extended = <&gpio1 25 IRQ_TYPE_EDGE_FALLING>;

Datasheet says active low, so IRQ_TYPE_LEVEL_LOW.

> +                       reg = <0>;

Please list the "reg" property second (everywhere).

> +                       spi-max-frequency = <20000000>;
> +               };
> +       };
> +};
> +
> +&msiof0 {      /* SPI_0 */
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       pinctrl-0 = <&msiof0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       /*
> +        * Native MSIOF chipselect does not work with MCP2518FD
> +        * because MCP251xFD driver needs to keep the chipselect
> +        * line asserted between transfers. This requirement is
> +        * fulfilled only by using GPIO chipselect.
> +        */
> +       cs-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
> +
> +       can@0 {
> +               compatible = "microchip,mcp2518fd";
> +               clocks = <&clk_can0>;

Please insert a comment "/* CN7 pin 22 */".

> +               interrupts-extended = <&gpio1 26 IRQ_TYPE_EDGE_FALLING>;

IRQ_TYPE_LEVEL_LOW.

> +               reg = <0>;
> +               spi-max-frequency = <20000000>;
> +       };
> +};
> +
> +&pfc {
> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */

Node name should be "msiof0".

> +               groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
> +               function = "msiof0";
> +       };
> +};
> +
> +/*
> + * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
> + * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
> + * in case this hat is in use.
> + */
> +&pwm1 {
> +       status = "disabled";
> +};

Please move this node disabling pwm1 to the top, for compatibility
with dynamic DT overlays.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

