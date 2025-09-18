Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA42CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N5az2MWbR/auYwWcfNSSfab5hrX0R6DyT9v0nJfHP/s=; b=O7n3cq9haFR5qC9mRppmeHN0AS
	VBq85pXIIjC2SBTU6d5F+ZinMYA5eWQN6le1oeNTu1Tk+5H9zc1aPWWcGPSGxbMCZTCkfP2Uqc7r9
	CtW4cUz0LM+/wbIgBKm1z7cUYn5fJQzHsWpKBEOqhlUQ6zu4wC74M/CWM1iJEz6APWPGcGxmbhUOi
	xhb3zhXKMj5DGGMVBGbqGFZLzJ8RxGNZCkk6woVNO1tMVsFiiWYdSuEI/NOXVgsfhEu9U9R91FZGg
	VChdOsSJtKW3h/E/MzChmb49SYtUJ45aUI3eXHyvPttXSB6KH2l0W6SLjkP7NNSBvTpr/gaV36jLq
	++LFRbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFMN-000000004Jq-36F4;
	Thu, 18 Sep 2025 14:11:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFML-000000004IR-0cO7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:11:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF3AE1A25;
	Thu, 18 Sep 2025 07:11:28 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA0F63F673;
	Thu, 18 Sep 2025 07:11:35 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH] arm64: cputype: Remove duplicate Cortex-X1C definitions
Date: Thu, 18 Sep 2025 15:11:31 +0100
Message-Id: <20250918141131.2358048-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_071141_226082_D664E457 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

We currently have duplicate definitions for ARM_CPU_PART_CORTEX_X1C and
MIDR_CORTEX_X1C as a result of commits:

  58d245e03c324d08 ("arm64: cputype: Add Cortex-X1C definitions")
  efe676a1a7554219 ("arm64: proton-pack: Add new CPUs 'k' values for branch mitigation")

Due to inconsistent sorting when adding entries, there was no textual
conflict between the two patches.

Delete the duplicate definitions added by the latter commit.

The definitions in general are largely (but not entirely) in order of
the MIDR_EL1.PartNum value rather than by CPU name, and the remaining
Cortex-X1C definitions appear later in the list.

For now I haven't sorted the remaining MIDR definitions to minimize
churn. I intend to perform some larger cleanup of these in the near
future which should supersede that anyhow.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/cputype.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 661735616787e2..36c5bbfbb6e95f 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -81,7 +81,6 @@
 #define ARM_CPU_PART_CORTEX_A78AE	0xD42
 #define ARM_CPU_PART_CORTEX_X1		0xD44
 #define ARM_CPU_PART_CORTEX_A510	0xD46
-#define ARM_CPU_PART_CORTEX_X1C		0xD4C
 #define ARM_CPU_PART_CORTEX_A520	0xD80
 #define ARM_CPU_PART_CORTEX_A710	0xD47
 #define ARM_CPU_PART_CORTEX_A715	0xD4D
@@ -170,7 +169,6 @@
 #define MIDR_CORTEX_A78AE	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A78AE)
 #define MIDR_CORTEX_X1	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X1)
 #define MIDR_CORTEX_A510 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A510)
-#define MIDR_CORTEX_X1C MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X1C)
 #define MIDR_CORTEX_A520 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A520)
 #define MIDR_CORTEX_A710 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A710)
 #define MIDR_CORTEX_A715 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A715)
-- 
2.30.2


