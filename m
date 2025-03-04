Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C756C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fX1Owrn1AszAewAaO9ydb9Cq7XmK0rDK8G2P8SgcArg=; b=bif+rSf/KNfw3ozWhKWaDjCKzW
	xhiRUQ7ut82P7txo29WvBdAp6+DDNUMSxUY6u5D43zolFdz/QW42sKWQRLGiGC9rftEYDylwwkNai
	BGp3DKV819LTkNYBhjjtrqAFJDZ6c9VFBz2UXWU/LUO6VepljIvVCbZqTk1ViU585KWBsKldPYM4X
	7n7xuSXvcooxnGct99OnKXeU5MfCMmSOdZ1qzn/69Uc8x1ZjWfESUKoun7KnNDGaKoxpwTlz3G9lG
	tlLWcO3tOUyqFm3cF4k9jeOK0U4/GcPZluWgWoc99wig90QTeN6+wna3Ljd9tDcr2wxhDNR3EzAv7
	c1/xHkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUup-00000005Ndt-489G;
	Tue, 04 Mar 2025 16:14:43 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTfF-0000000553h-2tnV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:54:35 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2235189adaeso94350585ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 06:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741100073; x=1741704873; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fX1Owrn1AszAewAaO9ydb9Cq7XmK0rDK8G2P8SgcArg=;
        b=KPQNjJehL8VksOtM92ho+ccjTzA78HsSI8JbqaVjXTBeXV7H519cxux+z/ikiD4Qn2
         2j/uyCZZOhbAWEOEScmGooBkmCA5tRBCzyfaJftC1jKo0CsxqmfjSgpg/FHdvEIYrWlB
         bbrTETu/2ZhvcPRWxJY8G02oVMlxkvwgbTnA0LW2cpE0eVV6aKKESklXDYVkz5iBjooV
         D4WijTRsqqTBhSqPYztoSSh8RE1gXRoZeszQR1FwpYnnfKdy7YUj0QUzmAI0w4MA9I3w
         vaEGvHQoU2w1EeeC1kGT73pNLVDWyNPKJJ5Gpph8nwu1yVk+5Xl2LUPYElxbCY8o1npH
         1TTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741100073; x=1741704873;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fX1Owrn1AszAewAaO9ydb9Cq7XmK0rDK8G2P8SgcArg=;
        b=PylerDowR3zcVcSLXlvqJOBILtcmwNCKXx9n5UbITRpkknfx4mvHCqse5S7XK+wr+v
         fx23hEmfe7xRpaXZzXtwtsUujlylnkg49z4DS9j6WEFFOO5D7lsPjNQ26NgZusWw1+OA
         vJtSJ7Gggm8+DpDqwKe3JhBigUHb8tpjyMiW+CW5X6uDhYdJwvnKjZSD31NogMhu3eLS
         UCDs+vqwiGo6ed4uk/C4NAy7VORelnqq1zjqwIdNaw0o8T5kb2cTNzQXiNdxqyewOIcP
         5hhMGsv/+/HFyr3vEv5L3CIkgXQBBP8qxoF+Z9qIrg/zZ4lb49fTCaHCdJhEmNGYYlLx
         4DAA==
X-Forwarded-Encrypted: i=1; AJvYcCV2KsU1dOleOnxHT9mmQ9uJK7yBmoVhyR8JAN7VIq1tLHUtIOjKpJyQIA1D44Y2Irxu7zsd8sdlv7T9N3eOqXr2@lists.infradead.org
X-Gm-Message-State: AOJu0YyPSNzGyT9QgaxkTgBEwcUxV2JOAzeEVy2HwGh90zhcwMtg0T7a
	W5ibi7z3stHv99BQ8rW7xrlebsHj2lMD9sXpvu/MldkG+wVOtLdwjanTZ0Az0xnRGQn6qx1ntMA
	=
X-Gm-Gg: ASbGnctIur44XObWZ01YaeD3xXT4NsuKB7rMp/rBgZSShpdKcm6r5/q8I80QffYMDeO
	NG4eT3+prjICHvKzfW2LKeDhEOBrSFShFpcQyxlgyDNCTYYNLH/d3v3JD3EG91PcxGmP7upOVMY
	w6dDOcfERmkz0iPeKTX+A6+R3NS50fgoW0xMF+Ztykr9AQW7/t/vD4/egeMGEWlUWGyoGcmcK28
	LyqYk+oI225bJQn8PFhq9AuW2mM9nEdG29ofdLDjnTyOubk8xcithyGyTMzQge72MpKvWbVJ0sj
	wXLxWheELACqsd3eMBucxwwxkVz8wefqNF05oYwoBCTu6soP2jpfAH8=
X-Google-Smtp-Source: AGHT+IFOAFZRsvKQ5dtlmg9hihcEFbJufYkzxSZoZRlfkF27sYRSEvn0Q3zH2r9qpC5gI/Bx2ZfWFw==
X-Received: by 2002:a17:903:2447:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-223d9137f1bmr50389425ad.7.1741100072628;
        Tue, 04 Mar 2025 06:54:32 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223852162bcsm58948015ad.8.2025.03.04.06.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 06:54:31 -0800 (PST)
Date: Tue, 4 Mar 2025 20:24:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Jeremy Linton <jeremy.linton@arm.com>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/8] PCI: brcmstb: Write to internal register to
 change link cap
Message-ID: <20250304145425.rayj5zowyxp7s4se@thinkpad>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-3-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214173944.47506-3-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_065433_746725_D7B2BC0F 
X-CRM114-Status: GOOD (  19.77  )
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

On Fri, Feb 14, 2025 at 12:39:30PM -0500, Jim Quinlan wrote:
> The driver was mistakenly writing to a RO config-space register
> (PCI_EXP_LNKCAP).  Although harmless in this case, the proper destination
> is an internal RW register that is reflected by PCI_EXP_LNKCAP.
> 

You mean to say that writing to RO register doesn't cause any issue, but what
about the link capability not getting updated? It is a bug nevertheless.

> Fixes: c0452137034bda8f686dd9a2e167949bfffd6776 ("PCI: brcmstb: Add Broadcom STB PCIe host controller driver")
> 

Same comment as previous patch.

> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-brcmstb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 64a7511e66a8..98542e74aa16 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -413,10 +413,10 @@ static int brcm_pcie_set_ssc(struct brcm_pcie *pcie)
>  static void brcm_pcie_set_gen(struct brcm_pcie *pcie, int gen)
>  {
>  	u16 lnkctl2 = readw(pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCTL2);
> -	u32 lnkcap = readl(pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCAP);
> +	u32 lnkcap = readl(pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
>  
>  	lnkcap = (lnkcap & ~PCI_EXP_LNKCAP_SLS) | gen;
> -	writel(lnkcap, pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCAP);
> +	writel(lnkcap, pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
>  
>  	lnkctl2 = (lnkctl2 & ~0xf) | gen;
>  	writew(lnkctl2, pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCTL2);
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

