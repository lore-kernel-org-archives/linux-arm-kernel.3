Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142AECD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDGA18HTAV0ThIU0BAFgTVIo8XRGUa/0DFTVyMck6Rw=; b=NPZGaxo4yPPIKRrhJ6ay9qtTvE
	QlXfHuCNbb1AmvLwxNTtgzJTYBbiX8hqNzd6juIGhY7T5xXNb/noand9drtpSUXDgQmX9ZFI8f96x
	OVe2V13BYKj8wbFRb/F+0G8pn73NfuUrs3euVRWu5i4/KGH+zwrHFzOuSos+ERbRcS5l7KrX2Dt80
	HU4YfrTGgZ0yxbDbWmq/RjKfiz4JTTU5rviFgXmPn0iFqxowrjvUcllkhSKpp6Fm2LmBWcalMG9oU
	Dij3j9bkEZYLp4ak9T7mZ5fEKNzZVuEWH6oCBLWYPv+bhIkuze6sodjxyPnWNWbMDPLpn0ko/J0UF
	HLRixK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXTS-00000003Ls5-04ad;
	Mon, 08 Jun 2026 10:44:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXTQ-00000003LrC-0Pm0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:44:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF1073552;
	Mon,  8 Jun 2026 03:44:45 -0700 (PDT)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 458463F62B;
	Mon,  8 Jun 2026 03:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780915490; bh=cK2AElC/m1A4Wd8B2z5BpgPSrxgQ3DIYG331ZPkq9Ho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gZWtRGpAylKlA4WY3MUfSBlG106Zcq/UOfLJu7bkXyTMQo+EwKv+V15Fpzt4jnpnS
	 5AUmbRDy5iMF1XTuRFYZEE4iZ0GHBqOvofdLMDncTO+E0swVHzV5JAzJy4UDBob869
	 nIqzGDQ41SfNYqHrcctM5fDvLXd9JT6nEDyRiuDg=
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
Subject: [PATCH 1/1] KVM: arm64: Make kvm_s2_fault_pin_pfn() fault-in interruptible
Date: Mon,  8 Jun 2026 10:43:36 +0000
Message-Id: <20260608104336.2405384-2-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608104336.2405384-1-justin.he@arm.com>
References: <20260608104336.2405384-1-justin.he@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_034452_234064_250691E8 
X-CRM114-Status: GOOD (  16.17  )
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

arm64 KVM faults guest memory into the host in kvm_s2_fault_pin_pfn() via
__kvm_faultin_pfn(). Today this request is made non-interruptible, so if
the host fault-in path blocks for a long time, a vCPU thread that already
has a pending signal cannot leave the fault-in path until GUP eventually
completes.

This is particularly painful during VM teardown, where userspace may
signal vCPU threads while they are blocked faulting in guest memory. In
that case there is no benefit in continuing to wait for the fault to
complete; the vCPU should return to userspace and let the pending signal
be handled.

Ask the generic KVM fault-in helper to use FOLL_INTERRUPTIBLE. When GUP
reports a pending signal it returns KVM_PFN_ERR_SIGPENDING; handle it by
calling kvm_handle_signal_exit() and returning -EINTR. This matches the
behaviour expected by the generic KVM fault-in path and mirrors the
signal-exit handling already done by the arm64 run loop, which sets
run->exit_reason = KVM_EXIT_INTR before returning to userspace. It is
also consistent with architectures such as x86 that already allow the
fault-in to be interrupted by pending signals.

The interrupted fault does not install a partial stage-2 mapping: the
-EINTR is returned before any mapping is created, so the fault is simply
retried on a subsequent vCPU entry once userspace re-enters KVM_RUN. The
only observable effect in the absence of a pending signal is none; this
does not make ordinary stage-2 faults abortable.

Signed-off-by: Jia He <justin.he@arm.com>
---
 arch/arm64/kvm/mmu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4da9281312eb..dfb779e6d792 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1872,19 +1872,27 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
 				struct kvm_s2_fault_vma_info *s2vi)
 {
 	int ret;
+	unsigned int flags = FOLL_INTERRUPTIBLE;
 
 	ret = kvm_s2_fault_get_vma_info(s2fd, s2vi);
 	if (ret)
 		return ret;
 
+	if (kvm_is_write_fault(s2fd->vcpu))
+		flags |= FOLL_WRITE;
+
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
 
-- 
2.34.1


