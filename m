Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A789CA9EBB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 22:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNw37UNtvQxjG0ooT5+8UhYoUtdXBXWHnW5/s8bHFrQ=; b=z5Q0FZ66ZH81theaQyCgyii7rS
	id5i5LGA5bl8Iz8vLhCPrSm7vQQLu5PofvqrTdcaAyo96lqS3GjJ20R4lE/zLFosPG2gzEOoRYn9p
	AvmSSFUxAcWsW/QtfRcm6bqGt2EKlmbykzoOYBbUNRlinzbnsNvETNB8H7oT4psCwij2mMXJmgUkS
	FAsctfl0MqOvZU+pQwCYeI5Tauk0YPitH3jgd/W4GTVngsiuuGunbnlAEG0WENXvaf9i/LcctNLa7
	D6a1zlOXOhmeKO/FINCos8ecQuKP3orhjQx5ryWOZRwO1LbobwoAGD/dPUAnbd2tGeSHbgi3TQN+4
	fs6duvhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyd-00000007HFS-1rx6;
	Fri, 09 Oct 2026 22:22:07 +0000
Received: from chamillionaire.breakpoint.cc ([91.216.245.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIya-00000007HDw-3bf3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 22:22:06 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1791584522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNw37UNtvQxjG0ooT5+8UhYoUtdXBXWHnW5/s8bHFrQ=;
	b=kWy94j4tZnlb5aOSzjzkx1BwvMSh/qU27nUVr9alFiPVUnhGlwVeKQ/CsFLWEVjusK2Tx3
	pJQuvlYoCO5qYZcYVGnI+sQGhWfB+4VbU0OzRUzkeWc0JeFsyUbgwqEYsn0amM459PxIEo
	GErPmfX4mZ0Losr/a3agfqGyS+uUkh+XOG7xOa39ynr7jyOiA4vVoQsAsNCAcvOuskkqu7
	px4DhdeATbxbeGsNeUc9UHzeTU/q9bUfMYsUyzoH4SmlOD3r6pgRXRRJhYS3PctlfBh7pG
	U3BfR63iv8z7XAS6lbOoGQusJKS+eHK3JjagGaV5Yx5y9GH32qQXsz8N7cfNiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1791584522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNw37UNtvQxjG0ooT5+8UhYoUtdXBXWHnW5/s8bHFrQ=;
	b=MTpUrNBifTfdWWHM5OLWTfeLaEqQG/Iw6OLhFpjXhRhn6Ojy65kT4dedTxeHC3GX6zRegR
	JC1srkjIv/A6YtCw==
To: linux-arm-kernel@lists.infradead.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 01/11] ARM: BUG: Move the assembly out of __BUG() macro
Date: Sat, 10 Oct 2026 00:21:08 +0200
Message-ID: <20261010-arm_warning-v1-1-ddf4be42ae0d@breakpoint.cc>
In-Reply-To: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
References: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_152205_056401_F34D667B 
X-CRM114-Status: GOOD (  12.32  )
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

Move the assembly line from within the __BUG() macro into its own
define. The quotation marks and the string escape can be removed and
instead the resulting __BUG__LINE() macro can be wrapped into
__stringify() to achieve the same.
The BUG_INSTR() expects a string context. This can be replaced with
___asm_opcode_to_mem_arm()/_thumb16() macro. Wrap this into
BUG_ENCODING() macro.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 arch/arm/include/asm/bug.h | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/arm/include/asm/bug.h b/arch/arm/include/asm/bug.h
index ba8d9d7d242bd..24f46d4f6e733 100644
--- a/arch/arm/include/asm/bug.h
+++ b/arch/arm/include/asm/bug.h
@@ -14,9 +14,11 @@
 #ifdef CONFIG_THUMB2_KERNEL
 #define BUG_INSTR_VALUE 0xde02
 #define BUG_INSTR(__value) __inst_thumb16(__value)
+#define BUG_ENCODING() .short ___asm_opcode_to_mem_thumb16(BUG_INSTR_VALUE)
 #else
 #define BUG_INSTR_VALUE 0xe7f001f2
 #define BUG_INSTR(__value) __inst_arm(__value)
+#define BUG_ENCODING() .long ___asm_opcode_to_mem_arm(BUG_INSTR_VALUE)
 #endif
=20
=20
@@ -25,24 +27,27 @@
=20
 #ifdef CONFIG_DEBUG_BUGVERBOSE
=20
+#define __BUG__LINE(__file, __line, __value)			\
+	1: ;							\
+	BUG_ENCODING();						\
+	.pushsection .rodata.str, "aMS", %progbits, 1;		\
+	2: .asciz  __file;					\
+	.popsection;						\
+	.pushsection __bug_table,"aw";				\
+	.align 2;						\
+	3: .word 1b, 2b;					\
+	.hword __line , 0;					\
+	.popsection;
+
 /*
  * The extra indirection is to ensure that the __FILE__ string comes throu=
gh
  * OK. Many version of gcc do not support the asm %c parameter which would=
 be
  * preferable to this unpleasantness. We use mergeable string sections to
  * avoid multiple copies of the string appearing in the kernel image.
  */
-
 #define __BUG(__file, __line, __value)				\
 do {								\
-	asm volatile("1:\t" BUG_INSTR(__value) "\n"  \
-		".pushsection .rodata.str, \"aMS\", %progbits, 1\n" \
-		"2:\t.asciz " #__file "\n" 			\
-		".popsection\n" 				\
-		".pushsection __bug_table,\"aw\"\n"		\
-		".align 2\n"					\
-		"3:\t.word 1b, 2b\n"				\
-		"\t.hword " #__line ", 0\n"			\
-		".popsection");					\
+	asm volatile(__stringify(__BUG__LINE(__file, __line, __value))); \
 	unreachable();						\
 } while (0)
=20

--=20
2.55.0


