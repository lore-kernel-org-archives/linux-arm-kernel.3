Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29DBCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 03:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUqyt0vezPpSgZq+1/oWOilSNokxX7sjQOB+0OZMeo0=; b=UjxDwL2cqpw5X+IzpYzo6djAjy
	eQwhp+JXpCW7Tfvb1/VCh/enzqdyk0yoM31uZ8BhOA0JL3p+MPjy1q0p++n8JaH+9ec8+sQ+yy1rs
	FHVp/aNKjDE6+ohSmzfIXX92wWrH4rRy5LP4GXu2v6jvq7loKwCkbSqaWqvbQqHdvroV4lQYBnBMs
	Xof2lXwbNjP/FGzQu2tvMvejmFIvGOHcBLEEGsf/T7un1HVlM/Yiog3G+9gTuDCXAhYDxjFLKd9Gn
	kAeXkKTpwm8HpMa5ntaJJ+4BU9A9wKE/kFX5cIWVjAHRQ9tu5BqZFY7soMl8PxtPzJiZONjJSBR9v
	7LL//FPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTaG-0000000Bw0H-0s0j;
	Tue, 13 Oct 2026 03:53:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTaD-0000000BvzQ-2se1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 03:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791863623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mUqyt0vezPpSgZq+1/oWOilSNokxX7sjQOB+0OZMeo0=;
	b=aScfSouSD7rQYmbp3Zs+GGyXXzueZ2kfrlhB6NxYGeQlScLdU68jv0vc6EI3eiPHxPo0gY
	elXMQZMHT01DUnAqIwmt8n294l7Wk5jKQuaF2NM4r1Voz2auV84doGgUraYJpSH4g0CLya
	aWoy1lVuLQ55EnoVY3swgElCr3dTwlQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-8y2oEfN8NcuUSMZ3rqGXrg-1; Tue, 13 Oct 2026 03:53:36 +0000
X-MC-Unique: 8y2oEfN8NcuUSMZ3rqGXrg-1
X-Mimecast-MFC-AGG-ID: 8y2oEfN8NcuUSMZ3rqGXrg_1791863615
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso3133293a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 20:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791863615; x=1792468415;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUqyt0vezPpSgZq+1/oWOilSNokxX7sjQOB+0OZMeo0=;
        b=yjfPe1y6ponkISQwDtoaMILa0tEhc1W4YjK9I5XOZoFbKOpOTtGyMBJZLm4DvCO0Wf
         1NWPHAitCaQrbs4Azt20v6Tlq6vBxbc/9ks0QxVAts1UpQXA/Phc4SCButGrLXwCotG3
         V28ZeAYZiG3RGuzrwdqq3qWyyVW6MyTuSnx7iyaq70LsAO2XtpWQ+AOvrmkNw0UCmNbT
         hb8yrZMNLMZg+GffmQxexDvrV8OnluZO47LUHxBCp+h7KBMfBHLLDG9Q5RXrrjCcTaNs
         09wZi7WgfllrR853hovcqUrSCyrqTKtsqeblp56bxnReJMSx0cOQpi2HUhc6yz98ga/p
         pQQg==
X-Forwarded-Encrypted: i=1; AKwUvByTkkLHJo8xFtYi0JugqEe7P164wQ4de4yRjjGkjhsFpFvSkrGB/sVdRMaXX27kMVTdwiPIMffBycsm0liia5Tz@lists.infradead.org
X-Gm-Message-State: AFq9FYI5pIWmKd3HS2ltlqkYUkWYebpIV5V+s0jN7CjSqOnfjF5+xYTv
	BDPH25JIcm3iH4+vr91V5nj6hWqnjm1NVsxIGPvNNcAgztx3Synv78s2r7mLUHJv52wEzXpSYI3
	EnyI3AhlEr6RCshkrUucnLYaIzeulvUC5RobXnXaoT0Dh8NeMNoYk2/HF+e8ioyyt+bsJlxrmn+
	8x
X-Gm-Gg: AYBFou1n9Uk2oFwHbjP3Z/nPjNeYzkA6OZ9iT1yvvTNbAr/qlG014Cb7i2iUPcXBODb
	ibRDouivO2RqrwSbXp/3AWWt9SQ2DfsQt9XD+riiwE0sQeS4TQfQDOn3QuFGyTg5eWO2/StLlOl
	jkNKzJCIwDTk2e8cc10fsDqQENpjtANQ/6tXGifjzrdQXN950D8YwaKHyGNpZ3wmJOtv+jcFkcf
	ubpQOVkWqJLIi4qOWnRBUmvhbufCkuWcpIIdnC5K9JgamXP1I/X5mZCDh9/M4jrNZUdPzoWkIFn
	dXzCfzUwNFe/kE8uODbbJLPbgbNjH8WG8Pw8mW4gKAd1eTHBanIgf9AyAQNftAkTpVUKwmxqeLT
	fKsyphDMIQ7PpiQNR6ZdbdDrkM3wDxGXPHh0Tv3OzFQ==
X-Received: by 2002:a17:90b:6c5:b0:3ac:450a:f9ac with SMTP id 98e67ed59e1d1-3ac450b4782mr286967a91.64.1791863615079;
        Mon, 12 Oct 2026 20:53:35 -0700 (PDT)
X-Received: by 2002:a17:90b:6c5:b0:3ac:450a:f9ac with SMTP id 98e67ed59e1d1-3ac450b4782mr286938a91.64.1791863614431;
        Mon, 12 Oct 2026 20:53:34 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm18786368a91.8.2026.10.12.20.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 20:53:33 -0700 (PDT)
Message-ID: <2586e689-c27d-4e4c-8c69-03e24259cb96@redhat.com>
Date: Tue, 13 Oct 2026 13:53:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 02/10] firmware: arm_rmm: Check for RMI support at
 init
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-3-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261002061507.1600269-3-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gU8BLskcozAlbfFgPZi1RiP9dWPDbGoH1o3KK2LsNVE_1791863615
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_205345_805619_0054B158 
X-CRM114-Status: GOOD (  23.29  )
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

Hi Suzuki,

On 10/2/26 4:14 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Query the RMI version number and check if it is a compatible version.
> All RMM feature registers are read and exposed for future code to
> use. Also restrict the support to SMC conduit.
> 
> We only support this for Little Endian kernels, the Big Endian kernel
> support is anyway marked BROKEN and is being removed.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---

[...]

> ---
>   MAINTAINERS                       |   2 +
>   arch/arm64/Kconfig                |   1 +
>   arch/arm64/kernel/cpufeature.c    |   1 +
>   arch/arm64/kvm/sys_regs.c         |   2 +
>   drivers/firmware/Kconfig          |   1 +
>   drivers/firmware/Makefile         |   1 +
>   drivers/firmware/arm_rmm/Kconfig  |  25 +++++++
>   drivers/firmware/arm_rmm/Makefile |   1 +
>   drivers/firmware/arm_rmm/rmi.c    | 112 ++++++++++++++++++++++++++++++
>   include/linux/arm-rmi-cmds.h      |  48 +++++++++++++
>   10 files changed, 194 insertions(+)
>   create mode 100644 drivers/firmware/arm_rmm/Kconfig
>   create mode 100644 drivers/firmware/arm_rmm/Makefile
>   create mode 100644 drivers/firmware/arm_rmm/rmi.c
>   create mode 100644 include/linux/arm-rmi-cmds.h
> 

[...]

> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> new file mode 100644
> index 0000000000000..06f5392c982d2
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/rmi.c
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-2026 ARM Ltd.
> + */
> +
> +#include <linux/arm-rmi-cmds.h>
> +#include <linux/cpufeature.h>
> +#include <linux/memblock.h>
> +#include <linux/slab.h>
> +
> +#include <asm/memory.h>
> +#include <asm/pgtable-hwdef.h>
> +
> +/* RMM v2.0 defines RmiFeatureRegister0 to RmiFeatureRegister4. */
> +static unsigned long rmi_feat_reg_cache[5] __ro_after_init;
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
> +	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
> +		return -ENXIO;

I think we need to ensure SMCCC version is v1.2 or a newer one here? arm_smccc_1_2_smc()
is immediately called by rmi_smccc_invoke() after this check.

	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC ||
             arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
		return -ENXIO;

Thanks,
Gavin

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

[...]




