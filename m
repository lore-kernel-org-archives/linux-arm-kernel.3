Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FC1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=169iT0nuLvjss1U5Hfqk0EXDz+/mUca14KePwGY5pIg=; b=Oh8ehptNhZ5q5QfMbueVCnpMJt
	upJ62legbSD8T514tatTynSzsFluU6+90d8Y2WM6FTDBLQbqAUdSmFi2YcW2Uano/mQfEhlsgoUOh
	vTTleIz/EIBg+XQ1Z6fNFsBVVKTnus8wWdDiABfTB0rm2dIYG7orJ4MU1EGkCoCNPQSy7oGCyHdSM
	Cmtn8qSjk0m7PTJlsBlCyPEAqQGBXcDohhmp+vahi1hDlVGPwErUR1NpwjbmRBML8OzhMRz/hsGNG
	SSwqUao/3vpDQJ1sV5wv7lbEmiE7cbbfcocTaVpOoPxtEphU/pQCe8WU1qF/SKt72Ngt6w3TrBNLR
	l54+a/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIQC-00000004dD7-3aSP;
	Thu, 02 Jul 2026 14:29:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIQ9-00000004dAu-3JjS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:29:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B034B35A9;
	Thu,  2 Jul 2026 07:29:35 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14D143F673;
	Thu,  2 Jul 2026 07:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783002580; bh=w+NbXwKAIW7ubnglHnIYpYU4wgga2hwuJJ22J62RMhE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dyikDXoMmatQc4kbecYjPHK+sjxUtKJu9fZ7dqWWWLF5EwO3YkW4ojNEJ+bjKhOuT
	 IKJSHuVGDPGJnyv1cUkulMXf/r9d3BBJh7eQnk4cZmaeLfyd/s1ucUrtmvC++QqVwa
	 s5ufSILacqw3WrVX+mmjf+1gOjRYIiGKMVSgP4D8=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: pbonzini@redhat.com,
	kvm@vger.kernel.org,
	seanjc@google.com,
	david.hildenbrand@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	fuad.tabba@linux.dev,
	mark.rutland@arm.com
Subject: [RFC PATCH 3/3] KVM: arm64: Allow dirty page logging for guest_memfd-only memslots
Date: Thu,  2 Jul 2026 15:29:12 +0100
Message-ID: <20260702142912.6395-4-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702142912.6395-1-alexandru.elisei@arm.com>
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_072941_919981_286AB9E3 
X-CRM114-Status: GOOD (  13.94  )
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

Everything is in place to allow dirty page logging for guest_memfd-only
memslots, advertise it to userspace.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/arm.c | 22 ++++++++++++++++++++++
 arch/arm64/kvm/mmu.c |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 50adfff75be8..e92e5d7b533a 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -393,6 +393,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_COUNTER_OFFSET:
 	case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
 	case KVM_CAP_ARM_SEA_TO_USER:
+#ifdef CONFIG_KVM_GUEST_MEMFD
+	case KVM_CAP_GUEST_MEMFD_MMAP_LOG_DIRTY_PAGES:
+#endif
 		r = 1;
 		break;
 	case KVM_CAP_SET_GUEST_DEBUG2:
@@ -493,6 +496,25 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	return r;
 }
 
+#ifdef CONFIG_KVM_GUEST_MEMFD
+bool kvm_arch_supports_gmem_mmap_dirty_logging(struct kvm *kvm)
+{
+	/*
+	 * Protected pKVM VMs don't allow dirty page logging, fail early here
+	 * instead of in kvm_arch_prepare_memory_region().
+	 *
+	 * KVM_CAP_GUEST_MEMFD_MMAP_LOG_DIRTY_PAGES is not available for a
+	 * protected pKVM VM, and returning false means that
+	 * KVM_SET_USER_MEMORY_REGION2 fails with EINVAL, which is consistent
+	 * with unsupported memslot flags.
+	 */
+	if (!is_protected_kvm_enabled())
+		return true;
+
+	return kvm_pkvm_ext_allowed(kvm, KVM_CAP_GUEST_MEMFD_MMAP_LOG_DIRTY_PAGES);
+}
+#endif
+
 long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg)
 {
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6c941aaa10c6..f6e6de153ce2 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1648,7 +1648,8 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 		return ret;
 	}
 
-	if (!(s2fd->memslot->flags & KVM_MEM_READONLY))
+	if (!(s2fd->memslot->flags & KVM_MEM_READONLY) &&
+	    (!kvm_slot_dirty_track_enabled(s2fd->memslot) || write_fault))
 		prot |= KVM_PGTABLE_PROT_W;
 
 	if (s2fd->nested)
-- 
2.43.0


