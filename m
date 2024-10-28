Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE3AD3E2BA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HXzhljan+Ce4M7nDYNhFYVXk51Vd91p6Gg3JChQ3AHM=; b=vtAkl/iB7vZ9eMCGRTWd8mXhLe
	90q8A38EnVVugRQjO2C09DiSchTH8J0/ljVX7CS/qbOdHQW4GUvINj6YfYIanBsJAM0uM/GbFDY6F
	Pf58BDfnuNQ6SI2HSf7egJt1nJ1eHB4Q77DPYELSNtMHmAjG7DZzag9WcBCZ0R4dQg6Hrp2Xj+MtT
	CcTikA4uxUYgIT2b4duSww78ay95ZI8yD4jBonNdhZNYFJMwZLUfwk0EyutXawEUndu/2SAI1Uobe
	SO74gka+xJUaRDf+oXzzN7Lx0zk+7KP00bUdWVxqXWQEkxBOIT7Ee8wxGnY8jj2Gx2GCW4ed5Pa2Z
	QCKDzCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5VSh-0000000C0fu-0GUB;
	Mon, 28 Oct 2024 19:31:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Uw1-0000000Burs-37TN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 18:57:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5EB2497;
	Mon, 28 Oct 2024 11:58:16 -0700 (PDT)
Received: from e126864.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF9AE3F73B;
	Mon, 28 Oct 2024 11:57:45 -0700 (PDT)
From: Kristina Martsenko <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] arm64: mops: Document requirements for hypervisors
Date: Mon, 28 Oct 2024 18:57:21 +0000
Message-Id: <20241028185721.52852-1-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_115749_892285_C0C8A032 
X-CRM114-Status: GOOD (  18.11  )
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

Add a mops.rst document to clarify in more detail what hypervisors need
to do to run a Linux guest on a system with FEAT_MOPS.

Signed-off-by: Kristina Martsenko <kristina.martsenko@arm.com>
---

This is a follow-up to Catalin's comment on the MOPS series:
  https://lore.kernel.org/all/Zv1-YzLAOcxCmp4w@arm.com/

Based on the arm64 for-next/mops branch.

 Documentation/arch/arm64/booting.rst |  4 +--
 Documentation/arch/arm64/index.rst   |  1 +
 Documentation/arch/arm64/mops.rst    | 44 ++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/arch/arm64/mops.rst

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index c074430d1099..3278fb4bf219 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -388,8 +388,8 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HCRX_EL2.MSCEn (bit 11) must be initialised to 0b1.
 
-    - HCRX_EL2.MCE2 (bit 10) must be initialised to 0b1. The exception
-      handler must set PSTATE.SS to 0b0.
+    - HCRX_EL2.MCE2 (bit 10) must be initialised to 0b1 and the hypervisor
+      must handle MOPS exceptions as described in :ref:`arm64_mops_hyp`.
 
   For CPUs with the Extended Translation Control Register feature (FEAT_TCR2):
 
diff --git a/Documentation/arch/arm64/index.rst b/Documentation/arch/arm64/index.rst
index e02247dcb87e..6a012c98bdcd 100644
--- a/Documentation/arch/arm64/index.rst
+++ b/Documentation/arch/arm64/index.rst
@@ -22,6 +22,7 @@ ARM64 Architecture
     legacy_instructions
     memory
     memory-tagging-extension
+    mops
     perf
     pointer-authentication
     ptdump
diff --git a/Documentation/arch/arm64/mops.rst b/Documentation/arch/arm64/mops.rst
new file mode 100644
index 000000000000..2ef5b147f8dc
--- /dev/null
+++ b/Documentation/arch/arm64/mops.rst
@@ -0,0 +1,44 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================
+Memory copy/set instructions (MOPS)
+===================================
+
+A MOPS memory copy/set operation consists of three consecutive CPY* or SET*
+instructions: a prologue, main and epilogue (for example: CPYP, CPYM, CPYE).
+
+A main or epilogue instruction can take a MOPS exception for various reasons,
+for example when a task is migrated to a CPU with a different MOPS
+implementation, or when the instruction's alignment and size requirements are
+not met. The software exception handler is then expected to reset the registers
+and restart execution from the prologue instruction. Normally this is handled
+by the kernel.
+
+For more details refer to "D1.3.5.7 Memory Copy and Memory Set exceptions" in
+the Arm Architecture Reference Manual DDI 0487K.a (Arm ARM).
+
+.. _arm64_mops_hyp:
+
+Hypervisor requirements
+-----------------------
+
+A hypervisor running a Linux guest must handle all MOPS exceptions from the
+guest kernel, as Linux may not be able to handle the exception at all times.
+For example, a MOPS exception can be taken when the hypervisor migrates a vCPU
+to another physical CPU with a different MOPS implementation.
+
+To do this, the hypervisor must:
+
+  - Set HCRX_EL2.MCE2 to 1 so that the exception is taken to the hypervisor.
+
+  - Have an exception handler that implements the algorithm from the Arm ARM
+    rules CNTMJ and MWFQH.
+
+  - Set the guest's PSTATE.SS to 0 in the exception handler, to handle a
+    potential step of the current instruction.
+
+    Note: Clearing PSTATE.SS is needed so that a single step exception is taken
+    on the next instruction (the prologue instruction). Otherwise prologue
+    would get silently stepped over and the single step exception taken on the
+    main instruction. Note that if the guest instruction is not being stepped
+    then clearing PSTATE.SS has no effect.
-- 
2.34.1


