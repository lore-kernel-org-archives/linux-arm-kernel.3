Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6499C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3nvlVKCBTyX8mAmnTYnSsQqdWgC+ufyRK3D5Obt8JY=; b=C0ftgNVtmPp4MqRvBDx3Hc2ZVv
	CN9ScSixkZd+gQCGG7Q9EoH8PKLbEuCMWMwk+Wg7QErIOmj2fc6ZJ0ubv332CUvMxhjAhzPBFvUqG
	H8RZutdP67Z6yXm5vK/hbnFuS4/PtSD+zpIZOxTd/ghl4upI6KV7JixMKPgQB850ec4P899eLeyX3
	AoSEGb6fOJrpLf+rVAChjbyV0g5atfAPrsZBSC0vBlpPAAZ6JXCdTgQooUBvZZmCphCNvZxLTQO2e
	8vBODHmLTKWud5BJSed4+8HH4Krh0xSsGf8I5EAl58J41sDMNQoxa/wNbSqw0UCErjHkC4RiUY9a2
	qBMhuO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjVm-0000000GjIo-3Nc9;
	Tue, 29 Jul 2025 12:32:54 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjMI-0000000GiDX-0rch
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 12:23:08 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56TCMl4J2961788;
	Tue, 29 Jul 2025 07:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753791767;
	bh=e3nvlVKCBTyX8mAmnTYnSsQqdWgC+ufyRK3D5Obt8JY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=DWuZ/1XIfjmPZlUOl94+pdKxZ5J8e0VklOebRtp4dV9VdOR1CGD05BddmBEALqrkE
	 lYjxNdc2sCoVe0VPs287oEBFNlm/3G0VgwRR3CtGHiRA8yvSUGmipwLOtn2M8Y7W/7
	 DsiYjKClx2INZc4J7KZLZZQ1DSL/Pn4L3hhU1ZXA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56TCMlRP1804735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 29 Jul 2025 07:22:47 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 29
 Jul 2025 07:22:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 29 Jul 2025 07:22:46 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56TCMkDw3701653;
	Tue, 29 Jul 2025 07:22:46 -0500
Date: Tue, 29 Jul 2025 07:22:46 -0500
From: Nishanth Menon <nm@ti.com>
To: <huaqian.li@siemens.com>
CC: <lkp@intel.com>, <baocheng.su@siemens.com>, <bhelgaas@google.com>,
        <christophe.jaillet@wanadoo.fr>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <diogo.ivo@siemens.com>,
        <helgaas@kernel.org>, <jan.kiszka@siemens.com>, <kristo@kernel.org>,
        <krzk+dt@kernel.org>, <kw@linux.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, <lpieralisi@kernel.org>,
        <oe-kbuild-all@lists.linux.dev>, <robh@kernel.org>,
        <s-vadapalli@ti.com>, <ssantosh@kernel.org>, <vigneshr@ti.com>
Subject: Re: [PATCH v12 3/7] soc: ti: Add IOMMU-like PVU driver
Message-ID: <20250729122246.o7upnxvqnp7nltdo@harmonize>
References: <20250728023701.116963-1-huaqian.li@siemens.com>
 <20250728023701.116963-4-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250728023701.116963-4-huaqian.li@siemens.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_052306_400113_49E33A66 
X-CRM114-Status: GOOD (  22.08  )
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

On 10:36-20250728, huaqian.li@siemens.com wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> The TI Peripheral Virtualization Unit (PVU) permits to define a limited
> set of mappings for DMA requests on the system memory. Unlike with an
> IOMMU, there is no fallback to a memory-backed page table, only a fixed
> set of register-backed TLBs. Emulating an IOMMU behavior appears to be
> the more fragile the more fragmentation of pending requests occur.
> 
> Therefore, this driver does not expose the PVU as an IOMMU. It rather
> introduces a simple, static interface to devices that are under
> restricted-dma-pool constraints. They can register their pools with the
> PVUs, enabling only those pools to work for DMA. As also MSI is issued
> as DMA, the PVU already register the related translator region of the
> AM654 as valid DMA target.
> 
> This driver is the essential building block for limiting DMA from
> untrusted devices to clearly defined memory regions in the absence of a
> real IOMMU (SMMU).
> 
> Co-developed-by: Diogo Ivo <diogo.ivo@siemens.com>
> Signed-off-by: Diogo Ivo <diogo.ivo@siemens.com>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
> ---
>  drivers/soc/ti/Kconfig  |   4 +
>  drivers/soc/ti/Makefile |   1 +
>  drivers/soc/ti/ti-pvu.c | 500 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/ti-pvu.h  |  32 +++
>  4 files changed, 537 insertions(+)
>  create mode 100644 drivers/soc/ti/ti-pvu.c
>  create mode 100644 include/linux/ti-pvu.h
> 
> diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
> index 1a93001c9e36..af7173ad84de 100644
> --- a/drivers/soc/ti/Kconfig
> +++ b/drivers/soc/ti/Kconfig
> @@ -82,6 +82,10 @@ config TI_PRUSS
>  	  processors on various TI SoCs. It's safe to say N here if you're
>  	  not interested in the PRU or if you are unsure.
>  
> +config TI_PVU
> +	bool "TI Peripheral Virtualization Unit driver"

tristate please? Prefer to make this as a module.


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

