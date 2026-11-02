Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A424D606B1DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c0EkxhEL;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OrR46o0z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mnbEcy9yAD6phXCBWi7ToEYZPml/PD9q0TObYO3iXg0=; b=c0EkxhELVGmABk
	xwIF5iHyWECxbRXMM/o6ydnzL7S/mLIbilUKX/m4wEpaVMFoxdS9ybo7TY5IFEUQdLeb7mK3fI512
	jKIPpKf8Cy/BOsai+HprqaGd833QK7wVwrzzu2FLkYONbN/hfCns9TghNC7iYnx+gTk4q7L7v3LfD
	4JdXFMYZuPk9HqbLaDnUHFZ746/mwk2lu3OuVwr92w3Ih1E5k24cRbxvTOkCnz+5UyPdCTuboE/pe
	wKQ1K/Z0Fy9ayiGx/4QIMQl2cQbDDQp2ntkteDrWrTbmEOTK5auaQCvotf3Nv8d4mYVqHojRcTyO9
	l5jd9vu+QFTGI9/czhqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNt7C-0000000Gqiu-0TrN;
	Mon, 02 Nov 2026 14:34:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNt78-0000000GqiI-3cnF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:34:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C1CD1576;
	Mon,  2 Nov 2026 06:34:16 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F42D3F59E;
	Mon,  2 Nov 2026 06:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793630059; bh=sSMXuhaToN1bbAGIonxsHXOHufl/pcpSiAvNaSVjj+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OrR46o0zexxiwk2zJWR5KHZn9xMWBWhTC1MviO+EetdzupvPVTzTZsZ4QeJxUM3+L
	 XJ3Rvwgg9U7dRNVQm62aibAmTq/cDOGknoI2kI+vuyt/LJ4BLAFCf3NvpYpeOAekuo
	 u7A3xYfqid7T5oZMMXLVocyyLHQU439ZM9ugRbeM=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	pbonzini@redhat.com,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	tangchengchang@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	fuad.tabba@linux.dev,
	mark.rutland@arm.com,
	seanjc@google.com,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v5 09/15] KVM: arm64: Handle HDBSS faults
Date: Mon,  2 Nov 2026 14:34:03 +0000
Message-ID: <auifWrY1u72afXfJ@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260929103655.85107-10-zhengtian10@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com> <20260929103655.85107-10-zhengtian10@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_063423_098480_217B072D 
X-CRM114-Status: GOOD (  23.78  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Sep 29, 2026 at 06:36:49PM +0800, Tian Zheng wrote:
> From: Eillon <yezhenyu2@huawei.com>
> 
> Once the buffer is full, hardware stops promoting writable-clean
> descriptors and raises a stage-2 Permission fault with
> ESR_EL2.ISS2.HDBSSF instead. Failed HDBSS accesses, such as external
> aborts and granule protection faults, are reported the same way.
> 
> Dispatch from kvm_handle_guest_abort() via the new esr_iss2_is_hdbssf()
> helper. FSC == OK means the exit path already flushed, so resume the
> guest; any other FSC is an error - clear it and report -EFAULT.
> 
> Signed-off-by: Eillon <yezhenyu2@huawei.com>
> Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
> ---
>  arch/arm64/include/asm/esr.h           |  5 +++++
>  arch/arm64/include/asm/kvm_dirty_bit.h |  1 +
>  arch/arm64/kvm/dirty_bit.c             | 29 ++++++++++++++++++++++++++
>  arch/arm64/kvm/mmu.c                   |  4 ++++
>  4 files changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
> index f816f5d77f1a..4b3ccd407faa 100644
> --- a/arch/arm64/include/asm/esr.h
> +++ b/arch/arm64/include/asm/esr.h
> @@ -437,6 +437,11 @@
>  #ifndef __ASSEMBLER__
>  #include <asm/types.h>
> 
> +static inline bool esr_iss2_is_hdbssf(unsigned long esr)
> +{
> +	return !!(ESR_ELx_ISS2(esr) & ESR_ELx_HDBSSF);
> +}
> +
>  static inline unsigned long esr_brk_comment(unsigned long esr)
>  {
>  	return esr & ESR_ELx_BRK64_ISS_COMMENT_MASK;
> diff --git a/arch/arm64/include/asm/kvm_dirty_bit.h b/arch/arm64/include/asm/kvm_dirty_bit.h
> index d828e6b43fe9..eb2039820777 100644
> --- a/arch/arm64/include/asm/kvm_dirty_bit.h
> +++ b/arch/arm64/include/asm/kvm_dirty_bit.h
> @@ -39,5 +39,6 @@ static inline bool vcpu_hdbss_enabled(struct kvm_vcpu *vcpu)
>  int kvm_arm_vcpu_alloc_hdbss(struct kvm_vcpu *vcpu);
>  void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu);
>  void kvm_flush_hdbss_buffer(struct kvm_vcpu *vcpu);
> +int kvm_handle_hdbss_fault(struct kvm_vcpu *vcpu);
> 
>  #endif /* __ARM64_KVM_DIRTY_BIT_H__ */
> diff --git a/arch/arm64/kvm/dirty_bit.c b/arch/arm64/kvm/dirty_bit.c
> index be0d12555c84..893a8c4248bc 100644
> --- a/arch/arm64/kvm/dirty_bit.c
> +++ b/arch/arm64/kvm/dirty_bit.c
> @@ -98,3 +98,32 @@ void kvm_flush_hdbss_buffer(struct kvm_vcpu *vcpu)
>  	vcpu->arch.hdbss.hdbssprod_el2 = prod;
>  	isb();
>  }
> +
> +int kvm_handle_hdbss_fault(struct kvm_vcpu *vcpu)
> +{
> +	u64 prod;
> +	u64 fsc;
> +
> +	if (WARN_ON_ONCE(!system_supports_hdbss()))
> +		return -EFAULT;
> +
> +	if (WARN_ON_ONCE(!vcpu_hdbss_enabled(vcpu)))
> +		return -EFAULT;
> +
> +	prod = read_sysreg_s(SYS_HDBSSPROD_EL2);
> +	fsc = FIELD_GET(HDBSSPROD_EL2_FSC_MASK, prod);
> +
> +	if (fsc == HDBSSPROD_EL2_FSC_OK)
> +		/* Buffer full: the exit path drained it before handle_exit. */
> +		return 1;
> +
> +	if (fsc != HDBSSPROD_EL2_FSC_ExternalAbort &&
> +	    fsc != HDBSSPROD_EL2_FSC_GPF)
> +		WARN_ONCE(1,
> +			  "Unexpected HDBSS fault type, FSC: 0x%llx (prod=0x%llx, vcpu=%d)\n",
> +			  fsc, prod, vcpu->vcpu_id);

Any reason for using if() before warn_once, given the first parameter is a 
condition? I mean, why not use, instead:

+	WARN_ONCE(fsc != HDBSSPROD_EL2_FSC_ExternalAbort &&
+		  fsc != HDBSSPROD_EL2_FSC_GPF,
+		  "Unexpected HDBSS fault type, FSC: 0x%llx (prod=0x%llx, vcpu=%d)\n",
+		  fsc, prod, vcpu->vcpu_id);

> +
> +	/* Clear FSC so hardware dirty state updates can resume. */
> +	write_sysreg_s(prod & ~HDBSSPROD_EL2_FSC_MASK, SYS_HDBSSPROD_EL2);
> +	return -EFAULT;
> +}
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 85a98d2c23a9..7bf82d65041c 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -15,6 +15,7 @@
>  #include <asm/pgalloc.h>
>  #include <asm/cacheflush.h>
>  #include <asm/kvm_arm.h>
> +#include <asm/kvm_dirty_bit.h>
>  #include <asm/kvm_mmu.h>
>  #include <asm/kvm_pgtable.h>
>  #include <asm/kvm_pkvm.h>
> @@ -2315,6 +2316,9 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
> 
>  	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
> 
> +	if (esr_iss2_is_hdbssf(esr))
> +		return kvm_handle_hdbss_fault(vcpu);
> +
>  	if (esr_fsc_is_translation_fault(esr)) {
>  		/* Beyond sanitised PARange (which is the IPA limit) */
>  		if (fault_ipa >= BIT_ULL(get_kvm_ipa_limit())) {

I did not get the criteria used to positioning it here:
Why placed before is_abt, if not using the result before returning?
What is the rationale to putting it here?

Thanks!
Leo 

