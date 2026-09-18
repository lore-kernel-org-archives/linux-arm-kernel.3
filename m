Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A64C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ATSv76TzecJnDtgNPntPTTTtbBbxD7pM0qiupKLf72U=; b=tLs75tEeKX2jen1yPXJdpDep/i
	6jrAbkYijFYAweZb0Kq3vkNZjzdqIDdMI9G40XmqLPcBkLfR3ln2+ix0MtzkCEMrrGgqmheSnmrgN
	yLsksY2BhfmeWtoJDydDK7/FYHxEKWtpr0Bv2r4zLWt+/q2fW9SMDLIAoeiIK9oKGa34I1aAp/eSL
	qOp27PN2m6YMfHBSjHPzOWMDD62gJ9U/u1xC41EL8JxIv6IGFuC1oOXTvTYm51I6q8GWHTQB4ueS4
	C7otffvZm+6YpXnXAhMbM1ykU+G9Uq3nFSR8oX6v0i+6Jx6pXdVkIA4kDuAjmmOO3z8vujUH7Syag
	ginC/jYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XLv-0000000EK4l-2ont;
	Fri, 18 Sep 2026 12:06:03 +0000
Received: from out-67.mta0.migadu.com ([2001:41d0:1004:224b::43] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XLs-0000000EK3W-08TA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 12:06:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=GQDpK0dc1fRX5xqYlgvNb2kn+E+OlZng7gkPioKRS90=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789733158; v=1; x=1790337958;
 b=khqJ+9GZiuJ1ZP+SQKoK3VQx6poPai44MRzzoEo8XFFNK5cKHZoJTsVpGEkYcL90ZWotBEUk
 mFXmRxCVTx1Q716ywLagGhulelI76nV8i/LBRoeqk0TzORZcd09xC5bEhbd11YR7njZMjHi5/uI
 UjGjt4jW6zwIEor5E01W7ClQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4620aac8f7d1920a;
	Fri, 18 Sep 2026 12:05:58 +0000
X-Mizu-Trace-ID: 4620aac8f7d1920a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Jack Thomson <jackabt@amazon.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH] KVM: arm64: Restore the VM's feature bitmap when kvm_setup_vcpu() fails
Date: Fri, 18 Sep 2026 13:05:53 +0100
Message-Id: <20260918120553.163139-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_050600_215942_CC95FC80 
X-CRM114-Status: GOOD (  14.83  )
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

__kvm_vcpu_set_target() copies the requested features into the VM-wide
bitmap before kvm_setup_vcpu() runs and doesn't undo it when setup
fails, so a rejected KVM_ARM_VCPU_INIT leaves the VM recording features
that were never set up. With HAS_EL2 | HAS_EL2_E2H0 on a host without
FEAT_NV1, kvm_vcpu_init_nested() returns -EINVAL before it allocates any
nested stage-2 MMU, and vcpu_has_nv() is then true with
nested_mmus_size == 0; its -ENOMEM paths do the same on a VM's first
INIT.

Nothing in the tree loads a vCPU whose init failed, so this is latent.
The pending KVM_PRE_FAULT_MEMORY series for arm64 does, and the second
such load NULL-dereferences in get_s2_mmu_nested() under mmu_lock.

Setup reads the VM-wide bitmap, so the copy can't be deferred; restore
the previous value instead when kvm_setup_vcpu() fails.

Fixes: 1de10b7d13a97 ("KVM: arm64: Get rid of vCPU-scoped feature bitmap")
Fixes: 427733579744e ("KVM: arm64: Select default PMU in KVM_ARM_VCPU_INIT handler")
Link: https://lore.kernel.org/r/20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
The series' generic kvm_vcpu_pre_fault_memory() calls vcpu_load()
before any arm64 hook, so there is no arm64 check it can pass through
first. Reproduced on kvmarm/next plus the series under
QEMU (-cpu max with an Apple M2 MIDR, which has_nv1() denies;
kvm-arm.mode=nested): KVM_ARM_VCPU_INIT with HAS_EL2 | HAS_EL2_E2H0
returns -EINVAL, then KVM_PRE_FAULT_MEMORY twice. The first call loads
with hw_mmu still the canonical MMU and its vcpu_put() clears hw_mmu;
the second takes the !hw_mmu path into get_s2_mmu_nested(), whose
search over nested_mmus_size == 0 leaves s2_mmu NULL for the
BUG_ON(atomic_read(&s2_mmu->refcnt)):

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000074
  Call trace:
   kvm_vcpu_load_hw_mmu+0x94/0x2c0 (P)
   kvm_arch_vcpu_load+0x2a8/0x5e8
   kvm_vcpu_pre_fault_memory+0xa0/0x1b8
   kvm_vcpu_ioctl+0x40c/0x6d0

The thread dies with mmu_lock held for write and an RCU stall in
queued_write_lock_slowpath() follows. With the fix both calls return
-ENOENT and the host is unaffected. Applies unchanged to v7.3-rc3.

 arch/arm64/kvm/arm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index eaf583b771931..c2eb9b6da80f4 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1685,6 +1685,7 @@ static int kvm_setup_vcpu(struct kvm_vcpu *vcpu)
 static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
 				 const struct kvm_vcpu_init *init)
 {
+	DECLARE_BITMAP(old_features, KVM_VCPU_MAX_FEATURES);
 	unsigned long features = init->features[0];
 	struct kvm *kvm = vcpu->kvm;
 	int ret = -EINVAL;
@@ -1695,11 +1696,17 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
 	    kvm_vcpu_init_changed(vcpu, init))
 		goto out_unlock;
 
+	/* Setup reads the VM-wide bitmap, so undo the copy if setup fails. */
+	bitmap_copy(old_features, kvm->arch.vcpu_features,
+		    KVM_VCPU_MAX_FEATURES);
 	bitmap_copy(kvm->arch.vcpu_features, &features, KVM_VCPU_MAX_FEATURES);
 
 	ret = kvm_setup_vcpu(vcpu);
-	if (ret)
+	if (ret) {
+		bitmap_copy(kvm->arch.vcpu_features, old_features,
+			    KVM_VCPU_MAX_FEATURES);
 		goto out_unlock;
+	}
 
 	/* Now we know what it is, we can reset it. */
 	kvm_reset_vcpu(vcpu);

base-commit: 089e4f3c4862ba3f29dff2361caa8084879194fd
-- 
2.39.5


