Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04671CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 06:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ah+/pevmsRdBeVrvl0aCHa/g+fwOg7IZR743DPWXfM0=; b=Gu8toZcbgduQmvAy0TDfDsnjPk
	tcZRUNCH5JEA2pFXJMuFDL4d3s8zTkmwlkMZZfgd7ZpDdgjouWVNw+KpP1visVbYSMXjwJJENeYPG
	IrcPvHMP9+WdqiL+gzpWisZ341sbVeVEAn8m64EXhv51rq6kKHDhkLlRsHGKEiChcYFw3o0n5SP+w
	wfh4Xj0XbMwBVmBCKKXKbasTrD9FBXKyvABdDVzZGGD9WaOTCb+swMOfELrL+mJsmM1oROco8jVvA
	ZO0oto8k+G+TXjW4NL2fcp1u3pfrPUfqUIgSEUxEz2dkHGDP/FMEjuNqL1ZMEU6AErkN8CAgv1FcG
	s8Tg+Wtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwatz-00000001GUg-2hzp;
	Thu, 11 Sep 2025 06:35:27 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwatw-00000001GQM-31Bz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 06:35:26 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A431A3FA80;
	Thu, 11 Sep 2025 06:35:21 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49BF41372E;
	Thu, 11 Sep 2025 06:35:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vvWQEKltwmghTQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 11 Sep 2025 06:35:21 +0000
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
	xen-devel@lists.xenproject.org
Subject: [PATCH 07/14] arm/paravirt: use common code for paravirt_steal_clock()
Date: Thu, 11 Sep 2025 08:34:26 +0200
Message-ID: <20250911063433.13783-8-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911063433.13783-1-jgross@suse.com>
References: <20250911063433.13783-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: A431A3FA80
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_233524_919217_3EF14AB9 
X-CRM114-Status: GOOD (  15.74  )
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
index b1f3df39ed40..48c3a36a63f8 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1338,6 +1338,7 @@ config UACCESS_WITH_MEMCPY
 
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


