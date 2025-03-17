Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B67C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 11:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdEPpt0J2kuc6AX7ay0A8Zr8J2bTTl3EDypr342on8A=; b=MwTf2NFbEJ6wvcToIo3KCWwr35
	I5p2XlQ/lPWb/o8S1vxJpOCUKEoBwvnSHwuYVnZKz7xVlh2UUdj+cmWWKbXLmRU4wNPBItiBcM98Z
	f3PdidnhWdqfv4Wi//QfmbjipvyPGXm9sI1a2vPrhEiFEewxA6tqOAqw+ul/ZshcJ4GSEhD3zKnSF
	FoNS2pX9Berxh70dAkGWRP3KBjIc8a7KlrnsNxhdRHc9Ad3ro8T+SjslYn9D/BcAZAHvu6rC8McKW
	LMl45cBokV0tQycLUiVIP/jYhEOW4TBLpdFUm9W4Ne5tzXTrk+n9+uY9je+f4nW7l5cxm6eeWMnfo
	uQUb6jvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8iI-00000002PTi-08Ed;
	Mon, 17 Mar 2025 11:32:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8f9-00000002OqJ-2grf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 11:29:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3083613D5;
	Mon, 17 Mar 2025 04:29:49 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CEB43F694;
	Mon, 17 Mar 2025 04:29:33 -0700 (PDT)
Date: Mon, 17 Mar 2025 11:29:30 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
	catalin.marinas@arm.com, conor+dt@kernel.org,
	dan.carpenter@linaro.org, dave.hansen@linux.intel.com,
	decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
	joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com,
	kys@microsoft.com, lenb@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, maz@kernel.org, mingo@redhat.com,
	oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org,
	ssengar@linux.microsoft.com, sudeep.holla@arm.com,
	suzuki.poulose@arm.com, tglx@linutronix.de, wei.liu@kernel.org,
	will@kernel.org, yuzenghui@huawei.com, devicetree@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, x86@kernel.org, apais@microsoft.com,
	benhill@microsoft.com, bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next v6 01/11] arm64: kvm, smccc: Introduce and
 use API for detecting hypervisor presence
Message-ID: <Z9gHmkNOsd29viHj@J2N7QTR9R3.cambridge.arm.com>
References: <20250315001931.631210-1-romank@linux.microsoft.com>
 <20250315001931.631210-2-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315001931.631210-2-romank@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_042943_774952_1DBF6CDD 
X-CRM114-Status: GOOD (  28.11  )
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

On Fri, Mar 14, 2025 at 05:19:21PM -0700, Roman Kisel wrote:
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
> ---
>  arch/arm64/kvm/hypercalls.c        |  5 +--
>  drivers/firmware/smccc/kvm_guest.c | 10 ++----
>  drivers/firmware/smccc/smccc.c     | 19 +++++++++++
>  include/linux/arm-smccc.h          | 55 +++++++++++++++++++++++++++---
>  4 files changed, 73 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> index 27ce4cb44904..92b9bc1ea8e8 100644
> --- a/arch/arm64/kvm/hypercalls.c
> +++ b/arch/arm64/kvm/hypercalls.c
> @@ -353,10 +353,7 @@ int kvm_smccc_call_handler(struct kvm_vcpu *vcpu)
>  			val[0] = gpa;
>  		break;
>  	case ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID:
> -		val[0] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0;
> -		val[1] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1;
> -		val[2] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2;
> -		val[3] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3;
> +		UUID_TO_SMCCC_RES(ARM_SMCCC_VENDOR_HYP_UID_KVM, val);
>  		break;
>  	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
>  		val[0] = smccc_feat->vendor_hyp_bmap;
> diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/smccc/kvm_guest.c
> index f3319be20b36..b5084b309ea0 100644
> --- a/drivers/firmware/smccc/kvm_guest.c
> +++ b/drivers/firmware/smccc/kvm_guest.c
> @@ -14,17 +14,11 @@ static DECLARE_BITMAP(__kvm_arm_hyp_services, ARM_SMCCC_KVM_NUM_FUNCS) __ro_afte
>  
>  void __init kvm_init_hyp_services(void)
>  {
> +	uuid_t kvm_uuid = ARM_SMCCC_VENDOR_HYP_UID_KVM;
>  	struct arm_smccc_res res;
>  	u32 val[4];
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
>  		return;
>  
>  	memset(&res, 0, sizeof(res));
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index a74600d9f2d7..7399f27d58e5 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -67,6 +67,25 @@ s32 arm_smccc_get_soc_id_revision(void)
>  }
>  EXPORT_SYMBOL_GPL(arm_smccc_get_soc_id_revision);
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

This use of a statement expression is bizarre, and the function would be
clearer without it, e.g.

| bool arm_smccc_hyp_present(const uuid_t *hyp_uuid)
| {
| 	struct arm_smccc_res res = {};
| 	uuid_t uuid;
| 
| 	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
| 		return false;
| 
| 	arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
| 	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
| 		return false;
| 	
| 	uuid_t = SMCCC_RES_TO_UUID(res.a0, res.a1, res.a2, res.a3);
| 	return uuid_equal(&uuid, hyp_uuid);
| }

As noted below, I'd prefer if this were renamed to something like
arm_smccc_hypervisor_has_uuid(), to more clearly indicate what is being
checked.

[...]

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

I'd prefer if this were:

| /*
|  * Returns whether a specific hypervisor UUID is advertised for the
|  * Vendor Specific Hypervisor Service range.
|  */
| bool arm_smccc_hypervisor_has_uuid(const uuid_t *uuid);

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

I think this'd be clearer if we did something similar to what we did for
the SMCCC SOC_ID name:

  https://lore.kernel.org/linux-arm-kernel/20250219005932.3466-1-paul@os.amperecomputing.com/

... and pack/unpack the bytes explicitly, e.g.

| static inline uuid smccc_res_to_uuid(u32 r0, u32, r1, u32 r2, u32 r3)
| {
| 	uuid_t uuid = {
| 		.b = {
| 			[0]  = (r0 >> 0)  & 0xff,
| 			[1]  = (r0 >> 8)  & 0xff,
| 			[2]  = (r0 >> 16) & 0xff,
| 			[3]  = (r0 >> 24) & 0xff,
| 
| 			[4]  = (r1 >> 0)  & 0xff,
| 			[5]  = (r1 >> 8)  & 0xff,
| 			[6]  = (r1 >> 16) & 0xff,
| 			[7]  = (r1 >> 24) & 0xff,
| 
| 			[8]  = (r2 >> 0)  & 0xff,
| 			[9]  = (r2 >> 8)  & 0xff,
| 			[10] = (r2 >> 16) & 0xff,
| 			[11] = (r2 >> 24) & 0xff,
| 
| 			[12] = (r3 >> 0)  & 0xff,
| 			[13] = (r3 >> 8)  & 0xff,
| 			[14] = (r3 >> 16) & 0xff,
| 			[15] = (r3 >> 24) & 0xff,
| 		},
| 	};
| 
| 	return uuid;
| }

... which is a bit more verbose, but clearly aligns with what the SMCCC
spec says w.r.t. packing/unpacking, and should avoid warnings about
endianness conversions.

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

IMO it'd be clearer to initialise a uuid_t beforehand, and then allow
the helper to unpack the bytes, e.g.

static inline u32 smccc_uuid_to_reg(const uuid_t uuid, int reg)
{
	u32 val = 0;

	val |= (u32)(uuid.b[4 * reg + 0] << 0)
	val |= (u32)(uuid.b[4 * reg + 1] << 8)
	val |= (u32)(uuid.b[4 * reg + 2] << 16)
	val |= (u32)(uuid.b[4 * reg + 3] << 24)

	return val:
}

#define UUID_TO_SMCCC_RES(uuid, regs)		\
do {						\
	(regs)[0] = smccc_uuid_to_reg(uuid, 0); \
	(regs)[1] = smccc_uuid_to_reg(uuid, 1); \
	(regs)[2] = smccc_uuid_to_reg(uuid, 2); \
	(regs)[3] = smccc_uuid_to_reg(uuid, 3); \
} while (0)

... though arguably at that point you can get rid of the
UUID_TO_SMCCC_RES() macro and just expand that directly at the callsite.

Mark.

