Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C374DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 06:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+/uxe3dxQ0IvY8GTZXqERCIfLVfCSKGis8G08eVtFY=; b=NN/thFv7WNy5CH+VKfDqaqZmBR
	vAdXph4tggVM/BvIMwUq5RQbJDfD2mvDRzamiNBXikyOAcPFnVEL1Mm9hS/x/1f3HYbK7nka42xil
	R7pT86SzbE+VtD1wyJ3KmWK33OpGd1OtgPPCnnPgkV7AwzOz1h9el4LSYP+FbjGHBEG9mEOq8noq2
	Y9ymj+LbghK708mBxyNJVcEQBQ0w+sohflaj+QmgaN8nfCdvNxyeJa4t0QvjPdykRzrJHBhnW+leR
	O+DN+YqD1xAxmCHdsm/P0dQCeeL+sS+4+MDdBeJ6us8RJtgcVB5tf8Q5NYXKr1GM3Bv9ZsFSWcCxo
	3ey/38eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLFpr-00000003R0j-3fcW;
	Sat, 31 May 2025 06:36:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLFnh-00000003QkD-3veG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 06:34:39 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-231e98e46c0so27206245ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 23:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748673277; x=1749278077; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G+/uxe3dxQ0IvY8GTZXqERCIfLVfCSKGis8G08eVtFY=;
        b=Lbbravm4/Zfri2vLCD8nEIVc5hCkg3RC/g9wn5Wiu6r5O54uWeHj3y8zjPoTgKk653
         7LAhQJvGfN04A3piRQ9UCxP443lGmbkxla4l5IM8c80jwWnyRHcD6LdStOE55PZnsxcG
         ZQd+GpXIq/ZwSx2xheuciUzAGJepc8h9jCgWDl+GbAoC9cgdtrq11Mgrp9++IHY19wcj
         F1xckyIUdLJfzs7c5o/yq5LeH/XtGCXb3kGPeAA2oOioMueXUUSxNEIksnJXYu5weqPu
         x4aOMXTLXvl9A7YIOF03IjVR3QJeqt3YnkLQrR3XC943Xv4Xu/MVSGpFDDOU1BjR2kLm
         c/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748673277; x=1749278077;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+/uxe3dxQ0IvY8GTZXqERCIfLVfCSKGis8G08eVtFY=;
        b=OBe4E3Itt3eqk58egxgGESpKgYZ6Ca/rYQNlXMltpg+39kVxLe3wbG6035xtfeMl26
         VwiwOzo6rIhoyp/n+Huz6EBxUpPFoppBCK96QugNoshtXICd33kf6z+o1RVfIgUbySq1
         i7JDeE3FL6d8pnSTfTNx37n8i1qwEyqn1wP0algAgTyC+zNBXZHutk/PvLbdEvEDdyg8
         O0jzBtL46N42zWMeKPhuqbgmJgfdUFBCGDdsl5hKztF1xYByLAdS3+GA4tNYRtO3Tw+H
         8QtoxI8mCK2miiF1AZdG71hQSZytcDxBQoNyBuz+nvlmlv6/keeGq/8KPO6PZIB+UMme
         jdGA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Uh3aukOJu4eyGgfxURhpKf9ucEaPYGMuIuiZVqGGrQjDCKMvcKxIPn7lBN6DE7vp7YA8oXbmcFN8GtH8F/4Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyBz/oiQ1C6HFV5UlbYbznQv0lRkQQ4Prc8nQ0J3pNz94TXqNQB
	KUaOk/5TBQwnFskBJl5AWpLGCaoruU9shHsO1XKsHC/hbVH/KwqdLe+KxoYnQS3Dww==
X-Gm-Gg: ASbGncslu2uoWNtjEAxaDzmFBi33W67doVlD+WABTj4pj6nfeTETkd4IN/MgH2poC1p
	iZ/hdsTEAQ4Y6rzAPiXY6L+labyEDlvG7Ga73NTnYHLgBhrTAJGL/MwCA6vQ5Mtb7e+Ox+HsIEf
	22gckgMe/f0AYga0PPeVU1U3efm1VQgnDLVxIxtceX1hxuyaaO7czQcB1x4EpoCqzhGPuJhmPGp
	O6//rg7tLPJ1Z2jHuKtErNfHFxjAdeOyhc9nv6WnChydarcIces8GpTvxOHoh/5OYJw4mVo26C1
	TPRf5SKcVc+1uEu1RX82ZeAzxxwrxSG0XrVNs5Uqt2aohoLNAtkZ4T1KN0G6kw==
X-Google-Smtp-Source: AGHT+IFsJ4Pr1gW54/1Cl9dqqBQZUvBXxBB0vHhUwcZ3GY3SQHAiNtVzM3wVxEN3AgJfUEaw7hdMIA==
X-Received: by 2002:a17:903:19c3:b0:234:c5c1:9b70 with SMTP id d9443c01a7336-2355f6de0edmr14474355ad.17.1748673276944;
        Fri, 30 May 2025 23:34:36 -0700 (PDT)
Received: from thinkpad ([120.56.204.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bdd0e9sm37348675ad.74.2025.05.30.23.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 23:34:36 -0700 (PDT)
Date: Sat, 31 May 2025 12:04:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] PCI: brcmstb: Use "num-lanes" DT property if present
Message-ID: <g5rhfbvlx77imub6nn2bx2q6zest3hgsmssjdjrpwqhs2wuan5@uo2ca5asxbpe>
References: <20250530224035.41886-1-james.quinlan@broadcom.com>
 <20250530224035.41886-3-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530224035.41886-3-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_233437_993148_3F9BB087 
X-CRM114-Status: GOOD (  21.80  )
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

On Fri, May 30, 2025 at 06:40:33PM -0400, Jim Quinlan wrote:
> By default, we use automatic HW negotiation to ascertain the number of
> lanes of the PCIe connection.  If the "num-lanes" DT property is present,
> assume that the chip's built-in capability information is incorrect or
> undesired, and use the specified value instead.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index e19628e13898..79fc6d00b7bc 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -46,6 +46,7 @@
>  #define  PCIE_RC_CFG_PRIV1_ID_VAL3_CLASS_CODE_MASK	0xffffff
>  
>  #define PCIE_RC_CFG_PRIV1_LINK_CAPABILITY			0x04dc
> +#define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK	0x1f0
>  #define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK	0xc00
>  
>  #define PCIE_RC_CFG_PRIV1_ROOT_CAP			0x4f8
> @@ -55,6 +56,9 @@
>  #define PCIE_RC_DL_MDIO_WR_DATA				0x1104
>  #define PCIE_RC_DL_MDIO_RD_DATA				0x1108
>  
> +#define PCIE_RC_PL_REG_PHY_CTL_1			0x1804
> +#define  PCIE_RC_PL_REG_PHY_CTL_1_REG_P2_POWERDOWN_ENA_NOSYNC_MASK	0x8
> +
>  #define PCIE_RC_PL_PHY_CTL_15				0x184c
>  #define  PCIE_RC_PL_PHY_CTL_15_DIS_PLL_PD_MASK		0x400000
>  #define  PCIE_RC_PL_PHY_CTL_15_PM_CLK_PERIOD_MASK	0xff
> @@ -1072,7 +1076,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>  	void __iomem *base = pcie->base;
>  	struct pci_host_bridge *bridge;
>  	struct resource_entry *entry;
> -	u32 tmp, burst, aspm_support;
> +	u32 tmp, burst, aspm_support, num_lanes, num_lanes_cap;
>  	u8 num_out_wins = 0;
>  	int num_inbound_wins = 0;
>  	int memc, ret;
> @@ -1180,6 +1184,26 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>  		PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK);
>  	writel(tmp, base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
>  
> +	/* 'tmp' still holds the contents of PRIV1_LINK_CAPABILITY */
> +	num_lanes_cap = u32_get_bits(tmp, PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK);
> +	num_lanes = 0;
> +	/*
> +	 * Use automatic num-lanes HW negotiation by default.  If the

"Use hardware negotiated Max Link Width value by default."

> +	 * "num-lanes" DT property is present, assume that the chip's
> +	 * built-in link width capability information is
> +	 * incorrect/undesired and use the specified value instead.
> +	 */
> +	if (!of_property_read_u32(pcie->np, "num-lanes", &num_lanes) &&
> +	    num_lanes && num_lanes <= 4 && num_lanes_cap != num_lanes) {

I think you should drop the 'num_lanes && num_lanes <= 4' check since the DT
binding should take care of that. Otherwise, once link width gets increased, you
need to update both binding and the driver, which is redundant.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

