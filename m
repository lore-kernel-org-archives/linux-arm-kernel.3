Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2396DCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vowqOgkTSzGmEZwn5uZ+APGLOvUyV5Z575dVjM0QH0=; b=hpM21I2ReOxg1xfEUSB3amNFl6
	AVg5dTAfU4WKqVv0wPM724mfXjJakpI/BGoICBWl+gkOM1Euy4YfH3QQVntABrlOfPpKFjUOKO9T8
	79//kKn2WuAvuSgjy1Lcg3wMf2Tm2X7cCjATr+iVOzSrOFR9W8aDIv515MTEnMfL8elneevRM795e
	HQHIQYyTZEqJxqUZoE3uqPThssJaU8EgNft+6Va1p1YI7qvR2maT0zaXAU9CjNpLeE+sFo4v2RpXG
	us7BYwS8GHrIRtGPcOs9q8PJM5ubDpSURx2NWZVF1Fys6iqOSae0foMLwdKN8n3+bjhVPWjZ2H9vx
	W6SqMd/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYye-00000008UKE-2ikT;
	Mon, 25 Aug 2025 15:19:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqY97-00000008FPR-0KwW;
	Mon, 25 Aug 2025 14:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 57E096026F;
	Mon, 25 Aug 2025 14:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AEA2C4CEF4;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131963;
	bh=Sla/GNQ9pAAGrUEI5zQMMAiO+21DTDPiIwuUTYkcitE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pLBCL5LmhQPyqoqY1f6E3wEghXn6T6CCiDmYS6qt+GNFEkabqrkJTMUNAVeo62M+e
	 85A97g70Fe6SZFcPD8c/KkMc7d5WGpKstwfKegv24ribLMZJKCJWyZJbRqV7/X/LQj
	 KTNlzVf7wIpwFVGCMf8g/uXdk3s6VznZCcJeRWGF7ygEu31oLPRDNeYw8pczbtj66Z
	 SMxQpT57KBuUtsMrD2wiVcUkC22UmxkxpQuB0UUL/zHZNRIzrXcHxtwB50E/YpgdLq
	 pIxJCOS/+hH2fFWr1AVbW+3dYUxMClez490yXToCWxKYJ+cpqtNgCJdYLE0rsvIK/2
	 KfpqFSeJEw9ww==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Kees Cook <kees@outflux.net>,
	Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 3/5] x86/cfi: Add option for cfi=debug bootparam
Date: Mon, 25 Aug 2025 07:25:50 -0700
Message-Id: <20250825142603.1907143-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825141316.work.967-kees@kernel.org>
References: <20250825141316.work.967-kees@kernel.org>
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

From: Kees Cook <kees@outflux.net>

Add "debug" option for "cfi=" bootparam to get details on early CFI
initialization steps. Standardize CFI pr_info() lines to use "CFI:"
prefix. Standardize "CFI: Using ..." to always report which CFI mode is
being used, regardless of CONFIG_FINEIBT. Document all the "cfi=" options.

Signed-off-by: Kees Cook <kees@outflux.net>
---
 .../admin-guide/kernel-parameters.txt         | 18 +++++++++
 arch/x86/kernel/alternative.c                 | 39 +++++++++++++++----
 2 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 747a55abf494..7b4bddb5a030 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -608,6 +608,24 @@
 	ccw_timeout_log	[S390]
 			See Documentation/arch/s390/common_io.rst for details.
 
+	cfi=		[X86-64] Set Control Flow Integrity checking features
+			when CONFIG_FINEIBT is enabled.
+			Format: feature[,feature...]
+			Default: auto
+
+			auto:	  Use FineIBT if IBT available, otherwise kCFI.
+				  Under FineIBT, enable "paranoid" mode when
+				  FRED is not available.
+			off:	  Turn off CFI checking.
+			kcfi:	  Use kCFI (disable FineIBT).
+			fineibt:  Use FineIBT (even if IBT not available).
+			norand:   Do not re-randomize CFI hashes.
+			paranoid: Add caller hash checking under FineIBT.
+			bhi:	  Enable register poisoning to stop speculation
+				  across FineIBT. (Disabled by default.)
+			warn:	  Do not enforce CFI checking: warn only.
+			debug:	  Report CFI initialization details.
+
 	cgroup_disable=	[KNL] Disable a particular controller or optional feature
 			Format: {name of the controller(s) or feature(s) to disable}
 			The effects of cgroup_disable=foo are:
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 7bde68247b5f..5d80ae77c042 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1225,6 +1225,7 @@ int cfi_get_func_arity(void *func)
 
 static bool cfi_rand __ro_after_init = true;
 static u32  cfi_seed __ro_after_init;
+static bool cfi_debug __ro_after_init;
 
 /*
  * Re-hash the CFI hash with a boot-time seed while making sure the result is
@@ -1259,6 +1260,8 @@ static __init int cfi_parse_cmdline(char *str)
 		} else if (!strcmp(str, "off")) {
 			cfi_mode = CFI_OFF;
 			cfi_rand = false;
+		} else if (!strcmp(str, "debug")) {
+			cfi_debug = true;
 		} else if (!strcmp(str, "kcfi")) {
 			cfi_mode = CFI_KCFI;
 		} else if (!strcmp(str, "fineibt")) {
@@ -1266,26 +1269,26 @@ static __init int cfi_parse_cmdline(char *str)
 		} else if (!strcmp(str, "norand")) {
 			cfi_rand = false;
 		} else if (!strcmp(str, "warn")) {
-			pr_alert("CFI mismatch non-fatal!\n");
+			pr_alert("CFI: mismatch non-fatal!\n");
 			cfi_warn = true;
 		} else if (!strcmp(str, "paranoid")) {
 			if (cfi_mode == CFI_FINEIBT) {
 				cfi_paranoid = true;
 			} else {
-				pr_err("Ignoring paranoid; depends on fineibt.\n");
+				pr_err("CFI: ignoring paranoid; depends on fineibt.\n");
 			}
 		} else if (!strcmp(str, "bhi")) {
 #ifdef CONFIG_FINEIBT_BHI
 			if (cfi_mode == CFI_FINEIBT) {
 				cfi_bhi = true;
 			} else {
-				pr_err("Ignoring bhi; depends on fineibt.\n");
+				pr_err("CFI: ignoring bhi; depends on fineibt.\n");
 			}
 #else
-			pr_err("Ignoring bhi; depends on FINEIBT_BHI=y.\n");
+			pr_err("CFI: ignoring bhi; depends on FINEIBT_BHI=y.\n");
 #endif
 		} else {
-			pr_err("Ignoring unknown cfi option (%s).", str);
+			pr_err("CFI: Ignoring unknown option (%s).", str);
 		}
 
 		str = next;
@@ -1734,6 +1737,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 	 * rewrite them. This disables all CFI. If this succeeds but any of the
 	 * later stages fails, we're without CFI.
 	 */
+	if (builtin && cfi_debug)
+		pr_info("CFI: disabling all indirect call checking\n");
 	ret = cfi_disable_callers(start_retpoline, end_retpoline);
 	if (ret)
 		goto err;
@@ -1744,43 +1749,61 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 			cfi_bpf_hash = cfi_rehash(cfi_bpf_hash);
 			cfi_bpf_subprog_hash = cfi_rehash(cfi_bpf_subprog_hash);
 		}
+		if (builtin && cfi_debug)
+			pr_info("CFI: cfi_seed: 0x%08x\n", cfi_seed);
 
+		if (builtin && cfi_debug)
+			pr_info("CFI: rehashing all preambles\n");
 		ret = cfi_rand_preamble(start_cfi, end_cfi);
 		if (ret)
 			goto err;
 
+		if (builtin && cfi_debug)
+			pr_info("CFI: rehashing all indirect calls\n");
 		ret = cfi_rand_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
+	} else {
+		if (builtin && cfi_debug)
+			pr_info("CFI: rehashing disabled\n");
 	}
 
 	switch (cfi_mode) {
 	case CFI_OFF:
 		if (builtin)
-			pr_info("Disabling CFI\n");
+			pr_info("CFI: disabled\n");
 		return;
 
 	case CFI_KCFI:
+		if (builtin && cfi_debug)
+			pr_info("CFI: enabling all indirect call checking\n");
 		ret = cfi_enable_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
 
 		if (builtin)
-			pr_info("Using kCFI\n");
+			pr_info("CFI: Using %s kCFI\n",
+				cfi_rand ? "rehashed" : "retpoline");
 		return;
 
 	case CFI_FINEIBT:
+		if (builtin && cfi_debug)
+			pr_info("CFI: adding FineIBT to all preambles\n");
 		/* place the FineIBT preamble at func()-16 */
 		ret = cfi_rewrite_preamble(start_cfi, end_cfi);
 		if (ret)
 			goto err;
 
 		/* rewrite the callers to target func()-16 */
+		if (builtin && cfi_debug)
+			pr_info("CFI: rewriting indirect call sites to use FineIBT\n");
 		ret = cfi_rewrite_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
 
 		/* now that nobody targets func()+0, remove ENDBR there */
+		if (builtin && cfi_debug)
+			pr_info("CFI: removing old endbr insns\n");
 		cfi_rewrite_endbr(start_cfi, end_cfi);
 
 		if (builtin) {
@@ -2005,6 +2028,8 @@ bool decode_fineibt_insn(struct pt_regs *regs, unsigned long *target, u32 *type)
 static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 			    s32 *start_cfi, s32 *end_cfi, bool builtin)
 {
+	if (builtin)
+		pr_info("CFI: Using standard kCFI\n");
 }
 
 #ifdef CONFIG_X86_KERNEL_IBT
-- 
2.34.1


