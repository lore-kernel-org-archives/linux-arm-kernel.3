Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97DFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 17:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tFVk1CSr4Gjhn3uWBeLqopf2bxAI2GHatmkSuDvmcY=; b=nMVWVf/eRL8uV69LZl85h7O3Am
	pgEhV8yxERoSVxVL6+tSvlemJ9grYZW7fgirn1L/WB1c1BPfqVOOaCG5p3EeQgBQeI1ykjutM++Ip
	Yoy/JV50dmFKY0ooJry8Q4uGHMWpunvjy0WRykLLqjtkV2kjPs1p7wU1E0tF2OeQC7sB+aOLMq1uI
	qwDk393e/w+UPkkMI1DFTXoWZ65m4zqcWAG9sqMgSCx0boRPVi2SCGoJ8jdvs3OI2hLOCQjytccWJ
	KtnazC/qw4PDz9fnHkbgHSy0vlo74Hi0aIlk5l57QMtuaT2WU8o94JlVMr7z80tvDosPX1Mc1rNOn
	sGZ3BTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tizkj-0000000Flhq-1llR;
	Fri, 14 Feb 2025 17:45:25 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizDm-0000000Fdr6-2AzW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:11:24 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-220d39a5627so34719035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739553081; x=1740157881; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5tFVk1CSr4Gjhn3uWBeLqopf2bxAI2GHatmkSuDvmcY=;
        b=CWC3kv9zsxUGcKssTUlDsAerVwTFX/91bFuqN17afQppRAAWpHq71nbjZGArnx72g1
         tZ2ZTSF36yXjMIZplVgiHLAha/utBodAP0UuMBJsuGn5e1dxHeeYsfTzeZoCH1FJo2/Y
         YWA5gcDU+k3RBM31WCpg/EtfxTYbnQOs9yJ/U2L9Cz+Ia96WdTSLv1pywvXikZ9lGnK0
         68LS1umVW3GLGOm9GHuRGZPDHImpTMCjayPOHqKNn4AMo2RLqM5QabZAlUGonXxwsgD+
         iLKGbyfIawHM7yZeF1nq+oQLdoJ3xpdDNaxGa8Pv8VlDSq3SzWgA5zNET+YuiM/DxHB6
         UM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739553081; x=1740157881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5tFVk1CSr4Gjhn3uWBeLqopf2bxAI2GHatmkSuDvmcY=;
        b=WJO8kCv91aO0qgnOlBW2RWYBllzSFzjE6dBwRPqXYfV7SbfNfyN/sk2MohKf4aFQdh
         bvhLoJH0brhNB4lxqxiiYJjJVHuYo2oUr7a9alGBh5JGzMM9FfKXCJh4ilR+O4kl0lOj
         +/qyxdfwMKXI243pAgcmCfIlYoFLu2KeMTdtuo0HiEUR3Qaeg2Uo0wVu6lECyWW57F4O
         //PbhnHwKIiZHKRRU912t29WhTeIO36MO7VwGFjpXLW3yvdoQb2YzzDvVidJQe9VWJ4H
         Gdqmwxn/DTvwhnNJS+yTsgoPhIKYyj+rym823PZ+8bfn1jmU1MBL+PmF7sIHQfotZ8Y3
         0bwA==
X-Forwarded-Encrypted: i=1; AJvYcCXUOeu55fIH4OQVLkWJ2/mEAqPdOgv9Qv2CMwdWHKiiLEqtXpF8sPNcuU64dgnoNO1os7yeyhhIBKuG3OK9z8zI@lists.infradead.org
X-Gm-Message-State: AOJu0YzR0Mn8J57OBHRh+FeEtmtPdeqJeLuIC4F/SBWzRR2jMmiCI/E8
	Ora5so+l0A4o6j1je5S+xEhJzspXCPfzF0v1Jidugt4dD/uKun4w0eOYIeQGbg==
X-Gm-Gg: ASbGncuTDfw/fp6IhITTz7LgPqcATA1xhlhK8h8v8MhEQmeb5xvbC6/h6GRYCvxBdU1
	09PYhcDAvHXyn2jWhmk33cY3LwY8yMMzmXfy3zt0taksT6YcTBXl5+CYQs40glZv2Arf6ZonB3y
	ynq5odigKQbWbPBkew1G+ooRL4XoV/nxdDND8P2+ieV4vprPhhyXeeZ/j1SAU3qzdVuVPsPX4Sx
	w5ODwSjWiiV+8BaMhdoF4IkRMSEqzP6bA27DeVjMIX6YERFBo+oQ/9eS3sVUD/H6k3qH+wwZEEQ
	QKUyqxpnWr4RqgpfnLp8UQViuSQ=
X-Google-Smtp-Source: AGHT+IFtRcsC8lGjgRbp1ycQlIbd0zSbe+MhBv3YgVh5mcJFxmhiI53DBGqspGZoSEm1cJUzqXNGXA==
X-Received: by 2002:a17:902:fc8e:b0:215:a05d:fb05 with SMTP id d9443c01a7336-220bdfee6a5mr208218855ad.32.1739553081492;
        Fri, 14 Feb 2025 09:11:21 -0800 (PST)
Received: from thinkpad ([120.60.134.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d09esm31064135ad.112.2025.02.14.09.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:11:21 -0800 (PST)
Date: Fri, 14 Feb 2025 22:41:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers
 for EN7581 SoC
Message-ID: <20250214171106.ul3fwzcwhadhdwhj@thinkpad>
References: <20250202-en7581-pcie-pbus-csr-v2-0-65dcb201c9a9@kernel.org>
 <20250202-en7581-pcie-pbus-csr-v2-2-65dcb201c9a9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250202-en7581-pcie-pbus-csr-v2-2-65dcb201c9a9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_091122_591066_BE3E6162 
X-CRM114-Status: GOOD (  22.24  )
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

On Sun, Feb 02, 2025 at 08:34:24PM +0100, Lorenzo Bianconi wrote:
> Configure PBus base address and address mask to allow the hw
> to detect if a given address is on PCIE0, PCIE1 or PCIE2.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 30 ++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index aa24ac9aaecc749b53cfc4faf6399913d20cdbf2..9c2a592cae959de8fbe9ca5c5c2253f8eadf2c76 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -15,6 +15,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/msi.h>
>  #include <linux/of_device.h>
> @@ -24,6 +25,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>  
>  #include "../pci.h"
> @@ -127,6 +129,13 @@
>  
>  #define PCIE_MTK_RESET_TIME_US		10
>  
> +#define PCIE_EN7581_PBUS_ADDR(_n)	(0x00 + ((_n) << 3))
> +#define PCIE_EN7581_PBUS_ADDR_MASK(_n)	(0x04 + ((_n) << 3))
> +#define PCIE_EN7581_PBUS_BASE_ADDR(_n)	\
> +	((_n) == 2 ? 0x28000000 :	\
> +	 (_n) == 1 ? 0x24000000 : 0x20000000)
> +#define PCIE_EN7581_PBUS_BASE_ADDR_MASK	GENMASK(31, 26)
> +
>  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
>  #define PCIE_EN7581_RESET_TIME_MS	100
>  
> @@ -931,7 +940,8 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
>  static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  {
>  	struct device *dev = pcie->dev;
> -	int err;
> +	struct regmap *map;
> +	int err, slot;
>  	u32 val;
>  
>  	/*
> @@ -945,6 +955,24 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	/* Wait for the time needed to complete the reset lines assert. */
>  	msleep(PCIE_EN7581_RESET_TIME_MS);
>  
> +	map = syscon_regmap_lookup_by_phandle(dev->of_node,
> +					      "mediatek,pbus-csr");
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);

So this is going to regress the devicetree's that do not define this syscon
region? But I do not see any devicetree using this 'airoha,en7581-pcie'
compatible, so not sure if this is going to be an issue. Are the downstream
devicetrees used?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

