Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1E3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9prR8mhxrRYeIRCTSHgJGVKbuPXqgXqBU6nCp2r82U=; b=dsFaPFq3P1n4dg+gmLP62Oagv+
	HJQ3E/ZrOjkfl0u7IYmFqdLn8aP9gaQ2AzknpeDR5f9ACkDGOUaw85/nXch9MtcrwgVrwwyjTY4gP
	C1COYDSQm3k0mc8XhBvsEHepzakco3Y4u5CLI0diMhW5+sIcZQYbP7iQyqzxs6QGZ3ABhCslFwClQ
	gr2SA6k7H/amwSylSL/xnjJVFZgJn9DTjEFMy3mx6ko6sbxo5ncWMFNXoaGIfjwFfMHbdmV1vaPps
	LttiOq7x7R38ez+2QLSccQVTKIcew3Tl4FciRjGixGFabjd1Jhe2v/HGUduR1+X2xKEk30/xTYo1y
	h39Gic3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRs2-000000054KB-49fO;
	Tue, 18 Mar 2025 08:00:18 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRnm-000000053Jo-0h4Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 07:55:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-224191d92e4so100459995ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 00:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742284553; x=1742889353; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9prR8mhxrRYeIRCTSHgJGVKbuPXqgXqBU6nCp2r82U=;
        b=z7g/hKkQJ4m3N+gkB454LOsvUqV0OUvuBVz0NkOb99/ry42eANDCGolLtmivQnlGzp
         sWzM8unoYek9UY9tFNNTMg1WDRMWCC9NPizh57muYTjozVDYSNAwdAIck8ZHPCLwGrWC
         she03/LQsa9XSst7rAHpFeulCceEeEpMiHruISGw2PrnLkrLEyxM57ZnQO5yEPFdhQOS
         yTEjgGQ7DlzUD2yGletPJ6lMkedaSF/BsUY+1H7qLPrrrdgag9WfGYSB9C7DXcecD1Ws
         ScD/wkaIPEOYnbYzbopYSStxOjpvkz3MfcWcpAlGt8SQqG2t2+mxR9V6O339UJ/uRybq
         o2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742284553; x=1742889353;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9prR8mhxrRYeIRCTSHgJGVKbuPXqgXqBU6nCp2r82U=;
        b=h2POkOe2NzQymD6QCG8RGMLMN8TYDhPol8V9ceypTHKwA9nmEGMnya7kWQstyWvu2j
         tG+3kiuhv12cl1fN4DxVmehzyz6aMNmoDwMAufhWeomske+s4th7GbpR+trgCc+MdeIU
         XoMBhuGjuQxV5JU6VnbqCE7m2W8y2VsEoOJVGFg9Cx1dzYkOslcPPXMypCn098eFb9Rk
         vQa0ymSroFPDPllHxwJqenCtGFBqS/HFTX7SFrXyN8f+A5evvYC+28goL8W5dqUiTlSC
         +3/BfmI5VxMASryhPUKCuUUhEs9PyFBMKbajNrOhY+A9MUeMKBZdGNQCQhf6IGpmDAGM
         a56A==
X-Forwarded-Encrypted: i=1; AJvYcCXjtsCqrrA3pZMokAWTYW7C0EHg3ztpr5kxXcLCnSDWYBSNo2MhQfslS8N8aWo7G0+moIeKgfYubhEoRjXtZn8v@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/fCZU+Iyb94N3o9bVVUFhttOJNR7rySFpvKyehERES4jHqGLa
	g/7eVHxoIpZQif/t+QPjsqbRYB7gtb3utnxB8JJCJZsg4yvrmoPgiG/bo4m3/Q==
X-Gm-Gg: ASbGnctjuapkZQDaorbK4pixt1P8zIT+5yVe7yMpGIb8FGjCvR0md5NuqThfUQqbJ+n
	gsdReP8/e31n8QctYZOicfeAGKCmP7Wio2mYIPBTta2b5SRDnh5eqnRzeoULCjTf+aRR+udeXsJ
	62MsxJ9F++4GebK2+yCEWR6ItV2JfGsDRZloT4vECCrlMPzjnIyLRoklrBxfYQ4UJCAQauPjVZi
	65Z0i2VnG9Yw0XtQofhLKFyeepAM9KOJ6amqM4smDP1Nj7gkPAES3/sRfJGB45Lcyytj07LbKSj
	NGV95h386isG1mEcqbZYN32D23haqqPZBp+GyI9ssn3oof/tvcjXsR39
X-Google-Smtp-Source: AGHT+IHvY4lPoL2TGzhuigZH+Kn+pFtPymew4CCPf5ZwyH3ja7q9rPR3A5fxW5YqDPXkRWgedvl1FQ==
X-Received: by 2002:a17:902:d542:b0:216:6283:5a8c with SMTP id d9443c01a7336-225e0af9e3emr209693445ad.39.1742284553275;
        Tue, 18 Mar 2025 00:55:53 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d2csm87942515ad.125.2025.03.18.00.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:55:52 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:25:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org,
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com,
	thomas.richard@bootlin.com, bwawrzyn@cisco.com,
	linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH 2/4] PCI: cadence-host: Introduce cdns_pcie_host_disable
 helper for cleanup
Message-ID: <20250318075547.wyijae6pumogkl4e@thinkpad>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-3-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307103128.3287497-3-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_005554_209097_5C2EBF0F 
X-CRM114-Status: GOOD (  21.33  )
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

On Fri, Mar 07, 2025 at 04:01:26PM +0530, Siddharth Vadapalli wrote:
> Introduce the helper function cdns_pcie_host_disable() which will undo
> the configuration performed by cdns_pcie_host_setup(). Also, export it
> for use by existing callers of cdns_pcie_host_setup(), thereby allowing
> them to cleanup on their exit path.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../controller/cadence/pcie-cadence-host.c    | 104 ++++++++++++++++++
>  drivers/pci/controller/cadence/pcie-cadence.h |   5 +
>  2 files changed, 109 insertions(+)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> index 96055edeb099..741508738f88 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> @@ -152,6 +152,14 @@ static int cdns_pcie_retrain(struct cdns_pcie *pcie)
>  	return ret;
>  }
>  
> +static void cdns_pcie_host_disable_ptm_response(struct cdns_pcie *pcie)
> +{
> +	u32 val;
> +
> +	val = cdns_pcie_readl(pcie, CDNS_PCIE_LM_PTM_CTRL);
> +	cdns_pcie_writel(pcie, CDNS_PCIE_LM_PTM_CTRL, val & ~CDNS_PCIE_LM_TPM_CTRL_PTMRSEN);
> +}
> +
>  static void cdns_pcie_host_enable_ptm_response(struct cdns_pcie *pcie)
>  {
>  	u32 val;
> @@ -177,6 +185,26 @@ static int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc)
>  	return ret;
>  }
>  
> +static void cdns_pcie_host_deinit_root_port(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +	u32 value, ctrl;
> +
> +	cdns_pcie_rp_writew(pcie, PCI_CLASS_DEVICE, 0xffff);
> +	cdns_pcie_rp_writeb(pcie, PCI_CLASS_PROG, 0xff);
> +	cdns_pcie_rp_writeb(pcie, PCI_CLASS_REVISION, 0xff);
> +	cdns_pcie_writel(pcie, CDNS_PCIE_LM_ID, 0xffffffff);
> +	cdns_pcie_rp_writew(pcie, PCI_DEVICE_ID, 0xffff);
> +	ctrl = CDNS_PCIE_LM_BAR_CFG_CTRL_DISABLED;
> +	value = ~(CDNS_PCIE_LM_RC_BAR_CFG_BAR0_CTRL(ctrl) |
> +		CDNS_PCIE_LM_RC_BAR_CFG_BAR1_CTRL(ctrl) |
> +		CDNS_PCIE_LM_RC_BAR_CFG_PREFETCH_MEM_ENABLE |
> +		CDNS_PCIE_LM_RC_BAR_CFG_PREFETCH_MEM_64BITS |
> +		CDNS_PCIE_LM_RC_BAR_CFG_IO_ENABLE |
> +		CDNS_PCIE_LM_RC_BAR_CFG_IO_32BITS);
> +	cdns_pcie_writel(pcie, CDNS_PCIE_LM_RC_BAR_CFG, value);
> +}
> +
>  static int cdns_pcie_host_init_root_port(struct cdns_pcie_rc *rc)
>  {
>  	struct cdns_pcie *pcie = &rc->pcie;
> @@ -393,6 +421,32 @@ static int cdns_pcie_host_dma_ranges_cmp(void *priv, const struct list_head *a,
>          return resource_size(entry2->res) - resource_size(entry1->res);
>  }
>  
> +static void cdns_pcie_host_unmap_dma_ranges(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +	enum cdns_pcie_rp_bar bar;
> +	u32 value;
> +
> +	/* Reset inbound configuration for all BARs which were being used */
> +	for (bar = RP_BAR0; bar <= RP_NO_BAR; bar++) {
> +		if (rc->avail_ib_bar[bar])
> +			continue;
> +
> +		cdns_pcie_writel(pcie, CDNS_PCIE_AT_IB_RP_BAR_ADDR0(bar), 0);
> +		cdns_pcie_writel(pcie, CDNS_PCIE_AT_IB_RP_BAR_ADDR1(bar), 0);
> +
> +		if (bar == RP_NO_BAR)
> +			continue;
> +
> +		value = ~(LM_RC_BAR_CFG_CTRL_MEM_64BITS(bar) |
> +			  LM_RC_BAR_CFG_CTRL_PREF_MEM_64BITS(bar) |
> +			  LM_RC_BAR_CFG_CTRL_MEM_32BITS(bar) |
> +			  LM_RC_BAR_CFG_CTRL_PREF_MEM_32BITS(bar) |
> +			  LM_RC_BAR_CFG_APERTURE(bar, bar_aperture_mask[bar] + 2));
> +		cdns_pcie_writel(pcie, CDNS_PCIE_LM_RC_BAR_CFG, value);
> +	}
> +}
> +
>  static int cdns_pcie_host_map_dma_ranges(struct cdns_pcie_rc *rc)
>  {
>  	struct cdns_pcie *pcie = &rc->pcie;
> @@ -430,6 +484,29 @@ static int cdns_pcie_host_map_dma_ranges(struct cdns_pcie_rc *rc)
>  	return 0;
>  }
>  
> +static void cdns_pcie_host_deinit_address_translation(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(rc);
> +	struct resource_entry *entry;
> +	int r;
> +
> +	cdns_pcie_host_unmap_dma_ranges(rc);
> +
> +	/*
> +	 * Reset outbound region 0 which was reserved for configuration space
> +	 * accesses.
> +	 */
> +	cdns_pcie_reset_outbound_region(pcie, 0);
> +
> +	/* Reset rest of the outbound regions */
> +	r = 1;
> +	resource_list_for_each_entry(entry, &bridge->windows) {
> +		cdns_pcie_reset_outbound_region(pcie, r);
> +		r++;
> +	}
> +}
> +
>  static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
>  {
>  	struct cdns_pcie *pcie = &rc->pcie;
> @@ -487,6 +564,12 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
>  	return cdns_pcie_host_map_dma_ranges(rc);
>  }
>  
> +static void cdns_pcie_host_deinit(struct cdns_pcie_rc *rc)
> +{
> +	cdns_pcie_host_deinit_address_translation(rc);
> +	cdns_pcie_host_deinit_root_port(rc);
> +}
> +
>  int cdns_pcie_host_init(struct cdns_pcie_rc *rc)
>  {
>  	int err;
> @@ -499,6 +582,14 @@ int cdns_pcie_host_init(struct cdns_pcie_rc *rc)
>  }
>  EXPORT_SYMBOL_GPL(cdns_pcie_host_init);
>  
> +static void cdns_pcie_host_link_disable(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +
> +	cdns_pcie_stop_link(pcie);
> +	cdns_pcie_host_disable_ptm_response(pcie);
> +}
> +
>  int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
>  {
>  	struct cdns_pcie *pcie = &rc->pcie;
> @@ -524,6 +615,19 @@ int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
>  }
>  EXPORT_SYMBOL_GPL(cdns_pcie_host_link_setup);
>  
> +void cdns_pcie_host_disable(struct cdns_pcie_rc *rc)
> +{
> +	struct pci_host_bridge *bridge;
> +
> +	bridge = pci_host_bridge_from_priv(rc);
> +	pci_stop_root_bus(bridge->bus);
> +	pci_remove_root_bus(bridge->bus);
> +
> +	cdns_pcie_host_deinit(rc);
> +	cdns_pcie_host_link_disable(rc);
> +}
> +EXPORT_SYMBOL_GPL(cdns_pcie_host_disable);
> +
>  int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  {
>  	struct device *dev = rc->pcie.dev;
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
> index c671e25a481b..9068f140596a 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.h
> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
> @@ -523,6 +523,7 @@ static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
>  int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc);
>  int cdns_pcie_host_init(struct cdns_pcie_rc *rc);
>  int cdns_pcie_host_setup(struct cdns_pcie_rc *rc);
> +void cdns_pcie_host_disable(struct cdns_pcie_rc *rc);
>  void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
>  			       int where);
>  #else
> @@ -541,6 +542,10 @@ static inline int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  	return 0;
>  }
>  
> +static inline void cdns_pcie_host_disable(struct cdns_pcie_rc *rc)
> +{
> +}
> +
>  static inline void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
>  					     int where)
>  {
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

