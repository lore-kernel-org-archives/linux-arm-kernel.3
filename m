Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CC2C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWFVgupzA3WcXLT+BN9IkoTUzlpVNJIm/ZYe94t2FFM=; b=iit2dqEx1zxizLTG+MGcNGEYmq
	2QJcu7euliL9opF4wwGACMlJTAj4E0OLkdjhUZ+XfEGPweWD5/34WcQTYrbcuyuPA/G6eGCGFBdaA
	/frZq4o+7PkpGIDzWMqnpNjMfNSewtFAMnDYF4yPNpIgf/Gf8mhH1Zi/SieKTmhjvAJqW9KsQMhLh
	gMoYJdQELE61mJgxTMXq8xXZKgGwmiZp3vsmf1Q2EQ0zjUCDPLZpigxt2Clj3cSygTvN5Uxn3fsyT
	p+yQEe3l42fk2hndBzKmv05CeQaqV12pvgt9GrtFYGoLVaEUgvDIYfcriwQLRzsukOBZZyOarVUJT
	K/rZVsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Th3-0000000Dybc-2EzU;
	Thu, 17 Apr 2025 18:10:33 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TJi-0000000DuIJ-31P7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 17:46:28 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-7053f85f059so9249377b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 10:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1744911985; x=1745516785; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fWFVgupzA3WcXLT+BN9IkoTUzlpVNJIm/ZYe94t2FFM=;
        b=bdSPzDrxCgJBJwF82SrTv437hEvz3hsrjyGV+WQuSjXL7jJl+zWmBZel15wcIG+9N2
         uxJNyT6H7ySf7cLvRAoeh7gwgNNitaQpk0otg4K81WNhYx9K+KT+IWZTIhL6L8GtMqFc
         eLYq8dz+VyRt+P1ZNzUr3bzTWzItyFrZC5G8vCweeR9CXlgMrRgABaQmbqdu4+/AKwDd
         dHfNAO1ys5OK7hTNgHRfPm/pa86bT8HIcJEMebfyG1BC1J9F7Z+u4QPuKY8Vm7yeiUCb
         9WJCXTf2LSPoO0PtUfP/6qZYz2V/eS92w33rxcpjXmjcBGiE6muxXFsRPC9W4ggU/L5Q
         tUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744911985; x=1745516785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWFVgupzA3WcXLT+BN9IkoTUzlpVNJIm/ZYe94t2FFM=;
        b=t8HqUQpqLBQKb9vNV/451b5aaDyzQjh0SZDHspFODFXEiFcolpCcTOVTiEfnkgAb1R
         pJ3Ypgs0Q0lOwAeyph4uJcRgLQXvzmp0hrTY8vs1RtxZyrWQ57SshfHprA8qycr3sbi2
         LzOWJf2kw2spnk1MI8R/Ny3pK2kcWgexuyZ0DXnRBt15vvEJ8mRB73oG4MixkExLcNBE
         bTJKvEqmjwRBlBE0lwkf+wSOC1p057amuFK9nhgzaYbPh/ITQAPZUvKW/Cuekx+yQ+Kt
         wGsJMPV7f9mTBKFVwFpPCMGkrKXuyouooBkpJkISPBOqrf6Kw7w18D/6UwZqa1NE5PJS
         ZyqA==
X-Forwarded-Encrypted: i=1; AJvYcCV3CYN4o8djbSNmb6rIwBTENorSCMswxSuXCDPoG6Du7rcs84cngBq3c5rqgw+oBzVoXauRsn011gou/aD/kcQh@lists.infradead.org
X-Gm-Message-State: AOJu0YyYoPirKgHy0LOFeR5cQy/F36OdJXNZIUweaDGEidfjybhPwnT2
	482tXaEKfrphws5W9HUDC7PH2bN7kupAf6qh7cqiCJngfl3CS1zOvVrdC84+taJ17tBWKwxECob
	E+oqC+UCfgul3c+8zBBVT6OmutJSszNkdd1SwoA==
X-Gm-Gg: ASbGncv+6iAW5XK7DNLLh+rmlM6OgyafGeEqZzZBVu9nPWPvbLiwdobEFP/sA4ovnpO
	AOnFYgSeBun7bsjHP8QbEF1Gkhtej9/qecJxwgoQ5mtMLKvDWLXM4RUbSg+2f3SvJsBF7kgawVp
	JrXfGNHhO29UbFHhj6dSzAQfLQOQOTPVCYbd0X0y6Rw4x0sTd2E+YHuw==
X-Google-Smtp-Source: AGHT+IFyC6HYs9e80CmN73xlBJt/HpImaly70LEZmj35WGtDtklY8rBjCjjco5A8WQ2lGInHkA6lzygUfa3Emej99Gg=
X-Received: by 2002:a05:690c:3506:b0:6fe:c040:8eda with SMTP id
 00721157ae682-706b325d56amr97201527b3.4.1744911985301; Thu, 17 Apr 2025
 10:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1742418429.git.andrea.porta@suse.com> <370137263691f4fc14928e4b378b27f75bfd0826.1742418429.git.andrea.porta@suse.com>
 <23ac3d05-5fb7-4cd8-bb87-cf1f3eab521d@gmx.net> <Z__alTyVJOwu_1gR@apocalypse>
 <CAPY8ntD2W5xAHGCD+uBL-0QgyYNj6k9MExns=DFvxU1WGYtO5g@mail.gmail.com> <aAD6EXrav161J0vS@apocalypse>
In-Reply-To: <aAD6EXrav161J0vS@apocalypse>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 17 Apr 2025 18:46:02 +0100
X-Gm-Features: ATxdqUHcDbWr8xBnLCzFc0eo6fLOV6JX6u0K_scOh1zjVezR0S_9IzHQVsjXicM
Message-ID: <CAPY8ntBMJUONss_0nCYRPNJ1vTMWMu0Ga3w-r_1jboM+aShH7w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250417_104626_936734_411B2496 
X-CRM114-Status: GOOD (  42.51  )
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

On Thu, 17 Apr 2025 at 13:53, Andrea della Porta <andrea.porta@suse.com> wrote:
>
> Hi Dave,
>
> On 11:48 Thu 17 Apr     , Dave Stevenson wrote:
> > Hi Andrea & Stefan.
> >
> > On Wed, 16 Apr 2025 at 17:26, Andrea della Porta <andrea.porta@suse.com> wrote:
> > >
> > > Hi Stefan,
> > >
> > > On 14:09 Mon 14 Apr     , Stefan Wahren wrote:
> > > > Hi Andrea,
> > > >
> > > > Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > > > > RaspberryPi RP1 is an MFD providing, among other peripherals, several
> > > > > clock generators and PLLs that drives the sub-peripherals.
> > > > > Add the driver to support the clock providers.
> > > > >
> > > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > > > ---
> > > > >   MAINTAINERS           |    5 +
> > > > >   drivers/clk/Kconfig   |    9 +
> > > > >   drivers/clk/Makefile  |    1 +
> > > > >   drivers/clk/clk-rp1.c | 1512 +++++++++++++++++++++++++++++++++++++++++
> > > > >   4 files changed, 1527 insertions(+)
> > > > >   create mode 100644 drivers/clk/clk-rp1.c
> > > > >
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index 896a307fa065..75263700370d 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -19748,6 +19748,11 @@ S: Maintained
> > > > >   F:        Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> > > > >   F:        drivers/media/platform/raspberrypi/rp1-cfe/
> > > > >
> > > > > +RASPBERRY PI RP1 PCI DRIVER
> > > > > +M: Andrea della Porta <andrea.porta@suse.com>
> > > > > +S: Maintained
> > > > > +F: drivers/clk/clk-rp1.c
> > > > > +
> > > > >   RC-CORE / LIRC FRAMEWORK
> > > > >   M:        Sean Young <sean@mess.org>
> > > > >   L:        linux-media@vger.kernel.org
> > > > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > > > index 713573b6c86c..cff90de71409 100644
> > > > > --- a/drivers/clk/Kconfig
> > > > > +++ b/drivers/clk/Kconfig
> > > > > @@ -88,6 +88,15 @@ config COMMON_CLK_RK808
> > > > >       These multi-function devices have two fixed-rate oscillators, clocked at 32KHz each.
> > > > >       Clkout1 is always on, Clkout2 can off by control register.
> > > > >
> > > > > +config COMMON_CLK_RP1
> > > > > +   tristate "Raspberry Pi RP1-based clock support"
> > > > > +   depends on MISC_RP1 || COMPILE_TEST
> > > > > +   default MISC_RP1
> > > > > +   help
> > > > > +     Enable common clock framework support for Raspberry Pi RP1.
> > > > > +     This multi-function device has 3 main PLLs and several clock
> > > > > +     generators to drive the internal sub-peripherals.
> > > > > +
> > > > >   config COMMON_CLK_HI655X
> > > > >     tristate "Clock driver for Hi655x" if EXPERT
> > > > >     depends on (MFD_HI655X_PMIC || COMPILE_TEST)
> > > > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > > > index bf4bd45adc3a..ff3993ed7e09 100644
> > > > > --- a/drivers/clk/Makefile
> > > > > +++ b/drivers/clk/Makefile
> > > > > @@ -84,6 +84,7 @@ obj-$(CONFIG_CLK_LS1028A_PLLDIG)  += clk-plldig.o
> > > > >   obj-$(CONFIG_COMMON_CLK_PWM)              += clk-pwm.o
> > > > >   obj-$(CONFIG_CLK_QORIQ)                   += clk-qoriq.o
> > > > >   obj-$(CONFIG_COMMON_CLK_RK808)            += clk-rk808.o
> > > > > +obj-$(CONFIG_COMMON_CLK_RP1)            += clk-rp1.o
> > > > >   obj-$(CONFIG_COMMON_CLK_HI655X)           += clk-hi655x.o
> > > > >   obj-$(CONFIG_COMMON_CLK_S2MPS11)  += clk-s2mps11.o
> > > > >   obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
> > > > > diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
> > > > > new file mode 100644
> > > > > index 000000000000..72c74e344c1d
> > > > > --- /dev/null
> > > > > +++ b/drivers/clk/clk-rp1.c
> > > > > @@ -0,0 +1,1512 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > ...
> > > > > +
> > > > > +static int rp1_pll_divider_set_rate(struct clk_hw *hw,
> > > > > +                               unsigned long rate,
> > > > > +                               unsigned long parent_rate)
> > > > > +{
> > > > > +   struct rp1_clk_desc *divider = container_of(hw, struct rp1_clk_desc, div.hw);
> > > > > +   struct rp1_clockman *clockman = divider->clockman;
> > > > > +   const struct rp1_pll_data *data = divider->data;
> > > > > +   u32 div, sec;
> > > > > +
> > > > > +   div = DIV_ROUND_UP_ULL(parent_rate, rate);
> > > > > +   div = clamp(div, 8u, 19u);
> > > > > +
> > > > > +   spin_lock(&clockman->regs_lock);
> > > > > +   sec = clockman_read(clockman, data->ctrl_reg);
> > > > > +   sec &= ~PLL_SEC_DIV_MASK;
> > > > > +   sec |= FIELD_PREP(PLL_SEC_DIV_MASK, div);
> > > > > +
> > > > > +   /* Must keep the divider in reset to change the value. */
> > > > > +   sec |= PLL_SEC_RST;
> > > > > +   clockman_write(clockman, data->ctrl_reg, sec);
> > > > > +
> > > > > +   /* TODO: must sleep 10 pll vco cycles */
> > > > Is it possible to implement this with some kind of xsleep or xdelay?
> > >
> > > I guess so... unless anyone knows a better method such as checking
> > > for some undocumented register flag which reveals when the clock is stable
> > > so it can be enabled (Phil, Dave, please feel free to step in with advice
> > > if you have any), I think this line could solve the issue:
> > >
> > > ndelay (10 * div * NSEC_PER_SEC / parent_rate);
> >
> > I've checked with those involved in the hardware side.
> > There's no hardware flag that the clock is stable, so the ndelay is
> > probably the best option. The VCO can go as low as 600MHz, so the max
> > delay would be 166ns.
>
> Perfect, I'll use ndelay then. However, shouldn't this be 16ns max?
> I think this formula should give a good estimate:
>
> 10ULL * div * NSEC_PER_SEC / parent_rate
>
> and has the advantage of not depending on hard coded values.

I'd copied the number my colleague had given :-) He's now left for the
Easter weekend, but I can hassle him again on Tuesday.

I was expecting a computation rather than hard coded value, but was
giving the maximum as significant delays aren't very friendly.
The fact that we haven't noticed any issues with no delay at all
implies to me that this delay may only be a level of polishing rather
than anything critical. Although there is also the possibility that
they haven't been reconfigured on a regular basis either.

  Dave

> >
> > Thanks for your continuing work on this.
>
> Thank you for checking.
>
> Regards,
> Andrea
>
> >
> >   Dave
> >
> > > Many thanks,
> > > Andrea
> > >
> > > > > +   sec &= ~PLL_SEC_RST;
> > > > > +   clockman_write(clockman, data->ctrl_reg, sec);
> > > > > +   spin_unlock(&clockman->regs_lock);
> > > > > +
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > >

