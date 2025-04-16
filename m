Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E73C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FlZ3978PiTGhVSgh9hGMx7P3nOMDWWhOsbZtxjmYRo=; b=bcS0QTq17n+ym5sNfD3iyRPCdb
	mqg0caVOg9GY9NWFuwPbTOasZroG1+VXbBWYTEsN5hR727pdLEQS4WRjpX0YMGbbksnyW7CTxUQGI
	LGHCCgg3EtuBntloGd0n2VMEZu3YIkP13UsAjQfNz/dt/kHLgW5/VZPJcZP3Hf4r3m/p1X7nefSje
	E/xiUymTx10EBQ7a1OWmu/QU3Y02RR/sFDd1pnd9alYJEP9TpYXSNymAzIpdEDTwmWmi8L7qKFDu4
	zIXKq5QWktatIrlQZxb4dnvVI7gjXMZvVZu0dUdTUAnT/DHwEjbcmjFV0RU+i+VH+SH+l7PkTB2vU
	/uE7jrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56AR-0000000AM2h-20qo;
	Wed, 16 Apr 2025 17:03:19 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55b2-0000000AFJj-2HBq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:26:45 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac345bd8e13so1200335266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744820802; x=1745425602; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9FlZ3978PiTGhVSgh9hGMx7P3nOMDWWhOsbZtxjmYRo=;
        b=AvENf11EphijnkgKA+d02xc4FPLbayVBYoCCIo+s5LYic926NmILOFAR25GQry6xfl
         WowBkOAXTol4KGzjMnIsMAB898icYiwobL4ZD1ms7+AsiqESUFgW0Uj6T9msnXXHHJ9m
         EpVa0tPnESdy2rCkyalEWoJkiVWL1+aCgd5j6aC+g1AZJP5nrWvQ9TsU8neLMhwVE3au
         i68zM4RSAcJRlPl1mqbOZ8VbDn8Db2U3SFzxg1Z7CRM1WzjawC/ei7EBZ0NKCmlWkhkA
         EEBoyNu6RJNK19/CLi/nknJhAoLh7Zg6JYkWfyrpbIEAbIWn8q7xP/wwsieZwdITcLx5
         H/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744820802; x=1745425602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FlZ3978PiTGhVSgh9hGMx7P3nOMDWWhOsbZtxjmYRo=;
        b=uRhIgM/jXy4HZN01PcIsWflzN/L9ZwAGmZTmVkoGBjSrF/CE1U6tlhVWxrgShgVUHs
         e4YFVPEeeAU4h20kqHHee8v2DXHPsOSfJf1b1TvOCpJEfPbdodMBid3PqadXjzs7pLKP
         mPmuXPdZUFTv0idcZ8h+vIXL1/VV7n7YSX2JwUVJR2UnC5JO0rqZY1GrC+FH0CzsN2d6
         CxGSBIPQFL/EQGeAZ7w507c1G3jsGq4eP24am1IKvdnw+khKxBWZa8bXJhDscxvcnlOu
         NKXOqxToMwthM2PjpELm9+w2RGDPCJL3vexN+oL5BnRocjTh6OVAW6PqE1hWNKMGTgRI
         nt4g==
X-Forwarded-Encrypted: i=1; AJvYcCVU9mZxfTeXXqYMRjHQ8jJCMIXZUGqgXHLR+W1hIc2+DyW77XlRvAta32W1zswQqQEo2bA4/ESIORCB1CSj+H/N@lists.infradead.org
X-Gm-Message-State: AOJu0YyFZM9HLT5UTZgF2xRYn9ilnZkzvus475FhD6WcH3UXc+JHyAWP
	BrCzUl0bo7nzl1bW+9sOC1fjfis13OYoH6S5uy8Y1WuVWW79BSkIZ23xA6Wz4fk=
X-Gm-Gg: ASbGncvFsouaJbM//uois/E32Vz13XBIrFZ3jKR/k+E156n8WxeanCx0klh46xLSc6a
	vlXahcN/w4Odm1S7suTrneF2EIOIxe0fDtroUZde8fjP6Zi6q/CuP0ei2sYsJ+fgWX8ub3yv4au
	nXpsGdk84VsUtw+pC9bwvrXwySxVsuV/niiBIhM4BToebi1WvvzvmoZBQY6fW7Go/m/hTP6wk1W
	SqpdLj8SpzbBQgG0EvcDqAVSCzxswLauS9Jp/gYH4Isnk+AhTC46DeU64BD4yBG+dADA68szF0P
	XbDNMKTrUU1gkzJgQvf0qlVJ/VgxJlxbV5XkHJSAQ5Lv0rv27ziRjTC0pNBk3nK4babPsKPhgiM
	xZXd/7Q==
X-Google-Smtp-Source: AGHT+IHS1EQoXBYosStv1ftcoY5+W8c3n7WjQIALsG6rcu4q9LYmbRt8Y9GVkdutMbrKBeFufo1cQw==
X-Received: by 2002:a17:907:2d9e:b0:aca:c441:e861 with SMTP id a640c23a62f3a-acb42890585mr270946866b.7.1744820802220;
        Wed, 16 Apr 2025 09:26:42 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d1ccd75sm155050366b.142.2025.04.16.09.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:26:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 16 Apr 2025 18:28:05 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
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
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 05/13] clk: rp1: Add support for clocks provided by RP1
Message-ID: <Z__alTyVJOwu_1gR@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <370137263691f4fc14928e4b378b27f75bfd0826.1742418429.git.andrea.porta@suse.com>
 <23ac3d05-5fb7-4cd8-bb87-cf1f3eab521d@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23ac3d05-5fb7-4cd8-bb87-cf1f3eab521d@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_092644_581369_17E4B740 
X-CRM114-Status: GOOD (  29.79  )
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

Hi Stefan,

On 14:09 Mon 14 Apr     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > RaspberryPi RP1 is an MFD providing, among other peripherals, several
> > clock generators and PLLs that drives the sub-peripherals.
> > Add the driver to support the clock providers.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >   MAINTAINERS           |    5 +
> >   drivers/clk/Kconfig   |    9 +
> >   drivers/clk/Makefile  |    1 +
> >   drivers/clk/clk-rp1.c | 1512 +++++++++++++++++++++++++++++++++++++++++
> >   4 files changed, 1527 insertions(+)
> >   create mode 100644 drivers/clk/clk-rp1.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 896a307fa065..75263700370d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19748,6 +19748,11 @@ S:	Maintained
> >   F:	Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> >   F:	drivers/media/platform/raspberrypi/rp1-cfe/
> > 
> > +RASPBERRY PI RP1 PCI DRIVER
> > +M:	Andrea della Porta <andrea.porta@suse.com>
> > +S:	Maintained
> > +F:	drivers/clk/clk-rp1.c
> > +
> >   RC-CORE / LIRC FRAMEWORK
> >   M:	Sean Young <sean@mess.org>
> >   L:	linux-media@vger.kernel.org
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index 713573b6c86c..cff90de71409 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -88,6 +88,15 @@ config COMMON_CLK_RK808
> >   	  These multi-function devices have two fixed-rate oscillators, clocked at 32KHz each.
> >   	  Clkout1 is always on, Clkout2 can off by control register.
> > 
> > +config COMMON_CLK_RP1
> > +	tristate "Raspberry Pi RP1-based clock support"
> > +	depends on MISC_RP1 || COMPILE_TEST
> > +	default MISC_RP1
> > +	help
> > +	  Enable common clock framework support for Raspberry Pi RP1.
> > +	  This multi-function device has 3 main PLLs and several clock
> > +	  generators to drive the internal sub-peripherals.
> > +
> >   config COMMON_CLK_HI655X
> >   	tristate "Clock driver for Hi655x" if EXPERT
> >   	depends on (MFD_HI655X_PMIC || COMPILE_TEST)
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index bf4bd45adc3a..ff3993ed7e09 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -84,6 +84,7 @@ obj-$(CONFIG_CLK_LS1028A_PLLDIG)	+= clk-plldig.o
> >   obj-$(CONFIG_COMMON_CLK_PWM)		+= clk-pwm.o
> >   obj-$(CONFIG_CLK_QORIQ)			+= clk-qoriq.o
> >   obj-$(CONFIG_COMMON_CLK_RK808)		+= clk-rk808.o
> > +obj-$(CONFIG_COMMON_CLK_RP1)            += clk-rp1.o
> >   obj-$(CONFIG_COMMON_CLK_HI655X)		+= clk-hi655x.o
> >   obj-$(CONFIG_COMMON_CLK_S2MPS11)	+= clk-s2mps11.o
> >   obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
> > diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
> > new file mode 100644
> > index 000000000000..72c74e344c1d
> > --- /dev/null
> > +++ b/drivers/clk/clk-rp1.c
> > @@ -0,0 +1,1512 @@
> > +// SPDX-License-Identifier: GPL-2.0
> ...
> > +
> > +static int rp1_pll_divider_set_rate(struct clk_hw *hw,
> > +				    unsigned long rate,
> > +				    unsigned long parent_rate)
> > +{
> > +	struct rp1_clk_desc *divider = container_of(hw, struct rp1_clk_desc, div.hw);
> > +	struct rp1_clockman *clockman = divider->clockman;
> > +	const struct rp1_pll_data *data = divider->data;
> > +	u32 div, sec;
> > +
> > +	div = DIV_ROUND_UP_ULL(parent_rate, rate);
> > +	div = clamp(div, 8u, 19u);
> > +
> > +	spin_lock(&clockman->regs_lock);
> > +	sec = clockman_read(clockman, data->ctrl_reg);
> > +	sec &= ~PLL_SEC_DIV_MASK;
> > +	sec |= FIELD_PREP(PLL_SEC_DIV_MASK, div);
> > +
> > +	/* Must keep the divider in reset to change the value. */
> > +	sec |= PLL_SEC_RST;
> > +	clockman_write(clockman, data->ctrl_reg, sec);
> > +
> > +	/* TODO: must sleep 10 pll vco cycles */
> Is it possible to implement this with some kind of xsleep or xdelay?

I guess so... unless anyone knows a better method such as checking
for some undocumented register flag which reveals when the clock is stable
so it can be enabled (Phil, Dave, please feel free to step in with advice
if you have any), I think this line could solve the issue:

ndelay (10 * div * NSEC_PER_SEC / parent_rate);

Many thanks,
Andrea

> > +	sec &= ~PLL_SEC_RST;
> > +	clockman_write(clockman, data->ctrl_reg, sec);
> > +	spin_unlock(&clockman->regs_lock);
> > +
> > +	return 0;
> > +}
> > +
> > 

