Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F15AC982C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOgwZrHyCI4KtaVaRy/NGS07ot7jBnmHmV0ZfVxReys=; b=ZVi+b3f/WlUaSqi2gWEasGe4xY
	nbzO5Bpc1qVtgoKxqBS4O66PcwOc0/yeAXYLK8VDsa13XVI1tTQHRkRe5KkrtSpo5Th6MDezidVE3
	IXuxhA27MU6ofgBE7g9aQLIOnWy3+aiALJ3tkVU6nO4z65Z0+gyybQLlPC2wfwVHZGpV6nh7K8La0
	chQcnK7RSClxMm2Jrst7b8I4SUh9ibMuR1AiJHFtYplZlyX3HnVs1oEXV1CZW3DnnpQHIm3fsMWfy
	qmRyQ9b934L9yfBbNoBYzdHoYEH+diYMRoQVl14o6d9Bwqi/QWbLG2KD50bx72jgiwKxbzgZI+eCd
	OhsisCzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vcg-00000007Lq3-3RiM;
	Tue, 15 Sep 2026 16:03:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VcM-00000007LYJ-2kUY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 16:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xOgwZrHyCI4KtaVaRy/NGS07ot7jBnmHmV0ZfVxReys=; b=P6aIzALOthVH8vFonGghM4AsT0
	19DgMEL3bksfRoHV7PlKliuQ7YBlVKwZf4gPkw2DaswgEYT1VaTChcCZe8tAPzj9oUA+EnaArnTj9
	BPOZF+hHr5WAFg6kjFtoL+Beu0aFQ1HCrcMBdgf2r4L+nuaWagfOlvrUBS9Z88hGuyjTl0N4+YF9h
	Oh+2cM+TKpecgExj7mxuJMJeeaYCWI5rus1BcclI5AsUFLRW3vNi3F/Lfg7qz88n4CZAS4NPUntS9
	6HJJr+yIqoZqlK1mKMN62nkqa10O/189ft3bMkhM33N/2j4686+UOLbf72N9/RrN1Ze6bwbtlqXwH
	R5+DsphQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VcI-00000006zmb-2dpv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:02:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F9A61570;
	Tue, 15 Sep 2026 09:02:37 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 682F73F882;
	Tue, 15 Sep 2026 09:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789488161; bh=22gesudg8073MgbQnGHHio9ZG47S1o4pC17iaDfRE1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VA627VA8W1VJco18HSGHTgCmYqW7eNkG8c11Tmu0VK0RZIDReyB2TK8A00YGoM7zn
	 biLItBO4p2vdxPwDwEHp2v33cmIzPivex8AuSSPakEYLwKMMLeEPK+P66+JlSY7JZW
	 yR6yD7mkN2c727GfX8/WUQTs2afSGfWhY908GzCo=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v18 16/23] KVM: arm64: CCA: Add bare minimal S2 operations for Realm
Date: Tue, 15 Sep 2026 17:01:34 +0100
Message-ID: <20260915160141.3543048-17-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915160141.3543048-1-suzuki.poulose@arm.com>
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_170242_863190_249AB9B1 
X-CRM114-Status: GOOD (  12.23  )
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

Add bare minimal MMU operation hooks for Realms. The mem_abort handling is
chosen as the default KVM variant. However this cannot be reached for Realms
yet and we would need real RMI command support to make it fully functional.

RMM takes care of the TLB flushing as required, when the Stage2 is modified.
So host doesn't need to do anything explicitly. RMM doesn't support
access flags for the stage2, even for the shared IPA.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/mmu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 559a8286807cd..ac86b5a41c315 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -180,6 +180,12 @@ static int kvm_vm_flush_remote_tlbs(struct kvm *kvm)
 	return 0;
 }
 
+static int realm_vm_flush_remote_tlbs(struct kvm *kvm)
+{
+	/* Nothing to do here, RMM takes care of this */
+	return 0;
+}
+
 /**
  * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
  * @kvm:	pointer to kvm structure.
@@ -209,6 +215,13 @@ static int kvm_vm_flush_remote_tlbs_range(struct kvm *kvm,
 	return 0;
 }
 
+static int realm_vm_flush_remote_tlbs_range(struct kvm *kvm,
+					   gfn_t gfn, u64 nr_pages)
+{
+	/* Nothing to do here, RMM takes care of this */
+	return 0;
+}
+
 int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
 				     gfn_t gfn, u64 nr_pages)
 {
@@ -2881,6 +2894,17 @@ static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
 	.vm_mem_abort			= kvm_vm_mem_abort,
 };
 
+static const struct kvm_vm_s2_ops realm_vm_s2_ops = {
+	.vm_flush_remote_tlbs		= realm_vm_flush_remote_tlbs,
+	.vm_flush_remote_tlbs_range	= realm_vm_flush_remote_tlbs_range,
+	.vm_mem_abort			= kvm_vm_mem_abort,
+	/*
+	 * Not supported for Realms
+	 *	.vm_age_gfn			= realm_vm_age_gfn,
+	 *	.vm_test_age_gfn		= realm_vm_test_age_gfn,
+	 */
+};
+
 #define KVM_VM_S2_OPS(flavor, ops)		\
 		[flavor] = ops
 static const struct kvm_vm_s2_ops *arm64_vm_s2_ops[] = {
-- 
2.43.0


