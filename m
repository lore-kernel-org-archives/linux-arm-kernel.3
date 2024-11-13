Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB6CD637A3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9rKfjR1HZdkhSoVFUPTH5q4XPsaUToI4Fa76nl271U=; b=jIrVC3tLNv0+vDdJP2MMd+iZ5t
	PRjPV+pahbBE+Bl40RVLhCvNYG1p7hVZ72dTxFSQkiG+pmbe67Wq3HcETVEue77EsJcscjUgLwpyi
	mXOWu3kR7JM+RZpAF9AnMLApp/Nx6IEN6hbOy42f0MiyiXeuHz7c4sZ42ZuTXJLb0KWT4qfiTkoaU
	X+jplOFCxNkZIfV2225H/dVNRJ8f6mdIr/POVcdkJ5gjXUILea6snGVCsVNrA8Sb3MXZqbttIWEpN
	zOp0ed5t48GM5Yx5rlguttwQM04SOor2RX/jsdw7dTj14RPCzTLfoT4Vp1LrArmDv9nzfPdayQquQ
	C+H//jSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBHVu-00000007cNi-17EN;
	Wed, 13 Nov 2024 17:50:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBHU5-00000007cA0-0u0n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 17:48:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20cf6eea3c0so69473715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 09:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731520132; x=1732124932; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y9rKfjR1HZdkhSoVFUPTH5q4XPsaUToI4Fa76nl271U=;
        b=BXLXD8OLOeFcmvmh5fJfKbMWoD12c6F/iWeiw48lKwK/q70chq3bSpjg5ymj4md/UB
         QI4/MOycUm3kaZUghnXdRcTyK115eZdeVxMr99HFVMC+gFhIO/ufU6qNhssbTYfGwJAF
         6yHc5cWfm1N5/IeJY7r83ZAx3+gqNXyvZm0qxxHybQuzeNI3HyqkiwDuodr603QMaQlG
         v7P4/vlQkdwui9Q7xp4LOnq3eJV5tql9FBJ7SSL9MeHLQaJp6Djf5fb6b6XU+WZJVlvo
         Q5D6S84nRTXma52l4E1rKoinKiECt+kjRoluqYdFCi9YNBtPldn/zzOxgykcPMDFiqvJ
         Ho3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520132; x=1732124932;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9rKfjR1HZdkhSoVFUPTH5q4XPsaUToI4Fa76nl271U=;
        b=JPdz0C+s2WhYrcJCrGy2MjM3ekEfQn56UlZT9dhbFJsCLMkEh+w9HvVTagW1eH71MF
         8/l4qxcB6n1Lk/Aagkwj/8xEiNhOSbbAmHHIoHPx07Ov6NN+zLZNYJMpvdG2HOg3sm+o
         eATJMVaMih64JAellSDuOsS+kmwoB0Ih9bBNdR8zXNb3QzOHgwDEmOUfX0GBh4DhMQXa
         Swn6SNUqCchDSHe94PVw3prUV38//PGN5bQQyh94t2/P8bjDKeTVAyZq7E504eYgiNYB
         UcY3iODR4/38ek72hSHNhkkLK19tXjk/lvBtdhVa4LC+rTOa52ZwXzGj2vd9uOaGUH7v
         dtCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbq2AmgSLaQ8VcxMr6ygXsbOntPWW9E84P/1V+FsQv/JG+Hp9Tm28w8gkuBZh8EbJsoMRs+lhtQD1407KMhV9C@lists.infradead.org
X-Gm-Message-State: AOJu0YxdDhdYaNqn2Z5I0GwTrmmKp8enkOJMuLua8onxFqtGzA/TeeL5
	ymOQLmabdALhJxJ6Lpft6HTjVWnI6uQFw2YQIpOkouCofrEGKJXoK8v0P6UhQw==
X-Google-Smtp-Source: AGHT+IGUx5vMux/zJWfHt+c3yDFnfCUQDJa3eB9NypPr2jzRRcay61/UDEWpDrYoWje8hXMYDmT3ow==
X-Received: by 2002:a17:903:230b:b0:20b:9062:7b16 with SMTP id d9443c01a7336-211834e6c2amr288743745ad.9.1731520132170;
        Wed, 13 Nov 2024 09:48:52 -0800 (PST)
Received: from thinkpad ([117.213.102.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e8752asm110135085ad.282.2024.11.13.09.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 09:48:51 -0800 (PST)
Date: Wed, 13 Nov 2024 23:18:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, alyssa@rosenzweig.io, bpf@vger.kernel.org,
	broonie@kernel.org, jgg@ziepe.ca, joro@8bytes.org,
	lgirdwood@gmail.com, maz@kernel.org, p.zabel@pengutronix.de,
	robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH v5 2/2] PCI: imx6: Add IOMMU and ITS MSI support for
 i.MX95
Message-ID: <20241113174841.olnyu5l6rbmr3tqh@thinkpad>
References: <20241104-imx95_lut-v5-0-feb972f3f13b@nxp.com>
 <20241104-imx95_lut-v5-2-feb972f3f13b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241104-imx95_lut-v5-2-feb972f3f13b@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_094853_301562_560FCD40 
X-CRM114-Status: GOOD (  43.23  )
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

On Mon, Nov 04, 2024 at 02:23:00PM -0500, Frank Li wrote:
> For the i.MX95, configuration of a LUT is necessary to convert Bus Device
> Function (BDF) to stream IDs, which are utilized by both IOMMU and ITS.
> This involves examining the msi-map and smmu-map to ensure consistent
> mapping of PCI BDF to the same stream IDs. Subsequently, LUT-related
> registers are configured. In the absence of an msi-map, the built-in MSI
> controller is utilized as a fallback.
> 
> Register a PCI bus callback function to handle enable_device() and
> disable_device() operations, setting up the LUT whenever a new PCI device
> is enabled.
> 
> Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Some minor comments below. It'd be good to get Robin's Ack for this patch.

> ---
> Change from v4 to v5
> - rework commt message
> - add comment for mutex
> - s/reqid/rid/
> - keep only one loop when enable lut
> - add warning when try to add duplicate rid
> - Replace hardcode 0xffff with IMX95_PE0_LUT_MASK
> - Fix some error message
> 
> Change from v3 to v4
> - Check target value at of_map_id().
> - of_node_put() for target.
> - add case for msi-map exist, but rid entry is not exist.
> 
> Change from v2 to v3
> - Use the "target" argument of of_map_id()
> - Check if rid already in lut table when enable device
> 
> change from v1 to v2
> - set callback to pci_host_bridge instead pci->ops.
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 176 +++++++++++++++++++++++++++++++++-
>  1 file changed, 175 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 94f3411352bf0..e75dc361e284e 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -55,6 +55,22 @@
>  #define IMX95_PE0_GEN_CTRL_3			0x1058
>  #define IMX95_PCIE_LTSSM_EN			BIT(0)
>  
> +#define IMX95_PE0_LUT_ACSCTRL			0x1008
> +#define IMX95_PEO_LUT_RWA			BIT(16)
> +#define IMX95_PE0_LUT_ENLOC			GENMASK(4, 0)
> +
> +#define IMX95_PE0_LUT_DATA1			0x100c
> +#define IMX95_PE0_LUT_VLD			BIT(31)
> +#define IMX95_PE0_LUT_DAC_ID			GENMASK(10, 8)
> +#define IMX95_PE0_LUT_STREAM_ID			GENMASK(5, 0)
> +
> +#define IMX95_PE0_LUT_DATA2			0x1010
> +#define IMX95_PE0_LUT_REQID			GENMASK(31, 16)
> +#define IMX95_PE0_LUT_MASK			GENMASK(15, 0)
> +
> +#define IMX95_SID_MASK				GENMASK(5, 0)
> +#define IMX95_MAX_LUT				32
> +
>  #define to_imx_pcie(x)	dev_get_drvdata((x)->dev)
>  
>  enum imx_pcie_variants {
> @@ -82,6 +98,7 @@ enum imx_pcie_variants {
>  #define IMX_PCIE_FLAG_HAS_PHY_RESET		BIT(5)
>  #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
>  #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
> +#define IMX_PCIE_FLAG_HAS_LUT			BIT(8)
>  
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
> @@ -134,6 +151,9 @@ struct imx_pcie {
>  	struct device		*pd_pcie_phy;
>  	struct phy		*phy;
>  	const struct imx_pcie_drvdata *drvdata;
> +
> +	/* Ensure that only one device's LUT is configured at any given time */
> +	struct mutex		lock;
>  };
>  
>  /* Parameters for the waiting for PCIe PHY PLL to lock on i.MX7 */
> @@ -925,6 +945,152 @@ static void imx_pcie_stop_link(struct dw_pcie *pci)
>  	imx_pcie_ltssm_disable(dev);
>  }
>  
> +static int imx_pcie_add_lut(struct imx_pcie *imx_pcie, u16 rid, u8 sid)
> +{
> +	struct dw_pcie *pci = imx_pcie->pci;
> +	struct device *dev = pci->dev;
> +	u32 data1, data2;
> +	int free = -1;
> +	int i;
> +
> +	if (sid >= 64) {
> +		dev_err(dev, "Invalid SID for index %d\n", sid);
> +		return -EINVAL;
> +	}
> +
> +	guard(mutex)(&imx_pcie->lock);
> +
> +	for (i = 0; i < IMX95_MAX_LUT; i++) {
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL, IMX95_PEO_LUT_RWA | i);
> +		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1, &data1);
> +
> +		if (!(data1 & IMX95_PE0_LUT_VLD)) {
> +			if (free < 0)
> +				free = i;

So you don't increment 'free' once it becomes >=0? Why can't you use the loop
iterator 'i' itself instead of 'free'?

> +			continue;
> +		}
> +
> +		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2, &data2);
> +
> +		/* Needn't add duplicated Request ID */

"Do not add duplicate RID"

> +		if (rid == FIELD_GET(IMX95_PE0_LUT_REQID, data2)) {
> +			dev_warn(dev, "Try to enable rid(%d) twice without disable it\n", rid);

"Existing LUT entry available for RID (%d)\n"

> +			return 0;
> +		}
> +	}
> +
> +	if (free < 0) {
> +		dev_err(dev, "LUT entry is not available\n");
> +		return -EINVAL;

ENOSPC?

> +	}
> +
> +	data1 = FIELD_PREP(IMX95_PE0_LUT_DAC_ID, 0);
> +	data1 |= FIELD_PREP(IMX95_PE0_LUT_STREAM_ID, sid);
> +	data1 |= IMX95_PE0_LUT_VLD;
> +	regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1, data1);
> +
> +	data2 = IMX95_PE0_LUT_MASK; /* Match all bits of rid */

Please use 'RID' in comments everywhere.

> +	data2 |= FIELD_PREP(IMX95_PE0_LUT_REQID, rid);
> +	regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2, data2);
> +
> +	regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL, free);
> +
> +	return 0;
> +}
> +
> +static void imx_pcie_remove_lut(struct imx_pcie *imx_pcie, u16 rid)
> +{
> +	u32 data2;
> +	int i;
> +
> +	guard(mutex)(&imx_pcie->lock);
> +
> +	for (i = 0; i < IMX95_MAX_LUT; i++) {
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL, IMX95_PEO_LUT_RWA | i);
> +

Remove newline.

> +		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2, &data2);
> +		if (FIELD_GET(IMX95_PE0_LUT_REQID, data2) == rid) {
> +			regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1, 0);
> +			regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2, 0);
> +			regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL, i);
> +
> +			break;
> +		}
> +	}
> +}
> +
> +static int imx_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_dev *pdev)
> +{
> +	struct imx_pcie *imx_pcie = to_imx_pcie(to_dw_pcie_from_pp(bridge->sysdata));
> +	u32 sid_i = 0, sid_m = 0, rid = pci_dev_id(pdev);

No need to initialize sid_{i/m}.

> +	struct device_node *target;
> +	struct device *dev;
> +	int err_i, err_m;
> +
> +	dev = imx_pcie->pci->dev;
> +
> +	target = NULL;
> +	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask", &target, &sid_i);
> +	if (target)
> +		of_node_put(target);
> +	else
> +		err_i = -EINVAL;
> +
> +	target = NULL;
> +	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask", &target, &sid_m);
> +
> +	/*
> +	 * Return failure if msi-map exist and no entry for rid because dwc common
> +	 * driver will skip setting up built-in MSI controller if msi-map existed.
> +	 *
> +	 *   err_m      target
> +	 *	0	NULL		Return failure, function not work.
> +	 *      !0      NULL		msi-map not exist, use built-in MSI.
> +	 *	0	!NULL		Find one entry.
> +	 *	!0	!NULL		Invalidate case.
> +	 */
> +	if (!err_m && !target)
> +		return -EINVAL;
> +	else if (target)
> +		of_node_put(target); /* Find entry for rid in msi-map */
> +
> +	/*
> +	 * msi-map        iommu-map
> +	 *   Y                Y            ITS + SMMU, require the same sid
> +	 *   Y                N            ITS
> +	 *   N                Y            DWC MSI Ctrl + SMMU
> +	 *   N                N            DWC MSI Ctrl
> +	 */
> +	if (!err_i && !err_m)
> +		if ((sid_i & IMX95_SID_MASK) != (sid_m & IMX95_SID_MASK)) {
> +			dev_err(dev, "iommu-map and msi-map entries mismatch!\n");
> +			return -EINVAL;
> +		}
> +
> +	/*
> +	 * Both iommu-map and msi-map not exist, use dwc built-in MSI
> +	 * controller, do nothing here.
> +	 */
> +	if (err_i && err_m)
> +		return 0;
> +
> +	if (!err_i)
> +		return imx_pcie_add_lut(imx_pcie, rid, sid_i);
> +	else if (!err_m)
> +		/* Hardware auto add 2 bit controller id ahead of stream ID */

What is this comment for? I don't find it relevant here.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

