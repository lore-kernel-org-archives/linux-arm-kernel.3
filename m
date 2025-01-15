Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DC8C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 21:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Ue2KKXpgWLBIe+28xWW+D0JlbfQ9tVX+h0LmxY1ArZA=; b=CFGCy/ZkHKCbIn
	Qy8XR++hYpzlzcSYV0Aepd8jXFqJaznEC6zzJR2ighBoWChxAJ+036F6ZZ3nLjXmQ+OP+pc57iaTE
	1asawqJOLCD04ODsprdEIiWjj1dcQ2sla6jiMGDFpHctxAe8LMcAeZT6XTLeQZxnLKRIIEaatp/0g
	tlWOJW/84kpgW0PbUWpu8yJ4km5tcadVMf9xRnH4zmG4s7kH5jtThLmDwulGriSW/KOMWXtHYsZoE
	0cM0BbAWmx2rzlDiStTQWKmSJw+01zdlR4kWU4P4u8PDWSfAAbmzkzSOFTuux+6FDu02u/D88U1ql
	ynvRqcWl0/vCJ3sMYfZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAXY-0000000D57i-1Y9X;
	Wed, 15 Jan 2025 21:03:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAVd-0000000D4mj-0QB9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 21:01:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3EDFCA424F8;
	Wed, 15 Jan 2025 20:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7620C4CED1;
	Wed, 15 Jan 2025 21:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736974864;
	bh=xk8w/Hm5T7hq0bK1cULse3KqEqZPAlwxboMPLxitLa8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bAkqFTwyGWq1JZNUw1vqjc13lXgIrUHbWnNpPKMFJL1Z/xPhai054sfv1kJYE6rWK
	 Nxct+kmuSHfJyXzcW78+TlOSHqOcV86o0Xyp/qD1LhYO/Z1PaHLUsjLl1a/z0VgbxN
	 OYJNMmdJnj3fY6nVn0SCeAFzTgbSVG2NPoYzhxPjt+zPC0SZsBy4FB32OYVokg5ToD
	 fhMyEm0NgxHafeWF13Q8apb0ltiBu6qU/c8UMDuFx2Cn2GwIJ3DvBi/SFh1XHUbnb8
	 iR/RauLdHb6wNw35k6tx4us/WGSa4nqNn3+zYZsbIRdyi0tV7F+wwakRtzuQXLgJAJ
	 ucxPKLZJBgHkg==
Date: Wed, 15 Jan 2025 15:01:02 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 0/2] PCI: Convert the Apple controller to host bridge
 hooks
Message-ID: <20250115210102.GA551434@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204150145.800408-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_130105_203354_E9B81746 
X-CRM114-Status: GOOD (  15.83  )
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

On Wed, Dec 04, 2024 at 03:01:43PM +0000, Marc Zyngier wrote:
> The Apple PCIe controller requires some additional attention when
> enabling an endpoint device, so that the RID gets correctly mapped to
> a SID on its way to the IOMMU.
> 
> So far, we have need relying on a custom bus notifier to perform this
> task, but Frank Li's series [1] is a better approach as it puts the
> complexity in the core code instead of the host controller driver, and
> this series builds on that:
> 
> - allow the new {en,dis}able_device() to be provided via pci_ecam_ops
> 
> - convert the Apple PCIe driver to that infrastructure
> 
> Patches on top of 6.13-rc1, plus Frank's v7 series.
> 
> [1] https://lore.kernel.org/r/20241203-imx95_lut-v7-0-d0cd6293225e@nxp.com
> 
> Marc Zyngier (2):
>   PCI: host-generic: Allow {en,dis}able_device() to be provided via
>     pci_ecam_ops
>   PCI: apple: Convert to {en,dis}able_device() callbacks
> 
>  drivers/pci/controller/pci-host-common.c |  2 +
>  drivers/pci/controller/pcie-apple.c      | 75 +++++-------------------
>  include/linux/pci-ecam.h                 |  4 ++
>  3 files changed, 21 insertions(+), 60 deletions(-)

Applied to pci/controller/iommu-map for v6.14, thank you!

Bjorn

