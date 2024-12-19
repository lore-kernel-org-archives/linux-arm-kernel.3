Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27595E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 21:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3gUn+s2ljtXDVSpszgzdGFVOy55D1hgdYmkF4lUwd8=; b=W8L5OlpvQsIyGKKo0pCujPDPjU
	ioWUzmXmdzBLKL03OtwTrKqA8NN8A8A/AsqBMlUWZPOb2XRgx0YvjEu7mE65NuNVesRSf80iidxDh
	/g2aXyYF3+VivH8YzrvUme8gNqXjeaE1ZlST3CbHgOXEYV/Gd399KygiqidqQqzzBunodG1xTSYxT
	UGv7I+qlUqPxMWzfjJaX6bHpbK93hO1jY0E81/4RkFHXY5f/5uDwo2lNM3MoDEkPF1Sq/xiCn5PBu
	NrpRL9B3dCnswogtKeo0qWfxPIO6x0wHhpPcAgOWZAVBGWvq7LszY8QeZtu4vw7h58zgQFQvaWuKm
	OaRu46jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOOUM-00000003Cy3-30JH;
	Thu, 19 Dec 2024 21:55:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tONMg-0000000346W-2Idz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 20:43:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5943DA42943;
	Thu, 19 Dec 2024 20:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CA6C4CEE2;
	Thu, 19 Dec 2024 20:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734641001;
	bh=G6bMfexz+wArkOSIy0OifiSOvN5KLKUMvRsykmliEsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dmJnD9Qex8zb76MkRSNV8w/pleJc7agAVHdZmk37esuv92MR/LJ+YtapO71KAsR0K
	 wI3cyZvGyyTX+/6RA4VqzLlu+fUanKgjXDCTfoym6JUz68cONpDKiG/kSGOXPILz3l
	 2Tf4LrHcWE5FwJkGTRDWsetCsD9NcdIc36xzqIiDYA7Amva1d4tyqeCndgAhBOl2gz
	 TQZgJmAXO52yqjkMX32XiSaIEJStw5vpBgqRuyPniwP5pJsKFxF1lILwVSYhlbhhQj
	 OBt8J9DpejQAFpBEkfRqxCr6Gsf+4lHvWpWO0Am/Ge3EQUcPF6lbjHf98AVS6Wowq7
	 bkXmD0fjJMD/w==
Date: Thu, 19 Dec 2024 21:43:15 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, imx@lists.linux.dev, dlemoal@kernel.org,
	jdmason@kudzu.us, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v13 4/9] irqchip/gic-v3-its: Add
 DOMAIN_BUS_DEVICE_PCI_EP_MSI support
Message-ID: <Z2SFYwC7KC-qiZD2@ryzen>
References: <20241218-ep-msi-v13-0-646e2192dc24@nxp.com>
 <20241218-ep-msi-v13-4-646e2192dc24@nxp.com>
 <868qscq70x.wl-maz@kernel.org>
 <Z2RRimPlT41Ru281@lizhi-Precision-Tower-5810>
 <Z2R9qPmAyTcc5mtg@ryzen>
 <Z2R/S4y3fF2Dw4Ye@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2R/S4y3fF2Dw4Ye@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_124322_647732_1815DCB0 
X-CRM114-Status: GOOD (  12.37  )
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

On Thu, Dec 19, 2024 at 03:17:15PM -0500, Frank Li wrote:
> 
> Thank you very much. I update msi part, so endpoint controller node align
> host controller node.
> 
> It should be
> msi-map = <0x0000 &its1 0x0000 0x1000>;
> 
> So if your hardware support multi physical function, your can create more
> than one pci_test func. Previous version only support one EP func.

I see. That seems like an improvement.
I will need to ask Rockchip maintainer to drop my msi-parent patch for PCIe
EP node then. (Which is currently queued up in for-6.14)

However, for the PCIe host node, rk3588 has:
iommu-map = <0x0000 &mmu600_pcie 0x0000 0x1000>;

For the PCIe endpoint node, rk3588 has:
iommus = <&mmu600_pcie 0x0000>;

https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v6.14-armsoc/dts64&id=da92d3dfc871e821a1bface3ba5afcf8cda19805

Is it fine that for the PCIe EP node, we specify iommu mapping using:
iommus = <&mmu600_pcie 0x0000>;
but the ITS/MSI map will be:
msi-map = <0x0000 &its1 0x0000 0x1000>;

isn't this a bit inconsistent?

The physical function is the "F" in the BDF.
Does this mean that:
iommus = <&mmu600_pcie 0x0000>;
the IOMMU will not be able to distinguish different PCI physical functions
from the same PCI device? So two different physical functions on the same
PCI device share the same IOMMU mappings?


Kind regards,
Niklas

