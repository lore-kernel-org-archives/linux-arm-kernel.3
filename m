Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9030C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3L2odPB0Cqn2yHa+6ffnlbmn8mWjN2zdGF3gz1mUp8=; b=aiRx2nKS/XEgZJK2mHZHkDAl3U
	tEFSeFdxS/yRCsvX7VIkKEN2/mwHoM/usrDRKh2ctErKvOyvshw0sBzJ9ZbIefmkqJnddxMNOtmfu
	DUkcVsqI/GO5JsskRFEXK9PuW5D3DsIK/aQvMJ9vDlaMfuADtzQ8Q5MfW2Qc5vgRuaZ4GOIKEnj8y
	qPDGLHATQGvJyhTK2UugMl+Oq99lsPVdZAMqhP+cxdO9zyibsuhp+L/7h5NsJesv7EqZe7og5ZUNO
	Mvw0G+ItSNitChIk5SUuJv1sOCN6eh/9d/57HJy1hvauBswP8RDQEBXBqm19YswdRO5mi0fdjxxWV
	1RlfSXlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJZ-00000009mU3-1wVy;
	Sat, 08 Aug 2026 23:18:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJK-00000009mEU-2iup
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CE6D60A7C;
	Sat,  8 Aug 2026 23:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FE91F00ACF;
	Sat,  8 Aug 2026 23:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231117;
	bh=s3L2odPB0Cqn2yHa+6ffnlbmn8mWjN2zdGF3gz1mUp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oGnyOlq8rd6+X7RV6gIx8WqoV2drtTWpbXix0ITH2u30QDMfHwJZaVyaaebxaF4gc
	 VyuExwvK8547OKW+Luw0nZYG1FucqQ02IbCizs4oknJJ81p13LQ/1ouS54J+6iVtTY
	 q13BrccZEQg/cwpMKOz3OLxWoeKqzEw0J89p1NE4p9I6AE9Ct4u9rZqYIPLXCWDIYg
	 IxB13xYOI9H8gtOEOQ7B9jxQ9WNjOczZ859m8DE3FaitlXrUGszoVHcx+4i2Z5Nmjv
	 /r4L0v39ZKP/miBxqUu7J1Q4bdjmJkIIMITmo2jXuW1m6BZSrCQcB9AB56DL3k1Hed
	 ddzkcCg1ObSpQ==
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
Subject: [PATCH v4 15/22] objtool: Prevent kCFI hashes from being decoded as instructions
Date: Sat,  8 Aug 2026 16:17:19 -0700
Message-ID: <11e49187e13d36d4257bc60cd2606e0ff5481dfc.1786230311.git.jpoimboe@kernel.org>
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

On arm64 with CONFIG_CFI=y, Clang places a 4-byte kCFI type hash
immediately before each address-taken function entry.  Since these
hashes are in the text section, objtool tries to decode them, leading to
unpredictable results (e.g., ""unannotated intra-function call").

arm64 toolchains use mapping symbols to annotate boundaries between code
and data.  Use those to just mark such "instructions" as NOP so objtool
ignores them.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c               | 14 ++++++++++++++
 tools/objtool/include/objtool/elf.h | 23 +++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index c034676e1b8c7..79b9e2b5d96de 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -430,6 +430,8 @@ static int decode_instructions(struct objtool_file *file)
 
 	for_each_sec(file->elf, sec) {
 		struct instruction *insns = NULL;
+		struct symbol *map_sym;
+		bool is_data = false;
 		u8 prev_len = 0;
 		u8 idx = 0;
 
@@ -456,6 +458,8 @@ static int decode_instructions(struct objtool_file *file)
 		if (!strcmp(sec->name, ".init.text") && !opts.module)
 			sec->init = true;
 
+		map_sym = list_first_entry(&sec->symbol_list, struct symbol, list);
+
 		for (offset = 0; offset < sec_size(sec); offset += insn->len) {
 			if (!insns || idx == INSN_CHUNK_MAX) {
 				insns = calloc(INSN_CHUNK_SIZE, sizeof(*insn));
@@ -480,6 +484,16 @@ static int decode_instructions(struct objtool_file *file)
 
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
index 5cba96c6392cb..796d154d447b6 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -296,6 +296,26 @@ static inline bool is_notype_sym(struct symbol *sym)
 	return sym->type == STT_NOTYPE;
 }
 
+/*
+ * ARM64 mapping symbols ($d, $x, $a, __pi_$d, etc) which mark transitions
+ * between code and data.
+ */
+static inline bool is_mapping_sym(struct symbol *sym)
+{
+	return is_notype_sym(sym) && strchr(sym->name, '$');
+}
+
+static inline bool is_data_mapping_sym(struct symbol *sym)
+{
+	const char *dollar;
+
+	if (!is_mapping_sym(sym))
+		return false;
+
+	dollar = strchr(sym->name, '$');
+	return dollar && dollar[1] == 'd';
+}
+
 static inline bool is_global_sym(struct symbol *sym)
 {
 	return sym->bind == STB_GLOBAL;
@@ -508,6 +528,9 @@ static inline void set_sym_next_reloc(struct reloc *reloc, struct reloc *next)
 #define sec_for_each_sym(sec, sym)					\
 	list_for_each_entry(sym, &sec->symbol_list, list)
 
+#define sec_for_each_sym_from(sec, sym)					\
+	list_for_each_entry_from(sym, &sec->symbol_list, list)
+
 #define sec_prev_sym(sym)						\
 	sym->sec && sym->list.prev != &sym->sec->symbol_list ?		\
 	list_prev_entry(sym, list) : NULL
-- 
2.54.0


