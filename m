Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60804CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt/MF7hJdowInQ8GPDwgtykS4lsiFec49tmiYoK2JFU=; b=WFh96zRTXvcNBkP8llX1ij0lbs
	Is/54JKjQSD+l16+tPffvtWk/Jl63Xl+JwXApWdBtPCYnvD0k1SbdowBSCU4Z4wL+hEx5EeFHxqD0
	Bomio+PqYPunOZyPdc6IxYKyYUXBLjpua62Q2NJCR2IjwRA/qKXPKSCmiwmEGOKbw0w3DiESjzv9G
	kthJoSICxDlcso+VqHz/29hbmuNn06T1IL387jZt9tZ9YdcQyzuyblaT4Y9/35GD/BjoRHfRlHa7+
	1gwg7Y2UI/zlHFzjWYXkRv1vsv7PGG9eJvXCjRxEcLzxjpqkCgP7AYaQg1zh84OjNCS9locCj1Stf
	MLIZ6yig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu16v-00000008okT-44GI;
	Thu, 04 Sep 2025 03:58:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0w6-00000008lQ8-0dJI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 03:47:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC05A44C9E;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F35AC4CEF8;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957616;
	bh=fZM4pUskzgVzzDbqpdGr74pYeEbdYleorCSgkPRkjPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MlnAoabsXDFgD+6GMVKhYGy490ebRIpVqlFFJafvlL4ISa9St9CrbCfmn4ifzaKP8
	 bX9ZGnDeiMZ9WVD74hcOBdalYxSesR/Y9E9Xp3fZUVaPSxEkYly/tS8sPOMzpqyamg
	 7ZHv5Lp3GL2zmaMDwclI3/cNq7KoLXqTKIynvUJeGCKg90SxQUiTnmFB39Hin5/IT3
	 zQnghkY80irwD/oWDUCf5PD59IuxNJmHwRDfk7+Ntr/3jMiSf0Y1EZQyhZ9V+rTbe8
	 IOFKkMm4JzBrzgo8BT4ZoAPLtu54jkDTYU9ucIiuUIpe+BFusthdcwzaJnimNmfjhR
	 fdeZ2DNVeIaVQ==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 4/9] x86/cfi: Standardize on common "CFI:" prefix for CFI reports
Date: Wed,  3 Sep 2025 20:46:43 -0700
Message-Id: <20250904034656.3670313-4-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
References: <20250904033217.it.414-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513; i=kees@kernel.org; h=from:subject; bh=fZM4pUskzgVzzDbqpdGr74pYeEbdYleorCSgkPRkjPo=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OYsz1+h4pN6YrHiFfYKc4nMzjk9TFqvsF3i0eLNp4 e85Dt13O0pZGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACZi2Mjwm71UTUCCm2ldnMdv n4CjPns8o37m5s18lb9NMcX97cNHfQz/lC+c1Jm4xNF6WfbPZ38mljIdef+n5p3DY2Nr7cz783f e4AUA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_204658_227386_77172999 
X-CRM114-Status: GOOD (  13.61  )
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

Use a regular "CFI:" prefix for CFI reports during alternatives setup,
including reporting when nothing has happened (i.e. CONFIG_FINEIBT=n).

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Peter Zijlstra <peterz@infradead.org>
---
 arch/x86/kernel/alternative.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 7bde68247b5f..d8f4ac95b4df 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1266,26 +1266,26 @@ static __init int cfi_parse_cmdline(char *str)
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
@@ -1757,7 +1757,7 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 	switch (cfi_mode) {
 	case CFI_OFF:
 		if (builtin)
-			pr_info("Disabling CFI\n");
+			pr_info("CFI: disabled\n");
 		return;
 
 	case CFI_KCFI:
@@ -1766,7 +1766,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 			goto err;
 
 		if (builtin)
-			pr_info("Using kCFI\n");
+			pr_info("CFI: Using %sretpoline kCFI\n",
+				cfi_rand ? "rehashed " : "");
 		return;
 
 	case CFI_FINEIBT:
@@ -2005,6 +2006,8 @@ bool decode_fineibt_insn(struct pt_regs *regs, unsigned long *target, u32 *type)
 static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 			    s32 *start_cfi, s32 *end_cfi, bool builtin)
 {
+	if (IS_ENABLED(CONFIG_CFI) && builtin)
+		pr_info("CFI: Using standard kCFI\n");
 }
 
 #ifdef CONFIG_X86_KERNEL_IBT
-- 
2.34.1


