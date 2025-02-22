Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC550C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 16:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6nKOO+ujfvI6kP5NRUFljlra8jwiaSae/QIEC4vlMk=; b=Xvg8ubD/WvCKp35uesvYM43u84
	YsNskRAwOiWtpUWK2DLMOfKML288TrX5ekU93ADA9MoIgWPISt7LBHoWjJ6wn0AFrcZ2fcZaLWo2e
	S42zzrnmOFJjYo0bs9NF52F3KfyzdOssxHkBIErPno4iFDovWKDxvb5aUfZuRQl+nRhHA/0SHDozZ
	mftpsyqaRepN3gN4LWGr0tI7slY84u1KOMTc65merObaVEnbMz4S3ocTwZfzfuUfYY1mABR/cPd2T
	8cWPBcdNdsr0r62yZY8e1EksVQDILe6bHdCWo0JNrUUUWcmmma5FBSiRrMHF3PWI5Io3e1vhltR1u
	fEZWR/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlsD3-00000008LJt-0f5G;
	Sat, 22 Feb 2025 16:18:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tls3Y-00000008KHg-0Vjo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 16:08:45 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2211cd4463cso61530045ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 08:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740240523; x=1740845323; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m6nKOO+ujfvI6kP5NRUFljlra8jwiaSae/QIEC4vlMk=;
        b=C2Qp7VIcAr8g6HG9TTQMBA7Hw6FQsMwLCy95L2QW86l6rD8YZnHByreBvdMgJfoJcd
         TnEjQ15HbaMCHnJLuM9JCzeL2I65rbJDGWJdv3ZTEXCCYq13MBDY0orWwg/BBhMcsy36
         b39ut1XRqNXD+P60dUr6jAaWS+RjdJ/dkI2Bnn0pWBZtswW5Z0yTbm8WayfHpz5VxnI0
         VL/dl77AMjiGlCLdUI5YOvmM1fnEolrmP7CKQLeMsyOT0TIJRC7+Ps7xB11xjtSNqHEx
         DXbCNfwXKkJFeZEhZO7Uipu4bzTnCObwKyAMvg0RGMke1CWkSS/OO00OZt3WpQzx2sYc
         uWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740240523; x=1740845323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6nKOO+ujfvI6kP5NRUFljlra8jwiaSae/QIEC4vlMk=;
        b=OLd0Lc1RBzmM73auO1uW8mzjqBF8q7LGqlBCIcT/fyh94EEjWqD7aVMc7NdguossCq
         3bgeGT6fwDWnphK9qxOjX0TNkeOtcNAbQxSv9jdkipHbYv4+uxshSI57AcYGz6ymWGJy
         vLZ5TWvu3WNnKZTm1U+J77ibD4o53KaEE+TCViXuupgl5krJ8aocvqs0i3TD3hWhpV00
         BAOiaAcYoXA0k/i2/QYka1u1OZ6HLNYwcK3HZMt98A1+D5o9XTe/FIAQlw/s2zQh3rHM
         qGAQbQCqq9LvDwSPh2VomaTZn4RHO5ZLmW37vltIyWdtxZkuMeitCZ6Ab1GQvR1lxAny
         ozjA==
X-Forwarded-Encrypted: i=1; AJvYcCVaQWEQlj1sjBmeVD5p2Jfg7uwT/TAkZPYWp/Apvnw2hM+8DBKWS7/gt8yet8IczfiVzMHYeWiTtsFORC+8TJBx@lists.infradead.org
X-Gm-Message-State: AOJu0YwVuiQyET4NvJoe6jf1jS69Ek/2cPPycsVnaMITc2oZQh8TGdxb
	Dgd4BexOWACkTeAlSYw4VsgnXRt/IqeE7CcpC50gRfCPExMW0xaDGplMEkD/QA==
X-Gm-Gg: ASbGncvC4hr02GhHTZ4fdxbBzE6cM/44fVqM9qmj7On1nKXJrOprgm1uEK3S6aHmV6E
	MSpXpzlwdJu5zBchpYLVjZyemZDxJT16gV2NchWWR2H3UVm5O+2gYnTHrQyJgD/Q2WbB+Wcj9TL
	Bb0ynXsmyxDC5lPjNL+HkoMGbglGjAXhUpJ2gBmZwEKwZQnhvlkTq3EP9YMz5Bh6LprB4LvoHHk
	WRcgNShvenboazsx0E2V+dzYdzrl51cOieErlt0bOxnVI2ZJraegln4pu186ts1SrcadoK4uCfU
	Lou8yO9IXsYwpkBNFr8Cl+h4LjOoCMgtHziJFw==
X-Google-Smtp-Source: AGHT+IHN0WlvX+IkHk8JMgEJNSbtnqx/TMfpzaynwWxX8s++M0aKqed9Cxvgkv+KhaqAUxrXEQr99g==
X-Received: by 2002:a17:902:e80b:b0:215:44fe:163e with SMTP id d9443c01a7336-2219ff34b52mr134423285ad.1.1740240522821;
        Sat, 22 Feb 2025 08:08:42 -0800 (PST)
Received: from thinkpad ([120.60.135.149])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d7dasm3319824a91.5.2025.02.22.08.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 08:08:42 -0800 (PST)
Date: Sat, 22 Feb 2025 21:38:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: dw-rockchip: hide broken ATS capability
Message-ID: <20250222160837.mropn3laiyv3acaa@thinkpad>
References: <20250221202646.395252-3-cassel@kernel.org>
 <20250221202646.395252-4-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250221202646.395252-4-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_080844_173203_AF41A695 
X-CRM114-Status: GOOD (  32.88  )
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

On Fri, Feb 21, 2025 at 09:26:48PM +0100, Niklas Cassel wrote:
> When running the rk3588 in endpoint mode, with an Intel host with IOMMU
> enabled, the host side prints:
> DMAR: VT-d detected Invalidation Time-out Error: SID 0
> 
> When running the rk3588 in endpoint mode, with an AMD host with IOMMU
> enabled, the host side prints:
> iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT device=63:00.0 address=0x42b5b01a0]
> 
> Usually, to handle these issues, we add a quirk for the PCI vendor and
> device ID in drivers/pci/quirks.c with quirk_no_ats(). That is because
> we cannot usually modify the capabilities on the EP side.
> 
> In this case, we can modify the capabilties on the EP side. Thus, hide the
> broken ATS capability on rk3588 when running in EP mode. That way,
> we don't need any quirk on the host side, and we see no errors on the host
> side, and we can run pci_endpoint_test successfully, with the IOMMU
> enabled on the host side.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 836ea10eafbb..2be005c1a161 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -242,6 +242,51 @@ static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
>  	.init = rockchip_pcie_host_init,
>  };
>  
> +/*
> + * ATS does not work on rk3588 when running in EP mode.
> + * After a host has enabled ATS on the EP side, it will send an IOTLB
> + * invalidation request to the EP side. The rk3588 will never send a completion
> + * back and eventually the host will print an IOTLB_INV_TIMEOUT error, and the
> + * EP will not be operational. If we hide the ATS cap, things work as expected.
> + */
> +static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct device *dev = pci->dev;
> +	unsigned int spcie_cap_offset, next_cap_offset;
> +	u32 spcie_cap_header, next_cap_header;
> +
> +	/* only hide the ATS cap for rk3588 running in EP mode */
> +	if (!of_device_is_compatible(dev->of_node, "rockchip,rk3588-pcie-ep"))
> +		return;

Compatible checks always tend to extend. So please use a boolean flag to
identify the quirk in 'struct rockchip_pcie_of_data' and set it in
'rockchip_pcie_ep_of_data_rk3588'. This way, other SoCs could also reuse the
flag if required.

> +
> +	spcie_cap_offset = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_SECPCI);
> +	if (!spcie_cap_offset)
> +		return;
> +
> +	spcie_cap_header = dw_pcie_readl_dbi(pci, spcie_cap_offset);
> +	next_cap_offset = PCI_EXT_CAP_NEXT(spcie_cap_header);
> +
> +	next_cap_header = dw_pcie_readl_dbi(pci, next_cap_offset);
> +	if (PCI_EXT_CAP_ID(next_cap_header) != PCI_EXT_CAP_ID_ATS)
> +		return;
> +
> +	/* clear next ptr */
> +	spcie_cap_header &= ~GENMASK(31, 20);
> +
> +	/* set next ptr to next ptr of ATS_CAP */
> +	spcie_cap_header |= next_cap_header & GENMASK(31, 20);
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +	dw_pcie_writel_dbi(pci, spcie_cap_offset, spcie_cap_header);
> +	dw_pcie_dbi_ro_wr_dis(pci);

This code is mostly generic. So please move it to pcie-designware-ep.c. The
function should just accept two CAP IDs (prev and target) and hide the target
capability. Like,

	dw_pcie_hide_ext_capability(pci, PCI_EXT_CAP_ID_SECPCI,
				    PCI_EXT_CAP_ID_ATS);

Its too bad that we cannot traverse back from the target capability. We could
open code dw_pcie_ep_find_ext_capability() to keep track of the prev_cap_offset
though.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

