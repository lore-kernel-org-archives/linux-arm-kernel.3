Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29C0C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpPQqa5yJZe5tyc85xBKgb5m+lF3hQEoO01TgrBxBAQ=; b=lyHHbAVz4mc44ekT+j/ag9u8PP
	Q2/6pAvKVqHkZURL7/AWExyMtKiYCxgQ16+Q83dMhY5dQmELZXdaQS5s5QN0Xa4Xo6VpP5702lWOo
	3h3gh+poTYc6eImbmPRc4A9UP8FD40AIHtKoFWrsK4xhqIlIQPsF4PnyWW9VL8qG4oWPDAfYX1N+3
	8FTYwwKclka0GF1F0E9nWUqXm7w01ZFN4JWj+5Lb/NcVwWCFKhC4pbvtjm+Q6OAg0OIKqGz0nnJn+
	r2/UHCMK+ZiNDCVNWkudoAcZtWYBuoCNlpOhUaRfPeDpuCZ/jHrAVvCJYsb8H0mXSJc9PAG3Qr6Fc
	Ecy+Lg0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x297h-0000000HaV9-2b67;
	Thu, 03 Sep 2026 15:13:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x297e-0000000HaTi-3Vc9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 15:13:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D02281596;
	Thu,  3 Sep 2026 08:12:55 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30C73F7D8;
	Thu,  3 Sep 2026 08:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788448379; bh=pFn+8lzB9TchkFoaG/Zxl2sUGOgulez6aeHdDcljBiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WRPdTR6Tfsl6kjrQK7+PKOVQPM/bANn7UhLKM+YEw7lrw7rQqG4CNPqBeZroiWbqg
	 LnaN92KhavA9OsIDnVF+QOW3dMaATHKJs2GLJO9ksLUrBHJ21ME9RNVr6wbUVOf6Zm
	 27OyLdDeoAEdHIEgFVpvD7is2stHzygp4Vf0U4ko=
Date: Thu, 3 Sep 2026 16:12:55 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 08/17] KVM: arm64: Implement HVC handling for protected
 guests at EL2
Message-ID: <apmOd-KTA3dSp30S@e143914.arm.com>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
 <20260831163421.272420-9-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831163421.272420-9-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_081302_966945_77EA3B76 
X-CRM114-Status: GOOD (  26.07  )
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

On Mon, Aug 31, 2026 at 05:34:12PM +0100, Fuad Tabba wrote:
> Extend kvm_handle_pvm_hvc64() to handle SMCCC_VERSION,
> SMCCC_ARCH_FEATURES and the vendor hypervisor call UID at EL2, so
> these queries do not reach the host. ARCH_FEATURES is mandatory from
> SMCCC 1.1, the version EL2 reports: it returns SUCCESS for itself and
> for SMCCC_VERSION, and NOT_SUPPORTED for anything else.
> 
> Add handle_pvm_entry_hvc64() and handle_pvm_exit_hvc64(), which
> forward a protected guest's HVCs to the host and return the reply; a
> later patch wires them into the per-EC dispatch tables.

These two functions are unused in this commit, and are modified in the
next commit, while still being unused. Then handle_pvm_entry_hvc64()
becomes a wrapper for handle_pvm_entry_psci() (which was the whole body
of handle_pvm_entry_hvc64). It's quite hard to follow. If these
functions are really unused and then modified, maybe it's just better to
remove them from this commit?

Thanks,
Joey

> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 28 ++++++++++++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c     | 29 +++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index d4b0f69ff130c..62864db1e099a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -4,6 +4,8 @@
>   * Author: Andrew Scull <ascull@google.com>
>   */
>  
> +#include <kvm/arm_hypercalls.h>
> +
>  #include <hyp/adjust_pc.h>
>  #include <hyp/switch.h>
>  
> @@ -33,6 +35,32 @@ void __kvm_hyp_host_forward_smc(struct kvm_cpu_context *host_ctxt);
>  
>  typedef void (*hyp_entry_exit_handler_fn)(struct pkvm_hyp_vcpu *);
>  
> +static void __maybe_unused handle_pvm_entry_hvc64(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	int i;
> +
> +	for (i = 0; i < 4; i++) {
> +		u64 ret =
> +			READ_ONCE(hyp_vcpu->host_vcpu->arch.ctxt.regs.regs[i]);
> +		vcpu_set_reg(&hyp_vcpu->vcpu, i, ret);
> +	}
> +}
> +
> +static void __maybe_unused handle_pvm_exit_hvc64(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> +	int i;
> +
> +	WRITE_ONCE(host_vcpu->arch.fault.esr_el2,
> +		   hyp_vcpu->vcpu.arch.fault.esr_el2);
> +
> +	/* Pass the HVC function id (r0) and its arguments. */
> +	for (i = 0; i < 8; i++) {
> +		WRITE_ONCE(host_vcpu->arch.ctxt.regs.regs[i],
> +			   vcpu_get_reg(&hyp_vcpu->vcpu, i));
> +	}
> +}
> +
>  static void handle_vm_entry_generic(struct pkvm_hyp_vcpu *hyp_vcpu)
>  {
>  	vcpu_copy_flag(&hyp_vcpu->vcpu, hyp_vcpu->host_vcpu, PC_UPDATE_REQ);
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index af334318d0a03..0fe11f95e2e26 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -1144,8 +1144,37 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
>  {
>  	u64 val[4] = { SMCCC_RET_INVALID_PARAMETER };
>  	bool handled = true;
> +	u32 feature;
> +	uuid_t uuid;
>  
>  	switch (smccc_get_function(vcpu)) {
> +	case ARM_SMCCC_VERSION_FUNC_ID:
> +		/* Nothing to be handled by the host. Go back to the guest. */
> +		val[0] = ARM_SMCCC_VERSION_1_1;
> +		val[1] = 0;
> +		val[2] = 0;
> +		val[3] = 0;
> +		break;
> +	case ARM_SMCCC_ARCH_FEATURES_FUNC_ID:
> +		/* SUCCESS only for the architecture calls EL2 implements. */
> +		feature = smccc_get_arg1(vcpu);
> +		switch (feature) {
> +		case ARM_SMCCC_VERSION_FUNC_ID:
> +		case ARM_SMCCC_ARCH_FEATURES_FUNC_ID:
> +			val[0] = SMCCC_RET_SUCCESS;
> +			break;
> +		default:
> +			val[0] = SMCCC_RET_NOT_SUPPORTED;
> +			break;
> +		}
> +		break;
> +	case ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID:
> +		uuid = ARM_SMCCC_VENDOR_HYP_UID_KVM;
> +		val[0] = smccc_uuid_to_reg(&uuid, 0);
> +		val[1] = smccc_uuid_to_reg(&uuid, 1);
> +		val[2] = smccc_uuid_to_reg(&uuid, 2);
> +		val[3] = smccc_uuid_to_reg(&uuid, 3);
> +		break;
>  	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
>  		val[0] = BIT(ARM_SMCCC_KVM_FUNC_FEATURES);
>  		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO);
> -- 
> 2.39.5
> 

