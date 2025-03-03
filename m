Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A089CC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmKXbHEtnA7BYynURcro/0mObW5wKzmiR29K1zakwMQ=; b=21J8otWXoeVoMwX/bXn5sZX2lE
	p1Dq0Hmgnuy8Y71kBxJj1uHXO2KK41LxV0hSACDasWE1OTLuVJB61eOoRt9U6oHLfs0vihfmSkqCO
	D0oFDHeGuI5vyRxPFkHcTzhS2AmDIdwxO1vDHN6QKJ3o/5UyNPbs375+DTcXQN0gC/SvWRD+cayH3
	FlXIFVtoneFtlnQtNUjokcILofe2Gu6JO3u4UoCAw6i8dbXhu9bgOJTYtyx3k7aKSxn4H9u2lzR5D
	W7Vg6P3unj/zSkLGfDbL8lzGUHAINjjfzzmiXr6L/0qy9Gka5g2Fefmkmfzrm3qNtmaxL30q5SvA2
	4lfUyNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9vc-00000001q9R-2Rxk;
	Mon, 03 Mar 2025 17:50:08 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9u2-00000001pne-3AWe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 17:48:31 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2feaca4e99cso6742788a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 09:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741024110; x=1741628910; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmKXbHEtnA7BYynURcro/0mObW5wKzmiR29K1zakwMQ=;
        b=RGUyZ9efRVjxhIKdKLAk+tlMex0j1OTnCGCvpd+tnkDu8NoKXynvQYKDwWMEw+FQO6
         zOn3TSupMHG6tAUesqe5nzCwrAjX5dypI51MRbrA8cOmAqyBjIePozNiA8tqGPtz41b2
         voz6NxJlzP2BVkLMnuy8uGVW++OjKVv84JV7HFQ5r6Y1MUEEOqB8gpKvAJUREu60jXoC
         9FZo47WFUbW4t3U7aRafROD4J2QK4l3wAQCW4514XjS1WxBbpNDFTBz02SciSyiwJGSS
         sSdmnMGdoJ9T0ayc6IW4GbUVTvZTM7nhyleYmL4oGKnCoSVU6RKQxNxOMj3V6vobPJnt
         LhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741024110; x=1741628910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmKXbHEtnA7BYynURcro/0mObW5wKzmiR29K1zakwMQ=;
        b=FBA9VGmWvdI9CrSkbjkQRLljhlqYTb7j4A8grrZX+g1TKZCo3LklxQCakarpyyrUUZ
         gKgAJmwQjZIjj6qEiQpjuIz1ZUiqcqs6E0xfLAqYpmhCFSbHyLPDxCeJR6Q6q2mmaPw0
         G55Ru0zjbKUUQGk9KmGLd2tPk0+f8cwi606wrqKg9RpwJusaNlC9qkbiFY1ge15qNjHC
         QjUuu+7NovOoRxqE2pEyzoTYpMh7TOY7818QqIzRd4YN25YbOCHLZNSCCl4plhEP4ONt
         VVVnnquD3WSTd9pwdb4gHSQa/nJxwb4IRg0pzK68rZhit54DlmXYu/aMz30zibjYp1ot
         wSWA==
X-Forwarded-Encrypted: i=1; AJvYcCUGUmEMkmZEaDrMhY1nEapojPd11WQ+k0LUeXwg9NbpxxxKYHQ4sxdvrmVKoxajaJ5EpgkEMUszsbCoPOT1nZUH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+NFgKcJ8+Ju8jcf9FsXJsT0ZoykPV7HfrOkRzEqVp8AbCtcf0
	8Y7Aljv2WqNHryiw9wI9IdJ82xGU6lqbA48pKdpLdNOR97gprT9G
X-Gm-Gg: ASbGncuJaAAqIbz/pmaP2z49Ha5dt6aDUEwNxWOObiB7vNVQemx4866OavdiDIX0NEj
	6NwbWT39SoE5Hm9oAWHHLBRoWEjdQweLz0s0QwcLOIAKGvYaFt0/ywtiOD3MUwyezdunho9BYIW
	13wYldV7H9OceQ+ThuEzbbspc2bSuLXJNlKLqWb4QuYzRPnn2FgjzSuqzYlX6K5+PZYu6UFL3qO
	az+AJDGg5YEl6GcaNxHsPfpb18WtlvHIKFRgYM7SLYTF41B2a8HrwAP7KfGDC5XQu8lvjZwfq1x
	iWbNrSKkZL/4fUx2O62eNcu73hgkP297zN0j2kDE
X-Google-Smtp-Source: AGHT+IHk7Hi95mZJV5rMYiwuC/J8v0hurAfh0yJTj+vgRhEnZZgJvNnI5Cjq+bi6h/usz4umguhtlw==
X-Received: by 2002:a17:90b:3a89:b0:2fe:8c4f:e7c4 with SMTP id 98e67ed59e1d1-2febab760a0mr22194123a91.15.1741024106330;
        Mon, 03 Mar 2025 09:48:26 -0800 (PST)
Received: from debian ([2607:fb90:8e63:c2b3:5405:c8bf:c1d1:41d5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825baa8csm11465771a91.14.2025.03.03.09.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:48:25 -0800 (PST)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Mon, 3 Mar 2025 09:48:19 -0800
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, nifan.cxl@gmail.com,
	a.manzanares@samsung.com, pankaj.dubey@samsung.com,
	cassel@kernel.org, 18255117159@163.com, xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <Z8XrYxP_pZr6tFU8@debian>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132035epcas5p47221a5198df9bf86020abcefdfded789@epcas5p4.samsung.com>
 <20250221131548.59616-4-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221131548.59616-4-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_094830_798383_797475A0 
X-CRM114-Status: GOOD (  24.23  )
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

On Fri, Feb 21, 2025 at 06:45:46PM +0530, Shradha Todi wrote:
> Add support to provide silicon debug interface to userspace. This set
> of debug registers are part of the RASDES feature present in DesignWare
> PCIe controllers.
> 
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>

One comment inline.
> ---
>  Documentation/ABI/testing/debugfs-dwc-pcie    |  13 ++
>  drivers/pci/controller/dwc/Kconfig            |  10 +
>  drivers/pci/controller/dwc/Makefile           |   1 +
>  .../controller/dwc/pcie-designware-debugfs.c  | 176 ++++++++++++++++++
>  .../pci/controller/dwc/pcie-designware-ep.c   |   5 +
>  .../pci/controller/dwc/pcie-designware-host.c |   6 +
>  drivers/pci/controller/dwc/pcie-designware.c  |   6 +
>  drivers/pci/controller/dwc/pcie-designware.h  |  21 +++
>  include/linux/pcie-dwc.h                      |   2 +
>  9 files changed, 240 insertions(+)
>  create mode 100644 Documentation/ABI/testing/debugfs-dwc-pcie
>  create mode 100644 drivers/pci/controller/dwc/pcie-designware-debugfs.c
> 

...

> +
> +static void dwc_pcie_rasdes_debugfs_deinit(struct dw_pcie *pci)
> +{
> +	struct dwc_pcie_rasdes_info *rinfo = pci->debugfs->rasdes_info;
> +
> +	mutex_destroy(&rinfo->reg_event_lock);
> +}
> +
> +static int dwc_pcie_rasdes_debugfs_init(struct dw_pcie *pci, struct dentry *dir)
> +{
> +	struct dentry *rasdes_debug;
> +	struct dwc_pcie_rasdes_info *rasdes_info;
> +	struct device *dev = pci->dev;
> +	int ras_cap;
> +
> +	ras_cap = dw_pcie_find_rasdes_capability(pci);
> +	if (!ras_cap) {
> +		dev_dbg(dev, "no RASDES capability available\n");
> +		return -ENODEV;
> +	}
> +
> +	rasdes_info = devm_kzalloc(dev, sizeof(*rasdes_info), GFP_KERNEL);
> +	if (!rasdes_info)
> +		return -ENOMEM;
> +
> +	/* Create subdirectories for Debug, Error injection, Statistics */
> +	rasdes_debug = debugfs_create_dir("rasdes_debug", dir);
> +
> +	mutex_init(&rasdes_info->reg_event_lock);
> +	rasdes_info->ras_cap_offset = ras_cap;
> +	pci->debugfs->rasdes_info = rasdes_info;
> +
> +	/* Create debugfs files for Debug subdirectory */
> +	dwc_debugfs_create(lane_detect);
> +	dwc_debugfs_create(rx_valid);
> +
> +	return 0;
> +}
> +
> +void dwc_pcie_debugfs_deinit(struct dw_pcie *pci)
> +{
> +	dwc_pcie_rasdes_debugfs_deinit(pci);
> +	debugfs_remove_recursive(pci->debugfs->debug_dir);
> +}
> +
> +int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> +{
> +	char dirname[DWC_DEBUGFS_BUF_MAX];
> +	struct device *dev = pci->dev;
> +	struct debugfs_info *debugfs;
> +	struct dentry *dir;
> +	int ret;
> +
> +	/* Create main directory for each platform driver */
> +	snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(dev));
> +	dir = debugfs_create_dir(dirname, NULL);
> +	debugfs = devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> +	if (!debugfs)
> +		return -ENOMEM;
> +
> +	debugfs->debug_dir = dir;
> +	pci->debugfs = debugfs;
> +	ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> +	if (ret)
> +		dev_dbg(dev, "RASDES debugfs init failed\n");

What will happen if ret != 0? still return 0? 

Fan
> +
> +	return 0;
> +}
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 72418160e658..f9d7f3f989ad 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -814,6 +814,7 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  
> +	dwc_pcie_debugfs_deinit(pci);
>  	dw_pcie_edma_remove(pci);
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
> @@ -989,6 +990,10 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  
>  	dw_pcie_ep_init_non_sticky_registers(pci);
>  
> +	ret = dwc_pcie_debugfs_init(pci);
> +	if (ret)
> +		goto err_remove_edma;
> +
>  	return 0;
>  
>  err_remove_edma:
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index ffaded8f2df7..2081e8c72d12 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -548,6 +548,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	if (pp->ops->post_init)
>  		pp->ops->post_init(pp);
>  
> +	ret = dwc_pcie_debugfs_init(pci);
> +	if (ret)
> +		goto err_stop_link;
> +
>  	return 0;
>  
>  err_stop_link:
> @@ -572,6 +576,8 @@ void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>  
> +	dwc_pcie_debugfs_deinit(pci);
> +
>  	pci_stop_root_bus(pp->bridge->bus);
>  	pci_remove_root_bus(pp->bridge->bus);
>  
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index a7c0671c6715..3d1d95d9e380 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -323,6 +323,12 @@ static u16 dw_pcie_find_vsec_capability(struct dw_pcie *pci,
>  	return 0;
>  }
>  
> +u16 dw_pcie_find_rasdes_capability(struct dw_pcie *pci)
> +{
> +	return dw_pcie_find_vsec_capability(pci, dwc_pcie_rasdes_vsec_ids);
> +}
> +EXPORT_SYMBOL_GPL(dw_pcie_find_rasdes_capability);
> +
>  int dw_pcie_read(void __iomem *addr, int size, u32 *val)
>  {
>  	if (!IS_ALIGNED((uintptr_t)addr, size)) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 501d9ddfea16..7f9807d4e5de 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -437,6 +437,11 @@ struct dw_pcie_ops {
>  	void	(*stop_link)(struct dw_pcie *pcie);
>  };
>  
> +struct debugfs_info {
> +	struct dentry		*debug_dir;
> +	void			*rasdes_info;
> +};
> +
>  struct dw_pcie {
>  	struct device		*dev;
>  	void __iomem		*dbi_base;
> @@ -465,6 +470,7 @@ struct dw_pcie {
>  	struct reset_control_bulk_data	core_rsts[DW_PCIE_NUM_CORE_RSTS];
>  	struct gpio_desc		*pe_rst;
>  	bool			suspended;
> +	struct debugfs_info	*debugfs;
>  };
>  
>  #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
> @@ -478,6 +484,7 @@ void dw_pcie_version_detect(struct dw_pcie *pci);
>  
>  u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap);
>  u16 dw_pcie_find_ext_capability(struct dw_pcie *pci, u8 cap);
> +u16 dw_pcie_find_rasdes_capability(struct dw_pcie *pci);
>  
>  int dw_pcie_read(void __iomem *addr, int size, u32 *val);
>  int dw_pcie_write(void __iomem *addr, int size, u32 val);
> @@ -806,4 +813,18 @@ dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
>  	return NULL;
>  }
>  #endif
> +
> +#ifdef CONFIG_PCIE_DW_DEBUGFS
> +int dwc_pcie_debugfs_init(struct dw_pcie *pci);
> +void dwc_pcie_debugfs_deinit(struct dw_pcie *pci);
> +#else
> +static inline int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> +{
> +	return 0;
> +}
> +static inline void dwc_pcie_debugfs_deinit(struct dw_pcie *pci)
> +{
> +}
> +#endif
> +
>  #endif /* _PCIE_DESIGNWARE_H */
> diff --git a/include/linux/pcie-dwc.h b/include/linux/pcie-dwc.h
> index 40f3545731c8..6436e7fadc75 100644
> --- a/include/linux/pcie-dwc.h
> +++ b/include/linux/pcie-dwc.h
> @@ -28,6 +28,8 @@ static const struct dwc_pcie_vsec_id dwc_pcie_rasdes_vsec_ids[] = {
>  	  .vsec_id = 0x02, .vsec_rev = 0x4 },
>  	{ .vendor_id = PCI_VENDOR_ID_QCOM,
>  	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> +	{ .vendor_id = PCI_VENDOR_ID_SAMSUNG,
> +	  .vsec_id = 0x02, .vsec_rev = 0x4 },
>  	{} /* terminator */
>  };
>  
> -- 
> 2.17.1
> 

