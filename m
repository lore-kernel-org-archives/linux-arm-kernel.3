Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F0610F9314
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 00:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KudVB6I6IfgcMDFMUig4VGGqA8YF9z72qz2nKYC3kiM=; b=BSjz2/JsCmXdUvlDs8N3EEDTgc
	v8PWaidIv4mk5OvkXiPgL+weq4iW6RJYSvTlHqgZjfzD4sEmVOP6n/PungvBvRf+fVbIJgLR0CFo3
	lMINjBdCcdAaX2po0uSc5+Rpoe563kRzGtPHfFk4IZ106fJ4Zlj+tINSmJszWbsEq7fLogBC0b6xj
	Dfiep0grlii2p9FPHdLYI+8jJttms7wDtgdnWhMGth5ucu/LFT2w/Q0zdHcMRPf265crX78VRlccj
	nw4CFkBAn03V5oXnp+DnWSC/5CZdIgXtgWBrXYc0GvB5WYIvsw2ETIVsxGLj0Rj75KPkhNi4G5lNB
	iRk8UnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7n-0000000DiGp-2URY;
	Wed, 01 Apr 2026 00:07:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7h-0000000DiCo-0jWn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 00:07:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D8C260120;
	Wed,  1 Apr 2026 00:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14283C2BCB0;
	Wed,  1 Apr 2026 00:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775002072;
	bh=uSa6SngRywqNPRUM39lw0q3opK7TOlmwGZRujqiCUMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XJ8IBEgwo/GNi2M4/AW7mMQF5q1QaE9GwYnJLyqk0QVPdcttvrfH9iHO9ftvLcXha
	 YMkLOI/ph8J5n+oMb9+ULFr9x4oClKY/MahoP9bGJlC69DSIQFiDBGuTvaZvGqw7E7
	 6cgGuVHozNi/rOUQ1l/5p3iSPvSQLcnnwjlk9ds50UnM9GQaiM+aTtqALZ3/cuHe9m
	 UDYA2Umm8/xO/PsgwXPcxgVcxoEOypHfV6cZ0Iwxg/C+ibQPckec8J5OooB3VTubcu
	 qHsDhGupLNfBHSFQcXx24DVcymcp7IAb7dKl6y47ojrUHy6mot1pd41ou5ngm5j9Bo
	 Y+c3nekPZ1vTg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 9/9] arm64: fpsimd: Remove obsolete cond_yield macro
Date: Tue, 31 Mar 2026 17:05:48 -0700
Message-ID: <20260401000548.133151-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401000548.133151-1-ebiggers@kernel.org>
References: <20260401000548.133151-1-ebiggers@kernel.org>
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

All invocations of the cond_yield macro have been removed, so remove the
macro definition as well.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/include/asm/assembler.h | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index d3d46e5f7188..9d7c9ae5ac96 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -746,32 +746,10 @@ alternative_else_nop_endif
 
 .macro set_sctlr_el2, reg
 	set_sctlr sctlr_el2, \reg
 .endm
 
-	/*
-	 * Check whether asm code should yield as soon as it is able. This is
-	 * the case if we are currently running in task context, and the
-	 * TIF_NEED_RESCHED flag is set. (Note that the TIF_NEED_RESCHED flag
-	 * is stored negated in the top word of the thread_info::preempt_count
-	 * field)
-	 */
-	.macro		cond_yield, lbl:req, tmp:req, tmp2
-#ifdef CONFIG_PREEMPT_VOLUNTARY
-	get_current_task \tmp
-	ldr		\tmp, [\tmp, #TSK_TI_PREEMPT]
-	/*
-	 * If we are serving a softirq, there is no point in yielding: the
-	 * softirq will not be preempted no matter what we do, so we should
-	 * run to completion as quickly as we can. The preempt_count field will
-	 * have BIT(SOFTIRQ_SHIFT) set in this case, so the zero check will
-	 * catch this case too.
-	 */
-	cbz		\tmp, \lbl
-#endif
-	.endm
-
 /*
  * Branch Target Identifier (BTI)
  */
 	.macro  bti, targets
 	.equ	.L__bti_targets_c, 34
-- 
2.53.0


