Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31DED6DDDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 07:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiTwGr+7x8eq6OawzeIifFURDeSsU/2WLtRWg3Kwch8=; b=hWL4r0O9HKCmPAo8vrvUXgOqj6
	xChU6PSLHoNH3D1xR9wDcMiwlTBUItEaUe0ydla1OIQuUUrK7RI1MPqMiMOBScOu1uPGyedJxhU4b
	1MuDFAIZunsMFWYvbrIWEFKRyyGlmOoW8Ie7exDp2amdUi/gAWZiWcUIoXIjJClXpilBxXQKZ+Giu
	RMjXG1sC6phkv93/nTFuxjS92xi0zjmoothSk5jBaRg9DelwSXf5u2aIOEGaOjQYA2/0I0wOlITiO
	WsBl2z0rdgdr7y/+USptu5GKiH5F4RctyIp4rcpSMSPQjyUGsjlAmzErfbJ+JrK1p9aJ4ZwT+cuHC
	3o0wy8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqZs-00000001tk1-48MM;
	Fri, 15 Nov 2024 07:17:12 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqYy-00000001tYO-2t5F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 07:16:17 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-72475e29578so372645b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 23:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731654976; x=1732259776; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LiTwGr+7x8eq6OawzeIifFURDeSsU/2WLtRWg3Kwch8=;
        b=aL3wsE2sXjjd8XY4EFuKcV4WKV934iihpoT5YMQTtkYsYP4V7DMvv42r4OJDTO2AMU
         6fo7ktH+98o/CGne8Wa2BvOxlB61L5e7PGPVqnMoUFbHWasFI99mn1f6MtuXj8hYZxLH
         egRQNZB+UX3Fc37Ha43C1Y5ggzZulY9YG7ss6TMx9X69Ke15+dbc0Dim8i2IL7F1JQWa
         FXz24PH3KG2Gta0fhsiBgkqRlGJ0v7ofcOKWI27pZEoVnxGNvHeQGKVaMVOs0zMr1O9I
         URjXGyzAYHIStKLBWtg917vRqpdeDkr9BlOQyheB9LWtr++oH90OfApo8jdsUMeNvk79
         yr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731654976; x=1732259776;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LiTwGr+7x8eq6OawzeIifFURDeSsU/2WLtRWg3Kwch8=;
        b=WDab/jO2PRIB6y3PGbIu1ZzzHdheW+t0bR+bmbUf5AqqzMNt6RLfJ/1QgDxrLdPLPP
         z6ZXAIj24sHUrSeAfgC7Ir365a+H3f9kBU2K+Zyj3Z+IVkjA36z/zNafLWNj0ejAsWcP
         wU3H1OnieU3go+KFsKXSlUYuLW+SjcmVJU4Otwagd60Hb2HvbCcDIDs1Pq/s6TLFdsj2
         N+bQsEsiSAAz0RbIfAgN2jxNrECgpSjP13aL4DIqM8ZPi0ktJ6hJ43DJwMFQwCeM6zft
         CI72UDZ4S9dhdAGEcH79g7y/rTGmuCe0ZvgY58MHwGAgVu2nPRh//NN02XA+AcI068xi
         AloQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTIU8vIeNnxnoUCZGZTwC3Rie7KqVY7Vdt5iv/N+o753Sxpvgb31iQ9hkgGCbgXfSCroU3/0fZ0K6i5qmvk7wz@lists.infradead.org
X-Gm-Message-State: AOJu0YyWxf/KpSdUGRKdTgziXBbCvgBQ9NYk+rOVCnXOeLKHjp+vrWM2
	8xbcgKPPEEm+DnZusgxI2UmVXvCwelrHrTPytGOWUMS3S3TD3krtnUw1fJZO2A==
X-Google-Smtp-Source: AGHT+IFUGFVKPN4BKyWiSKTekpGzXkV6s3Ozr7ZGuoQIwQMzFc7uRDlF/nAJCTwPmnCNLPy5shFpNg==
X-Received: by 2002:a05:6a00:c91:b0:71e:693c:107c with SMTP id d2e1a72fcca58-72476baf03bmr2003025b3a.11.1731654975730;
        Thu, 14 Nov 2024 23:16:15 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770ee9dfsm718640b3a.9.2024.11.14.23.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 23:16:15 -0800 (PST)
Date: Fri, 15 Nov 2024 12:46:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/10] arm64: dts: imx95: Add ref clock for i.MX95 PCIe
Message-ID: <20241115071605.qwy4hfqmrnaknokl@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-11-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-11-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_231616_730884_DD6E3A74 
X-CRM114-Status: GOOD (  16.63  )
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

On Fri, Nov 01, 2024 at 03:06:10PM +0800, Richard Zhu wrote:
> Add ref clock for i.MX95 PCIe here, when the internal PLL is used as
> PCIe reference clock.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 03661e76550f..5cb504b5f851 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1473,6 +1473,14 @@ smmu: iommu@490d0000 {
>  			};
>  		};
>  
> +		hsio_blk_ctl: syscon@4c0100c0 {
> +			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
> +			reg = <0x0 0x4c0100c0 0x0 0x4>;
> +			#clock-cells = <1>;
> +			clocks = <&dummy>;

What does this 'dummy' clock do? Looks like it doesn't have a frequency at all.
Is bootloader updating it? But the name looks wierd.

- Mani

> +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +		};
> +
>  		pcie0: pcie@4c300000 {
>  			compatible = "fsl,imx95-pcie";
>  			reg = <0 0x4c300000 0 0x10000>,
> @@ -1500,8 +1508,9 @@ pcie0: pcie@4c300000 {
>  			clocks = <&scmi_clk IMX95_CLK_HSIO>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> -				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> -			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> +				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> +				 <&hsio_blk_ctl 0>;
> +			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
>  			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
>  					 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> @@ -1528,8 +1537,9 @@ pcie0_ep: pcie-ep@4c300000 {
>  			clocks = <&scmi_clk IMX95_CLK_HSIO>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> -				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> -			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> +				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> +				 <&hsio_blk_ctl 0>;
> +			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
>  			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
>  					 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

