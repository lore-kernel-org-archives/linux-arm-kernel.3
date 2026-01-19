Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3319CCF2F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+u6xUcDpIWMaZyT4FXHVL46Ns6QJOkJY3dmOZXEwDg=; b=iTGOJlxJNMoBiuKEfY904m76gG
	j200e+pcdJuRtulKOPpD/oc4mbkS1qRihxoCrM5VByC/ETnH9JONm4SChXr5JSk0rcpQK9Q2K3wx9
	IH38xyg95J1AwA1TidZMnlz7rdZe60suS5iEDQGJ2xsMp23bFIcdax/LyZa8ukmi3iaL2mcDbCl0h
	Ut+aozL9hAlXfGhY5tVrGhUkCUTOCiOiGqkodpiELx+tnqmkOePLaeyafpt7GZ4lrcVWxzBl50X6n
	35GJfUst4Kk1qChctW2BTtfTt4iysqRg0ypcVTiWb0hBb2Ad/ex7+hahozJbNmeXq5kaDVOqrc2Yr
	lbD1unYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofQ-000000023PJ-0fVk;
	Mon, 19 Jan 2026 12:47:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofE-000000023JI-40Wn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E7A460166;
	Mon, 19 Jan 2026 12:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75771C19424;
	Mon, 19 Jan 2026 12:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826844;
	bh=ufNwNnSfrHd6Z4/GzOKeFv+3tjFAU9R1kyG7siYhD68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TUzGfxrnzpudRB/fSHiC9+PbU7vJRCGKLv38QD1NmGqiYxCfD/6kIdh7vZz4Ch/O+
	 nadWVKsVqyEap/DOULNB/ib8jhcaXdw2FKZj9c/ibwqmW/cfBk0wYFbnTc9veR/Qy1
	 LcjKQSe9QBZzPLwuJmvsLbP0fzaQUcmLU1LMVqXTO9pEItOS4S7AtBCeeincshE9gg
	 bw4EB43F46qu8y3Gww5tKVMKR0OySwUJyRQbln6kJRW3ObMUGyGevIZIYkQJQ5XPS3
	 WZR6+a3TyMm8TF2pfLUhzqCAdD0INkR5VHSV7YUEks5k7gLtmQPKU793wb7/U3hahR
	 IURs9c9JVcYMg==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 10/35] KVM: arm64: Ignore -EAGAIN when mapping in pages for the pKVM host
Date: Mon, 19 Jan 2026 12:46:03 +0000
Message-ID: <20260119124629.2563-11-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
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

If the host takes a stage-2 translation fault on two CPUs at the same
time, one of them will get back -EAGAIN from the page-table mapping code
when it runs into the mapping installed by the other.

Rather than handle this explicitly in handle_host_mem_abort(), pass the
new KVM_PGTABLE_WALK_IGNORE_EAGAIN flag to kvm_pgtable_stage2_map() from
__host_stage2_idmap() and return -EEXIST if host_stage2_adjust_range()
finds a valid pte. This will avoid having to test for -EAGAIN on the
reclaim path in subsequent patches.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 49db32f3ddf7..0abf6c3acdf7 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -459,8 +459,15 @@ static bool range_is_memory(u64 start, u64 end)
 static inline int __host_stage2_idmap(u64 start, u64 end,
 				      enum kvm_pgtable_prot prot)
 {
+	/*
+	 * We don't make permission changes to the host idmap after
+	 * initialisation, so we can squash -EAGAIN to save callers
+	 * having to treat it like success in the case that they try to
+	 * map something that is already mapped.
+	 */
 	return kvm_pgtable_stage2_map(&host_mmu.pgt, start, end - start, start,
-				      prot, &host_s2_pool, 0);
+				      prot, &host_s2_pool,
+				      KVM_PGTABLE_WALK_IGNORE_EAGAIN);
 }
 
 /*
@@ -502,7 +509,7 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 		return ret;
 
 	if (kvm_pte_valid(pte))
-		return -EAGAIN;
+		return -EEXIST;
 
 	if (pte) {
 		WARN_ON(addr_is_memory(addr) &&
@@ -607,7 +614,6 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 {
 	struct kvm_vcpu_fault_info fault;
 	u64 esr, addr;
-	int ret = 0;
 
 	esr = read_sysreg_el2(SYS_ESR);
 	if (!__get_fault_info(esr, &fault)) {
@@ -626,8 +632,13 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
 	addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
 
-	ret = host_stage2_idmap(addr);
-	BUG_ON(ret && ret != -EAGAIN);
+	switch (host_stage2_idmap(addr)) {
+	case -EEXIST:
+	case 0:
+		break;
+	default:
+		BUG();
+	}
 }
 
 struct check_walk_data {
-- 
2.52.0.457.g6b5491de43-goog


