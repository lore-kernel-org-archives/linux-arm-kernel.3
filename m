Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C85C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z6BKOuMwvvdqwSkfr3gmp8bHDquJc6eeBT/YR4keSXo=; b=K7YfXG3qaX8sQg9xaC5rbnDLy2
	PyRPAY70S4s/8VWU289ZUnbMaWE/l4jt60ymkTF49RwyKOx7DZx/mfshX9HL8Wri+xYbXFQBRIOii
	hQr5ibrHKayHghwcNPv3bR2R7SQ4cQ9dQub/4/g18LRH4U9E4eITN1EBufa0pR14bLRl4Isv/GF0+
	3dKUslqlklndSfYXZrDlexRLJORW3Dy6/bX5BKJAcmTkz15CPNBDYROmbWbsjBaiaZc2w/IeBPnAa
	iFfoyBJPxk6O8ssvtrR3utOvZxM49pOJgOsLdJWcxv8utxryHAsMN69rX8jMmXUF+/W5uNVIipPNe
	7ViVCEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSxJ-00000007tJN-2Ao8;
	Mon, 11 Aug 2025 13:52:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSug-00000007six-1kVM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:50:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D05C361435;
	Mon, 11 Aug 2025 13:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2091CC4CEF7;
	Mon, 11 Aug 2025 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754920209;
	bh=XnHbj9QBkLJy0W+qbz9eTgXoyKBZkhMdcwnehpypp8g=;
	h=From:To:Cc:Subject:Date:From;
	b=NkFdkxxvdgOvS9b8k6rkmHTgLWsUR6rhRZkv//2qpd4fqlfLJpgfwk2YGLGm8pnmt
	 219WXyHQo8E5Nz0d+pXsffv42ZJR4eOujdM2zrfJgjbKHP6DAYLSsPM45F+XpR4BK8
	 HmMRuAVbxZnHxMBi1m0prYB7fXWaofvgwVHhyDxMK4PAKwFGylClNHolhrTywOc4SB
	 m1d6Jxj1+Bx9J58T+fR2lQ0Iu14TCEDho5ZAHw0YrLmDjDErIx3OGT1p/VIbCdeTWg
	 OfZ9YfK05uAHlqsYW4eP7wZsjb5z7AohAFUX3ZbctH60y5CE7MlpKNKCr+dSSM0sWI
	 hkKOqCzxX8v7Q==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] irqchip/gic-v5: Fix kmemleak L2 IST table entries false positives
Date: Mon, 11 Aug 2025 15:50:01 +0200
Message-ID: <20250811135001.1333684-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.48.0
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

L2 IST table entries are allocated with the kmalloc interface
and their physical addresses are programmed in the GIC (either
IST base address register or L1 IST table entries) but their
virtual addresses are not stored in any kernel data structure
because they are not needed at runtime - the L2 IST table entries
are managed through system instructions but never dereferenced
directly by the driver.

This triggers kmemleak false positive reports:

unreferenced object 0xffff00080039a000 (size 4096):
  comm "swapper/0", pid 0, jiffies 4294892296
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 0):
    kmemleak_alloc+0x34/0x40
    __kmalloc_noprof+0x320/0x464
    gicv5_irs_iste_alloc+0x1a4/0x484
    gicv5_irq_lpi_domain_alloc+0xe4/0x194
    irq_domain_alloc_irqs_parent+0x78/0xd8
    gicv5_irq_ipi_domain_alloc+0x180/0x238
    irq_domain_alloc_irqs_locked+0x238/0x7d4
    __irq_domain_alloc_irqs+0x88/0x114
    gicv5_of_init+0x284/0x37c
    of_irq_init+0x3b8/0xb18
    irqchip_init+0x18/0x40
    init_IRQ+0x104/0x164
    start_kernel+0x1a4/0x3d4
    __primary_switched+0x8c/0x94

Instruct kmemleak to ignore L2 IST table memory allocation
virtual addresses to prevent these false positive reports.

Reported-by: Jinjie Ruan <ruanjinjie@huawei.com>
Closes: https://lore.kernel.org/lkml/cc611dda-d1e4-4793-9bb2-0eaa47277584@huawei.com/
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5-irs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index ad1435a858a4..e8a576f66366 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt)	"GICv5 IRS: " fmt
 
+#include <linux/kmemleak.h>
 #include <linux/log2.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -117,6 +118,7 @@ static int __init gicv5_irs_init_ist_linear(struct gicv5_irs_chip_data *irs_data
 		kfree(ist);
 		return ret;
 	}
+	kmemleak_ignore(ist);
 
 	return 0;
 }
@@ -232,6 +234,7 @@ int gicv5_irs_iste_alloc(const u32 lpi)
 		kfree(l2ist);
 		return ret;
 	}
+	kmemleak_ignore(l2ist);
 
 	/*
 	 * Make sure we invalidate the cache line pulled before the IRS
-- 
2.48.0


