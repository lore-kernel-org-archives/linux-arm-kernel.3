Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7DDC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 06:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjj2AS+NMkUtiq/HNsOMXDNRC+8qjoN7mp8VfZ4hKLE=; b=NZbNfI7y/spKzQCgMcK0Zd48Tu
	nU7xp8SjL9JVII/9LzTEyM3+VfawSKBEtXx+1wBT74Q1WMLvta6sa3QdWnu8qNmEUVoHizTRJaxLy
	nWHG27WDJ+vR/U0syq68AacKqH+sV7skAvNBAuyYh32s1i44z897bm2LgnTLtQI8uIRi9d2GeTRMs
	FFzhl3RdECz+pkBXzELNm+lR1U5apNUNoI5KRDeqqnr690hlL6Ync3TdT6Pj3NpdBzzb+MmOzyItI
	ae+aFerwO6KAwDMBZ7NAXPkSTWcTI3BPp5ad3A2a++rEFh6YttzSdo8L3zVBTQNd0J0n3mGjZU3+h
	g/RrO7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyLi-0000000FX7a-0z1w;
	Fri, 13 Jun 2025 06:57:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyJR-0000000FWvJ-36iv;
	Fri, 13 Jun 2025 06:54:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04F0844D6D;
	Fri, 13 Jun 2025 06:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F465C4CEF1;
	Fri, 13 Jun 2025 06:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749797692;
	bh=1s/szMVjHm2c5YpFJE4JzICjVT6sl1T+nHxY2oXfPJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WeCuvtCG8iIXRXnhJ5iaXqjj6hBoLE9nJhyZji6mGfw9szRLL/Xy8f1ycbXigCuA0
	 WIpW3PtLH3zAaZyLQDW/cX2DUoNiB+goqVATpP01Qea3eOEg9GCgh5QexINECMGp/4
	 bPmFsLCXhGAn5t78RMVAqR6W2u5OnhX5B3lKZ9a6G2SDoFddyWs4dfw5Ocq1CuDinq
	 uAopszmsyYSwpmdYpIJZ0rWr3S3LJcRGpSwrTcMCvG/P2Y3G/kQX5hIKeMsmhv4bZr
	 2A6WingZ25Re1WjygPKDCtn1gR1UrNGiHyEPP2+pANoVrQDuNmOXqS/H9/DBebDa2/
	 2Ocmit6DjOuww==
Date: Fri, 13 Jun 2025 12:24:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, 
	heiko@sntech.de, manivannan.sadhasivam@linaro.org, yue.wang@amlogic.com, 
	pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, jingoohan1@gmail.com, 
	khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 2/2] PCI: dwc: Remove redundant MPS configuration
Message-ID: <6v7m7qt4n26n6pmx5tggmmvv7na6t5v5wtfqev5x4wxosymwul@j3dizxyyy4tg>
References: <20250510155607.390687-1-18255117159@163.com>
 <20250510155607.390687-3-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250510155607.390687-3-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_235453_824504_AD18C8D3 
X-CRM114-Status: GOOD (  19.96  )
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

On Sat, May 10, 2025 at 11:56:07PM +0800, Hans Zhang wrote:
> The Meson PCIe controller driver manually configures maximum payload
> size (MPS) through meson_set_max_payload, duplicating functionality now
> centralized in the PCI core.  Deprecating redundant code simplifies the
> driver and aligns it with the consolidated MPS management strategy,
> improving long-term maintainability.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>

I believe that the root port MPS set by PCI core in patch 1 should be enough to
remove the logic in the driver. But given that we already saw that is not the
case with Armada controllers, it would be good if one of the Meson maintainers
could verify if this series works as intented. Since the driver is not using the
DEVCAP value, but using the hardcoded value, I'm slightly worried that setting
MPS value other than 256 would have any downside.

But anyway, the root port MPS should be the same with and without this series.
This can be verified by:

sudo lspci -vvv | grep MaxPayload

Also, performing any benchmark and making sure that the device performance
didn't get affected would be great.

- Mani

> ---
>  drivers/pci/controller/dwc/pci-meson.c | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index db9482a113e9..126f38ed453d 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -261,22 +261,6 @@ static int meson_size_to_payload(struct meson_pcie *mp, int size)
>  	return fls(size) - 8;
>  }
>  
> -static void meson_set_max_payload(struct meson_pcie *mp, int size)
> -{
> -	struct dw_pcie *pci = &mp->pci;
> -	u32 val;
> -	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> -	int max_payload_size = meson_size_to_payload(mp, size);
> -
> -	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
> -	val &= ~PCI_EXP_DEVCTL_PAYLOAD;
> -	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
> -
> -	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
> -	val |= PCIE_CAP_MAX_PAYLOAD_SIZE(max_payload_size);
> -	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
> -}
> -
>  static void meson_set_max_rd_req_size(struct meson_pcie *mp, int size)
>  {
>  	struct dw_pcie *pci = &mp->pci;
> @@ -381,7 +365,6 @@ static int meson_pcie_host_init(struct dw_pcie_rp *pp)
>  
>  	pp->bridge->ops = &meson_pci_ops;
>  
> -	meson_set_max_payload(mp, MAX_PAYLOAD_SIZE);
>  	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
>  
>  	return 0;
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

