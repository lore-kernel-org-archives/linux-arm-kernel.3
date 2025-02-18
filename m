Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACDBC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=QcGvTVwv0SX6bUdFmpY58vbQdWKKiBSIgUrxWyySk20=; b=uAmGOGk9Fe57W4
	HSnN2fzID2q6RSj+Fp7E5HKH4saOyKupSZkWLZaiPRhTCdhyKminGcZsw8Y92ZiGTGvZM/lueXHk2
	UdhvhYSHQfBidlT4oTxOcWzNKTRC9XxVeFv5QAlmYSuWxG6fVUR6D1MweA/ZQhGV69pNl04woWjJO
	tFfSxKXODGhyVJosaQFMv47FYcnHgp99a89zlmXsDRmbAmxUEhWJPkdr1SvLzGGZlU3M1rP1IUM3n
	lOy30wH8nNAdONkU/we8gDdU7vhzE8NyJDVVRxS/bSAqVAuB71MbvxyJSVRwYGZPrdpY/Gmh7AzSi
	7MuicztAoIpZldhGXJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUCS-00000009ler-2OmE;
	Tue, 18 Feb 2025 20:28:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTlB-00000009flf-1XTO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:00:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9399EA41571;
	Tue, 18 Feb 2025 19:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB20AC4CEEB;
	Tue, 18 Feb 2025 19:59:59 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tkTlW-00000004ApJ-2Ann;
	Tue, 18 Feb 2025 15:00:22 -0500
Message-ID: <20250218200022.373319428@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 18 Feb 2025 14:59:19 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 Zheng Yejian <zhengyejian1@huawei.com>,
 Martin  Kelly <martin.kelly@crowdstrike.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Subject: [PATCH v5 1/6] arm64: scripts/sorttable: Implement sorting mcount_loc at boot for
 arm64
References: <20250218195918.255228630@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_120001_557651_FA4B269A 
X-CRM114-Status: GOOD (  27.10  )
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

From: Steven Rostedt <rostedt@goodmis.org>

The mcount_loc section holds the addresses of the functions that get
patched by ftrace when enabling function callbacks. It can contain tens of
thousands of entries. These addresses must be sorted. If they are not
sorted at compile time, they are sorted at boot. Sorting at boot does take
some time and does have a small impact on boot performance.

x86 and arm32 have the addresses in the mcount_loc section of the ELF
file. But for arm64, the section just contains zeros. The .rela.dyn
Elf_Rela section holds the addresses and they get patched at boot during
the relocation phase.

In order to sort these addresses, the Elf_Rela needs to be updated instead
of the location in the binary that holds the mcount_loc section. Have the
sorttable code, allocate an array to hold the functions, load the
addresses from the Elf_Rela entries, sort them, then put them back in
order into the Elf_rela entries so that they will be sorted at boot up
without having to sort them during boot up.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 arch/arm64/Kconfig  |   1 +
 scripts/sorttable.c | 185 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 183 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 940343beb3d4..4521ecefc031 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -217,6 +217,7 @@ config ARM64
 		if DYNAMIC_FTRACE_WITH_ARGS
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
+	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_GUP_FAST
 	select HAVE_FTRACE_GRAPH_FUNC
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 9f41575afd7a..4a34c275123e 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -28,6 +28,7 @@
 #include <fcntl.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <stdbool.h>
 #include <string.h>
 #include <unistd.h>
 #include <errno.h>
@@ -79,10 +80,16 @@ typedef union {
 	Elf64_Sym	e64;
 } Elf_Sym;
 
+typedef union {
+	Elf32_Rela	e32;
+	Elf64_Rela	e64;
+} Elf_Rela;
+
 static uint32_t (*r)(const uint32_t *);
 static uint16_t (*r2)(const uint16_t *);
 static uint64_t (*r8)(const uint64_t *);
 static void (*w)(uint32_t, uint32_t *);
+static void (*w8)(uint64_t, uint64_t *);
 typedef void (*table_sort_t)(char *, int);
 
 static struct elf_funcs {
@@ -102,6 +109,10 @@ static struct elf_funcs {
 	uint32_t (*sym_name)(Elf_Sym *sym);
 	uint64_t (*sym_value)(Elf_Sym *sym);
 	uint16_t (*sym_shndx)(Elf_Sym *sym);
+	uint64_t (*rela_offset)(Elf_Rela *rela);
+	uint64_t (*rela_info)(Elf_Rela *rela);
+	uint64_t (*rela_addend)(Elf_Rela *rela);
+	void (*rela_write_addend)(Elf_Rela *rela, uint64_t val);
 } e;
 
 static uint64_t ehdr64_shoff(Elf_Ehdr *ehdr)
@@ -262,6 +273,38 @@ SYM_ADDR(value)
 SYM_WORD(name)
 SYM_HALF(shndx)
 
+#define __maybe_unused			__attribute__((__unused__))
+
+#define RELA_ADDR(fn_name)					\
+static uint64_t rela64_##fn_name(Elf_Rela *rela)		\
+{								\
+	return r8((uint64_t *)&rela->e64.r_##fn_name);		\
+}								\
+								\
+static uint64_t rela32_##fn_name(Elf_Rela *rela)		\
+{								\
+	return r((uint32_t *)&rela->e32.r_##fn_name);		\
+}								\
+								\
+static uint64_t __maybe_unused rela_##fn_name(Elf_Rela *rela)	\
+{								\
+	return e.rela_##fn_name(rela);				\
+}
+
+RELA_ADDR(offset)
+RELA_ADDR(info)
+RELA_ADDR(addend)
+
+static void rela64_write_addend(Elf_Rela *rela, uint64_t val)
+{
+	w8(val, (uint64_t *)&rela->e64.r_addend);
+}
+
+static void rela32_write_addend(Elf_Rela *rela, uint64_t val)
+{
+	w(val, (uint32_t *)&rela->e32.r_addend);
+}
+
 /*
  * Get the whole file as a programming convenience in order to avoid
  * malloc+lseek+read+free of many pieces.  If successful, then mmap
@@ -341,6 +384,16 @@ static void wle(uint32_t val, uint32_t *x)
 	put_unaligned_le32(val, x);
 }
 
+static void w8be(uint64_t val, uint64_t *x)
+{
+	put_unaligned_be64(val, x);
+}
+
+static void w8le(uint64_t val, uint64_t *x)
+{
+	put_unaligned_le64(val, x);
+}
+
 /*
  * Move reserved section indices SHN_LORESERVE..SHN_HIRESERVE out of
  * the way to -256..-1, to avoid conflicting with real section
@@ -398,13 +451,12 @@ static inline void *get_index(void *start, int entsize, int index)
 static int extable_ent_size;
 static int long_size;
 
+#define ERRSTR_MAXSZ	256
 
 #ifdef UNWINDER_ORC_ENABLED
 /* ORC unwinder only support X86_64 */
 #include <asm/orc_types.h>
 
-#define ERRSTR_MAXSZ	256
-
 static char g_err[ERRSTR_MAXSZ];
 static int *g_orc_ip_table;
 static struct orc_entry *g_orc_table;
@@ -499,7 +551,19 @@ static void *sort_orctable(void *arg)
 #endif
 
 #ifdef MCOUNT_SORT_ENABLED
+
+/* Only used for sorting mcount table */
+static void rela_write_addend(Elf_Rela *rela, uint64_t val)
+{
+	e.rela_write_addend(rela, val);
+}
+
 static pthread_t mcount_sort_thread;
+static bool sort_reloc;
+
+static long rela_type;
+
+static char m_err[ERRSTR_MAXSZ];
 
 struct elf_mcount_loc {
 	Elf_Ehdr *ehdr;
@@ -508,6 +572,103 @@ struct elf_mcount_loc {
 	uint64_t stop_mcount_loc;
 };
 
+/* Sort the relocations not the address itself */
+static void *sort_relocs(Elf_Ehdr *ehdr, uint64_t start_loc, uint64_t size)
+{
+	Elf_Shdr *shdr_start;
+	Elf_Rela *rel;
+	unsigned int shnum;
+	unsigned int count;
+	int shentsize;
+	void *vals;
+	void *ptr;
+
+	shdr_start = (Elf_Shdr *)((char *)ehdr + ehdr_shoff(ehdr));
+	shentsize = ehdr_shentsize(ehdr);
+
+	vals = malloc(long_size * size);
+	if (!vals) {
+		snprintf(m_err, ERRSTR_MAXSZ, "Failed to allocate sort array");
+		pthread_exit(m_err);
+		return NULL;
+	}
+
+	ptr = vals;
+
+	shnum = ehdr_shnum(ehdr);
+	if (shnum == SHN_UNDEF)
+		shnum = shdr_size(shdr_start);
+
+	for (int i = 0; i < shnum; i++) {
+		Elf_Shdr *shdr = get_index(shdr_start, shentsize, i);
+		void *end;
+
+		if (shdr_type(shdr) != SHT_RELA)
+			continue;
+
+		rel = (void *)ehdr + shdr_offset(shdr);
+		end = (void *)rel + shdr_size(shdr);
+
+		for (; (void *)rel < end; rel = (void *)rel + shdr_entsize(shdr)) {
+			uint64_t offset = rela_offset(rel);
+
+			if (offset >= start_loc && offset < start_loc + size) {
+				if (ptr + long_size > vals + size) {
+					free(vals);
+					snprintf(m_err, ERRSTR_MAXSZ,
+						 "Too many relocations");
+					pthread_exit(m_err);
+					return NULL;
+				}
+
+				/* Make sure this has the correct type */
+				if (rela_info(rel) != rela_type) {
+					free(vals);
+					snprintf(m_err, ERRSTR_MAXSZ,
+						"rela has type %lx but expected %lx\n",
+						(long)rela_info(rel), rela_type);
+					pthread_exit(m_err);
+					return NULL;
+				}
+
+				if (long_size == 4)
+					*(uint32_t *)ptr = rela_addend(rel);
+				else
+					*(uint64_t *)ptr = rela_addend(rel);
+				ptr += long_size;
+			}
+		}
+	}
+	count = ptr - vals;
+	qsort(vals, count / long_size, long_size, compare_extable);
+
+	ptr = vals;
+	for (int i = 0; i < shnum; i++) {
+		Elf_Shdr *shdr = get_index(shdr_start, shentsize, i);
+		void *end;
+
+		if (shdr_type(shdr) != SHT_RELA)
+			continue;
+
+		rel = (void *)ehdr + shdr_offset(shdr);
+		end = (void *)rel + shdr_size(shdr);
+
+		for (; (void *)rel < end; rel = (void *)rel + shdr_entsize(shdr)) {
+			uint64_t offset = rela_offset(rel);
+
+			if (offset >= start_loc && offset < start_loc + size) {
+				if (long_size == 4)
+					rela_write_addend(rel, *(uint32_t *)ptr);
+				else
+					rela_write_addend(rel, *(uint64_t *)ptr);
+				ptr += long_size;
+			}
+		}
+	}
+	free(vals);
+	return NULL;
+}
+
 /* Sort the addresses stored between __start_mcount_loc to __stop_mcount_loc in vmlinux */
 static void *sort_mcount_loc(void *arg)
 {
@@ -517,6 +678,9 @@ static void *sort_mcount_loc(void *arg)
 	uint64_t count = emloc->stop_mcount_loc - emloc->start_mcount_loc;
 	unsigned char *start_loc = (void *)emloc->ehdr + offset;
 
+	if (sort_reloc)
+		return sort_relocs(emloc->ehdr, emloc->start_mcount_loc, count);
+
 	qsort(start_loc, count/long_size, long_size, compare_extable);
 	return NULL;
 }
@@ -866,12 +1030,14 @@ static int do_file(char const *const fname, void *addr)
 		r2	= r2le;
 		r8	= r8le;
 		w	= wle;
+		w8	= w8le;
 		break;
 	case ELFDATA2MSB:
 		r	= rbe;
 		r2	= r2be;
 		r8	= r8be;
 		w	= wbe;
+		w8	= w8be;
 		break;
 	default:
 		fprintf(stderr, "unrecognized ELF data encoding %d: %s\n",
@@ -887,8 +1053,13 @@ static int do_file(char const *const fname, void *addr)
 	}
 
 	switch (r2(&ehdr->e32.e_machine)) {
-	case EM_386:
 	case EM_AARCH64:
+#ifdef MCOUNT_SORT_ENABLED
+		sort_reloc = true;
+		rela_type = 0x403;
+#endif
+		/* fallthrough */
+	case EM_386:
 	case EM_LOONGARCH:
 	case EM_RISCV:
 	case EM_S390:
@@ -932,6 +1103,10 @@ static int do_file(char const *const fname, void *addr)
 			.sym_name		= sym32_name,
 			.sym_value		= sym32_value,
 			.sym_shndx		= sym32_shndx,
+			.rela_offset		= rela32_offset,
+			.rela_info		= rela32_info,
+			.rela_addend		= rela32_addend,
+			.rela_write_addend	= rela32_write_addend,
 		};
 
 		e = efuncs;
@@ -965,6 +1140,10 @@ static int do_file(char const *const fname, void *addr)
 			.sym_name		= sym64_name,
 			.sym_value		= sym64_value,
 			.sym_shndx		= sym64_shndx,
+			.rela_offset		= rela64_offset,
+			.rela_info		= rela64_info,
+			.rela_addend		= rela64_addend,
+			.rela_write_addend	= rela64_write_addend,
 		};
 
 		e = efuncs;
-- 
2.47.2



