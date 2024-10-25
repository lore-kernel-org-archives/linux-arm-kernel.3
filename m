Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35FBD11701
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 06:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bDF2PtA8nEwp1BLJ5T0XsLmvVmBVPXORykZ4wJpoak=; b=Dz8ZujgXVr89UJgK5dApthYb7J
	UiEkuY2JiAt4bHMwwO27V/s/Pz0SieD/Z4U+LmEzjgQF0OUMUovOUBGlMATdpAJRhy7mZIitDe6AI
	lyVbVAtaSURUdI2BGoDB2Z0Uz35XY9IWHCrj5uHwTmvWe/S/uik9HyAqi/Y/MaxDP4xVqDT6YjFM5
	ovvjfuYQgfMMxKG4kn0kdeKIJ/U06KOZYck7pP3T0gOwKz4iLDJsNNo5Oc5HTdL1FF5hjWK7Y2QGN
	C+C1DAbl9zCu9du76nGA3GJXJ32jesrz/vSqU4ge0CQ+RADVVMtC9+rrFZ6/0/mXYzW1cuKbQS3O+
	NjpIBbyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DyZ-00000002heN-33Tn;
	Fri, 25 Oct 2024 06:39:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Dwz-00000002hRY-0AQH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 06:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729838250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+bDF2PtA8nEwp1BLJ5T0XsLmvVmBVPXORykZ4wJpoak=;
	b=GfDe+k8ArYf1JsU9QkUEk5DdiHq62mHKeVC1WVJpS9RAOs23PTAfkmI9kLVG0/5IwS+HiT
	nHlfsRXu0WDi7VswxifVz56aqfAH1U7eNbzKx4KL42FINkeoxGL6WbXrprQz37MhXyxAEH
	zx0lYpjraNkgS3lB9D7YjY9joS6CTZ0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-BOziGeE5PC6n21n4uzwLAA-1; Fri, 25 Oct 2024 02:37:27 -0400
X-MC-Unique: BOziGeE5PC6n21n4uzwLAA-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2e583c7601fso1779190a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 23:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729838246; x=1730443046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+bDF2PtA8nEwp1BLJ5T0XsLmvVmBVPXORykZ4wJpoak=;
        b=HpTMlyGcMWbZUC5PRUhlPtm1PegJa98JlZrEcaADDRlHcXsEEgGmbkDldnRsgjbmaO
         UBbzsmrfkULJYKHunBlJm/40L5pEGEWZwxbFpR6aqXDQJSzT9CZAzZll3jAlYbR6awgU
         KI71YW0YKLB9+wlY6J7NmkCRjeupK2X9jqD1THmMXNnVjvyBhDNvgiXGJ3LPHeAg6xsL
         Ag04tlHhS/+zCu02p0AkFDyfKiQLaBieC+ooKjFjm8hWquDXhsdPsk//3ZohMKqmczRe
         sIqenLlJmasSYoQiXTOE1RUOUVEQrV31zlNXajQsJ+/usoX0ghnmFCuYjvZGr0RjFMOS
         iCcw==
X-Forwarded-Encrypted: i=1; AJvYcCWlYK4ftacgdIG/QXa8xk2xHOc2fwxhYVbq8XAFwS8XnYaslphwbydUu8Pa0nphcyagkaqRe/9/mLl5vaUasA0L@lists.infradead.org
X-Gm-Message-State: AOJu0YwJP6A+MSamt3EJn0p6LPQR+/L97PY6keFvXz0wKxzVJY5Cleqd
	QHepu880bJbyDmtF9DvzB/xdygMLIK943PzTPJYtFAQXkBjuyk/WfQSoPQkHY2dMW50uYFgHKFw
	4mdsdIbgPEwXCa3NcAnKJteLraChwfSiXSlEXP8tcxgCS8SR8l1E+z/faw3t6jV//UWrMUqvo
X-Received: by 2002:a17:90b:274c:b0:2e2:b922:48a with SMTP id 98e67ed59e1d1-2e76b5fd63dmr9190803a91.18.1729838245861;
        Thu, 24 Oct 2024 23:37:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+u2nP5jEKVj215KpGw6rOcs0Eagy/ksL64B+QesnMTfSL8FQ2Ri3aw4o0HE9/qEPVorhCqw==
X-Received: by 2002:a17:90b:274c:b0:2e2:b922:48a with SMTP id 98e67ed59e1d1-2e76b5fd63dmr9190789a91.18.1729838245450;
        Thu, 24 Oct 2024 23:37:25 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e7867fd63csm2102774a91.1.2024.10.24.23.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 23:37:24 -0700 (PDT)
Message-ID: <c5f65e60-efc1-49c5-b421-55f2be5e9449@redhat.com>
Date: Fri, 25 Oct 2024 16:37:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/43] arm64: RME: Add SMC definitions for calling the
 RMM
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241004152804.72508-1-steven.price@arm.com>
 <20241004152804.72508-6-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241004152804.72508-6-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_233733_251553_9D95C4EC 
X-CRM114-Status: GOOD (  27.31  )
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

On 10/5/24 1:27 AM, Steven Price wrote:
> The RMM (Realm Management Monitor) provides functionality that can be
> accessed by SMC calls from the host.
> 
> The SMC definitions are based on DEN0137[1] version 1.0-rel0
> 
> [1] https://developer.arm.com/documentation/den0137/1-0rel0/
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v4:
>   * Update to point to final released RMM spec.
>   * Minor rearrangements.
> Changes since v3:
>   * Update to match RMM spec v1.0-rel0-rc1.
> Changes since v2:
>   * Fix specification link.
>   * Rename rec_entry->rec_enter to match spec.
>   * Fix size of pmu_ovf_status to match spec.
> ---
>   arch/arm64/include/asm/rmi_smc.h | 255 +++++++++++++++++++++++++++++++
>   1 file changed, 255 insertions(+)
>   create mode 100644 arch/arm64/include/asm/rmi_smc.h
> 
> diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
> new file mode 100644
> index 000000000000..0fde2e06d275
> --- /dev/null
> +++ b/arch/arm64/include/asm/rmi_smc.h
> @@ -0,0 +1,255 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023-2024 ARM Ltd.
> + *
> + * The values and structures in this file are from the Realm Management Monitor
> + * specification (DEN0137) version 1.0-rel0:
> + * https://developer.arm.com/documentation/den0137/1-0rel0/
> + */
> +
> +#ifndef __ASM_RME_SMC_H
> +#define __ASM_RME_SMC_H
> +
> +#include <linux/arm-smccc.h>
> +
> +#define SMC_RxI_CALL(func)				\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,		\
> +			   ARM_SMCCC_SMC_64,		\
> +			   ARM_SMCCC_OWNER_STANDARD,	\
> +			   (func))
> +

I guess the 'x' of 'RxI' here can be 'M' or 'S'. We already had similar macro
(SMC_RSI_FID) in rsi_smc.h, so 'RMI' sounds more appropriate to me since this
macro is only used to define those RMI function calls. SMC_RMI_FID is the name
consistent to SMC_RSI_FID in rsi_smc.h.

> +#define SMC_RMI_DATA_CREATE		SMC_RxI_CALL(0x0153)
> +#define SMC_RMI_DATA_CREATE_UNKNOWN	SMC_RxI_CALL(0x0154)
> +#define SMC_RMI_DATA_DESTROY		SMC_RxI_CALL(0x0155)
> +#define SMC_RMI_FEATURES		SMC_RxI_CALL(0x0165)
> +#define SMC_RMI_GRANULE_DELEGATE	SMC_RxI_CALL(0x0151)
> +#define SMC_RMI_GRANULE_UNDELEGATE	SMC_RxI_CALL(0x0152)
> +#define SMC_RMI_PSCI_COMPLETE		SMC_RxI_CALL(0x0164)
> +#define SMC_RMI_REALM_ACTIVATE		SMC_RxI_CALL(0x0157)
> +#define SMC_RMI_REALM_CREATE		SMC_RxI_CALL(0x0158)
> +#define SMC_RMI_REALM_DESTROY		SMC_RxI_CALL(0x0159)
> +#define SMC_RMI_REC_AUX_COUNT		SMC_RxI_CALL(0x0167)
> +#define SMC_RMI_REC_CREATE		SMC_RxI_CALL(0x015a)
> +#define SMC_RMI_REC_DESTROY		SMC_RxI_CALL(0x015b)
> +#define SMC_RMI_REC_ENTER		SMC_RxI_CALL(0x015c)
> +#define SMC_RMI_RTT_CREATE		SMC_RxI_CALL(0x015d)
> +#define SMC_RMI_RTT_DESTROY		SMC_RxI_CALL(0x015e)
> +#define SMC_RMI_RTT_FOLD		SMC_RxI_CALL(0x0166)
> +#define SMC_RMI_RTT_INIT_RIPAS		SMC_RxI_CALL(0x0168)
> +#define SMC_RMI_RTT_MAP_UNPROTECTED	SMC_RxI_CALL(0x015f)
> +#define SMC_RMI_RTT_READ_ENTRY		SMC_RxI_CALL(0x0161)
> +#define SMC_RMI_RTT_SET_RIPAS		SMC_RxI_CALL(0x0169)
> +#define SMC_RMI_RTT_UNMAP_UNPROTECTED	SMC_RxI_CALL(0x0162)
> +#define SMC_RMI_VERSION			SMC_RxI_CALL(0x0150)
> +

Similar to what we had in rsi_smc.h, it may be good idea to have those definitions
in the ascending order of the function ID (number). It will help readers to search
based on the function ID (number) if you agree.

> +#define RMI_ABI_MAJOR_VERSION	1
> +#define RMI_ABI_MINOR_VERSION	0
> +
> +#define RMI_ABI_VERSION_GET_MAJOR(version) ((version) >> 16)
> +#define RMI_ABI_VERSION_GET_MINOR(version) ((version) & 0xFFFF)
> +#define RMI_ABI_VERSION(major, minor)      (((major) << 16) | (minor))
> +
> +#define RMI_UNASSIGNED			0
> +#define RMI_ASSIGNED			1
> +#define RMI_TABLE			2
> +

Those RTT entry states are associated with struct rtt_entry::state only. So the best
place to have those definiation would be rmi_cmds.h where 'struct rtt_entry' is
declared. Besides, there is a enumeration RmiRttEntryState for them as stated in
the specifiction (B4.4.24).

> +#define RMI_RETURN_STATUS(ret)		((ret) & 0xFF)
> +#define RMI_RETURN_INDEX(ret)		(((ret) >> 8) & 0xFF)
> +
> +#define RMI_SUCCESS		0
> +#define RMI_ERROR_INPUT		1
> +#define RMI_ERROR_REALM		2
> +#define RMI_ERROR_REC		3
> +#define RMI_ERROR_RTT		4
> +
> +enum rmi_ripas {
> +	RMI_EMPTY = 0,
> +	RMI_RAM = 1,
> +	RMI_DESTROYED = 2,
> +};
> +
> +#define RMI_NO_MEASURE_CONTENT	0
> +#define RMI_MEASURE_CONTENT	1
> +
> +#define RMI_FEATURE_REGISTER_0_S2SZ		GENMASK(7, 0)
> +#define RMI_FEATURE_REGISTER_0_LPA2		BIT(8)
> +#define RMI_FEATURE_REGISTER_0_SVE_EN		BIT(9)
> +#define RMI_FEATURE_REGISTER_0_SVE_VL		GENMASK(13, 10)
> +#define RMI_FEATURE_REGISTER_0_NUM_BPS		GENMASK(19, 14)
> +#define RMI_FEATURE_REGISTER_0_NUM_WPS		GENMASK(25, 20)
> +#define RMI_FEATURE_REGISTER_0_PMU_EN		BIT(26)
> +#define RMI_FEATURE_REGISTER_0_PMU_NUM_CTRS	GENMASK(31, 27)
> +#define RMI_FEATURE_REGISTER_0_HASH_SHA_256	BIT(32)
> +#define RMI_FEATURE_REGISTER_0_HASH_SHA_512	BIT(33)
> +#define RMI_FEATURE_REGISTER_0_GICV3_NUM_LRS	GENMASK(37, 34)
> +#define RMI_FEATURE_REGISTER_0_MAX_RECS_ORDER	GENMASK(41, 38)
> +

The 'Reserved' field can be defined as well so that the definitions are complete
if you agree.

    #define RMI_FEATGURE_REGISTER_0_Reserved	GENMASK(63, 42)

> +#define RMI_REALM_PARAM_FLAG_LPA2		BIT(0)
> +#define RMI_REALM_PARAM_FLAG_SVE		BIT(1)
> +#define RMI_REALM_PARAM_FLAG_PMU		BIT(2)
> +
> +/*
> + * Note many of these fields are smaller than u64 but all fields have u64
> + * alignment, so use u64 to ensure correct alignment.
> + */
> +struct realm_params {
> +	union { /* 0x0 */
> +		struct {
> +			u64 flags;
> +			u64 s2sz;
> +			u64 sve_vl;
> +			u64 num_bps;
> +			u64 num_wps;
> +			u64 pmu_num_ctrs;
> +			u64 hash_algo;
> +		};
> +		u8 padding1[0x400];
> +	};
> +	union { /* 0x400 */
> +		u8 rpv[64];
> +		u8 padding2[0x400];
> +	};
> +	union { /* 0x800 */
> +		struct {
> +			u64 vmid;
> +			u64 rtt_base;
> +			s64 rtt_level_start;
> +			u64 rtt_num_start;
> +		};
> +		u8 padding3[0x800];
> +	};
> +};
> +
> +/*
> + * The number of GPRs (starting from X0) that are
> + * configured by the host when a REC is created.
> + */
> +#define REC_CREATE_NR_GPRS		8
> +
> +#define REC_PARAMS_FLAG_RUNNABLE	BIT_ULL(0)
> +
> +#define REC_PARAMS_AUX_GRANULES		16
> +
> +struct rec_params {
> +	union { /* 0x0 */
> +		u64 flags;
> +		u8 padding1[0x100];
> +	};
> +	union { /* 0x100 */
> +		u64 mpidr;
> +		u8 padding2[0x100];
> +	};
> +	union { /* 0x200 */
> +		u64 pc;
> +		u8 padding3[0x100];
> +	};
> +	union { /* 0x300 */
> +		u64 gprs[REC_CREATE_NR_GPRS];
> +		u8 padding4[0x500];
> +	};
> +	union { /* 0x800 */
> +		struct {
> +			u64 num_rec_aux;
> +			u64 aux[REC_PARAMS_AUX_GRANULES];
> +		};
> +		u8 padding5[0x800];
> +	};
> +};
> +
> +#define REC_ENTER_EMULATED_MMIO		BIT(0)
> +#define REC_ENTER_INJECT_SEA		BIT(1)
> +#define REC_ENTER_TRAP_WFI		BIT(2)
> +#define REC_ENTER_TRAP_WFE		BIT(3)
> +#define REC_ENTER_RIPAS_RESPONSE	BIT(4)
> +
> +#define REC_RUN_GPRS			31
> +#define REC_GIC_NUM_LRS			16
> +
> +struct rec_enter {
> +	union { /* 0x000 */
> +		u64 flags;
> +		u8 padding0[0x200];
> +	};
> +	union { /* 0x200 */
> +		u64 gprs[REC_RUN_GPRS];
> +		u8 padding2[0x100];
> +	};
> +	union { /* 0x300 */
> +		struct {
> +			u64 gicv3_hcr;
> +			u64 gicv3_lrs[REC_GIC_NUM_LRS];
> +		};
> +		u8 padding3[0x100];
> +	};
> +	u8 padding4[0x400];
> +};
> +
> +#define RMI_EXIT_SYNC			0x00
> +#define RMI_EXIT_IRQ			0x01
> +#define RMI_EXIT_FIQ			0x02
> +#define RMI_EXIT_PSCI			0x03
> +#define RMI_EXIT_RIPAS_CHANGE		0x04
> +#define RMI_EXIT_HOST_CALL		0x05
> +#define RMI_EXIT_SERROR			0x06
> +
> +struct rec_exit {
> +	union { /* 0x000 */
> +		u8 exit_reason;
> +		u8 padding0[0x100];
> +	};
> +	union { /* 0x100 */
> +		struct {
> +			u64 esr;
> +			u64 far;
> +			u64 hpfar;
> +		};
> +		u8 padding1[0x100];
> +	};
> +	union { /* 0x200 */
> +		u64 gprs[REC_RUN_GPRS];
> +		u8 padding2[0x100];
> +	};
> +	union { /* 0x300 */
> +		struct {
> +			u64 gicv3_hcr;
> +			u64 gicv3_lrs[REC_GIC_NUM_LRS];
> +			u64 gicv3_misr;
> +			u64 gicv3_vmcr;
> +		};
> +		u8 padding3[0x100];
> +	};
> +	union { /* 0x400 */
> +		struct {
> +			u64 cntp_ctl;
> +			u64 cntp_cval;
> +			u64 cntv_ctl;
> +			u64 cntv_cval;
> +		};
> +		u8 padding4[0x100];
> +	};
> +	union { /* 0x500 */
> +		struct {
> +			u64 ripas_base;
> +			u64 ripas_top;
> +			u64 ripas_value;
> +		};
> +		u8 padding5[0x100];
> +	};
> +	union { /* 0x600 */
> +		u16 imm;
> +		u8 padding6[0x100];
> +	};
> +	union { /* 0x700 */
> +		struct {
> +			u8 pmu_ovf_status;
> +		};
> +		u8 padding7[0x100];
> +	};
> +};
> +

The names for the 'padding' field starts from 'padding1' instead of 'padding0'
as we did for other structures.

> +struct rec_run {
> +	struct rec_enter enter;
> +	struct rec_exit exit;
> +};
> +
> +#endif

#endif /* __ASM_RME_SMC_H */

Thanks,
Gavin


