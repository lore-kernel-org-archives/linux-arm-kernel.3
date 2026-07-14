Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040A3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPGF1UDBgCf5RbKU5dxgnkqAQg95KKdRgb7F235/FIk=; b=SxVaBFuM0Je+SDxSTCjXs8XHD1
	fNU4Zvr6VmHy7bJjrwIycW9Aasd3QjLpMoBo6knhNILkgZLUbNxY9lI1OD2Dc7OwC+JzqohVBl1nC
	wItharec/4N4WLytYzghdsjN3MspL1dVKHIGYOBKKMpM0umgh6OjMOMcEmFv5Mgdq1L5xm5T0eE5l
	HtFyevvARtXzyyUKtqHJ+FxGQ6h/ZqZYBVUGYmBteT+Y/eyFX14N71NAf57RqKLpN15/sv73FUss7
	LRTqmBhDe1qYas+0BdnIvxK+m0bT0XWwSJoHZ01uhvgQzTqrcbfo8ro2MTt0ER70gz7Vat/nicRt3
	TgB92uqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaiN-0000000BbrR-0IWp;
	Tue, 14 Jul 2026 10:50:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaiK-0000000Bbqy-21mN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:50:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07D21497;
	Tue, 14 Jul 2026 03:50:07 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B1533F7B4;
	Tue, 14 Jul 2026 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784026211; bh=ugEdljPCSekPsPwW4PCihd4OdtdjS/5MSBMg8Yqhmg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vbjePEBFPpMvvBpsHM8hDtTeucxTSPhBc4LjeBVrgAbArgKoV3MKqJ+1WC3Ack4X1
	 z9AvJW4VM6bSpMofTd5GaL86/WnGjvKL9zDcdMTwkIxQBzy+gTqn7hbz6lmrMN6W2l
	 vKpaUXdJrp5/Go26UjTTbNUKDuuZjScnO9DwJdP4=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v4 5/6] KVM: arm64: Add HDBSS fault handling and buffer flush
Date: Tue, 14 Jul 2026 11:50:06 +0100
Message-ID: <alYUXkub43YxkeH1@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9340fa94-6f26-4053-a4ca-0803af725936@huawei.com>
References: <20260709104026.2612599-1-zhengtian10@huawei.com> <20260709104026.2612599-6-zhengtian10@huawei.com> <alTw0nwiBDWoFrjB@LeoBrasDK> <9340fa94-6f26-4053-a4ca-0803af725936@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_035012_609437_0C17B0AF 
X-CRM114-Status: GOOD (  35.43  )
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

On Tue, Jul 14, 2026 at 03:38:39PM +0800, Tian Zheng wrote:
> 
> On 7/13/2026 10:06 PM, Leonardo Bras wrote:
> > On Thu, Jul 09, 2026 at 06:40:25PM +0800, Tian Zheng wrote:
> > > From: eillon <yezhenyu2@huawei.com>
> > > 
> > > Add HDBSS fault handling for buffer full, external abort, and general
> > > protection fault (GPF) events. When the HDBSS buffer becomes full,
> > > the hardware traps to EL2 with an HDBSSF event, which is handled by
> > > setting a flush request.
> > > 
> > > Add kvm_flush_hdbss_buffer() to consume HDBSS buffer entries and
> > > propagate dirty information into the userspace-visible dirty bitmap.
> > > Flush is triggered on vcpu_put, check_vcpu_requests, and
> > > sync_dirty_log.
> > > 
> > > Add esr_iss2_is_hdbssf() helper for HDBSS fault detection in guest
> > > abort handling.
> > > 
> > > Signed-off-by: Eillon <yezhenyu2@huawei.com>
> > > Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
> > > ---
> > >   arch/arm64/include/asm/esr.h           |  5 +++
> > >   arch/arm64/include/asm/kvm_dirty_bit.h | 11 +++++
> > >   arch/arm64/include/asm/kvm_host.h      |  1 +
> > >   arch/arm64/kvm/arm.c                   | 14 ++++++
> > >   arch/arm64/kvm/dirty_bit.c             | 62 ++++++++++++++++++++++++++
> > >   arch/arm64/kvm/mmu.c                   |  4 ++
> > >   6 files changed, 97 insertions(+)
> > > 
> > > diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
> > > index 81c17320a588..2e6b679b5908 100644
> > > --- a/arch/arm64/include/asm/esr.h
> > > +++ b/arch/arm64/include/asm/esr.h
> > > @@ -437,6 +437,11 @@
> > >   #ifndef __ASSEMBLER__
> > >   #include <asm/types.h>
> > > 
> > > +static inline bool esr_iss2_is_hdbssf(unsigned long esr)
> > > +{
> > > +	return ESR_ELx_ISS2(esr) & ESR_ELx_HDBSSF;
> > This will return a long, which will be casted as bool.
> > In general, what I see in the kernel is something like:
> > 
> > 	return !!(ESR_ELx_ISS2(esr) & ESR_ELx_HDBSSF)
> 
> 
> ok!
> 
> 
> > > +}
> > > +
> > >   static inline unsigned long esr_brk_comment(unsigned long esr)
> > >   {
> > >   	return esr & ESR_ELx_BRK64_ISS_COMMENT_MASK;
> > > diff --git a/arch/arm64/include/asm/kvm_dirty_bit.h b/arch/arm64/include/asm/kvm_dirty_bit.h
> > > index 84b12f0a10af..4b28000e972f 100644
> > > --- a/arch/arm64/include/asm/kvm_dirty_bit.h
> > > +++ b/arch/arm64/include/asm/kvm_dirty_bit.h
> > > @@ -10,7 +10,18 @@
> > >   #include <asm/kvm_pgtable.h>
> > >   #include <asm/sysreg.h>
> > > 
> > > +/* HDBSS entry field definitions */
> > > +#define HDBSS_ENTRY_VALID	BIT(0)
> > > +#define HDBSS_ENTRY_TTWL_SHIFT (1)
> > > +#define HDBSS_ENTRY_TTWL_MASK (GENMASK(3, 1))
> > > +#define HDBSS_ENTRY_TTWL(x) \
> > > +	(((x) << HDBSS_ENTRY_TTWL_SHIFT) & HDBSS_ENTRY_TTWL_MASK)
> > > +#define HDBSS_ENTRY_TTWL_RESV HDBSS_ENTRY_TTWL(-4)
> > > +#define HDBSS_ENTRY_IPA	GENMASK_ULL(55, 12)
> > > +
> > >   int kvm_arm_vcpu_alloc_hdbss(struct kvm_vcpu *vcpu, unsigned int order);
> > >   void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu);
> > > +void kvm_flush_hdbss_buffer(struct kvm_vcpu *vcpu);
> > > +int kvm_handle_hdbss_fault(struct kvm_vcpu *vcpu);
> > > 
> > >   #endif /* __ARM64_KVM_DIRTY_BIT_H__ */
> > > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > > index c41ec6d9c45a..cecfb884a64f 100644
> > > --- a/arch/arm64/include/asm/kvm_host.h
> > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > @@ -55,6 +55,7 @@
> > >   #define KVM_REQ_GUEST_HYP_IRQ_PENDING	KVM_ARCH_REQ(9)
> > >   #define KVM_REQ_MAP_L1_VNCR_EL2		KVM_ARCH_REQ(10)
> > >   #define KVM_REQ_VGIC_PROCESS_UPDATE	KVM_ARCH_REQ(11)
> > > +#define KVM_REQ_FLUSH_HDBSS			KVM_ARCH_REQ(12)
> > > 
> > >   #define KVM_DIRTY_LOG_MANUAL_CAPS   (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | \
> > >   				     KVM_DIRTY_LOG_INITIALLY_SET)
> > > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > > index bf6688245d83..566953a4e23a 100644
> > > --- a/arch/arm64/kvm/arm.c
> > > +++ b/arch/arm64/kvm/arm.c
> > > @@ -755,6 +755,9 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
> > >   		kvm_vcpu_put_hw_mmu(vcpu);
> > >   	kvm_arm_vmid_clear_active();
> > > 
> > > +	if (vcpu->kvm->arch.enable_hdbss)
> > > +		kvm_flush_hdbss_buffer(vcpu);
> > > +
> > >   	vcpu_clear_on_unsupported_cpu(vcpu);
> > >   	vcpu->cpu = -1;
> > >   }
> > > @@ -1157,6 +1160,9 @@ static int check_vcpu_requests(struct kvm_vcpu *vcpu)
> > >   		if (kvm_dirty_ring_check_request(vcpu))
> > >   			return 0;
> > > 
> > > +		if (kvm_check_request(KVM_REQ_FLUSH_HDBSS, vcpu))
> > > +			kvm_flush_hdbss_buffer(vcpu);
> > > +
> > >   		check_nested_vcpu_requests(vcpu);
> > >   	}
> > > 
> > > @@ -1971,7 +1977,15 @@ long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
> > > 
> > >   void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
> > >   {
> > > +	/*
> > > +	 * Flush all CPUs' dirty log buffers to the dirty_bitmap.  Called
> > > +	 * before reporting dirty_bitmap to userspace. Send a request with
> > > +	 * KVM_REQUEST_WAIT to flush buffer synchronously.
> > > +	 */
> > > +	if (!kvm->arch.enable_hdbss)
> > > +		return;
> > > 
> > > +	kvm_make_all_cpus_request(kvm, KVM_REQ_FLUSH_HDBSS | KVM_REQUEST_WAIT);
> > >   }
> > > 
> > >   static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
> > > diff --git a/arch/arm64/kvm/dirty_bit.c b/arch/arm64/kvm/dirty_bit.c
> > > index 6c7a6ef66b5a..002366337637 100644
> > > --- a/arch/arm64/kvm/dirty_bit.c
> > > +++ b/arch/arm64/kvm/dirty_bit.c
> > > @@ -50,3 +50,65 @@ void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu)
> > > 
> > >   	vcpu->arch.hdbss.hdbssbr_el2 = 0;
> > >   }
> > > +
> > > +void kvm_flush_hdbss_buffer(struct kvm_vcpu *vcpu)
> > > +{
> > > +	int idx, curr_idx;
> > > +	u64 *hdbss_buf;
> > > +	struct kvm *kvm = vcpu->kvm;
> > > +
> > > +	if (!kvm->arch.enable_hdbss)
> > > +		return;
> > > +
> > > +	curr_idx = HDBSSPROD_IDX(read_sysreg_s(SYS_HDBSSPROD_EL2));
> > > +
> > > +	/* Do nothing if HDBSS buffer is empty or br_el2 is NULL */
> > > +	if (curr_idx == 0 || vcpu->arch.hdbss.hdbssbr_el2 == 0)
> > > +		return;
> > > +
> > > +	hdbss_buf = page_address(phys_to_page(vcpu->arch.hdbss.base_phys));
> > > +	if (!hdbss_buf)
> > > +		return;
> > > +
> > > +	guard(write_lock_irqsave)(&vcpu->kvm->mmu_lock);
> > > +	for (idx = 0; idx < curr_idx; idx++) {
> > > +		u64 gpa;
> > > +
> > > +		gpa = hdbss_buf[idx];
> > > +		if (!(gpa & HDBSS_ENTRY_VALID))
> > > +			continue;
> > > +
> > > +		gpa &= HDBSS_ENTRY_IPA;
> > > +		kvm_vcpu_mark_page_dirty(vcpu, gpa >> PAGE_SHIFT);
> > You mention that it does not support dirty-ring, but above function will
> > mark the page as dirty in the dirty-ring :/
> > 
> 
> In kvm_arm_enable_hdbss_global(), we explicitly check and reject HDBSS
> enablement if dirty-ring is active:
> 
> ```
> if (kvm->dirty_ring_size)
>     return 0;
> ```
> 
> So when kvm_flush_hdbss_buffer() runs (which requires enable_hdbss = true),
> we know for certain that
> 
> kvm->dirty_ring_size == 0. Therefore, kvm_vcpu_mark_page_dirty() will always
> take the dirty_bitmap path,
> 
> never the dirty-ring path.
> 
> That said, I'll add a comment in kvm_flush_hdbss_buffer() before dirty ring
> mode is supported, to make this explicit:
> 
> ```
> /*
>  * HDBSS is mutually exclusive with dirty-ring mode (see
>  * kvm_arm_enable_hdbss_global()), so kvm_vcpu_mark_page_dirty()
>  * will update the dirty_bitmap, not the dirty-ring.
>  */
> ```
>

Got it :)

Out of curiosity: which issues have you found on supporting dirty-ring at  
this point?

Thanks!
Leo
 

