Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7B6C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjC36ZPf50aHqfa2Se7VHPLUpGAe6Mh0Hz/kXCMF/9A=; b=in09HxhMyvkse6VF1Y/Zq2xAdy
	OBls809PJer3SH6H3xhBNd8G5lECI5DDFpkOOKfJzhaKaGs6ZFNpS86Taj8Fd9uS6hRosaBYQgW+F
	ZkxU8DHWkmpYj+bCzu8P79x9PFamJbP22l9hq1qXQ5gzkq8zPbQ2PtEEvdCydRUaYo+bLsKgOM+3F
	9/fuqiJDfhA3Ma8W+RTh4ozgago+lKofUBU03uVhmYHW2yWIAgKZaj5uewnBbAnADUaw3GWeliy3x
	/QsZTsXgdfaZd4lkzqrnu/PSN6ARnG2GFWH6GH5rnbk9H97ZS1tvKruMcjDfi56T6mZ7i2s04k+hd
	iipsyZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Pzi-0000000DGgZ-1iwS;
	Thu, 17 Apr 2025 14:13:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ok4-0000000D3FU-2i8Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:53:21 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso480315f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 05:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744894399; x=1745499199; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjC36ZPf50aHqfa2Se7VHPLUpGAe6Mh0Hz/kXCMF/9A=;
        b=K/reDJl0n2+2P39z5mncR/mZ/SytQDgp+/C5a5DiJYgZGhJxMA4raQeiE6G3Ej7I1O
         tBfYlHrNf4pQykKUN2OsMM9xGKtSLFjXAlo0Efxg4vfEnWcYjxrC05a34dY7ozUl5rvq
         zmg1+SeobeFz/0biiooUhkeVYqWx+LVHcHOKsloO/n/ScCSn+p/rY+j7Ui9bWF5it4Ik
         vM0hYtfcZO1vytMpZNC94++NZ67kw3RVyCa0pxIIT3y86Ag7xpvfss8Q419hElza3vYP
         QRNnUBe6orBTD6WiIkihwG7oS7SsOiE62TF/0csD7Hn3biLANsttJ2L7hdV5n3RWdbEN
         l4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744894399; x=1745499199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjC36ZPf50aHqfa2Se7VHPLUpGAe6Mh0Hz/kXCMF/9A=;
        b=VLCcg3h0WZkDPyy5Hh+Rwshi6LL59YJ0xa/TdRkORCFl+3B7IHpzoAmLZ3+DjV5Lwp
         uNPvaNGjr+sWH07QZyBSv++FNLxaA6F7Mx+B/N34fQ7THm21+mPzYM1rlVxC9TYWgwqj
         0tg1PRKs/Pw/fBdwoJcKt/eujhmNcoCfksPmO6G5ot87M7l5xZuOU8TQzO6OMF77UTEn
         HBqaP+HF99U65ApYlz1FCqy/VcYo1IRG+u04VK4V2Nm5Wfi7ELuiWSIVv7HAzHRGaUo4
         9l/pddykBIilhEFAOtxsKHoTVi8WGhfuSJI066T8jg5l2efxpG1EX7mkJhsjzCjSt6ip
         AoTA==
X-Forwarded-Encrypted: i=1; AJvYcCXPTHN1wrAb5Ssq4OOm1x3Lgt3JZEYt12n9JkV9nrsm2vJTLbU3QmlAL+XjJxWevkC1MyOCz4/H83rqw8YTHv/0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5CtCfApp84eHK0pBb4RGekF4IFJF1dQbU635Q3dUTy5OmNxvt
	kpDCNBly3J9JDmQ7k32krCU+vAuH+0m/2eA5yYS1FeIvEeYFuJ0NU5ENI3xTB2E=
X-Gm-Gg: ASbGnctBsxzmSUiy7T3O/kscuIcOc7ZKCBFGVzeOAuJqwI/sPerVLoaNR5Fy1uAkSeU
	a+bDUOsu5GzoP1262hn0WRvklhA1MQXPP7sh7ROKSLG7tEwm1bngeV6Ct25cPnsFiTsU7SVMP0T
	DjenJuUr9FmdMt9wgsRB7ZrAaTG+fqvN6z4l4d1dg4vpLeX2QutBFlgPjqeEMANOhc47Ns516cM
	d++eMYKsgZFhACafyCCRJHSmVJuGyOauSGgmNc573260Ubh8oiayUolORV+PjZpjctgQr+t3YyV
	ysgN7pDdjC28OQrGfgEwP6Fxp5N8R83MmiMBL9IkiW+9hEkcAPEnkH4hCUcESsKoG1jRj+k=
X-Google-Smtp-Source: AGHT+IHj3kvQNQuwygBClqqZbgOyKaiMJWyTf63buy+7wpnebSi6rnr/xD4tdoeaaLdERbXgJbSGpw==
X-Received: by 2002:a5d:47a9:0:b0:39c:30d8:32a4 with SMTP id ffacd0b85a97d-39eea30b9e0mr2135444f8f.26.1744894398838;
        Thu, 17 Apr 2025 05:53:18 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf447914sm20097393f8f.97.2025.04.17.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:53:18 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 17 Apr 2025 14:54:41 +0200
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 05/13] clk: rp1: Add support for clocks provided by RP1
Message-ID: <aAD6EXrav161J0vS@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <370137263691f4fc14928e4b378b27f75bfd0826.1742418429.git.andrea.porta@suse.com>
 <23ac3d05-5fb7-4cd8-bb87-cf1f3eab521d@gmx.net>
 <Z__alTyVJOwu_1gR@apocalypse>
 <CAPY8ntD2W5xAHGCD+uBL-0QgyYNj6k9MExns=DFvxU1WGYtO5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntD2W5xAHGCD+uBL-0QgyYNj6k9MExns=DFvxU1WGYtO5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_055320_686565_8C558C63 
X-CRM114-Status: GOOD (  36.93  )
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

Hi Dave,

On 11:48 Thu 17 Apr     , Dave Stevenson wrote:
> Hi Andrea & Stefan.
> 
> On Wed, 16 Apr 2025 at 17:26, Andrea della Porta <andrea.porta@suse.com> wrote:
> >
> > Hi Stefan,
> >
> > On 14:09 Mon 14 Apr     , Stefan Wahren wrote:
> > > Hi Andrea,
> > >
> > > Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > > > RaspberryPi RP1 is an MFD providing, among other peripherals, several
> > > > clock generators and PLLs that drives the sub-peripherals.
> > > > Add the driver to support the clock providers.
> > > >
> > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > > ---
> > > >   MAINTAINERS           |    5 +
> > > >   drivers/clk/Kconfig   |    9 +
> > > >   drivers/clk/Makefile  |    1 +
> > > >   drivers/clk/clk-rp1.c | 1512 +++++++++++++++++++++++++++++++++++++++++
> > > >   4 files changed, 1527 insertions(+)
> > > >   create mode 100644 drivers/clk/clk-rp1.c
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 896a307fa065..75263700370d 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -19748,6 +19748,11 @@ S: Maintained
> > > >   F:        Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> > > >   F:        drivers/media/platform/raspberrypi/rp1-cfe/
> > > >
> > > > +RASPBERRY PI RP1 PCI DRIVER
> > > > +M: Andrea della Porta <andrea.porta@suse.com>
> > > > +S: Maintained
> > > > +F: drivers/clk/clk-rp1.c
> > > > +
> > > >   RC-CORE / LIRC FRAMEWORK
> > > >   M:        Sean Young <sean@mess.org>
> > > >   L:        linux-media@vger.kernel.org
> > > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > > index 713573b6c86c..cff90de71409 100644
> > > > --- a/drivers/clk/Kconfig
> > > > +++ b/drivers/clk/Kconfig
> > > > @@ -88,6 +88,15 @@ config COMMON_CLK_RK808
> > > >       These multi-function devices have two fixed-rate oscillators, clocked at 32KHz each.
> > > >       Clkout1 is always on, Clkout2 can off by control register.
> > > >
> > > > +config COMMON_CLK_RP1
> > > > +   tristate "Raspberry Pi RP1-based clock support"
> > > > +   depends on MISC_RP1 || COMPILE_TEST
> > > > +   default MISC_RP1
> > > > +   help
> > > > +     Enable common clock framework support for Raspberry Pi RP1.
> > > > +     This multi-function device has 3 main PLLs and several clock
> > > > +     generators to drive the internal sub-peripherals.
> > > > +
> > > >   config COMMON_CLK_HI655X
> > > >     tristate "Clock driver for Hi655x" if EXPERT
> > > >     depends on (MFD_HI655X_PMIC || COMPILE_TEST)
> > > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > > index bf4bd45adc3a..ff3993ed7e09 100644
> > > > --- a/drivers/clk/Makefile
> > > > +++ b/drivers/clk/Makefile
> > > > @@ -84,6 +84,7 @@ obj-$(CONFIG_CLK_LS1028A_PLLDIG)  += clk-plldig.o
> > > >   obj-$(CONFIG_COMMON_CLK_PWM)              += clk-pwm.o
> > > >   obj-$(CONFIG_CLK_QORIQ)                   += clk-qoriq.o
> > > >   obj-$(CONFIG_COMMON_CLK_RK808)            += clk-rk808.o
> > > > +obj-$(CONFIG_COMMON_CLK_RP1)            += clk-rp1.o
> > > >   obj-$(CONFIG_COMMON_CLK_HI655X)           += clk-hi655x.o
> > > >   obj-$(CONFIG_COMMON_CLK_S2MPS11)  += clk-s2mps11.o
> > > >   obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
> > > > diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
> > > > new file mode 100644
> > > > index 000000000000..72c74e344c1d
> > > > --- /dev/null
> > > > +++ b/drivers/clk/clk-rp1.c
> > > > @@ -0,0 +1,1512 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > ...
> > > > +
> > > > +static int rp1_pll_divider_set_rate(struct clk_hw *hw,
> > > > +                               unsigned long rate,
> > > > +                               unsigned long parent_rate)
> > > > +{
> > > > +   struct rp1_clk_desc *divider = container_of(hw, struct rp1_clk_desc, div.hw);
> > > > +   struct rp1_clockman *clockman = divider->clockman;
> > > > +   const struct rp1_pll_data *data = divider->data;
> > > > +   u32 div, sec;
> > > > +
> > > > +   div = DIV_ROUND_UP_ULL(parent_rate, rate);
> > > > +   div = clamp(div, 8u, 19u);
> > > > +
> > > > +   spin_lock(&clockman->regs_lock);
> > > > +   sec = clockman_read(clockman, data->ctrl_reg);
> > > > +   sec &= ~PLL_SEC_DIV_MASK;
> > > > +   sec |= FIELD_PREP(PLL_SEC_DIV_MASK, div);
> > > > +
> > > > +   /* Must keep the divider in reset to change the value. */
> > > > +   sec |= PLL_SEC_RST;
> > > > +   clockman_write(clockman, data->ctrl_reg, sec);
> > > > +
> > > > +   /* TODO: must sleep 10 pll vco cycles */
> > > Is it possible to implement this with some kind of xsleep or xdelay?
> >
> > I guess so... unless anyone knows a better method such as checking
> > for some undocumented register flag which reveals when the clock is stable
> > so it can be enabled (Phil, Dave, please feel free to step in with advice
> > if you have any), I think this line could solve the issue:
> >
> > ndelay (10 * div * NSEC_PER_SEC / parent_rate);
> 
> I've checked with those involved in the hardware side.
> There's no hardware flag that the clock is stable, so the ndelay is
> probably the best option. The VCO can go as low as 600MHz, so the max
> delay would be 166ns.

Perfect, I'll use ndelay then. However, shouldn't this be 16ns max?
I think this formula should give a good estimate:

10ULL * div * NSEC_PER_SEC / parent_rate

and has the advantage of not depending on hard coded values.

> 
> Thanks for your continuing work on this.

Thank you for checking.

Regards,
Andrea

> 
>   Dave
> 
> > Many thanks,
> > Andrea
> >
> > > > +   sec &= ~PLL_SEC_RST;
> > > > +   clockman_write(clockman, data->ctrl_reg, sec);
> > > > +   spin_unlock(&clockman->regs_lock);
> > > > +
> > > > +   return 0;
> > > > +}
> > > > +
> > > >

