Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9676DE9B36D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgXUWuBQc37HPqUBgBljEt4K1lGTSpiCtiKFdFvnpEo=; b=gXVqvZXs7MPqaI8sPN1G0WdI6g
	+l6+kmDS2b6BBz5L00pCwCgezQtJg9ELQfH0g+JuOWjIkP24zgQ5fmetXHsK244QvBjI4pMweeiku
	lfRnA5a5yCE8Tuf/UfowkoYR1tD5OND8MY+pgU5gu3FcGW0Kb9GRdKiRTA9YPuw42R2DSDK76RBRW
	mYEIyE3Tg+n4AI1sMnfVcLrnISGW8CbRpHRCepvuTnBsLgEKs7E/TlmLHoHyh1wOQ5qZ8+KIsaTeX
	+VwbeF6k0rtgX0pKDkP69Opn8Xp/TkHH3klf2nZFfmUPhn/IEkp9JiQvuw8eJncpWlaKIffZr2kNd
	Dnv8qztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LU-0000000Cvzd-1sZT;
	Mon, 02 Mar 2026 12:25:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LM-0000000CvpE-44Rr;
	Mon, 02 Mar 2026 12:25:50 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgXUWuBQc37HPqUBgBljEt4K1lGTSpiCtiKFdFvnpEo=;
	b=ZRJF2/RIYlZzXdvvP4EyC5ziS1eYTGNaiCpGWGAlhlhh6WP8XJtMwKY10FScMfkRk07Kpn
	WAm0HrLrPe3V8GufiCyKFmoR+hIoDakEwVJRmOfrOG1vTfDvZthRNy9j1FqSQDBSumosRb
	lSJyQo7Ek9W6Irxwps/fZr6+32MXQ1g940bY7aUn2wgzoOpTYYGfSmYo1TtUi2eNGBzDXQ
	HoOKG9XkKlO6Lsynm5IwDc/mDANODBHa3D+7XWmQ4jr8Z4GRPHRxNIFyYedKVrZJWzUsgn
	Xi/TXpXkeaoOKoyyrYw2RkYIhmbqg4P5rd78zu1pTPRTbMW07FzruR62fY8Dzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgXUWuBQc37HPqUBgBljEt4K1lGTSpiCtiKFdFvnpEo=;
	b=0RhC5Fte5zjulHI4Ol2L/ovJ2Kd9lvvPGCNYvwBDoFq6AG8nEkIzJV8ldugwY4YHFGhnle
	Y1e4YJBTshKAKTBQ==
Date: Mon, 02 Mar 2026 13:25:26 +0100
Subject: [PATCH 02/15] auxvec.h: Move AT_VECTOR_SIZE definitions to
 linux/auxvec.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-at-vector-size-arch-v1-2-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1267;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=R6dPuK9hTEu2wzxXNEaPtc8TE7i9ikP4nTJiTP9bZT8=;
 b=ZulijLjkAtvEzMGw3cQEKThTnvyrB3XWkn02AB0dxIROztyb5g4HrOCwXizPScG4JZMtRLaOM
 3hiDIzMjiB4ARdfLbg+OTnHYu6B/6h5UxzpDiSphCOmDSpy2QygkNcG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042549_144397_B8FB559A 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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

The auxvec.h header is a more fitting place for these definitions.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/auxvec.h   | 7 +++++++
 include/linux/mm_types.h | 6 ------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/auxvec.h b/include/linux/auxvec.h
index 407f7005e6d6..943e8b80b41e 100644
--- a/include/linux/auxvec.h
+++ b/include/linux/auxvec.h
@@ -6,4 +6,11 @@
 
 #define AT_VECTOR_SIZE_BASE 22 /* NEW_AUX_ENT entries in auxiliary table */
   /* number of "#define AT_.*" above, minus {AT_NULL, AT_IGNORE, AT_NOTELF} */
+
+#ifndef AT_VECTOR_SIZE_ARCH
+#define AT_VECTOR_SIZE_ARCH 0
+#endif
+
+#define AT_VECTOR_SIZE (2*(AT_VECTOR_SIZE_ARCH + AT_VECTOR_SIZE_BASE + 1))
+
 #endif /* _LINUX_AUXVEC_H */
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 3cc8ae722886..64019dc29f4c 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -25,12 +25,6 @@
 
 #include <asm/mmu.h>
 
-#ifndef AT_VECTOR_SIZE_ARCH
-#define AT_VECTOR_SIZE_ARCH 0
-#endif
-#define AT_VECTOR_SIZE (2*(AT_VECTOR_SIZE_ARCH + AT_VECTOR_SIZE_BASE + 1))
-
-
 struct address_space;
 struct futex_private_hash;
 struct mem_cgroup;

-- 
2.53.0


