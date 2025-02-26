Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17599C19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 23:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=TAJhZpOKAGiuoaxok/xAaYksYfuS09MvyjeZD/de2No=; b=gBiowZDfGLf9e0
	OLHwxEablS+t1yLsFr+yjXfLl+YF247yqkTDH6nf/EC0XgDnWp7Ja9fZPh8E99AyqBGrEd6O/49Ke
	0ribYgbpvZ3jyCjDJOGG04t/+unpGTMIOzmdG8zT54RV0qrwiD0ywEUQuy0Xxz5IcqbJquomK18rO
	5QnFm2bJuoQHuVBHprb2N67mYaysURyMjO7zVIsIqxkDGR6uTJicafcLTPdULwhUIxkygQiJqtcOv
	KZT5OpfyIKtnN0X7PvqV9X/w2Up2OOOqRGGju2+Fm+e68HDl11PWdJNqHau2mvDLBWObnPox6O2TW
	G9I8lgdDihuJkt36h9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQxm-00000005iWV-2wMj;
	Wed, 26 Feb 2025 23:37:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQuN-00000005iGT-36UG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 23:33:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA6A3612C7;
	Wed, 26 Feb 2025 23:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD53C4CED6;
	Wed, 26 Feb 2025 23:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740612822;
	bh=JU2kjfLvtCKvCAcKZzE2OOPkpTNFwZNgTF7Ciu+cRA4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=mph1cYH0/GtxEnkYNjCOOhVVx56YpsQjSOk1NStNxEAjASxrD7HdP89Eu4QiFsjQp
	 FaY8Xks0fxxWsXbG0tGc1hVg1E8MwdMRqFTK8X7jjvATAcXjECwZqgiyPCvT3dHxUt
	 qW1qWzKdtvNXzRAGOsnQSV66plI7HGitg8nnLwYby1irqcym0luHmdV+wN76k2JwOm
	 iR34vJbsDmq6bIXion0gGlpstWi49EKe12WKUXlHfzk0KtCantRd19Hb9ATkeh73Qx
	 sOq2e+gAUnuYFRHoKt4gCCqbzhMUX33KGRP89sfavZuSOlnmEtXD32v2ULnB/BGLti
	 +yYugUjDQL0qQ==
Date: Wed, 26 Feb 2025 17:33:39 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
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
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 4/7] PCI: dwc: Use devicetree 'ranges' property to get
 rid of cpu_addr_fixup() callback
Message-ID: <20250226233339.GA562682@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-pci_fixup_addr-v9-4-3c4bb506f665@nxp.com>
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

On Tue, Jan 28, 2025 at 05:07:37PM -0500, Frank Li wrote:
> parent_bus_offset in resource_entry can indicate address information just
> ahead of PCIe controller. Most system's bus fabric use 1:1 map between
> input and output address. but some hardware like i.MX8QXP doesn't use 1:1
> map. See below diagram:
> ...

> @@ -448,6 +451,26 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	if (IS_ERR(pp->va_cfg0_base))
>  		return PTR_ERR(pp->va_cfg0_base);
>  
> +	if (pci->use_parent_dt_ranges) {
> +		if (pci->ops->cpu_addr_fixup) {
> +			dev_err(dev, "Use parent bus DT ranges, cpu_addr_fixup() must be removed\n");
> +			return -EINVAL;
> +		}
> +
> +		index = of_property_match_string(np, "reg-names", "config");
> +		if (index < 0)
> +			return -EINVAL;
> +
> +		 /*
> +		  * Retrieve the parent bus address of PCI config space.
> +		  * If the parent bus ranges in the device tree provide
> +		  * the correct address conversion information, set
> +		  * 'use_parent_dt_ranges' to true, The
> +		  * 'cpu_addr_fixup()' can be eliminated.
> +		  */
> +		of_property_read_reg(np, index, &pp->cfg0_base, NULL);
> +	}

I think all this code dealing with the "config" resource could go in a
helper function.  It's kind of a lot of clutter in
dw_pcie_host_init().

It would be nice to assign pp->cfg0_base once, not assign res->start
to it and then possibly overwrite it later.

> @@ -841,6 +841,15 @@ void dw_pcie_iatu_detect(struct dw_pcie *pci)
>  	pci->region_align = 1 << fls(min);
>  	pci->region_limit = (max << 32) | (SZ_4G - 1);
>  
> +	if (pci->ops && pci->ops->cpu_addr_fixup) {
> +		/*
> +		 * If the parent 'ranges' property in DT correctly describes
> +		 * the address translation, cpu_addr_fixup() callback is not
> +		 * needed.
> +		 */
> +		dev_warn_once(pci->dev, "cpu_addr_fixup() usage detected. Please fix DT!\n");
> +	}

Can you split the warnings out to a separate patch?  I think we should
warn once in every initialization path where .cpu_addr_fixup() could
be used, i.e.,

  dw_pcie_host_init()
  dw_pcie_ep_init()
  cdns_pcie_host_setup()
  cdns_pcie_ep_setup()

IMO these should warn if .cpu_addr_fixup() is implemented, regardless
of use_parent_dt_ranges.

I'm still puzzling over some of the rest of this, so no need to post a
revised series yet.

Bjorn

