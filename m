Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7115E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoMIovZwANYIwsr+ozwQc2rn2svzEdghbHBSFmyjB5A=; b=May5PiWfqxKfNTpInfYY2ihUbW
	sDf/vyzd/sbUOu43KkMux5r4bWa02SyczkB4iIhUq6ws4Wdvx+USHXshUjQN8U2kNRgyj+NOd45MA
	7WAcmpvLlgHrehVLanIzzjqRzT72/5nANP1kE7tLXI621Cz+Oad4+IwGLH5mTb3+HQsAi7vexWjvR
	BBysxfU+FAveu9A5bDCwYsDU3W0gKYSU+Pav4UgPXVVkT4+ulpiIljAgD2ZHdWyCCSs0NpxF0agco
	qGMP8UbgBjz9odM/UOStbBmOYirJ4I+qy6yLoA/cVD4vFjCeypfsd4wwhLBCG+w/ZO7fTz24NY667
	SjuqzF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CjA-00000009eLi-3gIh;
	Sat, 02 Nov 2024 11:55:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CdW-00000009cQU-1N2B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:49:47 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-720be27db74so1749626b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 04:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730548185; x=1731152985; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xoMIovZwANYIwsr+ozwQc2rn2svzEdghbHBSFmyjB5A=;
        b=hRARPjhzseaUcUGXb8F0OJhumHMKF2lig44+U+UpVaSmWMmRg/NgKx6bUhgtO6qBqZ
         AZTLCcR2A5DFQZrXZ5x1CXwCvRsUlR54kYHm3DHXqLApbd/NCwBNZ74GOIzd/7B8k/Zm
         d86xc8k7L0hkOkOXcfJRGgyFqzw8XRElCE2MiQyl59bulPfgyKDXp6yT9xKI3AWuDJmS
         vTDR5cpxTWG3rUJD8OVrrTrydPi5gE4ClK4dnZJx55Om1r6heEhosP0PkNJtvzQQQTKv
         PVHjmWGwni/qByQfkT4jZdyyxncqpPdEKkBCAoBKBSC/kOe5OlO0Crgyx8ewqvQLhwD4
         58Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730548185; x=1731152985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xoMIovZwANYIwsr+ozwQc2rn2svzEdghbHBSFmyjB5A=;
        b=qyEoSINQyRA1mWZif3XSmwM56lXwCGRNWGyLN2jPjwrJrEmhnwkgAgWkguD+0ls+Bj
         uuufLbFAUU0lw1jGUZAH88C4mCzO67sgYY4fn2zQi4QjRFsZDWVz0hW5bIuNzhZ2pIbA
         dMUxh8FTw/Di1GwbhlxhNrw8nCl+oF+wz94JYAsf+n84/xHm0FI0m2VGx3uUZkk9l9tn
         0KtnRWMg4uEmtSh7JxPeDMQrHGzGzDMWVL7zMGITZxxDxx568OMvC39AM+EJRiKQbpGU
         ntQHY3tU0vnCacev4EaMxiMVbyMnmUHYL8wGQMaHG1gUTJzCDOfdyrbZiUpnE55becrM
         FF+w==
X-Forwarded-Encrypted: i=1; AJvYcCUBqdwjKIVOipte3tSTdTVqw2HNQLRkxaZNC1W83ZGWoktuIpyXNIRJ9Bqi2USItFv1Aq9yX4MQMeMqEx9Z0SRF@lists.infradead.org
X-Gm-Message-State: AOJu0YxQgqpP8j6RTFzirKqC20EGH1LxNZzeu2Fmaf9kaWocugeCMweY
	Y2gULAtE6nqQOBXVY9rzokja6O984a/EI0CneUwiOK5uBaN+1qDEF8bDJZdruQ==
X-Google-Smtp-Source: AGHT+IFAZvvqPqfrR6KD3ufdIPcBIQIJ02cjOEk09Qxuto0fFw11UoKyY+vKorg9VaD5CI4LhSN2NA==
X-Received: by 2002:a05:6a00:2383:b0:71e:735f:692a with SMTP id d2e1a72fcca58-720bd1a046amr13892444b3a.14.1730548185366;
        Sat, 02 Nov 2024 04:49:45 -0700 (PDT)
Received: from thinkpad ([220.158.156.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5839sm4022440b3a.68.2024.11.02.04.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 04:49:44 -0700 (PDT)
Date: Sat, 2 Nov 2024 17:19:37 +0530
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
Subject: Re: [PATCH v3 2/2] PCI: imx6: Add IOMMU and ITS MSI support for
 i.MX95
Message-ID: <20241102114937.w7jt7n7zr3ext5jo@thinkpad>
References: <20241024-imx95_lut-v3-0-7509c9bbab86@nxp.com>
 <20241024-imx95_lut-v3-2-7509c9bbab86@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024-imx95_lut-v3-2-7509c9bbab86@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_044946_398219_913A7B07 
X-CRM114-Status: GOOD (  38.90  )
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

On Thu, Oct 24, 2024 at 06:34:45PM -0400, Frank Li wrote:
> For the i.MX95, configuration of a LUT is necessary to convert Bus Device
> Function (BDF) to stream IDs, which are utilized by both IOMMU and ITS.
> This involves examining the msi-map and smmu-map to ensure consistent
> mapping of PCI BDF to the same stream IDs. Subsequently, LUT-related
> registers are configured. In the absence of an msi-map, the built-in MSI
> controller is utilized as a fallback.
> 
> Additionally, register a PCI bus callback function enable_device() and
> disable_device() to config LUT when enable a new PCI device.
> 

Callbacks are not *addition*, but it is how you are implementing the LUT
configuration. Please reword it so.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v2 to v3
> - Use the "target" argument of of_map_id()
> - Check if rid already in lut table when enable device
> 
> change from v1 to v2
> - set callback to pci_host_bridge instead pci->ops.
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 159 +++++++++++++++++++++++++++++++++-
>  1 file changed, 158 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 94f3411352bf0..95f06bfb9fc5e 100644
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
> @@ -134,6 +151,7 @@ struct imx_pcie {
>  	struct device		*pd_pcie_phy;
>  	struct phy		*phy;
>  	const struct imx_pcie_drvdata *drvdata;
> +	struct mutex		lock;

Please add a comment on what the lock is guarding. 

>  };
>  
>  /* Parameters for the waiting for PCIe PHY PLL to lock on i.MX7 */
> @@ -925,6 +943,137 @@ static void imx_pcie_stop_link(struct dw_pcie *pci)
>  	imx_pcie_ltssm_disable(dev);
>  }
>  
> +static int imx_pcie_add_lut(struct imx_pcie *imx_pcie, u16 reqid, u8 sid)

s/reqid/rid

> +{
> +	struct dw_pcie *pci = imx_pcie->pci;
> +	struct device *dev = pci->dev;
> +	u32 data1, data2;
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
> +		if (!(data1 & IMX95_PE0_LUT_VLD))
> +			continue;
> +
> +		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2, &data2);
> +
> +		/* Needn't add duplicated Request ID */
> +		if (reqid == FIELD_GET(IMX95_PE0_LUT_REQID, data2))

So this means LUT entry is already present for the given RID (a buggy DT maybe).
Don't you need to emit a warning here?

> +			return 0;
> +	}
> +

You need to bail out here if no free LUT entry is available. But I'd recommend
to combine two loops to avoid having duplicated IMX95_PE0_LUT_VLD checks and
program LUT only if there is any free entry available.

> +	for (i = 0; i < IMX95_MAX_LUT; i++) {
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL, IMX95_PEO_LUT_RWA | i);
> +
> +		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1, &data1);
> +		if (data1 & IMX95_PE0_LUT_VLD)
> +			continue;
> +
> +		data1 = FIELD_PREP(IMX95_PE0_LUT_DAC_ID, 0);
> +		data1 |= FIELD_PREP(IMX95_PE0_LUT_STREAM_ID, sid);
> +		data1 |= IMX95_PE0_LUT_VLD;
> +
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1, data1);
> +
> +		data2 = 0xffff;

data2 = IMX95_PE0_LUT_MASK;

Also add a comment on why the mask is added along with the RID.

> +		data2 |= FIELD_PREP(IMX95_PE0_LUT_REQID, reqid);
> +
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2, data2);
> +
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL, i);
> +
> +		return 0;
> +	}
> +
> +	dev_err(dev, "All lut already used\n");

"LUT entry is not available"

> +	return -EINVAL;
> +}
> +
> +static void imx_pcie_remove_lut(struct imx_pcie *imx_pcie, u16 reqid)

s/reqid/rid

> +{
> +	u32 data2 = 0;

No need to initialize.

> +	int i;
> +
> +	guard(mutex)(&imx_pcie->lock);
> +
> +	for (i = 0; i < IMX95_MAX_LUT; i++) {
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL, IMX95_PEO_LUT_RWA | i);
> +
> +		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2, &data2);
> +		if (FIELD_GET(IMX95_PE0_LUT_REQID, data2) == reqid) {
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
> +	u32 sid_i = 0, sid_m = 0, rid = pci_dev_id(pdev);
> +	struct device_node *target;
> +	struct imx_pcie *imx_pcie;
> +	struct device *dev;
> +	int err_i, err_m;
> +
> +	imx_pcie = to_imx_pcie(to_dw_pcie_from_pp(bridge->sysdata));
> +	dev = imx_pcie->pci->dev;

You can assign these at initialization time.

> +
> +	target = NULL;
> +	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask", &target, &sid_i);
> +	target = NULL;

What is the point in passing 'target' here?

> +	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask", &target, &sid_m);
> +
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
> +			dev_err(dev, "its and iommu stream id miss match, please check dts file\n");

"iommu-map and msi-map entries mismatch!"

- Mani

-- 
மணிவண்ணன் சதாசிவம்

