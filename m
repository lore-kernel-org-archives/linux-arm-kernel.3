Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E953BFF6E9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 22:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbKJxmXnIk+3vfXsHJslnwh2MHCYTJ/v2bKnefnBKBo=; b=2EZ2b36t4qGXr6ly6MzGnV18kH
	w/yWz94ne3JWuQUwqE1RLV2T9Z5Iu1rSkfPGFrWR6qC6gRLOx8QakfY0D5hwSNHyH/6bJ5f6ATi9W
	HgRcnpWYNfAKEgE72nKJ5ULNsBCrX/GP9cxmcd3CO0BgD/bW70ZmwP4dmfoK6qgJVtJPqaC17xGvN
	N7ax+3bXfFFfBDsVh7gYcn7LmzXmDS58QNAmsPHbl0Zp3KYtUScg41p9fiaW+SKRkwFdLf4UIPxpQ
	v48eD5tCIddLwOEtgkqpvaYAXhTGvW0kw1rwwtA6SW7ehTjNDgmOKeUn3UkuTjj/Gby7upRstlfbX
	/7R01wuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGS-00000007Kgn-0NXw;
	Tue, 17 Mar 2026 22:51:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGG-00000007KZE-3zii
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 22:51:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1896E60053;
	Tue, 17 Mar 2026 22:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FA1C4CEF7;
	Tue, 17 Mar 2026 22:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773787899;
	bh=zRKnFKqm2URNigcW6ZVhyMqoLzUjkp7pt41hjdX3o4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ln2wjhQfxqa28dJgKDCHPfGBxeRw7EOtChpVpakFKvHrihIK+pCHDpeOJJCU3Kwg0
	 iusyhDjRSNHcR7Ruj3FDLqNg8bW2Bz6THfXuMVdfhzXG/USsY2TYeZ+0wm4caGad3i
	 KEy2cP9mhX6AtCDN/nDxitjMbMeqXEDP9vcYFiPzoZNEdfuk8Wu/FrJr1NKMTQpaIp
	 1liSaWzZ0kB1BeZgvx/+j10icge2OrRrJ6W5Qu/VcihAoZ7W1yRHoDFTNdXtcIYPv1
	 bp1t3fegO5isq2rinS8dwud8ggyGncjLw3D9Br1YVS9kkgqze48aMbZOmcQfAWSSRW
	 j3dtfKuJcutPw==
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
Subject: [PATCH v2 12/12] klp-build: Support cross-compilation
Date: Tue, 17 Mar 2026 15:51:12 -0700
Message-ID: <51f026e3ee15e2dc343f890c0dc1b926ad3d1c17.1773787568.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773787568.git.jpoimboe@kernel.org>
References: <cover.1773787568.git.jpoimboe@kernel.org>
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


