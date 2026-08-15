Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C414C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 04:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMsKe5btLXaq16w0tIqve5iamtKug/aatm/4NhSQJFY=; b=ICzBFYAl5WYlGHyi9r1DvCku/8
	bZ9jpqT4b5irs/o0SyFfWxCLabjG9u89oMGbNhRRGmNguIr9B5lvrTZfJJ5+InU0S7UHD6EGF+SUu
	gx2/BN4YQC960ls8F2LTajZJOac+TX8BrIKoZjizGgDkZDWe0lEthJLVCCMOCn3jFzM2gFLEjct1g
	Ouk1Ysi2kk+9UP1o0KXgdVWwSkQgXASYt37k2GiEtB0oAlBqNxYu8t0zgGFaBz40b372KwCOeWeK3
	MzHYPZ8Q6cwSCEnEMyujYWaeZ1RfBCPkAImO7IeaTxuJFklovFi4OlgC1FYVmAhFzOTZYWRjZgVwK
	Nh48K4SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HV-00000003V6W-3DSS;
	Sat, 15 Aug 2026 04:46:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HE-00000003Uz7-2sem
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 04:45:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 23E8861383;
	Sat, 15 Aug 2026 04:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4671F00A3D;
	Sat, 15 Aug 2026 04:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786769147;
	bh=WMsKe5btLXaq16w0tIqve5iamtKug/aatm/4NhSQJFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lXBtNNCmUIamsfGoa63amsX8TWkAPlX4QFni+73i7Dz/68yfSXGk8cT7h8G1iE/Cd
	 FSYtaRzAbNNSJ4d941Yfev42MF9/CIiVsxEJWpL/nUlFePfWSnI+2Iz2apcIRbIsPQ
	 89egT/aduhm2jT3YCkXb2UpSqcNWkICll7U8NdSIZKtxPFMaB0ycf9IaVBVKFijQ1Y
	 K4K9L47os82FITiBZ27FOcty/U7eHTKWW0YX0c84AppCktJwaWsLyfpxxP5n/gRF1M
	 Mzds1ttWbTJuxmdjZDn/mUUJUj7mRynTszmuJcQSmJ9DtMC7juSk9ro1X40AysDR+6
	 VWyfLaSPawUWQ==
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
Subject: [PATCH 07/12] arm64/bti: Advertise BTI in assembly objects
Date: Fri, 14 Aug 2026 21:45:24 -0700
Message-ID: <5340f3df281bebc81aad3cd9a7471d95061b4b9d.1786768375.git.jpoimboe@kernel.org>
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

On a kernel whose text exceeds the +/-128MB direct branch range, the
linker inserts veneers.  With BTI enabled, the veneers' indirect branch
targets need a BTI landing pad, which not all functions have starting
with Clang 21 (and for all versions of GCC).

In such cases the linker can emit a second veneer close to the target
which has the landing pad along with a direct branch to the target.
However, that's currently not being done, so GCC and Clang 21+ are
broken with BTI on large kernels.

The linker only emits the BTI veneer if *all* input objects have
GNU_PROPERTY_AARCH64_FEATURE_1_BTI, which is not being done for
hand-written asm.

Force-include a property note with the BTI bit into every assembly
translation unit, which is accurate as SYM_FUNC_START*() already emits a
"bti c" landing pad for callable assembly functions.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/Makefile               |  4 ++++
 arch/arm64/include/asm/bti-note.h | 32 +++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 arch/arm64/include/asm/bti-note.h

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 6b005c8fef706..4eee721c0b278 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -23,6 +23,10 @@ ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
 LDFLAGS_vmlinux	+= --fix-cortex-a53-843419
 endif
 
+ifeq ($(CONFIG_ARM64_BTI_KERNEL),y)
+KBUILD_AFLAGS	+= -include $(srctree)/arch/arm64/include/asm/bti-note.h
+endif
+
 cc_has_k_constraint := $(call try-run,echo				\
 	'int main(void) {						\
 		asm volatile("and w0, w0, %w0" :: "K" (4294967295));	\
diff --git a/arch/arm64/include/asm/bti-note.h b/arch/arm64/include/asm/bti-note.h
new file mode 100644
index 0000000000000..17ef5692987f7
--- /dev/null
+++ b/arch/arm64/include/asm/bti-note.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Emit a GNU_PROPERTY_AARCH64_FEATURE_1_BTI note.  This is force-included in
+ * every assembly file so the linker emits BTI veneers for >128MB kernels.
+ *
+ * Clang has -mmark-bti-property, but there's no equivalent for GCC/GAS.
+ *
+ * Binutils 2.44+ and LLVM 22+ support a much more compact version:
+ *
+ *   .aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
+ *   .aeabi_attribute Tag_Feature_BTI, 1
+ */
+#ifndef __ASM_BTI_NOTE_H
+#define __ASM_BTI_NOTE_H
+
+	.pushsection .note.gnu.property, "a"
+	.align	3
+	.long	2f - 1f
+	.long	6f - 3f
+	.long	5		/* NT_GNU_PROPERTY_TYPE_0 */
+1:	.string	"GNU"
+2:
+	.align	3
+3:	.long	0xc0000000	/* GNU_PROPERTY_AARCH64_FEATURE_1_AND */
+	.long	5f - 4f
+4:	.long	1		/* GNU_PROPERTY_AARCH64_FEATURE_1_BTI */
+5:
+	.align	3
+6:
+	.popsection
+
+#endif /* __ASM_BTI_NOTE_H */
-- 
2.55.0


