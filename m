Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9D8C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 18:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kb+JzYBVjZ9xE5OHKGAs6buy9QveH8O/36VzTdTmQvE=; b=kmI6cIzhWmPHXwld+Lqefr5bmL
	Dj9WVN6lv1dc1ACLKGK0fB+isla2CbfxbX6O4K7P63uv2YTuKlBqi8Ry2LxFGmQD+g5DFZdyIiS5R
	tNFyEdZA2VUmjOHZv0lOWwF64ltFHdMD9vF955QBpPvGiyyqNzAa8v83jLN5REHhHmDxssCpqwuI+
	R3KD1ziCFHBkCfmq6RA8zvqvNBhiuFOWbbfp52G7IXpBXLDdR6I+Gxn7tfHAt0O4/RSyzmf3k+wIC
	X+fYhB9uuj/JkHa0+BjwuCTQHhwXCqaUWtNz4LNa1kJH12480bUtCEavPx3BR9a7vkrJRdJ34NvFk
	xfp6IXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94uK-00000006GUi-3Jio;
	Tue, 22 Sep 2026 18:07:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94uJ-00000006GUY-1pO3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 18:07:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2C2044540;
	Tue, 22 Sep 2026 18:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A8E1F000FF;
	Tue, 22 Sep 2026 18:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790100474;
	bh=kb+JzYBVjZ9xE5OHKGAs6buy9QveH8O/36VzTdTmQvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hrInqBzNV4tJiXiZRrcGk9/EK7PT8Ecw9NiMTg5FJ+q93MSdUGUuLcoW1mSD2L/Ju
	 TKFIt/lc06QBmc2Fd7Mtmf6ExYIqb1ttPPbfAIAd2RXWTIA3C8fgvHsFs2Mc3cWG8z
	 9Dgr8xK6tf/XvvZnNpFYNU4yhMWGtXEavvbww5rbd8dp35z5Uy6MERA6AKszfldh16
	 WvlFBegdMarxEIkPVrYigek7HKcfSkQAEBNRg8Q2v/zItd9+0vj8BzZdSQ144qY7P8
	 HbsZMWiU7mbGNeWzxcsWReXhu/OZbZ5gW2+IsG+Edhrxr7FPtfMi5M9/rnDrI0eSe9
	 ATAE9RwR8JiKg==
Date: Tue, 22 Sep 2026 11:07:53 -0700
From: Oliver Upton <oupton@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Jack Thomson <jackabt@amazon.com>,
	Jack Thomson <jackabt.amazon@gmail.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Leo Soares Passos <Leo.Bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
Message-ID: <arLD-eZ6dRvfZ52q@kernel.org>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org>
 <arKxjsxuO1F5ExrY@kernel.org>
 <arK5n9HrbZMCOHOt@google.com>
 <arK5ynpRi7VbY7Ek@gremlin>
 <arK8seJVT9wYgVCP@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arK8seJVT9wYgVCP@google.com>
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

On Tue, Sep 22, 2026 at 10:36:49AM -0700, Sean Christopherson wrote:
> On Tue, Sep 22, 2026, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Sep 22, 2026 at 10:23:43AM -0700, Sean Christopherson wrote:
> > > Rather than have kvm_arch_vcpu_allow_pre_fault_memory(), what if we add a more
> > > generic kvm_is_vcpu_loadable()?  That way we don't need to worry as much about
> > > the return value, the connection to vcpu_load() is obvious, and we don't need to
> > > add another pre-check if future (or cleaned-up existing?) ioctls want to do
> > > vcpu_load() in common code.
> > 
> > ...this is exactly what I started out with.
> > 
> > But then you are in a pickle, because _really_ you need to do that check in
> > vcpu_load(). Which is a void function. Which is called by every single
> > architecture all over the place.
> > 
> > So you'd have actually no way of signalling the error back.
> > 
> > Of course those places are arch code and you could say 'arches should know
> > better and if they call it it's fine not to call the arch 'can you load'
> > function.
> 
> Yes, that's my vote.  It'd be easy enough to clarify that "rule" with a comment
> in linux/kvm_host.h.

I feel like trying to make this generic will wind up under-documenting
the single example we have with the pre fault ioctl. Putting the comment
into a header practically guarantees that nobody will read it either.

I'd favor doing something like below and sticking the comment inline in
the ioctl handler. Unless I'm missing something blatantly obvious, I
don't see why the x86 or s390 pre-conditions can't be tested early too.

But I don't care enough to bikeshed this any further.

Thanks,
Oliver

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8b080804bc90..396e64875fe7 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1852,6 +1852,14 @@ static int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 	return __kvm_arm_vcpu_set_events(vcpu, events);
 }
 
+int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
+{
+	if (!kvm_vcpu_initialized(vcpu))
+		return -ENOEXEC;
+
+	return 0;
+}
+
 long kvm_arch_vcpu_ioctl(struct file *filp,
 			 unsigned int ioctl, unsigned long arg)
 {
diff --git a/arch/s390/kvm/s390/s390.c b/arch/s390/kvm/s390/s390.c
index 5c73f43782a7..47fe032444f4 100644
--- a/arch/s390/kvm/s390/s390.c
+++ b/arch/s390/kvm/s390/s390.c
@@ -5784,6 +5784,14 @@ void kvm_arch_commit_memory_region(struct kvm *kvm, struct kvm_memory_slot *old,
 	s390_kvm_mmu_commit_memory_region(kvm, old, new, change);
 }
 
+int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
+{
+	if (kvm_is_ucontrol(vcpu->kvm))
+		return -EINVAL;
+
+	return 0;
+}
+
 /**
  * kvm_arch_vcpu_pre_fault_memory() -- pre-fault and link gmap dat tables
  * @vcpu: the vcpu that shall appear to have generated the fault-in.
@@ -5810,9 +5818,6 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu, struct kvm_pre_fault_
 	gpa_t end;
 	int rc;
 
-	if (kvm_is_ucontrol(vcpu->kvm))
-		return -EINVAL;
-
 	rc = kvm_s390_faultin_gfn(vcpu, NULL, &f);
 	if (rc == PGM_ADDRESSING)
 		return -ENOENT;
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 064ecc33b926..c35fd2868c20 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5086,6 +5086,14 @@ static int kvm_tdp_page_prefault(struct kvm_vcpu *vcpu, gpa_t gpa,
 	}
 }
 
+int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
+{
+	if (!vcpu->kvm->arch.pre_fault_allowed)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 				    struct kvm_pre_fault_memory *range)
 {
@@ -5095,9 +5103,6 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 	u64 end;
 	int r;
 
-	if (!vcpu->kvm->arch.pre_fault_allowed)
-		return -EOPNOTSUPP;
-
 	if (kvm_is_gfn_alias(vcpu->kvm, gpa_to_gfn(range->gpa)))
 		return -EINVAL;
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 03bfc92864b6..bff842548c04 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1693,6 +1693,7 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
 bool kvm_arch_dy_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_preempted_in_kernel(struct kvm_vcpu *vcpu);
+int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu);
 void kvm_arch_pre_destroy_vm(struct kvm *kvm);
 void kvm_arch_create_vm_debugfs(struct kvm *kvm);
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 65eb26a0520d..07f2ce7a3cb3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3961,6 +3961,11 @@ bool __weak kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu)
 	return false;
 }
 
+int __weak kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+
 void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
 {
 	int nr_vcpus, start, i, idx, yielded;
@@ -4353,7 +4358,7 @@ static int kvm_vcpu_ioctl_get_stats_fd(struct kvm_vcpu *vcpu)
 static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 				     struct kvm_pre_fault_memory *range)
 {
-	int idx;
+	int idx, ret;
 	long r;
 	u64 full_size;
 
@@ -4365,6 +4370,14 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 	    range->gpa + range->size <= range->gpa)
 		return -EINVAL;
 
+	/*
+	 * Certain architectures (e.g. arm64) need to reject the ioctl 'early'
+	 * before vcpu_load().
+	 */
+	ret = kvm_arch_pre_fault_allowed(vcpu);
+	if (ret)
+		return ret;
+
 	vcpu_load(vcpu);
 	idx = srcu_read_lock(&vcpu->kvm->srcu);

Thanks,
Oliver

