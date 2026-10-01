Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62866CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLiBBI874P9vnynChb7V6ruOOhcnWRRCWl3lrufM55k=; b=gwRHX2igBsf5CuOyvpFQ/Y/wd4
	DBzlHixVBF0hUfpgsZOxGqLqIV/pls5E/FKihxcMnnhkMm+uehwJ8XrnKriD0TpwpuXU3K66QaU6O
	njbMpToBrz7yPOEpDMYpIWEOGtlBk9JGnlzgPaFjTsDzmeO7rdmpZcCSTquTD7v8GR+KtJ1nZh6/r
	ThtI3NRLtjSc/4c3G03+o6BDh0m28V94gcAQbVAM/DUCgzPIEKZeD6hMMDZq6FrJcTmFl2AuDDptZ
	DnU7BmxmS0NXzTdG18WvOWa2Yote3gspZi9RQmdh9hhdpUgkbWtjPpQhjrVDF3Avf6b2XOqBEcJjQ
	Pn/LfrQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO0x-0000000ADRx-2B8b;
	Thu, 01 Oct 2026 21:08:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO0t-0000000ADM7-1JGS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:08:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B99BB16F8;
	Thu,  1 Oct 2026 14:08:16 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C4D223F86F;
	Thu,  1 Oct 2026 14:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790888900; bh=J4qcShf5sghV5L5Y2wcHcCrDh9c4LPadyYpHFo9qgwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ptiPTb2W1mfNipNAtg55EMBx5ylXxd4+raDGT2ZOUJ4zed0z8MdwjsDp8BeaMf6SW
	 1N1yhShVkEMuQU1nv/VB4uc4DBhKUmvADndZ8aF4rzR5cXE3LXdA15x1c7v5y5rDxd
	 en0jfthKHrO5qxatMVfaFdlUZhOdsoiN9V1AEbqw=
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
Subject: [PATCH v21 16/23] KVM: arm64: CCA: Add bare minimal S2 operations for Realm
Date: Thu,  1 Oct 2026 22:06:56 +0100
Message-ID: <20261001210703.1597150-17-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001210703.1597150-1-suzuki.poulose@arm.com>
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_140824_401286_6DF26F33 
X-CRM114-Status: GOOD (  12.08  )
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


