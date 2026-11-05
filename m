Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351AC606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q9AFezOn;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SL5DlQfk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0J8HAE6fhEZu8JqEpog8/ysJSaUFoTKmnmkh+IDODZI=; b=q9AFezOnz3bqTp
	acK1Vrgvc5J02lAGlQGJ7jLzrroEzfGqeTBwLbRVU1EYvX94u0ePXvE5d7t253kHO9FQdOwjip4Bv
	m8fl/BGrsh4SbD251SuLL7sCTrCM9liM3L8+sLdgUAouXI7TlA1pdpOPOzdgVs8CvjEUtEMgcPmRS
	snAN0AfF/U7ofFrd8ATsFYvJQqQPtqrhlcW0qAouDHMcwSaC0f8dBi5OZ/MjGy1xeRemUOvkXnwVO
	QSiWkDmV0xblmk6lZUV4TbASGlbqEEWb5uCLaE9OLGLXtqVsDMSkCDCdqa8GvdKkoviVRVvFsnqp1
	boKIbU4oWV8qansIn95g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0At-00000009ZcK-3Oyw;
	Thu, 05 Nov 2026 16:18:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Ad-00000009ZQL-251b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 16:18:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ECBD438EA;
	Thu,  5 Nov 2026 16:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC291F0093A;
	Thu,  5 Nov 2026 16:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793895514;
	bh=0J8HAE6fhEZu8JqEpog8/ysJSaUFoTKmnmkh+IDODZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SL5DlQfkF75//kBq74BLhyYrGyh09AZ5vuIYMAZwnTRGKvWpQ8voQ3p09E9KAXH1D
	 jPGG/rMN+7C4Ea4xbqYw5IYi+eIc9BFWabg/AiNSlqGZn3xTJuL5gCvnUS+MJFqMLE
	 Lt+BPV+IcN2tXm16eNPnXjCGdLdN4Fed1j9nR83v6KlakfWQag40zDef521k5nbt4i
	 wHNg4DnP4x6KMcs77aj2xLNjZekoLW9rLE0wcCSABy7DEc2ZSWZOXEON94aMFxv8fx
	 qG4ZvF2rlfchbimy8dEsHm/2R4UjbJAJR82BT1j25AhrVFDwFmjJqQsRPCcpF6KAPv
	 WYlQPL0Ue7xFA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 16:05:04 +0000
Subject: [PATCH 1/2] arm64: suspend: Save POR_EL0 over suspend
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fix-sysreg-suspend-v1-1-f4d9a99fec46@kernel.org>
References: <20261105-arm64-fix-sysreg-suspend-v1-0-f4d9a99fec46@kernel.org>
In-Reply-To: <20261105-arm64-fix-sysreg-suspend-v1-0-f4d9a99fec46@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SP+OuiZxr0S1Vipeh1xjDaZfgd3xHIYWyxtkizFr0qM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLerAlNurjN/0bbvmVhASJ8G1wS3OdVLJrQr2V57M6cm
 23f7FfIdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAik0QZGT4+0Lj4vcpsV/iu
 tXoKdiIvXnJsq/PbZjzpUb+Uy8sPngsYGfZJsSQsNzWp+Zcz84PF9Inn/tm9+m8g0cS262PlHP8
 IXWYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

POR_EL0 is a live EL0 register on systems with S1POE but it is not saved
and restored by cpu_do_suspend()/cpu_do_resume(). This means that the task
that initiated suspend can return to userspace with an UNKNOWN value. Fix
this by saving and restoring the value over suspend.

This increases the size of struct cpu_suspend_ctx.

Fixes: bf83dae90fbc ("arm64: enable the Permission Overlay Extension for EL0")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/include/asm/suspend.h | 2 +-
 arch/arm64/mm/proc.S             | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/suspend.h b/arch/arm64/include/asm/suspend.h
index a5abf0615594..eb9ce315f146 100644
--- a/arch/arm64/include/asm/suspend.h
+++ b/arch/arm64/include/asm/suspend.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_SUSPEND_H
 #define __ASM_SUSPEND_H
 
-#define NR_CTX_REGS 15
+#define NR_CTX_REGS 16
 #define NR_CALLEE_SAVED_REGS 12
 
 /*
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index b1516630904d..664ea9e3b9ad 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -117,6 +117,10 @@ alternative_else_nop_endif
 alternative_if ARM64_SME
 	mrs_s	x2, SYS_TPIDR2_EL0
 	str	x2, [x0, #112]
+alternative_else_nop_endif
+alternative_if ARM64_HAS_S1POE
+	mrs	x2, REG_POR_EL0
+	str	x2, [x0, #120]
 alternative_else_nop_endif
 	ret
 SYM_FUNC_END(cpu_do_suspend)
@@ -160,6 +164,10 @@ alternative_if ARM64_SME
 	ldr	x2, [x0, #112]
 	msr_s	SYS_TPIDR2_EL0, x2
 alternative_else_nop_endif
+alternative_if ARM64_HAS_S1POE
+	ldr	x2, [x0, #120]
+	msr	REG_POR_EL0, x2
+alternative_else_nop_endif
 
 	msr	sctlr_el1, x12
 	set_this_cpu_offset x13

-- 
2.47.3


