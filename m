Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E94BFF6E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 22:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zP6LS2g532rau8K/3DpgQRgp0gll0gA2EwUjdcrKBQw=; b=16pWwcOA34hgCqsAOk8p1uG0b1
	/JJxtMgGJIrQUDUQLeefh8N9ndOXw4csAvc+OIyQCI7MkEZOQye4XYpHN01GhgEzEf4TcXTJs0ksk
	ysy5MY9yflQE7QotcaT4/aN/lgrzGSR74S3cr4Zyj23Omh6oyrNTeoDnC3eR2nzMnHLB3CBgfarnL
	5JPB5h0vsWW/V/hCLg3L+xlyldLVkeRK/ykbi/XwdCiUa23sWsnbWMS/zM90laNplFo/WzwXxlrJ0
	dYWoUP91reETTToMolVCkaroV/7cjMrX3F8gGtcfqTW0X1O+6+NsDT4awAdJurUISolztxGZme/lv
	UhsypjDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGR-00000007Kf8-1QQK;
	Tue, 17 Mar 2026 22:51:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGE-00000007KYQ-3U9T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 22:51:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84C0944582;
	Tue, 17 Mar 2026 22:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B9AC2BCC9;
	Tue, 17 Mar 2026 22:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773787898;
	bh=Z4h9ZFd5elXdJi4wGJjXHxGFSPzvcEc4LERNhrT0EmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SEISourMafINQsXcWHU2ATrORkFpttHBZjwLuKpsPpemhVE9HhqmUB/CM6T7M+htA
	 DYR0J4BPPJCqkO96EfctVeIRhNhiRLAvPU5cmdOsi90QQyMQrniTmVNwycGCcxdZtP
	 hUAS/YwgmhrOOeAMFmuLxT76aTwikXppqOtUIK3+2H4AgFwL2Ka+5/z9AvxduJ4KSH
	 muy19v9dvnYxKctPAlxrXxOPWTPgau7SvFtbYeNssU2rgJd8uB0xiw/MssIc9cRMp9
	 eV/paCwa/QWLJSEsjjT7UXNvOhbYHqXo7B093waN/tT+DwUawc6WLzRPUJASZ2Sb6Z
	 NlLQqnKt12HXw==
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
Subject: [PATCH v2 10/12] objtool: Reuse consecutive string references
Date: Tue, 17 Mar 2026 15:51:10 -0700
Message-ID: <4d211040356fe169b4236b3deea1cdff80e9babc.1773787568.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773787568.git.jpoimboe@kernel.org>
References: <cover.1773787568.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_155138_891761_C9DF27EF 
X-CRM114-Status: GOOD (  11.12  )
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

For duplicate strings, elf_add_string() just blindly adds duplicates.

That can be a problem for arm64 which often uses two consecutive
instructions (and corresponding relocations) to put an address into a
register, like:

  d8:   90000001        adrp    x1, 0 <meminfo_proc_show>       d8: R_AARCH64_ADR_PREL_PG_HI21  .rodata.meminfo_proc_show.str1.8
  dc:   91000021        add     x1, x1, #0x0    dc: R_AARCH64_ADD_ABS_LO12_NC   .rodata.meminfo_proc_show.str1.8

Referencing two different string addresses in the adrp+add pair can
result in a corrupt string addresses.  Detect such consecutive reuses
and force them to use the same string.

Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/elf.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index b911abe3a15e..5ccae2c937dc 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1374,6 +1374,8 @@ struct elf *elf_create_file(GElf_Ehdr *ehdr, const char *name)
 
 unsigned int elf_add_string(struct elf *elf, struct section *strtab, const char *str)
 {
+	static unsigned int last_off;
+	static const char *last_str;
 	unsigned int offset;
 
 	if (!strtab)
@@ -1382,17 +1384,22 @@ unsigned int elf_add_string(struct elf *elf, struct section *strtab, const char
 		ERROR("can't find .strtab section");
 		return -1;
 	}
-
 	if (!strtab->sh.sh_addralign) {
 		ERROR("'%s': invalid sh_addralign", strtab->name);
 		return -1;
 	}
 
+	if (last_str && !strcmp(last_str, str))
+		return last_off;
+
 	offset = ALIGN(sec_size(strtab), strtab->sh.sh_addralign);
 
 	if (!elf_add_data(elf, strtab, str, strlen(str) + 1))
 		return -1;
 
+	last_str = str;
+	last_off = offset;
+
 	return offset;
 }
 
-- 
2.53.0


