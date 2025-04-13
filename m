Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA6BC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YhpCUvtZQDpUlxDrFB7Y09wNEJFGtbdxnkmsZK4E90=; b=pkCxpyQVME0RKMPFZ8JZhCmZS1
	YfjwHDOAPVBCa7PuwjpblJMGWsUvJmcMq9QVr4J4l5MhoDcJDr6z9UCqFZ8MI0TOWXSB+1Tnpq660
	RIx6pL8xUiTR3yVu5uMZSd0Oi460eikC+Vbkg9VFcsu0YyMOhDkv0HBsNQzQMBFpVXxVF7d7AmFUe
	DYXyailsRLN0Fj4bInfaCaBlGVCiHSyOkhnh3WDL68VZLHx3uq3Fb0RcBaIB2r15laNynoqKa0j1I
	lI6EdYQNJtRIDwRIRwzOES4VsV3FzaJvrVGkBQNaNjTAigHc3HpQp/cPraZ67/RWj1fELSjqboaGr
	RqwvMd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3zJX-0000000HKRT-3LmE;
	Sun, 13 Apr 2025 15:32:07 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3zHh-0000000HKKa-3Wzi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 15:30:15 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-736c062b1f5so2798213b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 08:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744558213; x=1745163013; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6YhpCUvtZQDpUlxDrFB7Y09wNEJFGtbdxnkmsZK4E90=;
        b=wtTFm0leKjXf59EQDWT9PvX4FHGJim4YIzPjfHRD+VO6WPy4syKhtwzDCUj3+0wPpP
         TkCNxYasRr0dDaIT2P49dHiTaOrmjwjx2nYddz/MndaAzjLC/mfVLv27kdcxrhNZpBMe
         3tNI2t+JKk8jn0TDS9awk/5xKLLX8stn9OikgAMdIp7iYU45ddjjt+YgScNvuHWrsvRZ
         1YKdr3i+qh4ey7EbHtgzcyvhTRigdxW+8LQuoBKkVcQZnhVlB/9NqmmmS8j7AzF6IXaw
         TSdSGzuPhxhwpVYn02PTUJQ/sH5GvXSL3IyGlnwYDjESVosOQ7vbxNRHDHgkTCvdpThb
         eAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744558213; x=1745163013;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6YhpCUvtZQDpUlxDrFB7Y09wNEJFGtbdxnkmsZK4E90=;
        b=jUqk5O0g1kgyou2GeQ91S+Q/StCPOhmjeKHOd5GjrGclIU/wbLuGQwPeQFQ765mYvp
         oVZNPoVZ1/nWqVHLjdkw3lW92BmFDp/ef2QjI400j87N0qkhGMnD5MwMD2m22XibUYyr
         v6MD7BK+J09Q9hyxIvxVeq413MdDSif2Khx8iJ1743KGC2AuAneXFxlSCoLORBK/Lv6X
         35rBS7SRavKI8qVQUzBIAu+pUyzZVtYkM5u0v3mS7c+0Pjy/933335SPgi8YG6amRWOn
         C1vA/T6mG15m7DaILF0WwDGLSTL1MRyTyifbnTKPCL4uL0sp8/FVWO0oysrBUh9iE4gd
         tB6w==
X-Forwarded-Encrypted: i=1; AJvYcCWbZUnyFLs7YN7Rzp1LJeSCXDubFh69UKKFlBBlWQEMve/rbETFw/ZXVpfYDxQD9Q0VkZGIDusRD0VeTuiRVr6g@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz5buSbCiDg6hUmRTbb3mgVIlo9Go5+u8+T469w/O0wJGteWji
	PlQsqOgnf2U+XS8Xvibk2cpNTw+eBk/3Z3CbRD7Ga5s/PQBLC2V6YLxf9n81hg==
X-Gm-Gg: ASbGnctvSejb8+xdHDAxkiENWRGnQYS/7ypdxRVSu+ArcALg868OmrUVpQWIC3WpKjh
	198QFjw0RC65wToJFVouMDL6wCTL8VuO5qGLgeFXRv9ShVSXW3td8kImV59uByZv1ygm/jmGPyO
	ZqiQzqNIyWEJUJkvb/bNrdxkQCXTUVXcMk/4dLqAqzQvbXR5PbnhfX8aNWilUvGxLYiW78M0xHV
	ovOaxvWgdpfX3MBq9dVm2eTOSGYrMBDQFUPjWwFLcCDSzbtf+mwBb9YiSShZQGf2nPtsQOm+y18
	xqig9OlXtLENpIETkf4SkTFPDu2ChpaFXtGopkmEZiQnDLDCN8WD
X-Google-Smtp-Source: AGHT+IE0jyYBaLWROxwZRfj9Ap/rRwqRq+YqVPUJFP4QfIr9YmzNv06dYU+2Uj5cgUZODs640X4qrw==
X-Received: by 2002:a05:6a00:240b:b0:736:a694:1a0c with SMTP id d2e1a72fcca58-73bd12bef8dmr12879327b3a.21.1744558212599;
        Sun, 13 Apr 2025 08:30:12 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd219bf3dsm5245218b3a.16.2025.04.13.08.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 08:30:12 -0700 (PDT)
Date: Sun, 13 Apr 2025 21:00:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/7] PCI: imx6: Workaround i.MX95 PCIe may not exit
 L23 ready
Message-ID: <xajelvlhvoxyt53qdx7dmi4wgp5yvc2hpk5bqbftwklp4ecrhj@gtv3mhb2pyvi>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-5-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408025930.1863551-5-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_083013_903204_8AF99EBD 
X-CRM114-Status: GOOD (  21.28  )
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

On Tue, Apr 08, 2025 at 10:59:27AM +0800, Richard Zhu wrote:
> ERR051624: The Controller Without Vaux Cannot Exit L23 Ready Through Beacon
> or PERST# De-assertion
> 
> When the auxiliary power is not available, the controller cannot exit from
> L23 Ready with beacon or PERST# de-assertion when main power is not
> removed.
> 
> Workaround: Set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.
> 

Please do not post next version without concluding the review comments. It just
wastes reviewers time and is not a good practice.

You haven't resolved my comments on v3. So I'm not going to review this one.

- Mani

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 7c60b712480a..016b86add959 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -48,6 +48,8 @@
>  #define IMX95_PCIE_SS_RW_REG_0			0xf0
>  #define IMX95_PCIE_REF_CLKEN			BIT(23)
>  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
> +#define IMX95_PCIE_SS_RW_REG_1			0xf4
> +#define IMX95_PCIE_SYS_AUX_PWR_DET		BIT(31)
>  
>  #define IMX95_PE0_GEN_CTRL_1			0x1050
>  #define IMX95_PCIE_DEVICE_TYPE			GENMASK(3, 0)
> @@ -227,6 +229,19 @@ static unsigned int imx_pcie_grp_offset(const struct imx_pcie *imx_pcie)
>  
>  static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  {
> +	/*
> +	 * ERR051624: The Controller Without Vaux Cannot Exit L23 Ready
> +	 * Through Beacon or PERST# De-assertion
> +	 *
> +	 * When the auxiliary power is not available, the controller
> +	 * cannot exit from L23 Ready with beacon or PERST# de-assertion
> +	 * when main power is not removed.
> +	 *
> +	 * Workaround: Set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.
> +	 */
> +	regmap_set_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_1,
> +			IMX95_PCIE_SYS_AUX_PWR_DET);
> +
>  	regmap_update_bits(imx_pcie->iomuxc_gpr,
>  			IMX95_PCIE_SS_RW_REG_0,
>  			IMX95_PCIE_PHY_CR_PARA_SEL,
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

