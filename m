Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F89CD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkIwmE7gk9BuDM3tRTDWMpFUoKQjyNrVcx4rhs4IgJg=; b=rg80ntFMxj3WIw0sLbZZlop0P4
	yoD+r2GL7pXrEDF22WLUGMP++EdqQkm77gpy2ghsTp4jryqUAW5JSLPC1L83bfoNNq1JfJ2fjau/5
	Qhq4Dk1i5joyPon2QFFmGGQuFVbn6ZnaheTnHPH081ANuP4Xe2X6NMA06juDcBQ23J3DB1MSFjBKz
	JFX55Dw1UEf/7eZU0Awt5gzc6ZyWZuSlhUi8XLDpzg1ml0BEW9k+3agT0pvH0LNiyPD2F+Rj/MQX5
	Rj28KE3z6X8iznnR/eei0tT8kOAW4q9DcryBv7gLzixRHBiOJugb/c5zsmUiACbrFI2ft0B3Kh0OU
	FQ6DN2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Ni-0000000150p-1vIe;
	Wed, 13 May 2026 03:35:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0N2-00000001458-1IrN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9E8960180;
	Wed, 13 May 2026 03:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F3CC2BCFB;
	Wed, 13 May 2026 03:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643291;
	bh=voedLEVhufD2EC2qnX2retheCvvJ6sgwG1j/M2rJ6o4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hA06cJnDIUfmXB/3JBgPXTt/tPmcVQStNmHqYSgYdqyZK1z0fhnA5E1Wg+3OSwk4a
	 l8+c9EEraTlHhcNn7ogPeQ/SxzRmhMbzbhv5S5t+feNsOaX+Kpu2J0K4LNjATTU4+X
	 Hsv7TAQEP9qJYXyTOZnWW8Io2lS2QDF3YQ6h7tScpWhbeD2JBV8QITnFwehBfkuSYh
	 p46H1xKZh9y+H9uzV/VPpcoRn3KpKS80XEnstUKE19kRTS2KmXnsYyDhAyzGzSAOn/
	 NxWt21EH45/0Jg707+N2zxMaWD/QGFatK5a9YDhSE1a5Fy/JXEp9CvMx/87hyCf7/R
	 fKGB57IpVN9Bg==
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
Date: Tue, 12 May 2026 20:34:06 -0700
Message-ID: <b3b58101e15e1bb5266e57134f0b65f7d8efdd4b.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
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


