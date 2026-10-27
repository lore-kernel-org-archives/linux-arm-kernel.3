Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CA5606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 18:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jME175ol;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MRWCaJvB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SEGsNEKzJFKAXCSwgMTuyhg9hYL4zxxvha+xxLEPLv0=; b=jME175oloB43Wm
	agupeHQ2H4LL7DF2QfBwJ/36tgRDfn7TxKMfyEzNLPBWydZMGnO7QM0xYz1l3MWMb0ZVPxV+8S2xU
	jypbrXOUuohKRP0oxaqUrzJbrqOHa6xdHewd4xJkYAlqfFlho5OMDoC/gdgV76BRZox1DUzUYovbW
	zC0sdRo78QxXE/lmF9iGmvNMhu80kxIWsk04l8m8k3vEeZWAKIzbJPehHjR0FvSob9FcMElV5fAkM
	SVtZfu8iVNMknalASAYffEmZqL4KjfOlXRFILdZczRPvrHtCtvdgZ5jeGe0aFMaAMzd/kPKASBPhP
	5lX2Heu6jn0n8WO+Zx4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlgC-00000005XPC-2lwK;
	Tue, 27 Oct 2026 18:13:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlgA-00000005XOg-2KJI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 18:13:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5256C1650;
	Tue, 27 Oct 2026 11:13:39 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2746E3F59E;
	Tue, 27 Oct 2026 11:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793124822; bh=StP32dfIcKd8YphSKpAL+/HMutnlIIEzCaQQmma93NA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MRWCaJvB6Q28OPTMIyyC6DjI8k5TlohZktMkWptC/He2/3HJxzp5kYwhVFDcW74p3
	 o33mnJ07QNYP5dUnmQi2BdWSac/cz93NF/qOl3XcNpzMvuUI9ZLP8rq0VqQ5Xx4KuG
	 8wbM62lsVAv+Qy+Es7f5beZKEbQGV8ixw8A3RHbI=
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
Subject: Re: [PATCH v5 08/15] KVM: arm64: Flush the HDBSS buffer on VM exit
Date: Tue, 27 Oct 2026 18:13:35 +0000
Message-ID: <auDpyRNpeDNzIk3W@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260929103655.85107-9-zhengtian10@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com> <20260929103655.85107-9-zhengtian10@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_111346_677482_6794D199 
X-CRM114-Status: GOOD (  33.92  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Sep 29, 2026 at 06:36:48PM +0800, Tian Zheng wrote:
> From: Eillon <yezhenyu2@huawei.com>
> 
> HDBSS entries accumulate in the per-vCPU buffer while the guest runs,
> and must be drained into the dirty bitmap or dirty ring before
> userspace can observe them.
> 
> Drain the buffer at a single point: kvm_arch_vcpu_ioctl_run() flushes
> it on every VM exit, before the exit reason is handled. Flushing
> inside the run loop keeps the dirty-ring feedback timely: when a flush
> pushes the ring past its soft limit, kvm_dirty_ring_push() raises
> KVM_REQ_DIRTY_RING_SOFT_FULL, which check_vcpu_requests() observes at
> the top of the next loop iteration, so the vCPU exits to userspace for
> the harvest before re-entering the guest.
> 
> kvm_arch_sync_dirty_log() relies on the exit path to flush: it kicks
> vCPUs out of guest mode, and the GET/CLEAR protocol tolerates
> concurrent bitmap writes, so the snapshot is complete without extra
> synchronization.
> 
> Signed-off-by: Eillon <yezhenyu2@huawei.com>
> Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
> ---
>  arch/arm64/include/asm/kvm_dirty_bit.h | 15 +++++++++
>  arch/arm64/kvm/arm.c                   | 20 ++++++++++++
>  arch/arm64/kvm/dirty_bit.c             | 45 ++++++++++++++++++++++++++
>  3 files changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_dirty_bit.h b/arch/arm64/include/asm/kvm_dirty_bit.h
> index fe703f02626b..d828e6b43fe9 100644
> --- a/arch/arm64/include/asm/kvm_dirty_bit.h
> +++ b/arch/arm64/include/asm/kvm_dirty_bit.h
> @@ -13,6 +13,9 @@
>  #include <asm/sysreg.h>
>  #include <linux/sizes.h>
> 
> +#define HDBSS_ENTRY_VALID	BIT(0)
> +#define HDBSS_ENTRY_IPA	GENMASK_ULL(55, 12)
> +
>  #define KVM_ARM_HDBSS_DEFAULT_SIZE  PAGE_SIZE
>  #define KVM_ARM_HDBSS_MAX_SIZE      SZ_2M
> 
> @@ -22,7 +25,19 @@ static inline u32 kvm_hdbss_buffer_size(struct kvm *kvm)
>  	return kvm->arch.hdbss_buffer_size ?: KVM_ARM_HDBSS_DEFAULT_SIZE;
>  }
> 
> +static inline bool kvm_hdbss_enabled(struct kvm *kvm)
> +{
> +	return kvm->arch.mmu.vtcr & VTCR_EL2_HDBSS;
> +}
> +
> +static inline bool vcpu_hdbss_enabled(struct kvm_vcpu *vcpu)
> +{
> +	return vcpu->arch.hw_mmu &&
> +		(vcpu->arch.hw_mmu->vtcr & VTCR_EL2_HDBSS);
> +}
> +

IIUC, arch.mmu is always the canonical s2_mmu, while hw_mmu can be the 
nested s2_mmu, if enabled.

Was that your intend here?
If not, we could use only kvm* version, which can be called with vcpu->kvm.

If it was, then I would like to understand the logic here, as IIUC the 
buffer is accessible only for the non-nested guest, as it's 
allocated in a per-vcpu structure. (vcpu->arch)

>  int kvm_arm_vcpu_alloc_hdbss(struct kvm_vcpu *vcpu);
>  void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu);
> +void kvm_flush_hdbss_buffer(struct kvm_vcpu *vcpu);
> 
>  #endif /* __ARM64_KVM_DIRTY_BIT_H__ */
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 5ea4ac26995e..9d7bdece149a 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1430,6 +1430,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> 
>  		trace_kvm_exit(ret, kvm_vcpu_trap_get_class(vcpu), *vcpu_pc(vcpu));
> 
> +		/*
> +		 * Drain the HDBSS buffer before the exit is handled, so
> +		 * entries pushed to the dirty ring are accounted for by
> +		 * dirty_ring_check_request() on the next iteration.
> +		 */
> +		if (vcpu_hdbss_enabled(vcpu))
> +			kvm_flush_hdbss_buffer(vcpu);
> +
>  		/* Exit types that need handling before we can be preempted */
>  		handle_exit_early(vcpu, ret);
> 


looks the correct place, haven't looked too much on that, though.


> @@ -2017,7 +2025,19 @@ long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
> 
>  void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>  {
> +	unsigned long i;
> +	struct kvm_vcpu *vcpu;
> 
> +	if (!kvm_hdbss_enabled(kvm))
> +		return;
> +
> +	/*
> +	 * The buffer is drained on every VM exit, so kicking running
> +	 * vCPUs is enough to flush them; the dirty-log GET/CLEAR
> +	 * protocol tolerates bits set concurrently with the snapshot.
> +	 */
> +	kvm_for_each_vcpu(i, vcpu, kvm)
> +		kvm_vcpu_kick(vcpu);
>  }
> 
>  static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
> diff --git a/arch/arm64/kvm/dirty_bit.c b/arch/arm64/kvm/dirty_bit.c
> index f9aeb9f34ad0..be0d12555c84 100644
> --- a/arch/arm64/kvm/dirty_bit.c
> +++ b/arch/arm64/kvm/dirty_bit.c
> @@ -13,6 +13,7 @@
>  #include <linux/kconfig.h>
>  #include <linux/log2.h>
>  #include <linux/mm.h>
> +#include <linux/srcu.h>
> 

Out of curiosity, could you please explain you reasoning on selecting srcu 
as locking here? 

(Like, what are you protecting against, and why srcu is a good choice)

>  int kvm_arm_vcpu_alloc_hdbss(struct kvm_vcpu *vcpu)
>  {
> @@ -53,3 +54,47 @@ void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu)
>  	vcpu->arch.hdbss.hdbss_pg = NULL;
>  	vcpu->arch.hdbss.hdbssbr_el2 = 0;
>  }
> +
> +void kvm_flush_hdbss_buffer(struct kvm_vcpu *vcpu)
> +{
> +	int idx, curr_idx;
> +	u64 prod;
> +	u32 entries;
> +	u64 *hdbss_buf;
> +	struct kvm *kvm = vcpu->kvm;
> +	int srcu_idx;
> +
> +	if (!vcpu_hdbss_enabled(vcpu))
> +		return;

You test this before calling, is it really necessary to test it again, just 
after calling?

> +
> +	prod = read_sysreg_s(SYS_HDBSSPROD_EL2);
> +	curr_idx = HDBSSPROD_IDX(prod);
> +
> +	if (curr_idx == 0 || !vcpu->arch.hdbss.hdbss_pg)
> +		return;
> +
> +	hdbss_buf = page_address(vcpu->arch.hdbss.hdbss_pg);
> +	if (!hdbss_buf)
> +		return;
> +
> +	entries = kvm_hdbss_buffer_size(kvm) / sizeof(u64);
> +
> +	/* kvm_vcpu_mark_page_dirty() resolves the memslot under SRCU. */
> +	srcu_idx = srcu_read_lock(&kvm->srcu);
> +	for (idx = 0; idx < min_t(u32, curr_idx, entries); idx++) {
> +		u64 gpa;
> +
> +		gpa = hdbss_buf[idx];
> +		if (!(gpa & HDBSS_ENTRY_VALID))
> +			continue;
> +
> +		gpa &= HDBSS_ENTRY_IPA;
> +		kvm_vcpu_mark_page_dirty(vcpu, gpa >> PAGE_SHIFT);
> +	}
> +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> +
> +	prod &= ~HDBSSPROD_EL2_INDEX_MASK;
> +	write_sysreg_s(prod, SYS_HDBSSPROD_EL2);
> +	vcpu->arch.hdbss.hdbssprod_el2 = prod;
> +	isb();
> +}
> --
> 2.43.0
> 


Thanks!
Leo


