Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A15C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 05:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMGZVixZMsM1QUrt21MIcd+lH0Pr9ebQZcDM8qRaS2Y=; b=Vp7mkFD03V4AJyg9S8fACjhwMm
	yXh3rJaG01ijJtoOg6Sale+dFKen8i1ngawaXIUj0tm/7dSXpRxrDe/8f5Lusb74xajvfnnIy96HY
	l/z3cRDA/TrLGUM9zfy088TQZSRvXvtWuAtpI54qgd6dvXAO/UdkZtZNvKtsexRTsMqX2VweLs7eU
	93xL9S+Zh5sR8mFNn1UAPDLP/EgTbgfsDu7HR6kl83W9qzGkZTPAR+kycF/NEepEJuZU7vl3rSmm3
	+r1L4SogTp3NHwqPMLqe7AJz1ZEQNeMxuuzePytH61V3MUetyRfmV+Jzt6nQ/NOAlWqq6nmCyki5N
	4TG+idcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmRPi-0000000COKo-1TvR;
	Mon, 24 Feb 2025 05:53:58 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmROA-0000000CODz-3zex
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 05:52:24 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220ecbdb4c2so108681915ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 21:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740376342; x=1740981142; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KMGZVixZMsM1QUrt21MIcd+lH0Pr9ebQZcDM8qRaS2Y=;
        b=WrvzEC4kTxY6xeoIStMf0Wu0QJTNQCuHvBx/LMN3EU6hkmYavelyVf2X93enShULBq
         zurEZSxF5ajjeIwh8R9TNGgTpSkWtjnWcFGuDSGsldzsBcTmkNFI1NKB/Db+nheh5SyB
         CjCpyZHlsv/PzGKvz/rwTQachKT6dVdjnTu+UbB8jtL4lxDwdmBcGA+annxgI4yxBrUN
         FXzoUioDY5+c7Ex1wBr81PCUPUl/WMG3Rm82exaiScIv0CEFPyRRU1ilE9/3/BBX4nNj
         7XAFaZgX8pJRigP9q4cuDx6iR2qE+BIyFFss1yQ9fyRL3II1fHBO+ByXHwooCZrcKQds
         uZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740376342; x=1740981142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMGZVixZMsM1QUrt21MIcd+lH0Pr9ebQZcDM8qRaS2Y=;
        b=jT+y17qPv0/JCjn7us8EK69fQKEp+kFowzO/giNuaKQBA6+E3CW3xF0y7Avo7SnsSu
         p51zAuEnI8201C/uIc54lCTgqW7Yogzq903K6mCYLv5ak+UEPeua6qWIPFtwiGd3vvja
         3n6MBzleIFQ61URAPYGPagX9D2hHHRHnR8dkxG4pH7Ai5V+sjbZ9ZbcqauXnR1MWs/E+
         V82Nv62v0TXgxYpj0804/P3wiVumInXAU64N9GinYTZhTLxF3ohTGKUW3/KxX8cpl8CZ
         /jGH3NEaN4kfDAElEElH3/gZ2RBLCGnZoYJZniSETutbEqS3i0Uouoe6WePUM79Rm1g+
         EWwA==
X-Forwarded-Encrypted: i=1; AJvYcCUwI/Y4ey2jOEaFOFOJAc4I94B7q2uwTWKLEfPhTIyB3CbwZoIy5JU/DsMIg1MGFCrIi5otLwGERRa9sCLtG85Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwTVW9AZBv20zJITHR3OFGghZEruKwA9g6Yd/wuvrwba/fMJPgi
	IU9Xhwhn1/cTuYiP5FP6CzF9GRFNRuNiqqwgV/+005txd/jmY+Sl7PnHbYKHDw==
X-Gm-Gg: ASbGncvl1njoLVn9x5LFB+jeGDqWF53ed5m40ajwQoJm3lcj9BoaKCZsQzT1VaiU/rX
	xKllM6CM5hbiCR9nVwK9IETA+FnKiawJM4ynKIBkdpKIMKUd3zreTY9hMsikctgNoVMzzviE4ZY
	0kKT/N1/8KDqe0PqISr4ZR3epHSRCUNdr5o+dNXFUmYja5bcbNr8Q9UPC4Srm3MXC9Cpst28UEr
	3A3Y+wAPseaWV8MDEsgIfA7zEdnFlgYBbTtl5MC5aJXjT9nS8dNnDz27sr3/jClekt4q6wGJF4X
	vf6T2Fbd5eLliQL1wx7f32+OIbvA8zRH9xmx
X-Google-Smtp-Source: AGHT+IE2ru4PtjCsPp2tarf/l/cdfK16EG3Qcx2wKj6eAZLOtqSbVpSz/KOi9yvw/uq2s9+oluXICA==
X-Received: by 2002:a05:6a20:9186:b0:1ee:d8c8:4b7f with SMTP id adf61e73a8af0-1eef530072dmr19652797637.25.1740376341985;
        Sun, 23 Feb 2025 21:52:21 -0800 (PST)
Received: from thinkpad ([36.255.17.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb5870cba6sm18479524a12.42.2025.02.23.21.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 21:52:21 -0800 (PST)
Date: Mon, 24 Feb 2025 11:22:16 +0530
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
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v3 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers
 for EN7581 SoC
Message-ID: <20250224055216.o23dzwimrghbr2ow@thinkpad>
References: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
 <20250222-en7581-pcie-pbus-csr-v3-2-e0cca1f4d394@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250222-en7581-pcie-pbus-csr-v3-2-e0cca1f4d394@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_215223_017444_B5194382 
X-CRM114-Status: GOOD (  23.14  )
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

On Sat, Feb 22, 2025 at 11:43:45AM +0100, Lorenzo Bianconi wrote:
> Configure PBus base address and address mask to allow the hw
> to detect if a given address is accessible on PCIe controller.
> 
> Fixes: f6ab898356dd ("PCI: mediatek-gen3: Add Airoha EN7581 support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 34 ++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 0f64e76e2111468e6a453889ead7fbc75804faf7..51103b7624c09ca957c22a25536dc9da25428e48 100644
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
> @@ -930,9 +932,13 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
>  
>  static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  {
> +	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
>  	struct device *dev = pcie->dev;
> +	struct resource_entry *entry;
> +	u32 val, args[2], size, mask;
> +	struct regmap *pbus_regmap;
> +	resource_size_t addr;
>  	int err;
> -	u32 val;
>  
>  	/*
>  	 * The controller may have been left out of reset by the bootloader
> @@ -944,6 +950,32 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	/* Wait for the time needed to complete the reset lines assert. */
>  	msleep(PCIE_EN7581_RESET_TIME_MS);
>  
> +	/*
> +	 * Configure PBus base address and base address mask to allow the
> +	 * hw to detect if a given address is accessible on PCIe controller.
> +	 */
> +	pbus_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
> +							   "mediatek,pbus-csr",
> +							   ARRAY_SIZE(args),
> +							   args);
> +	if (IS_ERR(pbus_regmap))
> +		return PTR_ERR(pbus_regmap);
> +
> +	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
> +	if (!entry)
> +		return -EINVAL;

-ENODEV or -ENOMEM

> +
> +	addr = entry->res->start - entry->offset;
> +	err = regmap_write(pbus_regmap, args[0], lower_32_bits(addr));
> +	if (err)

MMIO write is not supposed to fail.

> +		return err;
> +
> +	size = lower_32_bits(resource_size(entry->res));
> +	mask = size ? GENMASK(31, __fls(size)) : 0;

Size of MEM region could be 0?

> +	err = regmap_write(pbus_regmap, args[1], mask);
> +	if (err)

MMIO write is not supposed to fail.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

