Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696ADC02183
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 05:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vI0iAGnzu7S5oTjzbVtlW1pPkklWEuLHOcVvGs/EI0=; b=PGERZpX6358kbSMW4kxC+47XP4
	OMPcv4IdFHJ0SPTfWWIpfnH2T3MPLbIlNBFPHCWzxZGqaRMWLkl8NDw1p7xQIdgnLG8hYPKFDvonX
	5QlIA7hGZ3IyVze7W+c1Tsqk4KVRtif28fHK6HgPviwuDjcSz5RMMjZwYrQ3BXA+zOpYLITOQoy4r
	4D/TAnX325mzyJaSfL9d3Soqjyf9B7FURcsT2+Of4k13y4hAbbCWccH4tYN3Q7TScopdQt1ZhCAZ+
	JvAN2+kauMTCuw/9VHYUzXPivnUOm8YdD2vZ9wf6u53w6m8NjB6Z78ViCqFsW32de76Lv112tbzPf
	Y938HiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZO1L-00000003RW5-3T72;
	Sun, 19 Jan 2025 05:38:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNwK-00000003RJA-3dd0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jan 2025 05:33:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21631789fcdso56037475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 21:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737264820; x=1737869620; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4vI0iAGnzu7S5oTjzbVtlW1pPkklWEuLHOcVvGs/EI0=;
        b=DFLZ3Z2aX9YXGI97Boxwr+JMbJIIhK/iOpodvGcxgCbC3AVqTl7EfFeHJSufZIfXtp
         YpkG90MVot34axUthBYaaC4ARkfRYxZO/ysi8Oy+iZBJWV2mdnAxP0uSSg19lsuuuuRC
         f3kQwHp1L//vFKtdkDbfjfpV32sLGA+8OkmI4xxE/qkEEKZmzxOi4v2pJtfKtQ13V75b
         lpCFKchZcmrdYviLiWIDUHBjZztySqiQDRBYtIgUXXZctxQYqgIhCibUQSRkla30/zu3
         LD5aw61jVEYzQ9fuvx1JoxoiCfqAGT0rNKK5sEViHJOjcdHEOSNtFyqvuna3isPlKkve
         JUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737264820; x=1737869620;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vI0iAGnzu7S5oTjzbVtlW1pPkklWEuLHOcVvGs/EI0=;
        b=GTK7ow6bR1DJdFhBeBioOzaa8jip0q0zBuZh9JuEcxmol1n7PLd++d+kHTl/M7jn0x
         HIYiwygmc8qMmUp366sFm/3og6XfqdAjAXravve0FDKVLqaNmR+5+rAKUwF61/kmIV3O
         aLGzJY76H0cb2qerjZVp9vFTtQPQANdoRhXpF8SGW5GnfZ2h0SgsXsQPzTKNmFg0F+EV
         V4QCW4o61sniV2ybZq/sLFkCYEDlphOkYsBec03kk4AUZbkxVevalfeWMKijH5oGzBDh
         gNA49Hn741qV9EKVh2hgtdgFSLHq4tbsjDE/L0x4IHeJWbz4C1AqLtdI9KyE38O2nBKP
         C6UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf5C0gDTalfaeqi5TGQgVLqdwpvU4c0Ad4okCx5h7kbeihrNRqfR/gRHEaLvD8Uz1d9iuXgsdzVqYRy1pl5Xaf@lists.infradead.org
X-Gm-Message-State: AOJu0YxOwCEeFQd1ibHiv7KiZlYt6yrvPlnEhynvFmYbwYnuvBYpA0rX
	DWeETUXH+0roSVMZwhESGVjk/AZBTtciMDGR0BI0RigRm5AmUeWri1BzDNUc7w==
X-Gm-Gg: ASbGncvlkJhD1SPm/uYOV566hgynOt5bvhpkn84hZjJknE2zvYONAEDQCF7KcAyVhle
	qvXQsWPbpwjo1u8SoiaPhd86TEWfCIfb3NiYUQx+dDm3+42NqcllHiHadNbDA2NP76MyW/Hms/0
	oVmUaxlU+GyHBDPEn/R+rKuGKYM969hqP2rZGwt1GR5uCwQ3WFeEkAqy8/Y0o1e5uXzBIOK4sTT
	tJPNt73gtcyUXhFrJqivXPxfG33TY3zOPoiHd9Ogss0Euoj7sMEW4yzVGxpZUf2vJcjmRTzvbVs
	QpyqFg==
X-Google-Smtp-Source: AGHT+IF9G2b79a1VfoH6m4pswjFmDLBJqbv/WfnV9XujUXsWzuIF8RjvzijezxL13+j7j+Aah4HtiA==
X-Received: by 2002:a05:6a00:3ccf:b0:728:f21b:ce4c with SMTP id d2e1a72fcca58-72db1b652e2mr14312654b3a.5.1737264819679;
        Sat, 18 Jan 2025 21:33:39 -0800 (PST)
Received: from thinkpad ([120.60.143.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f069esm4625678b3a.28.2025.01.18.21.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 21:33:39 -0800 (PST)
Date: Sun, 19 Jan 2025 11:03:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Udit Kumar <u-kumar1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 6/6] PCI: dw-rockchip: Describe resizable BARs as
 resizable BARs
Message-ID: <20250119053334.tgp7yycky5s6ub2v@thinkpad>
References: <20250113102730.1700963-8-cassel@kernel.org>
 <20250113102730.1700963-14-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250113102730.1700963-14-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_213340_954342_4D2FA892 
X-CRM114-Status: GOOD (  19.83  )
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

On Mon, Jan 13, 2025 at 11:27:37AM +0100, Niklas Cassel wrote:
> Looking at "11.4.4.29 USP_PCIE_RESBAR Registers Summary" in the rk3588 TRM,
> we can see that none of the BARs are Fixed BARs, but actually Resizable
> BARs.
> 
> I couldn't find any reference in the rk3568 TRM, but looking at the
> downstream PCIe endpoint driver, rk3568 and rk3588 are treated as the same,
> so the BARs on rk3568 must also be Resizable BARs.
> 
> Now when we actually have support for Resizable BARs, let's configure
> these BARs as such.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index ce4b511bff9b..6a307a961756 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -273,12 +273,12 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
>  	.msi_capable = true,
>  	.msix_capable = true,
>  	.align = SZ_64K,
> -	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> -	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> -	.bar[BAR_2] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> -	.bar[BAR_3] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> -	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> -	.bar[BAR_5] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> +	.bar[BAR_0] = { .type = BAR_RESIZABLE, },
> +	.bar[BAR_1] = { .type = BAR_RESIZABLE, },
> +	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
> +	.bar[BAR_3] = { .type = BAR_RESIZABLE, },
> +	.bar[BAR_4] = { .type = BAR_RESIZABLE, },
> +	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
>  };
>  
>  /*
> @@ -293,12 +293,12 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
>  	.msi_capable = true,
>  	.msix_capable = true,
>  	.align = SZ_64K,
> -	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> -	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> -	.bar[BAR_2] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> -	.bar[BAR_3] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> +	.bar[BAR_0] = { .type = BAR_RESIZABLE, },
> +	.bar[BAR_1] = { .type = BAR_RESIZABLE, },
> +	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
> +	.bar[BAR_3] = { .type = BAR_RESIZABLE, },
>  	.bar[BAR_4] = { .type = BAR_RESERVED, },
> -	.bar[BAR_5] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> +	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
>  };
>  
>  static const struct pci_epc_features *
> -- 
> 2.47.1
> 

-- 
மணிவண்ணன் சதாசிவம்

