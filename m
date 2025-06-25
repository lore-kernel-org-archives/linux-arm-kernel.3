Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8962EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X+5+9SRCmujO2T9CtdWgkk6IySKFq1qnByIJm2uIdhQ=; b=oysTP/YFZitUW1Jmk6iwI1P4hm
	+Z/CosGsnut6B5WRVWVAIKW9IR9jrS7m/lTlTMQpjVHSmPA10pJ9XotR3dCxDsbj95znyjqwV4Lro
	NW4jOPBaU2bVbiQaFAWYy4Nfgz+VamgBMsSDiUzG+bqcRb0wQnfWnQDrpffGjSSlb6jox193jnZ4/
	keb0RnFdCNSTZeS5gDj/25xULRZIq9dwsd65BK6xfpWZGdykSX6EEW9lfZDVgQqqtLgD0UPk+0G6H
	AgnHiISgfDawksOKV+2kvEG4uePFakFiHMxZIBCy84yhO+4RRi1Zrubs1YrxgxYBs4tYF+1z7uAuZ
	AXbJO9bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVJ3-00000009fLF-0ZQM;
	Wed, 25 Jun 2025 18:57:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPyB-00000008lMq-1P2N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 13:15:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C013F61142;
	Wed, 25 Jun 2025 13:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6A7C4CEEA;
	Wed, 25 Jun 2025 13:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857318;
	bh=2piF3483Pz4JDdFUQw6HgD2GVTOG3rmk2pWQMFIJEqU=;
	h=From:To:Cc:Subject:Date:From;
	b=nZirtRzj9JTpn1p5W94ReFTFR8aiBBfnf1QCvvu4lEv274VM0D2/phl5Ou5XseR+k
	 6ayvzpOmRu5x7dPOlIfYOeCSFhDai8CKV7QfGqjZR2bgSNNwT0jFGt8scFtK3EY9Y7
	 esGxANr+IuEqqxkT9FpNyUMpHb65MguGH6gjM/0qGYOf3SHUp4jLk6wvLZja4TIisT
	 KAqt5XAKYEec/ZZU4q0C0odSWg5spOHD2+NaKvSw8Wr2ppJ9OF3wQqimXZ7Ffl6WGX
	 HJSZ8h8nZIGnIlmK5IbNwKlCVet60O1ihKcqhE0Em3qzZJSDwE2619PPFx9Xl4eBVs
	 DjnGZr7rErhyg==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Helge Deller <deller@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] fbdev: remove fb_notify support
Date: Wed, 25 Jun 2025 15:12:22 +0200
Message-Id: <20250625131511.3366522-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

Commit dc2139c0aa32 ("leds: backlight trigger: Replace fb events with a
dedicated function call") removed the FB_EVENT_BLANK notifier, and now
the only remaining user of the FB notifier is the metronomefb driver on
the PXA/AM200EPD board.

This was introduced in commit 922613436ae5 ("[ARM] 5200/1: am200epd: use
fb notifiers and gpio api"), which converted it from an earlier version,
but as far as I can tell this can never have worked because the notifier
is called after the data it passes down is accessed.

Commit 867187821e5e ("fbdev/metronomefb: Use struct fb_info.screen_buffer")
broke this further, and there are likely other parts of the driver that
no longer work.

The am200epd board support itself should have also been removed long ago,
as there are no users and it was never converted to devicetree format.

Mark the board as broken to prevent build failures and remove the now
unused notifiers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/Kconfig            |  1 +
 drivers/video/fbdev/core/Makefile    |  1 -
 drivers/video/fbdev/core/fb_notify.c | 54 ----------------------------
 drivers/video/fbdev/core/fbmem.c     | 15 --------
 include/linux/fb.h                   | 21 -----------
 5 files changed, 1 insertion(+), 91 deletions(-)
 delete mode 100644 drivers/video/fbdev/core/fb_notify.c

diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 10e472f4fa43..edefc953e4f9 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -69,6 +69,7 @@ choice
 
 config GUMSTIX_AM200EPD
 	bool "Enable AM200EPD board support"
+	depends on BROKEN
 
 config GUMSTIX_AM300EPD
 	bool "Enable AM300EPD board support"
diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index d15974759086..ac8036209501 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
 obj-$(CONFIG_FB_CORE)             += fb.o
 fb-y                              := fb_info.o \
                                      fbmem.o fbcmap.o \
diff --git a/drivers/video/fbdev/core/fb_notify.c b/drivers/video/fbdev/core/fb_notify.c
deleted file mode 100644
index 10e3b9a74adc..000000000000
--- a/drivers/video/fbdev/core/fb_notify.c
+++ /dev/null
@@ -1,54 +0,0 @@
-/*
- *  linux/drivers/video/fb_notify.c
- *
- *  Copyright (C) 2006 Antonino Daplas <adaplas@pol.net>
- *
- *	2001 - Documented with DocBook
- *	- Brad Douglas <brad@neruo.com>
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file COPYING in the main directory of this archive
- * for more details.
- */
-#include <linux/fb.h>
-#include <linux/notifier.h>
-#include <linux/export.h>
-
-static BLOCKING_NOTIFIER_HEAD(fb_notifier_list);
-
-/**
- *	fb_register_client - register a client notifier
- *	@nb: notifier block to callback on events
- *
- *	Return: 0 on success, negative error code on failure.
- */
-int fb_register_client(struct notifier_block *nb)
-{
-	return blocking_notifier_chain_register(&fb_notifier_list, nb);
-}
-EXPORT_SYMBOL(fb_register_client);
-
-/**
- *	fb_unregister_client - unregister a client notifier
- *	@nb: notifier block to callback on events
- *
- *	Return: 0 on success, negative error code on failure.
- */
-int fb_unregister_client(struct notifier_block *nb)
-{
-	return blocking_notifier_chain_unregister(&fb_notifier_list, nb);
-}
-EXPORT_SYMBOL(fb_unregister_client);
-
-/**
- * fb_notifier_call_chain - notify clients of fb_events
- * @val: value passed to callback
- * @v: pointer passed to callback
- *
- * Return: The return value of the last notifier function
- */
-int fb_notifier_call_chain(unsigned long val, void *v)
-{
-	return blocking_notifier_call_chain(&fb_notifier_list, val, v);
-}
-EXPORT_SYMBOL_GPL(fb_notifier_call_chain);
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index dfcf5e4d1d4c..82ec7351e7da 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -498,14 +498,6 @@ static int do_register_framebuffer(struct fb_info *fb_info)
 	num_registered_fb++;
 	registered_fb[i] = fb_info;
 
-#ifdef CONFIG_GUMSTIX_AM200EPD
-	{
-		struct fb_event event;
-		event.info = fb_info;
-		fb_notifier_call_chain(FB_EVENT_FB_REGISTERED, &event);
-	}
-#endif
-
 	return fbcon_fb_registered(fb_info);
 }
 
@@ -544,13 +536,6 @@ static void do_unregister_framebuffer(struct fb_info *fb_info)
 	fb_destroy_modelist(&fb_info->modelist);
 	registered_fb[fb_info->node] = NULL;
 	num_registered_fb--;
-#ifdef CONFIG_GUMSTIX_AM200EPD
-	{
-		struct fb_event event;
-		event.info = fb_info;
-		fb_notifier_call_chain(FB_EVENT_FB_UNREGISTERED, &event);
-	}
-#endif
 	fbcon_fb_unregistered(fb_info);
 
 	/* this may free fb info */
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 05cc251035da..520ad870b8b2 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -151,27 +151,6 @@ struct fb_blit_caps {
 	u32 flags;
 };
 
-#ifdef CONFIG_FB_NOTIFY
-extern int fb_register_client(struct notifier_block *nb);
-extern int fb_unregister_client(struct notifier_block *nb);
-extern int fb_notifier_call_chain(unsigned long val, void *v);
-#else
-static inline int fb_register_client(struct notifier_block *nb)
-{
-	return 0;
-};
-
-static inline int fb_unregister_client(struct notifier_block *nb)
-{
-	return 0;
-};
-
-static inline int fb_notifier_call_chain(unsigned long val, void *v)
-{
-	return 0;
-};
-#endif
-
 /*
  * Pixmap structure definition
  *
-- 
2.39.5


