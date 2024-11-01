Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBD7E6F06F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3QJ7O7nQsMRwR4gpPAtvt1BszNR8xdAssdx0uD1Q2w=; b=iV6k+2uLbkUB+oHOP1gGdWEpFV
	CHGGN+1gW6tR+6LCj6gyb5VlFbNqqjLRDG1rzYDu5EOVi39Y/YbnEu9DuCbb/fU3jj9lTxZLbDxlV
	Kqh7Pfuv5HH2puPrgmXnULwzbIQbeHyZFrCMTHW+FhxWbY4pRUSJmluHCZhBAxs3ib+k1md3tlvBz
	R/B1ri4RI1HilyVh46dfvX4r34N/W5O0Ft3W94Og2R7dQTELO/N1vykizJQiT8Vxtrg6cRm0i9hVb
	oV1qxd0uv49OfH7nI9vO51t+8lRGFBHlBYya/huG6hRUtb8oOQWQKwon5dIdC23LT+LtDc88NO4z3
	NVAWrhtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vPB-00000007pxc-1BCl;
	Fri, 01 Nov 2024 17:25:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vMf-00000007pbK-0AsB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:23:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7DD51007;
	Fri,  1 Nov 2024 10:23:41 -0700 (PDT)
Received: from [10.57.90.209] (unknown [10.57.90.209])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 680953F528;
	Fri,  1 Nov 2024 10:23:08 -0700 (PDT)
Message-ID: <391c735a-7daf-4256-8998-952652799dda@arm.com>
Date: Fri, 1 Nov 2024 17:23:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] PCI: imx6: Add IOMMU and ITS MSI support for
 i.MX95
To: Frank Li <Frank.Li@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 alyssa@rosenzweig.io, bpf@vger.kernel.org, broonie@kernel.org, jgg@ziepe.ca,
 joro@8bytes.org, lgirdwood@gmail.com, maz@kernel.org,
 p.zabel@pengutronix.de, will@kernel.org
References: <20241024-imx95_lut-v3-0-7509c9bbab86@nxp.com>
 <20241024-imx95_lut-v3-2-7509c9bbab86@nxp.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241024-imx95_lut-v3-2-7509c9bbab86@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_102313_172711_250EF8A3 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

On 2024-10-24 11:34 pm, Frank Li wrote:
[...]
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
> +
> +	target = NULL;
> +	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask", &target, &sid_i);

No, you still need to actually check "target" at this point - if it is 
now set, a mapping was found and "sid_i" is valid, otherwise if it still 
NULL, no mapping exists even if "err_i" is 0 (i.e. an "iommu-map" 
property was found, but did not contain any entries matching "rid" as 
input). Note that the target node is returned with a reference held, so 
needs an of_node_put() as well.

Thanks,
Robin.

> +	target = NULL;
> +	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask", &target, &sid_m);


