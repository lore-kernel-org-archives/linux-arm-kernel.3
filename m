Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7CECD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 04:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkIwmE7gk9BuDM3tRTDWMpFUoKQjyNrVcx4rhs4IgJg=; b=CRRJFPQ0HuNEpUY48u308OFRAx
	MKURxkASeQnjvavr+Wuin6M/JXGN/9seg8xNRoMm/zukmyYGAmlOs29RgXbXc8f67UoitiVuv2Ooz
	3XagEQ1VX2LMXHtNamy6FjLlvBgk+9m7q1sMWLyuaRjzUaVSlw6+jqBqY63rbSvY2CrrXu8N6jrQM
	OiGVIqGPlOKrbtl3JrVoDC6GsIcx6ZASvh8vlhYHUGQctajgqybk1NU5BGiYMfOey6kDrZ2/KAYjs
	/0SE8FySLiR4G8XZ9rS0sOXH8BG+ZwSfhFhWKiQGpLbSCxW2UvXYHqGkCRXCXyyuwN8mDMA5M38J1
	OFIWWDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Ms-000000013oU-0zJ8;
	Wed, 13 May 2026 03:34:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mn-000000013hl-0dCh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9E55444AC;
	Wed, 13 May 2026 03:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376F0C4AF0C;
	Wed, 13 May 2026 03:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643276;
	bh=voedLEVhufD2EC2qnX2retheCvvJ6sgwG1j/M2rJ6o4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vIprIIHJ/gc88MjsvGV+iSCWjgIRrxQQ7HtYjYUFYhEl5ubF7WygFbdw2O31xsaMF
	 jS8J4tdUeo4ObYLbE+VKPuDMBZGvzs2uAAFNvdgFyBHEG97Ng6EyqprLLUihe1fNMP
	 h66I0LgN0RkUYXKvn7S4HRqFpl63oL++AAZHh3vHTJnTbXxzKKpOpidXg+4w+nrcsY
	 CzP+nWsTp2cB+5utoDbiFdFuN5Dr5dSCwc9OVSwuw7Umz2WcZp17C0CzhyOvCoTJZs
	 Yu+KmX8LPho6lxymdfETKlajMcGtuH7Oik5rXuqUIWr71e+rNJz1fnYa6ZwcyIxiXS
	 acXMyjfLWa0GA==
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
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v3 10/21] objtool: Ignore jumps to the end of the function for checksum runs
Date: Tue, 12 May 2026 20:33:44 -0700
Message-ID: <b3b58101e15e1bb5266e57134f0b65f7d8efdd4b.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203437_210356_3D98B8E8 
X-CRM114-Status: GOOD (  13.36  )
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
Message-ID: <20260513033344.GP6YFP8RNEDEzwRSGqFK2bg_2XjYlsbZiJjlldIoxro@z>

Sometimes Clang arm64 code jumps to the end of the function for UB.
No need to make that an error for checksum runs.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 42 +++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 10b18cf9c3608..73451aef68029 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -37,6 +37,22 @@ struct disas_context *objtool_disas_ctx;
 
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
@@ -1593,10 +1609,14 @@ static int add_jump_destinations(struct objtool_file *file)
 			/*
 			 * GCOV/KCOV dead code can jump to the end of
 			 * the function/section.
+			 *
+			 * Clang on arm64 also does this sometimes for
+			 * undefined behavior.
 			 */
-			if (file->ignore_unreachables && func &&
-			    dest_sec == insn->sec &&
-			    dest_off == func->offset + func->len)
+			if (!validate_branch_enabled() ||
+			    (file->ignore_unreachables && func &&
+			     dest_sec == insn->sec &&
+			     dest_off == func->offset + func->len))
 				continue;
 
 			ERROR_INSN(insn, "can't find jump dest instruction at %s",
@@ -2584,22 +2604,6 @@ static void mark_holes(struct objtool_file *file)
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
2.53.0


