Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F54C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=5RbhS+zMfnJaqNmZ2hrpoGWgBgTc8EWmgM+o7CODprw=; b=K3UOrFSL3Y+5do
	4iYQMp0K0hn2rb+cbQ6l9HdqVmocNq/9ELwZs67F8kWnilbfWUlCTN5YudyDjGfABloguqwqHx2Ch
	oLC0zLzDI9KkaXwSEc94jjiA5IXDYRuRl+CjYWPeCFbq3PgyiKblss+ATmDL8dYiWzDOvsm1LWOzi
	I+4HhCJE796GkT0D8W62R6LNL9LWXBTAdohyPV6ZsTt7baIyPUF4btLgEuJ3L284ViYZHZaPLqo4+
	nME/9xppVCwH+Lr/oHOW21WNn98UEGjP8KybFJDwjzNSY2eNp5gGzzoYd4vLyC0zfIcsqknALbiRD
	BGjzRH5y9PtgkfmFCnFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUDu-00000009m3Z-1pgC;
	Tue, 18 Feb 2025 20:29:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTlB-00000009flh-22p9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:00:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B71B5C6250;
	Tue, 18 Feb 2025 19:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3757FC4CEE2;
	Tue, 18 Feb 2025 20:00:00 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tkTlW-00000004AqJ-3cQ4;
	Tue, 18 Feb 2025 15:00:22 -0500
Message-ID: <20250218200022.710676551@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 18 Feb 2025 14:59:21 -0500
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
Subject: [PATCH v5 3/6] scripts/sorttable: Always use an array for the mcount_loc sorting
References: <20250218195918.255228630@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_120001_644923_CA6C1284 
X-CRM114-Status: GOOD (  21.27  )
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

The sorting of the mcount_loc section is done directly to the section for
x86 and arm32 but it uses a separate array for arm64 as arm64 has the
values for the mcount_loc stored in the rela sections of the vmlinux ELF
file.

In order to use the same code to remove weak functions, always use a
separate array to do the sorting. This requires splitting up the filling
of the array into one function and the placing the contents of the array
back into the rela sections or into the mcount_loc section into a separate
file.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 scripts/sorttable.c | 122 ++++++++++++++++++++++++++++++++------------
 1 file changed, 90 insertions(+), 32 deletions(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index f62a91d8af0a..ec02a2852efb 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -594,31 +594,19 @@ struct elf_mcount_loc {
 	uint64_t stop_mcount_loc;
 };
 
-/* Sort the relocations not the address itself */
-static void *sort_relocs(Elf_Ehdr *ehdr, uint64_t start_loc, uint64_t size)
+/* Fill the array with the content of the relocs */
+static int fill_relocs(void *ptr, uint64_t size, Elf_Ehdr *ehdr, uint64_t start_loc)
 {
 	Elf_Shdr *shdr_start;
 	Elf_Rela *rel;
 	unsigned int shnum;
-	unsigned int count;
+	unsigned int count = 0;
 	int shentsize;
-	void *vals;
-	void *ptr;
-
-	compare_values = long_size == 4 ? compare_values_32 : compare_values_64;
+	void *array_end = ptr + size;
 
 	shdr_start = (Elf_Shdr *)((char *)ehdr + ehdr_shoff(ehdr));
 	shentsize = ehdr_shentsize(ehdr);
 
-	vals = malloc(long_size * size);
-	if (!vals) {
-		snprintf(m_err, ERRSTR_MAXSZ, "Failed to allocate sort array");
-		pthread_exit(m_err);
-		return NULL;
-	}
-
-	ptr = vals;
-
 	shnum = ehdr_shnum(ehdr);
 	if (shnum == SHN_UNDEF)
 		shnum = shdr_size(shdr_start);
@@ -637,22 +625,18 @@ static void *sort_relocs(Elf_Ehdr *ehdr, uint64_t start_loc, uint64_t size)
 			uint64_t offset = rela_offset(rel);
 
 			if (offset >= start_loc && offset < start_loc + size) {
-				if (ptr + long_size > vals + size) {
-					free(vals);
+				if (ptr + long_size > array_end) {
 					snprintf(m_err, ERRSTR_MAXSZ,
 						 "Too many relocations");
-					pthread_exit(m_err);
-					return NULL;
+					return -1;
 				}
 
 				/* Make sure this has the correct type */
 				if (rela_info(rel) != rela_type) {
-					free(vals);
 					snprintf(m_err, ERRSTR_MAXSZ,
 						"rela has type %lx but expected %lx\n",
 						(long)rela_info(rel), rela_type);
-					pthread_exit(m_err);
-					return NULL;
+					return -1;
 				}
 
 				if (long_size == 4)
@@ -660,13 +644,28 @@ static void *sort_relocs(Elf_Ehdr *ehdr, uint64_t start_loc, uint64_t size)
 				else
 					*(uint64_t *)ptr = rela_addend(rel);
 				ptr += long_size;
+				count++;
 			}
 		}
 	}
-	count = ptr - vals;
-	qsort(vals, count / long_size, long_size, compare_values);
+	return count;
+}
+
+/* Put the sorted vals back into the relocation elements */
+static void replace_relocs(void *ptr, uint64_t size, Elf_Ehdr *ehdr, uint64_t start_loc)
+{
+	Elf_Shdr *shdr_start;
+	Elf_Rela *rel;
+	unsigned int shnum;
+	int shentsize;
+
+	shdr_start = (Elf_Shdr *)((char *)ehdr + ehdr_shoff(ehdr));
+	shentsize = ehdr_shentsize(ehdr);
+
+	shnum = ehdr_shnum(ehdr);
+	if (shnum == SHN_UNDEF)
+		shnum = shdr_size(shdr_start);
 
-	ptr = vals;
 	for (int i = 0; i < shnum; i++) {
 		Elf_Shdr *shdr = get_index(shdr_start, shentsize, i);
 		void *end;
@@ -689,8 +688,32 @@ static void *sort_relocs(Elf_Ehdr *ehdr, uint64_t start_loc, uint64_t size)
 			}
 		}
 	}
-	free(vals);
-	return NULL;
+}
+
+static int fill_addrs(void *ptr, uint64_t size, void *addrs)
+{
+	void *end = ptr + size;
+	int count = 0;
+
+	for (; ptr < end; ptr += long_size, addrs += long_size, count++) {
+		if (long_size == 4)
+			*(uint32_t *)ptr = r(addrs);
+		else
+			*(uint64_t *)ptr = r8(addrs);
+	}
+	return count;
+}
+
+static void replace_addrs(void *ptr, uint64_t size, void *addrs)
+{
+	void *end = ptr + size;
+
+	for (; ptr < end; ptr += long_size, addrs += long_size) {
+		if (long_size == 4)
+			w(*(uint32_t *)ptr, addrs);
+		else
+			w8(*(uint64_t *)ptr, addrs);
+	}
 }
 
 /* Sort the addresses stored between __start_mcount_loc to __stop_mcount_loc in vmlinux */
@@ -699,14 +722,49 @@ static void *sort_mcount_loc(void *arg)
 	struct elf_mcount_loc *emloc = (struct elf_mcount_loc *)arg;
 	uint64_t offset = emloc->start_mcount_loc - shdr_addr(emloc->init_data_sec)
 					+ shdr_offset(emloc->init_data_sec);
-	uint64_t count = emloc->stop_mcount_loc - emloc->start_mcount_loc;
+	uint64_t size = emloc->stop_mcount_loc - emloc->start_mcount_loc;
 	unsigned char *start_loc = (void *)emloc->ehdr + offset;
+	Elf_Ehdr *ehdr = emloc->ehdr;
+	void *e_msg = NULL;
+	void *vals;
+	int count;
+
+	vals = malloc(long_size * size);
+	if (!vals) {
+		snprintf(m_err, ERRSTR_MAXSZ, "Failed to allocate sort array");
+		pthread_exit(m_err);
+	}
 
 	if (sort_reloc)
-		return sort_relocs(emloc->ehdr, emloc->start_mcount_loc, count);
+		count = fill_relocs(vals, size, ehdr, emloc->start_mcount_loc);
+	else
+		count = fill_addrs(vals, size, start_loc);
+
+	if (count < 0) {
+		e_msg = m_err;
+		goto out;
+	}
+
+	if (count != size / long_size) {
+		snprintf(m_err, ERRSTR_MAXSZ, "Expected %u mcount elements but found %u\n",
+			(int)(size / long_size), count);
+		e_msg = m_err;
+		goto out;
+	}
+
+	compare_values = long_size == 4 ? compare_values_32 : compare_values_64;
+
+	qsort(vals, count, long_size, compare_values);
+
+	if (sort_reloc)
+		replace_relocs(vals, size, ehdr, emloc->start_mcount_loc);
+	else
+		replace_addrs(vals, size, start_loc);
+
+out:
+	free(vals);
 
-	qsort(start_loc, count/long_size, long_size, compare_extable);
-	return NULL;
+	pthread_exit(e_msg);
 }
 
 /* Get the address of __start_mcount_loc and __stop_mcount_loc in System.map */
-- 
2.47.2



