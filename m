Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181C81061B06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dwi5pCAg/MZTNDHoKdZDmYR5Cl5fK1dAgs4M7cLrNQ=; b=TToJW+NX2i4GbCSm95YsLYgOR4
	f0Gr7TI9D5JGAYzXTAPnC/3hGnpsJmaLecQUna3FdEXFs2mZ+rhZE5CpkRI0ew7CKjHuZY4gs5GRZ
	2mtfm4CzphCYqpk7oi/FD4EKk2/jcJzlb2w2Zqrl/ra6GwfkS3Tqjt/AjBfAn0/JEbb/cWErdWETT
	gohst4Sfrvo09rPRQwYOupBtgYB9CldS7C2VRfbmFRMzVEEBZZ91WNsJNtsKyYhWM4tIrvh+qsH+w
	cN/+n4sKN8smVWAxzOl4NnwIWG98qYLUZPzkKSWQiSWHOX4mwCbOp+uNx3+IJJ+3oHZK5DOFfgCiE
	f4d4k0Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dvm-0000000BT8i-3mfj;
	Mon, 30 Mar 2026 14:49:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dvh-0000000BT55-0hJR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:49:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 957A560054;
	Mon, 30 Mar 2026 14:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD6AC4CEF7;
	Mon, 30 Mar 2026 14:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882164;
	bh=kupY+rUTW2UPV/U5cwqqP9hhXbxo6oWLqyy18kOdLqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PaU3wEqcUCRAhv1+1jIXQ1xovdIHMPnSQLXpYHLkXiFtgzFVMTYYQTXJ/1VK9rHhj
	 lPtXW3MtGBM2I9hvClmBhrRGHPz/VrbarbLUUzGEbDt9jtuGggznNO+uwGsX6t3Kt1
	 D0/XMs7lCHRkuw/0ocJH/SJEPZQ6/jtohHQxfzz/LvAu4z+yh8PyW2QrZpw0eJ5Xkf
	 o11L/yLkIsvs3o7YHyd3YgWqNKRuPI4SebdXFqEzxqS/XJnwMajL4Mm2y9FZ4G2XsX
	 9slyRC7SiLtOknPCaiN5Yh1MFMjMqYn6xgRf52mdevRe15IW7Rzdu8zZN2e0HFPSrl
	 z9WDuTTAHQEQw==
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
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v5 10/38] KVM: arm64: Ignore -EAGAIN when mapping in pages for the pKVM host
Date: Mon, 30 Mar 2026 15:48:11 +0100
Message-ID: <20260330144841.26181-11-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
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

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d815265bd374..7d22893ab1dc 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -461,8 +461,15 @@ static bool range_is_memory(u64 start, u64 end)
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
@@ -504,7 +511,7 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 		return ret;
 
 	if (kvm_pte_valid(pte))
-		return -EAGAIN;
+		return -EEXIST;
 
 	if (pte) {
 		WARN_ON(addr_is_memory(addr) &&
@@ -609,7 +616,6 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 {
 	struct kvm_vcpu_fault_info fault;
 	u64 esr, addr;
-	int ret = 0;
 
 	esr = read_sysreg_el2(SYS_ESR);
 	if (!__get_fault_info(esr, &fault)) {
@@ -628,8 +634,13 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
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
2.53.0.1018.g2bb0e51243-goog


