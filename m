Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E067C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 23:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=m5KgvDS5OGPe8dh04/crKcOEP5k9Pi1QjHBG5eraMQI=; b=OAeIo3act4q4W+
	oRd4RHRRjaBFN/v1cLYfpikEVLC/ZwBjTx8dPNsVAFZmgRb1XshSCQnvU5MTzMERWMxYjERpFJb9i
	stTH/LNuFVhsDOvCxXn9/utYVS2UfV+ihdnK6oSdgsX5SJN07VfFd6dSg62tly+wtOIb5RoGRGs1W
	vHtgU+NWeWGKYpKAAhWs2gFlhAXrf8/fPi2vaMG5LsvwCCk/CBiCcI1qLtpurhbq+MHk2ElsPf/6M
	dof6Kh0Pv8/36DD9Xi42XJdtduichyDAMvfHPMtMocK4BKC2N9h98YaPMXGl6WRF8b7Nx9h8j67dM
	5w2Swq7EgXWcDc1ss8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf68n-0000000Gtry-3zVb;
	Mon, 03 Feb 2025 23:46:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf67S-0000000GtgN-44Oj;
	Mon, 03 Feb 2025 23:44:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D44E55C1117;
	Mon,  3 Feb 2025 23:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C69AC4CEE0;
	Mon,  3 Feb 2025 23:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738626285;
	bh=v+AuDIgJ0k5UvEy9luF0KK3FYg1kQKwaER5D0fle/no=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=U2XgL4fpLohrYMGFQsDpDmoiPq6PrVe58w/FVxQ1fSm6Umxk/MnowFc4T+9SDrFJ4
	 mcrvcRiXNn8XAyBuXP6FdT/090h2HmDh+4AsGf+/H8UIx403WZM75wXVaMTu7Lg3Mk
	 f10mFaCI98UMvtWTqWCyi2/t1D3fAesnYY+vDIj7be9yqMpr58hdzQVh+y90LdjZ5K
	 E0E+8eTLfmvHVDd/8Ye4KIa/wmqM5KZpeEvhhawF5g1ZOULtfi6dgqFk0SfZU03wfP
	 1ChFA5M2zxRLWUNuMBOXLINQZLiRZDQBluRBFZHdHZbDsGoqztoJE8eidGzWW2NiBT
	 IBmBMulY3HlhQ==
Date: Mon, 3 Feb 2025 17:44:43 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 05/10] clk: rp1: Add support for clocks provided by RP1
Message-ID: <20250203234443.GA810409@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b12caa1c8c674a56afa7b2de780d9ae5423159a3.1736776658.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_154447_095179_9F1631A4 
X-CRM114-Status: GOOD (  13.26  )
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

On Mon, Jan 13, 2025 at 03:58:04PM +0100, Andrea della Porta wrote:
> RaspberryPi RP1 is an MFD providing, among other peripherals, several
> clock generators and PLLs that drives the sub-peripherals.
> Add the driver to support the clock providers.

> +#define PLL_PRIM_DIV1_SHIFT		16
> +#define PLL_PRIM_DIV1_WIDTH		3
> +#define PLL_PRIM_DIV1_MASK		GENMASK(PLL_PRIM_DIV1_SHIFT + \
> +						PLL_PRIM_DIV1_WIDTH - 1, \
> +						PLL_PRIM_DIV1_SHIFT)
> +
> +#define PLL_PRIM_DIV2_SHIFT          12
> +#define PLL_PRIM_DIV2_WIDTH          3
> +#define PLL_PRIM_DIV2_MASK           GENMASK(PLL_PRIM_DIV2_SHIFT + \
> +                                             PLL_PRIM_DIV2_WIDTH - 1, \
> +                                             PLL_PRIM_DIV2_SHIFT)

Maybe this is standard drivers/clk style, but this seems like overkill
to me.  I think this would be sufficient and easier to read:

  #define PLL_PRIM_DIV1_MASK   GENMASK(18, 16)
  #define PLL_PRIM_DIV2_MASK   GENMASK(14, 12)

> +static unsigned long rp1_pll_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct rp1_clk_desc *pll = container_of(hw, struct rp1_clk_desc, hw);
> +	struct rp1_clockman *clockman = pll->clockman;
> +	const struct rp1_pll_data *data = pll->data;
> +	u32 prim, prim_div1, prim_div2;
> +
> +	prim = clockman_read(clockman, data->ctrl_reg);
> +	prim_div1 = (prim & PLL_PRIM_DIV1_MASK) >> PLL_PRIM_DIV1_SHIFT;
> +	prim_div2 = (prim & PLL_PRIM_DIV2_MASK) >> PLL_PRIM_DIV2_SHIFT;

And then here, I think you can just use FIELD_GET():

  prim_div1 = FIELD_GET(PLL_PRIM_DIV1_MASK, prim);
  prim_div2 = FIELD_GET(PLL_PRIM_DIV2_MASK, prim);

It looks like the same could be done for PLL_SEC_DIV_MASK,
PLL_CS_REFDIV_SHIFT, PLL_PH_PHASE_SHIFT, CLK_CTRL_AUXSRC_MASK, etc.

