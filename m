Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEFBD49222
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kk0fbCm86oNON+VzAknySsP7MWSV0z1bs5jHXJw47/E=; b=zIIX6ldpY0r1snZ7Vgl+JHJARB
	YElviY3gfQoRXd+zNk04X/7flHPxLqcNya17MudQ9x6A6Zhp8SMXb51iqFPAg8gwq/zb/lOJiNsn7
	dw80IGH/X4dzZmMtRGwMN33j8aFrtmtK5TJ+b1VpQWYM2ts1/U3Pcu9HFqRdI4UVN0xVO0t7jzwXs
	cM0AExIU+iAK5HXqNJZpY7413Q4bC9RURlw0yvSxzVcGXTkGjRQACn78I7vVqPkDtq42NV6PS46Ye
	YP03C1q+xcVLqbQYKNG0bZrQfugRFyzXwtTEMwdbf5uuAz5MhIpusKtO8WF0eCTqQpH1TeurPtlrQ
	AlkC7y7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1y6-00000009cYl-1Hif;
	Mon, 18 Nov 2024 13:39:06 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1tn-00000009bFV-141N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:34:40 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI92Saa027677;
	Mon, 18 Nov 2024 14:34:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=kk0fbCm86oNON+VzAknySsP7
	MWSV0z1bs5jHXJw47/E=; b=ZKjfiG/Wh8lUk5ragQjXYnM5zxkVWBgG20FGAMTZ
	bObTmd26MsJl0TVzVROI82uykK1xaUQ8T7cIv9gHxn7bI5v4hoq8irxUkSeYydFl
	e/R8EadFRHymA3eSpaUeM6mBdGXwrBz1mCoedK/mqsjk+1YN1+qqXHw79/TEwme3
	V2EcMlnzkGR5o45io9L3wZdShlLxadvhS0ln4U2wsKh1srWt1a8tBym9/JNLCW6r
	QJsm4xGwtRmIsNv9M6nEPHQju/eTyDHsvyqCAKsHduaAbGOr9O479i1C4DBwEQ7S
	k+tYziiyyt4yTdZx8YWiiIvljCf6NwLFnRieisJGu8VHYw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42y5u3n7tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 14:34:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 59F2140052;
	Mon, 18 Nov 2024 14:33:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 20D4128AB95;
	Mon, 18 Nov 2024 14:31:56 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 18 Nov
 2024 14:31:55 +0100
Date: Mon, 18 Nov 2024 14:31:50 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 03/15] media: stm32: csi: addition of the STM32 CSI
 driver
Message-ID: <20241118133150.GA2001051@gnbcxd0016.gnb.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
 <20241105-csi_dcmipp_mp25-v2-3-b9fc8a7273c2@foss.st.com>
 <8841158ed61b2b92a92ac6d2afcbd7cff12a6680.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8841158ed61b2b92a92ac6d2afcbd7cff12a6680.camel@pengutronix.de>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_053439_587342_0ED208E7 
X-CRM114-Status: GOOD (  24.32  )
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

Hi Philipp

On Tue, Nov 05, 2024 at 11:14:47AM +0100, Philipp Zabel wrote:
> On Di, 2024-11-05 at 08:49 +0100, Alain Volmat wrote:
> > The STM32 CSI controller is tightly coupled with the DCMIPP and act as an
> > input stage to receive data coming from the sensor and transferring
> > them into the DCMIPP.
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > 
> > ---
> > v2: correct data-lanes handling, using values 1 & 2
> >     update yaml filename in MAINTAINERS
> > ---
> >  MAINTAINERS                                 |    8 +
> >  drivers/media/platform/st/stm32/Kconfig     |   14 +
> >  drivers/media/platform/st/stm32/Makefile    |    1 +
> >  drivers/media/platform/st/stm32/stm32-csi.c | 1144 +++++++++++++++++++++++++++
> >  4 files changed, 1167 insertions(+)
> > 
> [...]
> > diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c7f47472c6b3699e94113ce0f38b280a2e45ce15
> > --- /dev/null
> > +++ b/drivers/media/platform/st/stm32/stm32-csi.c
> > @@ -0,0 +1,1144 @@
> [...]
> > +static int stm32_csi_get_resources(struct stm32_csi_dev *csidev,
> > +				   struct platform_device *pdev)
> > +{
> > +	int irq, ret;
> > +
> > +	csidev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> > +	if (IS_ERR(csidev->base))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->base),
> > +				     "Failed to ioremap resource\n");
> > +
> > +	csidev->pclk = devm_clk_get(&pdev->dev, "pclk");
> > +	if (IS_ERR(csidev->pclk))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->pclk),
> > +				     "Couldn't get pclk\n");
> > +
> > +	csidev->txesc = devm_clk_get(&pdev->dev, "txesc");
> > +	if (IS_ERR(csidev->txesc))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->txesc),
> > +				     "Couldn't get txesc\n");
> > +
> > +	csidev->csi2phy = devm_clk_get(&pdev->dev, "csi2phy");
> > +	if (IS_ERR(csidev->csi2phy))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->csi2phy),
> > +				     "Couldn't get csi2phy\n");
> 
> Consider using devm_clk_bulk_get().

Ok, I change this in the v3.

> 
> > +	csidev->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> > +	if (IS_ERR(csidev->rstc))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->rstc),
> > +				     "Couldn't get reset control\n");
> 
> If this wasn't in a separate function, rstc wouldn't have to be stored
> on csidev as it's only ever used in stm32_csi_probe().

Ok, whole reset handling moved into the probe function.

> 
> > +
> > +	csidev->supplies[0].supply = "vdd";
> > +	csidev->supplies[1].supply = "vdda18";
> > +	ret = devm_regulator_bulk_get(&pdev->dev, ARRAY_SIZE(csidev->supplies),
> > +				      csidev->supplies);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "Failed to request regulator vdd\n");
> > +
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> > +					stm32_csi_irq_thread, IRQF_ONESHOT,
> > +					dev_name(&pdev->dev), csidev);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "Unable to request irq");
> > +
> > +	return 0;
> > +}
> 
> regards
> Philipp

Regards
Alain

