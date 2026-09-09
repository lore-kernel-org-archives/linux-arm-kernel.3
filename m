Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E3BC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8ISCnsd1kBgxpKDcNux5gAnw7Y6k/Yo3uUbNdp9+qI=; b=2CtH2MhFOxnOaAvasabMwn8a+Q
	gNfia9XCJAgi3Q8Z3Ro3sqv0Wjjn2+Z/VwdOa88/lai0OFuJs/fOIu3cPfc6XPO4E6Ljo8ILXqvuu
	29YrkFlyRCWPH+IZSz9F8ZR+aIZjz6Cu/6aiSFUs8jrwq3mGqq8+9Fb1lqsSdofaRYSIuP0X+8HvX
	a8sDsKKQsJGwFyvra9zZSiwFWohbhPKDh9DNIbrVvvIfnUKMK87djqjGLNHhQd+rfb5BOxdiLz6uN
	M/RUfRKJrqwFs4PI+Go+DTvEojdvIIFvFqt0sFuHIB/JmQxMSR0Yt+1FA9A3KCYNEexu6buG50Vkm
	VXOkaqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1s-0000000BALx-2iWc;
	Wed, 09 Sep 2026 08:51:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1g-0000000BACV-3cz4;
	Wed, 09 Sep 2026 08:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=p8ISCnsd1kBgxpKDcNux5gAnw7Y6k/Yo3uUbNdp9+qI=; b=bZ4dr6/HoJObWcZw41kOVJnrKl
	bMdg8/otBxn2fkZZ708gWEnCzYmutkCITZFucXrGpDTnRWBZlNXVl1VnRw9Oi/Q9Nt68jxc+faMMD
	uzuknLBOCe8Q7OM4T9a7cGe9AWq53RDpvYPmTVUFLhGdamvyvqfyKDIeUtHKyqXAWuHU1qZj4vd2s
	0omtPFnFeBDMVk3MJLZEIW7WLQGDBNY7BkU23GgFsRtD4I07ipWROdjlW1U29jXrVMFSMr4nG7pqG
	VOXBBx7Yddj7jCl8N0HnYJfAqzVFnE95b/br2SX1x3bQ8XYLNxmnBctHxGQqLm5UfGF8rOdXFY9a+
	ZpOLFeiA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1d-00000000wH8-3qTI;
	Wed, 09 Sep 2026 08:51:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p8ISCnsd1kBgxpKDcNux5gAnw7Y6k/Yo3uUbNdp9+qI=;
	b=O5zzVmOyrKpaHp2u4bUY98lgwCvVarLkNgeAPPVX89i5JBg3rHp4+Y8F9L4P7sCCu7APVT
	Al93fxOcU0nkxzrDGMp9ojUNo/XMGidIJmj5ushFZTsVzhhH2/4847wUgewnz4odH33RCG
	rYEV6IXxTfCoYWNjLI1njWpXKiTQzh4hlJ2nAfWSRVlSvIRdZ8jZlx0oLL8v+H9qcVdvTu
	VCEGXnt6KMhztEQTNXeBUDeApxeuzzOKfXXfabG23aFg593biDM8h5sQ9dSVqWDjHQtLqp
	9TYPesEC1SSI+QAvRjLvNdyJHhqsK2SHpCmurN0Bhvkm5WRkaGF5W+rYh+i8Fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p8ISCnsd1kBgxpKDcNux5gAnw7Y6k/Yo3uUbNdp9+qI=;
	b=9huAc0xk9QcC4SgqamXcnykpmbUho6tKXuFLvtEqd+RfqJ7UdPuClzkoIyvHwlR5apQHEl
	EoLJQecYy/nKN7DQ==
Date: Wed, 09 Sep 2026 10:51:17 +0200
Subject: [PATCH 04/15] vdso/vsyscall: Define fallback time synchronization
 functions in vsyscall.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-4-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1827;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=sUPCnKCUGSNrK6kUHNVPQIEZiXKtWEAStKPxMYG7MFQ=;
 b=lrpRL87RH6Jns+QOQuU8vG+UhFyds9BwYL/rt0fjZCb0s1Oj7j4AIKDMavYVvjgkUDUjPhvEc
 T9kztup5hZYCOHnR9RnzqXUPyVZQLUeJCQxyJrgUgGCsXxKa0apJ8Bi
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095126_267885_56106070 
X-CRM114-Status: UNSURE (   6.98  )
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

__arch_update_vdso_clock() and __arch_sync_vdso_time_data() are only
used in vsyscall.c. vsyscall.h has become a dumping ground for different
kinds of fallbacks.

Move the fallback function definitions into vsyscall.c.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/asm-generic/vdso/vsyscall.h | 11 -----------
 kernel/time/vsyscall.c              | 12 ++++++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/vsyscall.h
index cdf7b39cd349..cfb740e82cb5 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -4,17 +4,6 @@
 
 #ifndef __ASSEMBLER__
 
-#ifndef __arch_update_vdso_clock
-static __always_inline void __arch_update_vdso_clock(struct vdso_clock *vc)
-{
-}
-#endif /* __arch_update_vdso_clock */
-
-#ifndef __arch_sync_vdso_time_data
-static __always_inline void __arch_sync_vdso_time_data(struct vdso_time_data *vdata)
-{
-}
-#endif /* __arch_sync_vdso_time_data */
 
 #endif /* !__ASSEMBLER__ */
 
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 12e205d86e7f..193a02d78b11 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -16,6 +16,18 @@
 
 #include "timekeeping_internal.h"
 
+#ifndef __arch_update_vdso_clock
+static __always_inline void __arch_update_vdso_clock(struct vdso_clock *vc)
+{
+}
+#endif /* __arch_update_vdso_clock */
+
+#ifndef __arch_sync_vdso_time_data
+static __always_inline void __arch_sync_vdso_time_data(struct vdso_time_data *vdata)
+{
+}
+#endif /* __arch_sync_vdso_time_data */
+
 static inline void fill_clock_configuration(struct vdso_clock *vc, const struct tk_read_base *base)
 {
 	vc->cycle_last	= base->cycle_last;

-- 
2.55.0


