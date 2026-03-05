Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ED8EFCE43
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKgqC2Fvgz7Mr5htinBSQd6G5m5EMEnBF0FNbNjYyjE=; b=wZkpMyHdyvSvvw4iiMl2uGQaIK
	YbsnYZ1W8LqlNimKrmkyInn9qCfUuVmflWwHt2z3iykMku6caVa7dnq53D5uDkGWTNhTPFVFNgU8g
	REdSAIOwfNeohKfmACVqaRujJeNS6YzeRx72NvCjFsm4snDTql0WWfCH8RnowJedr0dReHY0+S8wW
	ZcS0L5zWmiSTuP0yXQpHH1z4aX5njkxE7H5bDYoKEjOXV8DK1LhpPu8qwE/V8hFIXOG4qsTVaNd4q
	kyfxA0tyn47fDY7eNUOIW+zEijq7tswJqQ6Ar+w8o/qL8aRFc+Qu6II6Iw8cl05X40Qoqq4zViAnA
	TmnHXEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRW-00000000q2k-2bBt;
	Thu, 05 Mar 2026 03:32:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRS-00000000pwF-0XcH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:32:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6C57438AC;
	Thu,  5 Mar 2026 03:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5478DC2BCB6;
	Thu,  5 Mar 2026 03:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772681521;
	bh=y7mJtqRMIyYxCk1D8Nsk0D/Rqo0GqzF9Z7aw/XJAZkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jO4MLE0y+XVePdzaVdE68vXz7JQqqVf+lnn4o0UVyNFosJKc2k1E4UVnCsvXs66zB
	 wB93vgw9EBaAV/YKdnEy0WtFqGkZ9EBI6gK1E5y1rJFWjh+hYJnlPVG+BdrPBPZLO6
	 6wBwyP8bbFS5AwN2jW081RF1t3neD09RgxFj/RFw8WhQFBnUpNQEOR3B+h7jUULLFN
	 jAERCQrP4fzL7B/Ll5Vkn0x8FZlJCYUpjmayqA3H1Oqh1swc/t5o523KgVUaeCAZFk
	 0hvvCMiCSGhNGQAJ6lJ39yJynMCREPTg4ce3MEX2/a6+asVgOsq0HaqBPpeJ9quA2P
	 CjcsAQuwx7pLQ==
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
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH 14/14] klp-build: Support cross-compilation
Date: Wed,  4 Mar 2026 19:31:33 -0800
Message-ID: <697c09ca0a8ffd545aa875e507502f62ad983419.1772681234.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772681234.git.jpoimboe@kernel.org>
References: <cover.1772681234.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_193202_201447_8453296D 
X-CRM114-Status: GOOD (  11.59  )
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

Add support for cross-compilation.  The user must export ARCH, and
either CROSS_COMPILE or LLVM.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 scripts/livepatch/klp-build | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
index 809e198a561d..b6c057e2120f 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -404,6 +404,14 @@ validate_patches() {
 	revert_patches
 }
 
+cross_compile_init() {
+	if [[ -v LLVM ]]; then
+		OBJCOPY=llvm-objcopy
+	else
+		OBJCOPY="${CROSS_COMPILE:-}objcopy"
+	fi
+}
+
 do_init() {
 	# We're not yet smart enough to handle anything other than in-tree
 	# builds in pwd.
@@ -420,6 +428,7 @@ do_init() {
 	validate_config
 	set_module_name
 	set_kernelversion
+	cross_compile_init
 }
 
 # Refresh the patch hunk headers, specifically the line numbers and counts.
@@ -783,7 +792,7 @@ build_patch_module() {
 	cp -f "$kmod_file" "$kmod_file.orig"
 
 	# Work around issue where slight .config change makes corrupt BTF
-	objcopy --remove-section=.BTF "$kmod_file"
+	"$OBJCOPY" --remove-section=.BTF "$kmod_file"
 
 	# Fix (and work around) linker wreckage for klp syms / relocs
 	"$SRC/tools/objtool/objtool" klp post-link "$kmod_file" || die "objtool klp post-link failed"
-- 
2.53.0


