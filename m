Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2864D637A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 17:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmnyoVBogdAY8x4kmLAsg1HFi2F5M2VCC5E3t36HwWM=; b=JuFhiYhNEVFkW0lrPNzQEe6kAP
	B2H6KmpHa3IlOD5JG5iFgeOeQtvrWCx/CrVwu1UKrruIsbxaFI8k6kbCwTTqwGc0ewtvgwfxXC4Ft
	HshiTismtYbH78n/uhyPjhkeSlGe6yI6nTLVvFx8Ddow6U15tOELnnUeIPFHplBi4snI+/MjRXrxH
	ADXqTsXPpkh0e64DtOBCRsqLpOJ85Na6Kw3/TosDiGGgnsxK7BoXlr0zWfUckFr422jNts7sObO+f
	ImyQOQbbX2UqtNXcsjV8qt7y+XKzYwiFra9fo1Fum848vRQvrsopyYaqBt1cHnpiHdAGa/0xbYoyO
	KSujfoIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBGzX-00000007YK1-2HwY;
	Wed, 13 Nov 2024 17:17:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBGxh-00000007Y4o-1Qs7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 17:15:26 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20c805a0753so71685955ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 09:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731518123; x=1732122923; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TmnyoVBogdAY8x4kmLAsg1HFi2F5M2VCC5E3t36HwWM=;
        b=cIBKDKWlxlVXGghN6GPsKsiHBdZ4d8Gvuibmom7rQFkYb4FmgDxfzhPpLp3YP1wwNY
         W35+NvPq9T8SnvxTaRNuVz3ERZBRtfTlzdlLHSlG9VKRHR1cdB+MUhLt2n+nJ9fEonNY
         Y4Uyd2SCCS7H0qFTy0bPf9tKP+HanUDFSD8BFgEMAcrimPhj1lvGC2KqI5tpC+IByrY2
         GiR6B6IGZzDZRyUd04TG0ygFpDYZoBfazvtfjpR0hgm6I9FpXJYeO8+wotMLfdIRPBz3
         rmq29DQMdsAyA38ZL2NW2HEa2pvB+xTecHqmaqVpkR75bqyoo/JXttDcZFNza5mRn9JA
         B+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731518123; x=1732122923;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmnyoVBogdAY8x4kmLAsg1HFi2F5M2VCC5E3t36HwWM=;
        b=TtFRX/VPxgK0eMWQV1hSiQmuikSVeCDpYiCjc3C9K3cM+IJieTHVeUSf97JhSYymvc
         hWuDT/FCtGJ4gK2Kag0q/iXwXxgUKJdn0/KhyDOU//UzzEfekaiGNol+CYb5yQYXbZYp
         cFhZlASL5vP2VAuvW1BjPJcp/Ymf51nhnqa8nkqQ91qZvCzfjzdZGG9tJh8yTK1ZXv92
         MSE9x96e+oGJmLeJH3HYmYe7slMZWR+6ru68+EO3LhknAq4bMZ59p14m7tHq8PhT3rpL
         QL+YnWhHmyIEe9RHnsJDPRdvzpSvX/zQpgfcQsDEu72k0SLbYROVg47GKl18ni7uGjAc
         Mw6A==
X-Forwarded-Encrypted: i=1; AJvYcCUWnOuZZAVM30rb9/OXW31iCA04N3dhaKq18fcD9kaCi1He2wTRCqLJgcDFCZ24oX5OHkyjSoTiTvm6qpghCE0o@lists.infradead.org
X-Gm-Message-State: AOJu0YyKD6KISR8xCUT7iU+YyfLOtvQ/T3IjTlDMzZAbQgoe3j1TFfQ2
	xggi5foNkNpz8lNGnZc4LxmW3Zxjf5fITvGCywglz+f2SlA9KhaSHgYRw2ImBw==
X-Google-Smtp-Source: AGHT+IHzuQZcyCrKEu2zhDf6vGWpfQpSsivZTFz9ERjtI5rVRvb2nqfyzm+YGxn9leeh1yDA8kfSug==
X-Received: by 2002:a17:903:41ca:b0:20b:9f8c:e9de with SMTP id d9443c01a7336-21183cff8a2mr257327955ad.13.1731518123010;
        Wed, 13 Nov 2024 09:15:23 -0800 (PST)
Received: from thinkpad ([117.213.102.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc8f25sm112819815ad.22.2024.11.13.09.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 09:15:22 -0800 (PST)
Date: Wed, 13 Nov 2024 22:45:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, alyssa@rosenzweig.io, bpf@vger.kernel.org,
	broonie@kernel.org, jgg@ziepe.ca, joro@8bytes.org,
	lgirdwood@gmail.com, maz@kernel.org, p.zabel@pengutronix.de,
	robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH v5 1/2] PCI: Add enable_device() and disable_device()
 callbacks for bridges
Message-ID: <20241113171511.6d4gh3x27nej55qw@thinkpad>
References: <20241104-imx95_lut-v5-0-feb972f3f13b@nxp.com>
 <20241104-imx95_lut-v5-1-feb972f3f13b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241104-imx95_lut-v5-1-feb972f3f13b@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_091525_433479_56B2FE55 
X-CRM114-Status: GOOD (  32.53  )
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

On Mon, Nov 04, 2024 at 02:22:59PM -0500, Frank Li wrote:
> Some PCIe host bridges require special handling when enabling or disabling
> PCIe Endpoints. For example, the i.MX95 platform has a lookup table to map
> Requester IDs to StreamIDs, which are used by the SMMU and MSI controller
> to identify the source of DMA accesses.
> 
> Without this mapping, DMA accesses may target unintended memory, which
> would corrupt memory or read the wrong data.
> 
> Add a host bridge .enable_device() hook the imx6 driver can use to
> configure the Requester ID to StreamID mapping. The hardware table isn't
> big enough to map all possible Requester IDs, so this hook may fail if no
> table space is available. In that case, return failure from
> pci_enable_device().
> 
> It might make more sense to make pci_set_master() decline to enable bus
> mastering and return failure, but it currently doesn't have a way to return
> failure.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Change from v4 to v5
> - Add two static help functions
> int pci_host_bridge_enable_device(dev);
> void pci_host_bridge_disable_device(dev);
> - remove tags because big change
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Tested-by: Marc Zyngier <maz@kernel.org>
> 
> Change from v3 to v4
> - Add Bjorn's ack tag
> 
> Change from v2 to v3
> - use Bjorn suggest's commit message.
> - call disable_device() when error happen.
> 
> Change from v1 to v2
> - move enable(disable)device ops to pci_host_bridge
> ---
>  drivers/pci/pci.c   | 36 +++++++++++++++++++++++++++++++++++-
>  include/linux/pci.h |  2 ++
>  2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 67013df89a694..4735bc665ab3b 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -2055,6 +2055,28 @@ int __weak pcibios_enable_device(struct pci_dev *dev, int bars)
>  	return pci_enable_resources(dev, bars);
>  }
>  
> +static int pci_host_bridge_enable_device(struct pci_dev *dev)
> +{
> +	struct pci_host_bridge *host_bridge = pci_find_host_bridge(dev->bus);
> +	int err;
> +
> +	if (host_bridge && host_bridge->enable_device) {
> +		err = host_bridge->enable_device(host_bridge, dev);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void pci_host_bridge_disable_device(struct pci_dev *dev)
> +{
> +	struct pci_host_bridge *host_bridge = pci_find_host_bridge(dev->bus);
> +
> +	if (host_bridge && host_bridge->disable_device)
> +		host_bridge->disable_device(host_bridge, dev);
> +}
> +
>  static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  {
>  	int err;
> @@ -2070,9 +2092,13 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  	if (bridge)
>  		pcie_aspm_powersave_config_link(bridge);
>  
> +	err = pci_host_bridge_enable_device(dev);
> +	if (err)
> +		return err;
> +
>  	err = pcibios_enable_device(dev, bars);
>  	if (err < 0)
> -		return err;
> +		goto err_enable;
>  	pci_fixup_device(pci_fixup_enable, dev);
>  
>  	if (dev->msi_enabled || dev->msix_enabled)
> @@ -2087,6 +2113,12 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  	}
>  
>  	return 0;
> +
> +err_enable:
> +	pci_host_bridge_disable_device(dev);
> +
> +	return err;
> +
>  }
>  
>  /**
> @@ -2270,6 +2302,8 @@ void pci_disable_device(struct pci_dev *dev)
>  	if (atomic_dec_return(&dev->enable_cnt) != 0)
>  		return;
>  
> +	pci_host_bridge_disable_device(dev);
> +
>  	do_pci_disable_device(dev);
>  
>  	dev->is_busmaster = 0;
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index a17edc6c28fda..5f75c30f263be 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -596,6 +596,8 @@ struct pci_host_bridge {
>  	u8 (*swizzle_irq)(struct pci_dev *, u8 *); /* Platform IRQ swizzler */
>  	int (*map_irq)(const struct pci_dev *, u8, u8);
>  	void (*release_fn)(struct pci_host_bridge *);
> +	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
> +	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>  	void		*release_data;
>  	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
>  	unsigned int	no_ext_tags:1;		/* No Extended Tags */
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

