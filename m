Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019D6C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyIbvSlFzL9tklWdENYxgwn726Q+wXKuuiY2Rfd97J4=; b=EgbgKRyo70t1VLon/xISn/Poii
	lSHWG+FoIeObcrwxY4T1KT1oYZHcuSQ9aeszpSwQHQciyAdJ2RKiTVqJiX2Qk+MJGSF7KlXrQMayc
	LwSNyLeefUaUDzblgTbY6z7TMTzobru5e4uq9ca+vlPHxJmSXg5p2UrScp5IbWhz4HPKWw35Idxjb
	AaEpQtXuJrFyqDDh8ZsDeAV42PjV5Wee0gc1T6/bcxl7ISSenMo0D7dmc4HZ7BhlKJPtIMJLf6QVi
	K6VlnWU/mm2KSzoj9bLyGkjd9vCg0p/6g0a3YnP9jaagD+mE/C16NATHXuFh4k6iZoUfjQKhqVT8Q
	1cGKeRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0br-00000000eG8-2w8w;
	Thu, 08 May 2025 12:44:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0Tx-00000000d4r-3iVh
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 May 2025 12:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iyIbvSlFzL9tklWdENYxgwn726Q+wXKuuiY2Rfd97J4=; b=BRmHJqDfpJXJ3l4YreoZuk8uGd
	X9tRb7xdFrTfBo+ZAInGuPOteh1dgs4IUpUxEcrMtY+56GTpCECc8R8j0m5Gm/D8YVQbPQh9eTDy+
	xpVDpkIBZ75S1MOYHgLVMihfaufogqVXjyYEa71JXMdoQuv+K+iqWoeFj89PUftLfgUnsPJflLqKz
	QPxCmonoHuM8rs/yPNgiZNzDlcsItD4Dh0qIiG3yO5G/u+sU/KWJnW+JA2xY6Plr0saXNFKw3oUUx
	nuSoftp6agE0WVHswtOewcuAwpiTqXGJNS82bGAZgdYliutpjIrlZtVin8FC1I8LdAqbgDz6bvdHb
	Wof3UVaw==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCzfB-0000000G1kw-0LWU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 11:43:42 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-442cdf07ad9so3801125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 04:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746704619; x=1747309419; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iyIbvSlFzL9tklWdENYxgwn726Q+wXKuuiY2Rfd97J4=;
        b=CeeqDsVZekPKhuEwLF746OaoS6lDmTrkjaMJun8JX7FxJM85mrvy97RzppFBLM0Bg6
         Aebz4AkCiiWqHbGgS7Pr2t9rDGVrc50g5jXfggM2zrDOPPtJpsw77YR9P5dkY45TXc8Z
         JzBZSeh4+Hk5xYbIDUg9qvcDSesuzPgOMTXBEtPUY9sp7VmcjYOckT2ZdahesjOYrw7D
         ENfRtt4m8oDiWIogqjothjhm3JHcifuXGWRGfQ4OZrIlueixBpGHR2T3jwu2mZWIMfSB
         2ACjkaekIDdemTsE9KoaYOHYKohxkJEwRFWpV+Je0MaJWDlrzx0OZDMMF0MG2E5MxIoh
         QbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704619; x=1747309419;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iyIbvSlFzL9tklWdENYxgwn726Q+wXKuuiY2Rfd97J4=;
        b=VmD0/jl0aUvzrBab70K3ovLqOt0QD60U+7m6btj9PCAK4t/S5ic6bI6MBycCoN0BNC
         lsXTKuHQdQJsggPlMNmnlBr6xoFJXmrrZhoGVTC8lTBzp2j19iyYc+4zbhU3xg5SHKPD
         h73K3SuG8kvtnWFsw2EV1bqsfsnf+MHzFMqnDSB7Gq5AQq1RD16RrhqMf1X3LKH1RXnM
         T0ioE6WmXH6U4P3klX/UPLBgHxUSiIMpbTTLOSyFu0NVP0ng+U2j5czAjiaJMYY1huMm
         c85AsxhD6hKcfyMAR1bJjh+AP5fBgVEGxVhhwsHi3YCU4oiINtBXLTCvfty+v50zCEPb
         gemw==
X-Gm-Message-State: AOJu0YzREfoRCog1rrINE18oCTpuI9JvssseZ2HkoPWiJLgWx0qKcpDH
	ghVfyzNivYJ27jKe68k1qKijyw9fjeTTBSSfbRNkKw8bvnDBc4lAoxHgIL9Wzz81+BgPOF+af2j
	RZt4udQWEsskHl1+oZYILlUUqLStp71ojjMr3yVhhA0IqlGyvfQqEttD6ZfkMaVilfQEXfntHbW
	cZh/B+ue+Sg8jx4TrCZbWpn7t6veTOsR3yG2Dr9Cv6
X-Google-Smtp-Source: AGHT+IHinN/s8aDJdmtFxeBWr/2xru34oMAhgGDdYH6mvO5OUknD45BG+MK3IR8OLJhr3EqAP/6zAiw5
X-Received: from wmcn28.prod.google.com ([2002:a05:600c:c0dc:b0:442:cd39:5ca4])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4744:b0:43d:fa5d:9314
 with SMTP id 5b1f17b1804b1-441d44e3655mr42698565e9.32.1746704619017; Thu, 08
 May 2025 04:43:39 -0700 (PDT)
Date: Thu,  8 May 2025 13:43:30 +0200
In-Reply-To: <20250508114328.2460610-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250508114328.2460610-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3987; i=ardb@kernel.org;
 h=from:subject; bh=xxf59ivCEFowwWRLXhxeRuA7HoE9SsAg99Xa2A4F2To=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNmxqNvnS+bn2fWfuH/6D/17/wtDhd6Vh8WeS9Ul2O/9
 Dqz8TWmjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRhT8ZGZ78dOoXlfSvv+xV
 JayRlLtx3/olW9++8kxxltZqXnNedDrD/zQOWQ7JdRvmPo3PtT9eoNjxy5f3K7+cbfyp4NAIT7b nLAA=
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508114328.2460610-6-ardb+git@google.com>
Subject: [PATCH v2 1/3] arm64/boot: Move init_pgdir[] and init_idmap_pgdir[]
 into __pi_ namespace
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_124341_358192_67DBCA4E 
X-CRM114-Status: GOOD (  14.51  )
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

From: Ard Biesheuvel <ardb@kernel.org>

init_pgdir[] is only referenced from the startup code, but lives after
BSS in the linker map. Before tightening the rules about accessing BSS
from startup code, move init_pgdir[] into the __pi_ namespace, so it
does not need to be exported explicitly.

For symmetry, do the same with init_idmap_pgdir[], although it lives
before BSS.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 2 --
 arch/arm64/kernel/head.S         | 6 +++---
 arch/arm64/kernel/image-vars.h   | 4 ----
 arch/arm64/kernel/pi/pi.h        | 1 +
 arch/arm64/kernel/vmlinux.lds.S  | 8 ++++----
 5 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d3b538be1500..6a040f0bbfe1 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -754,8 +754,6 @@ static inline bool pud_table(pud_t pud) { return true; }
 				 PUD_TYPE_TABLE)
 #endif
 
-extern pgd_t init_pg_dir[];
-extern pgd_t init_pg_end[];
 extern pgd_t swapper_pg_dir[];
 extern pgd_t idmap_pg_dir[];
 extern pgd_t tramp_pg_dir[];
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 2ce73525de2c..ca04b338cb0d 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -89,7 +89,7 @@ SYM_CODE_START(primary_entry)
 	adrp	x1, early_init_stack
 	mov	sp, x1
 	mov	x29, xzr
-	adrp	x0, init_idmap_pg_dir
+	adrp	x0, __pi_init_idmap_pg_dir
 	mov	x1, xzr
 	bl	__pi_create_init_idmap
 
@@ -101,7 +101,7 @@ SYM_CODE_START(primary_entry)
 	cbnz	x19, 0f
 	dmb     sy
 	mov	x1, x0				// end of used region
-	adrp    x0, init_idmap_pg_dir
+	adrp    x0, __pi_init_idmap_pg_dir
 	adr_l	x2, dcache_inval_poc
 	blr	x2
 	b	1f
@@ -507,7 +507,7 @@ SYM_FUNC_END(__no_granule_support)
 
 SYM_FUNC_START_LOCAL(__primary_switch)
 	adrp	x1, reserved_pg_dir
-	adrp	x2, init_idmap_pg_dir
+	adrp	x2, __pi_init_idmap_pg_dir
 	bl	__enable_mmu
 
 	adrp	x1, early_init_stack
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 5e3c4b58f279..c3b4c0479d5c 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -54,10 +54,6 @@ PROVIDE(__pi_is_midr_in_range_list	= is_midr_in_range_list);
 PROVIDE(__pi__ctype			= _ctype);
 PROVIDE(__pi_memstart_offset_seed	= memstart_offset_seed);
 
-PROVIDE(__pi_init_idmap_pg_dir		= init_idmap_pg_dir);
-PROVIDE(__pi_init_idmap_pg_end		= init_idmap_pg_end);
-PROVIDE(__pi_init_pg_dir		= init_pg_dir);
-PROVIDE(__pi_init_pg_end		= init_pg_end);
 PROVIDE(__pi_swapper_pg_dir		= swapper_pg_dir);
 
 PROVIDE(__pi__text			= _text);
diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
index c91e5e965cd3..1f4731a4e17e 100644
--- a/arch/arm64/kernel/pi/pi.h
+++ b/arch/arm64/kernel/pi/pi.h
@@ -22,6 +22,7 @@ static inline void *prel64_to_pointer(const prel64_t *offset)
 extern bool dynamic_scs_is_enabled;
 
 extern pgd_t init_idmap_pg_dir[], init_idmap_pg_end[];
+extern pgd_t init_pg_dir[], init_pg_end[];
 
 void init_feature_override(u64 boot_status, const void *fdt, int chosen);
 u64 kaslr_early_init(void *fdt, int chosen);
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index e73326bd3ff7..466544c47dca 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -249,9 +249,9 @@ SECTIONS
 	__inittext_end = .;
 	__initdata_begin = .;
 
-	init_idmap_pg_dir = .;
+	__pi_init_idmap_pg_dir = .;
 	. += INIT_IDMAP_DIR_SIZE;
-	init_idmap_pg_end = .;
+	__pi_init_idmap_pg_end = .;
 
 	.init.data : {
 		INIT_DATA
@@ -321,9 +321,9 @@ SECTIONS
 	BSS_SECTION(SBSS_ALIGN, 0, 0)
 
 	. = ALIGN(PAGE_SIZE);
-	init_pg_dir = .;
+	__pi_init_pg_dir = .;
 	. += INIT_DIR_SIZE;
-	init_pg_end = .;
+	__pi_init_pg_end = .;
 	/* end of zero-init region */
 
 	. += SZ_4K;		/* stack for the early C runtime */
-- 
2.49.0.987.g0cc8ee98dc-goog


