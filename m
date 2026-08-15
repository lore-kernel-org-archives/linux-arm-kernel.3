Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F995C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 04:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/t/Rfxakry9H0AfVxYXBBWUY45B3IiZbJ9hnB5qt+U=; b=vlzgW+C/nWspm3vdG8415lqbyU
	KEYULlutcV/+rntFCK2kKhm1qK51svADbEO5N03NGy7V0BA5Do0PL/g/xnvJxUTjg/ifTDA+OT48T
	Xh3r+9ssLG76bS6OjxV1PM/JY2OncwTrAseRm5La3AWucMMLPhQi0AU882c3TRePguJ3q+16LnUx3
	RPyQ7Su1C170arLA/8EDUPmmpk+95UvtqACdOXE9gzE+uyZMirARxAV8Yh/+mDXrBdcNUAqNsPFyt
	31+vgDZjihwCcRSc4kXDukVg6BRX6j7/wicdO/EE1jAa4NRGScTV2vmay8/JPIjMeSX867Eslvn25
	GqbudsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HS-00000003V3H-2Mos;
	Sat, 15 Aug 2026 04:46:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HB-00000003UyB-469O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 04:45:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA13F4333D;
	Sat, 15 Aug 2026 04:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100591F00A3E;
	Sat, 15 Aug 2026 04:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786769145;
	bh=e/t/Rfxakry9H0AfVxYXBBWUY45B3IiZbJ9hnB5qt+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VnU50eIPWqhBcTlqnV5boRpx4D1n0N4/Yg/CvyWyImvRgu4dUa/MEnSno7Mt6VacA
	 zSPGwvTV/FT9Inn0DXnAxCPzRM2+0Lw0jKODBv243vX2g8yROhA71/klTemO3wrUKx
	 f1bjWol7ViVDCduHhJg6RSLaW0Hb1VOGQhmB4NmiBVrKgrQT+eatYYrQqinDDrv/1E
	 5iJL69qVjVFg/aUrYZQFQnLzHHph6hsdNko7pu7/fLdMaztBtcVKCwKel6M7SielPM
	 O22SsMSi9J9HD1aon2S2sWklqDTZ3C4sI1ztX3ydWD0PDOy65e0WwvlEn55xFvr4lk
	 Df9ldJDoshMPw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	live-patching@vger.kernel.org,
	Song Liu <song@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-toolchains@vger.kernel.org
Subject: [PATCH 04/12] arm64/bti: Work around ld crash caused by linker script aliases
Date: Fri, 14 Aug 2026 21:45:21 -0700
Message-ID: <5660aa2639925c936e6e5e2c3a224fc2a63457eb.1786768375.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786768375.git.jpoimboe@kernel.org>
References: <cover.1786768375.git.jpoimboe@kernel.org>
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

Linking an allyesconfig kernel (~700MB of text) with the GNU linker and
CONFIG_ARM64_BTI_KERNEL triggers a seg fault in the linker:

  #1  elf64_aarch64_stub_name (input_section=0x100000040, sym_sec=..., hash=..., rel=...) at ../../bfd/elfnn-aarch64.c:3042
  #2  _bfd_aarch64_add_call_stub_entries (...) at ../../bfd/elfnn-aarch64.c:4674
  #3  elf64_aarch64_size_stubs (...) at ../../bfd/elfnn-aarch64.c:4839

On a kernel whose text exceeds the +/128MB direct branch range, the
linker inserts veneers.  With BTI enabled, the veneers' indirect branch
targets need a BTI landing pad, which not all functions have starting
with Clang 21 (and for all versions of GCC).

In such cases the linker can emit a second veneer close to the target
which has the landing pad along with a direct branch to the target.  The
GNU linker assumes each target has an input section.  But linker-defined
symbols don't have input sections, and ld crashes trying to access their
veneer data.

vmlinux.lds.S (via image-vars.h) uses PROVIDE() to alias some function
symbols into the __efistub_ and __pi_ namespaces, which are used by the
EFI stub and the position-independent startup code, respectively.

Work around the crash by defining those aliases in code.  Note this
might also end up being a permanent fix, depending on whether the ld fix
ends up reporting an error for such cases, or whether it will infer the
alias's section from the aliasee.

Define the five affected aliases in the objects which define their
aliasees so they live in a real input section.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=34525
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/head.S       |  1 +
 arch/arm64/kernel/image-vars.h | 13 +------------
 arch/arm64/lib/memcpy.S        |  3 +++
 arch/arm64/lib/memset.S        |  2 ++
 arch/arm64/mm/cache.S          |  1 +
 5 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 541721488bef9..e96af16b421d8 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -130,6 +130,7 @@ SYM_CODE_START(primary_entry)
 	bl	__cpu_setup			// initialise processor
 	b	__primary_switch
 SYM_CODE_END(primary_entry)
+SYM_FUNC_ALIAS(__efistub_primary_entry, primary_entry)
 
 	__INIT
 SYM_CODE_START_LOCAL(record_mmu_state)
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index d4c7d45ae6bc8..713b96cf5dc89 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -20,19 +20,12 @@
 	PROVIDE(pisym = sym);		\
 	ASSERT((sym - KIMAGE_VADDR) < (__bss_start - KIMAGE_VADDR), #msg)
 
-PROVIDE(__efistub_primary_entry		= primary_entry);
-
 /*
  * The EFI stub has its own symbol namespace prefixed by __efistub_, to
  * isolate it from the kernel proper. The following symbols are legally
  * accessed by the stub, so provide some aliases to make them accessible.
- * Only include data symbols here, or text symbols of functions that are
- * guaranteed to be safe when executed at another offset than they were
- * linked at. The routines below are all implemented in assembler in a
- * position independent manner
+ * Only include data symbols here.
  */
-PROVIDE(__efistub_caches_clean_inval_pou = __pi_caches_clean_inval_pou);
-
 PROVIDE(__efistub__text			= _text);
 PROVIDE(__efistub__end			= _end);
 PROVIDE(__efistub___inittext_end       	= __inittext_end);
@@ -42,10 +35,6 @@ PROVIDE(__efistub_sysfb_primary_display	= sysfb_primary_display);
 #endif
 PROVIDE(__efistub__ctype		= _ctype);
 
-PROVIDE(__pi___memcpy			= __pi_memcpy);
-PROVIDE(__pi___memmove			= __pi_memmove);
-PROVIDE(__pi___memset			= __pi_memset);
-
 PI_EXPORT_SYM(id_aa64isar1_override);
 PI_EXPORT_SYM(id_aa64isar2_override);
 PI_EXPORT_SYM(id_aa64mmfr0_override);
diff --git a/arch/arm64/lib/memcpy.S b/arch/arm64/lib/memcpy.S
index 9b99106fb95f1..90dbb0d3acdef 100644
--- a/arch/arm64/lib/memcpy.S
+++ b/arch/arm64/lib/memcpy.S
@@ -268,3 +268,6 @@ SYM_FUNC_ALIAS(__memmove, __pi_memmove)
 EXPORT_SYMBOL(__memmove)
 SYM_FUNC_ALIAS_WEAK(memmove, __memmove)
 EXPORT_SYMBOL(memmove)
+
+SYM_FUNC_ALIAS(__pi___memcpy, __pi_memcpy)
+SYM_FUNC_ALIAS(__pi___memmove, __pi_memmove)
diff --git a/arch/arm64/lib/memset.S b/arch/arm64/lib/memset.S
index 97157da65ec6b..31e514f020aa3 100644
--- a/arch/arm64/lib/memset.S
+++ b/arch/arm64/lib/memset.S
@@ -226,3 +226,5 @@ EXPORT_SYMBOL(__memset)
 
 SYM_FUNC_ALIAS_WEAK(memset, __pi_memset)
 EXPORT_SYMBOL(memset)
+
+SYM_FUNC_ALIAS(__pi___memset, __pi_memset)
diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
index ab75c050f5590..ab2cd6c524073 100644
--- a/arch/arm64/mm/cache.S
+++ b/arch/arm64/mm/cache.S
@@ -57,6 +57,7 @@ SYM_FUNC_START(caches_clean_inval_pou)
 	ret
 SYM_FUNC_END(caches_clean_inval_pou)
 SYM_FUNC_ALIAS(__pi_caches_clean_inval_pou, caches_clean_inval_pou)
+SYM_FUNC_ALIAS(__efistub_caches_clean_inval_pou, caches_clean_inval_pou)
 
 /*
  *	caches_clean_inval_user_pou(start,end)
-- 
2.55.0


