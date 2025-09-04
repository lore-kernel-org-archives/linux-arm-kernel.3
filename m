Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9748BCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 04:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUn1s3KASxz+/KODD5Z3C24H3E3cqWXBuJWl5gHGZ/0=; b=tbBE5BAAY0wx8G4BNkizr6VnSw
	5b4ZYBW5TFjTJixeBEZKYItGp90LZOWo6/GXP7wrGHMD06mA08leqxkoAnmeKHIXn0XgpA+Sinuh9
	yXU/wZByTU5SHWsDYpf0jsSs75R80IB0gE97Y8MByBP+Ktz3GjV/DqpRa2YVEs9W7RTksgpekS1DI
	2n6myhLIL1pqkE/fof/oWHoz5co1bZytKZqLK+WrgRQnskmyzLptEirSff3NhwTUY+MBYISbUdvNT
	la0Lp3/rkgYQDG5ktymSToObVNxijgDf/Km1IsOKBwg8QTH06paJmMguDpmFPvGVOGtyByBsesJtc
	ea623y5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu19d-00000008pcA-3JF8;
	Thu, 04 Sep 2025 04:00:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0w7-00000008lR8-0LAD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 03:47:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EF3E44CB2;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC035C4CEF9;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957616;
	bh=fAYAUBGJzo8b71uhoB5b/MGQo+Cci4aVf5GCY6U9+Og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MQ1wii6xQtLMVMyBk31+A/kBaQZrsWcYyRslt3wRiqrIgJwSD/vMPaXxjHvlXQ70q
	 woTlgLahuOMaNldVXWLhxv2VMw2yg/a+mZCFThs/9eKCSPvWWRfFrEOFKQtQiGkT8z
	 sktrp+AQAN1Pdu004OOJa/HLhNZSkHtv9w1bXPvGVrCtnMgPiKUnBGz3Xmyr8+3RmF
	 5LJR8DZfAIL+HlnYDABwGlNeuiP5F6UhvbusAD7TJS/CpsANxCtcciMaUcy11PtthN
	 xsT3PWpg8CJApz2ug6Z9Qhf11n7EK75u9A1C8Y5jXxW5j90q3cig/joCyV0pxelZI3
	 12GobLSRdOnrg==
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
Subject: [PATCH v2 5/9] x86/cfi: Add "debug" option to "cfi=" bootparam
Date: Wed,  3 Sep 2025 20:46:44 -0700
Message-Id: <20250904034656.3670313-5-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
References: <20250904033217.it.414-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4249; i=kees@kernel.org; h=from:subject; bh=fAYAUBGJzo8b71uhoB5b/MGQo+Cci4aVf5GCY6U9+Og=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OYuNvPgOPD79OO+JnXXRp6Xu8nwx71xY93EVlCf3x 6bxXNvQUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMJGpYgy/2VR2/91myqOcFp/c 6yV1dvuyNcnb3k/h3Mb8pmgBG98MTYZ/Vv2fVK7qNr275O/OvuS9daCF9u2IlUJSrJ9OcjL0z+V mAwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_204659_230850_252BD149 
X-CRM114-Status: GOOD (  16.21  )
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

Add "debug" option for "cfi=" bootparam to get details on early CFI
initialization steps so future Kees can find breakage easier.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Peter Zijlstra <peterz@infradead.org>
---
 .../admin-guide/kernel-parameters.txt         |  1 +
 arch/x86/kernel/alternative.c                 | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 8bbffbb334ab..c8337d0e6ba3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -624,6 +624,7 @@
 			bhi:	  Enable register poisoning to stop speculation
 				  across FineIBT. (Disabled by default.)
 			warn:	  Do not enforce CFI checking: warn only.
+			debug:    Report CFI initialization details.
 
 	cgroup_disable=	[KNL] Disable a particular controller or optional feature
 			Format: {name of the controller(s) or feature(s) to disable}
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index d8f4ac95b4df..b311e31a9056 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1177,6 +1177,7 @@ void __init_or_module apply_seal_endbr(s32 *start, s32 *end) { }
 #endif
 
 enum cfi_mode cfi_mode __ro_after_init = __CFI_DEFAULT;
+static bool cfi_debug __ro_after_init;
 
 #ifdef CONFIG_FINEIBT_BHI
 bool cfi_bhi __ro_after_init = false;
@@ -1259,6 +1260,8 @@ static __init int cfi_parse_cmdline(char *str)
 		} else if (!strcmp(str, "off")) {
 			cfi_mode = CFI_OFF;
 			cfi_rand = false;
+		} else if (!strcmp(str, "debug")) {
+			cfi_debug = true;
 		} else if (!strcmp(str, "kcfi")) {
 			cfi_mode = CFI_KCFI;
 		} else if (!strcmp(str, "fineibt")) {
@@ -1734,6 +1737,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 	 * rewrite them. This disables all CFI. If this succeeds but any of the
 	 * later stages fails, we're without CFI.
 	 */
+	if (cfi_debug)
+		pr_info("CFI: disabling all indirect call checking\n");
 	ret = cfi_disable_callers(start_retpoline, end_retpoline);
 	if (ret)
 		goto err;
@@ -1744,14 +1749,23 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 			cfi_bpf_hash = cfi_rehash(cfi_bpf_hash);
 			cfi_bpf_subprog_hash = cfi_rehash(cfi_bpf_subprog_hash);
 		}
+		if (cfi_debug)
+			pr_info("CFI: cfi_seed: 0x%08x\n", cfi_seed);
 
+		if (cfi_debug)
+			pr_info("CFI: rehashing all preambles\n");
 		ret = cfi_rand_preamble(start_cfi, end_cfi);
 		if (ret)
 			goto err;
 
+		if (cfi_debug)
+			pr_info("CFI: rehashing all indirect calls\n");
 		ret = cfi_rand_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
+	} else {
+		if (cfi_debug)
+			pr_info("CFI: rehashing disabled\n");
 	}
 
 	switch (cfi_mode) {
@@ -1761,6 +1775,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 		return;
 
 	case CFI_KCFI:
+		if (cfi_debug)
+			pr_info("CFI: enabling all indirect call checking\n");
 		ret = cfi_enable_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
@@ -1771,17 +1787,23 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 		return;
 
 	case CFI_FINEIBT:
+		if (cfi_debug)
+			pr_info("CFI: adding FineIBT to all preambles\n");
 		/* place the FineIBT preamble at func()-16 */
 		ret = cfi_rewrite_preamble(start_cfi, end_cfi);
 		if (ret)
 			goto err;
 
 		/* rewrite the callers to target func()-16 */
+		if (cfi_debug)
+			pr_info("CFI: rewriting indirect call sites to use FineIBT\n");
 		ret = cfi_rewrite_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
 
 		/* now that nobody targets func()+0, remove ENDBR there */
+		if (cfi_debug)
+			pr_info("CFI: removing old endbr insns\n");
 		cfi_rewrite_endbr(start_cfi, end_cfi);
 
 		if (builtin) {
@@ -2324,6 +2346,7 @@ void __init alternative_instructions(void)
 
 	__apply_fineibt(__retpoline_sites, __retpoline_sites_end,
 			__cfi_sites, __cfi_sites_end, true);
+	cfi_debug = false;
 
 	/*
 	 * Rewrite the retpolines, must be done before alternatives since
-- 
2.34.1


