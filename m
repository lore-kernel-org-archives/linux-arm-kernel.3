Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AA4C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 16:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3a8N7GGRYeSHSllhgnuhQKsscziar9Xg6190x1fyKo=; b=g7AQ+7mpNWcblmpSFb7xU2P4JZ
	QJ8c9Ei/L0+K4KXuqv9Um6SKmyui6i0cNdvjDu6nsPuienwS3CWGAYdkxXsR31FvwLTFJqlyQV4/P
	GwOyZu4mnKwG8lz/GdC3SSn8jxsPgN3biaQ0sBPWGPbWQR0+Z7K9dP3cMQIf0qrmVqZu+/2Rrv/u9
	050fJfkQ4fFoCs2LVVUz8P6Ad5J88hpEm4F3hgz2leD10htkvpSMCf5H8LChzliHSUAV7oihvRwn/
	3d6M/20jefBlXkJ2xA27Bz7TxDPFqdELGa4LGjWMcaHM7+qgwmT42LbYjEsftX7sjt6mgJ+pnrBYb
	X5qr17GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugndo-0000000HJmf-0p0t;
	Tue, 29 Jul 2025 16:57:28 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugn7L-0000000HGLu-3Zp2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 16:23:57 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56TGNdFC2561302;
	Tue, 29 Jul 2025 11:23:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753806219;
	bh=P3a8N7GGRYeSHSllhgnuhQKsscziar9Xg6190x1fyKo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ra0usx3KRW+fLu8oZYORUDkvuKkHaa+Sdu14m3BzyQM67DiV4QMTAW7AO6DHTdBYW
	 ayR5EffXTF+qK1vl1Pf0L94NCHnIuVbsylUdhSbh1ALBfJ82HauMnp+LLODItFacqu
	 Khta69na9dF2jI2AEaLASntQ3HH9UId24X3vcv04=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56TGNdTX1239402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 29 Jul 2025 11:23:39 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 29
 Jul 2025 11:23:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 29 Jul 2025 11:23:38 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56TGNc6U3708765;
	Tue, 29 Jul 2025 11:23:38 -0500
Date: Tue, 29 Jul 2025 11:23:38 -0500
From: Nishanth Menon <nm@ti.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: <huaqian.li@siemens.com>, <lkp@intel.com>, <baocheng.su@siemens.com>,
        <bhelgaas@google.com>, <christophe.jaillet@wanadoo.fr>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <diogo.ivo@siemens.com>, <helgaas@kernel.org>, <kristo@kernel.org>,
        <krzk+dt@kernel.org>, <kw@linux.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, <lpieralisi@kernel.org>,
        <oe-kbuild-all@lists.linux.dev>, <robh@kernel.org>,
        <s-vadapalli@ti.com>, <ssantosh@kernel.org>, <vigneshr@ti.com>
Subject: Re: [PATCH v12 3/7] soc: ti: Add IOMMU-like PVU driver
Message-ID: <20250729162338.so7evngndnysg4ui@cinnamon>
References: <20250728023701.116963-1-huaqian.li@siemens.com>
 <20250728023701.116963-4-huaqian.li@siemens.com>
 <20250729122246.o7upnxvqnp7nltdo@harmonize>
 <bdb5a5e2-3a7e-4050-bf25-c95dfa05138a@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bdb5a5e2-3a7e-4050-bf25-c95dfa05138a@siemens.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_092356_027547_285CEBFC 
X-CRM114-Status: GOOD (  24.90  )
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

On 18:11-20250729, Jan Kiszka wrote:
> On 29.07.25 14:22, Nishanth Menon wrote:
> > On 10:36-20250728, huaqian.li@siemens.com wrote:
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>
> >> The TI Peripheral Virtualization Unit (PVU) permits to define a limited
> >> set of mappings for DMA requests on the system memory. Unlike with an
> >> IOMMU, there is no fallback to a memory-backed page table, only a fixed
> >> set of register-backed TLBs. Emulating an IOMMU behavior appears to be
> >> the more fragile the more fragmentation of pending requests occur.
> >>
> >> Therefore, this driver does not expose the PVU as an IOMMU. It rather
> >> introduces a simple, static interface to devices that are under
> >> restricted-dma-pool constraints. They can register their pools with the
> >> PVUs, enabling only those pools to work for DMA. As also MSI is issued
> >> as DMA, the PVU already register the related translator region of the
> >> AM654 as valid DMA target.
> >>
> >> This driver is the essential building block for limiting DMA from
> >> untrusted devices to clearly defined memory regions in the absence of a
> >> real IOMMU (SMMU).
> >>
> >> Co-developed-by: Diogo Ivo <diogo.ivo@siemens.com>
> >> Signed-off-by: Diogo Ivo <diogo.ivo@siemens.com>
> >> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >> Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
> >> ---
> >>  drivers/soc/ti/Kconfig  |   4 +
> >>  drivers/soc/ti/Makefile |   1 +
> >>  drivers/soc/ti/ti-pvu.c | 500 ++++++++++++++++++++++++++++++++++++++++
> >>  include/linux/ti-pvu.h  |  32 +++
> >>  4 files changed, 537 insertions(+)
> >>  create mode 100644 drivers/soc/ti/ti-pvu.c
> >>  create mode 100644 include/linux/ti-pvu.h
> >>
> >> diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
> >> index 1a93001c9e36..af7173ad84de 100644
> >> --- a/drivers/soc/ti/Kconfig
> >> +++ b/drivers/soc/ti/Kconfig
> >> @@ -82,6 +82,10 @@ config TI_PRUSS
> >>  	  processors on various TI SoCs. It's safe to say N here if you're
> >>  	  not interested in the PRU or if you are unsure.
> >>  
> >> +config TI_PVU
> >> +	bool "TI Peripheral Virtualization Unit driver"
> > 
> > tristate please? Prefer to make this as a module.
> > 
> > 
> 
> PCI_KEYSTONE is bool and needs this (if enabled). So this won't be a
> module in practice.
> 

Something of the form of
https://lore.kernel.org/all/20250307103128.3287497-1-s-vadapalli@ti.com/
will need to be done then.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

