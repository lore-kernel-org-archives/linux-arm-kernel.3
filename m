Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD35E677F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 11:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4eYqgILgGSnZ5FLX7em889/Olts11sj6lSUSFxZMLE=; b=atAdSo9rw3rk+NHrgtpCSaPwwX
	ythM2C6ezAWJ7ZaGWGi0cO5Xo3eRWCnFz8mKmKLT16QjUqAkhMFW0NlzCATTETmqRgKQCrBnerXPz
	EGQf+1hqrcxu1qjKPHPsZjEoettQYXvRhqcOa8NHrJ0QDOrGoVfldyVg+wpyELlrcSfeNJsmNs9gs
	VnXO1YdmWA/i7zOm9YrH2fTn2p8jjt8/eUo0gcSoTUlghUaPoDuHwUwIAyVMWqacF0BWIWMVeBerC
	+WlDTxsMlHOjg7n4LX5acw/4eKft0tqk2P9JJmo3CcClETxD+5g8wbLFP1vEmul4EJVKievxzXFLm
	+29RqmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7C3H-00000009YnL-3ICU;
	Sat, 02 Nov 2024 11:12:21 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7C1O-00000009YTi-3t8x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:10:24 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7206304f93aso2615616b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730545821; x=1731150621; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I4eYqgILgGSnZ5FLX7em889/Olts11sj6lSUSFxZMLE=;
        b=T2er2h/rtESZSUNUtwtweK9IkmVxgP+N7E6ru4nWO5nWRT5CorNiyp/vVnVdtLBPu2
         RSyKGxRmcNhEm8158Xfp+X6OmLKxMSSO2hkpC07sXhAwO9BGnfBu97lTBokludHnBiOM
         sddaDjjv+MHIw+I6sCmGEgTTuWCxwqsEjMaziZXZc7MIxWo1S5nnECayscOvIoO2CKAS
         zr9jlDJtXEFKvdM5kLVBlzLShoJ3QrNAyhdyhYZelRPQT87V9vIQN7+mRDYuDBWLm9zM
         agG4wTujJztdhbVn2Z8Jg3Bxh6h2bPvqE+eCBpB1eLVm2UBxEjrlRfXznjifnJibcdwV
         Vc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730545821; x=1731150621;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4eYqgILgGSnZ5FLX7em889/Olts11sj6lSUSFxZMLE=;
        b=gRa+vzkAQC1PxH+ZJnsPg1dz1eeh4OLj8ku2hwyMscXy0koslOHI8KRfJOV/LWcvcT
         592m6wbCYfXGalpvymIbpI1QOszcATAQrUMnm3ugn9X9oCmgNCorpOrlA8E4sWwXxehW
         2LDayVJQcdJ0eElmw7TSIHOLwVGnlKurGmvJ2BXs/luECenBfEDa1yi0zXGYwIeVpcmm
         BrB06+YJFYuDh6foB8d+eag9vyKJiG2wziEhGDNIjEVcdR3YXTaNbLj64I/EQ6b9sA/b
         evfyrWr91EMPtNloECns9m44RfFmq63ZP58T1y1F55hz8nD1/q3DFBybul0jhZckpH0U
         X2dA==
X-Forwarded-Encrypted: i=1; AJvYcCXBdoynK2YBm6/a1oL7iboGKQXJjc25NQ4DnzVdkzQU5bHix7hsc2I1oJx+C/nIagubKm+eellaGP/1pA6W7qPQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyyEqKI1B58ug420AX5qYN5vcoT2J8NbuRJv+ksHizuCSGstO7s
	Kf22C6GNNq92/87a/REY5FT/K0HtSqqYOfyh25SyIFcrJewW1VDjr350/thOJQ==
X-Google-Smtp-Source: AGHT+IGvVFzOTXxhTUFUGXA3i4FKFopxjY5r8HjaLCxA6VY9mqL2l28HzoYyqMuyQIGfn5uqAD5pRQ==
X-Received: by 2002:a05:6a00:a29:b0:71e:c0c:5996 with SMTP id d2e1a72fcca58-720c98ca200mr8339080b3a.7.1730545821219;
        Sat, 02 Nov 2024 04:10:21 -0700 (PDT)
Received: from thinkpad ([220.158.156.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2f17fasm3968608b3a.180.2024.11.02.04.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 04:10:20 -0700 (PDT)
Date: Sat, 2 Nov 2024 16:40:12 +0530
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
Subject: Re: [PATCH v3 1/2] PCI: Add enable_device() and disable_device()
 callbacks for bridges
Message-ID: <20241102111012.23zwz4et2qkafyca@thinkpad>
References: <20241024-imx95_lut-v3-0-7509c9bbab86@nxp.com>
 <20241024-imx95_lut-v3-1-7509c9bbab86@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024-imx95_lut-v3-1-7509c9bbab86@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_041023_013718_C25CC9DA 
X-CRM114-Status: GOOD (  31.80  )
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

On Thu, Oct 24, 2024 at 06:34:44PM -0400, Frank Li wrote:
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
> ---
> Change from v2 to v3
> - use Bjorn suggest's commit message.
> - call disable_device() when error happen.
> 
> Change from v1 to v2
> - move enable(disable)device ops to pci_host_bridge
> ---
>  drivers/pci/pci.c   | 23 ++++++++++++++++++++++-
>  include/linux/pci.h |  2 ++
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 7d85c04fbba2a..5e0cb9b6f4d4f 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -2056,6 +2056,7 @@ int __weak pcibios_enable_device(struct pci_dev *dev, int bars)
>  static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  {
>  	int err;
> +	struct pci_host_bridge *host_bridge;
>  	struct pci_dev *bridge;
>  	u16 cmd;
>  	u8 pin;
> @@ -2068,9 +2069,16 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  	if (bridge)
>  		pcie_aspm_powersave_config_link(bridge);
>  
> +	host_bridge = pci_find_host_bridge(dev->bus);
> +	if (host_bridge && host_bridge->enable_device) {
> +		err = host_bridge->enable_device(host_bridge, dev);
> +		if (err)
> +			return err;
> +	}

How about wrapping the enable/disable part in a helper?

	int pci_host_bridge_enable_device(dev);
	void pci_host_bridge_disable_device(dev);

The definition could be placed in drivers/pci/pci.h as an inline function.

- Mani

> +
>  	err = pcibios_enable_device(dev, bars);
>  	if (err < 0)
> -		return err;
> +		goto err_enable;
>  	pci_fixup_device(pci_fixup_enable, dev);
>  
>  	if (dev->msi_enabled || dev->msix_enabled)
> @@ -2085,6 +2093,13 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  	}
>  
>  	return 0;
> +
> +err_enable:
> +	if (host_bridge && host_bridge->disable_device)
> +		 host_bridge->disable_device(host_bridge, dev);
> +
> +	return err;
> +
>  }
>  
>  /**
> @@ -2262,12 +2277,18 @@ void pci_disable_enabled_device(struct pci_dev *dev)
>   */
>  void pci_disable_device(struct pci_dev *dev)
>  {
> +	struct pci_host_bridge *host_bridge;
> +
>  	dev_WARN_ONCE(&dev->dev, atomic_read(&dev->enable_cnt) <= 0,
>  		      "disabling already-disabled device");
>  
>  	if (atomic_dec_return(&dev->enable_cnt) != 0)
>  		return;
>  
> +	host_bridge = pci_find_host_bridge(dev->bus);
> +	if (host_bridge && host_bridge->disable_device)
> +		host_bridge->disable_device(host_bridge, dev);
> +
>  	do_pci_disable_device(dev);
>  
>  	dev->is_busmaster = 0;
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 573b4c4c2be61..ac15b02e14ddd 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -578,6 +578,8 @@ struct pci_host_bridge {
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

