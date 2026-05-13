Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6246BCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVPE7oOVfGnNr6jF7jIWIckta4AQ9Sxz6dWYpY6hciU=; b=y0KwyAkahjFA3EdZgg7ap0qg0e
	1vZIo/Cj62Jzv/D/EB5xxYcUSqTsR/pJU7FlGgQL24QZU8nfphUT+wRoTgSAEQQDsdKXxaextkHNr
	4gaTTpTeNoTc008hCFujWwA6cHj8b6tRmvgbmwHQPU3xYc+uWu07alJksvXS1rviVOfcMMkcgyF2b
	ptnISJmdWW26Bfy2ktvJorKkvrvnqxnUYN3MwJjdj6CZy10PkJyMuO4wmBmSIRnTf2Sq0w1sDSSAj
	rWU3n1/Iy7wMgvzyzSa+9BITupIOfjWe9dUUX+plPc6Lv8tpmNUdnarLrz7AWtosewsd/T/WRgk0E
	2hNou+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Nk-0000000156s-18Pm;
	Wed, 13 May 2026 03:35:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0N5-000000014AF-1XXC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C604761143;
	Wed, 13 May 2026 03:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAC3C2BCFD;
	Wed, 13 May 2026 03:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643293;
	bh=lYQ1yov6GYXVE+5pFJSvbDLFJ5lLXCdGtVTWLqgmeuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PGYOhOsB1l9PgfOcHexCpsxifLmrVATJQBGZNZHmdkwnC5oejNuu4vj5eWe0SMaG5
	 lRAZJjthUe+ZNkcKO/ZoRrG8yKxtUxuW1FuUbHJU2ljX0GVApSJ66YmpgceIFV9snr
	 nDShSgveH1aRcIPaZVgFzmwiI6yamzf3v+fX477Q+3u0Ez7SvLPCsND3nnrGBr8hZO
	 Q3xUDrtkn/3spXcF8+4roPjMM/icQ2GV9D6DgSK3O6RYTtortpyX3VA9iQgbnJhmO7
	 OkA4dxPzrkvFgAWYQCV5PfH4T30+EegvDKSY80d28fp7RlZVXYyFW5BeocLWS3xqyn
	 PMWd6gm+hEJhw==
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
Subject: [PATCH v3 13/21] objtool: Reuse string references
Date: Tue, 12 May 2026 20:34:09 -0700
Message-ID: <8881010b54f07432929acb8e704cd6ffcc835318.1778642120.git.jpoimboe@kernel.org>
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
Message-ID: <20260513033409.3Deuzh-UhS9ep0WpZuuY3I8-fwRHB96_HAsFzlcEoNc@z>

For duplicate strings, elf_add_string() just blindly adds duplicates.

That can be a problem for arm64 which often uses two consecutive
instructions (and corresponding relocations) to put an address into a
register, like:

  d8:   90000001        adrp    x1, 0 <meminfo_proc_show>       d8: R_AARCH64_ADR_PREL_PG_HI21  .rodata.meminfo_proc_show.str1.8
  dc:   91000021        add     x1, x1, #0x0    dc: R_AARCH64_ADD_ABS_LO12_NC   .rodata.meminfo_proc_show.str1.8

Referencing two different addresses in the ADRP+ADD pair would corrupt
the memory access.  Avoid that by detecting and reusing duplicates when
cloning string relocs.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/elf.c                 | 29 +++++++++++++++++++++++------
 tools/objtool/include/objtool/elf.h |  3 ++-
 tools/objtool/klp-diff.c            |  4 +++-
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index e09bb0a63be35..065ccfeb98288 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1366,9 +1366,27 @@ struct elf *elf_create_file(GElf_Ehdr *ehdr, const char *name)
 	return elf;
 }
 
-unsigned int elf_add_string(struct elf *elf, struct section *strtab, const char *str)
+int elf_find_string(struct elf *elf, struct section *strtab, const char *str)
 {
-	unsigned int offset;
+	char *d_buf;
+	int i;
+
+	if (!strtab->data)
+		return -1;
+
+	d_buf = strtab->data->d_buf;
+
+	for (i = 0; i < strtab->data->d_size; i += strlen(d_buf + i) + 1) {
+		if (!strcmp(d_buf + i, str))
+			return i;
+	}
+
+	return -1;
+}
+
+int elf_add_string(struct elf *elf, struct section *strtab, const char *str)
+{
+	void *data;
 
 	if (!strtab)
 		strtab = find_section_by_name(elf, ".strtab");
@@ -1382,12 +1400,11 @@ unsigned int elf_add_string(struct elf *elf, struct section *strtab, const char
 		return -1;
 	}
 
-	offset = ALIGN(sec_size(strtab), strtab->sh.sh_addralign);
-
-	if (!elf_add_data(elf, strtab, str, strlen(str) + 1))
+	data = elf_add_data(elf, strtab, str, strlen(str) + 1);
+	if (!data)
 		return -1;
 
-	return offset;
+	return data - strtab->data->d_buf;
 }
 
 void *elf_add_data(struct elf *elf, struct section *sec, const void *data, size_t size)
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index 0801fcad516bb..d895023674673 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -187,7 +187,8 @@ struct symbol *elf_create_section_symbol(struct elf *elf, struct section *sec);
 void *elf_add_data(struct elf *elf, struct section *sec, const void *data,
 		   size_t size);
 
-unsigned int elf_add_string(struct elf *elf, struct section *strtab, const char *str);
+int elf_find_string(struct elf *elf, struct section *strtab, const char *str);
+int elf_add_string(struct elf *elf, struct section *strtab, const char *str);
 
 struct reloc *elf_create_reloc(struct elf *elf, struct section *sec,
 			       unsigned long offset, struct symbol *sym,
diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index 6a1cec57dc6a3..6957292e455e4 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -1509,7 +1509,9 @@ static int clone_reloc(struct elfs *e, struct reloc *patched_reloc,
 
 		__dbg_clone("\"%s\"", escape_str(str));
 
-		addend = elf_add_string(e->out, out_sym->sec, str);
+		addend = elf_find_string(e->out, out_sym->sec, str);
+		if (addend == -1)
+			addend = elf_add_string(e->out, out_sym->sec, str);
 		if (addend == -1)
 			return -1;
 	}
-- 
2.53.0


