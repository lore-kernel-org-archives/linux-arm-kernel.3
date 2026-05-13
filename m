Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9429DCD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 04:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKv68DNCTyqKo5hxBf4yt/JgDPOTgwoZ6rNeQKneEpQ=; b=DF6Ly85i0HWy7BNYGmr8Vra0CE
	gPzJNPdaWVLTlNGyvbvTXXeVS9PoN9ycLGSkNZpJ58izLxcNT44zlM13bUawHowEPKBpz1MXrYqbX
	BhDHAT0NBbh4tHh2MQpR8meyZE7XlCYNXgiDg3GPc70ObWvQ242r3/sBwN9kN2PwxQuBjO0CfcLOB
	BQiAAdupv75+o49C/xL0RXR8uSWM75Yr8Uf/trMeKJY3Ca9yTyMPr7lNWSmftQleI7Sx36g9cYgPG
	30CEloLSntDE8GilcCIiIX5vGIL1C33Gd99czDgpEO1TYUD22/B9xRRV3lQnsA6MFH95W+spk3rnt
	jkWpzL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Ms-000000013oy-1fKb;
	Wed, 13 May 2026 03:34:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mo-000000013iP-0l13
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FD0C60142;
	Wed, 13 May 2026 03:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0774C2BD00;
	Wed, 13 May 2026 03:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643277;
	bh=ODGizz8YbR/8nDzbjCn/eHHTqaD5XRXQRwu11kVeY3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZiJfzUOFXeUHITChE7yfuGNT5uDwk9hbbPapbKdRrmsHlu5z8tAcCX2Gfd3wLsZGC
	 duxHuQrXypB5lkXdj3SDCOrKmj3uPirwJZf2XH1rVlFEQ7lNM3+rPgJwTBWMcBSsBO
	 fOLtjA3UFGD3Jn//ejeTbyukAhnv2uJI5vB0zwGsQ0ZeLRFmHZnhFtXbLMv8xZrh0u
	 nWbxqIchSibY3fq5GPari3EsINujqRqa18d0aWtClE36JQZf/u3O1UbKL54WVSWIIg
	 6543HYF8zLhlQo69WggqYMRV3X9YqlNqPQAbBPfhakActX5FO9Ati2AZb5Xbg07tFy
	 OveyiT0UHIzHA==
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
Subject: [PATCH v3 11/21] objtool: Allow empty alternatives
Date: Tue, 12 May 2026 20:33:45 -0700
Message-ID: <3c474673ec5ddc9f27fbf5ddb1fd0f66ef6a779f.1778642120.git.jpoimboe@kernel.org>
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
Message-ID: <20260513033345.v8yTFcNyJTeMu-Q-0C5VRXNcowxPRMKP8Jl5mPwljDE@z>

arm64 can have empty alternatives, which are effectively no-ops.  Ignore
them.  While at it, fix a memory leak.

Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 73451aef68029..e05dc7a93dc1e 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1953,6 +1953,9 @@ static int add_special_section_alts(struct objtool_file *file)
 
 	list_for_each_entry_safe(special_alt, tmp, &special_alts, list) {
 
+		if (special_alt->group && !special_alt->orig_len)
+			goto next;
+
 		orig_insn = find_insn(file, special_alt->orig_sec,
 				      special_alt->orig_off);
 		if (!orig_insn) {
@@ -1973,10 +1976,6 @@ static int add_special_section_alts(struct objtool_file *file)
 		}
 
 		if (special_alt->group) {
-			if (!special_alt->orig_len) {
-				ERROR_INSN(orig_insn, "empty alternative entry");
-				continue;
-			}
 
 			if (handle_group_alt(file, special_alt, orig_insn, &new_insn))
 				return -1;
@@ -2014,6 +2013,7 @@ static int add_special_section_alts(struct objtool_file *file)
 			a->next = alt;
 		}
 
+next:
 		list_del(&special_alt->list);
 		free(special_alt);
 	}
-- 
2.53.0


