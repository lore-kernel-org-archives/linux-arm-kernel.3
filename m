Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D669ACD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/htPtQr6aQdXHdH+fTmj7gGZcJiVUckhDYNdXH3UMbc=; b=hyyUjNbhggTOgmPsa+N9xOXuYd
	EGk+guYo++nEiqFkT0iRYg4MbvEKU57+ULXAj9cIW/JqGx+ZnnrXGhmqLy7TzVnpAWIUK8iPGZcGp
	ZzZCZnpuHAE4cNoIbyNfpq3aYTgvEzAJA2pGjQ/Gm+4+WmtnP5J/eQ1wN7IOBFS0NEwID6rzrPSQ7
	Gzd+/3NxMhl2cdEdKu6W7MBODPI/xTOHx9hxXMEjDB91z4wR4UVUokuJ+chmPje66fZ4I+5dAssCL
	Ta/7byWT8WVUNn0rcxFq1mnNY1+v68UoXMGOJMeokflaS3sCfVWv2e4x8cz9lRW32u0qMvS8fnhNR
	nkNxZKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mt-000000013py-14D9;
	Wed, 13 May 2026 03:34:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mo-000000013gm-0QHM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0719042E02;
	Wed, 13 May 2026 03:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA11C2BCFA;
	Wed, 13 May 2026 03:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643277;
	bh=Ny02yZ3OX6brRIw4EOBZjdfKy5OscDww5EM574zM+io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mOASekOAsmnOnYUmzF3F+Q0rRFnHaxnhe3S+uBgM0liO5vZQPGbIqBpvBzG4KKg9/
	 jnY/29NBFmI4u41tRozrForv8RHWrFaln1nTDDjCX/EU9hlb5ad/s1F2QON9m73xdL
	 UotJbBTnOOECnE1upsjSGWRsz0JMvRTm89zKzeMZUqFUKEE/s8sXmC2ajZ0RnoDz0X
	 D6MpI5ZyCFcvvzNmoLvNznW4UBpz0yhPxzO0R9Z4L2CbUZk2zw+6Z0LSrThnLl7C5q
	 RdEkFOvJL9pPsGB8ppbNiFJUhxBpVDmMaKlgb8ZTz6chBTcV0uhXegtB8YhWVcCiH4
	 kM6cKVD5ZbZew==
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
Subject: [PATCH v3 12/21] objtool: Refactor elf_add_data() to use a growable data buffer
Date: Tue, 12 May 2026 20:33:46 -0700
Message-ID: <a0fe2363d017a2833e98ae50de797fe55c2796a4.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203438_186080_EF913D65 
X-CRM114-Status: GOOD (  18.81  )
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

Instead of calling elf_newdata() for each new piece of data with its own
separate buffer, keep it all in the same growable buffer so the
section's entire data can be accessed if needed.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/elf.c                 | 123 ++++++++++++++--------------
 tools/objtool/include/objtool/elf.h |  13 ++-
 2 files changed, 71 insertions(+), 65 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 33c95a74a51bd..e09bb0a63be35 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1134,9 +1134,6 @@ static int read_relocs(struct elf *elf)
 
 		rsec->base->rsec = rsec;
 
-		/* nr_alloc_relocs=0: libelf owns d_buf */
-		rsec->nr_alloc_relocs = 0;
-
 		rsec->relocs = calloc(sec_num_entries(rsec), sizeof(*reloc));
 		if (!rsec->relocs) {
 			ERROR_GLIBC("calloc");
@@ -1395,7 +1392,7 @@ unsigned int elf_add_string(struct elf *elf, struct section *strtab, const char
 
 void *elf_add_data(struct elf *elf, struct section *sec, const void *data, size_t size)
 {
-	unsigned long offset;
+	unsigned long offset, size_old, size_new, alloc_size_old, alloc_size_new;
 	Elf_Scn *s;
 
 	if (!sec->sh.sh_addralign) {
@@ -1409,30 +1406,55 @@ void *elf_add_data(struct elf *elf, struct section *sec, const void *data, size_
 		return NULL;
 	}
 
-	sec->data = elf_newdata(s);
 	if (!sec->data) {
-		ERROR_ELF("elf_newdata");
-		return NULL;
+		sec->data = elf_newdata(s);
+		if (!sec->data) {
+			ERROR_ELF("elf_newdata");
+			return NULL;
+		}
+
+		sec->data->d_align = sec->sh.sh_addralign;
 	}
 
-	sec->data->d_buf = calloc(1, size);
-	if (!sec->data->d_buf) {
-		ERROR_GLIBC("calloc");
-		return NULL;
+	size_old = sec->data->d_size;
+	offset = ALIGN(size_old, sec->sh.sh_addralign);
+	size_new = offset + size;
+
+	if (!sec->data_overallocated)
+		alloc_size_old = size_old;
+	else
+		alloc_size_old = max(64UL, roundup_pow_of_two(size_old ? : 1));
+
+	alloc_size_new = max(64UL, roundup_pow_of_two(size_new ? : 1));
+
+	if (alloc_size_new > alloc_size_old) {
+		void *orig_buf = sec->data->d_buf;
+
+		sec->data->d_buf = calloc(1, alloc_size_new);
+		if (!sec->data->d_buf) {
+			ERROR_GLIBC("calloc");
+			return NULL;
+		}
+
+		if (size_old)
+			memcpy(sec->data->d_buf, orig_buf, size_old);
+
+		if (orig_buf && sec->data_owned)
+			free(orig_buf);
+
+		sec->data_owned = 1;
+		sec->data_overallocated = 1;
 	}
 
 	if (data)
-		memcpy(sec->data->d_buf, data, size);
-
-	sec->data->d_size = size;
-	sec->data->d_align = sec->sh.sh_addralign;
-
-	offset = ALIGN(sec_size(sec), sec->sh.sh_addralign);
-	sec->sh.sh_size = offset + size;
+		memcpy(sec->data->d_buf + offset, data, size);
+	else
+		memset(sec->data->d_buf + offset, 0, size);
 
+	sec->data->d_size = size_new;
+	sec->sh.sh_size = size_new;
 	mark_sec_changed(elf, sec, true);
-
-	return sec->data->d_buf;
+	return sec->data->d_buf + offset;
 }
 
 struct section *elf_create_section(struct elf *elf, const char *name,
@@ -1483,6 +1505,8 @@ struct section *elf_create_section(struct elf *elf, const char *name,
 			ERROR_GLIBC("calloc");
 			return NULL;
 		}
+
+		sec->data_owned = 1;
 	}
 
 	if (!gelf_getshdr(s, &sec->sh)) {
@@ -1533,60 +1557,33 @@ static int elf_alloc_reloc(struct elf *elf, struct section *rsec)
 	struct reloc *old_relocs, *old_relocs_end, *new_relocs;
 	unsigned int nr_relocs_old = sec_num_entries(rsec);
 	unsigned int nr_relocs_new = nr_relocs_old + 1;
-	unsigned long nr_alloc;
+	unsigned long nr_alloc_old = 0, nr_alloc_new;
 	struct symbol *sym;
 
-	if (!rsec->data) {
-		rsec->data = elf_newdata(elf_getscn(elf->elf, rsec->idx));
-		if (!rsec->data) {
-			ERROR_ELF("elf_newdata");
-			return -1;
-		}
+	if (!elf_add_data(elf, rsec, NULL, elf_rela_size(elf)))
+		return -1;
 
-		rsec->data->d_align = 1;
-		rsec->data->d_type = ELF_T_RELA;
-		rsec->data->d_buf = NULL;
-	}
+	rsec->data->d_type = ELF_T_RELA;
 
-	rsec->data->d_size = nr_relocs_new * elf_rela_size(elf);
-	rsec->sh.sh_size   = rsec->data->d_size;
+	if (rsec->relocs_overallocated)
+		nr_alloc_old = max(64UL, roundup_pow_of_two(nr_relocs_old ? : 1));
+	else
+		nr_alloc_old = nr_relocs_old;
 
-	nr_alloc = max(64UL, roundup_pow_of_two(nr_relocs_new));
-	if (nr_alloc <= rsec->nr_alloc_relocs)
+	nr_alloc_new = max(64UL, roundup_pow_of_two(nr_relocs_new ? : 1));
+
+	if (nr_alloc_old == nr_alloc_new)
 		return 0;
 
-	if (rsec->data->d_buf && !rsec->nr_alloc_relocs) {
-		void *orig_buf = rsec->data->d_buf;
-
-		/*
-		 * The original d_buf is owned by libelf so it can't be
-		 * realloced.
-		 */
-		rsec->data->d_buf = malloc(nr_alloc * elf_rela_size(elf));
-		if (!rsec->data->d_buf) {
-			ERROR_GLIBC("malloc");
-			return -1;
-		}
-		memcpy(rsec->data->d_buf, orig_buf,
-		       nr_relocs_old * elf_rela_size(elf));
-	} else {
-		rsec->data->d_buf = realloc(rsec->data->d_buf,
-					    nr_alloc * elf_rela_size(elf));
-		if (!rsec->data->d_buf) {
-			ERROR_GLIBC("realloc");
-			return -1;
-		}
-	}
-
-	rsec->nr_alloc_relocs = nr_alloc;
-
-	old_relocs = rsec->relocs;
-	new_relocs = calloc(nr_alloc, sizeof(struct reloc));
+	new_relocs = calloc(nr_alloc_new, sizeof(struct reloc));
 	if (!new_relocs) {
 		ERROR_GLIBC("calloc");
 		return -1;
 	}
 
+	rsec->relocs_overallocated = 1;
+
+	old_relocs = rsec->relocs;
 	if (!old_relocs)
 		goto done;
 
@@ -1631,6 +1628,7 @@ static int elf_alloc_reloc(struct elf *elf, struct section *rsec)
 	}
 
 	free(old_relocs);
+
 done:
 	rsec->relocs = new_relocs;
 	return 0;
@@ -1660,7 +1658,6 @@ struct section *elf_create_rela_section(struct elf *elf, struct section *sec,
 	if (nr_relocs) {
 		rsec->data->d_type = ELF_T_RELA;
 
-		rsec->nr_alloc_relocs = nr_relocs;
 		rsec->relocs = calloc(nr_relocs, sizeof(struct reloc));
 		if (!rsec->relocs) {
 			ERROR_GLIBC("calloc");
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index d9c44df9cc76a..0801fcad516bb 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -58,9 +58,18 @@ struct section {
 	Elf_Data *data;
 	const char *name;
 	int idx;
-	bool _changed, text, rodata, noinstr, init, truncate;
+	u32 _changed			: 1,
+	    text			: 1,
+	    rodata			: 1,
+	    noinstr			: 1,
+	    init			: 1,
+	    truncate			: 1,
+	    data_owned			: 1,
+	    data_overallocated		: 1,
+	    relocs_overallocated	: 1;
+	    /* 23 bit hole */
+
 	struct reloc *relocs;
-	unsigned long nr_alloc_relocs;
 	struct section *twin;
 };
 
-- 
2.53.0


