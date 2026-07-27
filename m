Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6509C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdChf34NPygE7Q5966uC0Ds2ATGeYxfhSYCD1dwrFFk=; b=ht8RclzGO+qkCM/P56/AL/n2aT
	233huAraiTZphuJmbgx4bNdbSA1D5TGv/V6sYlx3TrZ48Wv8wy2boUJaomxj7tzm3IOItESrbQZ5K
	3rcR9kGCAiytpjC7aJk/qQyPunzbJYcVvSKInJArDWydfzLa8EwuVT495rrimFD3cIj6MnlXqmigt
	BJuAb9lG5mZwAB37U2EecewgtrNODP0QtzfVe4aCqt++8BLL6r71Ia5TkuOSWUHZzRu3hUPkWVZtf
	IkMqRFWv3QqhInSZEwteWprQgvlMl34w3uF44KeuwDXoLgIceQJ1KxYM1Mk5U8R/xXKVHLOg647C3
	QpD9ZfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIy-00000003MqW-2jH7;
	Mon, 27 Jul 2026 16:35:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIj-00000003MRO-1KPX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95C5D16F8;
	Mon, 27 Jul 2026 09:35:32 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C09CC3F86F;
	Mon, 27 Jul 2026 09:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170136; bh=enG2ED6JAWaC4z9Z7TYqQpwZ+95L2bnDYvCf+SoKcq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lo/w6qvMynVqg/8vyXBxXsyuaBHKwSjnzbZg3cG+XVr1Ql4DuYarzchKISuFy9QkL
	 WQDy4QD0zg2u5Z1yt4Wwbky3rhDweetn/8LBNAx6PMKMEmOqE3JOtqRGVY82vLpLEs
	 JOD7RMyKmHOkErhbPaMVqUPY0czrJ8lsPhYqabTQ=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 13/45] arm64: process: Use helper to check exception state
Date: Mon, 27 Jul 2026 17:34:21 +0100
Message-Id: <20260727163453.7969-14-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093537_396626_85F34E52 
X-CRM114-Status: GOOD (  10.21  )
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

debug_switch_state() explicitly checks the hardware exception state
for both the pseudo-NMI and non-NMI paths. The expected state matches
the NOIRQ_CONTEXT exception context introduced alongside the exception
masking helpers and state checkers.

Use the helper instead of open-coding these checks.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/process.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..0fd09136d398 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -51,6 +51,7 @@
 #include <asm/exec.h>
 #include <asm/fpsimd.h>
 #include <asm/gcs.h>
+#include <asm/interrupts/common_flags.h>
 #include <asm/mmu_context.h>
 #include <asm/mpam.h>
 #include <asm/mte.h>
@@ -703,25 +704,7 @@ void update_sctlr_el1(u64 sctlr)
 
 static inline void debug_switch_state(void)
 {
-	if (system_uses_irq_prio_masking()) {
-		unsigned long daif_expected = 0;
-		unsigned long daif_actual = read_sysreg(daif);
-		unsigned long pmr_expected = GIC_PRIO_IRQOFF;
-		unsigned long pmr_actual = read_sysreg_s(SYS_ICC_PMR_EL1);
-
-		WARN_ONCE(daif_actual != daif_expected ||
-			  pmr_actual != pmr_expected,
-			  "Unexpected DAIF + PMR: 0x%lx + 0x%lx (expected 0x%lx + 0x%lx)\n",
-			  daif_actual, pmr_actual,
-			  daif_expected, pmr_expected);
-	} else {
-		unsigned long daif_expected = DAIF_PROCCTX_NOIRQ;
-		unsigned long daif_actual = read_sysreg(daif);
-
-		WARN_ONCE(daif_actual != daif_expected,
-			  "Unexpected DAIF value: 0x%lx (expected 0x%lx)\n",
-			  daif_actual, daif_expected);
-	}
+	arm64_debug_exc_context(NOIRQ_CONTEXT);
 }
 
 /*
-- 
2.34.1


