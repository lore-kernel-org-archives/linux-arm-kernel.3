Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9410606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 01:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i/Jknmag;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=qRP8rJG1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fB7z6WTzne8vn7VZ7LFWqDOJ0h3C5Z8OJQ5gKsewjWo=; b=i/Jknmag8i1CFZmOZO0N3DjbOk
	QKafNdeEJyggwRzBFi8/i5ZhIWTCyBTwCdm53AjbrxijuqCtecHSMfkoP+7aO40Wh1tmRb7D4aKCJ
	7Pyx/CnEErDRAF1QO8jtXXwryTCo//H9hJCdkiQGN/dDonzg/Tc3RuikiHX5zmFfwqvobviLZaUNN
	0jpdIsWMGhi5F630NfKlAWV5+bJCnIfhrgCbPV+aguLUqCww2rm91UaCNrHe9FmMe0YsyMTkQv4uz
	6oto7EGQ1JeuRc0iz2jSpCz0QAVatp1rmQ5udggj6KXV2Ey9y05OCGF8qjH7bWya9G4PPNOPau8KK
	cxAf08mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNh7m-0000000FMsa-495S;
	Mon, 02 Nov 2026 01:46:15 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNh7j-0000000FMrL-3H0c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 01:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793583969; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=fB7z6WTzne8vn7VZ7LFWqDOJ0h3C5Z8OJQ5gKsewjWo=;
	b=qRP8rJG1kyYZH3aQAq+OSqJ/2UJfyl/jB/ACgED4tTS10jG+EcL0d90y4KH2V9Qg6DAbc+JDHIpTNHbMeWLAErIBPPcOYNf7VizpyXbMgL1O7fQmzjASWYUUWemuIkgkexcNlO6GaCfF7GEk9J754kZDXcPxm2li29oGcNMOAnc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R421e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XDrTuF7_1793583967;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0XDrTuF7_1793583967 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 02 Nov 2026 09:46:08 +0800
Date: Mon, 2 Nov 2026 09:46:07 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Arnd Bergmann <arnd@arndb.de>, Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] KVM: arm64: Add context-switch of ACCDATA_EL1
Message-ID: <6sygq76bnxgmsdl3hkfd4ai7vi2mqx6l2zljhglqsute63l6wm@swzjce5v5jly>
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
 <20261025075138.2919734-4-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025075138.2919734-4-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_174612_344607_FB1D40F4 
X-CRM114-Status: GOOD (  23.83  )
X-Spam-Score: -15.6 (---------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 07:51:36AM +0800, Fuad Tabba wrote:
> From: Marc Zyngier <maz@kernel.org>
>
> Add ACCDATA_EL1 save/restore as part of the EL0 context. This is
> conditioned on the guest's view of ID_AA64ISAR1_EL1.LS64 reporting
> that this register is supported.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Fixes: 58ce78667a641 ("arm64: Add support for FEAT_{LS64, LS64_V}")
> Link: https://lore.kernel.org/r/20240815125959.2097734-5-maz@kernel.org
> Cc: stable@vger.kernel.org
> [Fuad: rebased; switch ACCDATA_EL1 for guests only, as the host never
>  uses it; gate it on a new ARM64_HAS_LS64_ACCDATA capability, since
>  in pKVM the host controls a non-protected guest's ID registers, and
>  an EL2 access to ACCDATA_EL1 on a CPU without the feature is UNDEFINED]
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

> ---
>  arch/arm64/kernel/cpufeature.c             |  7 +++++++
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 23 ++++++++++++++++++++++
>  arch/arm64/tools/cpucaps                   |  1 +
>  3 files changed, 31 insertions(+)
>
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 32102c3912fa7..b5720c56eebc9 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -3225,6 +3225,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.cpu_enable = cpu_enable_ls64_v,
>  		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, LS64, LS64_V)
>  	},
> +	{
> +		.desc = "LS64_ACCDATA",
> +		.capability = ARM64_HAS_LS64_ACCDATA,
> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> +		.matches = has_cpuid_feature,
> +		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA)
> +	},
>  #ifdef CONFIG_ARM64_LSUI
>  	{
>  		.desc = "Unprivileged Load Store Instructions (LSUI)",
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index c382848d31947..4a008c8a696ba 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -17,6 +17,7 @@
>  #include <asm/kvm_mmu.h>
>
>  static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt);
> +static inline bool ctxt_has_accdata(struct kvm_cpu_context *ctxt);
>
>  static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
>  {
> @@ -67,6 +68,13 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
>  {
>  	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
>  	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
> +
> +	/*
> +	 * Despite the appearances, ACCDATA_EL1 is part of the EL0
> +	 * context, as it can only be used using ST64BV0.
> +	 */
> +	if (ctxt_has_accdata(ctxt))
> +		ctxt_sys_reg(ctxt, ACCDATA_EL1)	= read_sysreg_s(SYS_ACCDATA_EL1);
>  }
>
>  static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
> @@ -131,6 +139,18 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
>  	return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
>  }
>
> +static inline bool ctxt_has_accdata(struct kvm_cpu_context *ctxt)
> +{
> +	struct kvm_vcpu *vcpu;
> +
> +	/* The host never uses ACCDATA_EL1 */
> +	if (!cpus_have_final_cap(ARM64_HAS_LS64_ACCDATA) || !ctxt_is_guest(ctxt))
> +		return false;
> +
> +	vcpu = ctxt_to_vcpu(ctxt);
> +	return kvm_has_feat(kern_hyp_va(vcpu->kvm), ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA);
> +}
> +
>  static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
>  {
>  	ctxt_sys_reg(ctxt, SCTLR_EL1)	= read_sysreg_el1(SYS_SCTLR);
> @@ -210,6 +230,9 @@ static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
>  {
>  	write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL0),	tpidr_el0);
>  	write_sysreg(ctxt_sys_reg(ctxt, TPIDRRO_EL0),	tpidrro_el0);
> +
> +	if (ctxt_has_accdata(ctxt))
> +		write_sysreg_s(ctxt_sys_reg(ctxt, ACCDATA_EL1), SYS_ACCDATA_EL1);
>  }
>
>  static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 2775ba3359cfe..f01719bbd6037 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -49,6 +49,7 @@ HAS_LPA2
>  HAS_LSE_ATOMICS
>  HAS_LS64
>  HAS_LS64_V
> +HAS_LS64_ACCDATA
>  HAS_LSUI
>  HAS_MOPS
>  HAS_NESTED_VIRT
> --
> 2.47.3
>

