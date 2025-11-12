Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDE4CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMAr8wdnPPoO7wHcAaGvU/gzJmIVp6xl56jw4pQIXoc=; b=dJo946t2snxk9gcrCJaF0YI9A1
	iQzQ6v1ihpN6nKRNJqJlzy9Yvsjw47tFNwtPyO3iTZpLs19R8zGJyDb1F7qULjcNvk9HA3up9hC11
	aCwqbTlDYy3RIsnOXbPTANWa3JaP3jePAWH+GoXq9+OlfqDxCoDhYpCRhxQ1HOD07WPrnUgybx5Di
	6MERdYPmWlXC+6meBSVU30LlyDY9zDyHCzCX1WPVKCcs6tYp5/SZkDUeUKjYo6gPHMBLUMC2DwIzX
	IPXqBbQBe3Hw2TdA6/VSqqHzSX+qH6FQm9TAftPQXle7qNb5W1CviMlgeycX169WydV714xozmBxr
	Kr0lzHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ67s-00000008KZV-3dHs;
	Wed, 12 Nov 2025 08:22:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ67q-00000008KZ2-2BJz;
	Wed, 12 Nov 2025 08:22:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A9C841573;
	Wed, 12 Nov 2025 08:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A174BC4CEF8;
	Wed, 12 Nov 2025 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762935765;
	bh=WHWCVmYt6UtQ3D5Ri8XoM/WvWGHNmlnb2EcUM8qufBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kttxp00Xc7Q2NVR9zWtAQOW32+K5IUJtvvbjIacWFrREkJHKtXZvOqAE9Gua6PoGC
	 Z0PWHqSpMfxReJv7iL5UYQPsbL046fDjJOWbbV4bdQ4pdjMz2nIzAIHZhMw7bzayUP
	 y2Bv+7T/1TtBofUmqHq5O+CejsEDVgK3i6OQG2/ijVcXuHJBdoNk3MTvk2hn7OOdM5
	 4L32vutb2OpX5twJ0FaMH2B6Hocia+8TeMb5mZAZkTeNOGVOALNy25ugZsQxFkScZ+
	 F5ZGrNhFI8NY7qx2IFdGhctYLQpV0z7JBTaVUMm/cMNC1+rmxzdT6Bx+4s4v6urya+
	 S/b1vretnjh2g==
Date: Wed, 12 Nov 2025 09:22:36 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Richard Zhu <hongxing.zhu@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hans Zhang <hans.zhang@cixtech.com>, linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 1/4] PCI: dwc: Advertise L1 PM Substates only if driver
 requests it
Message-ID: <aRRDzKFVTFTIuvvh@ryzen>
References: <20251111221621.2208606-1-helgaas@kernel.org>
 <20251111221621.2208606-2-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111221621.2208606-2-helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_002246_579910_CA5C61C4 
X-CRM114-Status: GOOD (  11.20  )
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

On Tue, Nov 11, 2025 at 04:16:08PM -0600, Bjorn Helgaas wrote:
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1060,6 +1060,8 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>  		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
>  	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
>  
> +	dw_pcie_config_l1ss(pci);

The name dw_pcie_config_l1ss() sounds like we are enabling l1ss.

I know naming is hard.

Perhaps dw_pcie_disable_unsupported_l1ss() ?

Or something similar.


> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1067,6 +1067,8 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>  	val &= ~REQ_NOT_ENTR_L1;
>  	writel(val, pcie->parf + PARF_PM_CTRL);
>  
> +	pci->l1ss_support = true;
> +
>  	val = readl(pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
>  	val |= EN;
>  	writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);

While it seems like ops_2_7_0 is the only type that explicitly does a
register write to enable L1ss, other versions might have the register
as enabled by default, so it would be nice if Mani could confirm exactly
which versions that should set l1ss_support = true.


Kind regards,
Niklas

