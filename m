Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF017C282D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjiljQTviEDPhmhXZgDQ4TTKjdmkRjmGdt5pKh0gNc8=; b=EBWqjmjnh2sDmIPACgD2J5LpUc
	ytW93gqy7qCbnt9ycp68W4Jep3i0qE3nePvPp8EoE/P1EKOm1YjqqRqVWKmrw+A9d9qyjgJ5BbwIG
	7hZ+CXnY1JP4u/9Nbc9AYYOT+Z3Y/4JFriZXc2nn8gbOLzJc/8tJgOBtqMN85TKvSFT4ShqZBYH/B
	YRZIFXHAVTJ8X6GE3X8eIRtSGA8FlOuROLGQDiqyu1B03PQlgNOqrI1aWocOqK5O6g90ukC6EKQvu
	xpurepdbcvf0+tIJ6ArAGvHuqBV6PgKDvLwLVEpWnSHD2nmusu+AcFHDP2Y8fIV23BMxIcYWrV8NO
	KIHVq/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUrm-00000005Mu5-2qyk;
	Tue, 04 Mar 2025 16:11:34 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTsz-000000058L2-3Ez4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:08:47 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2239f8646f6so54288215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741100925; x=1741705725; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZjiljQTviEDPhmhXZgDQ4TTKjdmkRjmGdt5pKh0gNc8=;
        b=yc1/ug4heapxXLmx3c4uGJVPVnW9RD/uujE6ENoaDLktIOVduBnT0kFR8NmmGsYewZ
         eXjruw5HqEnWp4IpGq/m71afU2SN4LaEVCNx9XzmfIr4NLJK6Z//adCmTOUs32wYa1HG
         n8SoqiOfDCojef1QQXW84u3ItsDVUqyHOI0dIqaq4wfrfpmryk+tud+ZoJuYZnRwfpfy
         nQof0aCVagWlAyH65qz8PgsXI4/frvsZoZucY8fdwDg4HAGnO2bMxQ6Q1sbM53w394ru
         ScK6xRkC07yGFJkZLkwSlPk5wU8H2g4rLWhwc3pcG4X3VQJhUCiz6QpYXxSE8PKxQKy2
         zMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741100925; x=1741705725;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjiljQTviEDPhmhXZgDQ4TTKjdmkRjmGdt5pKh0gNc8=;
        b=tB0cw8SFI8YruIP9svllU1DBmy6jDWsKcPoDAxKI9mPtCj4nwgpvXCdHtaGqPIRYna
         10wIjhD8g/d9is9g/F+J70wzf+lrJhsQri3EMjonbU1Xky+NioVmcwVgT6uvZwFYo3fI
         Fzl17CAlA69Ryt7tS6ziOBAayKpLmZ6cZF46HJfhfF/r5/dWSOdY5IPgRHKQDeDy/mTb
         l7RmIP1ypTm121r+a+4cTaP7qC/BBIW1b0FYPmy7G4iuNKRqU1P1Edrbc46a1hsfVSTz
         HrNgARFv5dFnN4b6Ctpl6NPRFTo9LREW77LwqTUqxKhXi5Q7YuLfoxlZSqWr2mzTmw7H
         lr+w==
X-Forwarded-Encrypted: i=1; AJvYcCVO/qeY4SjLmnKyqVWNcluf7MjYs4XK4+D1b2qeQgyHdUi7+Ws0g7j7i9bDeJ3OD7uxFz4UpFbTHaQn3t8xqtMD@lists.infradead.org
X-Gm-Message-State: AOJu0YzABg1DtmRsn2BTQq4DNMiPGAWxfZRUf6cAz++8YJTzlPg39aOs
	4xxPn3ciVVOAtkszJJ411jLLSPOjrELrD5mDMAglv9di/G+WcVVGSxb9AcPxoQ==
X-Gm-Gg: ASbGnctST8Z95ke1rcJtfSwBjd1mscNckff4iJo7qQcTNOo2mgZfkF1RGHQMHlj3bR4
	AphUgDZaPTIb7zybr61TicZp7NSQQw0ZqJZPTbtKvxfP1VPaJqn65QU4D2tVGfQ2ohBkDl9PSPP
	PPn+4yz9Ef69HiTa9HzUWdYr4v+kYdMmqUnSBdfI2PaV5bohb1hyn7oSD2sfiRSGDwwLUKGMlNS
	wza8xhT4xnSeakNhVPBhMy2mU+UNWlxHCIksF8yIP2G3omie2lK/jry5oLDZpAtM8lqeghvmFH8
	M6a2PEcCDvJPZ37H8fk25dqEf13DEo2mK45FzN5KmP/t+My3/+GuxWk=
X-Google-Smtp-Source: AGHT+IHrDiyu7JyyUaCpNZBRWqNi4l6xLSdCaNxkD7VzQLNr/sJguqTX3KZTI2raz26SwVrgNAG86w==
X-Received: by 2002:a05:6a21:8983:b0:1f3:1d13:969f with SMTP id adf61e73a8af0-1f31d13dec4mr15120281637.9.1741100925020;
        Tue, 04 Mar 2025 07:08:45 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af25bfb4a93sm1474563a12.31.2025.03.04.07.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:08:44 -0800 (PST)
Date: Tue, 4 Mar 2025 20:38:38 +0530
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
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/8] PCI: brcmstb: Use same constant table for config
 space access
Message-ID: <20250304150838.23ca5qbhm4yrpa3h@thinkpad>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-7-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214173944.47506-7-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_070845_809458_7DFA0E18 
X-CRM114-Status: GOOD (  24.58  )
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

On Fri, Feb 14, 2025 at 12:39:34PM -0500, Jim Quinlan wrote:
> The constants EXT_CFG_DATA and EXT_CFG_INDEX vary by SOC. One of the
> map_bus methods used these constants, the other used different constants.
> Fortunately there was no problem because the SoCs that used the latter
> map_bus method all had the same register constants.
> 
> Remove the redundant constants and adjust the code to use them.  In
> addition, update EXT_CFG_DATA to use the 4k-page based config space access
> system, which is what the second map_bus method was already using.
> 

What is the effect of this change? Why is it required? Sounds like it got
sneaked in.

> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index e1059e3365bd..923ac1a03f85 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -150,9 +150,6 @@
>  #define  MSI_INT_MASK_SET		0x10
>  #define  MSI_INT_MASK_CLR		0x14
>  
> -#define PCIE_EXT_CFG_DATA				0x8000
> -#define PCIE_EXT_CFG_INDEX				0x9000
> -
>  #define  PCIE_RGR1_SW_INIT_1_PERST_MASK			0x1
>  #define  PCIE_RGR1_SW_INIT_1_PERST_SHIFT		0x0
>  
> @@ -727,8 +724,8 @@ static void __iomem *brcm_pcie_map_bus(struct pci_bus *bus,
>  
>  	/* For devices, write to the config space index register */
>  	idx = PCIE_ECAM_OFFSET(bus->number, devfn, 0);
> -	writel(idx, pcie->base + PCIE_EXT_CFG_INDEX);
> -	return base + PCIE_EXT_CFG_DATA + PCIE_ECAM_REG(where);
> +	writel(idx, base + IDX_ADDR(pcie));
> +	return base + DATA_ADDR(pcie) + PCIE_ECAM_REG(where);
>  }
>  
>  static void __iomem *brcm7425_pcie_map_bus(struct pci_bus *bus,
> @@ -1711,7 +1708,7 @@ static void brcm_pcie_remove(struct platform_device *pdev)
>  static const int pcie_offsets[] = {
>  	[RGR1_SW_INIT_1]	= 0x9210,
>  	[EXT_CFG_INDEX]		= 0x9000,
> -	[EXT_CFG_DATA]		= 0x9004,
> +	[EXT_CFG_DATA]		= 0x8000,
>  	[PCIE_HARD_DEBUG]	= 0x4204,
>  	[PCIE_INTR2_CPU_BASE]	= 0x4300,
>  };
> @@ -1719,7 +1716,7 @@ static const int pcie_offsets[] = {
>  static const int pcie_offsets_bcm7278[] = {
>  	[RGR1_SW_INIT_1]	= 0xc010,
>  	[EXT_CFG_INDEX]		= 0x9000,
> -	[EXT_CFG_DATA]		= 0x9004,
> +	[EXT_CFG_DATA]		= 0x8000,
>  	[PCIE_HARD_DEBUG]	= 0x4204,
>  	[PCIE_INTR2_CPU_BASE]	= 0x4300,
>  };
> @@ -1733,8 +1730,9 @@ static const int pcie_offsets_bcm7425[] = {
>  };
>  
>  static const int pcie_offsets_bcm7712[] = {
> +	[RGR1_SW_INIT_1]	= 0x9210,
>  	[EXT_CFG_INDEX]		= 0x9000,
> -	[EXT_CFG_DATA]		= 0x9004,
> +	[EXT_CFG_DATA]		= 0x8000,
>  	[PCIE_HARD_DEBUG]	= 0x4304,
>  	[PCIE_INTR2_CPU_BASE]	= 0x4400,
>  };
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

