Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930D4C5AD48
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ca1nwuh/ovV7iRlJ1HipcMmil7CeSekJrBHAP1jRLkM=; b=XmOx+nGtxboI9XAMXNrVzsW5pz
	7bX60ZvAiRa1/FwTxpGXU/9QGVmNYXBC+D/S8bzV9paRMKqDPqLvs30lKCXr5yhYrfE0Nmwlpx4/+
	jE6/kQOTGxGjSbqlS0P8Jh9r85zhh8JfgbcGa7xx2PIGVLAowp3huKVcEwLs1Fbw2dg8+Dj8Z4pjR
	qbl9DCsruQNi4N3g1udA50uxhlg3C+1mcZxBLbUhC9hCrKVjUys04f6D82ZNzbZN5HBbD2eMCvzsc
	z0Ef2mN9Gb2xeKKVdO3ZKVL7ur9kGw2dXlkWR/MLXP6ZonoX6i9UAvIncRKZ+UwXIIm7Mu928mMB6
	PyZ6fdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJJ-00000009mBA-0dvF;
	Sat, 08 Aug 2026 23:18:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJF-00000009m8h-26r8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED79A60120;
	Sat,  8 Aug 2026 23:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFC71F00ADE;
	Sat,  8 Aug 2026 23:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231112;
	bh=ca1nwuh/ovV7iRlJ1HipcMmil7CeSekJrBHAP1jRLkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T8T+/OKR1u9TE8zMCEbQ4TXv1lVbonhiRfkPhEbj9aBh3hZ41aNT296DcWSDQxxxK
	 99oIJh/K451j+TTrApJzmlCGBBkddDrxpw9L/zoLPMkRZ6cuuDLYcKMTMP2T//ZXfx
	 rDoXERtMRV9KJuVPqPju07SwjrfbcQnYcfZ8+JFA7CWCAl3cVrhj/Ggp+neiu9mFYe
	 VfkYbrlLLj7jwmJ+mf6yWW6FpiIbHCZMmfVfmdmtyJTJZLfwngEYTxFrKQDih+6VgT
	 f6ffS9xmOq/1QoRICXUxnnBTRXyNE6ujppyVlcbU72ztkjGYC0DaajkkICYuuWtQjj
	 AkjbnfGEnqanw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v4 08/22] arm64: Remove unnecessary empty alternatives
Date: Sat,  8 Aug 2026 16:17:12 -0700
Message-ID: <a22bffd0fa5b02511fb6e4c1b68af871f260e691.1786230311.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786230311.git.jpoimboe@kernel.org>
References: <cover.1786230311.git.jpoimboe@kernel.org>
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

The code in arch/arm64/mm/cache.S creates three empty alternatives, all
from calling the dcache_by_myline_op_nosync asm macro.  If \op == cvau,
it creates an empty alternative for ARM64_WORKAROUND_4311569.

Since orig_len == 0, the alternative patching code mostly ignores it,
though it does do an unnecessary clean_dcache_range_nopatch().  It also
triggers an objtool error ("empty alternative entry").

Clean it up by moving the .ifnc check outside the alternative emit.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/include/asm/assembler.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index effae53e9739d..6e059efced5bb 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -404,13 +404,13 @@ alternative_else_nop_endif
 	add	\start, \start, \linesz
 	cmp	\start, \end
 	b.lo	.Ldcache_op\@
-alternative_if ARM64_WORKAROUND_4311569
 	.ifnc	\op, cvau
+alternative_if ARM64_WORKAROUND_4311569
 	mov	\start, \tmp
 	mov	\tmp, xzr
 	cbnz	\start, .Ldcache_op\@
-	.endif
 alternative_else_nop_endif
+	.endif
 
 	_cond_uaccess_extable .Ldcache_op\@, \fixup
 	.endm
-- 
2.54.0


