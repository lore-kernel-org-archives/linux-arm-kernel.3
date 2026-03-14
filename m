Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934F910706CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fo0Oqzgzp9XZm0tigzo8JO6vXZB/z87HO/DUy/D1lL4=; b=HwSBTBlbTlYVJB3sUXMcjijDTz
	0w45gvqiKvzE1Y9phTro27uQh8EKXjRar4+S0dYvYUcVVM46ACDBiUJHtaXP8dMfVD/fm0q/KKGOo
	LjoJXPcbYIck1z/4UAGdFZdUJTKQg/KK6dvqz7XYED+yMpJ/ypCDABoHOF0sp4pOX4hNhZaIo4nOO
	jWFU1r49VoDylCoP35XtMweYnFKSAirHYs9+6oAILSBv2TN56HL88aFJ9/e+viXwj8gkekVTCCxbe
	3ewpi6CTS9/DABrij+8a0VGSUttwbVrQgu5nCwgmXaklRHn/ZGCTHwae/sySaXUWwgX1SV4BBXNVK
	ZIowNE9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Nvq-00000001piq-20dX;
	Sat, 14 Mar 2026 12:17:26 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Nvo-00000001pi6-1ag5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773490637;
	bh=OlthjceWFlP/t9Z+nIzC6nOI/h+7JAjfkWc6lPSVgvU=;
	h=From:Date:Subject:To:Cc:From;
	b=XXWPMO7jfBtuimVlb8bc22Z8R04dq7vUlWUqmrKPxru7D+xPDNGVBzLkSE+0i12ny
	 fde8gga8gSixRTyJzo/54EubC/gs6UUL2aElsZNxWPdlnnaNIby3kpiMk4+cR/l5hz
	 DOQT/YLP/heB5V7qwY6tvaTibtE20dtUu58V44SY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 14 Mar 2026 13:17:13 +0100
Subject: [PATCH] ARM: uapi: Add ucontext.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260314-uapi-ucontext-arm-v1-1-d9922bdf7dbc@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avIrBvQfqmrRAuzsWaRiVYE0t2Tl
 t/ivQSRAlOEQSQIdHPkw2WoQoDZtFsJecmGUpatrFSNl/aMlzncSc+JOuzYSdvrpjNzrxbInQ9
 k+fmf4/S+H7r3CGBjAAAA
X-Change-ID: 20260314-uapi-ucontext-arm-70f9a57cb91d
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773490637; l=3751;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=OlthjceWFlP/t9Z+nIzC6nOI/h+7JAjfkWc6lPSVgvU=;
 b=K1xCTxWYYvR/c56rgglSso3P9t4OrUPOMfy6xW2lEOXuwMDdI5IqLR20vsyTLJY8wt8sze9rf
 eUJ14aZDx8+C/jaxBGz8UQVc4HncxcoXKxSguMw7ye7TT8sIugBgENg
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_051724_583252_6052315F 
X-CRM114-Status: GOOD (  17.67  )
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

The ARM asm/ucontext.h header was written to be usable both inside the
kernel and in the UAPI, by using '#ifdef __KERNEL__' guards.
However as the header is not located in the 'uapi/' directory, it will
never be exposed as such.

Move the UAPI bits to a new UAPI header and remove the pointless
ifdeffery.

While at it, also add some necessary includes to the new header.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/arm/include/asm/ucontext.h      | 28 +---------------------------
 arch/arm/include/uapi/asm/ucontext.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/arch/arm/include/asm/ucontext.h b/arch/arm/include/asm/ucontext.h
index 4048c92d9c2b..e4e00822198e 100644
--- a/arch/arm/include/asm/ucontext.h
+++ b/arch/arm/include/asm/ucontext.h
@@ -4,31 +4,7 @@
 
 #include <asm/fpstate.h>
 #include <asm/user.h>
-
-/*
- * struct sigcontext only has room for the basic registers, but struct
- * ucontext now has room for all registers which need to be saved and
- * restored.  Coprocessor registers are stored in uc_regspace.  Each
- * coprocessor's saved state should start with a documented 32-bit magic
- * number, followed by a 32-bit word giving the coproccesor's saved size.
- * uc_regspace may be expanded if necessary, although this takes some
- * coordination with glibc.
- */
-
-struct ucontext {
-	unsigned long	  uc_flags;
-	struct ucontext  *uc_link;
-	stack_t		  uc_stack;
-	struct sigcontext uc_mcontext;
-	sigset_t	  uc_sigmask;
-	/* Allow for uc_sigmask growth.  Glibc uses a 1024-bit sigset_t.  */
-	int		  __unused[32 - (sizeof (sigset_t) / sizeof (int))];
-	/* Last for extensibility.  Eight byte aligned because some
-	   coprocessors require eight byte alignment.  */
- 	unsigned long	  uc_regspace[128] __attribute__((__aligned__(8)));
-};
-
-#ifdef __KERNEL__
+#include <uapi/asm/ucontext.h>
 
 /*
  * Coprocessor save state.  The magic values and specific
@@ -91,6 +67,4 @@ struct aux_sigframe {
 	unsigned long		end_magic;
 } __attribute__((__aligned__(8)));
 
-#endif
-
 #endif /* !_ASMARM_UCONTEXT_H */
diff --git a/arch/arm/include/uapi/asm/ucontext.h b/arch/arm/include/uapi/asm/ucontext.h
new file mode 100644
index 000000000000..6e6c3202e85e
--- /dev/null
+++ b/arch/arm/include/uapi/asm/ucontext.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_ASMARM_UCONTEXT_H
+#define _UAPI_ASMARM_UCONTEXT_H
+
+#include <asm/sigcontext.h>
+#include <asm/signal.h>
+
+/*
+ * struct sigcontext only has room for the basic registers, but struct
+ * ucontext now has room for all registers which need to be saved and
+ * restored.  Coprocessor registers are stored in uc_regspace.  Each
+ * coprocessor's saved state should start with a documented 32-bit magic
+ * number, followed by a 32-bit word giving the coproccesor's saved size.
+ * uc_regspace may be expanded if necessary, although this takes some
+ * coordination with glibc.
+ */
+
+struct ucontext {
+	unsigned long	  uc_flags;
+	struct ucontext  *uc_link;
+	stack_t		  uc_stack;
+	struct sigcontext uc_mcontext;
+	sigset_t	  uc_sigmask;
+	/* Allow for uc_sigmask growth.  Glibc uses a 1024-bit sigset_t.  */
+	int		  __unused[32 - (sizeof (sigset_t) / sizeof (int))];
+	/* Last for extensibility.  Eight byte aligned because some
+	   coprocessors require eight byte alignment.  */
+	unsigned long	  uc_regspace[128] __attribute__((__aligned__(8)));
+};
+
+#endif

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260314-uapi-ucontext-arm-70f9a57cb91d

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


