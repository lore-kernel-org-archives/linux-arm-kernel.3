Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9521CCD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 00:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SwombL42fwLbyLRhzffBkVyW0bjPqU4rRly1m0/qHfs=; b=F1AGIDQRTHCGmudRI3jHkfs2/S
	8UADKgysDY0EHIN0YPCFJ4O2uX4dcZ22eBoFFXZs6iVGp/hO7Y+QSa5csjt521OwMo4Azo9r65isK
	Htu+rcg6kWyaxRLxLN8n+1sQxbJ3T5EeW58k82kpFdx3yLo0S4JZEMBIgc399mEfxsurjQeYN4pK8
	OV5UI1ic0Mr7b8z9v6p/FO7PTa/ZYrDwcHGRPvP7GYs70s7YyF0mhfUKRaWUp22RAIJE1uPcztABt
	6Yw1RKj5a9uJCenkKmdMA+2s2NivTpD2bzlpd/Of2zO1b2TqH/cMhhbUfYG8KBpo2PirrSu+ZOglk
	MgLcvrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZv6-0000000CHbW-1vTt;
	Sat, 23 May 2026 00:08:48 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZv2-0000000CHao-0ub9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 00:08:46 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 61C02C010AFE;
	Fri, 22 May 2026 17:08:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 61C02C010AFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1779494920;
	bh=2sJbe5aNcbDbTxr/zYWLUir+Mj6TearfTKYTm7ulyIo=;
	h=From:To:Cc:Subject:Date:From;
	b=tr0ctYZduMOKejbygefyQ6ZXs0WgoS9plo0ZiZZqiG2AGg9PDyVmMDrk/WF8PQdkr
	 po0+bbf1Wh7jRd5QmREv6l3hasyrys8TPA2r5xqPoGRs6woe22ONNdipwtf+QXQv1N
	 C3uFBONXLrgpLDooCHJhnoqeGgkSrJmu2ZjGTTcY=
Received: from stbirv-lnx-1.igp.broadcom.net (stbirv-lnx-1.igp.broadcom.net [10.67.48.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 431A7A83;
	Fri, 22 May 2026 17:08:40 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: mm: fix kexec and hibernation with CONFIG_CPU_TTBR0_PAN
Date: Fri, 22 May 2026 17:08:37 -0700
Message-Id: <20260523000839.430550-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_170844_419545_5A115728 
X-CRM114-Status: GOOD (  19.54  )
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

Commit 7af5b901e847 ("ARM: 9358/2: Implement PAN for LPAE by TTBR0
page table walks disablement") implemented PAN for LPAE kernels by
setting TTBCR.EPD0 on every kernel entry, disabling TTBR0 page-table
walks while running in kernel mode. The commit correctly updated
cpu_suspend() in arch/arm/kernel/suspend.c, but missed two other code
paths that switch the CPU to the identity mapping before jumping to
low-PA (TTBR0-range) physical addresses:

1. setup_mm_for_reboot() in arch/arm/mm/idmap.c, used by the kexec
   reboot path. With TTBCR.EPD0 still set, the subsequent branch to
   the identity-mapped cpu_v7_reset causes a PrefetchAbort because the
   TTBR0 page-table walk needed to resolve the identity-mapped address
   is disabled. This manifests as a hard hang or "bad PC value" panic
   on LPAE kernels booted on CPUs that strictly enforce EPD0 for
   instruction fetch (e.g. Cortex-A53 in AArch32 mode) while the same
   image may accidentally work on Cortex-A15 due to microarchitectural
   differences in EPD0 enforcement.

2. arch_restore_image() in arch/arm/kernel/hibernate.c, which calls
   cpu_switch_mm(idmap_pgd, &init_mm) directly without going through
   setup_mm_for_reboot(), leaving TTBCR.EPD0 set while the identity
   mapping is active.

Fix both sites by calling uaccess_save_and_enable() before switching
to the identity mapping, mirroring what the original commit did for
cpu_suspend().

Fixes: 7af5b901e847 ("ARM: 9358/2: Implement PAN for LPAE by TTBR0 page table walks disablement")
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Assisted-by: Cursor:claude-sonnet-4.6
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/kernel/hibernate.c | 10 ++++++++++
 arch/arm/mm/idmap.c         | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm/kernel/hibernate.c b/arch/arm/kernel/hibernate.c
index 38a90a3d12b2..231a76af09a0 100644
--- a/arch/arm/kernel/hibernate.c
+++ b/arch/arm/kernel/hibernate.c
@@ -21,6 +21,7 @@
 #include <asm/suspend.h>
 #include <asm/page.h>
 #include <asm/sections.h>
+#include <asm/uaccess.h>
 #include "reboot.h"
 
 int pfn_is_nosave(unsigned long pfn)
@@ -82,6 +83,15 @@ static void notrace arch_restore_image(void *unused)
 {
 	struct pbe *pbe;
 
+	/*
+	 * With CONFIG_CPU_TTBR0_PAN enabled, TTBCR.EPD0 is set to block
+	 * TTBR0 page-table walks.  The identity mapping used here lives at
+	 * low (user-space) virtual addresses and is only reachable via
+	 * TTBR0, so re-enable those walks before switching page tables.
+	 * On non-PAN kernels this is a no-op.
+	 */
+	if (IS_ENABLED(CONFIG_CPU_TTBR0_PAN))
+		uaccess_save_and_enable();
 	cpu_switch_mm(idmap_pgd, &init_mm);
 	for (pbe = restore_pblist; pbe; pbe = pbe->next)
 		copy_page(pbe->orig_address, pbe->address);
diff --git a/arch/arm/mm/idmap.c b/arch/arm/mm/idmap.c
index 4a833e89782a..70403e968d2a 100644
--- a/arch/arm/mm/idmap.c
+++ b/arch/arm/mm/idmap.c
@@ -11,6 +11,7 @@
 #include <asm/pgalloc.h>
 #include <asm/sections.h>
 #include <asm/system_info.h>
+#include <asm/uaccess.h>
 
 /*
  * Note: accesses outside of the kernel image and the identity map area
@@ -133,6 +134,17 @@ early_initcall(init_static_idmap);
  */
 void setup_mm_for_reboot(void)
 {
+	/*
+	 * With CONFIG_CPU_TTBR0_PAN enabled, TTBCR.EPD0 is set whenever
+	 * user-space access is disabled in order to block TTBR0 page-table
+	 * walks.  The identity mapping lives at low (user-space) virtual
+	 * addresses and can only be reached via TTBR0, so we must re-enable
+	 * those walks before switching page tables.  On non-PAN kernels this
+	 * is a no-op.
+	 */
+	if (IS_ENABLED(CONFIG_CPU_TTBR0_PAN))
+		uaccess_save_and_enable();
+
 	/* Switch to the identity mapping. */
 	cpu_switch_mm(idmap_pgd, &init_mm);
 	local_flush_bp_all();
-- 
2.34.1


