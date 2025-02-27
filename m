Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E900AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=VbAHL8IagjkOx1wbGHgEbwPoYTQJLkUXNTIF6YfyPxE=; b=rRvQ9zu+V/L0Qt
	93Tyoha+wDMC9FYl4d+jRB7Nc1sLM56RndM9d5drhIqgbhN12o7y7RxK71hBrCITFXZolAVVOmiFy
	xtbXtf3+52FACgaU2AOqZFHYaPXAlcmPI5otebmCMXV3m2Gz3VG4gIQzzfkVw4wve/8TBsfWlUKYm
	EEiQwNyUHjJqb7yRAcQvm+FPVdbpiDBHtL7h6bf3a4dQwDUwfe0Q2TU7RkJNL0J1TJoWl0yUIPRbS
	l7jc0uasWz63C33PeZI5Xq4My/y+Dd9C5eRx9gaYURUKli1KveiUYbNtOG5UA50ROBItlfLxsCen/
	k+HccbzaeYTYDnVf3sRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRUi-00000005mXl-3hc5;
	Thu, 27 Feb 2025 00:11:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRRs-00000005mAX-0Li6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 00:08:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FE605C70ED;
	Thu, 27 Feb 2025 00:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC32FC4CED6;
	Thu, 27 Feb 2025 00:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740614898;
	bh=xgs7rT60JFXEHjg9mQodKhFyFx8CjHFlo+z0Izl+sPE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=g2xCzwEZWvRK21RHGuJr1sXCfA+YRAmrbtRAF4GdHDCVQ3wVOMp9umP4H7FarbFdq
	 7frYHCCegvUG0mb37YjiDdZI3TS/JXMRQoy8q3nP8xTtrzv/gKad+G/LeFkkA1GdFq
	 +Xb/QGPx2cFkpgnS1M0vlAOmhAYWCMBFnU2lez3G/iFcVyxa7KOkyiINv+WN2gLZOZ
	 3iXL2RslMqWfH1h/qfcGQk7RDLA0bYR35kyCAplYb7xyeHFgDhnBDatEcCUXqJi1Ug
	 vIXiULOxDdWv9Ye3W2luRCJb+zAmf0jgS7eqPIm2IKSwpg2PlAXAvDncAFh4R3rhSd
	 +wcSfEiHPTm/Q==
Date: Wed, 26 Feb 2025 18:08:17 -0600
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
Subject: Re: [PATCH v9 3/7] PCI: Add parent_bus_offset to resource_entry
Message-ID: <20250227000817.GA565171@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-pci_fixup_addr-v9-3-3c4bb506f665@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_160820_217087_17F93D50 
X-CRM114-Status: GOOD (  15.57  )
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

On Tue, Jan 28, 2025 at 05:07:36PM -0500, Frank Li wrote:
> Introduce `parent_bus_offset` in `resource_entry` and a new API,
> `pci_add_resource_parent_bus_offset()`, to provide necessary information
> for PCI controllers with address translation units.
> 
> Typical PCI data flow involves:
>   CPU (CPU address) -> Bus Fabric (Intermediate address) ->
>   PCI Controller (PCI bus address) -> PCI Bus.
> 
> While most bus fabrics preserve address consistency, some modify addresses
> to intermediate values. 

s/modify/translate/

Specifically, they *translate* addresses, which means the same offset
is added to every address in the range, as opposed to masking or some
other transformation.

I think we can take advantage of this to simplify the callers of
.cpu_addr_fixup() later.

Ironically, most of the .cpu_addr_fixup() implementations *do* mask
the address, e.g., cdns_plat_cpu_addr_fixup() masks with 0x0fffffff.
But I think this is actually incorrect because masking results in a
many-to-one mapping, e.g.,

  0x42000000 & 0x0fffffff == 0x02000000
  0x52000000 & 0x0fffffff == 0x02000000

But presumably the addresses we pass to cdns_plat_cpu_addr_fixup()
don't cross a 256MB (0x10000000) boundary, so we could accomplish the
same by subtracting 0x40000000:

  0x42000000 - 0x40000000 == 0x02000000

> +++ b/drivers/pci/of.c
> @@ -402,7 +402,17 @@ static int devm_of_pci_get_host_bridge_resources(struct device *dev,
>  			res->flags &= ~IORESOURCE_MEM_64;
>  		}
>  
> -		pci_add_resource_offset(resources, res,	res->start - range.pci_addr);
> +		/*
> +		 * IORESOURCE_IO res->start is io space start address.
> +		 * IORESOURCE_MEM res->start is cpu start address, which is the
> +		 * same as range.cpu_addr.
> +		 *
> +		 * Use (range.cpu_addr - range.parent_bus_addr) to align both
> +		 * IO and MEM's parent_bus_offset always offset to cpu address.
> +		 */
> +
> +		pci_add_resource_parent_bus_offset(resources, res, res->start - range.pci_addr,
> +						   range.cpu_addr - range.parent_bus_addr);

Wrap to fit in 80 columns like the rest of the file.  Will have to
unindent the two lines of arguments to make this work.

