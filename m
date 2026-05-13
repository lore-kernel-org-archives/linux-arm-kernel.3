Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C52ACD484C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuooEUok1GpCDkm4VtEIYuDTL0CHTyH1EUKNWINlNbg=; b=kEXcvS2RmhwwwaFjUSSSUxiJZf
	m0OpyMm0MAGGg0fGynW8ol1W6trvl73tOUTZXsctEGPvXc4F+wJtXTumb4FbxALM0/spUCM/QhAsA
	OauI1F+OBW08im1jQzZve913K2cgtpZUin4Db3MwPYXweCx10ZOV8FNlOn5mZcQG+Ro/3Hy0FnBQA
	iQBIzU/6GTEdyqEf5HGP2cu8yRAKQJBjLs8KA5p3Fpu3fs/bXYb1AQBfYdUfwNDTYFB+daUXk0n5n
	YlNbWpEPDRBMjMA45az7DHoAFNbCyKzEXM1RIkOTGMMn1bhHTy9pzaXivHHlApjUVP3+NnNjBpsf2
	3AzjKEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0NZ-000000014lE-2CU5;
	Wed, 13 May 2026 03:35:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mt-000000013qT-3Dar
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F5C16015B;
	Wed, 13 May 2026 03:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45683C4AF0C;
	Wed, 13 May 2026 03:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643282;
	bh=Qd0dO/5tgykNYwWLyXzlbqJjDPv/OlwKa96fpijusbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cp/ihemeQ8TZAxY5dw84LiD9cr2PtFWg5Rcr9iavzkvOqCBc714dKpVMwHhNS5vlW
	 lSM5ujFvNy0R+cskXbXRJ/gLb7wmUBKKMht09Z4yalPLjagDAdFMe8/irAr/qaSy5T
	 qgIUdo2ApVlQURKtMEBLhrYy9zdudF1xxsMBzWwA1KcBFsu6c/dvr2xQZ34yJ86q2j
	 slvJuzLp51QRDMQscoPYiW3LZ4baX+5hmA+rlxihk56rrPu3ErPSeD0izn/0Pj2t24
	 nhscVW1V3ud8iavRQn1IQ+9LQrdTg0dwH9PYjIT2MlmachYfLVpvLtAgOvuPyO4jI9
	 4AlWfytK+Nhzg==
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
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v3 20/21] klp-build: Support cross-compilation
Date: Tue, 12 May 2026 20:33:54 -0700
Message-ID: <8e19a330a899520434cc83f7ccc434c83101ac3c.1778642121.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
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
index 911ada05673c2..e83973567c878 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -432,6 +432,25 @@ validate_patches() {
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
@@ -462,6 +481,7 @@ do_init() {
 	validate_config
 	set_module_name
 	set_kernelversion
+	cross_compile_init
 }
 
 # Refresh the patch hunk headers, specifically the line numbers and counts.
@@ -871,7 +891,7 @@ build_patch_module() {
 	cp -f "$kmod_file" "$kmod_file.orig"
 
 	# Work around issue where slight .config change makes corrupt BTF
-	objcopy --remove-section=.BTF "$kmod_file"
+	"$OBJCOPY" --remove-section=.BTF "$kmod_file"
 
 	# Fix (and work around) linker wreckage for klp syms / relocs
 	"$OBJTOOL" klp post-link "$kmod_file" || die "objtool klp post-link failed"
-- 
2.53.0


