Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D52ECD997
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 18:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJdbNFsY9TlOa05vzFHONREoEz/o2CSPjvLyu9KhCYc=; b=r3NqCHNSFPr3W2qPDQqbDG5FiM
	4tI68TF05+9VbDLP5mpt5sin9B4x2ARjhZHm2SLDSqtX9mEVYkcwB+m6CB65mrr7qaDca5iQn1Hqu
	yhiJyWXJLuInh2G+BoRwtN/XcZZ+6KcE32jALWhz89YsHhGacoIrvGbFa3mFLh9873oCq9lV80xJR
	Q3ny8pFTDT9Jnku0svDFjCo3Kc9yCUbTSaDxab53XjVGNh0bA/LLRfU24hJIDU/wlmF/0M5knrBHY
	JAvrHtGaaMYAoqkS9pDqjxtJxjW4lXhJILQdH+DWWyBhzKept0Ug2jvKBGn2ELNqifnkMRShI7g5N
	HCkRxnPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4QA-0000000AONn-3Mex;
	Thu, 05 Feb 2026 18:49:42 +0000
Received: from sender4-of-o55.zoho.com ([136.143.188.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4Pr-0000000AOKu-1mH6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 18:49:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770317326; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DLjgTy2wycUhNlMH3U19kIj6Pw/2ydCYHIl9vZTP7LPpf8mXzsOifu6giHW/ehqqYejFF8hNUztBGkMvfG3gnPdwXF7xAmCLOy0m3cWe8Sb2mt+8kNwXRVcNuoNhh0n6UFkak8SOpXnvnwcuCoPkNHS/QYRt+EkEIRHTUcUXVjc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770317326; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RJdbNFsY9TlOa05vzFHONREoEz/o2CSPjvLyu9KhCYc=; 
	b=C2h8MkmruQAlRleDlRtFISSjbIMlmMEVEFnSjLKnMXeFBiDtWYuFtgiJ7L5qjJ52ClIgGQ4Nz/G8h7abgSs8Bm9ImfDjyG7IeU18fLYKp6I6Q6F94rTxI/Q+lrts+NnpeYm6KqtEXUn8Bl4QRR9Tzjz5IMm6h30mYhPL4snfdsI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=anirudhrb.com;
	spf=pass  smtp.mailfrom=anirudh@anirudhrb.com;
	dmarc=pass header.from=<anirudh@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770317326;
	s=zoho; d=anirudhrb.com; i=anirudh@anirudhrb.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=RJdbNFsY9TlOa05vzFHONREoEz/o2CSPjvLyu9KhCYc=;
	b=zJELxluK7gj9saqdX+6tFXDkCkEScqN7AkKaoIUhtO4Hq5bsmyRuGmhqZvZsjDXK
	3yhV7O73n1cS0lMPeXSnbbRrgzwaxWp14SUP3XOyQ4uWp/RNV8T0/heFwrBkAcMrDdR
	LeMmcSn10zrVK2IGSRCamsedJZH6dpdb0gz/z8C4=
Received: by mx.zohomail.com with SMTPS id 1770317322465939.1179981344242;
	Thu, 5 Feb 2026 10:48:42 -0800 (PST)
Date: Fri, 6 Feb 2026 00:18:31 +0530
From: Anirudh Rayabharam <anirudh@anirudhrb.com>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arch@vger.kernel.org, kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	hpa@zytor.com, joro@8bytes.org, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, bhelgaas@google.com, arnd@arndb.de, 
	nunodasneves@linux.microsoft.com, mhklinux@outlook.com, romank@linux.microsoft.com
Subject: Re: [PATCH v0 01/15] iommu/hyperv: rename hyperv-iommu.c to
 hyperv-irq.c
Message-ID: <ekeis5txhdipwwjlgywonvi43rbut2szihvzl4wkrdqkmh5mlt@udamdt7ff3vo>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-2-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120064230.3602565-2-mrathor@linux.microsoft.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_104931_397842_00CD0BD2 
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

On Mon, Jan 19, 2026 at 10:42:16PM -0800, Mukesh R wrote:
> From: Mukesh Rathor <mrathor@linux.microsoft.com>
> 
> This file actually implements irq remapping, so rename to more appropriate
> hyperv-irq.c. A new file named hyperv-iommu.c will be introduced later.
> Also, move CONFIG_IRQ_REMAP out of the file and add to Makefile.
> 
> Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>

Reviewed-by: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>

> ---
>  MAINTAINERS                                    | 2 +-
>  drivers/iommu/Kconfig                          | 1 +
>  drivers/iommu/Makefile                         | 2 +-
>  drivers/iommu/{hyperv-iommu.c => hyperv-irq.c} | 4 ----
>  4 files changed, 3 insertions(+), 6 deletions(-)
>  rename drivers/iommu/{hyperv-iommu.c => hyperv-irq.c} (99%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..381a0e086382 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11741,7 +11741,7 @@ F:	drivers/hid/hid-hyperv.c
>  F:	drivers/hv/
>  F:	drivers/infiniband/hw/mana/
>  F:	drivers/input/serio/hyperv-keyboard.c
> -F:	drivers/iommu/hyperv-iommu.c
> +F:	drivers/iommu/hyperv-irq.c
>  F:	drivers/net/ethernet/microsoft/
>  F:	drivers/net/hyperv/
>  F:	drivers/pci/controller/pci-hyperv-intf.c
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 99095645134f..b4cc2b42b338 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -355,6 +355,7 @@ config HYPERV_IOMMU
>  	bool "Hyper-V IRQ Handling"
>  	depends on HYPERV && X86
>  	select IOMMU_API
> +	select IRQ_REMAP
>  	default HYPERV
>  	help
>  	  Stub IOMMU driver to handle IRQs to support Hyper-V Linux
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 8e8843316c4b..598c39558e7d 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -30,7 +30,7 @@ obj-$(CONFIG_TEGRA_IOMMU_SMMU) += tegra-smmu.o
>  obj-$(CONFIG_EXYNOS_IOMMU) += exynos-iommu.o
>  obj-$(CONFIG_FSL_PAMU) += fsl_pamu.o fsl_pamu_domain.o
>  obj-$(CONFIG_S390_IOMMU) += s390-iommu.o
> -obj-$(CONFIG_HYPERV_IOMMU) += hyperv-iommu.o
> +obj-$(CONFIG_HYPERV_IOMMU) += hyperv-irq.o
>  obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
>  obj-$(CONFIG_IOMMU_SVA) += iommu-sva.o
>  obj-$(CONFIG_IOMMU_IOPF) += io-pgfault.o
> diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-irq.c
> similarity index 99%
> rename from drivers/iommu/hyperv-iommu.c
> rename to drivers/iommu/hyperv-irq.c
> index 0961ac805944..1944440a5004 100644
> --- a/drivers/iommu/hyperv-iommu.c
> +++ b/drivers/iommu/hyperv-irq.c
> @@ -24,8 +24,6 @@
>  
>  #include "irq_remapping.h"
>  
> -#ifdef CONFIG_IRQ_REMAP
> -
>  /*
>   * According 82093AA IO-APIC spec , IO APIC has a 24-entry Interrupt
>   * Redirection Table. Hyper-V exposes one single IO-APIC and so define
> @@ -330,5 +328,3 @@ static const struct irq_domain_ops hyperv_root_ir_domain_ops = {
>  	.alloc = hyperv_root_irq_remapping_alloc,
>  	.free = hyperv_root_irq_remapping_free,
>  };
> -
> -#endif
> -- 
> 2.51.2.vfs.0.1
> 

