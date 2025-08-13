Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC90CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6EBEMYOHLBS/mOMhxKpJJOh8alzp/LH8jTecCxA9Aw=; b=Ebd2DUw07VGGailHFH9cbhITHe
	pxIRrW2eM3NdBXnptEfw+T1WlLmmdtvGjxHZHSieObmkPRChe32azXgvSwkI3q9XfbVXq+UfC7fxU
	RXw/ASOvOE0AapBdxccqX8W+Pi068fkJAsibFhivGf4IYkyQtpJJUTbv+7rY0xFJ+hXhG3hHobA42
	ClcjxJjTWuxjKnNjnzyunkxL1rjGK798n89LYQ/Ue8gBXXJEr0Tpv0QPMVHX2YtyOJRIy6W+GZhyR
	Wzih3FBz5CUKtJHsWQOqdhfglDOyaQ/Ek6u5NZLC98lEaHOajob78VQ+dS+JiXHbZkt502TbaWQ1F
	UhSxI/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE8f-0000000ELSp-3hP2;
	Wed, 13 Aug 2025 16:15:45 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDN0-0000000EBLC-481P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:26:32 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DFQBdF1728877;
	Wed, 13 Aug 2025 10:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755098771;
	bh=f6EBEMYOHLBS/mOMhxKpJJOh8alzp/LH8jTecCxA9Aw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=s4wtRnQrLPtZvTOm8HT2J2f0fERCIvleTqauRAsIg8rBdOGs04emppWtMWLSehjEr
	 BhxqgKtR7G/6gMDl9tES4wpZUnnmLFnksGeoSPXoto11DfOt+RVfDGVW7O6gaOxWqA
	 bHdTe7Hzl4B8jkNuMAz3iEddS8Z7pTsLZKqjl4e8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DFQBLq153772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 10:26:11 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 10:26:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 10:26:10 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DFQApP2503743;
	Wed, 13 Aug 2025 10:26:10 -0500
Date: Wed, 13 Aug 2025 10:26:10 -0500
From: Nishanth Menon <nm@ti.com>
To: Guillaume La Roque <glaroque@baylibre.com>
CC: Thomas Gleixner <tglx@linutronix.de>, <vigneshr@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        Tero Kristo <kristo@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] soc: ti: ti_sci_inta_msi: Enable module
 compilation support
Message-ID: <20250813152610.akcdxrzhev6e2kfa@unturned>
References: <20250812-timsi-v2-0-90c8500f3f18@baylibre.com>
 <20250812-timsi-v2-2-90c8500f3f18@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250812-timsi-v2-2-90c8500f3f18@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_082631_106481_201EE585 
X-CRM114-Status: GOOD (  21.18  )
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

On 22:36-20250812, Guillaume La Roque wrote:
> Add module support to the TI SCI INTA MSI driver:
> - Change Kconfig from bool to tristate to allow module compilation
> - Add linux/module.h include for module functionality
> - Add MODULE_LICENSE, MODULE_DESCRIPTION, and MODULE_AUTHOR macros
> 
> This allows the driver to be compiled as a loadable kernel module
> named ti_sci_inta_msi.
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  drivers/soc/ti/Kconfig           | 5 ++++-
>  drivers/soc/ti/ti_sci_inta_msi.c | 5 +++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
> index 1a93001c9e36..0a9eb5ac264b 100644
> --- a/drivers/soc/ti/Kconfig
> +++ b/drivers/soc/ti/Kconfig
> @@ -85,7 +85,10 @@ config TI_PRUSS
>  endif # SOC_TI
>  
>  config TI_SCI_INTA_MSI_DOMAIN
> -	bool
> +	tristate "TI SCI INTA MSI Domain driver"
>  	select GENERIC_MSI_IRQ
>  	help
>  	  Driver to enable Interrupt Aggregator specific MSI Domain.
> +
> +	  Say Y here to compile it into the kernel or M to compile it as a
> +	  module. The module will be called ti_sci_inta_msi.
> diff --git a/drivers/soc/ti/ti_sci_inta_msi.c b/drivers/soc/ti/ti_sci_inta_msi.c
> index 193266f5e3f9..d92cab319d57 100644
> --- a/drivers/soc/ti/ti_sci_inta_msi.c
> +++ b/drivers/soc/ti/ti_sci_inta_msi.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/irq.h>
>  #include <linux/irqdomain.h>
> +#include <linux/module.h>
>  #include <linux/msi.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -115,3 +116,7 @@ int ti_sci_inta_msi_domain_alloc_irqs(struct device *dev,
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(ti_sci_inta_msi_domain_alloc_irqs);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Texas Instruments K3 Interrupt Aggregator MSI bus");
> +MODULE_AUTHOR("Lokesh Vutla <lokeshvutla@ti.com>");
> 
> -- 
> 2.34.1
> 

If Thomas doesn't mind picking the full series,

Acked-by: Nishanth Menon <nm@ti.com>

This is probably one of the last hold outs for us to move SoC support
into kernel modules.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

