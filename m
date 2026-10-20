Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD62606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BYuYE6/O;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RoToV5D8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lMJm3X8wFtXe66OPPwiKiE4WIXPVW/SEHFXXFjYPF+k=; b=BYuYE6/O2S+plO+Z9lNkMx+9t0
	clhzh3aYdlmiRo3SLPv0IyWgj1KxSuWQ0nu7y4/QPQGF6U+3kUMcIRYv1QMqebJg+caRlMzhPbkks
	bngWNCymvpTeQa6MdX0n77HDLLvyCxgHKpQjy6XFnIYULqEvPF/gCI/6ey7zNr0kG9Z55B1cofRmf
	210S0W8RVwQ+Vze8eds/0mwXFvRF9ufGmTgBipAyfaNeEAft5PXWbzyAVMLFsmV8QiLjaXD0EmXl4
	h9Gf/yWKuV0/DgswftSpJdrvI2pgogNQUujXMrSC9NngH0q0XLDHYy1/tRlWOk9aOHAHH+TxBvZWR
	2eVFmCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4VI-000000094So-0b2O;
	Tue, 20 Oct 2026 07:43:24 +0000
Received: from out-111.mta1.migadu.com ([2001:41d0:203:375::6f] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4VC-000000094Qw-4A7d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 07:43:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=LiHaq6+uFROwaYPn/aBBgjxC+LLOn4WfwOUQ+ggb2Q8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792482195; v=1; x=1793086995;
 b=RoToV5D88s+vEXP365r19Pyckk6gqN31ERPaxcRKnxVod5rP6xl2YKTkNN+P7PiwdfNyDxmM
 LpMInSqI84oVBPO9+0//18/I1ikM/8SzWhNWphDpYnx8+ewK/mh1n2TnZFDkZpcN08mT5JIZLyd
 5P8qqPFGSU55Bd+ZOQT6d63w=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1d3d4c1ab1469a46;
	Tue, 20 Oct 2026 07:43:15 +0000
X-Mizu-Trace-ID: 1d3d4c1ab1469a46
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: Ensure TLBs and I-cache are private to each vCPU in pKVM
Date: Tue, 20 Oct 2026 08:43:11 +0100
Message-ID: <20261020074311.1873316-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_004319_255561_C0529413 
X-CRM114-Status: GOOD (  18.36  )
X-Spam-Score: -2.1 (--)
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

All vCPUs of a VM share its VMID, so KVM flushes a physical CPU's TLBs
and I-cache for the VM whenever a different vCPU of that VM is loaded
there. pKVM guests, protected or not, run on the hypervisor's stage-2
and VMID, and the host doesn't flush for them. Nothing at EL2 flushes
instead, so a vCPU can hit TLB and I-cache entries that another vCPU of
the same VM left on that CPU.

Track at EL2 the last vCPU of each VM loaded on each CPU, and flush
when it changes. EL2 can't allocate per-CPU memory for each VM, as the
host does, so use one per-CPU array indexed by the VM's table entry.
Reset the entry's slot on every CPU when a VM reserves it, so that a new
VM starts with no last vCPU, whether the entry is unused or was left by
a VM that was torn down.

Fixes: fce886a602073 ("KVM: arm64: Plumb the pKVM MMU in KVM")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
Changes since v1 [1]:
  - Dropped patch 1, which added a CPU number at EL2. The last vCPU is
    now tracked in a per-CPU array indexed by VM table entry. (Marc)
  - Moved the check from __pkvm_vcpu_load() to pkvm_load_hyp_vcpu().
  - The array is unsigned int, initialised to UINT_MAX. (Vincent)
  - Dropped Joey's Reviewed-by, since the patch changed.

Based on kvmarm/next (dd0bc00e3e920).

[1] https://lore.kernel.org/all/20261014125510.2928306-1-fuad.tabba@linux.dev/

 arch/arm64/kvm/hyp/nvhe/pkvm.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index ac020d0501d2e..1fc59229c8e86 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -38,6 +38,9 @@ unsigned int kvm_host_sve_max_vl;
  */
 static DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, loaded_hyp_vcpu);
 
+/* Per VM table entry, the vcpu_idx of the last vCPU of that VM loaded on this CPU. */
+static DEFINE_PER_CPU(unsigned int, last_vcpu_ran[KVM_MAX_PVMS]);
+
 static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.hcr_el2 = HCR_GUEST_FLAGS;
@@ -261,6 +264,7 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu = NULL;
 	struct pkvm_hyp_vm *hyp_vm;
+	unsigned int *last_ran;
 
 	/* Cannot load a new vcpu without putting the old one first. */
 	if (__this_cpu_read(loaded_hyp_vcpu))
@@ -290,8 +294,18 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 unlock:
 	hyp_spin_unlock(&vm_table_lock);
 
-	if (hyp_vcpu)
-		__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
+	if (!hyp_vcpu)
+		return NULL;
+
+	__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
+
+	/* TLBs and I-cache are private to each vCPU, see vcpu_prepare_mmu(). */
+	last_ran = this_cpu_ptr(&last_vcpu_ran[vm_handle_to_idx(handle)]);
+	if (*last_ran != vcpu_idx) {
+		__kvm_flush_cpu_context(hyp_vcpu->vcpu.arch.hw_mmu);
+		*last_ran = vcpu_idx;
+	}
+
 	return hyp_vcpu;
 }
 
@@ -652,6 +666,7 @@ static int find_free_vm_table_entry(void)
  */
 static int allocate_vm_table_entry(void)
 {
+	unsigned int cpu;
 	int idx;
 
 	hyp_assert_lock_held(&vm_table_lock);
@@ -670,6 +685,9 @@ static int allocate_vm_table_entry(void)
 
 	vm_table[idx] = RESERVED_ENTRY;
 
+	for (cpu = 0; cpu < hyp_nr_cpus; cpu++)
+		per_cpu(last_vcpu_ran[idx], cpu) = UINT_MAX;
+
 	return idx;
 }
 

base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.47.3


