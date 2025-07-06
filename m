Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47976C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 15:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMlbKX+K6Yi3ZmsuHL3jCao7JCUHreI4o1rb+0N/8yw=; b=fOVgy2ejlp2PEx
	ergABp6/QD4fDvoM0hcZzIWaUTf0eMLB1j+Tcjd7JeUjkkR282pTYJRPyiLxh8rSbzDNQfn7Uomnh
	YxzdmKL4Ae8ivnjvgqcaFW1415oFMDBST5pMpi+dAHM73SH0mdKepHCZp25pIVuLbIU2l/j4Ap3Io
	t/MDjyv6Gknqc9tlvgU1cnI2KriRcwYxe6JOYWkzW5ENgbQwDIxefdTQjZebeZmSTPz7ZD96v4Y5L
	8gXk5C54WSQ8/tyhQ28sHHOy4tfSXeSGQL5VUOWXtHY1Mx7GPDnPZoKy8PXTuY0mXy0w0RgxfOBpt
	xsID3UF1OegROHHsvpUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYQxc-00000000RWX-35dU;
	Sun, 06 Jul 2025 15:07:20 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYQvG-00000000RGp-0SfK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 15:04:55 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b5165cf5so2984565e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 08:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751814289; x=1752419089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uMlbKX+K6Yi3ZmsuHL3jCao7JCUHreI4o1rb+0N/8yw=;
        b=r5yDlM6LniiJGdtnKcC9DEo5wWjy6d23oFG2ZySX7TYuDJZGiM/usBd6TZGYNAiX6F
         MbsM/fa48LCmQcgj7SYqpcKJ5SsRwW0MamLq/IQYYhpU9RoDPBqTKbB+uaQU8TMx848j
         dOto1WSnYWDXZZtjaqIOQoIf8uaUR89SRQn8Fx9TbYCE+F4aR+BAfg54v7q/yVZwVCr7
         J+I6J4xkbjUnACGKAiOd6RPHqcGE89HX9TiRV274Hb7UBf28LKZge1fSEFlFsQnxjOcE
         KCNv9ww5tVGTNfkkLYpMwrc6EZ+VVb3IcoR5fblaiegAggalkySbrNKibMmBMYHwCrFO
         le+A==
X-Forwarded-Encrypted: i=1; AJvYcCVFEoh0ST5tNPUyo7/T+MPBln6Ba5tqgsC/5cuMGLD0JWJR9PPDR1P7/R/i+XrZIPXmt2EdUILuraBWPfT3aNKU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3YYm/hrG1mby2JeNARYRAvp6h8jrjTVprJG4n1FLXiSdRTaL0
	3kbBL/IwZmTlVfe7N13qi0kuYvmDUrdpJFcvc7k2JHMgtiO85qGIyxZ8F9HYZ9Z3Ns4=
X-Gm-Gg: ASbGncvdVVmpZcxEqFFK2b8h2x0waLsBkrWA3TjpsWd8v+xR75pmlB62NA8oS/zf/4n
	1P/S6pSNWOwPABnPiYapzYECdHbtRcTm3GsEfPY5Csbax9OamtBJnTk/DhEtf79B2OPsz/no7Q0
	8iaIk0wwDeHiqzEG/yn7VrtiXlfYkLMPx+6QWylD8p98HGb6e3Ng2X90cK/KnzV4YsC8gu8W9zC
	iZFb/M7aWZFVjZOKkcFNxXzGzqhW6Wom7fHMUZ54pP0FVo7gzQawVjkmXtqnaYhD8jSjet4AKco
	CSVL4slI1kMtTryUGGbwCg2avfgMup9FzdVuIcIfToiUeXCIPS+sqctEkMQZdjCYf0k8k7Qzm3u
	rcMlVoocdqSSvwCg=
X-Google-Smtp-Source: AGHT+IH5uIhLhVeEaTtxi2S6rPFj4cvqoR6f+ewLe48Ug0khvuMJI852TpsxkXucdB6blJWfqyn2rg==
X-Received: by 2002:ac2:5693:0:b0:550:e608:410b with SMTP id 2adb3069b0e04-557e558bc9amr1186965e87.33.1751814288378;
        Sun, 06 Jul 2025 08:04:48 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b17c95dsm8777441fa.108.2025.07.06.08.04.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 08:04:47 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553d771435fso1924085e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 08:04:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXLsoLTPT9umLSjrAsoCedCFCMetH8rSvmPQEQgF6g2YKczzem30BjA/r3Cb7Kyni2a/RKbm7xY/zRyrqAMmanN@lists.infradead.org
X-Received: by 2002:a05:6512:1101:b0:553:35c4:db08 with SMTP id
 2adb3069b0e04-557e558bbd7mr1533619e87.30.1751814287250; Sun, 06 Jul 2025
 08:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan> <aGm8n_wJPiGk85E4@collins>
In-Reply-To: <aGm8n_wJPiGk85E4@collins>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 6 Jul 2025 23:04:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
X-Gm-Features: Ac12FXzlhh-z7i6IZD8r5Xo-cn0NQ2gJKv7hIIuXOkIRtOdxBVrM3nhyYAYGLrQ
Message-ID: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_080454_153911_65E1EB5D 
X-CRM114-Status: GOOD (  41.14  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> Hi Andre,
>
> Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > On Fri, 4 Jul 2025 23:35:35 +0100
> > Andre Przywara <andre.przywara@arm.com> wrote:
> >
> > Hi,
> >
> > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > >
> > > Hi Paul,
> > >
> > > > The Allwinner A100/A133 only has a single emac instance, which is
> > > > referred to as "emac" everywhere. Fix the pin names to drop the
> > > > trailing "0" that has no reason to be.
> > >
> > > Sorry, but this is wrong. There *is* a second EMAC on the A133 die: i=
t's
> > > indeed not mentioned in the manual, but you can probe its MMIO
> > > registers (@0x5030000), and there is a second syscon register
> > > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > > It seem like no suitable pins are connected on the A133
> > > package, but that should not affect the A100 .dtsi (we use a similar
> > > approach for the H616 and A523).
> > >
> > > So I think we should keep the emac0 name.
> >
> > just thinking that it's even worse: this changes the DT visible pinctrl
> > function name, so it's a DT ABI change. With the "emac0" function name,
> > Ethernet would work with stable kernels already (as everything is
> > compatible, it's just about DT changes). But with this change, pinctrl
> > drivers in older kernels would not match.
>
> Given that the port is still very early and experimental and has very few=
 users
> and no field deployment so I don't really think it would have annoyed any=
body in
> practice. But yes in principle you are right, while the header renames ke=
ep the
> same value, the string names are used to match the device-tree definition=
s and
> this constitues ABI that needs to remain stable.
>
> > So I would very much like to see this patch moved out. Is it just in
> > LinusW's tree so far? I don't see it in -next yet.
>
> I don't think the patches were accepted for over a week so we can probabl=
y
> still act. I will send reverts, unless maintainers want to manually remov=
e
> these commits?

I can drop the dts patches from the sunxi tree. Linus might be able to
drop the pinctrl patch.

You definitely need to send a revert for the DT binding patch that is
already in net-next.


ChenYu


> Cheers,
>
> Paul
>
> > Cheers,
> > Andre.
> >
> > > [1]
> > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/boot/=
dts/sunxi/sun50iw10p1.dtsi
> > >
> > >
> > > >
> > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner=
 A100 pin controller")
> > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > ---
> > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-------=
----
> > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/=
pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > >
> > >
> >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

