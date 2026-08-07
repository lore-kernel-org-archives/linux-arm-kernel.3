Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B806C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 15:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=wgQmbdtHCvFqRoxry1i5eNtqIyEJ55658yXkZlfsF0U=; b=DZGZZtFwUql9Jp
	vgL3M7cYJLuG7xr8QGff8HaoSHBqAWGnfQPLXMT234Cq0apJ2bwH7ZfiVINLl0ApYYPqfe+1/XSj2
	Dj85hGs6PIkJ+Sw5qlnaL22VVD35FYcXRrW9Tph1vy4UXAE3YjTtPrHdVvGVRAk135SWtqCMNNVS0
	2333vng7o2v9L+zhmbaXyfpe3sJKrX2aNLF+POb1p8TIhIt8weWIdi9Xe3hTR+jd8acCec/gXw+/J
	AdTNd0cxiGHhO03oc/tk9AeJBy+Vr5sH7lW7SnOHrSwWBnpyD1TSloIkOfDs4YnqQHoDO1CyqlCdz
	bff10qcsjMbQ1PfEBvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMTV-00000008Kr0-1uyx;
	Fri, 07 Aug 2026 15:27:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMTU-00000008Kqs-1NQI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 15:27:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2361600C8;
	Fri,  7 Aug 2026 15:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4117B1F00A3A;
	Fri,  7 Aug 2026 15:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786116427;
	bh=wgQmbdtHCvFqRoxry1i5eNtqIyEJ55658yXkZlfsF0U=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=jdJIsFI0Qs6Wn39qAN5JJDiHURWIakvyX4ZSUoNU9gQPOoVlMP0cx5y1oCrn66tZ/
	 zLNtCtCf5Verm0hPGdraL2Sq4Ox2tKNS3nu3Vk8h3J4PxoZkcNQIGN83HnfkDdpizK
	 UfdnnrIEhvtyh1k7mUjq9fJT6hOp/SfN6i9uzsq28/fmT7QOXlWJpUr6Un1CTaKdtT
	 HtDQg9oRmv3YL3Qhd76Xm9xnrC9XZbmVBykeLG6VivnemPoN3xak5yEc55VP8PsxhJ
	 qeUGkIzBQhS8IkKU5uw/a7lUrU/Se+JhIObBxJ0Sues/ttjDaUFzTDLLvOAmFCA3l9
	 ucpk0NIwKKouA==
Date: Fri, 7 Aug 2026 10:27:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Semih Baskan <strst.gs@gmail.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	rafal@milecki.pl, florian.fainelli@broadcom.com, arnd@arndb.de,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rosenp@gmail.com, rani.hod@gmail.com
Subject: Re: [PATCH v2] PCI: iproc: Use the EROM outbound window on BCMA
Message-ID: <20260807152705.GA59586@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807035726.387-1-strst.gs@gmail.com>
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

On Fri, Aug 07, 2026 at 06:57:26AM +0300, Semih Baskan wrote:
> The PCIe outbound window base on Northstar depends on the PCIe Gen2 core
> revision. Revision 0x01 uses 0x08000000, 0x40000000 and 0x48000000 for
> controllers 0 to 2, while revision 0x07 (NS-B0) uses 0x08000000,
> 0x20000000 and 0x28000000. Broadcom's own driver branches on the core
> revision for exactly this reason.
> 
> bcm-ns.dtsi is shared by every Northstar SoC, so it cannot carry a value
> that is correct on both. Commit 767012397976 ("ARM: dts: BCM5301X:
> Describe PCIe controllers fully") gave the controllers a ranges property.
> The commit shipped in v7.1.
> 
> With that property present, two things go wrong with this driver:

It looks like you're going to present two problems next.  They should
be bullets so it's obvious what the first is and what the second is,
e.g.,

  - devm_pci_alloc_host_bridge() parses ...

  - When the DT window ...

(or whatever the second item is, I'm not sure where it starts)

> devm_pci_alloc_host_bridge() parses those ranges and requests them, then
> this driver adds its own window and requests the whole list a second
> time, so every controller fails to probe with -EBUSY.
> 
> When the DT window is used, it is only correct on core revision 0x07. On
> revision 0x01 it points at an address the hardware does not decode, and
> the first MMIO access to a BAR takes an imprecise external abort.
> 
> The enumeration ROM reports the correct base for the revision actually
> present, and bcma already provides it as addr_s[0]. Drop any memory
> window that came from the device tree and use that instead, requesting
> only the window this driver owns. This makes the driver correct whether
> or not the DT describes a window.
> 
> When a dropped window does not match what the EROM reports, print a
> warning naming both. The mismatch means the devicetree describes a
> window the hardware does not decode, and that should be fixed in the
> dts rather than ignored silently.
> 
> The same commit also added compatible = "brcm,iproc-pcie", so these
> nodes now match pcie-iproc-platform. With CONFIG_PCIE_IPROC_PLATFORM
> enabled, which is the default on ARCH_BCM_IPROC, that driver binds them
> first and this driver's probe fails inside devm_pci_alloc_host_bridge().
> This patch fixes the configurations where the BCMA driver is the one in
> use; OpenWrt builds that way, with PCIE_IPROC_PLATFORM disabled. The
> platform path takes the DT window as-is and has the same wrong address
> on core revision 0x01, so that side needs a devicetree fix either way.
> 
> Tested on an ASUS RT-N18U (BCM47081) and a Linksys EA9200 (BCM4709),
> both core revision 0x01.
> 
> Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
> Tested-by: Rani Hod <rani.hod@gmail.com>
> Cc: stable@vger.kernel.org # v7.1+
> Signed-off-by: Semih Baskan <strst.gs@gmail.com>
> ---
> v1 -> v2: print a warning for every devicetree memory window that does
> not match the EROM window. Requested by Arnd Bergmann:
> https://lore.kernel.org/all/d05ffeca-f289-42dd-b454-5a7c7741c6d5@app.fastmail.com/
> 
> v1: https://lore.kernel.org/all/20260727140939.389-1-strst.gs@gmail.com/
> Applies to v7.2-rc5 and unchanged through v7.2-rc6; the file has no
> commits in between.

FWIW, there's no need to rebase for new -rcs.  We always apply PCI
patches on -rc1 anyway.

