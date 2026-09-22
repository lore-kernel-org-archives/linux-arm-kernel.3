Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E081EC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hL0Li77JYhUykO/PcEIaG0Lr5kXBzYPYWXnvLOO0g1s=; b=tvOtlfsiE534c/LGzUN+5zIFoC
	/Tog2Xe/tBBRLjpjHT3jGOxnurMmtMH5GBQ5Ff8EE07aebKM9CgVhjY3CqO1nl8PGmUIUCxiSgSEb
	36btX4oxx2M58P4vNL36HmgqBuVLRN/0q/EZZGdMZJuki3ilFhktAUhYJ8OitVaESCoy8amDjRJtq
	FXDeJ8RP5LVVdgkGDtFvmk4QtN0q0qT9pCdhFiYaGiLWgxP5obb0KViqgIP5Km1uraaI4mvq3zSc2
	dFaxNv34sju5XOTmDUKc418f3ZiYFmh8gERaV5nkpW0dp5fpGsI4JZFfCCp9GoriG2XCS0UzFEsBk
	Bb+79T3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91K7-00000005eAS-23Sj;
	Tue, 22 Sep 2026 14:18:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91K4-00000005e9n-0P2L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:18:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5F4843EEF;
	Tue, 22 Sep 2026 14:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1641F00893;
	Tue, 22 Sep 2026 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790086695;
	bh=hL0Li77JYhUykO/PcEIaG0Lr5kXBzYPYWXnvLOO0g1s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O8GdP5ha9c+k9+oOKFcpcha3fi6tMAnBquRG3oH7rwacA3peCM0pjg53ElzhgR5nc
	 lb7A6bYwXCU4y+prUCbDS6cE7qV1ezapEQzgCwaDkENa/p56W3Nu8/vTkITVHqxoK/
	 d4iQfXfHCnWijYTvht/Ww8x9G4fxbfefGFi/9ID54mV3mUCl+lrC6RWm6B8fvRo15u
	 wq1hZBWxC2uItwjsjOQCTWA66fTBoHKLO53YKPXjOvJrcgwirPVUWrYjSXD63D2PUn
	 vv+GWtwK0S0K1Qshz2x+hTZ7/MIDwBQ851dNZSkNuIvKnO5z9E3acwy6cDm/U6jE4r
	 AhJqf0zQnzMWA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 22 Sep 2026 15:17:55 +0100
Subject: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
In-Reply-To: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Randy Dunlap <rdunlap@infradead.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
 Jack Thomson <jackabt.amazon@gmail.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Vincent Donnefort <vdonnefort@google.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2328; i=ljs@kernel.org;
 h=from:subject:message-id; bh=n2iNqrUWXUV6kG9gmr7Ss+/9sq490YsJlL1ITkgMOl8=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI29Ulw6bSX8/x6eEtmwteg4PN61fYFF3fqN35wF6plV
 27t8XfuKGVhEONikBVTZHn+RXx/kEjYvM4L/m4wc1iZQIYwcHEKwEQe3WP4Hx5zzc3eN/nUmp8r
 f0V7M/E+OfLUaslcTmVHk+z5sXX8xYwMTxUEOZ5Hrv+XzLPxnrNLzOT0+pvicvo3H79/9z0+RlK
 ZFwA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

Currently kvm_vcpu_pre_fault_memory() is the only place where generic code
can call vcpu_load() on a vCPU that has not yet been initialised.

This can be problematic, as being uninitialised, a vCPU might not be in a
state where it is correct to do so.

Provide kvm_arch_vcpu_allow_pre_fault_memory() to allow architectures to
override this behaviour before the load is attempted.

Implement it as a __weak symbol defaulting to the current state where it is
always permitted.

This lays the foundation for a future change which implements pre-faulting
for arm64 which will wish to disallow this for uninitialised vCPUs.

As no architecture currently overrides it, no functional change intended.

Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 include/linux/kvm_host.h | 1 +
 virt/kvm/kvm_main.c      | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 03bfc92864b6..c11fda8704a3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1693,6 +1693,7 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
 bool kvm_arch_dy_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_preempted_in_kernel(struct kvm_vcpu *vcpu);
+bool kvm_arch_vcpu_allow_pre_fault_memory(struct kvm_vcpu *vcpu);
 void kvm_arch_pre_destroy_vm(struct kvm *kvm);
 void kvm_arch_create_vm_debugfs(struct kvm *kvm);
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 65eb26a0520d..9662baf2bfca 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3961,6 +3961,11 @@ bool __weak kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu)
 	return false;
 }
 
+bool __weak kvm_arch_vcpu_allow_pre_fault_memory(struct kvm_vcpu *vcpu)
+{
+	return true;
+}
+
 void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
 {
 	int nr_vcpus, start, i, idx, yielded;
@@ -4365,6 +4370,9 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 	    range->gpa + range->size <= range->gpa)
 		return -EINVAL;
 
+	if (!kvm_arch_vcpu_allow_pre_fault_memory(vcpu))
+		return -ENOEXEC;
+
 	vcpu_load(vcpu);
 	idx = srcu_read_lock(&vcpu->kvm->srcu);
 

-- 
2.55.0


