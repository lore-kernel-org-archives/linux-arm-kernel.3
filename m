Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCF3CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 00:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tV7iZwvmmQQLSqky4R1D09YTKc/1j9bjaXabqWBMECY=; b=kJ3yft5sHdl9s+PWiDLQY+RfNh
	weUBGawKrDZWXAbNKEtuZKQmIHbE38n9Nw4CuCWeN4KwK39Yu4PY1qhOwJ96WHkeShyp7kh4dX2oR
	wPA9PZg2ywbKY6qAXX424GrTWTAhZYc3R2tJNw20gZHHqN0kiA+HkyKuNUf4ZKt7999TuuYsn8XC+
	PuYcJkGjS4IWc92hqfSBPy2qUWihfOMrQEje8aqNXtErfim1v6QK2IU9oiuBpFpLFKZ8Pt0CLh+zv
	ZdEEM9glvD9pd4kUYTWsrVySJiUtgc1qpvDB17fLb6Ddi3qqO8iOEinMmAoSz8ugbkfJzgnN0xtxW
	8LmudhKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPrSA-00000006II2-40Qk;
	Thu, 21 May 2026 00:39:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPrS8-00000006IHb-43lo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 00:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779323995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tV7iZwvmmQQLSqky4R1D09YTKc/1j9bjaXabqWBMECY=;
	b=h68WIJC2mT6e7NoRfxA47h3VeiCh4KxZq6qiJ9I1slD3Pe1Kv8YPwvA6dOu6LIEiLoQg60
	UUrZ+9e5zPBGdSEu7a0Jm353BSPytDYBaMCLt9EbNKj4poImWtF8IcL80yp84twJ22IJl6
	FNWGd5uSVqNBDDCyAbrfoj+G1q95wN4=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-0egS-ZuaMSCLp62lCihz1g-1; Wed, 20 May 2026 20:39:52 -0400
X-MC-Unique: 0egS-ZuaMSCLp62lCihz1g-1
X-Mimecast-MFC-AGG-ID: 0egS-ZuaMSCLp62lCihz1g_1779323991
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6b984b3aso2712587b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 17:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779323991; x=1779928791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tV7iZwvmmQQLSqky4R1D09YTKc/1j9bjaXabqWBMECY=;
        b=jH5tCZMOYwsRt7Z+PsQeq2DK6oqbnpMh73ipVbUaMmXBU5fzMp63m9lntUeiJKxAUY
         ElC8IsNWCaFEccuXF3Laa4edIEuQcRIAsIuFI64Kc96vbRHBXsG/yE1jopCWF6aWK+Zn
         IVErr5kqfSjnNYKOka1+JOfPzceGP7v7dJIJcfyAP4bWbpe3wtKNgC+UsG27ut7zG1F8
         4bUO74OutKrUSLq/rNBnGtwGAZkcedn6WCUSgEAzMHtSMcFleXaHbQnXlWVI9jS8A8q6
         NvPiw0Sp1lAckc0BZoiq2RIGpbpWiBQROemudTUba5zREpdUTCaMTaA05obTEuIuhoKz
         TX8w==
X-Forwarded-Encrypted: i=1; AFNElJ+ob8eO7iF2AMkC6quWTSNkqFzbqSA3OsIkCDMZ8brdHc9EyTGuorn0dd0/xHAVD7bXxYnS2s0ZyNHeDPvyigay@lists.infradead.org
X-Gm-Message-State: AOJu0YyA/xg60pnzyB7A4Uj2uBL1tJkYXIjIfwvbxxxBpLnk0g7+u7+0
	C9qGcA1WnAqrJSE2OQCoHXfxQg7x7+Rdnn/xPQSDGUZ7+/UYOkdN/YS4oLt77UCzFr0FEcRiuMr
	YXYrcDOmwhvr4Dv6Cs1qvhGZMTvD3MMojwxTnSImhfS/HdxAwqq/9rnlZ7vqO6VyH+AoXB8zN8e
	+I
X-Gm-Gg: Acq92OE6YvT9DAc3AcLkoJavnnQ7CwM03thLG25VLGlD9c9apyRURxaR2nJadgNTG06
	Bu1B2i6vHpbkJLDBUouSyzBDS9XzZMEMwI2WVkIItmlB32ssbgRR7gKC0+pLhEVb4C6GZ4Yb8il
	9sGxH6Orubb3/sgYvK3xAPWiHHkESeT8uv1bGAkXvX2y38zk2qbbNrQznkmABHfGW0RSIHFKljd
	pzk6HMuxwRD5LqUbT7Oiiy259VdasbRnjYJTMz6KRV3hUNknpEczJhW+izK7wT1XyZBz4dA8v20
	cT43qZ7o1HXUiESHMrtZFE/SDVx7gVdzQsgkfxFCe4xF2NwwUFjsm0nfaiPBf2ftQpQM0oVoWCX
	6Vw0nI3siJrLNACCEp5R3DuF+wR4ZNabPJk1DYXBRfDw+gQDYKskKF5nkwpp8T2h+
X-Received: by 2002:a05:6a00:1742:b0:83a:ebec:452f with SMTP id d2e1a72fcca58-8414ae6f985mr687565b3a.42.1779323990964;
        Wed, 20 May 2026 17:39:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:1742:b0:83a:ebec:452f with SMTP id d2e1a72fcca58-8414ae6f985mr687526b3a.42.1779323990418;
        Wed, 20 May 2026 17:39:50 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19663cfdsm27427984b3a.9.2026.05.20.17.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 17:39:49 -0700 (PDT)
Message-ID: <ee494ecd-8979-40f2-896e-82137abbf440@redhat.com>
Date: Thu, 21 May 2026 10:39:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 06/44] arm64: RMI: Check for RMI support at init
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-7-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-7-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fz4sZDZRsYXZqtV_779iWR_ozp1IdIUMllI412Mqqn4_1779323991
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_173957_081255_0055A6A7 
X-CRM114-Status: GOOD (  27.24  )
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

Hi Steven,

On 5/13/26 11:17 PM, Steven Price wrote:
> Query the RMI version number and check if it is a compatible version.
> The first two feature registers are read and exposed for future code to
> use.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> v14:
>   * This moves the basic RMI setup into the 'kernel' directory. This is
>     because RMI will be used for some features outside of KVM so should
>     be available even if KVM isn't compiled in.
> ---
>   arch/arm64/include/asm/rmi_cmds.h |  3 ++
>   arch/arm64/kernel/Makefile        |  2 +-
>   arch/arm64/kernel/cpufeature.c    |  1 +
>   arch/arm64/kernel/rmi.c           | 65 +++++++++++++++++++++++++++++++
>   4 files changed, 70 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/kernel/rmi.c
> 

[...]

> diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
> new file mode 100644
> index 000000000000..99c1ccc35c11
> --- /dev/null
> +++ b/arch/arm64/kernel/rmi.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-2025 ARM Ltd.
> + */
> +
> +#include <linux/memblock.h>
> +
> +#include <asm/rmi_cmds.h>
> +
> +unsigned long rmm_feat_reg0;
> +unsigned long rmm_feat_reg1;
> +
> +static int rmi_check_version(void)
> +{
> +	struct arm_smccc_res res;
> +	unsigned short version_major, version_minor;
> +	unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
> +						     RMI_ABI_MINOR_VERSION);
> +	unsigned long aa64pfr0 = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
> +
> +	/* If RME isn't supported, then RMI can't be */
> +	if (cpuid_feature_extract_unsigned_field(aa64pfr0, ID_AA64PFR0_EL1_RME_SHIFT) == 0)
> +		return -ENXIO;
> +
> +	arm_smccc_1_1_invoke(SMC_RMI_VERSION, host_version, &res);
> +
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
> +static int __init arm64_init_rmi(void)
> +{
> +	/* Continue without realm support if we can't agree on a version */
> +	if (rmi_check_version())
> +		return 0;

Is this still a valid point that we have to return zero on errors returned
from rmi_check_version() or other other function calls like rmi_features()?
arm64_init_rmi() is triggered by subsys_initcall() where the return value
needs to indicate success or failure. It's fine to return error code from
arm64_init_rmi() in the path.

> +
> +	if (WARN_ON(rmi_features(0, &rmm_feat_reg0)))
> +		return 0;
> +	if (WARN_ON(rmi_features(1, &rmm_feat_reg1)))
> +		return 0;
> +
> +	return 0;
> +}
> +subsys_initcall(arm64_init_rmi);

Thanks,
Gavin


