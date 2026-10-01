Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04B4CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68HSkxELOQFz+Jf6fK34pTwAZVZfyUhd2rIP6STnHPE=; b=nUYbzxa6RHN5Gr1hWXKxXtQlFb
	Blbbe7bnAj4wB2Ue0Osvz2CFto1tU5Nrf3O+craxK77LjqdJ5wav+/GVcSonFZu9XBYGdHyoFCgEf
	O5bhTIHUUd3cIDHqJfO6Hay1A9wbhG2JQurNpCJur683d2xOhbmMZlPyuF6heOm7ymGaBYvrnyYpA
	m71HfCLZW3xtHp6ZrS+YwVJu9I1rxV4nVg77+mvCtlW39b9kKemwjOIdecvAGyVTI8bjv2ZDA6B+q
	xzB7LW+JNqh3xOk2c7yrJgNLBvyqPfoUrvznd1BzbpOMpdChJOLdNtOrMdE/uT9aUz6GEwX47YV9r
	/H33w7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDBD-00000008Ndp-1cuG;
	Thu, 01 Oct 2026 09:34:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDBA-00000008NdA-3qru
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:34:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87E32497;
	Thu,  1 Oct 2026 02:34:12 -0700 (PDT)
Received: from [10.57.54.170] (unknown [10.57.54.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAA703F86F;
	Thu,  1 Oct 2026 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790847255; bh=1zrhDKNmu636ji5kFIjsspTp01sRMrCi4IOadjuNaHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eKHxwRgsFLwuLhOef3kDJKGvaJxbwEY9GEebLqGc0Nmqyfzm1AfZ5WhNhm+smOwyh
	 +cE/EkmEfoc4IB1exw347qcu3IIOnHAUdOqOGt3sZZDxafbxRhvAztatI8nLFIjrEl
	 2EXbxy8FTS1+GoGL8dCflHfm2XEswdw3325mH/a4=
Message-ID: <0494fd68-2b73-4bbd-b013-7d1e79fdf01a@arm.com>
Date: Thu, 1 Oct 2026 11:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: smccc: add cache clean/invalidate IDs and
 return codes
To: Srirangan Madhavan <smadhavan@nvidia.com>, mark.rutland@arm.com,
 lpieralisi@kernel.org, sudeep.holla@kernel.org, conor@kernel.org,
 jic23@kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, treding@nvidia.com,
 jonathanh@nvidia.com, bence.csokas@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260910082142.1522865-1-smadhavan@nvidia.com>
 <20260910082142.1522865-2-smadhavan@nvidia.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260910082142.1522865-2-smadhavan@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_023417_041328_AE638751 
X-CRM114-Status: GOOD (  14.92  )
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

Hi,

On 9/10/26 10:21, Srirangan Madhavan wrote:
> Define SMCCC Arch function IDs for CLEAN_INV_MEMREGION and its ATTRIBUTES
> call, and add RATE_LIMITED/BUSY return codes from DEN0028 for callers that
> need transient error handling.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
> Reviewed-by: Jonathan Cameron <jic23@kernel.org>
> ---
>   include/linux/arm-smccc.h       | 21 +++++++++++++++++++--
>   tools/include/linux/arm-smccc.h | 21 +++++++++++++++++++--
>   2 files changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 4de81848fe2e..2e205320d88a 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.hARM_SMCCC_FAST_CALL
> @@ -116,6 +116,22 @@
>   			   ARM_SMCCC_SMC_32,				\
>   			   ARM_SMCCC_OWNER_CPU, 0x10)
>   
> +/*
> + * DEN0028 v1.7 defines these cache maintenance functions as SMC64
> + * because they carry 64-bit memory range arguments.
> + */
> +#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION				\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
> +			   ARM_SMCCC_SMC_64,				\
> +			   ARM_SMCCC_OWNER_ARCH,			\
> +			   0x5)
> +
> +#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES			\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
> +			   ARM_SMCCC_SMC_64,				\
> +			   ARM_SMCCC_OWNER_ARCH,			\
> +			   0x6)
> +
>   #define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
>   	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
>   			   ARM_SMCCC_SMC_32,				\
> @@ -305,13 +321,14 @@
>   			   0x53)
>   
>   /*
> - * Return codes defined in ARM DEN 0070A
> - * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
> + * Return codes defined by Arm SMCCC (DEN0028 v1.7).
>    */
>   #define SMCCC_RET_SUCCESS			0
>   #define SMCCC_RET_NOT_SUPPORTED			-1
>   #define SMCCC_RET_NOT_REQUIRED			-2
>   #define SMCCC_RET_INVALID_PARAMETER		-3
> +#define SMCCC_RET_RATE_LIMITED			-4
> +#define SMCCC_RET_BUSY				-5
>   
>   #ifndef __ASSEMBLY__
>   
> diff --git a/tools/include/linux/arm-smccc.h b/tools/include/linux/arm-smccc.h
> index 63ce9bebccd3..ae5637b3240f 100644
> --- a/tools/include/linux/arm-smccc.h
> +++ b/tools/include/linux/arm-smccc.h

Why is that? Is there any tool using that? I don't think we 
unconditionally sync the two files?

The numbers in the file above match the spec, so for that part:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre


> @@ -96,6 +96,22 @@
>   			   ARM_SMCCC_SMC_32,				\
>   			   0, 0x3fff)
>   
> +/*
> + * DEN0028 v1.7 defines these cache maintenance functions as SMC64
> + * because they carry 64-bit memory range arguments.
> + */
> +#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION				\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
> +			   ARM_SMCCC_SMC_64,				\
> +			   ARM_SMCCC_OWNER_ARCH,			\
> +			   0x5)
> +
> +#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES			\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
> +			   ARM_SMCCC_SMC_64,				\
> +			   ARM_SMCCC_OWNER_ARCH,			\
> +			   0x6)
> +
>   #define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
>   	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
>   			   ARM_SMCCC_SMC_32,				\
> @@ -182,12 +198,13 @@
>   			   0x53)
>   
>   /*
> - * Return codes defined in ARM DEN 0070A
> - * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
> + * Return codes defined by Arm SMCCC (DEN0028 v1.7).
>    */
>   #define SMCCC_RET_SUCCESS			0
>   #define SMCCC_RET_NOT_SUPPORTED			-1
>   #define SMCCC_RET_NOT_REQUIRED			-2
>   #define SMCCC_RET_INVALID_PARAMETER		-3
> +#define SMCCC_RET_RATE_LIMITED			-4
> +#define SMCCC_RET_BUSY				-5
>   
>   #endif /*__LINUX_ARM_SMCCC_H*/


