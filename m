Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03EA606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F91zlB/q;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VKQ5ekyf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lTLLM8/L7S7eQTmXLG5XVnIa55Fut1pOeZu/AOdHhF8=; b=F91zlB/qERRMkr
	r+a4A0SQ5gfSzLSXUTGUJNmJDLOGZqCB2ESD1ZtjDYK6dZJUajd+rxNw464qZQOOfr8rcUplZbIZQ
	XhRCL3DTQOzNSC2AhwqaEO5MpcFLMevNNuOr54BEh+FTsVZvOCSDciNtVdmb3funiMphUoJB/sLxa
	Upv2gGqElw+ZK5S7EJ63q7JXGP/GG8K6VPs4DgQf45Z9aABwmmLrVrEy3s+lCsMiDi9zYQjzVRqVr
	Ab07SPzuglPAB+ws9LD37u+CzapqPufeFnJdkSrb7TleohtLjp6lPbF5aCIz5IWeWUvukKZsqw3It
	Z1FOzZ70E5Zq3j+ntcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODOz-00000002LGA-3dEN;
	Tue, 03 Nov 2026 12:14:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODOx-00000002LFQ-3kC1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:14:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F13001595;
	Tue,  3 Nov 2026 04:13:59 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 29B363F628;
	Tue,  3 Nov 2026 04:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793708043; bh=Ajh8UMNmjgmQFFBBsQ2m06P3ne04fRRequVyr1q50pE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VKQ5ekyf0/JoaFyo25MPe2batsfyUwvft0R4haPiEfjj97LYq47qKTnjwUzaSn3ik
	 kA6IabUTwdotqNej2mfmouGb/wnIRfACRpG/RKEFqpMZtq6xQGjhdixkHKYRowDgDy
	 S2a2kPkcmZVz6vdTT5ZNAYXXdciQri/MPvq2SWS8=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH 2/3] arm64: ptrace: Simplify sve_set_common() SME-only logic
Date: Tue,  3 Nov 2026 12:13:45 +0000
Message-Id: <20261103121346.1858305-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261103121346.1858305-1-mark.rutland@arm.com>
References: <20261103121346.1858305-1-mark.rutland@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_041408_025558_A2D2CA4C 
X-CRM114-Status: GOOD (  16.59  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When SME is supported but SVE is not supported, sve_set_common() permits
some writes to NT_ARM_SVE so that a tracer can take a tracee out of
streaming mode. Such writes are only permitted when the data is in
FPSIMD format, and header.flags is 0, and header.vl is 0. Logic was
added to permit this (with no other intentional changes) in commit:

  472800cd5e38 ("arm64/sme: Support disabling streaming mode via ptrace on SME only system")

While this logic is correct, it is convoluted, and can be simplified.
Importantly, regardless of the changes from that commit:

(1) vec_set_vector_length() always rejects VL==0, and returns -EINVAL.
    It has always done so, as sve_vl_valid(0) is always false.

(2) sve_set_common() always rejects writes to NT_ARM_SME in FPSIMD
    format, and returns -EINVAL. This has been the case since commit:

    f916dd32a943 ("arm64/fpsimd: ptrace: Mandate SVE payload for streaming-mode state")

    That commit has been backported to all upstream stable kernels which
    support SME.

Given this, it is significantly simpler to have an explicit special case
for writes to NT_ARM_SVE when SVE is not supported. The is the only case
where VL is permitted (and required) to be zero. In all other cases, the
existing logic from before commit 472800cd5e38 is sufficient.

Treat SME-only configurations as an explicit special case, and clarify
the comments.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 7405c76724bfe..7052d7f751446 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -962,18 +962,17 @@ static int sve_set_common(struct task_struct *target,
 		return -EINVAL;
 
 	/*
-	 * On systems without SVE we accept FPSIMD format writes with
-	 * a VL of 0 to allow exiting streaming mode, otherwise a VL
-	 * is required.
+	 * On systems with SME but not SVE, accept writes to NT_ARM_SVE if and
+	 * only if VL==0 and data is in FPSIMD format and no flags are set.
+	 * This permits exiting streaming mode, and avoids the possibility of
+	 * creating non-streaming SVE state.
 	 */
-	if (header.vl) {
-		/*
-		 * If the system does not support SVE we can't
-		 * configure a SVE VL.
-		 */
-		if (!system_supports_sve() && type == ARM64_VEC_SVE)
+	if (!system_supports_sve() && type == ARM64_VEC_SVE) {
+		if (header.vl)
 			return -EINVAL;
-
+		if (header.flags != SVE_PT_REGS_FPSIMD)
+			return -EINVAL;
+	} else {
 		/*
 		 * Apart from SVE_PT_REGS_MASK, all SVE_PT_* flags are
 		 * consumed by vec_set_vector_length(), which will
@@ -983,17 +982,6 @@ static int sve_set_common(struct task_struct *target,
 					    ((unsigned long)header.flags & ~SVE_PT_REGS_MASK) << 16);
 		if (ret)
 			return ret;
-	} else {
-		/* If the system supports SVE we require a VL. */
-		if (system_supports_sve())
-			return -EINVAL;
-
-		/*
-		 * Only FPSIMD formatted data with no flags set is
-		 * supported.
-		 */
-		if (header.flags != SVE_PT_REGS_FPSIMD)
-			return -EINVAL;
 	}
 
 	/* Allocate SME storage if necessary, preserving any existing ZA/ZT state */
-- 
2.30.2


