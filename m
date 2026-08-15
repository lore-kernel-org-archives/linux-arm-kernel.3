Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEE4C5DF6A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 04:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3oqNhtnQI75A62nrc5sYJescYksDNsRXLkbblCYMfE=; b=LCPzT5eYYk4OO3JuLT9F3x+7zW
	Xtr+xefW0zLr12iQ4QvmhxLsmBMmBu/qETwVf3T76tQAUpBSgE2qmdrttMjiBrMZbAQfLtfVugxy9
	Ff1ddZmhtzjHD4VnwQX4oBRXddJDRGMnTDoJi1xqCtuBesxhYcLRdCi0OLcqVisS7aXRXsSQuMpuO
	1x4EFuRMFS7SPq0rToQyQN17qbvyFhxJvKFh6cqR1YH5GlXHEoMNATQjjWVEebv+mD8xNi19znbFZ
	61bZIhJXuA+Id+d0cqHNUFEay6I6Ao1ULvszFo2T9zBfUKMjTTw5h4Xr9f4bYC3YCVXYmm3qxbzoY
	FFv140ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HV-00000003V4j-0jkq;
	Sat, 15 Aug 2026 04:46:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HD-00000003Uyh-0njz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 04:45:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A239961836;
	Sat, 15 Aug 2026 04:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86CB1F00A3A;
	Sat, 15 Aug 2026 04:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786769146;
	bh=R3oqNhtnQI75A62nrc5sYJescYksDNsRXLkbblCYMfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UEATv1utOClInMq4xd8E4cl9UaZzYIMx4dig53D9/aqDvPh5XkWV36YCQqtyfvKO2
	 ANe5wOkYtUBbPsD1BaOzq1YD7yYWE2EbkBi4MaoJNWQ1FxjcIEvHe5mFQYVGJjX8en
	 vJ8FN2j5djwmLDO5ywRzrm/ZD0RVgULoSApMTpb9ocdnkQHJ7XoJ+H1qAITAKKTsoF
	 vXM2aaW6iA/YzlayaeSEXLWIMKvPbGluWfH6fhfCxsHHozJjlmw02Cats99vvOSdRW
	 lnk3YN6C+XffzTecYKRp1NxMnJy4Yabs5jBSg8/CbHoE9sbRv9CUU+ilWR0HaOPq9z
	 9O/dDDc5t+NpA==
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
Subject: [PATCH 05/12] arm64/bti: Add link error for large kernels with BTI and unsupported toolchains
Date: Fri, 14 Aug 2026 21:45:22 -0700
Message-ID: <8932e59a4f6e8383f37078dada1f23639b85a035.1786768375.git.jpoimboe@kernel.org>
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

On a kernel whose text exceeds the +/128MB direct branch range, the
linker inserts veneers.  With BTI enabled, the veneers' indirect branch
targets need a BTI landing pad, which not all functions have starting
with Clang 21 (and for all versions of GCC).

In such cases the linker can emit a second veneer close to the target
which has the landing pad along with a direct branch to the target.
However, that's currently not being done, so GCC and Clang 21+ are
broken with BTI on large kernels.

Only newer linkers have proper support for adding the second veneer,
starting with binutils 2.42 and LLVM 20.

Only allow a large kernel with the right combination of compiler and
linker.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/Kconfig              | 7 +++++++
 arch/arm64/kernel/vmlinux.lds.S | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919b..2687b71438661 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2123,6 +2123,13 @@ config ARM64_BTI_KERNEL
 	  is enabled and the system supports BTI all kernel code including
 	  modular code must have BTI enabled.
 
+config CC_OMITS_BTI_LANDING_PADS
+	def_bool !CC_IS_CLANG || CLANG_VERSION >= 210000
+
+config LD_HAS_BTI_STUBS
+	def_bool (LD_IS_BFD && LD_VERSION >= 24200) || \
+		 (LD_IS_LLD && LLD_VERSION >= 200000)
+
 config CC_HAS_BRANCH_PROT_PAC_RET_BTI
 	# GCC 9 or later, clang 8 or later
 	def_bool $(cc-option,-mbranch-protection=pac-ret+leaf+bti)
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index af1d720209764..3a88da9212831 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -414,6 +414,11 @@ ASSERT((__entry_tramp_text_end - __entry_tramp_text_start) <= 3*PAGE_SIZE,
 #ifdef CONFIG_KVM
 ASSERT(__hyp_bss_start == __bss_start, "HYP and Host BSS are misaligned")
 #endif
+
+#if defined(CONFIG_ARM64_BTI_KERNEL) && !defined(CONFIG_COMPILE_TEST) && \
+    defined(CONFIG_CC_OMITS_BTI_LANDING_PADS) && !defined(CONFIG_LD_HAS_BTI_STUBS)
+ASSERT(__exittext_end - _text <= SZ_128M, "Kernel text too big for BTI")
+#endif
 /*
  * If padding is applied before .head.text, virt<->phys conversions will fail.
  */
-- 
2.55.0


