Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5746C5AD58
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOZHGJeIbepL3mJdX8opMcoKRte7U11zEhbMcktjANc=; b=QCUZj/rBn7vGAEUscbNaK59slq
	hdWNoNiGbuPwNdIUU+8EG3Cstr4IBOSc0IhG89wJsqYK7yHM1ZcY4vMjZ3uHLjHF3kJDbYCT+NbH9
	lPHQijQjwPZL1zkBp/YlhsH/+6CiTQAwo/5KEEnpqkMrYmqYvNcIQlkLf/tOsfOI/U9WoFzMM/s6k
	ePlHFLbtsdFdUb2Ujbiia0r21GG8XaTCq8eccoNXhoC9FYQIlogfgdfG40onOSx+r4koe92rOoDYr
	1Q+J9z+uJQGtvkrF+5ju5/dMqwoSrScrHkvjJt2Gps+Y73EjieMflKYG4DOr5vRVu/pdJEf+s90Cy
	xxyyYInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJJ-00000009mD4-3Oy9;
	Sat, 08 Aug 2026 23:18:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJH-00000009m9x-47zd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB3F844015;
	Sat,  8 Aug 2026 23:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123E51F00AC4;
	Sat,  8 Aug 2026 23:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231115;
	bh=dOZHGJeIbepL3mJdX8opMcoKRte7U11zEhbMcktjANc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XUHdYqsO0zpCVOBvNEYBw7FpX5o8Dy0WeFYkKuS735DrtZwrgfuloJny+SPE7ziSs
	 dKRIdMxd5ERoCxsnt8sITbi+mGuiu5zTG+svBk3PvOiDPFzK4vuuTl08EGyEYr510U
	 piOi5esgGaDWVz2W4f17zRZU01GHczFJfjh3JRKFgPEvzX8VLWPb59Tpk13TdM60QB
	 hbw2B2zIHDDLp+Bsx4Dwe/LpaN8SGfjnQGKj7hM5DkRIdC8unk71ktCTCz0r6vV4RG
	 jR9u8+WHkZDJYw3OsZj6czlhDFNdbY2NZits11RpXk4dgcru7v96nyS3xPn/HbIHnA
	 gbieQK5GJojOA==
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
Subject: [PATCH v4 12/22] objtool: Ignore jumps to the end of the function for checksum runs
Date: Sat,  8 Aug 2026 16:17:16 -0700
Message-ID: <13cec0336ae0e9ad4bd605bf34b1236de85d6243.1786230311.git.jpoimboe@kernel.org>
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

Sometimes Clang arm64 code jumps to the end of the function for UB.  No
need to make that an error for checksum runs, which are only run
manually by klp-build, and for which caring about UB is out of scope.

Such UBs are still reported for normal validate branch runs (for arches
which do that).

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index b353c7d6cd893..c034676e1b8c7 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -38,6 +38,22 @@ struct disas_context *objtool_disas_ctx;
 
 size_t sym_name_max_len;
 
+static bool validate_branch_enabled(void)
+{
+	return opts.stackval	||
+	       opts.orc		||
+	       opts.uaccess;
+}
+
+static bool alts_needed(void)
+{
+	return validate_branch_enabled()	||
+	       opts.noinstr			||
+	       opts.hack_jump_label		||
+	       opts.disas			||
+	       opts.checksum;
+}
+
 struct instruction *find_insn(struct objtool_file *file,
 			      struct section *sec, unsigned long offset)
 {
@@ -1595,8 +1611,12 @@ static int add_jump_destinations(struct objtool_file *file)
 			/*
 			 * GCOV/KCOV dead code can jump to the end of
 			 * the function/section.
+			 *
+			 * Clang on arm64 also does this sometimes for
+			 * undefined behavior.
 			 */
-			if (file->ignore_unreachables && func &&
+			if ((!validate_branch_enabled() || file->ignore_unreachables) &&
+			    func &&
 			    dest_sec == insn->sec &&
 			    dest_off == func->offset + func->len)
 				continue;
@@ -2586,22 +2606,6 @@ static void mark_holes(struct objtool_file *file)
 	}
 }
 
-static bool validate_branch_enabled(void)
-{
-	return opts.stackval	||
-	       opts.orc		||
-	       opts.uaccess;
-}
-
-static bool alts_needed(void)
-{
-	return validate_branch_enabled()	||
-	       opts.noinstr			||
-	       opts.hack_jump_label		||
-	       opts.disas			||
-	       opts.checksum;
-}
-
 int decode_file(struct objtool_file *file)
 {
 	arch_initial_func_cfi_state(&initial_func_cfi);
-- 
2.54.0


