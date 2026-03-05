Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D137AEFCE5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCyhQa7iggUWVdInhJtV16skKXt4/yXFVjjbvNxrTDo=; b=Im4GFHsUdEKd5g6yvm3NUoOqi0
	JZcnp/2J1E7yw8RCiNCTNnGFOAnurXlDUIr7HsqQ5ULFY+FJzuWZJcpa7X3Jsgu5vfvPx8mqgSaRm
	Y/jhE5n414K6sgd8U1XSK1xU/K06GOmvNWGGy/rYsmRUkttAO05hsa712KHGtNDw+7Qrobp0LJRoI
	6E8nNcySwzFqUaHwGnoktFZdDVnLjk1S1h9UCakqkcNHVZbHt2A2mmQtweQDLfd5SFHfDTGnf7Oev
	dFHrMNjZrxOQ5rjpQC08KM//ZZnWLmXwPRgobCgXoBVdHgeNRKt01f8T1cNv73dMpwDquFnh52EJh
	Bei07Wyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRJ-00000000poS-3sFt;
	Thu, 05 Mar 2026 03:31:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRE-00000000plQ-41ek
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:31:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A785F44742;
	Thu,  5 Mar 2026 03:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF69C2BCB0;
	Thu,  5 Mar 2026 03:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772681508;
	bh=ZlgKzEodeo2h7xrj6+yOcZaTPgylpV+16ZQbZgUDqcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mf1Z2e4tuic6+UzuCaVI+uWZg38Ul6M59lDO7FSFfzX7kdZdGwNm7SDFVjxF+roSe
	 qXH+rL5lueLltX36zmxf2bbqFxYrjDDPg2fyx7xXtjtq99NSMhP+1BizHKTpe3aFvf
	 EgkW+EDCmDNY/Sz94H639/MruYVzjqWVGUb2dKRYgK7ZcypU9vMXGuAUHWxQzwEUJJ
	 lyLXjkNlM2O9AR2ppkUwb+KNSmBxDpAVPcoqvJyYo/RD6gieLRWNS54aV17A6eb5oq
	 OpnGvKyDzMJMkhvYX+J8G/Dg9GMAUJXu0PcV+AtUw8h98nYswEY8r97EKMRW+KDpDQ
	 IVcFZYAfVaYQQ==
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
Subject: [PATCH 04/14] arm64: head: Move boot header to .head.data
Date: Wed,  4 Mar 2026 19:31:23 -0800
Message-ID: <ec379ccc31c1bf49d918228eaa1ca016e99f267c.1772681234.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772681234.git.jpoimboe@kernel.org>
References: <cover.1772681234.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_193149_019028_EDE11646 
X-CRM114-Status: GOOD (  13.04  )
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

The arm64 boot header is mostly data.  Move it to a data section to
prevent objtool and other tools from trying to disassemble it.  The
final linked result is the same.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/head.S          | 2 +-
 include/asm-generic/vmlinux.lds.h | 2 +-
 include/linux/init.h              | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 87a822e5c4ca..0681c6e50859 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -54,7 +54,7 @@
  * that are useful before the MMU is enabled. The allocations are described
  * in the entry routines.
  */
-	__HEAD
+	__HEADDATA
 	/*
 	 * DO NOT MODIFY. Image header expected by Linux boot-loaders.
 	 */
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index eeb070f330bd..51a0e5974f41 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -663,7 +663,7 @@
 		__static_call_text_end = .;
 
 /* Section used for early init (in .S files) */
-#define HEAD_TEXT  KEEP(*(.head.text))
+#define HEAD_TEXT  KEEP(*(.head.data .head.text))
 
 #define HEAD_TEXT_SECTION							\
 	.head.text : AT(ADDR(.head.text) - LOAD_OFFSET) {		\
diff --git a/include/linux/init.h b/include/linux/init.h
index 40331923b9f4..91e16f3205e2 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -90,6 +90,7 @@
 
 /* For assembly routines */
 #define __HEAD		.section	".head.text","ax"
+#define __HEADDATA	.section	".head.data","aw"
 #define __INIT		.section	".init.text","ax"
 #define __FINIT		.previous
 
-- 
2.53.0


