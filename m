Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5362FC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRwZsGwKZXozMRRo5US0MfXf7N73UqdDwr/6jY1PO4w=; b=HY88cRy31cBa74Gci5islGUDGj
	FCNVmnX6mlmqZ0WnHWOtnnFaJopYpql6fnBXkKJkO/mnfUZHXK31k/MxJ5tlzGvPaIHrlFkOFsYNg
	erM5GCB2sOvzk8f0QyQDUZWHmcm3K79V5VKl7sJ7/aSIJQfey+rJRxTJwa4RWFFGZa6eBMDZRbl6P
	TYvVIaUDYA1WHdIbKLAOJPDTmL1ASVRdH3BFpfHska1zVV+LlxdmwWhuwQwq4XIyiWnsFgUYZ4f5c
	GSS/XvkHOC8kXEqRDCR1CwSOmSHH2A38QLLfCvTaBSQZNyBmr7kv2FF/wbi5BQCFtaP1/eSVEo4FL
	NwZDy2vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4z0-0000000CaZS-1rxY;
	Wed, 30 Apr 2025 10:48:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4cS-0000000CWBd-1nqW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:24:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D9445C47C6;
	Wed, 30 Apr 2025 10:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E059C4CEE9;
	Wed, 30 Apr 2025 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746008687;
	bh=eKfkflY+nlOOGx+pGhNBk8yKSaGeuwtY9rXz667lGQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ChGWKdLZiwptIeQqo75HXMnKHrLSjUzG8gnKD0Z/AGwMy78QJLAlaCyl9xEsZdB7S
	 Quk0LZWc38anQYBG5auFKXvoBAPGFb65qK6f5yYvCERVi6lYKf3ptVMPtdaI0vhhQ7
	 AOnE6dSuvFUCw3Cr5rZtZ8e6tEvW/fCvruKRhaMedCAF28eyMxuwXRIiB+1eK25ywI
	 NoIwiXsPpBUS23NoX7WUqzJpkAVPzO0+tKg4DLlTV64eLbMPW3Af/xWutS+xyX0vmI
	 d6jlH6WTV04jIcMyMVmpfsiC2BzNOu0ymCgcccM2z7ooC06RdUIiXzy7tUCF7fu2ea
	 3i6hLKToK/3Ug==
Date: Wed, 30 Apr 2025 11:24:41 +0100
From: Will Deacon <will@kernel.org>
To: Huang Yiwei <quic_hyiwei@quicinc.com>
Cc: rafael@kernel.org, lenb@kernel.org, james.morse@arm.com,
	tony.luck@intel.com, bp@alien8.de, xueshuai@linux.alibaba.com,
	quic_aiquny@quicinc.com, quic_satyap@quicinc.com,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH] firmware: SDEI: Allow sdei initialization without
 ACPI_APEI_GHES
Message-ID: <20250430102440.GA27570@willie-the-truck>
References: <20250428095623.3220369-1-quic_hyiwei@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428095623.3220369-1-quic_hyiwei@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_032448_557582_B01DB34D 
X-CRM114-Status: GOOD (  31.22  )
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

On Mon, Apr 28, 2025 at 05:56:23PM +0800, Huang Yiwei wrote:
> SDEI usually initialize with the ACPI table, but on platforms where
> ACPI is not used, the SDEI feature can still be used to handle
> specific firmware calls or other customized purposes. Therefore, it
> is not necessary for ARM_SDE_INTERFACE to depend on ACPI_APEI_GHES.
> 
> In commit dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES
> in acpi_init()"), to make APEI ready earlier, sdei_init was moved
> into acpi_ghes_init instead of being a standalone initcall, adding
> ACPI_APEI_GHES dependency to ARM_SDE_INTERFACE. This restricts the
> flexibility and usability of SDEI.
> 
> This patch corrects the dependency in Kconfig and allows the
> initialization of SDEI without ACPI_APEI_GHES enabled.
> 
> Fixes: dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES in apci_init()")
> Cc: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
> ---
> Link: https://lore.kernel.org/all/20230906130900.12218-1-schspa@gmail.com/
> 
> Current patch has been verified in the following scenarios:
>   - ACPI_APEI_GHES enabled and ARM_SDE_INTERFACE enabled
>   - ACPI_APEI_GHES disabled and ARM_SDE_INTERFACE enabled
>   - ACPI_APEI_GHES disabled and ARM_SDE_INTERFACE disabled
>   - SDEI works well with DT node and compatiable firmware when
>     ACPI_APEI_GHES disabled
> 
> The scenario where CONFIG_ACPI enabled but not used has not been
> considered in this patch due to the absence of such platform.
> 
>  drivers/acpi/apei/Kconfig   | 1 +
>  drivers/firmware/Kconfig    | 1 -
>  drivers/firmware/arm_sdei.c | 9 +++++++--
>  include/linux/arm_sdei.h    | 4 ++--
>  4 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
> index 3cfe7e7475f2..070c07d68dfb 100644
> --- a/drivers/acpi/apei/Kconfig
> +++ b/drivers/acpi/apei/Kconfig
> @@ -23,6 +23,7 @@ config ACPI_APEI_GHES
>  	select ACPI_HED
>  	select IRQ_WORK
>  	select GENERIC_ALLOCATOR
> +	select ARM_SDE_INTERFACE if ARM64
>  	help
>  	  Generic Hardware Error Source provides a way to report
>  	  platform hardware errors (such as that from chipset). It
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index aadc395ee168..7df19d82aa68 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -31,7 +31,6 @@ config ARM_SCPI_PROTOCOL
>  config ARM_SDE_INTERFACE
>  	bool "ARM Software Delegated Exception Interface (SDEI)"
>  	depends on ARM64
> -	depends on ACPI_APEI_GHES
>  	help
>  	  The Software Delegated Exception Interface (SDEI) is an ARM
>  	  standard for registering callbacks from the platform firmware
> diff --git a/drivers/firmware/arm_sdei.c b/drivers/firmware/arm_sdei.c
> index 3e8051fe8296..ddb10389b340 100644
> --- a/drivers/firmware/arm_sdei.c
> +++ b/drivers/firmware/arm_sdei.c
> @@ -1062,14 +1062,14 @@ static bool __init sdei_present_acpi(void)
>  	return true;
>  }
>  
> -void __init sdei_init(void)
> +int __init sdei_init(void)
>  {
>  	struct platform_device *pdev;
>  	int ret;
>  
>  	ret = platform_driver_register(&sdei_driver);
>  	if (ret || !sdei_present_acpi())
> -		return;
> +		return ret;
>  
>  	pdev = platform_device_register_simple(sdei_driver.driver.name,
>  					       0, NULL, 0);
> @@ -1079,7 +1079,12 @@ void __init sdei_init(void)
>  		pr_info("Failed to register ACPI:SDEI platform device %d\n",
>  			ret);
>  	}
> +
> +	return ret;
>  }
> +#ifndef CONFIG_ACPI_APEI_GHES
> +subsys_initcall_sync(sdei_init);
> +#endif

Using an initcall purely for the non-ACPI case feels like a hack to me.
Could we instead just call sdei_init() from the arch code (and remove
the call from acpi_ghes_init()) so that the platform device is
registered at the same time, regardless of the firmware?

Will

