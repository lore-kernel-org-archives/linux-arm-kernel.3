Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DDFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pjAUg26X+WBfhEBSOKH4NkkOJBQfkRXiPEQCNAeTRY=; b=hkotL9eQ3iFL5TlM1+tIHz9hYh
	e+5EAnfTxIF85ZGZ8VllLpk1GYTxCZIwBrnIIfDjQrqZ6XsR215JI1QM9ivnjCaROsGGSBWKlkCBI
	ngrlBKuKcVzHmSP2NreQ0A+USZ/wbkYf/9pqP67HEp06KXNV/2NDRk+0uwAc/IEYk+jmoqlqFJPGi
	HzlJWQqrKFHvVbrMMw4p3gglzHRWKkRUw9KYJmQHJpm1WGfdxTC7kchzusSY3Kfcp7JZoQv0u0bMR
	TTgaOCT29KewCkC7yWdqqQq1VxOI8LAu9Idfa6Ys7lGTQzN1jlsUS2CgouCOaQlrf0T2RqAIoBY6p
	huoXY8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndx-00000002KgA-3qSx;
	Thu, 09 Jul 2026 12:14:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndu-00000002Kan-0Z4l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF2C81476;
	Thu,  9 Jul 2026 05:14:08 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3662B3F66F;
	Thu,  9 Jul 2026 05:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599253; bh=TFOMbZd+yQrGqZx+v5w9RuQ66KzD/+IRCgRWXVfC3t0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FO9vC6Vnkgizu6oOO7DP1TBuTXbdGngLaP5zNBKLMF/9d7EEo+L6XQfhVd91iDncl
	 V3Y6Gm4EKSTwRhq5z1QAjnTEsocKUmjoE+2Ps0wCNxS9M3T6R5kLrdVY2rpnhA5rpe
	 7FNoGReSOko0eQ6Nxb8BBOb9iBDkoiYKMN10x1xo=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com
Subject: [RFC PATCH 13/36] arm64: process: Use helper to check exception state
Date: Thu,  9 Jul 2026 13:13:10 +0100
Message-Id: <20260709121333.23507-14-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051414_225725_9D3C4703 
X-CRM114-Status: UNSURE (   9.81  )
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

debug_switch_state() explicitly checks the hardware exception state
for both the pseudo-NMI and non-NMI paths. The expected state matches
the NOIRQ_CONTEXT exception context introduced alongside the exception
masking helpers and state checkers.

Use the helper instead of open-coding these checks.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/kernel/process.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 033643cd4e5e..ddda8d7aee24 100644
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
@@ -738,25 +739,7 @@ void update_sctlr_el1(u64 sctlr)
 
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


