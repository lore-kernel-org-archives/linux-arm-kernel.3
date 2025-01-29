Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3401C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 23:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=yjmn8GP0AE0zs7vq4uGkOY53WP9c4j791ynTVFxcub8=; b=J+CzmlWZTvJB+t
	6ez1vi3jVpUCCnF3JoGfwfpx6XzEeJivsdklPJ4rZuGPKodwWaO/V1dVbE0ChcoDFImtIQhbQ/iYk
	dqEqzbp218bNq9MrjoK8UgRTNYodR6ASBl8lnbUBwGDxb93ipsfI9wauHmnfTP3irkWqLecYeGmJZ
	fSpZUGVdlO9AgTGH7kbfB149rXXoYLU8L45krS3xuiwqvmsa8tOXriEoMJXXW6GCVsKBgyk9FlhSG
	5bXPw2FHKVFdCMg1WIPp9VLXkijTuSF+ClU197wkEy45wEw33TqdJCWVnmUm+04jxkgQsL8+4X9UL
	CMysKDdHK/OkE/Bsc9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHQq-00000007wuz-2eXQ;
	Wed, 29 Jan 2025 23:25:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHPV-00000007wpa-0iJR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 23:23:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 439AA5C4D02;
	Wed, 29 Jan 2025 23:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FAEC4CED1;
	Wed, 29 Jan 2025 23:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738193032;
	bh=7V2/4xR4xd3iiCg+7a6U3WGS/XW+gb5GEdujfPwyMsE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OHwWQvo0L1AayY0hDP0TCxcnrhzQgoo4lUcakGOUtk7HSj8GcTReW/DXtmbtiyZ+x
	 g/LimFopBaPAJukTFOzKJ+S2RpGZQcCvhKzrqQyzP59grcJ0z/+LbpNslG4/aobG7w
	 nMSqbnZIlVb9Yv0VmiUKUYXhJZds3rXoku7vDqfmqNpHQYIko4IpdBdPKKd6ZSJH3i
	 Pu5G32ejaTjVWIYrx9A7yAQNhYVCKoyOYf8ovcjFfdfPsNZq68+YXw7RX9L/4UW0+s
	 eshqKZxfNutl6yIy+86UkbRw0GoHslBUoDhg8dOFs4EiOfawNvSZPs1zlo1WmPMEww
	 FS1fRYPlwQ5Pw==
Date: Wed, 29 Jan 2025 17:23:50 -0600
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
Subject: Re: [PATCH v9 2/7] PCI: dwc: Rename cpu_addr to parent_bus_addr for
 ATU configuration
Message-ID: <20250129232350.GA527937@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-pci_fixup_addr-v9-2-3c4bb506f665@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_152353_261906_7E578217 
X-CRM114-Status: GOOD (  10.53  )
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

On Tue, Jan 28, 2025 at 05:07:35PM -0500, Frank Li wrote:
> Rename `cpu_addr` to `parent_bus_addr` in the DesignWare ATU configuration.
> The ATU translates parent bus addresses to PCI addresses, which are often
> the same as CPU addresses but can differ in systems where the bus fabric
> translates addresses before passing them to the PCIe controller. This
> renaming clarifies the purpose and avoids confusion.

Based on dw_pcie_ep_inbound_atu() below, I guess the ATU can also
translate PCI addresses from incoming DMA to parent bus addresses?

It's worth noting here that this patch only renames the member, and
IIUC, parent_bus_addr still incorrectly contains CPU physical
addresses.

> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -128,7 +128,7 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  }
>  
>  static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
> -				  dma_addr_t cpu_addr, enum pci_barno bar,
> +				  dma_addr_t parent_bus_addr, enum pci_barno bar,
>  				  size_t size)

