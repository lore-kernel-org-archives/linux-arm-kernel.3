Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84455C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 14:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACNBxPO8ZTcboVmh3x2UF5/k0ixRgW7g046Uv0nuIS4=; b=ariD4uUqVH6Am9qB/zrX86mnIu
	Ogu64SYE9aIGxIH6M8QkLJLjdVvGtMGaV5dX4vZfue0OvApouly9e7P0PTWbv67JV9dzYKvTb1lXC
	9nV7ryzMglEmXENyMEjIotD+R2P3OvvP38abdor7wGDP3BSLhy8RCrWKau8qr+Unv1Jy58B4h8DtN
	1xtcvI4f5+hiRpP6ecNhhLdyL6vsuBfPNfIx108UMqc3BjGRQGCdAdQPO2GHCrOMd4CY7kWvl97zm
	HYqQEKHpEpifedVDwU9IgOJKF55ljdkXu4800AJUK9IiAyWY9gEsbsm92FqzfXGgkqW+HdKmprTUT
	WJOIEPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92no-00000003eAX-43Ev;
	Sun, 27 Apr 2025 14:16:16 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92lr-00000003dz9-3Wwn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 14:14:17 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so4325925b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745763255; x=1746368055; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ACNBxPO8ZTcboVmh3x2UF5/k0ixRgW7g046Uv0nuIS4=;
        b=ecx9dFBdjtovJcsVrHurwLDKllgMjKn/6yaeJj/QZRvJrc2bM7NpKJE7knEUJHMEfq
         QrZi34r/Yg9bcHOkhTvSiuhX+SFK4tQPXkUvD4wesqYJZwg07QOUsBxxcgBSBKtJh60i
         cNxKD84t0REsWOzW+LzmhBSB3cNbGL2Uct8q3iwlzyIqpkapQpEXSBQwd6kMceAgAjtl
         IxL2I1gpem+E8Fdd5vYFLNYXEfZ1K6AEUc0RT8WNKbA0UyXBCSqOScIBHB803a9xSHPH
         utgpp2NTK8Mj0j12CKmpSzLhl4VeEl+OqyF14pfSeSOxSs2/nxSanKnlhE+JWvvkxx3S
         CKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745763255; x=1746368055;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACNBxPO8ZTcboVmh3x2UF5/k0ixRgW7g046Uv0nuIS4=;
        b=cl6xuwsIso4b7bTmqqliVgw7H/Kda+aUpYxbtly88rB7awPmze/oPTg7wonfiHgdDx
         6gsEDw+6LbpyZjKGUdXv2p4TO/bnDUVrGWtSrTZyEun6MdIlGcmTZ3UAwU8KKAMWWjrA
         Emc2LAQ2K0kyz/oAbzXLoIwijR6FnoXkeLvK3JIT+ivxsXmOsZBojZ/HeRcI7XOEkHqw
         akr3wsWALr7RQOH29LiFHuzYwc6MpabHaIGQC6N3jDQ8kfLFqBkPix97/eN1n9mcWFj1
         ImkPMK0v8e3tpJL3/sH7JtNRpvvKixYXon+MtnnxIIriSQjCKtWw+vnx5mcZtBvayIlc
         ukBA==
X-Forwarded-Encrypted: i=1; AJvYcCXoPJiBklbh9V1aq/Us0sW8f8e3t1Z5iywBVmAWrCVEFRBS2Beft7+XSZ5iT5+XGpElfw/EUpvqYgjVnQYfpUZD@lists.infradead.org
X-Gm-Message-State: AOJu0YxkBbgSIrusz7xUMA4tHAStmb5Q2UFBFaTlYy/IfFnWuz2qUyA9
	s9h+bP3rtGQUndv2cfnbV+WOtPtm/tJXZJ7IF6Cp9cCwfXM/C6SHSiAxRWP3SA==
X-Gm-Gg: ASbGncvGmcZyz2nnm74TZT6hvDbANSTipk+LK4DAUV5/69ng5uFyBZ2hEQlg6lTOkgL
	KbaUA/FUDJal2EsvTppordlpL3UwMFlIyDbQVKogBMxDi/6oY1ZR2AjwICLvP6SHsYdWHqg4b47
	a3P7Ak17BAMCUviVtc8EoT3+WNk1H3CXj58lRCSR74sHwcUuec1yKbvEwbTp7+DCEApHWsmeujl
	5YKJMW2mCF1hsbtYR6PWwCyHjbaCd9htmHKnNW3RBDr5WbPq/4+FIuccW9FnIkbVqoyLOp2TErB
	Jwn1P1NI1MdeOuyj4kujkR05U1gl98rJiWFvGI48vFrH4/13+/Oi
X-Google-Smtp-Source: AGHT+IHjWEH0dSAl/SHWrSYJFzYKk/J+piJ5N7UDrAAAZ6BtOMkHd9X5c8VlDHgDtN0O4ARPSiTzjA==
X-Received: by 2002:a05:6a20:c6ca:b0:1fd:f4df:ab67 with SMTP id adf61e73a8af0-2045b64f481mr12361009637.21.1745763254720;
        Sun, 27 Apr 2025 07:14:14 -0700 (PDT)
Received: from thinkpad ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912325sm6480321b3a.14.2025.04.27.07.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:14:14 -0700 (PDT)
Date: Sun, 27 Apr 2025 19:44:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, 
	heiko@sntech.de, robh@kernel.org, jingoohan1@gmail.com, shawn.lin@rock-chips.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v4 2/3] PCI: dw-rockchip: Reorganize register and
 bitfield definitions
Message-ID: <mbgc46teac74goifhuj4fegmtaagfoqkhlm4uid23jurbvi2xa@wnhycs77kk6w>
References: <20250427125316.99627-1-18255117159@163.com>
 <20250427125316.99627-3-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250427125316.99627-3-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_071415_909735_8F4716FE 
X-CRM114-Status: GOOD (  17.85  )
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

On Sun, Apr 27, 2025 at 08:53:15PM +0800, Hans Zhang wrote:
> Register definitions were scattered with ambiguous names (e.g.,
> PCIE_RDLH_LINK_UP_CHGED in PCIE_CLIENT_INTR_STATUS_MISC) and lacked
> hierarchical grouping. Magic values for bit operations reduced code
> clarity.
> 
> Group registers and their associated bitfields logically. This improves
> maintainability and aligns the code with hardware documentation.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 49 ++++++++++++-------
>  1 file changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index e7d33d545d5b..a778f4f61595 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -33,24 +33,37 @@
>  
>  #define to_rockchip_pcie(x) dev_get_drvdata((x)->dev)
>  
> -#define PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
> -#define PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
> -#define PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
> -#define PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
> -#define PCIE_CLIENT_INTR_STATUS_MISC	0x10
> -#define PCIE_CLIENT_INTR_MASK_MISC	0x24
> -#define PCIE_SMLH_LINKUP		BIT(16)
> -#define PCIE_RDLH_LINKUP		BIT(17)
> -#define PCIE_LINKUP			(PCIE_SMLH_LINKUP | PCIE_RDLH_LINKUP)
> -#define PCIE_RDLH_LINK_UP_CHGED		BIT(1)
> -#define PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
> -#define PCIE_CLIENT_GENERAL_CONTROL	0x0
> +/* General Control Register */
> +#define PCIE_CLIENT_GENERAL_CON		0x0

Is this the actual name of the register as per the documentation? Just asking
because of '_CON' instead of '_CONTROL'.

- Mani

> +#define  PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
> +#define  PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
> +#define  PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
> +#define  PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
> +
> +/* Interrupt Status Register Related to Legacy Interrupt */
>  #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
> +
> +/* Interrupt Status Register Related to Miscellaneous Operation */
> +#define PCIE_CLIENT_INTR_STATUS_MISC	0x10
> +#define  PCIE_RDLH_LINK_UP_CHGED	BIT(1)
> +#define  PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
> +
> +/* Interrupt Mask Register Related to Legacy Interrupt */
>  #define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c
> +
> +/* Interrupt Mask Register Related to Miscellaneous Operation */
> +#define PCIE_CLIENT_INTR_MASK_MISC	0x24
> +
> +/* Hot Reset Control Register */
>  #define PCIE_CLIENT_HOT_RESET_CTRL	0x180
> +#define  PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
> +
> +/* LTSSM Status Register */
>  #define PCIE_CLIENT_LTSSM_STATUS	0x300
> -#define PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
> -#define PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
> +#define  PCIE_SMLH_LINKUP		BIT(16)
> +#define  PCIE_RDLH_LINKUP		BIT(17)
> +#define  PCIE_LINKUP			(PCIE_SMLH_LINKUP | PCIE_RDLH_LINKUP)
> +#define  PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
>  
>  struct rockchip_pcie {
>  	struct dw_pcie pci;
> @@ -161,13 +174,13 @@ static u32 rockchip_pcie_get_ltssm(struct rockchip_pcie *rockchip)
>  static void rockchip_pcie_enable_ltssm(struct rockchip_pcie *rockchip)
>  {
>  	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_ENABLE_LTSSM,
> -				 PCIE_CLIENT_GENERAL_CONTROL);
> +				 PCIE_CLIENT_GENERAL_CON);
>  }
>  
>  static void rockchip_pcie_disable_ltssm(struct rockchip_pcie *rockchip)
>  {
>  	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_DISABLE_LTSSM,
> -				 PCIE_CLIENT_GENERAL_CONTROL);
> +				 PCIE_CLIENT_GENERAL_CON);
>  }
>  
>  static int rockchip_pcie_link_up(struct dw_pcie *pci)
> @@ -516,7 +529,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>  	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
>  
>  	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_RC_MODE,
> -				 PCIE_CLIENT_GENERAL_CONTROL);
> +				 PCIE_CLIENT_GENERAL_CON);
>  
>  	pp = &rockchip->pci.pp;
>  	pp->ops = &rockchip_pcie_host_ops;
> @@ -562,7 +575,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
>  	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
>  
>  	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_EP_MODE,
> -				 PCIE_CLIENT_GENERAL_CONTROL);
> +				 PCIE_CLIENT_GENERAL_CON);
>  
>  	rockchip->pci.ep.ops = &rockchip_pcie_ep_ops;
>  	rockchip->pci.ep.page_size = SZ_64K;
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

