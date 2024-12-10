Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E275E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnuH/9/xnjRyN5Pv24zBq6aBDEJUzR3LDoLQU0MG8q8=; b=aWLX3HYZ6c+rjxBL13P2xBEPSq
	pDDY3Vv6fvZsacsjWzYwlQGkaKx4cxoNh/wp3GRTcZLeg0gq58/Q3HFTcrP03StvWCmyHDWGN9HTZ
	T5RUi9olATfdAkyapKVofK0z4xRC/IGPKVFAPtaT9HsfS4ZgT+1VL8nvpJXtLWgo1mxseVV3PE+AW
	BFlVoII9i+XgCGpxN1J3zVBuq1VG8B1mTN7ZztmSLdtJ2rBRttwkbQdKjWgvahX4aSfObcY0OrLH+
	KupCigaqmYYg4+mNSd2JcNyzk3R0mx16MAKruym1FIPGQj2BKQKMlmUKRdhh71NpGS1yApmeUIbfZ
	3DFUzYrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1bn-0000000BrT2-3QGh;
	Tue, 10 Dec 2024 14:53:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Yo-0000000BqZF-2tbk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:50:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tL1YR-0005u5-Pz; Tue, 10 Dec 2024 15:49:39 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tL1YQ-002hu8-0r;
	Tue, 10 Dec 2024 15:49:39 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tL1YQ-008Y8G-2u;
	Tue, 10 Dec 2024 15:49:38 +0100
Date: Tue, 10 Dec 2024 15:49:38 +0100
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
	Pengfei Li <pengfei.li_1@nxp.com>, devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, imx@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] thermal: imx91: Add support for i.MX91 thermal
 monitoring unit
Message-ID: <20241210144938.zf3dkiubqhcxguqv@pengutronix.de>
References: <20241209-imx91tmu-v1-0-7859c5387f31@nxp.com>
 <20241209-imx91tmu-v1-2-7859c5387f31@nxp.com>
 <20241210103646.7gblp7mzxbna5gas@pengutronix.de>
 <Z1hLlm75iGMogltc@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1hLlm75iGMogltc@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_065002_742527_7F32878A 
X-CRM114-Status: GOOD (  35.85  )
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

On 24-12-10, Frank Li wrote:
> On Tue, Dec 10, 2024 at 11:36:46AM +0100, Marco Felsch wrote:
> > Hi,
> >
> > On 24-12-09, Frank Li wrote:

...

> > > +	/* disable the monitor during initialization */
> > > +	imx91_tmu_enable(tmu, false);
> > > +	imx91_tmu_start(tmu, false);
> >
> > Make use of pm_runtime?
> 
> thermal is always on after probe. continue measure tempature. So pm_runtime
> is not suitable for this case.

There are at least 3 drivers which use pm-runtime including the i.MX6/7
imx_thermal.c driver.

> > > +	ret = imx91_init_from_nvmem_cells(tmu);
> > > +	if (ret) {
> > > +		writel_relaxed(DEFAULT_TRIM1_CONFIG, tmu->base + TRIM1);
> > > +		writel_relaxed(DEFAULT_TRIM2_CONFIG, tmu->base + TRIM2);
> > > +	}
> > > +
> > > +	/* The typical conv clk is 4MHz, the output freq is 'rate / (div + 1)' */
> > > +	rate = clk_get_rate(tmu->clk);
> > > +	div = (rate / 4000000) - 1;
> >
> > Would be nice to validate the div value before passing to the HW and if
> > the target rate of 4MHz can't be reached by the div you you should
> > return -EINVAL.
> >
> > > +
> > > +	/* Set divider value and enable divider */
> > > +	writel_relaxed(DIV_EN | FIELD_PREP(DIV_MASK, div), tmu->base + REF_DIV);
> > > +
> > > +	/* Set max power up delay: 'Tpud(ms) = 0xFF * 1000 / 4000000' */
> > > +	writel_relaxed(FIELD_PREP(PUDL_MASK, 100U), tmu->base + PUD_ST_CTRL);
> > > +
> > > +	/*
> > > +	 * Set resolution mode
> > > +	 * 00b - Conversion time = 0.59325 ms
> > > +	 * 01b - Conversion time = 1.10525 ms
> > > +	 * 10b - Conversion time = 2.12925 ms
> > > +	 * 11b - Conversion time = 4.17725 ms
> > > +	 */
> > > +	writel_relaxed(FIELD_PREP(CTRL1_RES_MASK, 0x3), tmu->base + CTRL1_CLR);
> > > +	writel_relaxed(FIELD_PREP(CTRL1_RES_MASK, 0x1), tmu->base + CTRL1_SET);
> > > +
> > > +	/*
> > > +	 * Set measure mode
> > > +	 * 00b - Single oneshot measurement
> > > +	 * 01b - Continuous measurement
> > > +	 * 10b - Periodic oneshot measurement
> > > +	 */
> >
> > For the resolution it's fine to have the values directly coded without a
> > define, but here we can definitly use a define and drop the comment.
> >
> > > +	writel_relaxed(FIELD_PREP(CTRL1_MEAS_MODE_MASK, 0x3), tmu->base + CTRL1_CLR);
> > > +	writel_relaxed(FIELD_PREP(CTRL1_MEAS_MODE_MASK, 0x1), tmu->base + CTRL1_SET);
> >
> > Why do we set it to periodic mode instead of the single-shot? At the
> > moment the device doesn't have IRQ support, and so there is no need to
> > run the measurements in background.
> 
> It is "continous measurement".  first clean MODE_MASK, then then 01.

Still, why? You return the temp value upon a request (get_temp). There
is no async notification from this driver to others. So it can be left
to single-shot and do the measurement on request (get_temp).

> _CLR means clean bits according to mask
> _SET means set bits according to mask.

I know.

Regards,
  Marco

> 
> Frank
> 
> >
> > > +
> > > +	/*
> > > +	 * Set Periodic Measurement Frequency to 25Hz:
> > > +	 * tMEAS_FREQ = tCONV_CLK * PERIOD_CTRL[MEAS_FREQ]. ->
> > > +	 * PERIOD_CTRL(MEAS_FREQ) = (1000 / 25) / (1000 / 4000000);
> > > +	 * Where tMEAS_FREQ = Measurement period and tCONV_CLK = 1/fCONV_CLK.
> > > +	 * This field should have value greater than count corresponds
> > > +	 * to time greater than summation of conversion time, power up
> > > +	 * delay, and six times of conversion clock time.
> > > +	 * tMEAS_FREQ > (tCONV + tPUD + 6 * tCONV_CLK).
> > > +	 * tCONV is conversion time determined by CTRL1[RESOLUTION].
> > > +	 */
> > > +	writel_relaxed(FIELD_PREP(MEAS_FREQ_MASK, 0x27100), tmu->base + PERIOD_CTRL);
> >
> > With the single-shot measurements we could remove this part and..
> >
> > > +
> > > +	/* enable the monitor */
> > > +	imx91_tmu_enable(tmu, true);
> > > +	imx91_tmu_start(tmu, true);
> >
> > this part as well.
> >
> > Regards,
> >   Marco
> >
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void imx91_tmu_remove(struct platform_device *pdev)
> > > +{
> > > +	struct imx91_tmu *tmu = platform_get_drvdata(pdev);
> > > +
> > > +	/* disable tmu */
> > > +	imx91_tmu_start(tmu, false);
> > > +	imx91_tmu_enable(tmu, false);
> > > +}
> > > +
> > > +static int __maybe_unused imx91_tmu_suspend(struct device *dev)
> > > +{
> > > +	struct imx91_tmu *tmu = dev_get_drvdata(dev);
> > > +
> > > +	/* disable tmu */
> > > +	imx91_tmu_start(tmu, false);
> > > +	imx91_tmu_enable(tmu, false);
> > > +
> > > +	clk_disable_unprepare(tmu->clk);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused imx91_tmu_resume(struct device *dev)
> > > +{
> > > +	struct imx91_tmu *tmu = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	ret = clk_prepare_enable(tmu->clk);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	imx91_tmu_enable(tmu, true);
> > > +	imx91_tmu_start(tmu, true);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static SIMPLE_DEV_PM_OPS(imx91_tmu_pm_ops,
> > > +			 imx91_tmu_suspend, imx91_tmu_resume);
> > > +
> > > +static const struct of_device_id imx91_tmu_table[] = {
> > > +	{ .compatible = "fsl,imx91-tmu", },
> > > +	{ },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, imx91_tmu_table);
> > > +
> > > +static struct platform_driver imx91_tmu = {
> > > +	.driver = {
> > > +		.name	= "i.MX91_thermal",
> > > +		.pm	= pm_ptr(&imx91_tmu_pm_ops),
> > > +		.of_match_table = imx91_tmu_table,
> > > +	},
> > > +	.probe = imx91_tmu_probe,
> > > +	.remove = imx91_tmu_remove,
> > > +};
> > > +module_platform_driver(imx91_tmu);
> > > +
> > > +MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
> > > +MODULE_DESCRIPTION("i.MX91 Thermal Monitor Unit driver");
> > > +MODULE_LICENSE("GPL");
> > >
> > > --
> > > 2.34.1
> > >
> > >
> > >
> 

