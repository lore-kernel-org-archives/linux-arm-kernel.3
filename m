Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3D0C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=Bi8fC0jCdsz21AqvSdU0kXPYT2U+dUBsVQ7lQCLLBH8=; b=WX2IA/hkHZL3dx
	aAdaFrLMRZ28K+d/zpIuFNmbbdcR4Q+JsFOO2BaCmpMehQCigBOVHDe4BCGczTSIoeEXZ1YEp+CcP
	zROfv+9Ma70MAup6d3hMk86X4gHsxl5R37vHNCE/SvjP11Ff1yqnmLpPvzruHk7LO/HvlA47IfGa7
	PqkxRHiEfJLc+p5G2zkIuL2kM49VGcg14x7ztwDN6EPFynG9nD3EICHXBdLqKmEHh9vSAbbRXkR5Z
	x+vLKefJEOFas8LY13qpxBsl31RBKhqfBTZfY2oU+jtVWPR8ShSxx3BkB+RRA8uFQNtBzQ58wt27u
	q6XJL/pbdSQo8ymPFrQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUJh-00000009nTH-0o7P;
	Tue, 18 Feb 2025 20:35:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTlN-00000009fuY-21Pq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Feb 2025 20:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=Bi8fC0jCdsz21AqvSdU0kXPYT2U+dUBsVQ7lQCLLBH8=; b=fUsRDojwFqZkqyMorG2/3ogeDK
	kDrWE1j+8PQE6rfS+Ua3R+G23goYEY5vREF5cCel2d4y+CNKjJ4/Iq+2WtcDQ16uR2AT1YtmhIS62
	NtKmPq1tYZgXYK4dE0Eie9KhyhEeA7YXPLFZFERt0X2t/Um90z5sOWRC4gGG0mI3saH84GE5KQ8QS
	3fXwitsTDT6IaTDiND9LFT8vel9s5mTo3s2Zrig+JwkrTt4wDUx5z8PRKSARYlOVQmXyKYFrJJM/2
	wzF2VQLCLFnFBPnyOi6nppzvYGpoQYLcrqlnpMFsh3h+rjLScCiccwDUhZQ0Ce6X09nu4LSF+KM78
	IWnKnO8g==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTlH-000000022VF-09tU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:00:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34212A41B0B;
	Tue, 18 Feb 2025 19:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7CAC4CEFA;
	Tue, 18 Feb 2025 20:00:00 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tkTlX-00000004Aqo-0918;
	Tue, 18 Feb 2025 15:00:23 -0500
Message-ID: <20250218200022.883095980@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 18 Feb 2025 14:59:22 -0500
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
Subject: [PATCH v5 4/6] scripts/sorttable: Zero out weak functions in mcount_loc table
References: <20250218195918.255228630@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_200007_526188_47680B4D 
X-CRM114-Status: GOOD (  36.72  )
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

When a function is annotated as "weak" and is overridden, the code is not
removed. If it is traced, the fentry/mcount location in the weak function
will be referenced by the "__mcount_loc" section. This will then be added
to the available_filter_functions list. Since only the address of the
functions are listed, to find the name to show, a search of kallsyms is
used.

Since kallsyms will return the function by simply finding the function
that the address is after but before the next function, an address of a
weak function will show up as the function before it. This is because
kallsyms does not save names of weak functions. This has caused issues in
the past, as now the traced weak function will be listed in
available_filter_functions with the name of the function before it.

At best, this will cause the previous function's name to be listed twice.
At worse, if the previous function was marked notrace, it will now show up
as a function that can be traced. Note that it only shows up that it can
be traced but will not be if enabled, which causes confusion.

 https://lore.kernel.org/all/20220412094923.0abe90955e5db486b7bca279@kernel.org/

The commit b39181f7c6907 ("ftrace: Add FTRACE_MCOUNT_MAX_OFFSET to avoid
adding weak function") was a workaround to this by checking the function
address before printing its name. If the address was too far from the
function given by the name then instead of printing the name it would
print: __ftrace_invalid_address___<invalid-offset>

The real issue is that these invalid addresses are listed in the ftrace
table look up which available_filter_functions is derived from. A place
holder must be listed in that file because set_ftrace_filter may take a
series of indexes into that file instead of names to be able to do O(1)
lookups to enable filtering (many tools use this method).

Even if kallsyms saved the size of the function, it does not remove the
need of having these place holders. The real solution is to not add a weak
function into the ftrace table in the first place.

To solve this, the sorttable.c code that sorts the mcount regions during
the build is modified to take a "nm -S vmlinux" input, sort it, and any
function listed in the mcount_loc section that is not within a boundary of
the function list given by nm is considered a weak function and is zeroed
out.

Note, this does not mean they will remain zero when booting as KASLR
will still shift those addresses. To handle this, the entries in the
mcount_loc section will be ignored if they are zero or match the
kaslr_offset() value.

Before:

 ~# grep __ftrace_invalid_address___ /sys/kernel/tracing/available_filter_functions | wc -l
 551

After:

 ~# grep __ftrace_invalid_address___ /sys/kernel/tracing/available_filter_functions | wc -l
 0

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c   |   6 +-
 scripts/link-vmlinux.sh |   4 +-
 scripts/sorttable.c     | 128 +++++++++++++++++++++++++++++++++++++++-
 3 files changed, 134 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 728ecda6e8d4..e3f89924f603 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -7004,6 +7004,7 @@ static int ftrace_process_locs(struct module *mod,
 	unsigned long count;
 	unsigned long *p;
 	unsigned long addr;
+	unsigned long kaslr;
 	unsigned long flags = 0; /* Shut up gcc */
 	int ret = -ENOMEM;
 
@@ -7052,6 +7053,9 @@ static int ftrace_process_locs(struct module *mod,
 		ftrace_pages->next = start_pg;
 	}
 
+	/* For zeroed locations that were shifted for core kernel */
+	kaslr = !mod ? kaslr_offset() : 0;
+
 	p = start;
 	pg = start_pg;
 	while (p < end) {
@@ -7063,7 +7067,7 @@ static int ftrace_process_locs(struct module *mod,
 		 * object files to satisfy alignments.
 		 * Skip any NULL pointers.
 		 */
-		if (!addr) {
+		if (!addr || addr == kaslr) {
 			skipped++;
 			continue;
 		}
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 56a077d204cf..59b07fe6fd00 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -177,12 +177,14 @@ mksysmap()
 
 sorttable()
 {
-	${objtree}/scripts/sorttable ${1}
+	${NM} -S ${1} > .tmp_vmlinux.nm-sort
+	${objtree}/scripts/sorttable -s .tmp_vmlinux.nm-sort ${1}
 }
 
 cleanup()
 {
 	rm -f .btf.*
+	rm -f .tmp_vmlinux.nm-sort
 	rm -f System.map
 	rm -f vmlinux
 	rm -f vmlinux.map
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index ec02a2852efb..23c7e0e6c024 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -580,6 +580,98 @@ static void rela_write_addend(Elf_Rela *rela, uint64_t val)
 	e.rela_write_addend(rela, val);
 }
 
+struct func_info {
+	uint64_t	addr;
+	uint64_t	size;
+};
+
+/* List of functions created by: nm -S vmlinux */
+static struct func_info *function_list;
+static int function_list_size;
+
+/* Allocate functions in 1k blocks */
+#define FUNC_BLK_SIZE	1024
+#define FUNC_BLK_MASK	(FUNC_BLK_SIZE - 1)
+
+static int add_field(uint64_t addr, uint64_t size)
+{
+	struct func_info *fi;
+	int fsize = function_list_size;
+
+	if (!(fsize & FUNC_BLK_MASK)) {
+		fsize += FUNC_BLK_SIZE;
+		fi = realloc(function_list, fsize * sizeof(struct func_info));
+		if (!fi)
+			return -1;
+		function_list = fi;
+	}
+	fi = &function_list[function_list_size++];
+	fi->addr = addr;
+	fi->size = size;
+	return 0;
+}
+
+/* Only return match if the address lies inside the function size */
+static int cmp_func_addr(const void *K, const void *A)
+{
+	uint64_t key = *(const uint64_t *)K;
+	const struct func_info *a = A;
+
+	if (key < a->addr)
+		return -1;
+	return key >= a->addr + a->size;
+}
+
+/* Find the function in function list that is bounded by the function size */
+static int find_func(uint64_t key)
+{
+	return bsearch(&key, function_list, function_list_size,
+		       sizeof(struct func_info), cmp_func_addr) != NULL;
+}
+
+static int cmp_funcs(const void *A, const void *B)
+{
+	const struct func_info *a = A;
+	const struct func_info *b = B;
+
+	if (a->addr < b->addr)
+		return -1;
+	return a->addr > b->addr;
+}
+
+static int parse_symbols(const char *fname)
+{
+	FILE *fp;
+	char addr_str[20]; /* Only need 17, but round up to next int size */
+	char size_str[20];
+	char type;
+
+	fp = fopen(fname, "r");
+	if (!fp) {
+		perror(fname);
+		return -1;
+	}
+
+	while (fscanf(fp, "%16s %16s %c %*s\n", addr_str, size_str, &type) == 3) {
+		uint64_t addr;
+		uint64_t size;
+
+		/* Only care about functions */
+		if (type != 't' && type != 'T' && type != 'W')
+			continue;
+
+		addr = strtoull(addr_str, NULL, 16);
+		size = strtoull(size_str, NULL, 16);
+		if (add_field(addr, size) < 0)
+			return -1;
+	}
+	fclose(fp);
+
+	qsort(function_list, function_list_size, sizeof(struct func_info), cmp_funcs);
+
+	return 0;
+}
+
 static pthread_t mcount_sort_thread;
 static bool sort_reloc;
 
@@ -752,6 +844,21 @@ static void *sort_mcount_loc(void *arg)
 		goto out;
 	}
 
+	/* zero out any locations not found by function list */
+	if (function_list_size) {
+		for (void *ptr = vals; ptr < vals + size; ptr += long_size) {
+			uint64_t key;
+
+			key = long_size == 4 ? r((uint32_t *)ptr) : r8((uint64_t *)ptr);
+			if (!find_func(key)) {
+				if (long_size == 4)
+					*(uint32_t *)ptr = 0;
+				else
+					*(uint64_t *)ptr = 0;
+			}
+		}
+	}
+
 	compare_values = long_size == 4 ? compare_values_32 : compare_values_64;
 
 	qsort(vals, count, long_size, compare_values);
@@ -801,6 +908,8 @@ static void get_mcount_loc(struct elf_mcount_loc *emloc, Elf_Shdr *symtab_sec,
 		return;
 	}
 }
+#else /* MCOUNT_SORT_ENABLED */
+static inline int parse_symbols(const char *fname) { return 0; }
 #endif
 
 static int do_sort(Elf_Ehdr *ehdr,
@@ -1256,14 +1365,29 @@ int main(int argc, char *argv[])
 	int i, n_error = 0;  /* gcc-4.3.0 false positive complaint */
 	size_t size = 0;
 	void *addr = NULL;
+	int c;
+
+	while ((c = getopt(argc, argv, "s:")) >= 0) {
+		switch (c) {
+		case 's':
+			if (parse_symbols(optarg) < 0) {
+				fprintf(stderr, "Could not parse %s\n", optarg);
+				return -1;
+			}
+			break;
+		default:
+			fprintf(stderr, "usage: sorttable [-s nm-file] vmlinux...\n");
+			return 0;
+		}
+	}
 
-	if (argc < 2) {
+	if ((argc - optind) < 1) {
 		fprintf(stderr, "usage: sorttable vmlinux...\n");
 		return 0;
 	}
 
 	/* Process each file in turn, allowing deep failure. */
-	for (i = 1; i < argc; i++) {
+	for (i = optind; i < argc; i++) {
 		addr = mmap_file(argv[i], &size);
 		if (!addr) {
 			++n_error;
-- 
2.47.2



