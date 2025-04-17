Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D561C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 11:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FQmq6mPm5BcVKIvGNINkYwYP9M0N7suMdJCV/VEqS4=; b=QQtB8moSuKG+LjEXnuSWzK8gAR
	E8kEfaP+m4P0VJ3wmvQb1aQoPKiaRHMYmnL6HtMsQMAHu7x4JI0/juV/0UnT6JEaytabez/sqengD
	txwXlyuJn+JOT7jggG30gv8pi6ye/RLX0QE94C0mj9EJbD7Go6lAZa578fPcI5Brt2c4rcOaUYweq
	ObHGyTxJQHm8IChbz2DPhK88r0vRNtTOTjbl2G2qY6pNOcgM/LVqHwEUXRywM9HWDMamFm7ZSW3JE
	kMPkMpP2+BHFIpPEJJYtjsq2dUHF7YjygjJEC9W6crFLjB4YQbf/BrhmqxVOYJ/JCBw7N2QBVsndS
	aWCKhLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5N9h-0000000CkC0-294D;
	Thu, 17 Apr 2025 11:11:41 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Mne-0000000CgaK-2s8i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 10:48:56 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6fda22908d9so4034017b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 03:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1744886933; x=1745491733; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3FQmq6mPm5BcVKIvGNINkYwYP9M0N7suMdJCV/VEqS4=;
        b=NRA17MUmsJVbP+7lzH1FWPej8dudij7um14jyBP2+amWPhWRR15FupRPS/DFTdNAtm
         403V6iqiL/jx8kZaPv9JqCwKI5GVJcMtsqZzVhX6cpltX7z8vN91eXKGLbJFPPCiU1WB
         YthFVM6RTlnzgsND2szwbizQA/I+D/dF8NORovlWZhmTJ0KkWwQUqRPcT7NDVnbxncxe
         QtcAf7VKFa0AiyuM+lz20Fqv9Alyvc6s193Le1Tk9Ubj9l54MCGXqOZ1rjxK/ZlNlvO9
         H3fZtj1V507p0VlfOZLI7gEm6kiac4lVUKX3uts/O2VpxT58DGqMUPS23Ynrl09kSMEw
         dU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744886933; x=1745491733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FQmq6mPm5BcVKIvGNINkYwYP9M0N7suMdJCV/VEqS4=;
        b=Ctj0L4vs+H9XNU3te9zMm8FHvx5S9gcD0RG9XFOt4sdOMuSHE85J2ekOxop1GFnM2g
         DTwp91Lr0VbRPz1Rmht17Hr6oDdEVmPHcdhCaKOFCNZv6RnSbh6fkzmjdMFF43Zzemeo
         BzZngWOU44D31zn/wpg+3yAr85Gbc3fZ2QIEkzw6BkaHf6DnjIJTZ+Y+SkjAgXQ6XLyl
         5SdDBtpOOTnlWBQZqISvwrdRQCKESDbtDZIiKOtgqyPOsHYT4R/Nz0vAsO6uG7qJpby5
         MRs5bPdERPRaJflHGi38Y1gf5ZeYGLSaSi1ETDyac6Q+5rzp0qBO11fD7Pvqw4ESvChX
         2mkw==
X-Forwarded-Encrypted: i=1; AJvYcCWoDL+W0O+a9RwkDg6Goy2LWpGWjz5J33R7aUyddv/qaYS/0ssl6SIqR5M2lee0k3rWOaDdyQjqKv3sLeh3LQgl@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt3lnI34jNOPmvQnXjh+6iGzd+2QUXnV+GTOCfNznsqwznqJdn
	YIW5rsGBe4r9gU0rQpTj1tQNuWIfWBPV7fe/m/fGcZeBeh53u826CSaiL0k2vw3Y9IywF3mzYCV
	6r1i9XJSaexoMF0D/wfg1vbfi6ffudDcAUsETSw==
X-Gm-Gg: ASbGncslJrpoSp2kqkoOifsefupQrjF/k4mk6mDUypA/WsYZD+nEyZvjyXnMmW8twpl
	Lyv5fowtwWp6NM+QUklm827NmtURHmN1N/ITcmwhSG0D0uO2mPYbYJ7oBYO2xZi1shSej5Fq3nC
	g8u8rFRK5mUcfmg/Worc7k/qs3FUrKl+foOLMtQaTPBGPy5ONy3TlNig==
X-Google-Smtp-Source: AGHT+IGLKmF80adLXuj1efSVNgIqhTYlmIxxyWRh7p0wE2BMSJ0PxoGhtbuAHVljmhe5c9jUioDN6HwA2xV5k59yvpc=
X-Received: by 2002:a05:690c:670c:b0:700:b389:9246 with SMTP id
 00721157ae682-706b3392ea3mr77881107b3.38.1744886933054; Thu, 17 Apr 2025
 03:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1742418429.git.andrea.porta@suse.com> <370137263691f4fc14928e4b378b27f75bfd0826.1742418429.git.andrea.porta@suse.com>
 <23ac3d05-5fb7-4cd8-bb87-cf1f3eab521d@gmx.net> <Z__alTyVJOwu_1gR@apocalypse>
In-Reply-To: <Z__alTyVJOwu_1gR@apocalypse>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 17 Apr 2025 11:48:34 +0100
X-Gm-Features: ATxdqUEMIuDD2WyNd1OQ61A-4i5J24ssAwpI3St8SjdqbRIE5I7kKrXYJo4vPvA
Message-ID: <CAPY8ntD2W5xAHGCD+uBL-0QgyYNj6k9MExns=DFvxU1WGYtO5g@mail.gmail.com>
Subject: Re: [PATCH v8 05/13] clk: rp1: Add support for clocks provided by RP1
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>, kernel-list@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_034854_898634_9B0BB96D 
X-CRM114-Status: GOOD (  32.31  )
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

Hi Andrea & Stefan.

On Wed, 16 Apr 2025 at 17:26, Andrea della Porta <andrea.porta@suse.com> wrote:
>
> Hi Stefan,
>
> On 14:09 Mon 14 Apr     , Stefan Wahren wrote:
> > Hi Andrea,
> >
> > Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > > RaspberryPi RP1 is an MFD providing, among other peripherals, several
> > > clock generators and PLLs that drives the sub-peripherals.
> > > Add the driver to support the clock providers.
> > >
> > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > ---
> > >   MAINTAINERS           |    5 +
> > >   drivers/clk/Kconfig   |    9 +
> > >   drivers/clk/Makefile  |    1 +
> > >   drivers/clk/clk-rp1.c | 1512 +++++++++++++++++++++++++++++++++++++++++
> > >   4 files changed, 1527 insertions(+)
> > >   create mode 100644 drivers/clk/clk-rp1.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 896a307fa065..75263700370d 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -19748,6 +19748,11 @@ S: Maintained
> > >   F:        Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> > >   F:        drivers/media/platform/raspberrypi/rp1-cfe/
> > >
> > > +RASPBERRY PI RP1 PCI DRIVER
> > > +M: Andrea della Porta <andrea.porta@suse.com>
> > > +S: Maintained
> > > +F: drivers/clk/clk-rp1.c
> > > +
> > >   RC-CORE / LIRC FRAMEWORK
> > >   M:        Sean Young <sean@mess.org>
> > >   L:        linux-media@vger.kernel.org
> > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > index 713573b6c86c..cff90de71409 100644
> > > --- a/drivers/clk/Kconfig
> > > +++ b/drivers/clk/Kconfig
> > > @@ -88,6 +88,15 @@ config COMMON_CLK_RK808
> > >       These multi-function devices have two fixed-rate oscillators, clocked at 32KHz each.
> > >       Clkout1 is always on, Clkout2 can off by control register.
> > >
> > > +config COMMON_CLK_RP1
> > > +   tristate "Raspberry Pi RP1-based clock support"
> > > +   depends on MISC_RP1 || COMPILE_TEST
> > > +   default MISC_RP1
> > > +   help
> > > +     Enable common clock framework support for Raspberry Pi RP1.
> > > +     This multi-function device has 3 main PLLs and several clock
> > > +     generators to drive the internal sub-peripherals.
> > > +
> > >   config COMMON_CLK_HI655X
> > >     tristate "Clock driver for Hi655x" if EXPERT
> > >     depends on (MFD_HI655X_PMIC || COMPILE_TEST)
> > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > index bf4bd45adc3a..ff3993ed7e09 100644
> > > --- a/drivers/clk/Makefile
> > > +++ b/drivers/clk/Makefile
> > > @@ -84,6 +84,7 @@ obj-$(CONFIG_CLK_LS1028A_PLLDIG)  += clk-plldig.o
> > >   obj-$(CONFIG_COMMON_CLK_PWM)              += clk-pwm.o
> > >   obj-$(CONFIG_CLK_QORIQ)                   += clk-qoriq.o
> > >   obj-$(CONFIG_COMMON_CLK_RK808)            += clk-rk808.o
> > > +obj-$(CONFIG_COMMON_CLK_RP1)            += clk-rp1.o
> > >   obj-$(CONFIG_COMMON_CLK_HI655X)           += clk-hi655x.o
> > >   obj-$(CONFIG_COMMON_CLK_S2MPS11)  += clk-s2mps11.o
> > >   obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
> > > diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
> > > new file mode 100644
> > > index 000000000000..72c74e344c1d
> > > --- /dev/null
> > > +++ b/drivers/clk/clk-rp1.c
> > > @@ -0,0 +1,1512 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > ...
> > > +
> > > +static int rp1_pll_divider_set_rate(struct clk_hw *hw,
> > > +                               unsigned long rate,
> > > +                               unsigned long parent_rate)
> > > +{
> > > +   struct rp1_clk_desc *divider = container_of(hw, struct rp1_clk_desc, div.hw);
> > > +   struct rp1_clockman *clockman = divider->clockman;
> > > +   const struct rp1_pll_data *data = divider->data;
> > > +   u32 div, sec;
> > > +
> > > +   div = DIV_ROUND_UP_ULL(parent_rate, rate);
> > > +   div = clamp(div, 8u, 19u);
> > > +
> > > +   spin_lock(&clockman->regs_lock);
> > > +   sec = clockman_read(clockman, data->ctrl_reg);
> > > +   sec &= ~PLL_SEC_DIV_MASK;
> > > +   sec |= FIELD_PREP(PLL_SEC_DIV_MASK, div);
> > > +
> > > +   /* Must keep the divider in reset to change the value. */
> > > +   sec |= PLL_SEC_RST;
> > > +   clockman_write(clockman, data->ctrl_reg, sec);
> > > +
> > > +   /* TODO: must sleep 10 pll vco cycles */
> > Is it possible to implement this with some kind of xsleep or xdelay?
>
> I guess so... unless anyone knows a better method such as checking
> for some undocumented register flag which reveals when the clock is stable
> so it can be enabled (Phil, Dave, please feel free to step in with advice
> if you have any), I think this line could solve the issue:
>
> ndelay (10 * div * NSEC_PER_SEC / parent_rate);

I've checked with those involved in the hardware side.
There's no hardware flag that the clock is stable, so the ndelay is
probably the best option. The VCO can go as low as 600MHz, so the max
delay would be 166ns.

Thanks for your continuing work on this.

  Dave

> Many thanks,
> Andrea
>
> > > +   sec &= ~PLL_SEC_RST;
> > > +   clockman_write(clockman, data->ctrl_reg, sec);
> > > +   spin_unlock(&clockman->regs_lock);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > >

