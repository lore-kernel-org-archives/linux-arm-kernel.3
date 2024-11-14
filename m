Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC530D68B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 15:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NBFMQhIIT6ymbEv39KxcdDxNSIvYaJrZK6T6Q4vz58=; b=nSg8HukNx3/JtAVQ6eiKqXfNIn
	h1aoGeF8WbbgdqsuAzPZlVumNvft39nDlvXHv4mw4B5ho8jWvgI1X43XnsPJ3o4IAWr/kLrBYQ9Q/
	u2V1cPcWDEVaknIb1S+d+cYrfZKzcrgbRcV6ZbWAsm46dgM1s1HWirzljpIRJRKaMhqRnDsKnz0Jj
	yxn9cNQf/cWIH+wCGzyRnZdfEG5r0PoEmZc/5M0HNYJKA4ZVQQmabtkaID+akyP4119R7jhbz2KFb
	gktQWAckpZrnQOvPWclM+dimISVscUlLctbpQLkWUlllv3dYeh3t4Miywb4r9p1S5gawxJTTBgAUJ
	bEtg4aTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbzE-0000000058J-1W45;
	Thu, 14 Nov 2024 15:42:24 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbyG-000000004mO-2Br9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 15:41:25 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso7186441fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 07:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731598881; x=1732203681; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NBFMQhIIT6ymbEv39KxcdDxNSIvYaJrZK6T6Q4vz58=;
        b=JdSfsEZkpcsX6nS2Ls7madKO8qFG7ou2VbPmzq/m0J5FabPJmBRbkSb1OZa+Mo1tek
         3s+LULyCIxwlXthvgj8UDZTnMkgTKA61tJlqzqjT9cTtJkpxxpdOL6eduKJ2bN34j3Uk
         k2Yzav4PnQzszRHRmrY/M7agueAlZbPlg/Mt+2jVtcTmaaO6Ky7imG1DGlWj30ZCBR5Q
         fu9ivrpPPsv/UpRrHSZQ8SI50V/KCzai//IvBSIyR6rBuIpqJLtSNEGCuXnhc+UbNlp8
         ZXl4AjV9gLNfmrQ4nAs4eUksEW7e4YRMnToLIYIfl6t/GXZ1ZpGRS4/d9BRjEpMCyRpV
         LFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731598881; x=1732203681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NBFMQhIIT6ymbEv39KxcdDxNSIvYaJrZK6T6Q4vz58=;
        b=MRz4P2mQ6+df+h8NwhL2QPbMhjWVPDtmqfHu5/nAazfhjXpfG/DvXprpBflYjXvSUS
         RwMa5RdZKSspCxrBrS852cVfn0ECyDBuhWr0xhGDhFYBiRvdKnOVIkooRfK6Ant/dL5E
         o1S3sKFXdVvidmnLJTw1y19MXt1vqkZNOf0GybEEXYPfXlVJ8jc1PRiQ/Lr6hDKk4f9c
         6JVuM+fgF7Fmm2XD8HmuJDdDmV+gEZO2lz5vMsIiEMSn6jlVKcKXab8vi7Ia2YQcVfD4
         F/+n1L0tDyZk+BmWZQNEkyzumpm2pd0juJebymZt8xC9LWLHpdaIu9JdwLioUbGgQTJI
         Oa+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRIxy9z6pIgKLXTHwsVfmWYTRL/cVS/bM7M4qTT8ltxoHlyx25i8SSas6JjDmTEzKGFgyctr8BVJ5/Y7sDbR0E@lists.infradead.org
X-Gm-Message-State: AOJu0Yy21ohSlMtMIZVlwW/v7gjEHx7rh5F13gn7b+wtG+SzGBFsqV+B
	RkoU8i5/FNCqFpJVxtOyxTtUgnZdmd98TpHsFJY+eOdjy7YTOy9gdGQeeJMlPK0=
X-Google-Smtp-Source: AGHT+IE3AJId58tpidJfEutc3uS9bz9dQSqU2NqlB5syKnjI4F1dHTAie1yyXTx7nGeaNXqvKGaGyw==
X-Received: by 2002:a05:651c:2122:b0:2fa:de52:f03c with SMTP id 38308e7fff4ca-2ff2015249fmr130795541fa.5.1731598881346;
        Thu, 14 Nov 2024 07:41:21 -0800 (PST)
Received: from localhost (host-79-19-144-50.retail.telecomitalia.it. [79.19.144.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79bb3579sm679369a12.37.2024.11.14.07.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 07:41:20 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 14 Nov 2024 16:41:49 +0100
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	St efan Wahren <wahrenst@gmx.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/14] clk: rp1: Add support for clocks provided by RP1
Message-ID: <ZzYaPZcohzMma84A@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <022cf4920f8147cc720eaf02fd52c0fa56f565c5.1728300189.git.andrea.porta@suse.com>
 <611de50b5f083ea4c260f920ccc0e300.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <611de50b5f083ea4c260f920ccc0e300.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_074124_612878_9DDC1449 
X-CRM114-Status: GOOD (  24.84  )
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

Hi Stephen,

On 15:08 Wed 09 Oct     , Stephen Boyd wrote:
> Quoting Andrea della Porta (2024-10-07 05:39:51)
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index 299bc678ed1b..537019987f0c 100644

Here's below the kind response from RaspberryPi guys...
...

> > +       clockman_write(clockman, data->pwr_reg, fbdiv_frac ? 0 : PLL_PWR_DSMPD);
> > +       clockman_write(clockman, data->fbdiv_int_reg, fbdiv_int);
> > +       clockman_write(clockman, data->fbdiv_frac_reg, fbdiv_frac);
> > +       spin_unlock(&clockman->regs_lock);
> > +
> > +       /* Check that reference frequency is no greater than VCO / 16. */
> 
> Why is '16' special?

16 is a hardware requirement.
The lowest feedback divisor in the PLL is 16, so the minimum output
frequency is ref_freq * 16.

...

> > +static unsigned long rp1_pll_core_recalc_rate(struct clk_hw *hw,
> > +                                             unsigned long parent_rate)
> > +{
> > +       struct rp1_pll_core *pll_core = container_of(hw, struct rp1_pll_core, hw);
> > +       struct rp1_clockman *clockman = pll_core->clockman;
> > +       const struct rp1_pll_core_data *data = pll_core->data;
> > +       u32 fbdiv_int, fbdiv_frac;
> > +       unsigned long calc_rate;
> > +
> > +       fbdiv_int = clockman_read(clockman, data->fbdiv_int_reg);
> > +       fbdiv_frac = clockman_read(clockman, data->fbdiv_frac_reg);
> > +       calc_rate =
> > +               ((u64)parent_rate * (((u64)fbdiv_int << 24) + fbdiv_frac) + (1 << 23)) >> 24;
> 
> Where does '24' come from? Can you simplify this line somehow? Maybe
> break it up into multiple lines?

The dividers have an 8 bit integer and (optional) 24 bit fractional
part to the divider value.
The two parts are split across two registers (int_reg and frac_reg),
with the value stored in the bottom bits of both.

...

> > +static int rp1_clock_determine_rate(struct clk_hw *hw,
> > +                                   struct clk_rate_request *req)
> > +{
> > +       struct clk_hw *parent, *best_parent = NULL;
> > +       unsigned long best_rate = 0;
> > +       unsigned long best_prate = 0;
> > +       unsigned long best_rate_diff = ULONG_MAX;
> > +       unsigned long prate, calc_rate;
> > +       size_t i;
> > +
> > +       /*
> > +        * If the NO_REPARENT flag is set, try to use existing parent.
> > +        */
> > +       if ((clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT)) {
> 
> Is this flag ever set?

In future patches more clocks will be added (namely DPI, DSI (x2) and VEC).
All have the CLK_SET_RATE_NO_REPARENT flag set.
As those peripherals are sensitive to the accuracy of the clocks, the intent
is that the driver will have set the parent, and it isn't expected to change.

...

> > +       divider->div.reg = clockman->regs + divider_data->ctrl_reg;
> > +       divider->div.shift = PLL_SEC_DIV_SHIFT;
> > +       divider->div.width = PLL_SEC_DIV_WIDTH;
> > +       divider->div.flags = CLK_DIVIDER_ROUND_CLOSEST;
> > +       divider->div.flags |= CLK_IS_CRITICAL;
> 
> Is everything critical? The usage of this flag and CLK_IGNORE_UNUSED is
> suspicious and likely working around some problems elsewhere.

the next patchset revision will drop as many of those CRITICAL flags as possible,
and all of the IGNORE_UNUSED flags. That was legacy code needed on bcm-clk2835
since some clocks were enabled by the firmware, and therefore disabling them
had the potential for locking the firmware up. This does no longer apply to RP1.

...

Many thanks,
Andrea

