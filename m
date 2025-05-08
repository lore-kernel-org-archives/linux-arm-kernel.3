Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8938BC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWJWLACoalfSzO2m01ODNCPtWsqHd7GdF843zzMXGME=; b=xeDtnR9D18Kw7bPToutniQedPv
	4ukCJ45cJba8vZKxRbEed3q1ROp+lRQ6gSRh5bddGFdG3Pyd5zA2o/qM0kmvT2CvfIKjlooEMrHXg
	wi7R+PgwhnaA5yUPTUzA1lsoFdgLTePt7RwCSQZNiHrDhCdMaa7SK+x9qLuOpq563/xnncYp23Om6
	RCNi9G6uYgxp7FKHmpWXUVzQNudLW+zJM4mhn5eAh+7fRbRUYFLPpSJj8juc/GeEx7wXJ9R5GsH2O
	cZhFTeBzwbjH0ua4U7xlv2qZkEo5wASyIf/zk8/VJiIR80ruXWP+Js6t2rDhcc+OUyI5mMo3anOCk
	eOFkNA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Yz-00000000nry-1pKe;
	Thu, 08 May 2025 13:45:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Hi-00000000kQO-1ud6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:27:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B18081E2F;
	Thu,  8 May 2025 06:27:23 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B0DAF3F58B;
	Thu,  8 May 2025 06:27:31 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	daniel.kiss@arm.com,
	david.spickett@arm.com,
	luis.machado@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tabba@google.com,
	tamas.petz@arm.com,
	tkjos@google.com,
	will@kernel.org,
	yury.khrustalev@arm.com
Subject: [PATCH v2 07/24] arm64/fpsimd: Factor out {sve,sme}_state_size() helpers
Date: Thu,  8 May 2025 14:26:27 +0100
Message-Id: <20250508132644.1395904-8-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062734_580330_F3414A02 
X-CRM114-Status: GOOD (  14.80  )
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

In subsequent patches we'll need to determine the SVE/SME state size for
a given SVE VL and SME VL regardless of whether a task is currently
configured with those VLs. Split the sizing logic out of
sve_state_size() and sme_state_size() so that we don't need to open-code
this logic elsewhere.

At the same time, apply minor cleanups:

* Move sve_state_size() into fpsimd.h, matching the placement of
  sme_state_size().

* Remove the feature checks from sve_state_size(). We only call
  sve_state_size() when at least one of SVE and SME are supported, and
  when either of the two is not supported, the task's corresponding
  SVE/SME vector length will be zero.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h | 47 ++++++++++++++++++++++++++-------
 arch/arm64/kernel/fpsimd.c      | 16 -----------
 2 files changed, 37 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index c9e17d093fe23..b751064bbaaa1 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -293,7 +293,22 @@ static inline bool sve_vq_available(unsigned int vq)
 	return vq_available(ARM64_VEC_SVE, vq);
 }
 
-size_t sve_state_size(struct task_struct const *task);
+static inline size_t __sve_state_size(unsigned int sve_vl, unsigned int sme_vl)
+{
+	unsigned int vl = max(sve_vl, sme_vl);
+	return SVE_SIG_REGS_SIZE(sve_vq_from_vl(vl));
+}
+
+/*
+ * Return how many bytes of memory are required to store the full SVE
+ * state for task, given task's currently configured vector length.
+ */
+static inline size_t sve_state_size(struct task_struct const *task)
+{
+	unsigned int sve_vl = task_get_sve_vl(task);
+	unsigned int sme_vl = task_get_sme_vl(task);
+	return __sve_state_size(sve_vl, sme_vl);
+}
 
 #else /* ! CONFIG_ARM64_SVE */
 
@@ -334,6 +349,11 @@ static inline void vec_update_vq_map(enum vec_type t) { }
 static inline int vec_verify_vq_map(enum vec_type t) { return 0; }
 static inline void sve_setup(void) { }
 
+static inline size_t __sve_state_size(unsigned int sve_vl, unsigned int sme_vl)
+{
+	return 0;
+}
+
 static inline size_t sve_state_size(struct task_struct const *task)
 {
 	return 0;
@@ -386,6 +406,16 @@ extern int sme_set_current_vl(unsigned long arg);
 extern int sme_get_current_vl(void);
 extern void sme_suspend_exit(void);
 
+static inline size_t __sme_state_size(unsigned int sme_vl)
+{
+	size_t size = ZA_SIG_REGS_SIZE(sve_vq_from_vl(sme_vl));
+
+	if (system_supports_sme2())
+		size += ZT_SIG_REG_SIZE;
+
+	return size;
+}
+
 /*
  * Return how many bytes of memory are required to store the full SME
  * specific state for task, given task's currently configured vector
@@ -393,15 +423,7 @@ extern void sme_suspend_exit(void);
  */
 static inline size_t sme_state_size(struct task_struct const *task)
 {
-	unsigned int vl = task_get_sme_vl(task);
-	size_t size;
-
-	size = ZA_SIG_REGS_SIZE(sve_vq_from_vl(vl));
-
-	if (system_supports_sme2())
-		size += ZT_SIG_REG_SIZE;
-
-	return size;
+	return __sme_state_size(task_get_sme_vl(task));
 }
 
 #else
@@ -422,6 +444,11 @@ static inline int sme_set_current_vl(unsigned long arg) { return -EINVAL; }
 static inline int sme_get_current_vl(void) { return -EINVAL; }
 static inline void sme_suspend_exit(void) { }
 
+static inline size_t __sme_state_size(unsigned int sme_vl)
+{
+	return 0;
+}
+
 static inline size_t sme_state_size(struct task_struct const *task)
 {
 	return 0;
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index dd6480087683c..c2603fe8dd243 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -719,22 +719,6 @@ static void sve_free(struct task_struct *task)
 	__sve_free(task);
 }
 
-/*
- * Return how many bytes of memory are required to store the full SVE
- * state for task, given task's currently configured vector length.
- */
-size_t sve_state_size(struct task_struct const *task)
-{
-	unsigned int vl = 0;
-
-	if (system_supports_sve())
-		vl = task_get_sve_vl(task);
-	if (system_supports_sme())
-		vl = max(vl, task_get_sme_vl(task));
-
-	return SVE_SIG_REGS_SIZE(sve_vq_from_vl(vl));
-}
-
 /*
  * Ensure that task->thread.sve_state is allocated and sufficiently large.
  *
-- 
2.30.2


