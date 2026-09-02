Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2498CC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrP14S1cTIJoJVTkI3oossgIMSgnPCUT5PYA3ZNfIvE=; b=nINWXrt6nnZlFraZL3Ek6EsGfv
	eYI3/xBR6erboXFFG8wWY5qUdndg6EuLedhfMFV/hArtKpF2vto9RMB9ASJQjsDKrFgPIrS8AGmW1
	SmEBeodC6vY21U5kbfmBiT2eVHRdOzprUIZ+58dY8xOfXzvG1P5iJiGHldUoCVACuxjMQQhQxFrEo
	PAOoFiaUJaSPKdsT0GjfssycLtKL3OGhCaXP49q3Oo7vzVmrdxzQQhScvW+X2Ed3nOdDl473/QOZ8
	S4K1Ew7zC7NrefzQVbzUxU4fKV/5DqO4i/eE29NiDntDraHjcixeJb5EOHS48voh/TU8ZEWHgAt6V
	Y/gyHTkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jCx-0000000EWDj-3fPg;
	Wed, 02 Sep 2026 11:32:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jCv-0000000EWCO-1spy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:32:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FDE21684;
	Wed,  2 Sep 2026 04:32:39 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4AD533F85F;
	Wed,  2 Sep 2026 04:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788348763; bh=Uguci+7+quJQWql95x6bYA7c76LYXQgu1t3Nh4WsXeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IlyhZkRuWjvLEBSyKd/2wWsIf9q3qI6wsSLoTAC5LKBT22QITyV5NUK++y43j0cuy
	 QN1TCfaKa9RRWmCJWjOnzf5R77P6dH0WsW4R66fzQoBeEhHD0JbP50l+Gkp7lDjQFi
	 /x0nALdWtfT6YlAb5d8I1wZVrebXBoCfqPAwcKz8=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH 2/2] arm64: alternative: Remove 'cfg' parameter
Date: Wed,  2 Sep 2026 12:32:32 +0100
Message-Id: <20260902113232.314831-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260902113232.314831-1-mark.rutland@arm.com>
References: <20260902113232.314831-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_043245_600334_A67B78EA 
X-CRM114-Status: GOOD (  11.04  )
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

There are no remaining users of the 'cfg' parameter for alternative
sequences.

Remove support for the 'cfg' parameter. In general, it's better to use
explicit ifdeffery or IS_ENABLED() checks.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/alternative-macros.h | 30 +++++++--------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/alternative-macros.h b/arch/arm64/include/asm/alternative-macros.h
index 8624166248528..ee75a2f1a575f 100644
--- a/arch/arm64/include/asm/alternative-macros.h
+++ b/arch/arm64/include/asm/alternative-macros.h
@@ -53,8 +53,7 @@
  *
  * Alternatives with callbacks do not generate replacement instructions.
  */
-#define __ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, cfg_enabled)	\
-	".if "__stringify(cfg_enabled)" == 1\n"				\
+#define __ALTERNATIVE(oldinstr, newinstr, cpucap)			\
 	"661:\n\t"							\
 	oldinstr "\n"							\
 	"662:\n"							\
@@ -68,10 +67,8 @@
 	".org	. - (664b-663b) + (662b-661b)\n\t"			\
 	".org	. - (662b-661b) + (664b-663b)\n\t"			\
 	".previous\n"							\
-	".endif\n"
 
-#define __ALTERNATIVE_CFG_CB(oldinstr, cpucap, cfg_enabled, cb)	\
-	".if "__stringify(cfg_enabled)" == 1\n"				\
+#define __ALTERNATIVE_CB(oldinstr, cpucap, cb)				\
 	"661:\n\t"							\
 	oldinstr "\n"							\
 	"662:\n"							\
@@ -80,13 +77,12 @@
 	".popsection\n"							\
 	"663:\n\t"							\
 	"664:\n\t"							\
-	".endif\n"
 
-#define _ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, cfg, ...)	\
-	__ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, IS_ENABLED(cfg))
+#define _ALTERNATIVE(oldinstr, newinstr, cpucap)			\
+	__ALTERNATIVE(oldinstr, newinstr, cpucap)
 
 #define ALTERNATIVE_CB(oldinstr, cpucap, cb) \
-	__ALTERNATIVE_CFG_CB(oldinstr, (1 << ARM64_CB_SHIFT) | (cpucap), 1, cb)
+	__ALTERNATIVE_CB(oldinstr, (1 << ARM64_CB_SHIFT) | (cpucap), cb)
 #else
 
 #include <asm/assembler.h>
@@ -99,8 +95,7 @@
 	.byte \alt_len
 .endm
 
-.macro alternative_insn insn1, insn2, cap, enable = 1
-	.if \enable
+.macro alternative_insn insn1, insn2, cap
 661:	\insn1
 662:	.pushsection .altinstructions, "a"
 	altinstruction_entry 661b, 663f, \cap, 662b-661b, 664f-663f
@@ -110,7 +105,6 @@
 664:	.org	. - (664b-663b) + (662b-661b)
 	.org	. - (662b-661b) + (664b-663b)
 	.previous
-	.endif
 .endm
 
 /*
@@ -204,20 +198,16 @@ alternative_else
 alternative_endif
 .endm
 
-#define _ALTERNATIVE_CFG(insn1, insn2, cap, cfg, ...)	\
-	alternative_insn insn1, insn2, cap, IS_ENABLED(cfg)
+#define _ALTERNATIVE(insn1, insn2, cap)	\
+	alternative_insn insn1, insn2, cap
 
 #endif  /*  __ASSEMBLER__  */
 
 /*
  * Usage: asm(ALTERNATIVE(oldinstr, newinstr, cpucap));
- *
- * Usage: asm(ALTERNATIVE(oldinstr, newinstr, cpucap, CONFIG_FOO));
- * N.B. If CONFIG_FOO is specified, but not selected, the whole block
- *      will be omitted, including oldinstr.
  */
-#define ALTERNATIVE(oldinstr, newinstr, ...)   \
-	_ALTERNATIVE_CFG(oldinstr, newinstr, __VA_ARGS__, 1)
+#define ALTERNATIVE(oldinstr, newinstr, cpucap)   \
+	_ALTERNATIVE(oldinstr, newinstr, cpucap)
 
 #ifndef __ASSEMBLER__
 
-- 
2.30.2


