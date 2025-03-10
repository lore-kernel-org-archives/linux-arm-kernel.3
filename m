Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BBCC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YaOCcmy58eOwSDVd9nh9pV2RLFcEnxpIKxadSEjVGyk=; b=TlFaPxrSyLLX2X
	m+UPMABxCXPnqkzdUcoyQA95Dv/ZXJlNO2i7ZBNMtXa6ou+ul0ndBsULCVAN6Xjr0lmEvNPvz2XJC
	fmzNFv+D1iAKfD5m6vQf/JtsazRyN3er2HNFYkxirvqAD3cw+BTRT0ADnPSmgQA0yNHtuIK4VplWy
	tQV3STtsWnOeDloNF3dWZxWHQrb39X+f31KcC33UoHM93hEq6NDLwAz3SJ87SjL9ilbQAvFrWt0zE
	J51Bwi31KOuMLPY9Qg7nodzpcoWrGp+s+FKd9GQk+3iQSdHVQtTAJ41kP1FFGoQtVZMt2tGdfqvg1
	g5S+HDIbwKbIJnkELHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgTW-00000003QQJ-2Rpz;
	Mon, 10 Mar 2025 16:59:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgC1-00000003NEG-3hXj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 16:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=YaOCcmy58eOwSDVd9nh9pV2RLFcEnxpIKxadSEjVGyk=; b=QymM4JZY3FtC9lbW+7uXt+QlNn
	SQnDjM2rSMyamE84GSbBgjBoHuLZHQQ8LHAlbax3GAehswJ81GQkrZpTJlGQohaX60fR+RH1+KbIv
	zgQl8AbLgBdwK7+dUfXm6Vzah3LujtYRI1y2gaSVHvLii10Iw+V1qYmfkxIaQgqAKC3h2QOqTKTAR
	zmYMoCZsWV3wv23Z83xw0nzmsHO6FcY75wkGZLV2PUUjuXpW8q5JQY/FD7NIwEtMaynbcbcvH6F5n
	UPjAJG4yKCBWinJ1UH+OUeBdGaeTlKwDSfb0yWZLm4dM3qdSmJ8J94xc3a1e9pKvmPiJSU4izw8fY
	t15XDTkw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgBz-00000001wCL-03pu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0E0E8A46040;
	Mon, 10 Mar 2025 16:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3255C4CEF0;
	Mon, 10 Mar 2025 16:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741624883;
	bh=5Zuw8hUznANvPIatpdN56MqZ7+mKjrGRf7vCtpf94D0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=CyxqHbUGsjYvKn3FVeZW/HuHfKPBRCxzzMTwqiKjtFiHxte4Vl4VInowvl3wTArrR
	 KjsnWZEtuvQbglKKZvNcoKFaIHuNgmgJYhS9Ph1M5IqCLQekQz2MvMokEkOMw7yI4x
	 U3M8RkVwlPfEyTLSdIXuzi2aAGNoryqqYAsha8k6NC8RCKm1qsVPonTRNPoDaqVEwl
	 cHU+8bafTy3sVee3mmZ8P6TDGY0xHFkich12lMdI5zeUF1LZuwel7kFhCcCOMv0fyy
	 keIiZ83UKBImR3PyAuTistfB30rkUl1VlgBzBr/GvKYEr1maJBd8mYEFv91an5Bu4Q
	 ABY+QXm8lP0kA==
Date: Mon, 10 Mar 2025 11:41:22 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
	catalin.marinas@arm.com, conor+dt@kernel.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com,
	krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
	lenb@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com,
	maz@kernel.org, mingo@redhat.com, oliver.upton@linux.dev,
	rafael@kernel.org, robh@kernel.org, ssengar@linux.microsoft.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de,
	wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com,
	devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	x86@kernel.org, apais@microsoft.com, benhill@microsoft.com,
	bperkins@microsoft.com, sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next v5 11/11] PCI: hv: Get vPCI MSI IRQ domain
 from DeviceTree
Message-ID: <20250310164122.GA551965@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307220304.247725-12-romank@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_164127_304685_F794477D 
X-CRM114-Status: GOOD (  16.51  )
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

On Fri, Mar 07, 2025 at 02:03:03PM -0800, Roman Kisel wrote:
> The hyperv-pci driver uses ACPI for MSI IRQ domain configuration on
> arm64. It won't be able to do that in the VTL mode where only DeviceTree
> can be used.
> 
> Update the hyperv-pci driver to get vPCI MSI IRQ domain in the DeviceTree
> case, too.
> 
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>

A couple minor comments below, but I don't have any objection to this,
so if it's OK with the pci-hyperv.c folks, it's OK with me.

> +#ifdef CONFIG_OF
> +
> +static struct irq_domain *hv_pci_of_irq_domain_parent(void)
> +{
> +	struct device_node *parent;
> +	struct irq_domain *domain;
> +
> +	parent = of_irq_find_parent(hv_get_vmbus_root_device()->of_node);
> +	domain = NULL;
> +	if (parent) {
> +		domain = irq_find_host(parent);
> +		of_node_put(parent);
> +	}
> +
> +	return domain;

I think this would be a little simpler as:

  parent = of_irq_find_parent(hv_get_vmbus_root_device()->of_node);
  if (!parent)
    return NULL;

  domain = irq_find_host(parent);
  of_node_put(parent);
  return domain;

> +}
> +
> +#endif
> +
> +#ifdef CONFIG_ACPI
> +
> +static struct irq_domain *hv_pci_acpi_irq_domain_parent(void)
> +{
> +	struct irq_domain *domain;
> +	acpi_gsi_domain_disp_fn gsi_domain_disp_fn;
> +
> +	if (acpi_irq_model != ACPI_IRQ_MODEL_GIC)
> +		return NULL;
> +	gsi_domain_disp_fn = acpi_get_gsi_dispatcher();
> +	if (!gsi_domain_disp_fn)
> +		return NULL;
> +	domain = irq_find_matching_fwnode(gsi_domain_disp_fn(0),
> +				     DOMAIN_BUS_ANY);
> +
> +	if (!domain)
> +		return NULL;
> +
> +	return domain;

  if (!domain)
    return NULL;

  return domain;

is the same as:

  return domain;

or even just:

  return irq_find_matching_fwnode(gsi_domain_disp_fn(0), DOMAIN_BUS_ANY);

> +}

