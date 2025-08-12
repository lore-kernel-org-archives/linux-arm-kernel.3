Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CB9CA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uG2h2zzCfJQhFNddsvS+qblj01CSbdaTUSHGxl0pYho=; b=1NgNnPIUUsmNUPAicLiTY4EZz8
	Z37FJrgvtl9us7STbDdbcaXuoamt6IQ45C3SszFDmo/bGhcpbDcQC1TtUB6AxvYFK8KA5bnzIjb/E
	0Ju/871M3nTkf8kTe9z0AySQGvii1bzdW/2mB/IHrdlIn5PsIy8zMsbqzI93paSv905rHYKqN49Q+
	l584zDUwYDSPgAgMipU0FudVYqYNiIK0pJ77+Hib3KsJWnOlyv6RzvzOs5FAiAaU01DvvCEnKfoIW
	LIDhCdB5HBownsnyInFuD1+OxWCtARGDyUPr5GdyRrrnE1oajOzSS/2t58/LMlyajIMMJO/51l3kf
	dhBsalIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluau-0000000BnEl-2Ibp;
	Tue, 12 Aug 2025 19:23:36 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrK4-0000000BD8s-1M2y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 15:54:02 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4c1bbV6Zzlz6M4bb;
	Tue, 12 Aug 2025 23:51:50 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5929F1401DC;
	Tue, 12 Aug 2025 23:53:47 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 12 Aug
 2025 17:53:46 +0200
Date: Tue, 12 Aug 2025 16:53:45 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Primoz Fiser <primoz.fiser@norik.com>
CC: Haibo Chen <haibo.chen@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	<nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	<linux-iio@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>
Subject: Re: [PATCH v2 2/2] iio: adc: imx93_adc: load calibrated values even
 calibration failed
Message-ID: <20250812165345.000002a4@huawei.com>
In-Reply-To: <ffafc9d6-2cfe-4e3f-a610-9bddc7eb49f4@norik.com>
References: <20250812-adc-v2-0-0260833f13b8@nxp.com>
	<20250812-adc-v2-2-0260833f13b8@nxp.com>
	<ffafc9d6-2cfe-4e3f-a610-9bddc7eb49f4@norik.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_085400_656490_3B7A858C 
X-CRM114-Status: GOOD (  26.31  )
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

On Tue, 12 Aug 2025 10:45:48 +0200
Primoz Fiser <primoz.fiser@norik.com> wrote:

> Hi Haibo,
> 
> On 12. 08. 25 10:04, Haibo Chen wrote:
> > ADC calibration might fail because of the noise on reference voltage.
> > To avoid calibration fail, need to meet the following requirement:
> >     ADC reference voltage Noise < 1.8V * 1/2^ENOB
> > 
> > For the case which the ADC reference voltage on board do not meet
> > the requirement, still load the calibrated values, so ADC can also
> > work but maybe not that accurate.  
> 
> Reviewed-by: Primoz Fiser <primoz.fiser@norik.com>
> 
> Thanks for fixing this.
> 
> BR,
> Primoz
> 
> > 
> > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > ---
> >  drivers/iio/adc/imx93_adc.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/imx93_adc.c b/drivers/iio/adc/imx93_adc.c
> > index 8471737ac04a2bac0417a6397f20865f6a2c01ca..17b0a2548b0a3614ac537b01e28bc3144d17d6fc 100644
> > --- a/drivers/iio/adc/imx93_adc.c
> > +++ b/drivers/iio/adc/imx93_adc.c
> > @@ -38,6 +38,7 @@
> >  #define IMX93_ADC_PCDR6		0x118
> >  #define IMX93_ADC_PCDR7		0x11C
> >  #define IMX93_ADC_CALSTAT	0x39C
> > +#define IMX93_ADC_CALCFG0	0x3A0
> >  
> >  /* ADC bit shift */
> >  #define IMX93_ADC_MCR_MODE_MASK			BIT(29)
> > @@ -58,6 +59,8 @@
> >  #define IMX93_ADC_IMR_ECH_MASK			BIT(0)
> >  #define IMX93_ADC_PCDR_CDATA_MASK		GENMASK(11, 0)
> >  
> > +#define IMX93_ADC_CALCFG0_LDFAIL_MASK		BIT(4)
> > +
> >  /* ADC status */
> >  #define IMX93_ADC_MSR_ADCSTATUS_IDLE			0
> >  #define IMX93_ADC_MSR_ADCSTATUS_POWER_DOWN		1
> > @@ -145,7 +148,7 @@ static void imx93_adc_config_ad_clk(struct imx93_adc *adc)
> >  
> >  static int imx93_adc_calibration(struct imx93_adc *adc)
> >  {
> > -	u32 mcr, msr;
> > +	u32 mcr, msr, calcfg;
> >  	int ret;
> >  
> >  	/* make sure ADC in power down mode */
> > @@ -158,6 +161,11 @@ static int imx93_adc_calibration(struct imx93_adc *adc)
> >  
> >  	imx93_adc_power_up(adc);
> >  
> > +	/* Enable loading of calibrated values even in fail condition */
> > +	calcfg = readl(adc->regs + IMX93_ADC_CALCFG0);
> > +	calcfg |= IMX93_ADC_CALCFG0_LDFAIL_MASK;
> > +	writel(calcfg, adc->regs + IMX93_ADC_CALCFG0);
> > +
> >  	/*
> >  	 * TODO: we use the default TSAMP/NRSMPL/AVGEN in MCR,
> >  	 * can add the setting of these bit if need in future.
> > @@ -180,9 +188,13 @@ static int imx93_adc_calibration(struct imx93_adc *adc)
> >  	/* check whether calbration is success or not */
> >  	msr = readl(adc->regs + IMX93_ADC_MSR);
> >  	if (msr & IMX93_ADC_MSR_CALFAIL_MASK) {
> > +		/*
> > +		 * Only give warning here, this means the noise of the
> > +		 * reference voltage do not meet the requirement:
> > +		 *     ADC reference voltage Noise < 1.8V * 1/2^ENOB
> > +		 * And the resault of ADC is not that accurate.

result

If nothing else comes up I'll probably just fix that whilst applying.

Jonathan


> > +		 */
> >  		dev_warn(adc->dev, "ADC calibration failed!\n");
> > -		imx93_adc_power_down(adc);
> > -		return -EAGAIN;
> >  	}
> >  
> >  	return 0;
> >   
> 


