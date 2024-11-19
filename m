Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B1BD60D1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnyTQoucjCJF6wmIwhYG5inOePLfmtO8FEJdC34/wtE=; b=0wSykFd0l2dJicuLUDXZkaVV1f
	PY2jT/txTjxeosPW2ue0ko/KMWjecYGa9Psd84bdPF7fcT5W2J5LbadW4lMkbIxu9LsmQTnO7WkSw
	vcPBNZ+BR4X/m5/zsf+wuqmMflIAWYqWZPkxC5okbHYdQ+GfLCnigt9oAirXfujfm7cZ1yVHfCieh
	5rdID4vP/4KM7f5PavKJTIywJqkq+Tn3jqkeIDAqhtUm06xAAWhmcZvHsbefFq8eY8J64IP+SOU/d
	x73MnZa3JSvAHQnQXrTazXrdNHNp40MZkBFxdjXC2E4JtUx9mQFdrwGvoQRKauifcOiDNCR9eyOoo
	HfOKL6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLDi-0000000C0DU-0GET;
	Tue, 19 Nov 2024 10:12:30 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLCl-0000000C05F-1xdC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 10:11:32 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-72041ff06a0so2086217b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 02:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732011090; x=1732615890; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CnyTQoucjCJF6wmIwhYG5inOePLfmtO8FEJdC34/wtE=;
        b=KogpWRLMkQcBMvQ6dqCT+CUzEnf/GOkSMIO3PkeKj0dTsASaSZ/oz7ChUgfO8w9Dc4
         j7/nrLc8aQd/OE7s7WMJre3bUAMTLoO4hLtmNWx4UV59ng9aEk9T73zlhF1X4A7ucDCG
         BYnbw5s3508SijgxpgIk7dcOuTAzdvLBZ/XoqVmPCgdGFj/3Wr2bU9pIzXIpePKnqQBH
         NMzVM9oAWadWHnN7g9HSLK6ij3x5574XtcvufvHJco76N5ByNmjMXuSAnSI6l1SDWjyF
         QUejuxC1P5NZsjxQqqaDC0quT0/zPwv0Gz73Bg+LCTlJHycVcgn/wDgkDWWtlurhOhNx
         BXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732011090; x=1732615890;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CnyTQoucjCJF6wmIwhYG5inOePLfmtO8FEJdC34/wtE=;
        b=q3FE29cvgyknwk79RxPDVsFWDbRPJiFzNvQm8vGYBjYaPefvcpZcrYLkOp6eqMAS6K
         l2QbZYxPr5FXmbzf7r2sGR/rqu6GZiAoiDFjzPGeF+FGRgCSvqvGHuO3wf7n1LVg4Spm
         i/iJ558VKDISNOAsgxmL0te2D87jOJrbsxNQbkhS7R8E/YDyL5+VzurX/KxwiigA0vXf
         /MGMNn03a+UQYerXdq3IeiVo3dMbPh+QXY47wFOCYlZdyDIQwkl0TT17jRSVe49puYmq
         q100e1vRvm0zIEgXfCjfUiHg4PLt/GzpN3jIfj0KTmRI5Ks8rc2oq0RoVt3DKvVFAGEq
         /QrA==
X-Forwarded-Encrypted: i=1; AJvYcCUBFkZUX0/wyf9IJmnnHXJfqUXFuVTs2bSnOWu3kxnpTR74uiXwVHKrauOB2RJn4bleIWb15eDQOCEwy+up16eH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt5vlf9jsW0LKiFJh3qOJb11p9xNw/VtDAt9oMU3098eyDbE6v
	BEN4SuDTow1p4t4S2Dpdjpkzu8p2BLldcqDHD6DvBeNirm0/7VGLuSqaZS6jdw==
X-Google-Smtp-Source: AGHT+IESlkjEE6zH0kn+oCxIKUTmqhbcdMhskn/HWsahaCPc0PrMTVIaTfJQLiOkn57Z+JD1MOMz3Q==
X-Received: by 2002:a05:6a00:9294:b0:71d:f15e:d026 with SMTP id d2e1a72fcca58-72476b7271emr20918708b3a.3.1732011090344;
        Tue, 19 Nov 2024 02:11:30 -0800 (PST)
Received: from thinkpad ([117.213.96.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72477120a13sm8051655b3a.60.2024.11.19.02.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 02:11:29 -0800 (PST)
Date: Tue, 19 Nov 2024 15:41:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v7 2/7] PCI: dwc: Using parent_bus_addr in of_range to
 eliminate cpu_addr_fixup()
Message-ID: <20241119101121.t4kaaeuvj37scmxm@thinkpad>
References: <20241029-pci_fixup_addr-v7-0-8310dc24fb7c@nxp.com>
 <20241029-pci_fixup_addr-v7-2-8310dc24fb7c@nxp.com>
 <20241115175148.tqzqiv53mccz52tq@thinkpad>
 <ZzeejnBC4KrJoHqm@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzeejnBC4KrJoHqm@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_021131_511010_C5FFA95E 
X-CRM114-Status: GOOD (  35.08  )
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

On Fri, Nov 15, 2024 at 02:18:38PM -0500, Frank Li wrote:

[...]

> > > +		if (pci->using_dtbus_info) {
> > > +			index = of_property_match_string(np, "reg-names", "config");
> > > +			if (index < 0)
> > > +				return -EINVAL;
> > > +			/*
> > > +			 * Retrieve the parent bus address of PCI config space.
> > > +			 * If the parent bus ranges in the device tree provide
> > > +			 * the correct address conversion information, set
> > > +			 * 'using_dtbus_info' to true, The 'cpu_addr_fixup()'
> > > +			 * can be eliminated.
> > > +			 */
> >
> > Nobody will switch to 'ranges' property if you mention it in comments. We
> > usually add dev_warn_once() to print a warning for broken DT so that the users
> > will try to fix it. You can use below diff (as a separate patch ofc):
> >
> > ```
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > index 6d6cbc8b5b2c..d1e5395386fe 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > @@ -844,6 +844,9 @@ void dw_pcie_iatu_detect(struct dw_pcie *pci)
> >                  dw_pcie_cap_is(pci, IATU_UNROLL) ? "T" : "F",
> >                  pci->num_ob_windows, pci->num_ib_windows,
> >                  pci->region_align / SZ_1K, (pci->region_limit + 1) / SZ_1G);
> > +
> > +       if (pci->ops && pci->ops->cpu_addr_fixup)
> > +               dev_warn_once(pci->dev, "Broken \"ranges\" property detected. Please fix DT!\n");
> 
> How about "Detect use old method "cpu_addr_fixup()", it should correct DT's
> 'ranges' and remove cpu_addr_fixup()?
> 

Hmm, yeah makes sense:

	/*
	 * If the parent 'ranges' property in DT correctly describes the address
	 * translation, cpu_addr_fixup() callback is not needed.
	 */
	dev_warn_once(pci->dev, "cpu_addr_fixup() usage detected. Please fix DT!\n";

But then the drivers need to be smart enough to detect the valid parent 'ranges'
property and then only use the callback. Because, callback has to be present to
support older DTs.

> >  }
> >
> >  static u32 dw_pcie_readl_dma(struct dw_pcie *pci, u32 reg)
> > ```
> >
> > > +			of_property_read_reg(np, index, &pp->cfg0_base, NULL);
> >
> > Can you explain what is going on here?
> 
> Because dwc use reg-name 'config' to get config space,
> of_property_read_reg() will get untranslate address 'parent' bus address.
> <0x8ff00000 0x80000> at example address.
> 
> cfg0_base is used to set outbound ATU.
> 

Ok, please add a comment like this:

	/* Get the untranslated 'config' address */

Same for other usage of of_property_read_reg().

> >
> > > +		}
> > > +
> > >  		pp->va_cfg0_base = devm_pci_remap_cfg_resource(dev, res);
> > >  		if (IS_ERR(pp->va_cfg0_base))
> > >  			return PTR_ERR(pp->va_cfg0_base);
> > > @@ -462,6 +505,9 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> > >  		pp->io_base = pci_pio_to_address(win->res->start);
> > >  	}
> > >
> > > +	if (dw_pcie_get_untranslate_addr(pci, pp->io_bus_addr, &pp->io_base))
> > > +		return -ENODEV;
> >
> > Use actual return value here and below.
> >
> > > +
> > >  	/* Set default bus ops */
> > >  	bridge->ops = &dw_pcie_ops;
> > >  	bridge->child_ops = &dw_child_pcie_ops;
> > > @@ -722,6 +768,8 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
> > >
> > >  	i = 0;
> > >  	resource_list_for_each_entry(entry, &pp->bridge->windows) {
> > > +		resource_size_t parent_bus_addr;
> > > +
> > >  		if (resource_type(entry->res) != IORESOURCE_MEM)
> > >  			continue;
> > >
> > > @@ -730,9 +778,14 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
> > >
> > >  		atu.index = i;
> > >  		atu.type = PCIE_ATU_TYPE_MEM;
> > > -		atu.cpu_addr = entry->res->start;
> > > +		parent_bus_addr = entry->res->start;
> > >  		atu.pci_addr = entry->res->start - entry->offset;
> > >
> > > +		if (dw_pcie_get_untranslate_addr(pci, entry->res->start, &parent_bus_addr))
> > > +			return -EINVAL;
> > > +
> > > +		atu.cpu_addr = parent_bus_addr;
> > > +
> > >  		/* Adjust iATU size if MSG TLP region was allocated before */
> > >  		if (pp->msg_res && pp->msg_res->parent == entry->res)
> > >  			atu.size = resource_size(entry->res) -
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > > index 347ab74ac35aa..f8067393ad35a 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > @@ -463,6 +463,14 @@ struct dw_pcie {
> > >  	struct reset_control_bulk_data	core_rsts[DW_PCIE_NUM_CORE_RSTS];
> > >  	struct gpio_desc		*pe_rst;
> > >  	bool			suspended;
> > > +	/*
> > > +	 * Use device tree 'ranges' property of bus node instead using
> > > +	 * cpu_addr_fixup(). Some old platform dts 'ranges' in bus node may not
> > > +	 * reflect real hardware's behavior. In case break these platform back
> > > +	 * compatibility, add below flags. Set it true if dts already correct
> > > +	 * indicate bus fabric address convert.
> >
> > 	/*
> > 	 * This flag indicates that the vendor driver uses devicetree 'ranges'
> > 	 * property to allow iATU to use the Intermediate Address (IA) for
> > 	 * outbound mapping. Using this flag also avoids the usage of
> > 	 * 'cpu_addr_fixup' callback implementation in the driver.
> > 	 */
> >
> > > +	 */
> > > +	bool			using_dtbus_info;
> >
> > 'use_dt_ranges'?
> 
> It will be confused because pcie node alreadys use ranges, just parent bus
> 's ranges is wrong.
> 
> 'use_dtbus_ranges' ?
> 

There is nothing called 'dtbus'. How about, "use_parent_dt_ranges"?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

