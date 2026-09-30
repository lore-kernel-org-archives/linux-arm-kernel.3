Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62098CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 06:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/NeYmdJ9DLWi0nB5q4MMl7kogj1vleZPCWQmaUkAF54=; b=wlzH9Cppk05iZ8MMNAYIOp09Hp
	TgApOEnPPr8HKDnnsARA5KgpvV2DiUAT18YODeYMTqEWbj6lNcLHu5wd2PNrlqf/FWvLFBhNmkuOs
	+TKnlg0uPvXIfoeWKwHcZCWFxrmgUE0memAFCopJckK7RwAM2AwhzfJxu/UQklDTDLVBCw6dthxUD
	yIyUyyLGS9q9KZb/bSFeZv9EvEX2SK6xkr5AkxkvkNOz5+vERfzYKbbs6khQvhRE1uhLRhepDg60Y
	ZTzkHtuiIys1EKuyNS2sh5V6IZVTiHJG4Tnv/EKifrgNpVuSv7mcL/ScMhKESMIHYAmfzJa4axSDR
	kQ+rVcaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnet-0000000586X-3yKC;
	Wed, 30 Sep 2026 06:19:16 +0000
Received: from [64.106.246.77] (helo=mailsc.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBner-0000000585h-24eZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 06:19:14 +0000
Received: from [127.0.1.1] (10.18.11.116) by mailsc.amlogic.com (10.8.11.35)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 29 Sep
 2026 23:14:06 -0700
From: Chongchong Ding <chongchong.ding@amlogic.com>
Date: Wed, 30 Sep 2026 14:13:49 +0800
Subject: [PATCH] ARM: hibernate: flush TLB after switching to idmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-hibernate-tlb-flush-v1-1-a0143c144c19@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAJyovGoC/yXMQQqDMBBA0avIrDtgpkTaXkW6MHFipkgqmVgK4
 t2b6vIt/t9AOQsrPJoNMn9E5Z0qzKUBH4c0McpYDdRS197phlEc5zQUxjI7DPOqEQN54+3V2I4
 s1HLJHOR7XPvnaV3di335r2DffwloWe93AAAA
X-Change-ID: 20260928-hibernate-tlb-flush-f2c1c5315625
To: Russell King <linux@armlinux.org.uk>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, Linus Walleij <linusw@kernel.org>, "Florian
 Fainelli" <f.fainelli@gmail.com>, Chongchong Ding
	<chongchong.ding@amlogic.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790748845; l=2140;
 i=chongchong.ding@amlogic.com; s=20260930; h=from:subject:message-id;
 bh=xRm3gEACpNR+yLo44YiEitOwVR6sFn5jhprGz3gHx2w=;
 b=mVY4hSIXxmwZwPg1yYsJdj/VEZwtR3MM2B3k+7Jzwm7JwFJD3phlpkbnh86VDwpuXiaeDS50v
 T0h+6xd+Eb5D0l9QU25+thhxHo+V9YPBWgZ+2HLVOF7qkFU8pVLibIJ
X-Developer-Key: i=chongchong.ding@amlogic.com; a=ed25519;
 pk=x1D2PG3lUVeB9gT9LLK2qTEJMxyeSY7/nexaR/wvK6o=
X-Originating-IP: [10.18.11.116]
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_231913_527380_2B50C0D9 
X-CRM114-Status: GOOD (  13.35  )
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

On 32-bit ARM, hibernate switches to the identity mapping to copy pages.
The idmap keeps an early RW snapshot of kernel mappings, so
STRICT_KERNEL_RWX text/rodata can be written during restore.

cpu_switch_mm() does not drop the global TLB entries from swapper.
copy_page() can therefore still hit the old RO translations and fail to
restore kernel RO sections.

Flush the local BTB and TLB after installing the idmap, matching
setup_mm_for_reboot() and the cpu_suspend() resume path.

Signed-off-by: Chongchong Ding <chongchong.ding@amlogic.com>
---
arch/arm/kernel/hibernate.c is only compiled when CONFIG_HIBERNATION is
enabled, and none of the 32-bit ARM defconfigs enable it, so the ARM
hibernation code has never been covered by the regular build tests.  This
bug was found while enabling the option for build coverage.
---
 arch/arm/kernel/hibernate.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/kernel/hibernate.c b/arch/arm/kernel/hibernate.c
index 231a76af09a0..1c7c1cb6dade 100644
--- a/arch/arm/kernel/hibernate.c
+++ b/arch/arm/kernel/hibernate.c
@@ -21,6 +21,7 @@
 #include <asm/suspend.h>
 #include <asm/page.h>
 #include <asm/sections.h>
+#include <asm/tlbflush.h>
 #include <asm/uaccess.h>
 #include "reboot.h"
 
@@ -93,6 +94,17 @@ static void notrace arch_restore_image(void *unused)
 	if (IS_ENABLED(CONFIG_CPU_TTBR0_PAN))
 		uaccess_save_and_enable();
 	cpu_switch_mm(idmap_pgd, &init_mm);
+	local_flush_bp_all();
+
+#ifdef CONFIG_CPU_HAS_ASID
+	/*
+	 * The identity mapping has no clean ASID and may clash with entries
+	 * left behind by the previous page tables.  Without this flush,
+	 * copy_page() can translate through the stale read-only kernel
+	 * mappings instead of the writable aliases in the idmap.
+	 */
+	local_flush_tlb_all();
+#endif
 	for (pbe = restore_pblist; pbe; pbe = pbe->next)
 		copy_page(pbe->orig_address, pbe->address);
 

---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20260928-hibernate-tlb-flush-f2c1c5315625

Best regards,
--  
Chongchong Ding <chongchong.ding@amlogic.com>


