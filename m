Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC3BC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 00:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNEN1PUmudLlgwlIXoK+DSpK44+ltl2xOPzZ+xDbo5U=; b=ZhCpj20N0d9XvmqKZsdpSV62L1
	Xd47/gcuvjq0t7QxOCM0hvu5na2HvvV2shdeP2wGJ3o9JYtxV9GZjKqcBPMIU1PjMMVPgFOyxMesO
	Mf/WudPzZGdAgINc9DJU3c5N57NgGVMD7apY+W5Ur9K79kef05OdYiQasZmvKPGQTZ7ks76REBO+6
	pKfkt1ocbHJyYIF6IMutn1IdFET9rNP8hL5vSPbKxvwroRVJI2vePc9AARjDGFZY5Dna1JqZps9MK
	wfIWpfri1qEn1M3m8vgf1bXCfAMIffSK/ukREZf9jEtwaZxw5uhK3TE0HzzT+PR7mVzZSM5HcyQuu
	mGRxIqbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFay-0000000FcGJ-1zuV;
	Sat, 15 Mar 2025 00:41:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFNl-0000000Fb2j-10yq
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 15 Mar 2025 00:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VNEN1PUmudLlgwlIXoK+DSpK44+ltl2xOPzZ+xDbo5U=; b=ddsD7+B3HTelk13CMhJo2J0caO
	QjXEx+IgsvtdL9WAuRw7G+PzjnNLKid1vibsSnanW8z+J2LLY/AjFuPvsZyzPpcZ6n4PQxFh5x2Xd
	kZds/8VX7bxj4TRsGLBUIUTQVdhsYRuNJ/fqrfSAp6HKeBjwdcwkce+rvjQTCRbnSLXdxGJNFQPiF
	xbt6AA9yXVhL9ixjejkgdMvo14bIzWNIUc6YPYOa27+8jhanESMb6fL3UX4N6lMpUxUSprwtsBIpP
	x33gXFF03zKjvTfw5JPCrfuCYGNsJbMoI7hYut3mgwRbLYhJ6eE4MhZZ718q2Fott/Y7DecHLwwop
	1i9unqmA==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFNh-000000031Rm-2odR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 00:28:03 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id E241C2033459;
	Fri, 14 Mar 2025 17:27:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E241C2033459
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741998480;
	bh=VNEN1PUmudLlgwlIXoK+DSpK44+ltl2xOPzZ+xDbo5U=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=l0H9xAW0nIQ9TnJPChXqQVZcmuTNMzDlpB/M2rKyu/JVGhk2zCvkd4fjPGmzS3CAf
	 Uiu5dDiS4rJNiMczVVGeWqFnLbZubL+omoTiQRre9JKVz2WKagzzhCM3EhFhvlcoUQ
	 5kfzeCf4qYdbK/bZao2St06jIy6Oqqxk98+QAxK0=
Message-ID: <96bc4caf-b79a-4111-bafa-a7662260f4be@linux.microsoft.com>
Date: Fri, 14 Mar 2025 17:27:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v6 01/11] arm64: kvm, smccc: Introduce and use
 API for detecting hypervisor presence
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dan.carpenter@linaro.org,
 dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com,
 hpa@zytor.com, joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com,
 kys@microsoft.com, lenb@kernel.org, lpieralisi@kernel.org,
 manivannan.sadhasivam@linaro.org, mark.rutland@arm.com, maz@kernel.org,
 mingo@redhat.com, oliver.upton@linux.dev, rafael@kernel.org,
 robh@kernel.org, ssengar@linux.microsoft.com, sudeep.holla@arm.com,
 suzuki.poulose@arm.com, tglx@linutronix.de, wei.liu@kernel.org,
 will@kernel.org, yuzenghui@huawei.com, devicetree@vger.kernel.org,
 kvmarm@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, x86@kernel.org
Cc: apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
References: <20250315001931.631210-1-romank@linux.microsoft.com>
 <20250315001931.631210-2-romank@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <20250315001931.631210-2-romank@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_002802_286489_A1709B41 
X-CRM114-Status: GOOD (  25.06  )
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



On 3/14/2025 5:19 PM, Roman Kisel wrote:
> The KVM/arm64 uses SMCCC to detect hypervisor presence. That code is
> private, and it follows the SMCCC specification. Other existing and
> emerging hypervisor guest implementations can and should use that
> standard approach as well.
> 
> Factor out a common infrastructure that the guests can use, update KVM
> to employ the new API. The central notion of the SMCCC method is the
> UUID of the hypervisor, and the API follows that.
> 
> No functional changes. Validated with a KVM/arm64 guest.
> 
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

While the change is Acked, here is the caveat maybe.

This patch produces warnings wtih sparse and CHECK_ENDING.
That said, the kernel build produces a whole lot more other warnings
from building with sparse by itself and/or with CHECK_ENDING.

I am not sure how to proceed with that, thinking I should
not add warnings yet at the same time there are many others.
Not certain if folks take these signals as fyi or blockers.

Decided to send V6 to trim the V5 discussion threads by implementing
suggestions and fixes.

> ---
>   arch/arm64/kvm/hypercalls.c        |  5 +--
>   drivers/firmware/smccc/kvm_guest.c | 10 ++----
>   drivers/firmware/smccc/smccc.c     | 19 +++++++++++
>   include/linux/arm-smccc.h          | 55 +++++++++++++++++++++++++++---
>   4 files changed, 73 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> index 27ce4cb44904..92b9bc1ea8e8 100644
> --- a/arch/arm64/kvm/hypercalls.c
> +++ b/arch/arm64/kvm/hypercalls.c
> @@ -353,10 +353,7 @@ int kvm_smccc_call_handler(struct kvm_vcpu *vcpu)
>   			val[0] = gpa;
>   		break;
>   	case ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID:
> -		val[0] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0;
> -		val[1] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1;
> -		val[2] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2;
> -		val[3] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3;
> +		UUID_TO_SMCCC_RES(ARM_SMCCC_VENDOR_HYP_UID_KVM, val);
>   		break;
>   	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
>   		val[0] = smccc_feat->vendor_hyp_bmap;
> diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/smccc/kvm_guest.c
> index f3319be20b36..b5084b309ea0 100644
> --- a/drivers/firmware/smccc/kvm_guest.c
> +++ b/drivers/firmware/smccc/kvm_guest.c
> @@ -14,17 +14,11 @@ static DECLARE_BITMAP(__kvm_arm_hyp_services, ARM_SMCCC_KVM_NUM_FUNCS) __ro_afte
>   
>   void __init kvm_init_hyp_services(void)
>   {
> +	uuid_t kvm_uuid = ARM_SMCCC_VENDOR_HYP_UID_KVM;
>   	struct arm_smccc_res res;
>   	u32 val[4];
>   
> -	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
> -		return;
> -
> -	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
> -	if (res.a0 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0 ||
> -	    res.a1 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1 ||
> -	    res.a2 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2 ||
> -	    res.a3 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3)
> +	if (!arm_smccc_hyp_present(&kvm_uuid))
>   		return;
>   
>   	memset(&res, 0, sizeof(res));
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index a74600d9f2d7..7399f27d58e5 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -67,6 +67,25 @@ s32 arm_smccc_get_soc_id_revision(void)
>   }
>   EXPORT_SYMBOL_GPL(arm_smccc_get_soc_id_revision);
>   
> +bool arm_smccc_hyp_present(const uuid_t *hyp_uuid)
> +{
> +	struct arm_smccc_res res = {};
> +
> +	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
> +		return false;
> +	arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
> +	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
> +		return false;
> +
> +	return ({
> +		const uuid_t uuid = SMCCC_RES_TO_UUID(res.a0, res.a1, res.a2, res.a3);
> +		const bool present = uuid_equal(&uuid, hyp_uuid);
> +
> +		present;
> +	});
> +}
> +EXPORT_SYMBOL_GPL(arm_smccc_hyp_present);
> +
>   static int __init smccc_devices_init(void)
>   {
>   	struct platform_device *pdev;
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 67f6fdf2e7cd..726f18221f1c 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -7,6 +7,11 @@
>   
>   #include <linux/args.h>
>   #include <linux/init.h>
> +
> +#ifndef __ASSEMBLER__
> +#include <linux/uuid.h>
> +#endif
> +
>   #include <uapi/linux/const.h>
>   
>   /*
> @@ -107,10 +112,10 @@
>   			   ARM_SMCCC_FUNC_QUERY_CALL_UID)
>   
>   /* KVM UID value: 28b46fb6-2ec5-11e9-a9ca-4b564d003a74 */
> -#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0	0xb66fb428U
> -#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1	0xe911c52eU
> -#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2	0x564bcaa9U
> -#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3	0x743a004dU
> +#define ARM_SMCCC_VENDOR_HYP_UID_KVM UUID_INIT(\
> +	0xb66fb428, 0xc52e, 0xe911, \
> +	0xa9, 0xca, 0x4b, 0x56, \
> +	0x4d, 0x00, 0x3a, 0x74)
>   
>   /* KVM "vendor specific" services */
>   #define ARM_SMCCC_KVM_FUNC_FEATURES		0
> @@ -333,6 +338,48 @@ s32 arm_smccc_get_soc_id_version(void);
>    */
>   s32 arm_smccc_get_soc_id_revision(void);
>   
> +#ifndef __ASSEMBLER__
> +
> +/**
> + * arm_smccc_hyp_present(const uuid_t *hyp_uuid)
> + *
> + * Returns `true` if the hypervisor advertises its presence via SMCCC.
> + *
> + * When the function returns `false`, the caller shall not assume that
> + * there is no hypervisor running. Instead, the caller must fall back to
> + * other approaches if any are available.
> + */
> +bool arm_smccc_hyp_present(const uuid_t *hyp_uuid);
> +
> +#define SMCCC_RES_TO_UUID(r0, r1, r2, r3) \
> +	UUID_INIT( \
> +		cpu_to_le32(lower_32_bits(r0)), \
> +		cpu_to_le32(lower_32_bits(r1)) & 0xffff, \
> +		cpu_to_le32(lower_32_bits(r1)) >> 16, \
> +		cpu_to_le32(lower_32_bits(r2)) & 0xff, \
> +		(cpu_to_le32(lower_32_bits(r2)) >> 8) & 0xff, \
> +		(cpu_to_le32(lower_32_bits(r2)) >> 16) & 0xff, \
> +		(cpu_to_le32(lower_32_bits(r2)) >> 24) & 0xff, \
> +		cpu_to_le32(lower_32_bits(r3)) & 0xff, \
> +		(cpu_to_le32(lower_32_bits(r3)) >> 8) & 0xff, \
> +		(cpu_to_le32(lower_32_bits(r3)) >> 16) & 0xff, \
> +		(cpu_to_le32(lower_32_bits(r3)) >> 24) & 0xff \
> +	)
> +
> +#define UUID_TO_SMCCC_RES(uuid_init, regs) do { \
> +		const uuid_t uuid = uuid_init; \
> +		(regs)[0] = le32_to_cpu((u32)uuid.b[0] | (uuid.b[1] << 8) | \
> +						((uuid.b[2]) << 16) | ((uuid.b[3]) << 24)); \
> +		(regs)[1] = le32_to_cpu((u32)uuid.b[4] | (uuid.b[5] << 8) | \
> +						((uuid.b[6]) << 16) | ((uuid.b[7]) << 24)); \
> +		(regs)[2] = le32_to_cpu((u32)uuid.b[8] | (uuid.b[9] << 8) | \
> +						((uuid.b[10]) << 16) | ((uuid.b[11]) << 24)); \
> +		(regs)[3] = le32_to_cpu((u32)uuid.b[12] | (uuid.b[13] << 8) | \
> +						((uuid.b[14]) << 16) | ((uuid.b[15]) << 24)); \
> +	} while (0)
> +
> +#endif /* !__ASSEMBLER__ */
> +
>   /**
>    * struct arm_smccc_res - Result from SMC/HVC call
>    * @a0-a3 result values from registers 0 to 3

-- 
Thank you,
Roman


