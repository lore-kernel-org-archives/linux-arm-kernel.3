Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB69112584D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQt+CoV07J8tIqkpQRNCsaPJxxDfRM/yGjNi47TlBAQ=; b=BFrb30oAFEZIMcy2+39Drcxr4p
	4SgoOnZkwHs/5fJqfIus886Ic2GDfacBcO6VwGJp8V8GuYROGUUUYt5Vi5FFPexKEhAm9u+NEZlVy
	6ZIH9a4nofaPFbV8P7x/SMzBU/ZwP5kfE49S5iqJLKRUNm4/jsC/oXWjui5W9S95n8wMGOKCErPlm
	nRpiMSZ3aqgbKrpFgtNjM5z+5+8UVu+yjf3vufMWrXlm2mGADWVDxP/Lh517eSrmR9CVVJmoQA7v8
	ksJzYyv2cp7Ub7ErqqTTGUgcvnhdSrF3oXJD+3QsABRnNa2sriy+fhBhk9NK2oMM3M8XaTZOWUg3t
	bJpqUxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lgr-0000000BqaI-2ueF;
	Wed, 11 Mar 2026 15:41:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lgp-0000000BqZT-2fNj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 15:41:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-485317b6bd0so73865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773243697; x=1773848497; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KQt+CoV07J8tIqkpQRNCsaPJxxDfRM/yGjNi47TlBAQ=;
        b=lymPV39LlgKGLmQqL2b/S22s9JFbKNkPUU+1Q01/prwmbjKgZfBMfhDFV4IuFQkWIq
         8gOeRLQwSaV9ZUG1qNbfI3dwQmJJ00+Mb8FPp4kGFYjyY2IpN3+qDQdms+DePDHByrJ2
         f+Gn98aPMYclQJHhmXc8c68owVPX4/A6JUESsDkyd/FLJVitNsMbejVGThEBK4CtkXKQ
         n5Hv6742TR0RGNVuKWJMJCbcOh/Te9OXhQyjjOm48fUmKREfhCHZYBXTHKQJSzL74nw2
         eBQcBBlL6NmtNXbiizih0kUXRo3XXFGVPGB3lEjnF7lYrudc40cAmAlUgn2Bvi/lEJCz
         uDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773243697; x=1773848497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQt+CoV07J8tIqkpQRNCsaPJxxDfRM/yGjNi47TlBAQ=;
        b=Smh+n2gqGYjBQaPis74vyB/0lK14YYsCduD1409pvIBt+9E9e8PNSaY9o7MfDGD3lO
         burkwH6bM7eQ+D3RodymxlCJR/dnpXqjsieFgua5RbuipcaIvd9uUfUNlkAvxNLQQxHs
         rBtvN9MPr6P9S8UX3HGBI4VPVdiLF1TSOfPVXURSlMfmBfxF655R76/PelTDjMZDNYib
         YxG5RN64y0hVsfjZGmDH/sGjY3qj+IKA7kFhvLyhvrRbgjMKoXs3yk888RRI6jTgewSg
         w3Z6U+uWbZZcvwB8y3rCiMlYP/8Is/7XeTftSFGkWra00jc1MAFt9RHajbKzwxP+2bZg
         E9eA==
X-Gm-Message-State: AOJu0YwaA4ZuC61oU4yBXTaBw/EKD3/jV8jPkKx9ssnQCbfZWO1sBPyD
	F3CgXc6tJmSeF8cNSijiTzYy1jSGGbPcWDPnm7IIGjudlt0VcLFvI7wBWaAYVjWG9Q==
X-Gm-Gg: ATEYQzzSQPr0Q4PNKNPOt8BFzZTU/mw+Aw2Gt4g1uGan4uHS+TBZuiE/38Z69GcCLs7
	iNPNmrIRDBOSrs6SXfNjp1lQTJArhWvnpKwSkv80gESvE5Vo4czq6ezwzdBZcWDtfDpAZ0g29pu
	AHIbm4vhYG2e1+YCH4kSANcj2o3and8tewQwaEiZz2zWUoMF4B7FfooFN7/M1mb1XLOaKNlfPFJ
	uzZGC3f8in2gnCW5n4RSme1b9nAvhP/1UdswZpiAZHyY2/FJw2zw5T7bKuUuh16dvX+/YE4iy6M
	nDK7J7Tyh3SIN1GTmPmfViFLDNmm4mEzUJzoWINg53WQjHcH6Zdqt/X4VY17kz9T7abDAKyIMfN
	PgFNk2xrAJV6V2UCXIrIxbXrtV21tQoBn2LogGlqh6xr5w/opMTCPJRU/cV2eNHAvz9lHNaUPaT
	YMMjX5zgJtJuiTG9xbxVgt0Fh0FdOivn9K0hj7PgeZ6JxX/+6erDWGeacfqXn369BsxnQ=
X-Received: by 2002:a05:600c:5593:b0:485:4f11:aac5 with SMTP id 5b1f17b1804b1-4854f11ac78mr81425e9.15.1773243696310;
        Wed, 11 Mar 2026 08:41:36 -0700 (PDT)
Received: from google.com (209.13.205.35.bc.googleusercontent.com. [35.205.13.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm50479f8f.14.2026.03.11.08.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:41:35 -0700 (PDT)
Date: Wed, 11 Mar 2026 15:41:32 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH RESEND 2/2] KVM: arm64: nv: Expose shadow page tables in
 debugfs
Message-ID: <abGNLOfKLcNGYcxh@google.com>
References: <20260308231829.864983-1-weilin.chang@arm.com>
 <20260308231829.864983-3-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308231829.864983-3-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_084139_703217_D435AACC 
X-CRM114-Status: GOOD (  31.52  )
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

On Sun, Mar 08, 2026 at 11:18:29PM +0000, Wei-Lin Chang wrote:
> Exposing shadow page tables in debugfs improves the debugability and
> testability of NV. With this patch a new directory "nested" is created
> for each VM created if the host is NV capable. Within the directory each
> valid s2 mmu will have its shadow page table exposed as a readable file
> with the file name formatted as 0x<vttbr>-0x<vtcr>-s2-{en,dis}abled. The
> creation and removal of the files happen at the points when an s2 mmu
> becomes valid, or the context it represents change. In the future the
> "nested" directory can also hold other NV related information.
> 
> This is gated behind CONFIG_PTDUMP_STAGE2_DEBUGFS.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>  arch/arm64/include/asm/kvm_host.h |  7 +++++++
>  arch/arm64/include/asm/kvm_mmu.h  |  4 ++++
>  arch/arm64/kvm/nested.c           |  6 +++++-
>  arch/arm64/kvm/ptdump.c           | 27 +++++++++++++++++++++++++++
>  4 files changed, 43 insertions(+), 1 deletion(-)

Hi,

> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 5d5a3bbdb95e..f88f6c4d646e 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -217,6 +217,10 @@ struct kvm_s2_mmu {
>  	 */
>  	bool	nested_stage2_enabled;
>  
> +#ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
> +	struct dentry *shadow_pt_debugfs_dentry;
> +#endif
> +
>  	/*
>  	 * true when this MMU needs to be unmapped before being used for a new
>  	 * purpose.
> @@ -405,6 +409,9 @@ struct kvm_arch {
>  	 * the associated pKVM instance in the hypervisor.
>  	 */
>  	struct kvm_protected_vm pkvm;
> +
> +	/* Nested virtualization info */
> +	struct dentry *debugfs_nv_dentry;
>  };
>  
>  struct kvm_vcpu_fault_info {
> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> index d968aca0461a..01e9c72d6aa7 100644
> --- a/arch/arm64/include/asm/kvm_mmu.h
> +++ b/arch/arm64/include/asm/kvm_mmu.h
> @@ -393,8 +393,12 @@ static inline bool kvm_supports_cacheable_pfnmap(void)
>  
>  #ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
>  void kvm_s2_ptdump_create_debugfs(struct kvm *kvm);
> +void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu);
> +void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu);
>  #else
>  static inline void kvm_s2_ptdump_create_debugfs(struct kvm *kvm) {}
> +static inline void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu) {}
> +static inline void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu) {}
>  #endif /* CONFIG_PTDUMP_STAGE2_DEBUGFS */
>  
>  #endif /* __ASSEMBLER__ */
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index eeea5e692370..31d74ed8449e 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -730,8 +730,10 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
>  	kvm->arch.nested_mmus_next = (i + 1) % kvm->arch.nested_mmus_size;
>  
>  	/* Make sure we don't forget to do the laundry */
> -	if (kvm_s2_mmu_valid(s2_mmu))
> +	if (kvm_s2_mmu_valid(s2_mmu)) {
> +		kvm_nested_s2_ptdump_remove_debugfs(s2_mmu);
>  		s2_mmu->pending_unmap = true;
> +	}
>  
>  	/*
>  	 * The virtual VMID (modulo CnP) will be used as a key when matching
> @@ -745,6 +747,8 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
>  	s2_mmu->tlb_vtcr = vcpu_read_sys_reg(vcpu, VTCR_EL2);
>  	s2_mmu->nested_stage2_enabled = vcpu_read_sys_reg(vcpu, HCR_EL2) & HCR_VM;
>  
> +	kvm_nested_s2_ptdump_create_debugfs(s2_mmu);
> +
>  out:
>  	atomic_inc(&s2_mmu->refcnt);
>  
> diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> index 98763b291956..3a70f633fc8b 100644
> --- a/arch/arm64/kvm/ptdump.c
> +++ b/arch/arm64/kvm/ptdump.c
> @@ -10,6 +10,7 @@
>  #include <linux/kvm_host.h>
>  #include <linux/seq_file.h>
>  
> +#include <asm/cpufeature.h>
>  #include <asm/kvm_mmu.h>
>  #include <asm/kvm_pgtable.h>
>  #include <asm/ptdump.h>
> @@ -277,6 +278,29 @@ static const struct file_operations kvm_pgtable_levels_fops = {
>  	.release	= kvm_pgtable_debugfs_close,
>  };
>  
> +void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu)
> +{
> +	struct dentry *dent;
> +	/* format: 0x<vttbr>-0x<vtcr>-s2-{en, dis}abled\0 */
> +	char file_name[2 + 16 + 1 + 2 + 16 + 4 + 3 + 6];

Can you hide the size of this definition behind a macro ?

> +
> +	snprintf(file_name, sizeof(file_name), "0x%llx-0x%llx-s2-%sabled",
> +		 mmu->tlb_vttbr,
> +		 mmu->tlb_vtcr,
> +		 mmu->nested_stage2_enabled ? "en" : "dis");
> +
> +	dent = debugfs_create_file(file_name, 0400,
> +				   mmu->arch->debugfs_nv_dentry, mmu,
> +				   &kvm_ptdump_guest_fops);
> +
> +	mmu->shadow_pt_debugfs_dentry = dent;
> +}
> +
> +void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu)
> +{
> +	debugfs_remove(mmu->shadow_pt_debugfs_dentry);
> +}
> +
>  void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
>  {
>  	debugfs_create_file("stage2_page_tables", 0400, kvm->debugfs_dentry,
> @@ -285,4 +309,7 @@ void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
>  			    &kvm->arch.mmu, &kvm_pgtable_range_fops);
>  	debugfs_create_file("stage2_levels", 0400, kvm->debugfs_dentry,
>  			    &kvm->arch.mmu, &kvm_pgtable_levels_fops);
> +	if (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
> +		kvm->arch.debugfs_nv_dentry =
> +			debugfs_create_dir("nested", kvm->debugfs_dentry);
>  }

Other than that this looks good to me, thanks
Reviewed-by: Sebastian Ene <sebastianene@google.com>

> -- 
> 2.43.0
> 

