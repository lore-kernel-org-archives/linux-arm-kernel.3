Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42220CA9EBB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 22:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7HGp1dbJXTKN0KbNXHE21Lfr3v8jWIWBQooF13B+8k=; b=fwcUEIfkMFDhgnS7hsQ9hLKoz4
	SoI7WTazum3dH/nhyxfzTxeKFVpls/3uP8r8Y3eGtDiwuLREB67+/goYY0Hn6hPkCkVczeyur+SHu
	ytJFs8nAiMr3NZ7f1p3RFRp2Vowscg3OMXCMZuR9dW4+wiUyc6XEiRnJAWBQC3Qut3U0qdybTvsP7
	JVSknzk32JnpsvjqoEqTUVfMoOQl/jDnkR/37qhe1+c0j62MJvaKSrj2+mvvjwdIj18Asqh2MTkuJ
	cjs670+ZQ/FPKzDmNxkfcJoSs4S7E8tuA493Ai098EOpk/ed+L/tdGGYrf0yp85ApHANd4UDyboZS
	kqIkrMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyn-00000007HLg-0pAI;
	Fri, 09 Oct 2026 22:22:17 +0000
Received: from chamillionaire.breakpoint.cc ([91.216.245.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyd-00000007HF9-2uOD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 22:22:09 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1791584524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7HGp1dbJXTKN0KbNXHE21Lfr3v8jWIWBQooF13B+8k=;
	b=JKdhLZfatlCt6KO9Yb9i56ezDs6kZ7Yb+7lidyjGWKZ9hibbmu5iIUDvRKrnWOpAzfRkc8
	vfPLTJ6pEYw7921F5x1q4Mlebh8i3tccL2tpInbrOEBnmG4U3gO4spq37XrL7+tfISMtOH
	zYXucZQi0UcFsVANfT0QVW6dqZ3FbI4yhrz+nRW8cHKivgsE4hEINdKxNb020dstDMe2B4
	11Qx7KhmARef+6cfIxbNnyMWskIhL5LqR3lxhgxYBVhbIjij99t09MJJw7N+41T9FSEcj5
	iPOa/jvhb/SB21oBWzNSM7gkP4DZiSgr2EbyLoiKzAEIxRUwwuzjNIyQBq9tWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1791584524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7HGp1dbJXTKN0KbNXHE21Lfr3v8jWIWBQooF13B+8k=;
	b=FF8ifHtxRlFUorwAF0QLEhSo7Vn3B7DXv6Wl/4v924eFVOtgTAWwZs4tj1QGMlRayLU2sA
	0tZ8Tn23bDPsrSCQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 07/11] ARM: BUG: Pass a flags argument to __BUG__LINE()
Date: Sat, 10 Oct 2026 00:21:14 +0200
Message-ID: <20261010-arm_warning-v1-7-ddf4be42ae0d@breakpoint.cc>
In-Reply-To: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
References: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_152207_892260_F6DC55C9 
X-CRM114-Status: GOOD (  10.73  )
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

Since the hard coding of the BUG-opcode, the value argument remained
unused. Repurpose that argument as flags from struct bug_entry. For now
this is set to 0.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 arch/arm/include/asm/bug.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/include/asm/bug.h b/arch/arm/include/asm/bug.h
index c47b693aed8ae..b9e58be656360 100644
--- a/arch/arm/include/asm/bug.h
+++ b/arch/arm/include/asm/bug.h
@@ -20,8 +20,8 @@
 #endif
=20
=20
-#define BUG() _BUG(__FILE__, __LINE__, BUG_INSTR_VALUE)
-#define _BUG(file, line, value) __BUG(file, line, value)
+#define BUG() _BUG(__FILE__, __LINE__)
+#define _BUG(file, line) __BUG(file, line)
=20
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #define _BUG_VERBOSE_LINE(__file, __line)			\
@@ -37,22 +37,22 @@
 #endif
=20
 #ifdef CONFIG_GENERIC_BUG
-#define __BUG_ENTRY_GENERIC(__file, __line, __value)		\
+#define __BUG_ENTRY_GENERIC(__file, __line, __flags)		\
 	.pushsection __bug_table,"aw";				\
 	.align 2;						\
 	.word 1b;						\
 	_BUG_VERBOSE_LINE(__file, __line);			\
-	.hword 0;						\
+	.hword __flags;						\
 	.popsection;
=20
 #else
-#define __BUG_ENTRY_GENERIC(__file, __line, __value)
+#define __BUG_ENTRY_GENERIC(__file, __line, __flags)
 #endif
=20
-#define __BUG__LINE(__file, __line, __value)			\
+#define __BUG__LINE(__file, __line, __flags)			\
 	1: ;							\
 	BUG_ENCODING();						\
-	__BUG_ENTRY_GENERIC(__file, __line, __value);
+	__BUG_ENTRY_GENERIC(__file, __line, __flags);
=20
 /*
  * The extra indirection is to ensure that the __FILE__ string comes throu=
gh
@@ -60,9 +60,9 @@
  * preferable to this unpleasantness. We use mergeable string sections to
  * avoid multiple copies of the string appearing in the kernel image.
  */
-#define __BUG(__file, __line, __value)				\
+#define __BUG(__file, __line)					\
 do {								\
-	asm volatile(__stringify(__BUG__LINE(__file, __line, __value))); \
+	asm volatile(__stringify(__BUG__LINE(__file, __line, 0))); \
 	unreachable();						\
 } while (0)
=20

--=20
2.55.0


