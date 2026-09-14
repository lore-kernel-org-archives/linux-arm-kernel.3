Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F43AC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCFF1YUUi/TM0kMtInUXHAKzLUllc8PMo/dty7euYJ8=; b=Nz4YMpg+pH4/zBeDntJi5RheHd
	oB3IPog0Cd6dfdht8s9gNJ/Fs2YDsrqt3NK2Kl+vY7K8zpBJrvqhJqJ7gSMldpBlxAKxyrxMR1PPN
	1g5urqG3p0fMUWQebhSSkE6HZ2/1eorW4xUvhn4UMD0fStJmb6YXKPyLxHj6+bxVmIiXej6iBS8nd
	JG2Z58T+jM4BluL5sB590jpfgxlj9FJWcjBzvEaDjK+rSQgKw1WOKjpDbDzM7P7lvEUnUKL5WgAcf
	qplL2GvAG9BGxNIrbsNjXcH85tIhQ98gj6rP8FncRQtn2AyEh8KJiqJTJWY9Eox1t82A539hyuKXm
	JW3CWYYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66WS-00000003iS5-3tTy;
	Mon, 14 Sep 2026 13:15:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66WN-00000003iPP-2SL1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:14:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53AB21570;
	Mon, 14 Sep 2026 06:14:50 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AFB93F9A2;
	Mon, 14 Sep 2026 06:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789391693; bh=9fzthyXkK1SDBi5vFe7gBqxNV/kFVCWjjbdq04srRZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YBLDnf85hRwnACSxvYy88ispQT9XLGw9eliM6ovAUr5ToQcP2Fdi7ksyPYLPJ63R+
	 a8BJTDioobKIcffsqGTUNa9LdfKw9d9IuWN8U7nB+0hFKhRElBuKs4POGxb4Ds07my
	 89sM7iB/X0+em2o2O1/DP5S93kvLdM8tVXmG0sAc=
Date: Mon, 14 Sep 2026 14:14:44 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Olivia Mackall <olivia@selenic.com>
Subject: Re: [PATCH v11 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
Message-ID: <aqfzRKlPsxuGYJlw@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-3-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-3-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_061455_706347_32543613 
X-CRM114-Status: GOOD (  31.10  )
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

You still haven't copied Olivia and Herbert for the hw_random bits.

On Mon, Sep 14, 2026 at 11:35:06AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The SMCCC TRNG interface is a firmware-provided SMCCC service rather than a
> standalone platform device. Now that the SMCCC core has an SMCCC bus,
> create an arm-smccc-trng device for the discovered TRNG service and convert
> the hwrng driver to an SMCCC driver.
> 
> The SMCCC id table preserves module autoloading for systems where the TRNG
> driver is built as a module.
> 
> The sysfs device path changes from the old smccc_trng platform-device path
> to an arm-smccc device path. No known userspace dependency on the old path
> was found; a Debian Code Search lookup for the existing platform-device
> name/path did not find any users.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

> ---
>  arch/arm/include/asm/archrandom.h       |  2 +-
>  arch/arm64/include/asm/archrandom.h     |  2 +-
>  drivers/char/hw_random/arm_smccc_trng.c | 32 ++++++++-----
>  drivers/firmware/smccc/smccc.c          | 62 +++++++++++++++++++++----
>  4 files changed, 76 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm/include/asm/archrandom.h b/arch/arm/include/asm/archrandom.h
> index cc4714eb1a75..ee39a03ddf8a 100644
> --- a/arch/arm/include/asm/archrandom.h
> +++ b/arch/arm/include/asm/archrandom.h
> @@ -2,7 +2,7 @@
>  #ifndef _ASM_ARCHRANDOM_H
>  #define _ASM_ARCHRANDOM_H
>  
> -static inline bool __init smccc_probe_trng(void)
> +static inline bool smccc_probe_trng(void)
>  {
>  	return false;
>  }
> diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
> index 8babfbe31f95..7605dd81bd1e 100644
> --- a/arch/arm64/include/asm/archrandom.h
> +++ b/arch/arm64/include/asm/archrandom.h
> @@ -12,7 +12,7 @@
>  
>  extern bool smccc_trng_available;
>  
> -static inline bool __init smccc_probe_trng(void)
> +static inline bool smccc_probe_trng(void)
>  {
>  	struct arm_smccc_res res;
>  
> diff --git a/drivers/char/hw_random/arm_smccc_trng.c b/drivers/char/hw_random/arm_smccc_trng.c
> index dcb8e7f37f25..01c1a30cbab8 100644
> --- a/drivers/char/hw_random/arm_smccc_trng.c
> +++ b/drivers/char/hw_random/arm_smccc_trng.c
> @@ -16,8 +16,10 @@
>  #include <linux/device.h>
>  #include <linux/hw_random.h>
>  #include <linux/module.h>
> -#include <linux/platform_device.h>
>  #include <linux/arm-smccc.h>
> +#include <linux/arm-smccc-bus.h>
> +
> +#include <asm/archrandom.h>
>  
>  #ifdef CONFIG_ARM64
>  #define ARM_SMCCC_TRNG_RND	ARM_SMCCC_TRNG_RND64
> @@ -94,29 +96,37 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
>  	return copied;
>  }
>  
> -static int smccc_trng_probe(struct platform_device *pdev)
> +static int smccc_trng_probe(struct arm_smccc_device *sdev)
>  {
>  	struct hwrng *trng;
>  
> -	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
> +	/* validate the minimum version requirement */
> +	if (!smccc_probe_trng())
> +		return -ENODEV;
> +
> +	trng = devm_kzalloc(&sdev->dev, sizeof(*trng), GFP_KERNEL);
>  	if (!trng)
>  		return -ENOMEM;
>  
>  	trng->name = "smccc_trng";
>  	trng->read = smccc_trng_read;
>  
> -	return devm_hwrng_register(&pdev->dev, trng);
> +	return devm_hwrng_register(&sdev->dev, trng);
>  }
>  
> -static struct platform_driver smccc_trng_driver = {
> -	.driver = {
> -		.name		= "smccc_trng",
> -	},
> -	.probe		= smccc_trng_probe,
> +static const struct arm_smccc_device_id smccc_trng_id_table[] = {
> +	{ .func_id = ARM_SMCCC_TRNG_VERSION },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(arm_smccc, smccc_trng_id_table);
> +
> +static struct arm_smccc_driver smccc_trng_driver = {
> +	.name	  = KBUILD_MODNAME,
> +	.probe	  = smccc_trng_probe,
> +	.id_table = smccc_trng_id_table,
>  };
> -module_platform_driver(smccc_trng_driver);
> +module_arm_smccc_driver(smccc_trng_driver);
>  
> -MODULE_ALIAS("platform:smccc_trng");
>  MODULE_AUTHOR("Andre Przywara");
>  MODULE_DESCRIPTION("Arm SMCCC TRNG firmware interface support");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index bdee057db2fd..756c79204e44 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -9,7 +9,8 @@
>  #include <linux/init.h>
>  #include <linux/arm-smccc.h>
>  #include <linux/kernel.h>
> -#include <linux/platform_device.h>
> +#include <linux/arm-smccc-bus.h>
> +
>  #include <asm/archrandom.h>
>  
>  static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
> @@ -81,16 +82,59 @@ bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
>  }
>  EXPORT_SYMBOL_GPL(arm_smccc_hypervisor_has_uuid);
>  
> +struct smccc_device_info {
> +	u32 func_id;
> +	bool requires_smc;
> +	const char *device_name;
> +};
> +
> +static const struct smccc_device_info smccc_devices[] __initconst = {
> +	{
> +		.func_id        = ARM_SMCCC_TRNG_VERSION,
> +		.requires_smc   = false,
> +		.device_name    = "arm-smccc-trng",
> +	},
> +};
> +
> +static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> +{
> +	int ret;
> +	struct arm_smccc_res res = {};
> +
> +	if (smccc_conduit == SMCCC_CONDUIT_NONE)
> +		return false;
> +
> +	if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
> +		return false;
> +
> +	if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
> +		return false;
> +
> +	arm_smccc_1_1_invoke(smccc_dev->func_id,
> +			     0, 0, 0, 0, 0, 0, 0, &res);
> +	ret = res.a0;
> +
> +	if (ret == SMCCC_RET_NOT_SUPPORTED)
> +		return false;
> +
> +	return true;
> +}
> +
>  static int __init smccc_devices_init(void)
>  {
> -	struct platform_device *pdev;
> -
> -	if (smccc_trng_available) {
> -		pdev = platform_device_register_simple("smccc_trng", -1,
> -						       NULL, 0);
> -		if (IS_ERR(pdev))
> -			pr_err("smccc_trng: could not register device: %ld\n",
> -			       PTR_ERR(pdev));
> +	struct arm_smccc_device *sdev;
> +	const struct smccc_device_info *smccc_dev;
> +
> +	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
> +		smccc_dev = &smccc_devices[i];
> +
> +		if (!smccc_probe_smccc_device(smccc_dev))
> +			continue;
> +
> +		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
> +		if (IS_ERR(sdev))
> +			pr_err("%s: could not register device: %ld\n",
> +			       smccc_dev->device_name, PTR_ERR(sdev));
>  	}
>  
>  	return 0;
> -- 
> 2.43.0

