Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013C3C98324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLiBBI874P9vnynChb7V6ruOOhcnWRRCWl3lrufM55k=; b=fOB3fBn8MKLPhOiVggJxFhsDF6
	qG+LtiE4CYzC5XyW6Xs2xiKK0UZq7OCjWlH4L6UnVW0arVO1gc9X9c42VqaBq5kF62OfmfP0qeYqM
	wejzaeJb9MEH/wznh+hiXTXYnk0mSKLwhK8qUlRCW0yvPBEmfaQjIQnWgRj5WvwhkYsHtjZvehSuy
	pw/cG0prvtWdSTH7OetclCk2irFLU8qnbT73yLaVqRRVAnx2VCAm4gXX58woXbXTi04pwp82zlrZc
	YhILEoIHM+VD9Q0itG9GiSRsKrmbW3fwHGcxz5YeGzp5rua2dNU2wCIoz66IyzkUBeOL5+SF1JTs1
	Pbhrm/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lyp-0000000BXnt-0RwD;
	Thu, 24 Sep 2026 16:07:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lxw-0000000BXB8-10p2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:06:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BFEA1E7D;
	Thu, 24 Sep 2026 09:06:28 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 64CBF3FAB1;
	Thu, 24 Sep 2026 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790265991; bh=J4qcShf5sghV5L5Y2wcHcCrDh9c4LPadyYpHFo9qgwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVuot4serLCoRiU+s6wSR2runjB+8k9giQ14cbikSaWMXrY/Ru9b+Y4oTOX6lUyp9
	 1fllwkIVQxlBTs1OZVU3E6g96MI0pa54Bpf3hHH/CiDRdwC9StDwTk+MfRxBGnKs6i
	 1Vl4dZDxf7l0oBa2Uyoj1TKRpIrk5NylkBzZXOs8=
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
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v20 16/22] KVM: arm64: CCA: Add bare minimal S2 operations for Realm
Date: Thu, 24 Sep 2026 17:04:58 +0100
Message-ID: <20260924160504.853911-17-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924160504.853911-1-suzuki.poulose@arm.com>
References: <20260924160504.853911-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_090632_358916_08BBEC69 
X-CRM114-Status: GOOD (  12.01  )
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

Add bare minimal MMU operation hooks for Realms. The mem_abort handling
is chosen as the default KVM variant. However this cannot be reached for
Realms yet and we would need real RMI command support to make it fully
functional.

RMM takes care of the TLB flushing as required, when the Stage2 is
modified. So host doesn't need to do anything explicitly. RMM doesn't
support access flags for the stage2, even for the shared IPA.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/mmu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8f21652d3625c..1d2265801e7aa 100644
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
@@ -210,6 +216,13 @@ static int kvm_vm_flush_remote_tlbs_range(struct kvm *kvm,
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
@@ -2880,6 +2893,17 @@ static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
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


