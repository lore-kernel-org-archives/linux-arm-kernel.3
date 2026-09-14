Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8B8C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 01:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+ToDWrV8UxxIuKtZsFE2911eXOvpMNV/9X+eN8RiBQ=; b=ADX3la2nJJgn1iUJETADdFRA2H
	hbzRPsNxjYwUSv9mCtD9g/uInJeVqed4p5GHbfxTRAfr5aFPwW8lIQntkFyb8rDygSIcsoKbPn8tt
	QxuHkGHYQknO9kss46KV57cLpTEKXuerbOdCrsPlHNNwstCPiEG+Yj9+52gJsOdD3R90aKQ0nnHqh
	Yg0HPp515MShjPf4lR1ToV/Msjc3bHVUHWHA5ftOnA3NIeSuu2GU88ImiGqHHP0vhIZOgOtsDSjYu
	TS5aI3XBgN9y4MVSX2UIyBu+LrVO6PnfqAsG8t1xHw3zb+LsOenbRrsX7Z7jkt+uDWNNEVqMzHmog
	CrNQQBhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5v7O-000000028SS-29BT;
	Mon, 14 Sep 2026 01:04:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5v7K-000000028S7-3PxU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 01:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789347857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+ToDWrV8UxxIuKtZsFE2911eXOvpMNV/9X+eN8RiBQ=;
	b=U+xixuocEZdZwaoNLCzEcQvDiFDAnrtaGlu5vKlgi747ESYcYadpxJCTUkKhc/LmS+fFZi
	+zwaxcLq/Bk95aqp0MJtZ6hPkuliuaIsQPzpvkFE+Nt3/bmiI7qmPGzQv4eiwBcsbMtBaN
	NjVK6CTtKt0+1nzVF/mBi1WJmKBXoW0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-YBYiiJaAPw68-ojIVpyB-w-1; Sun, 13 Sep 2026 21:04:15 -0400
X-MC-Unique: YBYiiJaAPw68-ojIVpyB-w-1
X-Mimecast-MFC-AGG-ID: YBYiiJaAPw68-ojIVpyB-w_1789347854
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso2752794a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 18:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789347854; x=1789952654;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+ToDWrV8UxxIuKtZsFE2911eXOvpMNV/9X+eN8RiBQ=;
        b=ZxHLTqc6PEdD1iKn7OE14R5Xn2SnWJOI+tRdl21KjnuUmKjnHsOo+j8adnunkB1BHw
         PVEYNurvKwJe9GT1riq2pu8HowB8TTcjo9TJqL1uvuAwJyA63csnvDOvy/Ihp0O27nrM
         9GQwsShQTjAmkANrifLgTPq424oj0PoPDmV2hDoyUFgEzpXNxEm7y0fpiHOBaveqKZA7
         NmefLd1rBEeQjVZxN0Bk7NJZoUbufohtEppLrGUoQ1HQLjJp0EwWhCSijAuxKieDUilH
         9QZY9y961fKhnTWBbhBDkm2yzv5bAz8DC4xBBTiK1oFjcPcG1aVhjtw99jWfI34JnJCd
         Obfw==
X-Forwarded-Encrypted: i=1; AKwUvBww3weD/awjA5aCcNAWRFc5LGQ7icw79s97cWBlKyqu1ioVJ1p2O5tQWY0vxXT2eP8KsqSZKKcQZTGReNpOZH/t@lists.infradead.org
X-Gm-Message-State: AFuF++nCTRpBtsxw+e8BvgoJhrMXVZkJfvlfjc57elI/TPpbO8xdmICg
	MlRsEJiirlsyOboIKk9c80oezCjCrLnTbXnjfjDUjKZerO2lNTj71wOtBQmkLaR3GU3F1ZVQVUZ
	MStU7CX6hoOR9xNsPT9qs+MkxMi2nC10ZxsfS5gUeXn5omK8UDLiQVXyRNx5c7Y52Ix3qiSrx+t
	EO
X-Gm-Gg: AYBFou2rwnRICwGJzZjZrMZ3IMC/wXo35PvpnBBp8PSEO7EdGoWfTY0pM8PQlwvdho5
	cdSnhGLvuuchoqP83LQMVFvEGYU18ajApsx25klj3Hc2lH5hwWnYzd9qjgESJ+aLaktrZ9GThOV
	KEBi1nmPWGREOUw3t6F2XiTLir++H4voYGw8CCjV4TH0VWUh3q6uxeRD+GH2YMXyr2u/IKF6eNN
	HKq8hR9Tn2sF6USjZVibgoxx/6koYIJhCvt3EHNiKC69SU17gOhTRBffqtt027YivgreFLiOVRG
	ANapNTp0T2pEYWmNavNg2LiBCavUMAwa0b78LhzEV9K9takzH4cAMgBWE4XFN2ksryCc7ROffPI
	0FF0vPrbErPIineMSwOwcFND2idT/dXfHE4oOkcLk5g==
X-Received: by 2002:a17:90b:582f:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39dec05fc8emr865878a91.16.1789347854106;
        Sun, 13 Sep 2026 18:04:14 -0700 (PDT)
X-Received: by 2002:a17:90b:582f:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39dec05fc8emr865827a91.16.1789347853564;
        Sun, 13 Sep 2026 18:04:13 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm17925136a91.12.2026.09.13.18.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 18:04:12 -0700 (PDT)
Message-ID: <64fc6f73-28ef-4794-8e1c-a6cfdb2f91b2@redhat.com>
Date: Mon, 14 Sep 2026 11:04:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 2/7] firmware: arm_rmm: Check for RMI support at init
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-3-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260912083611.2513845-3-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bURLs5l7GulcURO0lMfh4IX91Ms8Q85y20Ozn5Dk9w0_1789347854
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_180419_212558_385F25DA 
X-CRM114-Status: GOOD (  45.00  )
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

On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Query the RMI version number and check if it is a compatible version.
> The first two feature registers are read and exposed for future code to
> use.
> 
> We only support this for Little Endian kernels, the Big Endian kernel
> support is anyway marked BROKEN and is being removed.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> v18:
>   * Always use arm_smccc_1_2_invoke() for all RMIs making sure the unsused
>     parameters are 0 - Sashiko
>   * Move rmi_features() calls away from the arm-rmi-cmds.h to rmi.c - Gavin
> v17:
>   * Rename ARM_RMM to ARM_RMM_RMI to make it easier to add Guest facing RSI
>     support, which is also in progress
> v16:
>   * Update Kconfig text to include PCIe TDISP.
>   * Export rmi_feat_reg() here rather than in a later commit.
> v15:
>   * The code is moved again, this time into the 'firmware' directory.
> v14:
>   * This moves the basic RMI setup into the 'kernel' directory. This is
>     because RMI will be used for some features outside of KVM so should
>     be available even if KVM isn't compiled in.
> ---
>   arch/arm64/Kconfig                |   1 +
>   arch/arm64/kernel/cpufeature.c    |   1 +
>   drivers/firmware/Kconfig          |   1 +
>   drivers/firmware/Makefile         |   1 +
>   drivers/firmware/arm_rmm/Kconfig  |  26 +++++++
>   drivers/firmware/arm_rmm/Makefile |   2 +
>   drivers/firmware/arm_rmm/rmi.c    | 122 ++++++++++++++++++++++++++++++
>   include/linux/arm-rmi-cmds.h      |  36 +++++++++
>   8 files changed, 190 insertions(+)
>   create mode 100644 drivers/firmware/arm_rmm/Kconfig
>   create mode 100644 drivers/firmware/arm_rmm/Makefile
>   create mode 100644 drivers/firmware/arm_rmm/rmi.c
>   create mode 100644 include/linux/arm-rmi-cmds.h
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b5a51b0ef9440..ff9565d3ffa59 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -38,6 +38,7 @@ config ARM64
>   	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>   	select ARCH_HAS_MEM_ENCRYPT
>   	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
> +	select ARCH_SUPPORTS_RMM
>   	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>   	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>   	select ARCH_HAS_NONLEAF_PMD_YOUNG if ARM64_HAFT
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 32102c3912fa7..e8b29983b0021 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -293,6 +293,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar3[] = {
>   static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_CSV3_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_CSV2_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_RME_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_DIT_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_AMU_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_MPAM_SHIFT, 4, 0),
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index b7cc11e4fbfa6..62660bf520a8d 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -310,5 +310,6 @@ source "drivers/firmware/samsung/Kconfig"
>   source "drivers/firmware/smccc/Kconfig"
>   source "drivers/firmware/tegra/Kconfig"
>   source "drivers/firmware/xilinx/Kconfig"
> +source "drivers/firmware/arm_rmm/Kconfig"
>   
>   endmenu
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index be46f1e1dc77f..196a650ccf025 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -39,3 +39,4 @@ obj-y				+= samsung/
>   obj-y				+= smccc/
>   obj-y				+= tegra/
>   obj-y				+= xilinx/
> +obj-y				+= arm_rmm/
> diff --git a/drivers/firmware/arm_rmm/Kconfig b/drivers/firmware/arm_rmm/Kconfig
> new file mode 100644
> index 0000000000000..82724ee23186d
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/Kconfig
> @@ -0,0 +1,26 @@
> +
> +config ARCH_SUPPORTS_RMM
> +	bool
> +
> +config ARM_RMM_RMI
> +	bool "Realm Management Interface (RMI) Support"
> +	depends on ARCH_SUPPORTS_RMM
> +	default y
> +	help
> +	  Support the Realm Management Monitor (RMM) on Arm systems that
> +	  implement the Realm Management Extension (RME), as defined by the
> +	  Arm Confidential Compute Architecture.
> +
> +	  The RMM runs at EL2 in the Realm world and provides the Realm
> +	  Management Interface (RMI) used by a Normal World host to create,
> +	  manage and run protected virtual machines called Realms. The RMM can
> +	  also act as a TSM, as defined by the PCIe TDISP and can manage the
> +	  PCI IDE setup for securing the PCIe links.
> +
> +	  This option builds the host-side RMI support used by KVM to detect a
> +	  compatible RMM, configure it, manage delegated memory and enable
> +	  Realm guests.
> +
> +	  Selecting this option does not by itself make Realm guests available:
> +	  the system must also provide RME-capable hardware and firmware with a
> +	  compatible RMM implementation.
> diff --git a/drivers/firmware/arm_rmm/Makefile b/drivers/firmware/arm_rmm/Makefile
> new file mode 100644
> index 0000000000000..65171988fdcae
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/Makefile
> @@ -0,0 +1,2 @@
> +
> +obj-$(CONFIG_ARM_RMM_RMI)	= rmi.o
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> new file mode 100644
> index 0000000000000..2fd538c937dca
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/rmi.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-2026 ARM Ltd.
> + */
> +
> +#include <linux/cpufeature.h>
> +#include <linux/memblock.h>
> +#include <linux/arm-rmi-cmds.h>
> +#include <linux/slab.h>
> +
> +#include <asm/memory.h>
> +#include <asm/pgtable-hwdef.h>
> +
> +/* Currently only the first 2 registers are used by Linux */
> +#define RMI_FEAT_REG_COUNT	2
> +static unsigned long rmi_feat_reg_cache[RMI_FEAT_REG_COUNT] __ro_after_init;
> +
> +/**
> + * rmi_features() - Read feature register
> + * @index: Feature register index
> + * @out: Feature register value is written to this pointer
> + *
> + * Return: RMI return code
> + */
> +static int rmi_features(unsigned long index, unsigned long *out)
> +{
> +	struct arm_smccc_1_2_regs args = {
> +		SMC_RMI_FEATURES, index
> +	};
> +
> +	rmi_smccc_invoke(&args);
> +	if (args.a0 == RMI_SUCCESS && out)
> +		*out = args.a1;
> +
> +	return args.a0;
> +}
> +

The comments for rmi_features() is unnecessary since the code is self-explainning.
Besides, it needs to be moved to right before its only caller rmi_read_features().

I would drop this function by combining the logics into its only caller rmi_read_features(),
seeing below for more details.

> +unsigned long rmi_feat_reg(unsigned long index)
> +{
> +	if (WARN_ON(index >= RMI_FEAT_REG_COUNT))
> +		return 0;
> +
> +	return rmi_feat_reg_cache[index];
> +}
> +EXPORT_SYMBOL_GPL(rmi_feat_reg);
> +
> +static int rmi_check_version(void)
> +{
> +	unsigned short version_major, version_minor;
> +	unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
> +						     RMI_ABI_MINOR_VERSION);
> +	unsigned long aa64pfr0 = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
> +	struct arm_smccc_1_2_regs res = {
> +		SMC_RMI_VERSION, host_version,
> +	};
> +
> +	/* If RME isn't supported, then RMI can't be */
> +	if (cpuid_feature_extract_unsigned_field(aa64pfr0, ID_AA64PFR0_EL1_RME_SHIFT) == 0)
> +		return -ENXIO;
> +
> +	rmi_smccc_invoke(&res);
> +	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
> +		return -ENXIO;
> +
> +	version_major = RMI_ABI_VERSION_GET_MAJOR(res.a1);
> +	version_minor = RMI_ABI_VERSION_GET_MINOR(res.a1);
> +
> +	if (res.a0 != RMI_SUCCESS) {
> +		unsigned short high_version_major, high_version_minor;
> +
> +		high_version_major = RMI_ABI_VERSION_GET_MAJOR(res.a2);
> +		high_version_minor = RMI_ABI_VERSION_GET_MINOR(res.a2);
> +
> +		pr_err("Unsupported RMI ABI (v%d.%d - v%d.%d) we want v%d.%d\n",
> +		       version_major, version_minor,
> +		       high_version_major, high_version_minor,
> +		       RMI_ABI_MAJOR_VERSION,
> +		       RMI_ABI_MINOR_VERSION);
> +		return -ENXIO;
> +	}
> +
> +	pr_info("RMI ABI version %d.%d\n", version_major, version_minor);
> +
> +	return 0;
> +}
> +
> +static int rmi_read_features(void)
> +{
> +	/*
> +	 * Since we've negotiated a compatible version these feature registers
> +	 * should always be available
> +	 */
> +	for (int i = 0; i < RMI_FEAT_REG_COUNT; i++) {
> +		if (WARN_ON(rmi_features(i, &rmi_feat_reg_cache[i])))
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +

As above, I would suggest to combine the logics of rmi_features() into this function.
The function name would be rmi_init_feat_regs(), consistent to rmi_feat_reg().

static int rmi_init_feat_regs(void)
{
	struct arm_smccc_1_2_regs args;
	int i;

	/*
	 * Since we've negotiated a compatible version these feature registers
	 * should always be available
	 */
	for (i = 0; i < RMI_FEAT_REG_COUNT; i++) {
		args.a0 = SMC_RMI_FEATURES;
		args.a1 = i;
		rmi_smccc_invoke(&args);
		if (WARN_ON(args.a0 != RMI_SUCCESS))
			return -EINVAL;

		rmi_feat_reg_cache[i] = args.a1;
	}
  
	return 0;
}

> +static int __init arm64_init_rmi(void)
> +{
> +	int ret;
> +
> +	/* Continue without realm support if we can't agree on a version */
> +	ret = rmi_check_version();
> +	if (ret)
> +		return ret;

The comment seems not applicable and can be dropped.

> +
> +	ret = rmi_read_features();
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/*
> + * Note arm64_init_rmi() must be called before kvm_init_rmi() otherwise KVM
> + * will not support realm guests. subsys_initcall() is called before
> + * module_init() (used for KVM) so this is OK.
> + */
> +subsys_initcall(arm64_init_rmi);
> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> new file mode 100644
> index 0000000000000..9792bf0e00cb9
> --- /dev/null
> +++ b/include/linux/arm-rmi-cmds.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2026 ARM Ltd.
> + */
> +
> +#ifndef __LINUX_ARM_RMI_CMDS_H_
> +#define __LINUX_ARM_RMI_CMDS_H_
> +
> +#include <linux/arm-smccc-rmi.h>
> +#include <linux/bug.h>
> +#include <linux/processor.h>
> +#include <linux/types.h>
> +
> +
> +/*
> + * rmi_smccc_invoke: Invoke the RMI call and return the results in @regs_out
> + * @regs_in: Registers with the arguments filled in.
> + * @regs_out: Ouptput results from the call.
> + */
> +static inline void rmi_smccc_invoke(struct arm_smccc_1_2_regs *regs)
> +{
> +	struct arm_smccc_1_2_regs args = *regs;
> +	unsigned long status;
> +
> +	while (1) {
> +		arm_smccc_1_2_invoke(&args, regs);
> +		status = RMI_RETURN_STATUS(regs->a0);
> +		if (status != RMI_BUSY && status != RMI_BLOCKED)
> +			break;
> +		cpu_relax();
> +	}
> +}
> +

@regs_in and @regs_out in the comments don't exist. So the comments need to be
improved with something as below.

/**
  * rmi_smccc_invoke: Invoke RMI call
  * @regs: input and output arguments
  *
  * Invoke RMI call by taking the input arguments from @regs, and the output of
  * the RMI call is also stored to @regs.
  */

> +unsigned long rmi_feat_reg(unsigned long index);
> +
> +#endif

"/* __LINUX_ARM_RMI_CMDS_H_ */" is missed here.

#endif /* __LINUX_ARM_RMI_CMDS_H_ */

Thanks,
Gavin


