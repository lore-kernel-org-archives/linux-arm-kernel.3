Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9288CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKv68DNCTyqKo5hxBf4yt/JgDPOTgwoZ6rNeQKneEpQ=; b=kGdm6/wGM/ziKhrvH3hIh50n1B
	8OVbFpjFqRsEqSh2ZrRdi7SwAtflir8rkQBSucnh7wyh+aTU7l8P9dtELBE6SnkubL+IcExjhDfeo
	yMTcTx8jqDlej/HnamrH+rdjMaNBSq7w44eJR7jRmCu0hQCYWYTPOaa/EF+IRJz9eVJBlpp+20Jy/
	pikbF6zOytJx7bEszbjHpYTJPDHC7vlXm+ksPmPnH8BtQaCA/f+TtzSUACBTWmxymInyl7K7Vd03b
	/ZXPlbhCwmRhYiaUqN6p30HAQqdGrj0gx3wlr3K755VJRQ58vXf2Lw43CQ2I5z8k0HUKjTscGnNVt
	hxPBi2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Nj-00000001542-27zj;
	Wed, 13 May 2026 03:35:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0N2-000000013xw-18ZE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 301CD4451D;
	Wed, 13 May 2026 03:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E053C4AF0D;
	Wed, 13 May 2026 03:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643292;
	bh=ODGizz8YbR/8nDzbjCn/eHHTqaD5XRXQRwu11kVeY3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NMiWyLW60yMaQJRFMpFsG2x/tYVDBFTC+RFGW45F8KIzNe2h+qEU9EgK47Hgoa3Fw
	 MfVnKXDYigAxRRB2T/b5/2dHIOwhc6wvf4gl2kPaBX7RUfnCUC+zTOOc24muOOYSIN
	 NL4BK7F6laycDe1cjhVmqVINhc38hYamVZCmJ6Hr1evmtXLCQ0h7rJ0aK6jMuOyF6T
	 5VIz0vmzb/3Zx9X8/spdwfZCvzZOktZPjURrYf/1caKVzIvNmz7t1arPN9hNrq6YA1
	 9lTZjIDLbtoSMnz1wpzu388doH28MFD37/AqGU28ooyHktzTHMlw00tDUvZ518eWdl
	 SEESt7o85No6Q==
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
Date: Tue, 12 May 2026 20:34:07 -0700
Message-ID: <3c474673ec5ddc9f27fbf5ddb1fd0f66ef6a779f.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203452_349137_10299EFF 
X-CRM114-Status: GOOD (  10.86  )
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


