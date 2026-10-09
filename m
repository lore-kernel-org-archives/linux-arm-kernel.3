Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AC1CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 22:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QotgEE6zkXU/e7sfwB6UKbc29AjN56L8F+/+mhUtZk=; b=qi2Viu1GJdD2rU+xmZOFLqRWcD
	ScWKRL6cHQdaYi8Ghg/A1u1blPAX5lxt9TIPjjzQzFwxM0JedjCItBk6F3NexJcRKHQNBScOkjAId
	CzFbbiLuwahPtMprcWI9qB4uYdjstfVK+ClKvmGUgRwbHoTVtx0dL58tCZldbamqw9uIxS9O9p4P0
	KLDKmBR3eeV+rvSYJKV7hOwDJXp7Ka6BPIv9zOAW+9Vb9EK+fKXJ61AmTxPaUQ9wK8uDAy95s1u4s
	wf+blWrGZz33g3YtK3UTtQ7Sr9G5SZxstE8qXUV/KhY8PsGEMguJ9pvcDZDS49KfkP0z9E5mT/M/J
	KYV27IGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyf-00000007HHk-3kKE;
	Fri, 09 Oct 2026 22:22:09 +0000
Received: from chamillionaire.breakpoint.cc ([91.216.245.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyd-00000007HFA-2uHE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 22:22:08 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1791584523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QotgEE6zkXU/e7sfwB6UKbc29AjN56L8F+/+mhUtZk=;
	b=Feps9vHABaqdlM/V6avwAm5ZMAK8GjltWbZ45SqmyP6+lPdk6DV1unRFV4PB7IPgDZv2Cp
	cwWAF6h35c84k0JzibODwM3pXyvkcP2CzlR0R7XIT/ZOhZuTzYXlQgFW0vOGAzwcRzKMIO
	2kNsQJ5IZ356zzSwP2vZrUDtfRtq08lFtxa0ZkuhoknDxyx4asKndtt5Kt2qwDcX5cbvxD
	xWhnyzisZEApxH+cXnnLgCvki1xrPlk8wS13uX+0qhw+nu8yFR5p8RsyJ68kJASjHl/Poo
	755eTJLCpF2GFJ/97uVtEtoWPnbUsxqO9dRjBAgffNAS5eGv4Cw8wjLRi7BHAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1791584523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QotgEE6zkXU/e7sfwB6UKbc29AjN56L8F+/+mhUtZk=;
	b=UbIp8GsgEMqMgCi+yEL4jbMHo1rLcBkeTe2scamBCZR8e9THdwdhpG0iNWMx1jwuAZUHX8
	ePgYfxMe5MQUmfDA==
To: linux-arm-kernel@lists.infradead.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 06/11] ARM: BUG: Move the __BUG() out of CONFIG_DEBUG_BUGVERBOSE
Date: Sat, 10 Oct 2026 00:21:13 +0200
Message-ID: <20261010-arm_warning-v1-6-ddf4be42ae0d@breakpoint.cc>
In-Reply-To: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
References: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_152207_897615_25F92E16 
X-CRM114-Status: GOOD (  11.24  )
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

Move the __BUG() macro out of the CONFIG_DEBUG_BUGVERBOSE block and
provide an empty _BUG_VERBOSE_LINE() macro for the
!CONFIG_DEBUG_BUGVERBOSE case.

This allows the removal of the other __BUG implementation (in the old
!CONFIG_DEBUG_BUGVERBOSE case). Remove BUG_INSTR which has no users now.

The side effect is that the entries in __bug_table are still added but
without FILE and LINE.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 arch/arm/include/asm/bug.h | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm/include/asm/bug.h b/arch/arm/include/asm/bug.h
index 172e6a84541cb..c47b693aed8ae 100644
--- a/arch/arm/include/asm/bug.h
+++ b/arch/arm/include/asm/bug.h
@@ -13,11 +13,9 @@
  */
 #ifdef CONFIG_THUMB2_KERNEL
 #define BUG_INSTR_VALUE 0xde02
-#define BUG_INSTR(__value) __inst_thumb16(__value)
 #define BUG_ENCODING() .short ___asm_opcode_to_mem_thumb16(BUG_INSTR_VALUE)
 #else
 #define BUG_INSTR_VALUE 0xe7f001f2
-#define BUG_INSTR(__value) __inst_arm(__value)
 #define BUG_ENCODING() .long ___asm_opcode_to_mem_arm(BUG_INSTR_VALUE)
 #endif
=20
@@ -26,7 +24,6 @@
 #define _BUG(file, line, value) __BUG(file, line, value)
=20
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-
 #define _BUG_VERBOSE_LINE(__file, __line)			\
 	.pushsection .rodata.str, "aMS", %progbits, 1;		\
 	2: .asciz  __file;					\
@@ -35,6 +32,10 @@
 	.word 2b;						\
 	.hword __line;						\
=20
+#else
+#define _BUG_VERBOSE_LINE(__file, __line)
+#endif
+
 #ifdef CONFIG_GENERIC_BUG
 #define __BUG_ENTRY_GENERIC(__file, __line, __value)		\
 	.pushsection __bug_table,"aw";				\
@@ -65,15 +66,6 @@ do {								\
 	unreachable();						\
 } while (0)
=20
-#else
-
-#define __BUG(__file, __line, __value)				\
-do {								\
-	asm volatile(BUG_INSTR(__value) "\n");			\
-	unreachable();						\
-} while (0)
-#endif  /* CONFIG_DEBUG_BUGVERBOSE */
-
 #define HAVE_ARCH_BUG
=20
 #include <asm-generic/bug.h>

--=20
2.55.0


