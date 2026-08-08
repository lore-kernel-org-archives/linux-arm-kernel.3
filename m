Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B7DC5AD48
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11okBX/oyddYUFhNnABa0TgcLV3f69gdODt8HzLMfH4=; b=J80L2Vgg5DcY5e+ktphrKIufjE
	famyc+zQycPA5cI81mU8DaPdjZxRIxi8t0QYPmuwalsnAEK2kYK99onoPsI6akdW6FcNI/cSB5KLE
	01zNCb1T7VpuYghcozd2t5Fi0KzqQyn2aai9hAVgW0O+6wdZ/qk9DK+ycjsOAi1wMk1BX3Geh5rWa
	kJftlTRu1lgjO/2KctKrlKxd3kfBTWOBkLyn2nrvV09NjtuQziyRaM4qFi+nmacOjjDoeyArUHjuP
	GDW5LoKcEymiGpHnsmjkIL5XdwoWPKUnVM4U0La0y4TEsusTl+9lKdQjb/9rMoKj/+hCmD/IhtR+F
	wpdD6NFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJZ-00000009mTb-1QdI;
	Sat, 08 Aug 2026 23:18:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJJ-00000009mBS-1uzU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3585C4404B;
	Sat,  8 Aug 2026 23:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873B11F000E9;
	Sat,  8 Aug 2026 23:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231117;
	bh=11okBX/oyddYUFhNnABa0TgcLV3f69gdODt8HzLMfH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=orXOKo9qjPR4tUoRyS5GrhezG1fuSJkv0VWZxXK9NjhMCbP/DU0ccXupgX1G8cm24
	 AShdnfnt9F2eQZVGq6xMXVfMBw1O8wGr9VUq2XozBYzabR66Y1XURLcWIyq61e5Hsp
	 UOSolX1rPDFgJG/DjdHfIq9zcHORTqMRG27ljFDlBj6msHvV67Puusl9UlhvzyPhcI
	 okqJ69D9WSbO5mwshpN9zfhvdhGJEO/VF0q2bq+76foiOdehXLkEMP6ovj/5g8rpgW
	 lXE2QpQHy1lYYy7QtycuIOGMxuDbsZgw/KNeTy0Quh3itRAM7Pnh+Affq0wxR/Eyew
	 EbODE/gG8+MTA==
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
Subject: [PATCH v4 14/22] objtool: Reuse string references
Date: Sat,  8 Aug 2026 16:17:18 -0700
Message-ID: <e0856be4208a6bed2b22dffe2bf8e010470f49cf.1786230311.git.jpoimboe@kernel.org>
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
index 8bf225d70d918..3bb04d6155a8b 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1379,9 +1379,27 @@ struct elf *elf_create_file(GElf_Ehdr *ehdr, const char *name)
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
@@ -1395,12 +1413,11 @@ unsigned int elf_add_string(struct elf *elf, struct section *strtab, const char
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
index 527dd10859de4..5cba96c6392cb 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -188,7 +188,8 @@ struct symbol *elf_create_section_symbol(struct elf *elf, struct section *sec);
 void *elf_add_data(struct elf *elf, struct section *sec, const void *data,
 		   size_t size);
 
-unsigned int elf_add_string(struct elf *elf, struct section *strtab, const char *str);
+int elf_find_string(struct elf *elf, struct section *strtab, const char *str);
+int elf_add_string(struct elf *elf, struct section *strtab, const char *str);
 
 struct reloc *elf_create_reloc(struct elf *elf, struct section *sec,
 			       unsigned long offset, struct symbol *sym,
diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index 19dcf930a562b..446ea6f9864a1 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -1543,7 +1543,9 @@ static int clone_reloc(struct elfs *e, struct reloc *patched_reloc,
 
 		__dbg_clone("\"%s\"", escape_str(str));
 
-		addend = elf_add_string(e->out, out_sym->sec, str);
+		addend = elf_find_string(e->out, out_sym->sec, str);
+		if (addend == -1)
+			addend = elf_add_string(e->out, out_sym->sec, str);
 		if (addend == -1)
 			return -1;
 	}
-- 
2.54.0


