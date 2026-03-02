Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DC8E9B378
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXDeF7UDpB8ZiPE3iLm028k2zogpL4XBUC66IjBoygE=; b=sXKFXuWJEwrS9q0OHWcUy4ZyUl
	q8XWjMC+BaJ5A4clqtupy4PXFnBoh/QbNMe+sED/36+RvdFlmDrCi+gdu3+joIb+txK5coxi5o0KI
	Yc5BqujOdcJrNylgpthc/xYM1xVn3Z+XWxqGYYOwWn3ENWZBGk7PDuc2IHxXweEj4Xtk+jBlr+Fjr
	At2SX5vOs4OaWaRjTVKRnnynzLPkNBaq8lGJZ/313IfWhxBQpAAKSmKsTszLhPMSdOweweEOLFesS
	T5+2RLv83chaZ1W2mY/ou9TkIUDh/qbAp6Fvj7yHXp9PDEFxWpoZ8gVahqaj4M8BMuBPUdANq2PNP
	f7awAsvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Ld-0000000CwEP-25Za;
	Mon, 02 Mar 2026 12:26:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LP-0000000Cvqf-0dop;
	Mon, 02 Mar 2026 12:25:54 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXDeF7UDpB8ZiPE3iLm028k2zogpL4XBUC66IjBoygE=;
	b=u5zypD0/i7Uz5OODrlF49hQ+lpWWTOdLI3nJOWR1OIvOaMO/3vb+rs4YWorLAbvP3SeupE
	efw3ir1dAVgCC7GhhgW3qdEFCEqGz/gSDiFzw5LRuYIKpRBxkhhBowXFddLuhZtiaOP4gF
	dlepkL6XEteTWqc5T9no4ZA3k61IKxfE6IyhfQStErarfrPL67AkxEbr6CYYlqNEZQVMqN
	NX7z/XIV3AaMIkKD+rc7xX8BEr+XDtbuCIpEFqfZ3QBZQ8mYAYth30AHwbN8dJIxz2QK7H
	BcQ+zup4ER2aBs9NnJ3azWnJ9/PQBtVXq08kdgFnw32rydUXnsqSCDbbdOlVJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXDeF7UDpB8ZiPE3iLm028k2zogpL4XBUC66IjBoygE=;
	b=YRuN5Am8QTcAru6KtUv5IvXWiWNuN4ajxCeRCgIAwKrJtoAJkHubhsTbdBJDWkHmvs5dPw
	Q4dALwGBXmkPgVBw==
Date: Mon, 02 Mar 2026 13:25:32 +0100
Subject: [PATCH 08/15] LoongArch: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-at-vector-size-arch-v1-8-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1725;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+/a7BCuaRvs/grFgisGI29OqfBKuEYQlySRlV2+Ad3w=;
 b=PsVs/lovJCA1Gx2WwwkdDjFmcUu2Juw49xEDuMkmmUjNuORoQIekOKf3Yr14UygMky0lYF1th
 pALKMlLZtR4CkzYTF734/hb85wQvMSVlXVQIwWJIc24yD/mabNmcyJT
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042551_422530_CE5EEF95 
X-CRM114-Status: GOOD (  11.63  )
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

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to a kernel-internal header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/loongarch/include/asm/auxvec.h      | 14 ++++++++++++++
 arch/loongarch/include/uapi/asm/auxvec.h |  8 +++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/include/asm/auxvec.h b/arch/loongarch/include/asm/auxvec.h
new file mode 100644
index 000000000000..37dd717a3a22
--- /dev/null
+++ b/arch/loongarch/include/asm/auxvec.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Author: Hanlu Li <lihanlu@loongson.cn>
+ *         Huacai Chen <chenhuacai@loongson.cn>
+ *
+ * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
+ */
+
+#ifndef __ASM_AUXVEC_H
+#define __ASM_AUXVEC_H
+
+#define AT_VECTOR_SIZE_ARCH 1 /* entries in ARCH_DLINFO */
+
+#endif /* __ASM_AUXVEC_H */
diff --git a/arch/loongarch/include/uapi/asm/auxvec.h b/arch/loongarch/include/uapi/asm/auxvec.h
index 922d9e6b5058..79691c422c7e 100644
--- a/arch/loongarch/include/uapi/asm/auxvec.h
+++ b/arch/loongarch/include/uapi/asm/auxvec.h
@@ -6,12 +6,10 @@
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
 
-#ifndef __ASM_AUXVEC_H
-#define __ASM_AUXVEC_H
+#ifndef __UAPI_ASM_AUXVEC_H
+#define __UAPI_ASM_AUXVEC_H
 
 /* Location of VDSO image. */
 #define AT_SYSINFO_EHDR		33
 
-#define AT_VECTOR_SIZE_ARCH 1 /* entries in ARCH_DLINFO */
-
-#endif /* __ASM_AUXVEC_H */
+#endif /* __UAPI_ASM_AUXVEC_H */

-- 
2.53.0


