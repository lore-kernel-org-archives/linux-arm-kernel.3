Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45817CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKDO1XhgPKH5lxVyAZRVIXmcZuK1xmZ3yRxilLcIFsM=; b=jAGFkk98XEUqFoOlNZKDifrCux
	a+6GQy2J7TCdX3XMRW7HRrONUa+2DxNRqeJUVVGXXg0mR+30hyEnHyouaiDAXEUHh0ANTfV48Zq5d
	Z1qWQAJ12Os1MrRwwNi4lW6qEtia2Y8elKMyIyMNEAH77rfcVNApiNqySaG59wDgtUftDHpU4quND
	FVVi3TX58vO0ZngBGweTNGZdR3O7SlTNnnYpBmQI8a2qeyqhCAFk2pNDyOAR2PDfG5n2vNyQbwZrP
	gioxhXRNNZa9JoIFlOKz+HcEKuaBrsUfVcCVOU2msRCdcwZ9DRlcC0piKZW+fBwmbbfe/xbxyL7Nt
	ZnX6ImTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mt-000000013rQ-31IL;
	Wed, 13 May 2026 03:34:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mq-000000013jj-00RI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75F96601EE;
	Wed, 13 May 2026 03:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9505C2BCC7;
	Wed, 13 May 2026 03:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643279;
	bh=OGkHFIyLNKCb25myeDpCNSwUOYdeu6CUYnno4eQa9zw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ah2axMr4EVLERHF+dnOZr5VI9jvDAdtuAyWJTRuQv9RnMa1jfIlqLPyK5QlrfsxyQ
	 KrENRLOm7JudFMwOaZTSb+QyQhCxSIjwtY2Pmy9TXIKyt8dQNjYqH9W7Y/ROuee/Gg
	 uPRGCMrXfqU1NRhss9+jN456TRlkTTglLYF847XUEA5Qp9SgDQNRepqBd2ujY81gs6
	 i0eekvEvXdGD5zpnQoi58wG8WnQU6f41xd0sL+LeVmOEEfrn68ZhC/s7ob4Jdsq+gE
	 y9lCdnw8g+SQeQZ6ULMyoTOOKvUQm8H7eyvtwJtM05au6lJ+DSXNEthqskxsLj0S7P
	 FLFsy4ZGARSWA==
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
Subject: [PATCH v3 14/21] objtool: Prevent kCFI hashes from being decoded as instructions
Date: Tue, 12 May 2026 20:33:48 -0700
Message-ID: <b1d50c9fc9e6b9bca43833cc4ccbd88a31fed84b.1778642120.git.jpoimboe@kernel.org>
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

On arm64 with CONFIG_CFI=y, Clang places a 4-byte kCFI type hash
immediately before each address-taken function entry.  Since these
hashes are in the text section, objtool tries to decode them, leading to
unpredictable results (e.g., "unannotated intra-function call").

arm64 uses mapping symbols to annotate where code ends and data begins
(and vice versa).  Use those to just mark such "instructions" as NOP so
objtool will ignore them.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c               | 15 +++++++++++++++
 tools/objtool/include/objtool/elf.h |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index e05dc7a93dc1e..2b03a2d6fc952 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -25,6 +25,7 @@
 #include <linux/kernel.h>
 #include <linux/static_call_types.h>
 #include <linux/string.h>
+#include <linux/kconfig.h>
 
 static unsigned long nr_cfi, nr_cfi_reused, nr_cfi_cache;
 
@@ -428,6 +429,8 @@ static int decode_instructions(struct objtool_file *file)
 
 	for_each_sec(file->elf, sec) {
 		struct instruction *insns = NULL;
+		struct symbol *map_sym;
+		bool is_data = false;
 		u8 prev_len = 0;
 		u8 idx = 0;
 
@@ -454,6 +457,8 @@ static int decode_instructions(struct objtool_file *file)
 		if (!strcmp(sec->name, ".init.text") && !opts.module)
 			sec->init = true;
 
+		map_sym = list_first_entry(&sec->symbol_list, struct symbol, list);
+
 		for (offset = 0; offset < sec_size(sec); offset += insn->len) {
 			if (!insns || idx == INSN_CHUNK_MAX) {
 				insns = calloc(INSN_CHUNK_SIZE, sizeof(*insn));
@@ -478,6 +483,16 @@ static int decode_instructions(struct objtool_file *file)
 
 			prev_len = insn->len;
 
+			/* Use mapping symbols to skip data in text sections */
+			sec_for_each_sym_from(sec, map_sym) {
+				if (map_sym->offset > offset)
+					break;
+				if (is_mapping_sym(map_sym))
+					is_data = is_data_mapping_sym(map_sym);
+			}
+			if (is_data)
+				insn->type = INSN_NOP;
+
 			/*
 			 * By default, "ud2" is a dead end unless otherwise
 			 * annotated, because GCC 7 inserts it for certain
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index d895023674673..9d36b14f420e2 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -507,6 +507,9 @@ static inline void set_sym_next_reloc(struct reloc *reloc, struct reloc *next)
 #define sec_for_each_sym(sec, sym)					\
 	list_for_each_entry(sym, &sec->symbol_list, list)
 
+#define sec_for_each_sym_from(sec, sym)					\
+	list_for_each_entry_from(sym, &sec->symbol_list, list)
+
 #define sec_prev_sym(sym)						\
 	sym->sec && sym->list.prev != &sym->sec->symbol_list ?		\
 	list_prev_entry(sym, list) : NULL
-- 
2.53.0


