Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978F5FEEF34
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0163lkTemph2oeo4EmKaW/u4riptGwnUXAjeyKGCoA=; b=4RUEbea942sYjA
	v3FjLND8sJ1jGWwJwe2vLjw5L2HgNc3yZUWNAjZetKnpFs7HpDENmac/VT5Rq/jZmX9zPRMc3Gpkk
	8qBT1mOL9yLfs13t5Rrj7cTIhEbzJOVpeHAcB3/EoFeYb9wrGGxRn8mDVUW/GTRJX4X9A2Aowgh4K
	pxoKwdb9yqDdA1po22AtPMpl/RAMq2aOM/J0shlzpoXiGJeoPQxXUl7tFA5lYPUQM7yryURD8Ml4h
	srsSLG0yG8epr/ci0NA2NSbs2iCvoqSAJWTvQjvpRgArNRyiOCFoSU7uVCWAMU12Ka0KY6T1ver6v
	evXs58d2sWe1nCYyr48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6J4-00000006UwW-0UEV;
	Tue, 07 Apr 2026 13:17:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6J1-00000006Uvy-26yf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:17:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00E8F16F2;
	Tue,  7 Apr 2026 06:17:16 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C882F3F7D8;
	Tue,  7 Apr 2026 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775567841; bh=8P9f8BbJ2TRd1Q/adLEhuGEvf+j1QF04uAmpliD5V8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=asCl5hywD4UTawl26PJNL8OISldIxFq9PKTK+1bH5O+42KMAHPQRmGq9PmlOSTGT3
	 l5NLMY76ixkydF2jxP9ZLe6a0KkH2PhzKXET29m0hudTtY1U6qWAZM+V+HbWeS2uzC
	 KAAmoGa5uhOFBY7SHg8S1+8R32XR7E3kg4x7sPMU=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH 01/10] entry: Fix stale comment for irqentry_enter()
Date: Tue,  7 Apr 2026 14:16:41 +0100
Message-Id: <20260407131650.3813777-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260407131650.3813777-1-mark.rutland@arm.com>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_061723_592023_BF89546B 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The kerneldoc comment for irqentry_enter() refers to idtentry_exit(),
which is an accidental holdover from the x86 entry code that the generic
irqentry code was based on.

Correct this to refer to irqentry_exit().

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 include/linux/irq-entry-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index d26d1b1bcbfb9..3cf4d21168ba1 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -394,7 +394,7 @@ typedef struct irqentry_state {
  * establish the proper context for NOHZ_FULL. Otherwise scheduling on exit
  * would not be possible.
  *
- * Returns: An opaque object that must be passed to idtentry_exit()
+ * Returns: An opaque object that must be passed to irqentry_exit()
  */
 irqentry_state_t noinstr irqentry_enter(struct pt_regs *regs);
 
-- 
2.30.2


