Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7F8CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h7faoyGZs3OJkuFbiA3Gvd2LN1DYn4vSLLXoTLlzgg8=; b=ZjkDpzCxKkkAal
	J20Wvhv3B8mku6TdnpF6qGMfJntQLjRkGhDhC1ylZITGGvMfF7Ph44UtACfkTqLqTolIepeHz5OuC
	0/roANaamIg1rUgj0BDUPrjhRy+wZ1vBFMJTCffkc+V/PmSd2zLNjUtZUjSuViNDCMuAftBAOutSC
	97yaSXQEMkfWpgPnhrsBjzQwQkMkZTFU6eS6iH8VuzABSYA3GpO5ibfH2nbnaXCzFuwZ9gNHXMu16
	/GIGEgydnmn+e7f5H44vnnlJKyruzMyTX8K2BSaZuCqA+rYXA/SpqDmNdyTGc1AqAouLuXUjMf3FG
	ekwUd4ZY1H45Eywy95cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt4Y-00000005FD3-1by1;
	Tue, 09 Jun 2026 09:48:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt4U-00000005FC3-3bNg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:48:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F29302680;
	Tue,  9 Jun 2026 02:48:27 -0700 (PDT)
Received: from entos-yitian-01.Arm.com (unknown [10.168.197.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80E3B3FE53;
	Tue,  9 Jun 2026 02:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780998512; bh=WJQY5ou3eMvIN8qfMQO/miWVII6tdbQNF9XnBaEKqc0=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=iFWwP7thd8N0A0OFADiu87+hSKOky73VuRNwTZyZiOGcCFhppSimmQkqN8N8/tseE
	 FeY0Tgb3rEKQRxbk4d18EvYkfad4l3H2KeL6T6El4Vq3QOGxUqf1PllCwhwdikVAi1
	 jsFMeimwWxY6/6Y7wbdFpT2RpRvcaXu7u4gpEUjg=
From: Jia He <justin.he@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jia He <justin.he@arm.com>
Subject: [PATCH v2] KVM: arm64: Make guest memory fault-in interruptible
Date: Tue,  9 Jun 2026 09:48:18 +0000
Message-Id: <20260609094818.498775-1-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_024834_988807_E1062118 
X-CRM114-Status: GOOD (  19.89  )
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
Reply-To: 20260608104336.2405384-2-justin.he@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

arm64 KVM faults guest memory into the host in kvm_s2_fault_pin_pfn(),
kvm_translate_vncr() (for NV's VNCR page) and pkvm_mem_abort() (for
protected guests). Today these requests are made non-interruptible, so
if the host fault-in path blocks for a long time, a vCPU thread that
already has a pending signal cannot leave the fault-in path until GUP
eventually completes.

This is particularly painful during VM teardown, where userspace may
signal vCPU threads while they are blocked faulting in guest memory. In
that case there is no benefit in continuing to wait for the fault to
complete; the vCPU should return to userspace and let the pending signal
be handled.

Ask the generic KVM fault-in helper to use FOLL_INTERRUPTIBLE (and pass
the same flag to pin_user_pages() for the pKVM path). When GUP reports a
pending signal, __kvm_faultin_pfn() returns KVM_PFN_ERR_SIGPENDING and
pin_user_pages() returns -EINTR; handle both by calling
kvm_handle_signal_exit() and returning -EINTR. This mirrors the
signal-exit handling already done by the arm64 run loop, which sets
run->exit_reason = KVM_EXIT_INTR before returning to userspace. It is
also consistent with x86, which already allows the fault-in to be
interrupted by pending signals.

For the VNCR path, kvm_handle_vncr_abort() handles -EINTR before the
translation-failure path. A signal-interrupted host fault-in is not a VNCR
translation failure: kvm_translate_vncr() has already prepared the signal
exit, while the failure path assumes vt->wr.failed is set and would
otherwise trip BUG_ON(!vt->wr.failed).


The interrupted fault does not install a partial stage-2 mapping: the
-EINTR is returned before any mapping is created, so the fault is simply
retried on a subsequent vCPU entry once userspace re-enters KVM_RUN.
Ordinary stage-2 faults continue to complete as before unless the task
already has a pending signal while blocked in the fault-in path.

Signed-off-by: Jia He <justin.he@arm.com>
---
Changelog:
v2:
- Also make the VNCR (kvm_translate_vncr) and pKVM (pkvm_mem_abort)
  fault-in paths interruptible, not just kvm_s2_fault_pin_pfn(); retitle
  accordingly. (Marc)
v1: https://lkml.org/lkml/2026/6/8/1033

 arch/arm64/kvm/mmu.c    | 15 +++++++++++++--
 arch/arm64/kvm/nested.c | 19 +++++++++++++++++--
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4da9281312eb..f1dce829fefe 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1675,7 +1675,8 @@ struct kvm_s2_fault_vma_info {
 
 static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
-	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
+	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE |
+			     FOLL_INTERRUPTIBLE;
 	struct kvm_vcpu *vcpu = s2fd->vcpu;
 	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
 	struct mm_struct *mm = current->mm;
@@ -1701,6 +1702,10 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		kvm_send_hwpoison_signal(s2fd->hva, PAGE_SHIFT);
 		ret = 0;
 		goto dec_account;
+	} else if (ret == -EINTR) {
+		/* GUP was interrupted by a pending signal, return to userspace. */
+		kvm_handle_signal_exit(vcpu);
+		goto dec_account;
 	} else if (ret != 1) {
 		ret = -EFAULT;
 		goto dec_account;
@@ -1872,19 +1877,25 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
 				struct kvm_s2_fault_vma_info *s2vi)
 {
 	int ret;
+	unsigned int flags = FOLL_INTERRUPTIBLE |
+			     (kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0);
 
 	ret = kvm_s2_fault_get_vma_info(s2fd, s2vi);
 	if (ret)
 		return ret;
 
 	s2vi->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, s2vi),
-				      kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
+				      flags,
 				      &s2vi->map_writable, &s2vi->page);
 	if (unlikely(is_error_noslot_pfn(s2vi->pfn))) {
 		if (s2vi->pfn == KVM_PFN_ERR_HWPOISON) {
 			kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi->vma_pagesize));
 			return 0;
 		}
+		if (is_sigpending_pfn(s2vi->pfn)) {
+			kvm_handle_signal_exit(s2fd->vcpu);
+			return -EINTR;
+		}
 		return -EFAULT;
 	}
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 883b6c1008fb..6b4161327222 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1312,8 +1312,16 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 
 	*is_gmem = kvm_slot_has_gmem(memslot);
 	if (!*is_gmem) {
-		pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
-					&writable, &page);
+		unsigned int flags = FOLL_INTERRUPTIBLE;
+
+		if (write_fault)
+			flags |= FOLL_WRITE;
+
+		pfn = __kvm_faultin_pfn(memslot, gfn, flags, &writable, &page);
+		if (is_sigpending_pfn(pfn)) {
+			kvm_handle_signal_exit(vcpu);
+			return -EINTR;
+		}
 		if (is_error_noslot_pfn(pfn) || (write_fault && !writable))
 			return -EFAULT;
 	} else {
@@ -1436,6 +1444,13 @@ int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu)
 			/* Hack to deal with POE until we get kernel support */
 			inject_vncr_perm(vcpu);
 			break;
+		case -EINTR:
+			/*
+			 * The fault-in was interrupted by a pending signal;
+			 * kvm_translate_vncr() has already set up the signal
+			 * exit. Return to userspace and retry on re-entry.
+			 */
+			return -EINTR;
 		case 0:
 			break;
 		}
-- 
2.34.1


