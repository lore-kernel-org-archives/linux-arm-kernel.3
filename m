Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394DFE77182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g65qgTjqOlP1dPzY49EK8e7JiQvveUKwfgOrX/XsYvQ=; b=l9u/varsGaRk+MZ0AU6MdGBxE9
	HWQG2tv1yu6HCNcWYqFe4gYJPrE9vouwcNLYzJ8u1h6YcCdDaMiWAVQDvWSOEDAoPi2FZQ37tKrMA
	BIvE42lD3Uvc+zcv/AlN6DuqjbHWq+jm3FoXSij6Cm6AbezWWe1AHuMb5irdgWk3sP9dvIx64oQye
	aT4yl2DaG/WrAn9f5TRE5sSd9OXrtxFg75Cq2o1xQJ9HAu2LQ5R0HxY2aFQLvRd/Vi7vrCHnVyfBE
	QoNvPfQfG5xdjNcJPyU5vuD7hCIcF5AvWnBvetDeUKtMn8rGo4C3Z2b489+/QMrKtsdxeTdPpjJBo
	qbHItOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhSF-00000000CaJ-1Pmh;
	Thu, 12 Dec 2024 11:34:03 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhQa-00000000C1r-3UPF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 11:32:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tLhQC-0005QD-1I; Thu, 12 Dec 2024 12:31:56 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tLhQA-0031XP-1e;
	Thu, 12 Dec 2024 12:31:55 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tLhQB-00COyC-0X;
	Thu, 12 Dec 2024 12:31:55 +0100
Date: Thu, 12 Dec 2024 12:31:55 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/2] thermal: imx91: Add support for i.MX91 thermal
 monitoring unit
Message-ID: <20241212113155.wfbbmxcrtcefzuha@pengutronix.de>
References: <20241210-imx91tmu-v2-0-5032aad4d88e@nxp.com>
 <20241210-imx91tmu-v2-2-5032aad4d88e@nxp.com>
 <20241211154622.f2jwwrqansk6il3o@pengutronix.de>
 <Z1m+O1UV4HD+7Rr2@lizhi-Precision-Tower-5810>
 <20241211185705.7b5uw26loobibzln@pengutronix.de>
 <Z1n4h/AxzthB0V9l@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1n4h/AxzthB0V9l@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_033221_025636_048F8DB0 
X-CRM114-Status: GOOD (  55.47  )
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

On 24-12-11, Frank Li wrote:
> On Wed, Dec 11, 2024 at 07:57:05PM +0100, Marco Felsch wrote:
> > On 24-12-11, Frank Li wrote:
> > > On Wed, Dec 11, 2024 at 04:46:22PM +0100, Marco Felsch wrote:
> > > > On 24-12-10, Frank Li wrote:
> > > > > From: Pengfei Li <pengfei.li_1@nxp.com>
> > > > >
> > > > > Introduce support for the i.MX91 thermal monitoring unit, which features a
> > > > > single sensor for the CPU. The register layout differs from other chips,
> > > > > necessitating the creation of a dedicated file for this.
> > > > >
> > > > > Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > > change from v1 to v2
> > > > > - use low case for hexvalue
> > > > > - combine struct imx91_tmu and tmu_sensor
> > > > > - simplify imx91_tmu_start() and imx91_tmu_enable()
> > > > > - use s16 for imx91_tmu_get_temp(), which may negative value
> > > > > - use reverse christmas tree style
> > > > > - use run time pm
> > > > > - use oneshot to sample temp
> > > > > - register thermal zone after hardware init
> > > > > ---
> > > > >  drivers/thermal/Kconfig         |  10 ++
> > > > >  drivers/thermal/Makefile        |   1 +
> > > > >  drivers/thermal/imx91_thermal.c | 265 ++++++++++++++++++++++++++++++++++++++++
> > > > >  3 files changed, 276 insertions(+)
> > > > >
> 
> [...]
> 
> > > > > +	platform_set_drvdata(pdev, tmu);
> > > > > +
> > > > > +	/* disable the monitor during initialization */
> > > > > +	imx91_tmu_enable(tmu, false);
> > > > > +	imx91_tmu_start(tmu, false);
> > > >
> > > > No need to disable it here since both bits (ENABLE and START) are 0
> > > > after a reset.
> > >
> > > Maybe uboot enable it. We can't depend on reset value without really set
> > > hardware reset bit.
> >
> > So the module can't be rested e.g. by disabling module power? Having a
> > dedicated reset mechanism would be much simpler instead of writing each
> > reg-field to the default value.
> 
> Not all module can be power off individual. Normally, it should have sw
> reset bit in controller. but I have not find it in this module.
> 
> >
> > > > > +	ret = imx91_init_from_nvmem_cells(tmu);
> > > > > +	if (ret) {
> > > > > +		writel_relaxed(DEFAULT_TRIM1_CONFIG, tmu->base + TRIM1);
> > > > > +		writel_relaxed(DEFAULT_TRIM2_CONFIG, tmu->base + TRIM2);
> > > > 			^
> > > > Can you please anwer if _relaxed API is sufficient? I don't know why you
> > > > making use of the _relaxed API here anyway. We have only a few MMIO
> > > > accesses here, so why can't we use the writel() instead? This applies to
> > > > the whole driver.
> > >
> > > There are not big difference writel_relaxed() or writel() for this driver.
> > > Just original owner pick one.
> >
> > NACK, the difference is that _relaxed() APIs don't guarantee the order
> > the register access is done.
> 
> It is totally wrong. *_relexed() API can guarantee the register access
> order. Only can't guarantee order with other memory. such as
> 
> 1 writel_related(A, 0)
> 2. x = 3
> 3 writel_related(B, 1)
> 
> Hardware/memory model, require B=1 must be after A=0, but not necessary
> after x=3, that's means (2) x=3 may happen after 3.
> 
> if use writel(), guarantee 1, 2, 3 as order.  Here have not DMA involved.
> So not any impact if (2) after (3).
> 
> Typically, only below case have to use writel().
> 2 (update DMA descritpor), 3 start DMA,
> 
> Additional, writel() also can't guarantee register access is done!!!!
> 
> writel() just means you send a write command to bus. Not guarantee to reach
> target module. typical case is
> 
> writel(A, 0);
> udelay(1);
> writel(A, 1);
> 
> The interval between A=1 and A=0 may less than 1us if timer have not use
> MMIO register. (arm system counter).
> 
> In this driver, the only valuable benefit by using writel() instead of
> writel_relexed() is "short function name".

You're right, I had to check the documentation once again. The _relaxed
API is fine by me, thank you also for the clarification.

> > > > > +	}
> > > > > +
> > > > > +	/* The typical conv clk is 4MHz, the output freq is 'rate / (div + 1)' */
> > > > > +	rate = clk_get_rate(tmu->clk);
> > > > > +	div = (rate / 4000000) - 1;
> > > > > +	if (div > FIELD_GET(DIV_MASK, DIV_MASK))
> > > > 			^
> > > > This misuse the FIELD_GET() API. Instead please add a define e.g. DIV_MAX.
> > >
> > > I don't think so, It avoid define another macro DIV_MAX, which may miss
> > > defined, the related marco should come from one source.
> > >
> > > For example:
> > >
> > > DIV_MASK is GENMASK(23, 16),  DIV_MAX is 256. But if hardware upgrade,
> > > DIV_MASK to GENMASK(24, 16), DIV_MAX is quite easy to forget update it and
> > > hard to find such mis-match when div value < 256.
> >
> > We not talking about "possible" other HW. For now it's just this one and
> > using FIELD_GET() this way is seems odd, at least to me.
> 
> If you look implement of FIELD_GET()
> (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));, it will be
> reasonable.

I know the implementation and still IMHO it's not the correct usage at
least to me. What's wrong is that a mask doesn't define the possible
values for a reg-field, e.g. GENMASK(1, 0) could allow all values from 0
to 3 but the HW may allow only 0 and 1.

> Hardware IP may update in future, bitwidth of field may expand.

Please see above.

> > > > > +		return -EINVAL;
> > > > 			^
> > > > 		dev_err_probe()
> > > > > +
> > > > > +	/* Set divider value and enable divider */
> > > > > +	writel_relaxed(DIV_EN | FIELD_PREP(DIV_MASK, div), tmu->base + REF_DIV);
> > > > > +
> > > > > +	/* Set max power up delay: 'Tpud(ms) = 0xFF * 1000 / 4000000' */
> > > > > +	writel_relaxed(FIELD_PREP(PUDL_MASK, 100U), tmu->base + PUD_ST_CTRL);
> > > > 		^
> > > > You dont need to repeat the default value, so this line can be dropped.
> > > >
> > > > > +
> > > > > +	/*
> > > > > +	 * Set resolution mode
> > > > > +	 * 00b - Conversion time = 0.59325 ms
> > > > > +	 * 01b - Conversion time = 1.10525 ms
> > > > > +	 * 10b - Conversion time = 2.12925 ms
> > > > > +	 * 11b - Conversion time = 4.17725 ms
> > > > > +	 */
> > > > > +	writel_relaxed(FIELD_PREP(CTRL1_RES_MASK, 0x3), tmu->base + CTRL1_CLR);
> > > > > +	writel_relaxed(FIELD_PREP(CTRL1_RES_MASK, 0x1), tmu->base + CTRL1_SET);
> > > >
> > > > Same here, you repeat the module default after reset, so please drop it.
> > > >
> > > > > +	writel_relaxed(CTRL1_MEAS_MODE_MASK, tmu->base + CTRL1_CLR);
> > > > > +	writel_relaxed(FIELD_PREP(CTRL1_MEAS_MODE_MASK, CTRL1_MEAS_MODE_SINGLE),
> > > > > +		       tmu->base + CTRL1_SET);
> > > > > +
> > > > > +	clk_disable_unprepare(tmu->clk);
> > > >
> > > > Drop this, and
> > > >
> > > > > +	pm_runtime_set_suspended(dev);
> > > >
> > > > replace this with: pm_runtime_set_active();
> > >
> > > No big difference, if set_active, we need add Enable TMU here. I can
> > > change to set_active.
> >
> > You don't need to manually disable the clock, it would be done by the
> > runtime-pm.
> 
> Yes, runtime-pm can disable clock, but it need align harware and run time
> state before enable runtime pm.
> 
> There are two options
> 1 disable all hardware resources and pm_runtime_set_suspended()
> 2. enable all hardware resources and set_active()

I know.

> After algned, use runtime pm API to controller it.
> 
> I choose option1, you prefer option 2.

I know this too and I'm fine with it albeit I would like option 2 more
because:
 - based on pm-runtime API only
 - easier to enable autosuspend feature

Regards,
  Marco

> Frank
> >
> > Regards,
> >   Marco
> >
> >
> [...]
> > > > > +
> > > > > +MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
> > > > > +MODULE_DESCRIPTION("i.MX91 Thermal Monitor Unit driver");
> > > > > +MODULE_LICENSE("GPL");
> > > > >
> > > > > --
> > > > > 2.34.1
> > > > >
> > > > >
> > >
> 

