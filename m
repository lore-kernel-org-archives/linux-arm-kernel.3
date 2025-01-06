Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E4EE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioU53vgoNQ0AoVqbDSui1lqyY/iBOmMjiyD6RqrD6B4=; b=yX/JJZxXp54VOnjsDzLdyZYe8z
	ZxqWwoo8OTmkNzAM2+hJSijFUYkPSlSHOXyHFFLS+vfBP6dY7/E4Bss4uu1b5XrZ4n7W9FfYekZoK
	kr+Fxj5QUGtEk2FUkqqJQULZ8mUYcPI3yTPZTzlEXAk5tab05GtUvrsYXRBZo2dzcpjqYlCIjqx3N
	1ePNCTF95R+RHiQfPynnOTFpsPG2/RQR2eqWC1cVDUP1UiAPQcrN/lJp25M74Gzn0+1xX1k96eDwQ
	pj605qFwfJiG+vVoRuipiQ3r2khmblGWN4hCIkh0f2pRj1IgZN/RdIC8vF/Q9YjS9+8DTTHmQE53B
	Kb2Fj9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUps4-00000001wAY-1U4j;
	Mon, 06 Jan 2025 16:22:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpmi-00000001uqm-35EE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:16:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21669fd5c7cso213405995ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 08:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736180216; x=1736785016; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ioU53vgoNQ0AoVqbDSui1lqyY/iBOmMjiyD6RqrD6B4=;
        b=rkukeI/sPyiHA16VbibyaUQDqdHnZjK9oE+G7P71bnrTx9Fxd0ZdAx44E4YDzYpVoT
         Zw+koD0Ig4Fjq0KU5YLxdCc0DEkiHlHKZfBWsemVspVZA/Er8sz/A9xw0HrZVBa/J75r
         lQUat6H1q93i6dwbkOi779LeA4WsGpBedpyKDzMMEJab5Yo3EN4defQU/2/UiNzMzWu2
         5tF6FTqSqEhjGMuZu0Yt0Lk12MIboEb38Bt9Q2lWWh3HyEkti2Pvu2uMBbJsgdRbsqVs
         nWIzbQpWJAJQ+SytQ/8DoKoNsl8ghQT8XNJzvL70dz9jOApMRHjD6VYNHgjDhS+GKTUt
         1U+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736180216; x=1736785016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ioU53vgoNQ0AoVqbDSui1lqyY/iBOmMjiyD6RqrD6B4=;
        b=IZGFBolYze16BRshk+9cVYf2u/HgxAvJRzkfQweZBUxMjTGtSUF+czE4egX7Zu0xQf
         ACu2Tqyz0WcKHah45q0Anq5sGa7XtRNgPRtdiFkBEksO6naJ3VzaTVMfZjq012Av/W4P
         0o9zkFYqI2btcAiglmfKur7xvvZuE1/uO0Uno+UKVfXJ6lCEmJefbJkE3/NhJtk+y41X
         7Fqyd91zqm3CbptqbSny1NqQQpZlNlKTNMd6hRh0bcjULj0a31hwNu3Jsf1AnZLBe2AC
         eZlKTbF/vXAamMr73kW82nwLmr/BzqGhLLfvNI53SUrArt92VSQiX8//AYEibHrmqUCt
         XFDA==
X-Forwarded-Encrypted: i=1; AJvYcCW0DFSmTwOQJ/dUiRaeuwtkzOgGAPNlZpmD+jSosIpOhm6BstBWDSiwsawiT15J/eZt4hWeo8iWQLvJtS00AKQo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/KxHuT0HgBaoQ5YSZpPrpRHCm1/a5XRym3O5JWCgvIToRSUTJ
	+Tss3dEhgK6qw5NDajrvG4O4ePOTl3eYoFkGFyuAcsJat0m+MI8a9uqvE8E31w==
X-Gm-Gg: ASbGncsN7VOq/VSwkjrna+iB/i0I8mJ0BnqC9tYoOT3ZVNtNMLQNtDMIL+VN/tUmyzz
	i+7HkO2oyfEeVkdo5cMYzUugywxNq0leLBwCOfpzU3EtyjamyNhXjLsAaK9mqVkWK6SEy+2rgCw
	c4WEOGlYVopTnXEISqDrCP8LTL2eqyV8TPvOFdS4z2JTqIeHRamq9sY2q0wKigiKb53d4F9fhfw
	SmfITeBkMlfAFRDKl5XVwdJGoT8PK2VjU4CgRZLXxFhhhcH5J3Udf5v31KIEJkyWDI=
X-Google-Smtp-Source: AGHT+IE0TclArATGV1Fu9QzdsMBgtnLWVMtYLElP8xxrkxbbzfBsYBkj0d5S+FS+C4fjsFRPAz2wxQ==
X-Received: by 2002:a17:903:1209:b0:216:36ff:ba33 with SMTP id d9443c01a7336-219e6ebcfc7mr772797425ad.26.1736180216074;
        Mon, 06 Jan 2025 08:16:56 -0800 (PST)
Received: from thinkpad ([120.60.61.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4fbcsm294633875ad.174.2025.01.06.08.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 08:16:55 -0800 (PST)
Date: Mon, 6 Jan 2025 21:46:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Xavier Chang <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH 4/5] PCI: mediatek-gen3: Don't reply AXI slave error
Message-ID: <20250106161639.4bgb7rhokoe22xpp@thinkpad>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
 <20250103060035.30688-5-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250103060035.30688-5-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_081656_780963_C681C425 
X-CRM114-Status: GOOD (  25.12  )
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

On Fri, Jan 03, 2025 at 02:00:14PM +0800, Jianjun Wang wrote:
> There are some circumstances where the EP device will not respond to
> non-posted access from the root port (e.g., MMIO read). In such cases,
> the root port will reply with an AXI slave error, which will be treated

By 'reply with an AXI slave error', you meant that the root port responds to the
MMIO read by the CPU with AXI slave error? If so, please reword it as such to
avoid confusion.

> as a System Error (SError), causing a kernel panic and preventing us
> from obtaining any useful information for further debugging.
> 
> We have added a new bit in the PCIE_AXI_IF_CTRL_REG register to prevent
> PCIe AXI0 from replying with a slave error. Setting this bit on an older
> platform that does not support this feature will have no effect.
> 

But the issue is still present on the older SoCs, isn't it? If so, please add
this info to the comments below.

- Mani

> By preventing AXI0 from replying with a slave error, we can keep the
> kernel alive and debug using the information from AER.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 4bd3b39eebe2..48f83c2d91f7 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -87,6 +87,9 @@
>  #define PCIE_LOW_POWER_CTRL_REG		0x194
>  #define PCIE_FORCE_DIS_L0S		BIT(8)
>  
> +#define PCIE_AXI_IF_CTRL_REG		0x1a8
> +#define PCIE_AXI0_SLV_RESP_MASK		BIT(12)
> +
>  #define PCIE_PIPE4_PIE8_REG		0x338
>  #define PCIE_K_FINETUNE_MAX		GENMASK(5, 0)
>  #define PCIE_K_FINETUNE_ERR		GENMASK(7, 6)
> @@ -469,6 +472,15 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  	val |= PCIE_FORCE_DIS_L0S;
>  	writel_relaxed(val, pcie->base + PCIE_LOW_POWER_CTRL_REG);
>  
> +	/*
> +	 * Prevent PCIe AXI0 from replying a slave error, as it will cause kernel panic
> +	 * and prevent us from getting useful information.
> +	 * Keep the kernel alive and debug using the information from AER.
> +	 */
> +	val = readl_relaxed(pcie->base + PCIE_AXI_IF_CTRL_REG);
> +	val |= PCIE_AXI0_SLV_RESP_MASK;
> +	writel_relaxed(val, pcie->base + PCIE_AXI_IF_CTRL_REG);
> +
>  	/* Disable DVFSRC voltage request */
>  	val = readl_relaxed(pcie->base + PCIE_MISC_CTRL_REG);
>  	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
> -- 
> 2.46.0
> 

-- 
மணிவண்ணன் சதாசிவம்

