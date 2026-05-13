Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50A1CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuooEUok1GpCDkm4VtEIYuDTL0CHTyH1EUKNWINlNbg=; b=UqM1ZmgwSmOi8hXWJXNFaslyiL
	uZ3zgxzW2ik4/YThWyKXDCaqbdWMb9UsiqC27DByRx1uUDlLEf+DVwRpCd4HjiAxMg7jEBw3MTnUL
	frfKvs6wzDgTcTGTLOhvsgoIyrnELFUMTiqw6HS4HvDoqWMmjdLPlVsWmQJSntMNb7Soeq7ML5HMs
	cT6Sst/DoHZInel01AV38RTZ9LKZiwED+3A5net5UX9n3QmwzMG1eksFhjI+HHAdptVzcm2HErO5s
	Vgj3Mw8MfEPpwQSluPtN6Et+pnNHC2OefzXtyVS3fwpv67pYcNfEjy8IrGLheiGzEIeOwHdKE+PZP
	dL62EzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Nv-000000015RR-1i8U;
	Wed, 13 May 2026 03:35:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0N8-000000014GC-1XOZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C5004451E;
	Wed, 13 May 2026 03:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BBDC2BCC7;
	Wed, 13 May 2026 03:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643298;
	bh=Qd0dO/5tgykNYwWLyXzlbqJjDPv/OlwKa96fpijusbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ezRwnLFhhW/r1qzWrMNMdxEu2H/DqfXiJ2o4GqbWf+0lMYBwxuOqxduhE5ZEUvVoV
	 cJxTTo+ZYLnCujf7pblg6hk4GFibLqRnpO87CQm8asIkk8EAc6HQhDpewVA9Q8F2Db
	 SM/Exd57jrsCYYHoYwtyvp2Snn8PqfrdMGh9jj+DneVXyHg8hwONsjcZe4ooN+2xRZ
	 y7qeOwVxCOyLeyuyeaRIGiDz9NkSVMQPlrN7HrKnMsQdEauN4So5GSCviuU68oblCn
	 d7t9lqGJlGLg1Km+1zpF0utVYxKUZK4nYJHfx9ZSFOdLO/jVE1lcs7wwFQbGEUpzOb
	 M5KYm1BhNvC5A==
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
Date: Tue, 12 May 2026 20:34:16 -0700
Message-ID: <8e19a330a899520434cc83f7ccc434c83101ac3c.1778642121.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203458_431312_299D791A 
X-CRM114-Status: GOOD (  12.09  )
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
Message-ID: <20260513033416.tSvLgHwdPEP2FbPQu2HvVgZHLNSP8rx0GwGxB_6AzPo@z>

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


