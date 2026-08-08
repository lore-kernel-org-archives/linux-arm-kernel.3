Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98F8C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cv5F15Pf+qaCXWqln8rlxWjdcGBGLL2eqdPm1KQd9iI=; b=JiuIiCoIpxHprjuAA8ND9Uf89S
	0JS2yn9XRkda7mnuh1hwLzSjiNp0JQXxp2kAcTWAaNeGKb58OGpdjb4/Ewinz5/1kFnUQb01VmXlW
	PF3J/U1lAPwzCbrik37taIH/f3kRWt8P8GukjqPiFYDi/Sk4AKTxnBPwkIMngzBmS9fjqDG3HJGCG
	JX5d1OTLT/zYVRUssEuNVNNZ14gDoeGBWZTQKYGAR7k8P5uQyIhWuJBEL3mwT4ksQTzc1Sv6iEYJn
	XpYIvnCzpQ/8mT/HCwbAsosGeNn397rKAVb0g9SRhGLNB+W7EUQzQBlbPLROddvcwnweGdSBjegAS
	f7n7E9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJa-00000009mWx-32vV;
	Sat, 08 Aug 2026 23:18:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJP-00000009mJQ-18Yg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B59F86136F;
	Sat,  8 Aug 2026 23:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53E91F00ACF;
	Sat,  8 Aug 2026 23:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231122;
	bh=cv5F15Pf+qaCXWqln8rlxWjdcGBGLL2eqdPm1KQd9iI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y/x0qMtRPMmE+LspRqkDVg22LrWNQ0X6pZ06IMnxqn9ytImbQtHmrN2XSbqRme0Vd
	 KubFXJWbajU1AKWP4ahphXcE8ZFa50zdbnGynsGb9WIV3h2PeyRAVb6h+Px9AQlTxs
	 aJjB/0iMfBmVAmHmeR5jGxaFjTYwZo7BF5bIp3kx4brZ6MCtP1xrL4F/lL5FByJ3/U
	 bH3znu9zPPifY2Wu377Z3D/x46BoYsLnm4WdN/kPfi2cPn7bxDEZw2OCM6lvpd3MzG
	 evxJ5wkullG+h+29Ek74nzDKRcyBrfI4DeYuPPYcbFsmFzoLvh81mtHVRvsOR+e03c
	 X78LIGV7nG+fg==
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
Subject: [PATCH v4 21/22] klp-build: Support cross-compilation
Date: Sat,  8 Aug 2026 16:17:25 -0700
Message-ID: <afba3774f6a8a818f899e3d04a22ac55e9cca0e2.1786230311.git.jpoimboe@kernel.org>
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

Add support for cross-compilation.  The user must export ARCH, and
either CROSS_COMPILE or LLVM as needed.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 scripts/livepatch/klp-build | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
index b311f290b1406..42fb671f1863d 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -435,6 +435,25 @@ validate_patches() {
 	revert_patches
 }
 
+cross_compile_init() {
+	if [[ -v LLVM && -n "$LLVM" ]]; then
+		local prefix=""
+		local suffix=""
+
+		if [[ "$LLVM" == */ ]]; then
+			# LLVM=/path/to/bin/
+			prefix="$LLVM"
+		elif [[ "$LLVM" == -* ]]; then
+			# LLVM=-14
+			suffix="$LLVM"
+		fi
+
+		OBJCOPY="${prefix}llvm-objcopy${suffix}"
+	else
+		OBJCOPY="${CROSS_COMPILE:-}objcopy"
+	fi
+}
+
 do_init() {
 	# We're not yet smart enough to handle anything other than in-tree
 	# builds in pwd.
@@ -465,6 +484,7 @@ do_init() {
 	validate_config
 	set_module_name
 	set_kernelversion
+	cross_compile_init
 }
 
 # Refresh the patch hunk headers, specifically the line numbers and counts.
@@ -881,7 +901,7 @@ build_patch_module() {
 	cp -f "$kmod_file" "$kmod_file.orig"
 
 	# Work around issue where slight .config change makes corrupt BTF
-	objcopy --remove-section=.BTF "$kmod_file"
+	"$OBJCOPY" --remove-section=.BTF "$kmod_file"
 
 	# Fix (and work around) linker wreckage for klp syms / relocs
 	"$OBJTOOL" klp post-link "$kmod_file" || die "objtool klp post-link failed"
-- 
2.54.0


