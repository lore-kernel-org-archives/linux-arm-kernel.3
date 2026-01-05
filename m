Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74976C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 11:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9g9Lnydud46re35fg/2MzDNgxrAjuPiPUS4xuOntLK0=; b=RCgN60VobhAi/mkGAwt2SK977d
	mHGIaip8XMBPfPYkuRITYL2eaFO9FP8E8yQMpOKGOQhGW8GzMvrhIkG17EMHUBFCZWjmEi6udYJ5i
	8vXRu++YhsRYdyH/0ITz7DkPzscm0xkuMDKERq7pLHB5ysftdkXUETia7SA9gyMw6l0TjXIQYprYl
	EtKWaevWjInjJkmG0rglu83jHhctY/IIiNb/sDi65BJ+dcBISDfgXEMfY93ma/hPNRIpTmVuBrqYu
	P8z9wwVmDip0CPEO2Luk9uYkuahVglIPTHa2Pj50w/4TrcwYonk1Fcd6xAXA9vmStiXcHGx/n2rEL
	peGkP+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vciPd-0000000B9pT-1oIf;
	Mon, 05 Jan 2026 11:06:13 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vciPb-0000000B9mx-03tM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 11:06:12 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4CD5E5BE34;
	Mon,  5 Jan 2026 11:06:09 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CCFD513964;
	Mon,  5 Jan 2026 11:06:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EqRlMCCbW2keWgAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 05 Jan 2026 11:06:08 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Russell King <linux@armlinux.org.uk>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v5 07/21] arm/paravirt: Use common code for paravirt_steal_clock()
Date: Mon,  5 Jan 2026 12:05:06 +0100
Message-ID: <20260105110520.21356-8-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105110520.21356-1-jgross@suse.com>
References: <20260105110520.21356-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 4CD5E5BE34
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_030611_204378_5C7051C2 
X-CRM114-Status: GOOD (  14.87  )
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

Remove the arch specific variant of paravirt_steal_clock() and use
the common one instead.

This allows to remove paravirt.c and paravirt.h from arch/arm.

Until all archs supporting Xen have been switched to the common code
of paravirt_steal_clock(), drivers/xen/time.c needs to include
asm/paravirt.h for those archs, while this is not necessary for arm
any longer.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/arm/Kconfig                |  1 +
 arch/arm/include/asm/paravirt.h | 18 ------------------
 arch/arm/kernel/Makefile        |  1 -
 arch/arm/kernel/paravirt.c      | 20 --------------------
 drivers/xen/time.c              |  2 ++
 5 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 arch/arm/include/asm/paravirt.h
 delete mode 100644 arch/arm/kernel/paravirt.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fa83c040ee2d..fc9b5b7016c3 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1320,6 +1320,7 @@ config UACCESS_WITH_MEMCPY
 
 config PARAVIRT
 	bool "Enable paravirtualization code"
+	select HAVE_PV_STEAL_CLOCK_GEN
 	help
 	  This changes the kernel so it can modify itself when it is run
 	  under a hypervisor, potentially improving performance significantly
diff --git a/arch/arm/include/asm/paravirt.h b/arch/arm/include/asm/paravirt.h
deleted file mode 100644
index 69da4bdcf856..000000000000
--- a/arch/arm/include/asm/paravirt.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_ARM_PARAVIRT_H
-#define _ASM_ARM_PARAVIRT_H
-
-#ifdef CONFIG_PARAVIRT
-#include <linux/static_call_types.h>
-
-u64 dummy_steal_clock(int cpu);
-
-DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
-
-static inline u64 paravirt_steal_clock(int cpu)
-{
-	return static_call(pv_steal_clock)(cpu);
-}
-#endif
-
-#endif
diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
index afc9de7ef9a1..b36cf0cfd4a7 100644
--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -83,7 +83,6 @@ AFLAGS_iwmmxt.o			:= -Wa,-mcpu=iwmmxt
 obj-$(CONFIG_ARM_CPU_TOPOLOGY)  += topology.o
 obj-$(CONFIG_VDSO)		+= vdso.o
 obj-$(CONFIG_EFI)		+= efi.o
-obj-$(CONFIG_PARAVIRT)	+= paravirt.o
 
 obj-y			+= head$(MMUEXT).o
 obj-$(CONFIG_DEBUG_LL)	+= debug.o
diff --git a/arch/arm/kernel/paravirt.c b/arch/arm/kernel/paravirt.c
deleted file mode 100644
index 3895a5578852..000000000000
--- a/arch/arm/kernel/paravirt.c
+++ /dev/null
@@ -1,20 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *
- * Copyright (C) 2013 Citrix Systems
- *
- * Author: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
- */
-
-#include <linux/export.h>
-#include <linux/jump_label.h>
-#include <linux/types.h>
-#include <linux/static_call.h>
-#include <asm/paravirt.h>
-
-static u64 native_steal_clock(int cpu)
-{
-	return 0;
-}
-
-DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
diff --git a/drivers/xen/time.c b/drivers/xen/time.c
index d360ded2ef39..53b12f5ac465 100644
--- a/drivers/xen/time.c
+++ b/drivers/xen/time.c
@@ -10,7 +10,9 @@
 #include <linux/static_call.h>
 #include <linux/sched/cputime.h>
 
+#ifndef CONFIG_HAVE_PV_STEAL_CLOCK_GEN
 #include <asm/paravirt.h>
+#endif
 #include <asm/xen/hypervisor.h>
 #include <asm/xen/hypercall.h>
 
-- 
2.51.0


