Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A544EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPZerQPnM8TdIpEWmUTlPs508hpImW7bIHM5wPNO+wc=; b=Y9nHBnuNdwngRM92eQ7OTSpbOD
	SyNE00wHXKmMgYVqmbG6vZ8TcsIjJolDkaOiDeW/LNMliIIYj3dO73W6hy+vzq62ja3NyOrLWtQai
	HXGutDLJDs+bPpLbfgefprEds/NN1Xh4qZq0cqJEsg6/FRXhl1yEo0NAiiY4pp/8avu2/ab6F7kew
	lK+gJ86kQLXtBtierAD0cNmlNBi+Mtv67RbeRLXIrchcPJ6R0WCstI5Gse+3R9p3Bv/BVvwWHDWJm
	I6QkT0JFRD8FthDvUXwGn6pmmpEEQDUSRIrKEGzUGySTxapftdtr38swiaUOin1oYqWxma2Gr4gvT
	qFMn3Lyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAFz-00000002703-2GSV;
	Thu, 20 Feb 2025 17:22:39 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlADI-000000026C2-40wh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 17:19:54 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e0373c7f55so1825372a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 09:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740071991; x=1740676791; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MPZerQPnM8TdIpEWmUTlPs508hpImW7bIHM5wPNO+wc=;
        b=VZJfVFdobRG83adxCF73T14X0Ux3QzqzgnY1P7HBwk2IQY0BRwJoHViyjL+eeAqneg
         HWU2AYeEIgM8HP5ao9HawIvP1bx9odYmWuYHvWZv6xgQrbuEAHDsrJnroEAI6KYkhlIT
         gtfy0wbO4yXJtcDCR/MpsrOlAZFkk/ChZBHSk9T4KDunO8VS7r72EHM/6a0KKi3EqvNO
         p2a85WvBzVAm+VOrl5nCzLOBWheC2O3981z4WVygQ+zMpwcf/Ii+lDhfsGq1As52EIGT
         1DPwsfzbqyrO1xC8WHDljMYhFUDl18ddtlpBXptoI8ELY8orXauCzslm3WqExyq5ICsL
         by/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740071991; x=1740676791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPZerQPnM8TdIpEWmUTlPs508hpImW7bIHM5wPNO+wc=;
        b=j3HjGWn7dtaHroJd5w2txxPp1T2bkX7Iw1WFEWF/9b5gqhSo2thBUOF067WZaL5X94
         2FGq08Sgas439TJq7uTM9oKjWsHQHb9nvlRBwLjmU7iYxDtfxj7IjF2LY3n5kRxHOyEv
         yzPRajsYTFATj+p1C6X7d+zx+kUlAQmginX/kZnCXfdEUm3oJ3Ph8Aa3UJ7DCWwdekfK
         STGzRD4HPCfijcru2pwv9UZgFzENngoOu1bMrxwhD7dUNwxysn4Hq0ekHnrYBBf9oGbW
         484CmxWLFmfNObUvCM2XuNYFgxmJ+VOsU4WzN2e53AGdcVhFRVLBNczUBQhAU0VpnI2Y
         82bw==
X-Forwarded-Encrypted: i=1; AJvYcCWpvITcmj7QvZgZqW+A8XEHa5x8Xj/Q1K+YFKBoo+/wnAzyQNQaJk0kOSnsMb1WQt7jtyf69AM3/fChd5rmgU5/@lists.infradead.org
X-Gm-Message-State: AOJu0YxuVLJLmfFxWdoNgKteRUKQSZ0Ody0yrNcenvyz0gOc4a1EHBYh
	Mfyq/bOFuQTleyrmSVpMFkqljPcPOSmyUZzybZfDd1DJ4JcUmeqLcimOXm71DPo=
X-Gm-Gg: ASbGnctjRxNBVkuToxwgn/RD54HNkeS+FCcF+ev1owyy3M0uxuIXans9FOvZP1ZEwVC
	NGEuw07NAt18o4HJjc/3U5uyhrUJIRIy7jOim2AegtUs1lnPUVNbsdzIZwUPhYRjR13XBLZ0JUY
	eqvISQd6aOC3o0iKLaj2NROxRabhJd8vodQxW+h7KXkAruWzjabRwcfncv03CeK7wEzxboW28eO
	EZcAq+JyyF2cA10sq4DUofKl85+xEWlRdLD/wU/kMM07FOMYTKAq6JQIVgSmxYlL/qeYGweLFDB
	W7Kd2dgV4GQwsULcNna6tcJxjUc5t9x620GVSgwhuwUrLQTLH93wYAa7cBg=
X-Google-Smtp-Source: AGHT+IHWDM5v5Bb9ov4BBEUlzQ3ZQRxMJhj7b+2LTELKPttlDQENJhZRr+MIBUS3293eAO/wNa8PsA==
X-Received: by 2002:a17:907:6095:b0:ab7:bac4:b321 with SMTP id a640c23a62f3a-abc09aacbb4mr14530366b.29.1740071990587;
        Thu, 20 Feb 2025 09:19:50 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb3d276290sm1176404866b.178.2025.02.20.09.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 09:19:50 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 20 Feb 2025 18:20:54 +0100
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
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 05/11] clk: rp1: Add support for clocks provided by RP1
Message-ID: <Z7dkdu4J7uvug7wP@apocalypse>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <4da2f1106ea6b239eba9c117bf6c129fbdb3ee87.1738963156.git.andrea.porta@suse.com>
 <0ef80d00-7213-47c8-9876-1d32011d8d3d@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ef80d00-7213-47c8-9876-1d32011d8d3d@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_091952_998509_1754346F 
X-CRM114-Status: GOOD (  32.20  )
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

On 15:58 Sat 08 Feb     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 07.02.25 um 22:31 schrieb Andrea della Porta:
> > RaspberryPi RP1 is an MFD providing, among other peripherals, several
> > clock generators and PLLs that drives the sub-peripherals.
> > Add the driver to support the clock providers.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

...

> > +
> > +#define MAX_CLK_PARENTS			16
> > +
> > +/*
> > + * Secondary PLL channel output divider table.
> > + * Divider values range from 8 to 19.
> > + * Invalid values default to 19
> Maybe it's worth to add a short define for this invalid value?

Ack.

> > + */
> > +static const struct clk_div_table pll_sec_div_table[] = {
> > +	{ 0x00, 19 },
> > +	{ 0x01, 19 },
> > +	{ 0x02, 19 },
> > +

...

> > +	regmap_read(clockman->regmap, reg, &val);
> > +
> > +	return val;
> > +}
> > +
> > +static int rp1_pll_core_is_on(struct clk_hw *hw)
> > +{
> > +	struct rp1_clk_desc *pll_core = container_of(hw, struct rp1_clk_desc, hw);
> > +	struct rp1_clockman *clockman = pll_core->clockman;
> > +	const struct rp1_pll_core_data *data = pll_core->data;
> > +
> Please drop this empty line

Ack.

> > +	u32 pwr = clockman_read(clockman, data->pwr_reg);
> > +
> > +	return (pwr & PLL_PWR_PD) || (pwr & PLL_PWR_POSTDIVPD);
> > +}
> > +
> > +static int rp1_pll_core_on(struct clk_hw *hw)
> > +{
> > +	struct rp1_clk_desc *pll_core = container_of(hw, struct rp1_clk_desc, hw);
> > +	struct rp1_clockman *clockman = pll_core->clockman;
> > +	const struct rp1_pll_core_data *data = pll_core->data;
> > +
> ditto

Ack.

> > +	u32 fbdiv_frac, val;
> > +	int ret;
> > +
> > +	spin_lock(&clockman->regs_lock);

...

> > +static int rp1_pll_ph_on(struct clk_hw *hw)
> > +{
> > +	struct rp1_clk_desc *pll_ph = container_of(hw, struct rp1_clk_desc, hw);
> > +	struct rp1_clockman *clockman = pll_ph->clockman;
> > +	const struct rp1_pll_ph_data *data = pll_ph->data;
> > +	u32 ph_reg;
> > +
> > +	/* TODO: ensure pri/sec is enabled! */
> Please extend this TODO. Primary/secondary of what

I think the orginal comment is misleading. It seems to be related
to the fact that phase shifted clocks should have their parent enabled
before setting them up. Pri here shuold be the only phased clock, while
Sec is not and depends directly on a core clock, so I'll change that
comment entirely.

> > +	spin_lock(&clockman->regs_lock);
> > +	ph_reg = clockman_read(clockman, data->ph_reg);
> > +	ph_reg |= data->phase << PLL_PH_PHASE_SHIFT;
> > +	ph_reg |= PLL_PH_EN;
> > +	clockman_write(clockman, data->ph_reg, ph_reg);
> > +	spin_unlock(&clockman->regs_lock);
> > +
> > +	return 0;
> > +}

...

> > +static unsigned long rp1_clock_recalc_rate(struct clk_hw *hw,
> > +					   unsigned long parent_rate)
> > +{
> > +	struct rp1_clk_desc *clock = container_of(hw, struct rp1_clk_desc, hw);
> > +	struct rp1_clockman *clockman = clock->clockman;
> > +	const struct rp1_clock_data *data = clock->data;
> > +	u64 calc_rate;
> > +	u64 div;
> > +
> Please drop empty line

Ack.

> > +	u32 frac;
> > +
> > +	div = clockman_read(clockman, data->div_int_reg);
> > +	frac = (data->div_frac_reg != 0) ?
> > +		clockman_read(clockman, data->div_frac_reg) : 0;
> > +
> > +	/* If the integer portion of the divider is 0, treat it as 2^16 */
> > +	if (!div)
> > +		div = 1 << 16;
> > +
> > +	div = (div << CLK_DIV_FRAC_BITS) | (frac >> (32 - CLK_DIV_FRAC_BITS));
> > +
> > +	calc_rate = (u64)parent_rate << CLK_DIV_FRAC_BITS;
> > +	calc_rate = div64_u64(calc_rate, div);
> > +
> > +	return calc_rate;
> > +}

...

> > +		ctrl |= (AUX_SEL << CLK_CTRL_SRC_SHIFT) & data->clk_src_mask;
> > +	} else {
> > +		ctrl &= ~data->clk_src_mask;
> > +		ctrl |= (index << CLK_CTRL_SRC_SHIFT) & data->clk_src_mask;
> > +	}
> > +
> > +	clockman_write(clockman, data->ctrl_reg, ctrl);
> > +	spin_unlock(&clockman->regs_lock);
> > +
> > +	sel = rp1_clock_get_parent(hw);
> > +	WARN(sel != index, "(%s): Parent index req %u returned back %u\n",
> > +	     clk_hw_get_name(hw), index, sel);
> I don't think such an important clock callback should emit WARN(),
> because this might cause a message flood.
> 
> So i think either a WARN_ONCE() or dev_warn_once() might be better.

Ack.

> > +
> > +	return 0;
> > +}
> > +
> > +static int rp1_clock_set_rate_and_parent(struct clk_hw *hw,
> > +					 unsigned long rate,
> > +					 unsigned long parent_rate,
> > +					 u8 parent)
> > +{
> > +	struct rp1_clk_desc *clock = container_of(hw, struct rp1_clk_desc, hw);
> > +	struct rp1_clockman *clockman = clock->clockman;
> > +	const struct rp1_clock_data *data = clock->data;
> > +	u32 div = rp1_clock_choose_div(rate, parent_rate, data);
> > +
> > +	WARN(rate > 4000000000ll, "rate is -ve (%d)\n", (int)rate);
> This looks suspicious. Is this is a limit? Except of this, casting to
> int is wrong.

I think that's not an hard limit, the original intent was probably
to filter some clock rates resulting from functions that can return
a (negative) error code.
Since clock->data->max_freq contains the maximum frequency achievable,
I'll turn that WARN into a proper one that check for that limit.

> 
> In case this is not possible please make it a WARN_ONCE() or dev_warn_once()
> > +
> > +	if (WARN(!div,
> > +		 "clk divider calculated as 0! (%s, rate %ld, parent rate %ld)\n",
> > +		 clk_hw_get_name(hw), rate, parent_rate))
> > +		div = 1 << CLK_DIV_FRAC_BITS;
> Same here

Ack.

Many thanks,
Andrea

> > +
> > +	spin_lock(&clockman->regs_lock);
> > +
> > +	clockman_write(clockman, data->div_int_reg, div >> CLK_DIV_FRAC_BITS);
> > +	if (data->div_frac_reg)
> > +		clockman_write(clockman, data->div_frac_reg, div << (32 - CLK_DIV_FRAC_BITS));
> > +
> > +	spin_unlock(&clockman->regs_lock);
> > +
> > +	if (parent != 0xff)
> > +		rp1_clock_set_parent(hw, parent);
> > +
> > +	return 0;
> > +}
> > +
> > 

