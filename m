Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE288FEEF41
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXgLqNNy8u91cvDvwkXMCYzIufvrARwEa2wEGhb6uac=; b=NitHcE+WjLy9Db
	PRXsAA2KQOgQAxJZRz/JBWkb7RgCOdIIIlBRSETIAL+/uD/1yYxhAK/JNcVvq5Hu6OvqqbzT562im
	T4qEfV0BxBsj7Sq8GXyYj+VgPFg9OsMcEO4HcZIgJ2B1Wt21lGjkisXy+wMh0LSRIqhY36u6YzFbp
	TMJGkWoevJ2J2K3VskQirTgl1MLot42UxlCxZwuPBFqRwW0VoOccDdOF4c897gHxTYJkcQeulp1/4
	hpPA3sQhibONuTJBpzKmi3HJQVJXc9gLxgTuKqZIbPlyuY0pBIbtQ0oHQhXCDe6yhLuf+Q6IdMn7C
	TvLnR7FUgj6qP9+S5rag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6Kd-00000006Vdv-0jam;
	Tue, 07 Apr 2026 13:19:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6Ka-00000006Vc3-3dBt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:19:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD79D1BB2;
	Tue,  7 Apr 2026 06:18:54 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 88BBA3F7D8;
	Tue,  7 Apr 2026 06:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775567940; bh=IyTqocNhQbVO47j3rlqKeekBesuxoAkVgsNZyMigNLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pCEi4gQ3nYGEvolTIcNKqrTlxR2q65E9GRSNuHbNRH4Gqj6fzxfvq5RbbOrOolA2q
	 Et9UYSGZ+rdg8FKv5nHIZQJOnl8w6513BlXuO6BQoIqrNJ+Rsqo9sswWFDc81f5uhk
	 gu6PLCqgsB6sXUvYTAuzCLof2iEEBdKgTmcF/coU=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 10/10] arm64: Check DAIF (and PMR) at task-switch time
Date: Tue,  7 Apr 2026 14:16:50 +0100
Message-Id: <20260407131650.3813777-11-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260407131650.3813777-1-mark.rutland@arm.com>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_061900_940357_9E6C77E3 
X-CRM114-Status: GOOD (  12.72  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

When __switch_to() switches from a 'prev' task to a 'next' task, various
pieces of CPU state are expected to have specific values, such that
these do not need to be saved/restored. If any of these hold an
unexpected value when switching away from the prev task, they could lead
to surprising behaviour in the context of the next task, and it would be
difficult to determine where they were configured to their unexpected
value.

Add some checks for DAIF and PMR at task-switch time so that we can
detect such issues.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/process.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 489554931231e..ba9038434d2fb 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -699,6 +699,29 @@ void update_sctlr_el1(u64 sctlr)
 	isb();
 }
 
+static inline void debug_switch_state(void)
+{
+	if (system_uses_irq_prio_masking()) {
+		unsigned long daif_expected = 0;
+		unsigned long daif_actual = read_sysreg(daif);
+		unsigned long pmr_expected = GIC_PRIO_IRQOFF;
+		unsigned long pmr_actual = read_sysreg_s(SYS_ICC_PMR_EL1);
+
+		WARN_ONCE(daif_actual != daif_expected ||
+			  pmr_actual != pmr_expected,
+			  "Unexpected DAIF + PMR: 0x%lx + 0x%lx (expected 0x%lx + 0x%lx)\n",
+			  daif_actual, pmr_actual,
+			  daif_expected, pmr_expected);
+	} else {
+		unsigned long daif_expected = DAIF_PROCCTX_NOIRQ;
+		unsigned long daif_actual = read_sysreg(daif);
+
+		WARN_ONCE(daif_actual != daif_expected,
+			  "Unexpected DAIF value: 0x%lx (expected 0x%lx)\n",
+			  daif_actual, daif_expected);
+	}
+}
+
 /*
  * Thread switching.
  */
@@ -708,6 +731,8 @@ struct task_struct *__switch_to(struct task_struct *prev,
 {
 	struct task_struct *last;
 
+	debug_switch_state();
+
 	fpsimd_thread_switch(next);
 	tls_thread_switch(next);
 	hw_breakpoint_thread_switch(next);
-- 
2.30.2


