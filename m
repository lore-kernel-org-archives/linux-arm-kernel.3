Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A45C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=smPDVXZk7ynwIBVm1wVsyCoWltHU6+bYYWrhJekVT4k=; b=TwKEm6/aAH5PBE
	/KBoVGg/oWzTTwb7Pr3/2RgECBDTh9NGovKT8qPp6jkkN053pCrFl+/SbKv5ruYKcQVz9oId5Fa/8
	Ldh/K57aPH/CA5/WNa39CpAUlyXh1F3MDZ1YxkRBBO5BMLTrrf0aBKHGEMccwn7aGOr6MpgN+npYn
	5S6Fc4jIF7cGhgc72LL4uvCb0MzUd8snreYwkrbR2KFki2p1pDKSkeUoOV4kFhY9knxvsPMQHLKV+
	AW6RG5ZVzmXd3LULZm473S6dbySFpKAVFEaP6HghU7l056DXW9nPVTugVrzxqO+acIvy8iFQ4JTSQ
	ZCwyvUgz25NGu6Ki7gbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7mL-00000008GhI-3rsn;
	Tue, 10 Jun 2025 22:49:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4P1-00000007teR-2gzm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 19:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1849A51075;
	Tue, 10 Jun 2025 19:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D65FC4CEED;
	Tue, 10 Jun 2025 19:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749582774;
	bh=MkL+yCkTlVRPMl3I1W8UosEvrkNCnEgFMpcNSMX4iYk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MbkEg9dthwa2baq75Dx0k/Ao34Hg+0Lps/kfKNtnUino7oCQ0MF1drypvKffIZQu0
	 uiRTQ9av8P0Hx2NYRk3UAFk8i62vKtbgPUJa7yCPvQbqnfGOYyTG2vIBX0BgVgHKph
	 GtUEbXPecCetvmHALutL7aVaIEkDF0Ej+3DrO6t3N/FPG+aVWHYuLxVmpX0+A2IIHb
	 8JYsSfKW7lTkARyKIW1S5LJaa58QcMHMCg+T7XPSbX7LqdW+1KSvgc7viiC7Ziu9P9
	 ycSnaZp8yG0WDbXsyHd2xwJJ9Ym9oxWnnXPtidAt9naJL59hbR5CDPKeC7yaGo2aD7
	 x+8PJRxiQTbwg==
Date: Tue, 10 Jun 2025 14:12:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] PCI: xilinx: Wait for link-up status during
 initialization
Message-ID: <20250610191253.GA820218@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610143919.393168-1-mike.looijmans@topic.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_121255_741662_9AF54D7B 
X-CRM114-Status: GOOD (  19.00  )
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

On Tue, Jun 10, 2025 at 04:39:03PM +0200, Mike Looijmans wrote:
> When the driver loads, the transceiver and endpoint may still be setting
> up a link. Wait for that to complete before continuing. This fixes that
> the PCIe core does not work when loading the PL bitstream from
> userspace. Existing reference designs worked because the endpoint and
> PL were initialized by a bootloader. If the endpoint power and/or reset
> is supplied by the kernel, or if the PL is programmed from within the
> kernel, the link won't be up yet and the driver just has to wait for
> link training to finish.

> +static int xilinx_pci_wait_link_up(struct xilinx_pcie *pcie)
> +{
> +	u32 val;
> +
> +	/*
> +	 * PCIe r6.0, sec 6.6.1 provides 100ms timeout. Since this is FPGA
> +	 * fabric, we're more lenient and allow 200 ms for link training.

Does this FPGA fabric refer to the Root Port or to the Endpoint?  We
should know whether this issue is common to all xilinx Root Ports or
specific to certain Endpoints.

I assume that even if we wait for the link to come up and then wait
PCIE_T_RRS_READY_MS before sending config requests, this Endpoint is
still not ready to return an RRS response?  I'm looking at this text
from sec 6.6.1:

  Unless Readiness Notifications mechanisms are used, the Root Complex
  and/or system software must allow at least 1.0 s following exit from
  a Conventional Reset of a device, before determining that the device
  is broken if it fails to return a Successful Completion status for a
  valid Configuration Request. This period is independent of how
  quickly Link training completes.

  Note: This delay is analogous to the Trhfa parameter specified for
  PCI/PCI-X, and is intended to allow an adequate amount of time for
  devices which require self initialization.

It seems like the PCI core RRS handling should already account for
this 1.0 s period.

> +	 */
> +	return readl_poll_timeout(pcie->reg_base + XILINX_PCIE_REG_PSCR, val,
> +			(val & XILINX_PCIE_REG_PSCR_LNKUP), 2 * USEC_PER_MSEC,
> +			2 * PCIE_T_RRS_READY_MS * USEC_PER_MSEC);
> +}

