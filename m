Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CC1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 17:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvW0FZ81QZGgPkPnffGLt2x6zapzarvRDL3O6zHo+uA=; b=mKGyK5LRwM+2+Uj05rsfIf7VYv
	UjaCaewl2QH3RFcjM748EgvGaVQiv9ntSaMZc3MeRqaExdqXeaa4km9Yo2FeUsH2Y+4aFtgeFxsuf
	SfsYPazObwYHQqgBOrHbiGsf8/j4A+oHa619xvt881nX2glI7NT8pJeGD0GxqDx6iUe0DQuTed5VY
	ahANLAhvr3pxdWCOUGTMsa6J9VPmlawVhAlMmjtATjlcA4GMnDGfyBHif69IgUiffgmQ163r9xwET
	Lu2fR/B/WpgTWU2cByTGsZQvIMZkIGafwj8dOUv3Z6kh+7e5u0R+qo5bpTl/3iYGVBvE+YXBFkwHZ
	cvvN+AoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l9b-0000000CRup-1Dd3;
	Fri, 04 Apr 2025 17:48:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l5x-0000000CRMs-3whv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 17:44:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CACA21515;
	Fri,  4 Apr 2025 10:44:47 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 55BC53F63F;
	Fri,  4 Apr 2025 10:44:44 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH 02/14] arm64/fpsimd: Remove unused fpsimd_force_sync_to_sve()
Date: Fri,  4 Apr 2025 18:44:23 +0100
Message-Id: <20250404174435.3288106-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250404174435.3288106-1-mark.rutland@arm.com>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_104446_032684_E58C3F20 
X-CRM114-Status: GOOD (  10.30  )
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

There have been no users of fpsimd_force_sync_to_sve() since commit:

  bbc6172eefdb276b ("arm64/fpsimd: SME no longer requires SVE register state")

Remove fpsimd_force_sync_to_sve().

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 1ee5f330b8ed3..1391a491f2226 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -758,20 +758,6 @@ void sve_alloc(struct task_struct *task, bool flush)
 		kzalloc(sve_state_size(task), GFP_KERNEL);
 }
 
-
-/*
- * Force the FPSIMD state shared with SVE to be updated in the SVE state
- * even if the SVE state is the current active state.
- *
- * This should only be called by ptrace.  task must be non-runnable.
- * task->thread.sve_state must point to at least sve_state_size(task)
- * bytes of allocated kernel memory.
- */
-void fpsimd_force_sync_to_sve(struct task_struct *task)
-{
-	fpsimd_to_sve(task);
-}
-
 /*
  * Ensure that task->thread.sve_state is up to date with respect to
  * the user task, irrespective of when SVE is in use or not.
-- 
2.30.2


