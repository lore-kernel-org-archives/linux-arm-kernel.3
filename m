Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03EECCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vbcLPl9Ae1u6zg9Rk4ugkwF/dOBqR4NA2hwmpe9z3s=; b=otXkXfdgRkFZ1cu5fY57V/RhJ6
	AQfwy3e7lRMhrqHaC6IhcFzy2cCRCY65aYpYRP1zYigVuk7OptOxolXy8v5cE11AUnPTs3n+KaLPl
	ejfXZkzTdbO5Au79ZR2PstfotKHUnmgpgf8v1Npa2/terYaqRgr6TKb5L+JrbEHrXBuagYGQVr+ep
	bTIvMlfVnKFYBQ/tadv+8/bPdzAvp13a27AZzaULXUbMfGgYLRhS8q2O6DHgs0/9fzukkdwmsCYJx
	Al1cGq+mJYprm/UvDq5wqgPPxfROHfPpu0gBKHBjCEkPRYIJEW+/T9vrn5WMTIazBNjQOAbZLWKcd
	zXcPIACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7dh-00000004xgg-1z03;
	Sat, 17 Oct 2026 16:52:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7df-00000004xfT-2N4W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 16:52:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 097A743A13;
	Sat, 17 Oct 2026 16:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527551F000C4;
	Sat, 17 Oct 2026 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792255926;
	bh=3vbcLPl9Ae1u6zg9Rk4ugkwF/dOBqR4NA2hwmpe9z3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XNhL7+OjP7duuKUengT2ZtHzLbuqJA4edwW1Wsuw0Huot//DZVqbUeBbdA/sCGeEc
	 Un3m8//Kel2+St8rtwJjI6X10WmS+tbiYYYjJ+3HTcoMVGDGcjlzhBvHP7IbL/S1Gx
	 9VW320qUeI+Q/sgmrRBHeDRNYvQqYqNge4M1I9/C4vfD2bdCZjhPpqskoY6DDTSThW
	 Il5+pAi3zJFblIW9RfwvlKgGvnowQtVRvFbdKW9chJzwv72i9cc6l3IpGo1jS1j3D7
	 PnQsQFG7CsQvDlgi4Eub+8HC1db2HPgqnH3SfTEJkxHjYAvP+D/nYmM1taUEuS2wwm
	 Nov3t9BtPRonA==
From: Sasha Levin <sashal@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] KVM: arm64: Take a protected vCPU's TWI and TWE only at vCPU load
Date: Sat, 17 Oct 2026 12:52:04 -0400
Message-ID: <20261017165204.3343275-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014162126.964330-1-maz@kernel.org>
References: <20261014162126.964330-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Commit 06499de8f998 ("KVM: arm64: Skip fixed-feature state flush for
protected vCPUs") moved the copy of the host's TWI and TWE in
flush_hyp_vcpu() into the non-protected branch: a protected vCPU takes
them in __pkvm_vcpu_load() instead, and only VSE comes from the host on
each entry.

Commit 04447b95c62b ("KVM: arm64: Use the host's HCR_EL2 for
non-protected VMs in pKVM") was written against the old code, where
both VM types took TWI, TWE and VSE on each entry, and kept that for a
protected VM as PKVM_HCR_EL2_HOST_PVM. The merge of the two applies
PKVM_HCR_EL2_HOST_PVM in the common path, so a protected vCPU takes TWI
and TWE from the host's vCPU on every entry again.

That doesn't change what a protected guest runs with today: once the
vCPU is initialised, the host only changes TWI and TWE in
vcpu_set_wfx_traps(), which pkvm_vcpu_load() calls right before
__pkvm_vcpu_load(). But it undoes part of 06499de8f998, and has EL2
read a protected vCPU's trap configuration from host memory on every
entry, which nothing needs.

Make PKVM_HCR_EL2_HOST_PVM VSE alone and add TWI and TWE to
PKVM_HCR_EL2_HOST_NPVM, so that each mask again lists what EL2 takes
from the host on each entry for its VM type. A non-protected VM takes
the same bits as before. Say in the comments that a protected vCPU's
TWI and TWE come at vCPU load.

llminus, an LLM-assisted merge conflict resolution tool, found the
difference while resolving the same conflict in an integration tree.

Fixes: 439d8f9cb01c ("Merge tag 'kvmarm-7.4' of git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
With KVM's own host code this changes nothing a guest can observe: the
per-entry copy writes back the TWI/TWE value __pkvm_vcpu_load() already
set. It restores the split 06499de8f998 made.

Marc's resolution in kvmarm/fixes, aca73c1d23f1 ("Merge branch
kvmarm-7.4 into kvmarm-master/fixes"), is the same as the one in
kvm/next, so this applies to both.

Build-tested only: arm64 defconfig with gcc and clang, W=1, no new
warnings. The only code generation change is the protected vCPU's
per-entry mask, 0x6100 to 0x100. Not runtime-tested, as the in-tree
selftests can't create protected VMs.

 arch/arm64/kvm/hyp/include/nvhe/pkvm.h | 13 +++++++------
 arch/arm64/kvm/hyp/nvhe/pkvm.c         |  5 ++++-
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index 4373e9b63e87f..0261b2bc681f7 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -14,13 +14,14 @@
 #include <nvhe/spinlock.h>
 
 /*
- * HCR_EL2 bits EL2 takes from the host on each entry, per VM type. The rest
- * are EL2's own and nothing the host sets there reaches the guest.
+ * HCR_EL2 bits EL2 takes from the host on each entry, per VM type. A protected
+ * VM also takes TWI and TWE, at vCPU load. The rest are EL2's own and nothing
+ * the host sets there reaches the guest.
  */
-#define PKVM_HCR_EL2_HOST_PVM	(HCR_EL2_TWI | HCR_EL2_TWE | HCR_EL2_VSE)
-#define PKVM_HCR_EL2_HOST_NPVM	(PKVM_HCR_EL2_HOST_PVM | HCR_EL2_VI | HCR_EL2_VF |	\
-				 HCR_EL2_TVM | HCR_EL2_TID2 | HCR_EL2_TID4 |		\
-				 HCR_EL2_TID5 | HCR_EL2_TTLBOS)
+#define PKVM_HCR_EL2_HOST_PVM	HCR_EL2_VSE
+#define PKVM_HCR_EL2_HOST_NPVM	(PKVM_HCR_EL2_HOST_PVM | HCR_EL2_TWI | HCR_EL2_TWE |	\
+				 HCR_EL2_VI | HCR_EL2_VF | HCR_EL2_TVM | HCR_EL2_TID2 |	\
+				 HCR_EL2_TID4 | HCR_EL2_TID5 | HCR_EL2_TTLBOS)
 
 /*
  * Holds the relevant data for maintaining the vcpu state completely at hyp.
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 237483d2442a5..fc0475f0877d1 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -38,7 +38,10 @@ unsigned int kvm_host_sve_max_vl;
  */
 static DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, loaded_hyp_vcpu);
 
-/* The PKVM_HCR_EL2_HOST_{PVM,NPVM} bits of this value come from the host on each entry. */
+/*
+ * The PKVM_HCR_EL2_HOST_{PVM,NPVM} bits of this value come from the host on
+ * each entry, and a protected vCPU's TWI and TWE at vCPU load.
+ */
 static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.hcr_el2 = HCR_GUEST_FLAGS;

base-commit: 2ea3a929fe01ec5ae7313a94badaf9b70a8c69b1
-- 
2.53.0


