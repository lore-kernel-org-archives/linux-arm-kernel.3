Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCD8CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uGcgPPfHiCVQXRsQYzLcjM8rVCdMfd1z7rcqSF9YAY=; b=bSf8RgNemtSG5Y8hCfR5lgi0mZ
	Rh0rUSemaG2X9I0/84cRUxZ4cCnHM9JY91FdABVmvUXzhl86aS5e/Ht/BMbUinXGqn3rga5yfa8h9
	j6uMsE0e2nwpuw74OxhX5S4j/frJh754M/I+tvDDlKN4BYZ81twEHkSu9YEfHpcJL7qcyaKHf7PZn
	XqGUowaLR2SQyf1VomXI43rf534tIiPpwfu9vIa2Ze241+BgOm1XBTWN1Z3HIbthLFsRws+Z2HTUL
	3BlJzD3Mal5PCG3M/d2Xf2Q2gtUZm52Ge0KIjYUAKore3djINbHdtk54NZxhTwGqReAHuBBBilWkL
	A17cF+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0NU-000000014dT-14JM;
	Wed, 13 May 2026 03:35:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Ms-000000013nS-1MOP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B951B60121;
	Wed, 13 May 2026 03:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B667C2BCFA;
	Wed, 13 May 2026 03:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643281;
	bh=/Ud7RFmvMlyU46qLdzlp+gqu1cwu2w70Cyl79KX3OK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I2OyBiEudUrsmZIznVfR/O54GONs6TiMAHM7O2YySrsBSqKIk9S/nxLGH/1112SAj
	 0Ep26F+kuK/6hXJwyhJwzFkRIUHa8o1WNqutJ/hFs1b2DI6K6GmXqNgdpQCiMMSVtE
	 ecRX0CTR80H5QBvpijQBd2ioW0ISr93kv3zpFfDoiiNcEpjagL3LriVWH4oZLZ0F6Y
	 XTaAnnJB2M1NQKYLsccNNjJXuE1c0Zd3837xjTWgSGzjtQqB6mM49jd2TreatvegH5
	 iq3K23teG9JhLda1BmYyvpC++9oXQMabYQco1Nw1+/aGziXbbjSSZcbuVu3xo+LMII
	 badCrHVX/NsAA==
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
Subject: [PATCH v3 18/21] objtool/klp: Clone inline alternative replacements
Date: Tue, 12 May 2026 20:33:52 -0700
Message-ID: <de4d1696be0af867573f559448dd82a16c7d7a24.1778642120.git.jpoimboe@kernel.org>
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

Unlike x86-64, arm64 places alternative replacement instructions in
.text, immediately after the affected function.

So if the replacement instructions have PC-relative branches without
relocations, their offsets relative to the function have to remain
constant.

Achieve that by cloning the function's alternative replacements
immediately after cloning the function itself.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/elf.c                 |  9 +++--
 tools/objtool/include/objtool/elf.h |  7 +++-
 tools/objtool/klp-diff.c            | 63 ++++++++++++++++++++++++-----
 3 files changed, 65 insertions(+), 14 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index a4d9afa3a079c..a5b2929ea0fa9 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1413,14 +1413,15 @@ int elf_add_string(struct elf *elf, struct section *strtab, const char *str)
 		return -1;
 	}
 
-	data = elf_add_data(elf, strtab, str, strlen(str) + 1);
+	data = elf_add_data(elf, strtab, str, strlen(str) + 1, true);
 	if (!data)
 		return -1;
 
 	return data - strtab->data->d_buf;
 }
 
-void *elf_add_data(struct elf *elf, struct section *sec, const void *data, size_t size)
+void *elf_add_data(struct elf *elf, struct section *sec, const void *data,
+		   size_t size, bool align)
 {
 	unsigned long offset, size_old, size_new, alloc_size_old, alloc_size_new;
 	Elf_Scn *s;
@@ -1447,7 +1448,7 @@ void *elf_add_data(struct elf *elf, struct section *sec, const void *data, size_
 	}
 
 	size_old = sec->data->d_size;
-	offset = ALIGN(size_old, sec->sh.sh_addralign);
+	offset = ALIGN(size_old, align ? sec->sh.sh_addralign : 1);
 	size_new = offset + size;
 
 	if (!sec->data_overallocated)
@@ -1590,7 +1591,7 @@ static int elf_alloc_reloc(struct elf *elf, struct section *rsec)
 	unsigned long nr_alloc_old = 0, nr_alloc_new;
 	struct symbol *sym;
 
-	if (!elf_add_data(elf, rsec, NULL, elf_rela_size(elf)))
+	if (!elf_add_data(elf, rsec, NULL, elf_rela_size(elf), true))
 		return -1;
 
 	rsec->data->d_type = ELF_T_RELA;
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index ab1d53ed23189..fba0a0e08f8b6 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -106,6 +106,8 @@ struct symbol {
 	u8 included	     : 1;
 	u8 klp		     : 1;
 	u8 dont_correlate    : 1;
+	u8 fake		     : 1;
+	u8 unalign	     : 1;
 	struct list_head pv_target;
 	struct reloc *relocs;
 	struct section *group_sec;
@@ -186,7 +188,7 @@ struct symbol *elf_create_symbol(struct elf *elf, const char *name,
 struct symbol *elf_create_section_symbol(struct elf *elf, struct section *sec);
 
 void *elf_add_data(struct elf *elf, struct section *sec, const void *data,
-		   size_t size);
+		   size_t size, bool align);
 
 int elf_find_string(struct elf *elf, struct section *strtab, const char *str);
 int elf_add_string(struct elf *elf, struct section *strtab, const char *str);
@@ -532,6 +534,9 @@ static inline void set_sym_next_reloc(struct reloc *reloc, struct reloc *next)
 #define sec_for_each_sym_from(sec, sym)					\
 	list_for_each_entry_from(sym, &sec->symbol_list, list)
 
+#define sec_for_each_sym_continue(sec, sym)				\
+	list_for_each_entry_continue(sym, &sec->symbol_list, list)
+
 #define sec_prev_sym(sym)						\
 	sym->sec && sym->list.prev != &sym->sec->symbol_list ?		\
 	list_prev_entry(sym, list) : NULL
diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index e1d4d94c9d77c..b9624bd9439b9 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -1027,8 +1027,9 @@ static int clone_sym_relocs(struct elfs *e, struct symbol *patched_sym);
 static struct symbol *__clone_symbol(struct elf *elf, struct symbol *patched_sym,
 				     bool data_too)
 {
-	struct section *out_sec = NULL;
 	unsigned long offset = 0, pfx_size = 0;
+	bool align = !patched_sym->unalign;
+	struct section *out_sec = NULL;
 	struct symbol *out_sym;
 
 	if (data_too && !is_undef_sym(patched_sym)) {
@@ -1054,7 +1055,7 @@ static struct symbol *__clone_symbol(struct elf *elf, struct symbol *patched_sym
 		}
 
 		if (!is_sec_sym(patched_sym))
-			offset = ALIGN(sec_size(out_sec), out_sec->sh.sh_addralign);
+			offset = ALIGN(sec_size(out_sec), align ? out_sec->sh.sh_addralign : 1);
 
 		if (patched_sym->len || is_sec_sym(patched_sym)) {
 			void *data = NULL;
@@ -1072,7 +1073,7 @@ static struct symbol *__clone_symbol(struct elf *elf, struct symbol *patched_sym
 			else
 				size = patched_sym->len + pfx_size;
 
-			if (!elf_add_data(elf, out_sec, data, size))
+			if (!elf_add_data(elf, out_sec, data, size, align))
 				return NULL;
 
 			offset += pfx_size;
@@ -1114,6 +1115,37 @@ static const char *sym_bind(struct symbol *sym)
 	}
 }
 
+static struct symbol *clone_symbol(struct elfs *e, struct symbol *patched_sym,
+				   bool data_too);
+
+/*
+ * For arm64 alternatives, the replacement instructions come immediately after
+ * the function.  Clone any such blocks of instructions in place to preserve
+ * their offsets relative to the function in case they have hard-coded PC
+ * relative branches.
+ */
+static int clone_inline_alternatives(struct elfs *e, struct symbol *patched_sym)
+{
+	struct symbol *next;
+
+	if (!__is_defined(ARCH_HAS_INLINE_ALTS) || !is_func_sym(patched_sym))
+		return 0;
+
+	next = patched_sym;
+	sec_for_each_sym_continue(patched_sym->sec, next) {
+		if (next->offset < (patched_sym->offset + patched_sym->len) ||
+		    is_mapping_sym(next))
+			continue;
+		if (!next->fake)
+			break;
+		next->unalign = 1;
+		if (!clone_symbol(e, next, true))
+			return -1;
+	}
+
+	return 0;
+}
+
 /*
  * Copy a symbol to the output object, optionally including its data and
  * relocations.
@@ -1138,7 +1170,13 @@ static struct symbol *clone_symbol(struct elfs *e, struct symbol *patched_sym,
 	if (!__clone_symbol(e->out, patched_sym, data_too))
 		return NULL;
 
-	if (data_too && clone_sym_relocs(e, patched_sym))
+	if (!data_too || is_undef_sym(patched_sym))
+		return patched_sym->clone;
+
+	if (clone_sym_relocs(e, patched_sym))
+		return NULL;
+
+	if (clone_inline_alternatives(e, patched_sym))
 		return NULL;
 
 	return patched_sym->clone;
@@ -1551,7 +1589,7 @@ static int clone_reloc_klp(struct elfs *e, struct reloc *patched_reloc,
 	memset(&klp_reloc, 0, sizeof(klp_reloc));
 
 	klp_reloc.type = reloc_type(patched_reloc);
-	if (!elf_add_data(e->out, klp_relocs, &klp_reloc, sizeof(klp_reloc)))
+	if (!elf_add_data(e->out, klp_relocs, &klp_reloc, sizeof(klp_reloc), true))
 		return -1;
 
 	/* klp_reloc.offset */
@@ -1714,6 +1752,7 @@ static int create_fake_symbol(struct elf *elf, struct section *sec,
 			      unsigned long offset, size_t size)
 {
 	char name[SYM_NAME_LEN];
+	struct symbol *sym;
 	unsigned int type;
 	static int ctr;
 	char *c;
@@ -1730,7 +1769,13 @@ static int create_fake_symbol(struct elf *elf, struct section *sec,
 	 *	       while still allowing objdump to disassemble it.
 	 */
 	type = is_text_sec(sec) ? STT_NOTYPE : STT_OBJECT;
-	return elf_create_symbol(elf, name, sec, STB_LOCAL, type, offset, size) ? 0 : -1;
+
+	sym = elf_create_symbol(elf, name, sec, STB_LOCAL, type, offset, size);
+	if (!sym)
+		return -1;
+
+	sym->fake = 1;
+	return 0;
 }
 
 /*
@@ -2095,7 +2140,7 @@ static int create_klp_sections(struct elfs *e)
 		return -1;
 
 	/* allocate klp_object_ext */
-	obj_data = elf_add_data(e->out, obj_sec, NULL, obj_size);
+	obj_data = elf_add_data(e->out, obj_sec, NULL, obj_size, true);
 	if (!obj_data)
 		return -1;
 
@@ -2130,7 +2175,7 @@ static int create_klp_sections(struct elfs *e)
 			continue;
 
 		/* allocate klp_func_ext */
-		func_data = elf_add_data(e->out, funcs_sec, NULL, func_size);
+		func_data = elf_add_data(e->out, funcs_sec, NULL, func_size, true);
 		if (!func_data)
 			return -1;
 
@@ -2276,7 +2321,7 @@ static int copy_import_ns(struct elfs *e)
 			}
 		}
 
-		if (!elf_add_data(e->out, out_sec, import_ns, strlen(import_ns) + 1))
+		if (!elf_add_data(e->out, out_sec, import_ns, strlen(import_ns) + 1, true))
 			return -1;
 	}
 
-- 
2.53.0


