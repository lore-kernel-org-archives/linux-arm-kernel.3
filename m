Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB8AE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbh70FNu5lHAZ2y3qFziORwGTSyKcYnNaY2OZrOn1ZY=; b=INF+z++lzCSMfzU954s8ULXK3F
	2r9zAiQtw0IoD/cRqzkT1+GYPrBYu1fBnNmeOFboHEYOstqlm0+l+W2cayMbsSbdkZmrGeOeLZmsR
	0eHmDsXRKoAsIeHtJj1reArifJNMhhf61b6UvrEb5+AslMNlkyXal7ZeBJVxt5H/KAov2FPRwRcF3
	SC3jOIlg3oBxwdWdfhbf9z+MlBgXUadKeJDlbzehA+T97znFZbV77DHbPZ50bqNRm29g9ZslS5vUx
	tVFWoLx2Wo7igtL8pNnAHjBIrtvqWJn79j5iX6c0pORYIgBDo+pC0IE70GIRHi3sj4k+Zva4LX6LE
	gfZKXGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpqu-00000001vrw-1CGY;
	Mon, 06 Jan 2025 16:21:16 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpg8-00000001u44-2BEv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:10:09 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-216728b1836so190509105ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 08:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736179807; x=1736784607; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cbh70FNu5lHAZ2y3qFziORwGTSyKcYnNaY2OZrOn1ZY=;
        b=adtHq5ST5YKdrbeJpoHM0MC1xETJqTsbKng/4zJIphKzP/tHHQQVPHMxZwVh/UE9wh
         J5Jc0lhfq8aZ19IsAmkStF81oyv0VyABdNll8fh/Z9X4nn6789UBngIlWE8IRvrHMDcU
         MHPgdtI0clAUubxioiF4qVru7lbsKDe5/9Wg2sfwhdXtkG3Gq1NupvS7w+AMjsTVGgec
         WUlngXwoO/wB6vRQhoKYbJh5rPqeURWTQG7n25wDUcwlB4NhHnuJoyAISqKGuWMs1ZmE
         A2E9MV1YSe+mc1mOZjmmkuI+kufYci2vqqsTBgSykI9WDy3DpkSNKCIiEbtrE2lmU7SR
         ywHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736179807; x=1736784607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbh70FNu5lHAZ2y3qFziORwGTSyKcYnNaY2OZrOn1ZY=;
        b=Ohesv8ecs3zN3NSltUCPoMs5OVysxo7LViRt9uRLWdOG1TNEmWXbNkMGUMggfopcIy
         0NvM4O3KFwNYl/UmBibWnUXmk54ai47kz/ACABXYhPNNKgQjjhJxMHQO4hbsBx6vSf64
         RogOy3/vEhTpESRza1niufAcqAz4P47Boqi36V7FSbyuliMLm7Fveumic5EFhoWUhBgX
         h8IQtT5VPOzsnF/KPFg6/tsp/oG7gpzmXnMM3OCzcaWr//ST6FVWs5wcSdbmiFSoIPd2
         kZmKNS5z7MJQtaP4fSfl3Zud6I1nrnlqUVFoQx7tHyVKHZR/drEgHrwqNVW1lvD9yhwz
         h+gw==
X-Forwarded-Encrypted: i=1; AJvYcCXELI/XGPeDIz+pEnsMQdPNIjXAx/j9O5DHgalRhAy1SCBrZpatta//OOqa9cSVciURb0yXJdOvG3yoxe0mt1F5@lists.infradead.org
X-Gm-Message-State: AOJu0YxzQRckG/IQy8lIEtp0xucBRPf2C9ZxddZSemQmguxk4o/Ub4br
	cYh4JejA8G1lGPK6Cs7ZzwpctXyknwetrxYH7F7l1249BvFupVGRQnhFVi9RMQ==
X-Gm-Gg: ASbGncsc9YKwSiZguHdqyc89TmOcebZHzijlMz38XFdigrDnDg1Xb+kw6zI2eVCNdXL
	J4bO1TCyC1CVj2WJKCJgs+S6DCG/JV3VIm91YL724KQQfnQFeN3ap+5026EAsPqc8Bu2rDdWFVG
	fQNELwYhnByV3j8aoCwvCZSoHLxAKqYZeo7p2hr7uQrnxnp6kYfOkLeKhsNiaq4A6ogVVuzRdUa
	8E9rbW3fc0TcUwvQZYhp034HdUjHZXJL+qol0LhPtJKtDCxHwj6vlK397seUqtg0Eo=
X-Google-Smtp-Source: AGHT+IGWek+UwLvA7jIxaMXySnHt1P9khnFX7cna7RBNBSt0+o7sQhOK9pqBW8ZD3DQlUzuguSWTWA==
X-Received: by 2002:a05:6a21:2d04:b0:1e1:b224:74c0 with SMTP id adf61e73a8af0-1e5e0815ee4mr94198810637.38.1736179807211;
        Mon, 06 Jan 2025 08:10:07 -0800 (PST)
Received: from thinkpad ([120.60.61.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbafesm32377915b3a.128.2025.01.06.08.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 08:10:06 -0800 (PST)
Date: Mon, 6 Jan 2025 21:39:50 +0530
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
Subject: Re: [PATCH 3/5] PCI: mediatek-gen3: Disable ASPM L0s
Message-ID: <20250106160950.uutcgs2vqnuve22k@thinkpad>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
 <20250103060035.30688-4-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250103060035.30688-4-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_081008_552320_E225EADC 
X-CRM114-Status: GOOD (  17.81  )
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

On Fri, Jan 03, 2025 at 02:00:13PM +0800, Jianjun Wang wrote:
> Disable ASPM L0s support because it does not significantly save power
> but impacts performance.
> 

You should disable ASPM only if it is causing any functional issues to the SoC
itself. For other reasons, users will use the existing sysfs/cmdline params to
disable ASPM based on usecase if required.

- Mani

> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index ed3c0614486c..4bd3b39eebe2 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -84,6 +84,9 @@
>  #define PCIE_MSI_SET_ENABLE_REG		0x190
>  #define PCIE_MSI_SET_ENABLE		GENMASK(PCIE_MSI_SET_NUM - 1, 0)
>  
> +#define PCIE_LOW_POWER_CTRL_REG		0x194
> +#define PCIE_FORCE_DIS_L0S		BIT(8)
> +
>  #define PCIE_PIPE4_PIE8_REG		0x338
>  #define PCIE_K_FINETUNE_MAX		GENMASK(5, 0)
>  #define PCIE_K_FINETUNE_ERR		GENMASK(7, 6)
> @@ -458,6 +461,14 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  	val &= ~PCIE_INTX_ENABLE;
>  	writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
>  
> +	/*
> +	 * Disable L0s support because it does not significantly save power
> +	 * but impacts performance.
> +	 */
> +	val = readl_relaxed(pcie->base + PCIE_LOW_POWER_CTRL_REG);
> +	val |= PCIE_FORCE_DIS_L0S;
> +	writel_relaxed(val, pcie->base + PCIE_LOW_POWER_CTRL_REG);
> +
>  	/* Disable DVFSRC voltage request */
>  	val = readl_relaxed(pcie->base + PCIE_MISC_CTRL_REG);
>  	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
> -- 
> 2.46.0
> 

-- 
மணிவண்ணன் சதாசிவம்

