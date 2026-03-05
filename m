Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046CFEFCE5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FbM9wp9Lk119vAFLCSLT86rNsi7sXUiauHk/TYVs3I=; b=QsZVWhrvBXM/X+knTpOPv5nHvJ
	/1VlZuK4hjYEbT59E9x51e6YYVrvpgZAO+juoKsZxF4Vb0QddcuAAyLMXDUUoIQTEq4TW27kRWs5z
	rHohR/DatCFxwsZ8tD1BuV4M3GRmlw2H0HP/VPSUnfBZrWHsen/LpEVnrqnleGqHWK9EYBnbBwdpS
	WjQYiOefqardWRcFCTb0JVabU0eiwi1JkndsxIaN4l6x3afot0tTaatFcQ24vigp3P2pEFF/frD3I
	qCmtyizisD3JI4fJBt+M1sDU4+dO2s26CpBkw2sRIi6LvG1dbNiTt94dFgtg/si7HrIPGAAaIZIqZ
	kmL6GNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRS-00000000px2-16bB;
	Thu, 05 Mar 2026 03:32:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRP-00000000ptn-2xsJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:31:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DB2861842;
	Thu,  5 Mar 2026 03:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD774C2BCB0;
	Thu,  5 Mar 2026 03:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772681518;
	bh=CfP2DFBojtfnSTUyVXwvbIwOJH/gBb2u2wzP+UFC7hU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k8+xaC8YqfE6gU2/m9z8R8CU4ZtMOnKh6oZcO4Ro2BZbPyVsMhee6JY06BnMAaCz9
	 u8zu+NzWjBt+hQjDDgnH/gDDjLGrgtRI+i2V51yXvnAYa+IY/aT1REYDZxXXj3G56y
	 eNAWWR0/GM3UhgJSQNBmo3forCYVrdQKRNF+fPtSj9kOh1+ljSQOYnBpxet63Kw8Bf
	 GBx3KWytFqBo+nBtwU77jZI0bW72uOmwifFCHKtVrkjECvh0QMWSoqFb9MaM6+izqG
	 6rin6gy13+vqHMniez8ytADE32fn03PliQJxT3bjmatIW5rWQwNaNVGhDSYMMvZqB2
	 cHQacOXnWEYJQ==
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
Subject: [PATCH 12/14] objtool: Reuse consecutive string references
Date: Wed,  4 Mar 2026 19:31:31 -0800
Message-ID: <1cdd2737d2db5a300eea971382c5e8edda7fb474.1772681234.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772681234.git.jpoimboe@kernel.org>
References: <cover.1772681234.git.jpoimboe@kernel.org>
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

For duplicate strings, elf_add_string() just blindly adds duplicates.

That can be a problem for arm64 which often uses two consecutive
instructions (and corresponding relocations) to put an address into a
register, like:

  d8:   90000001        adrp    x1, 0 <meminfo_proc_show>       d8: R_AARCH64_ADR_PREL_PG_HI21  .rodata.meminfo_proc_show.str1.8
  dc:   91000021        add     x1, x1, #0x0    dc: R_AARCH64_ADD_ABS_LO12_NC   .rodata.meminfo_proc_show.str1.8

Referencing two different string addresses in the adrp+add pair can
result in a corrupt string addresses.  Detect such consecutive reuses
and force them to use the same string.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/elf.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 3da90686350d..52ef991115fc 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1321,6 +1321,8 @@ struct elf *elf_create_file(GElf_Ehdr *ehdr, const char *name)
 
 unsigned int elf_add_string(struct elf *elf, struct section *strtab, const char *str)
 {
+	static unsigned int last_off;
+	static const char *last_str;
 	unsigned int offset;
 
 	if (!strtab)
@@ -1329,17 +1331,22 @@ unsigned int elf_add_string(struct elf *elf, struct section *strtab, const char
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
 	offset = ALIGN(strtab->sh.sh_size, strtab->sh.sh_addralign);
 
 	if (!elf_add_data(elf, strtab, str, strlen(str) + 1))
 		return -1;
 
+	last_str = str;
+	last_off = offset;
+
 	return offset;
 }
 
-- 
2.53.0


