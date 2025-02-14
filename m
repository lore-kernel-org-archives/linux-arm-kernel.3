Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5268C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SL3H0DuOiIRBzcq9keabamHJlGFq0GX85r7ZwTWY1oc=; b=JF4MLEuQldQA7/fVbEUtA223Dc
	cjMW0vXEBCdnLZrNYRB1S6TvGtSwV+eXI5uMEKhjsL6AnWQuYiegu3tfbUokpSUEJK3kz9S5IAwr5
	pfRujGGTMVCs2XT0T+rT7qLWJKwqDVIQMdmaoAxBJPUWLK9LKBypk89RnjhluRTCLM3i6TomufLO+
	/8i7HkQvDGPso54je7GXPr057ML4HTtHIm3XeULVSD/CgrJgdKdafMekPtt+6Cw1KsFw3WhJLxDd8
	Ux5mqWVbCEjKTb11pHZPhius4+9gDKbZW6lUpThkkrd0fNbazT6wgOzc/NRpi30quHXOK+FB0a3QR
	MlqSIpgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0Yd-0000000FtuL-1UMP;
	Fri, 14 Feb 2025 18:36:59 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizgN-0000000FklZ-0V7z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:40:56 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22101839807so8406135ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739554854; x=1740159654; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SL3H0DuOiIRBzcq9keabamHJlGFq0GX85r7ZwTWY1oc=;
        b=Jx6ic0BSW47C/Jgc2JrHFGJjK79hDMfKdfKMkeqTRfRKSWtGFYC+VXV3kxap4VUWUK
         ICewYx9PSDSHpv4f+fhdLYEnLMfyFfsgJNzgHO2jsfpO1e7NEmRK2uivluB5jXxuLp4F
         e5HtQTtiUJT9LBCCIN2ZZlfKFAHYosrSIkJPMSucq0wWVFcaPEOu9hC+fGrwcr3ON/Ro
         otTw9rq67d4lo1yHy/33n/BC8qn6awT/zKNrsvKX3meQDROskIlEgHXHo95oPTc+fAdE
         ZOAUo/v647L8+CLSqWJyU4zhWJcMgc8cKu/CLbHLBfdYxG7oIT4Sf0WYDJkls/noTRUY
         bHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554854; x=1740159654;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SL3H0DuOiIRBzcq9keabamHJlGFq0GX85r7ZwTWY1oc=;
        b=LdgxyCjWq8jFB4zRzt2ER+VN4NvxKjfXWnZrVQS5S0tbpbkUtTJu+TQupH++/VNiPP
         pG8C1E0LAa4z366ClIm3iNkuV5UV/V+KfXXPgYWK7vTFQovvEs7ZG8PDLQHPH1dSLTnH
         OkRfOvaEi7Q2ZPGI1DHiEIdaAB9Lugl/k8v9yl7rIffbQcIVQOl6aFtl7IsSUzlEVDH1
         Rtrsf6RYvDSKsdj5wC1OZLYEu1i4cdkvCmxXu2p9Puf7tFsOLOrHLTqe0o8fU8d2CqCd
         aO6X7TzV1m/XPwZECTshQ0F7l8Am830di1/CAdaJRRTvoLKVs9Rl4IrSi/ddz8VI6vKX
         OUiA==
X-Forwarded-Encrypted: i=1; AJvYcCUAktfK84gMX2VYBcIvY/qd5wobLa6cBSJ5kmaGTXf7iAuAaILPaAOCF/psFYcJTM+OLne3UB7S4p4v8RMN9aFE@lists.infradead.org
X-Gm-Message-State: AOJu0YzAkyuyky/RPqsYoXGkMgV6cDF7jc0Ys/N52tprgqLHUeEtXtUP
	pbJRZt33AZJM0idpQmSk3mQJKMt3AvGZpKSVeRukxfeU57CJsVSAAMRaSOe23g==
X-Gm-Gg: ASbGncsuu+7844zmo0rujxVT6feQZuyCrTZHSBUH8Nqb/b7RHf2xh9xqSAj0zX/XAEK
	seij0eCGc0SLfKpjTN8dJAWUVwqY7Ps6A8/4nfHDKt9Q8LZ6t9xmv3DRcBtgYjpTxRJWLRRXXtM
	sHoHhegNouGw2F/sjYdGLFhW/v0lucPZwuUfT2JM5PophSen4uH31O21du//L4fB/4EV2I766I/
	FbatIKrJ3mY8nJWhu5DyR40Zt+EXiKRqyJIOqji1iQHB+Vp5TISeaidlMz2fc3izTXxnIqI1uDN
	dE6QmulKO0BLiGKc5FfrPTHTCXQ=
X-Google-Smtp-Source: AGHT+IFh0sbLUMbF5mJTepHDsyslk02Txh0BE7kYA1Ix9Jnaoqm96HhvZ/9FCnIuMaCAHju+TzXWhg==
X-Received: by 2002:a05:6a00:3c84:b0:730:9a85:c940 with SMTP id d2e1a72fcca58-732618fa927mr321487b3a.20.1739554854197;
        Fri, 14 Feb 2025 09:40:54 -0800 (PST)
Received: from thinkpad ([120.60.134.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242549d01sm3528978b3a.14.2025.02.14.09.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:40:53 -0800 (PST)
Date: Fri, 14 Feb 2025 23:10:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Udit Kumar <u-kumar1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 0/7] PCI: endpoint: Allow EPF drivers to configure the
 size of Resizable BARs
Message-ID: <20250214174047.6zrpuvtgrbxw333t@thinkpad>
References: <20250131182949.465530-9-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131182949.465530-9-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_094055_154685_DEAA45D9 
X-CRM114-Status: GOOD (  24.61  )
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

On Fri, Jan 31, 2025 at 07:29:49PM +0100, Niklas Cassel wrote:
> The PCI endpoint framework currently does not support resizable BARs.
> 
> Add a new BAR type BAR_RESIZABLE, so that EPC drivers can support resizable
> BARs properly.
> 
> For a resizable BAR, we will only allow a single supported size.
> This is by design, as we do not need/want the complexity of the host side
> resizing our resizable BAR.
> 
> In the DWC driver specifically, the DWC driver currently handles resizable
> BARs using an ugly hack where a resizable BAR is force set to a fixed size
> BAR with 1 MB size if detected. This is bogus, as a resizable BAR can be
> configured to sizes other than 1 MB.
> 
> With these changes, an EPF driver will be able to call pci_epc_set_bar()
> to configure a resizable BAR to an arbitrary size, just like for
> BAR_PROGRAMMABLE. Thus, DWC based EPF drivers will no longer be forced to
> a bogus 1 MB forced size for resizable BARs.
> 
> 
> Tested/verified on a Radxa Rock 5b (rk3588) by:
> -Modifying pci-epf-test.c to request BAR sizes that are larger than 1 MB:
>  -static size_t bar_size[] = { 512, 512, 1024, 16384, 131072, 1048576 };
>  +static size_t bar_size[] = { SZ_1M, SZ_1M, SZ_2M, SZ_2M, SZ_4M, SZ_4M };
>  (Make sure to set CONFIG_CMA_ALIGNMENT=10 such that dma_alloc_coherent()
>   calls are aligned even for allocations larger than 1 MB.)
> -Rebooting the host to make sure that the DWC EP driver configures the BARs
>  correctly after receiving a link down event.
> -Modifying EPC features to configure a BAR as 64-bit, to make sure that we
>  handle 64-bit BARs correctly.
> -Modifying the DWC EP driver to set a size larger than 2 GB, to make sure
>  we handle BAR sizes larger than 2 GB (for 64-bit BARs) correctly.
> -Running the consecutive BAR test in pci_endpoint_test.c to make sure that
>  the address translation works correctly.
> 

I took the liberty since this series is mostly related to endpoint and applied
to pci/endpoint!

- Mani

> 
> Changes since V3:
> -Picked up tags.
> -Addressed comments from Mani.
> 
> 
> Kind regards,
> Niklas
> 
> Niklas Cassel (7):
>   PCI: endpoint: Allow EPF drivers to configure the size of Resizable
>     BARs
>   PCI: endpoint: Add pci_epc_bar_size_to_rebar_cap()
>   PCI: dwc: ep: Move dw_pcie_ep_find_ext_capability()
>   PCI: dwc: endpoint: Allow EPF drivers to configure the size of
>     Resizable BARs
>   PCI: keystone: Describe Resizable BARs as Resizable BARs
>   PCI: keystone: Specify correct alignment requirement
>   PCI: dw-rockchip: Describe Resizable BARs as Resizable BARs
> 
>  drivers/pci/controller/dwc/pci-keystone.c     |   6 +-
>  .../pci/controller/dwc/pcie-designware-ep.c   | 218 +++++++++++++++---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  22 +-
>  drivers/pci/endpoint/pci-epc-core.c           |  31 +++
>  drivers/pci/endpoint/pci-epf-core.c           |   4 +
>  include/linux/pci-epc.h                       |   5 +
>  6 files changed, 239 insertions(+), 47 deletions(-)
> 
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

