Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51E9CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVBqAzXRtaGdVaqdIdbidkD/s0lTNKoOEws6COnY9ko=; b=xAKd4WXsSlwdDayAjgweVOXWGI
	Fwde6GJcSSQKTb29HhdjaCe41IAkgK+qPy2L5r7L4hqYR0KTFVZ14sBBeZStIwUXYaYZNIHaZyyQ3
	Y3TInYkvWHLzilF9to11ZFDjkeJWoACGMXL0Gap22HgR+t/C1H7JyzbrJgEsOeD2bOchsz0bMDFf5
	9IB1wR/VUW32n/6B1ovGn8mrKhHO7hiZyjIgFSbc/fHpAAA6M/FHit2Qo1ycTnghidr39a+1B1XGt
	VpKrmEyA3MqiD/rjDT/yQdTS9anviYnSpJVRxzFuRmAFfrETatlijTqPo/PwcM4zqhq7eG8bbGSao
	Z1TunLHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmiK-00000006PBF-1OB2;
	Wed, 03 Sep 2025 12:35:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlUX-00000006D1G-3ASW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 11:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756898248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kVBqAzXRtaGdVaqdIdbidkD/s0lTNKoOEws6COnY9ko=;
	b=Reuq4YYLzPOeGGEdIQXSafVZDxHF7QImldLx0xbsvlDTF/Ttetw7GzK+U5Q3jIDE4awgSm
	cTADKkZjuUPA7ia365PuFIujjshx63Q9gBrzrQ5pI8SEzLbL0B58DSapwOxuVKG4dQFJcm
	dZ4bBjjTgzSvSU/HeP4C0Xz0eN8+qwQ=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-Rv9wSyJcNpO7d6SVmEYxUw-1; Wed, 03 Sep 2025 07:15:55 -0400
X-MC-Unique: Rv9wSyJcNpO7d6SVmEYxUw-1
X-Mimecast-MFC-AGG-ID: Rv9wSyJcNpO7d6SVmEYxUw_1756898154
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e395107e2so6380010b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 04:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756898154; x=1757502954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVBqAzXRtaGdVaqdIdbidkD/s0lTNKoOEws6COnY9ko=;
        b=ZqF5i2E3EwmKFVsRwgBB1cSQcGvCFY0U+lhl16KdqSz7gtTi3w1fjhKf8Mp3fH9XcM
         IxlfW/PMbzjQ0yjBqbcVCI7QKGPWMp6V+y3Z7WQZi2EWHlodQLSltDTZ8B8FxhguZVmF
         Htrq6M8b1kNVJBqAIgmKL6q3SWfUJTvkFfBNhIMXmp6phNasVAqvTwkT7rqsTVac1Lmc
         2Vrp8GBbKaDU5t45D0nH4UU2UVLeOMXUTsh4mRoznYBJD4goaJetN2ZXMTayseXKe4HJ
         WmC8usSeMBknqu5GGtGQ7nptAGCqsrBrmuoy8k0g/340Q+MDy/lUT2qWTxO0HI8SkKZu
         7sAw==
X-Forwarded-Encrypted: i=1; AJvYcCVFLtt6tIWf7C2n+mIjFswmtaofR2XcFL/99hadWNC/01bumb2u6TufWWrTrQhdGCG/mLhRWQStCiF/jOR1unip@lists.infradead.org
X-Gm-Message-State: AOJu0YzKGauFihE64r8ipgmTOFXqVnlccbejSoeTEIl+bMa/zG88wCa3
	NEbJ2jz5+QC+8eY3qpD7+8i328L9PhyzXASyLG6HdCHoA+BqHwjij1StRJ7zLNxnzCxfnZ1iA2h
	GyRFoLWyZtHOREUBGlvPovMeKR075YLn5UbKjkJXwNs+mOCAb6xkPaFjmZyksWyDMfX6E4J1qZ4
	oX
X-Gm-Gg: ASbGncuV+zCEVxDb1x3Anlbx7GDSmiDYP3VXX6IEqohuFsETX9MgKXUuEV5HYtCKOkk
	8CP0HDda4nq0n0YQ00sTJSgbgFs28iaKkui+W9N91ZX+Gx85WqX5Xfz5q1A/N5Wk7fMDTASVXbG
	IXAsqXOOxGRWgpW1BDq1cWUcquHyanqQLiRzNNuZ0GkdvhKJPmYyHnwy3oJCRKkRDZlP5SRwgJg
	KaF4VRZM0zODNSm1wyU4mmozQhfQan97G1LziZZxSBMoSIohjYW5cm3Aca9UfwcaoKfNhziBpOb
	zJ3BAPdJfcaOPhcFBhxLA8ri+8Otq2Ev+rv3cH2l20MbsZHeoZCU3h8G1urrSPa/hnxsLgdACmz
	r3K36
X-Received: by 2002:a05:6a00:2d13:b0:772:2fad:ff64 with SMTP id d2e1a72fcca58-7723e257daamr16145011b3a.8.1756898154131;
        Wed, 03 Sep 2025 04:15:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEehFXhizd/XBGs6lPLajyy1rp0g+vzzGOhiFu//IuUVahDT7Y1/d6xBov7/G/ROyWBDy0Hlg==
X-Received: by 2002:a05:6a00:2d13:b0:772:2fad:ff64 with SMTP id d2e1a72fcca58-7723e257daamr16144978b3a.8.1756898153626;
        Wed, 03 Sep 2025 04:15:53 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a269e9csm16651516b3a.17.2025.09.03.04.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:15:52 -0700 (PDT)
Message-ID: <0481109b-769f-464b-aa72-ad6e07bdfa78@redhat.com>
Date: Wed, 3 Sep 2025 21:15:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/43] arm64: RME: Check for RME support at KVM init
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
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20250820145606.180644-1-steven.price@arm.com>
 <20250820145606.180644-6-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250820145606.180644-6-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D7d904n3YVFYftIV5rNfSv2aBub3ADVG-JOUsYIghQ8_1756898154
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_041729_861536_8AD8D434 
X-CRM114-Status: GOOD (  29.95  )
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

On 8/21/25 12:55 AM, Steven Price wrote:
> Query the RMI version number and check if it is a compatible version. A
> static key is also provided to signal that a supported RMM is available.
> 
> Functions are provided to query if a VM or VCPU is a realm (or rec)
> which currently will always return false.
> 
> Later patches make use of struct realm and the states as the ioctls
> interfaces are added to support realm and REC creation and destruction.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v8:
>   * No need to guard kvm_init_rme() behind 'in_hyp_mode'.
> Changes since v6:
>   * Improved message for an unsupported RMI ABI version.
> Changes since v5:
>   * Reword "unsupported" message from "host supports" to "we want" to
>     clarify that 'we' are the 'host'.
> Changes since v2:
>   * Drop return value from kvm_init_rme(), it was always 0.
>   * Rely on the RMM return value to identify whether the RSI ABI is
>     compatible.
> ---
>   arch/arm64/include/asm/kvm_emulate.h | 18 +++++++++
>   arch/arm64/include/asm/kvm_host.h    |  4 ++
>   arch/arm64/include/asm/kvm_rme.h     | 56 ++++++++++++++++++++++++++++
>   arch/arm64/include/asm/virt.h        |  1 +
>   arch/arm64/kvm/Makefile              |  2 +-
>   arch/arm64/kvm/arm.c                 |  5 +++
>   arch/arm64/kvm/rme.c                 | 56 ++++++++++++++++++++++++++++
>   7 files changed, 141 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/include/asm/kvm_rme.h
>   create mode 100644 arch/arm64/kvm/rme.c
> 

[...]

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 888f7c7abf54..76177c56f1ef 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -40,6 +40,7 @@
>   #include <asm/kvm_nested.h>
>   #include <asm/kvm_pkvm.h>
>   #include <asm/kvm_ptrauth.h>
> +#include <asm/kvm_rme.h>
>   #include <asm/sections.h>
>   

Nit: The header file <asm/kvm_rme.h> has been included to <asm/kvm_host.h> and
<linux/kvm_host.h>, which has been included to arm.c. So this explicit inclusion
can be dropped.

>   #include <kvm/arm_hypercalls.h>
> @@ -59,6 +60,8 @@ enum kvm_wfx_trap_policy {
>   static enum kvm_wfx_trap_policy kvm_wfi_trap_policy __read_mostly = KVM_WFX_NOTRAP_SINGLE_TASK;
>   static enum kvm_wfx_trap_policy kvm_wfe_trap_policy __read_mostly = KVM_WFX_NOTRAP_SINGLE_TASK;
>   
> +DEFINE_STATIC_KEY_FALSE(kvm_rme_is_available);
> +
>   DECLARE_KVM_HYP_PER_CPU(unsigned long, kvm_hyp_vector);
>   
>   DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
> @@ -2836,6 +2839,8 @@ static __init int kvm_arm_init(void)
>   
>   	in_hyp_mode = is_kernel_in_hyp_mode();
>   
> +	kvm_init_rme();
> +
>   	if (cpus_have_final_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) ||
>   	    cpus_have_final_cap(ARM64_WORKAROUND_1508412))
>   		kvm_info("Guests without required CPU erratum workarounds can deadlock system!\n" \
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> new file mode 100644
> index 000000000000..67cf2d94cb2d
> --- /dev/null
> +++ b/arch/arm64/kvm/rme.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 ARM Ltd.
> + */
> +
> +#include <linux/kvm_host.h>
> +
> +#include <asm/rmi_cmds.h>
> +#include <asm/virt.h>
> +
> +static int rmi_check_version(void)
> +{
> +	struct arm_smccc_res res;
> +	unsigned short version_major, version_minor;
> +	unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
> +						     RMI_ABI_MINOR_VERSION);
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
> +		kvm_err("Unsupported RMI ABI (v%d.%d - v%d.%d) we want v%d.%d\n",
> +			version_major, version_minor,
> +			high_version_major, high_version_minor,
> +			RMI_ABI_MAJOR_VERSION,
> +			RMI_ABI_MINOR_VERSION);
> +		return -ENXIO;
> +	}
> +
> +	kvm_info("RMI ABI version %d.%d\n", version_major, version_minor);
> +
> +	return 0;
> +}
> +
> +void kvm_init_rme(void)
> +{
> +	if (PAGE_SIZE != SZ_4K)
> +		/* Only 4k page size on the host is supported */
> +		return;

Nit: The comment can be moved before the check, something like below. Otherwise,
{} is needed here.

	/* Only 4kB page size is supported */
	if (PAGE_SIZE != SZ_4K)
		return;

> +
> +	if (rmi_check_version())
> +		/* Continue without realm support */
> +		return;

Nit: same as above.

> +
> +	/* Future patch will enable static branch kvm_rme_is_available */
> +}

Thanks,
Gavin


