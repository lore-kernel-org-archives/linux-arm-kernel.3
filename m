Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8BCC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 18:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvVGHUxpmrCxxovgJeXeslMVfUgwT09swhogcdd3nYg=; b=MBEjNqUCpLZVnv
	JkpmJ2X1SjhEjwUyBNHRGrKHhuy1vTJGi1aou8unNF77mKaJLRfH1qPobMmhtbRTe3+tFFyZNRMoI
	61aoZIXcYawK09DCaqmHZgOqQQcpXTzlI6JIEmtzHWEXM+pVTcqiYwxSDM1ex/meTcmrPGevl2TQy
	Np8lj4FW1NEPcJa8Hp+6iBVeLfoev0Db608epe+AOQpnXO/VX7JUw1HaUpsFdOzv9O7sr8FdRvdAy
	49vvFTeo2qrhV5PO6L7wFIeVuuLTbcK3mRyEj9J9BQ6JLVqu1/99ly3q4Nx0a7Hxmv/nWMQeT5lSv
	m9J5ALcKbTsaeZbK2OOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXZu-0000000AIAj-0yRe;
	Mon, 12 May 2025 18:08:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXC0-0000000AFBT-4AdP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 17:43:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A86AB201B;
	Mon, 12 May 2025 10:43:45 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.32.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5B9F3F673;
	Mon, 12 May 2025 10:43:54 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 05/11] arm64: entry: Add entry and exit functions for debug exceptions
Date: Mon, 12 May 2025 18:43:20 +0100
Message-ID: <20250512174326.133905-6-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512174326.133905-1-ada.coupriediaz@arm.com>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_104357_075031_D1A43D35 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Duplicate the `debug_exception_entry()` and `debug_exception_exit()`
functions from mm/fault.c, as they are needed to split
the debug exceptions entry paths from the current unified one.
The original will be removed in a cleanup patch.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/kernel/entry-common.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index b260ddc4d3e9..92d78b329e67 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -418,6 +418,28 @@ static inline void fp_user_discard(void)
 	}
 }
 
+/*
+ * In debug exception context, we explicitly disable preemption despite
+ * having interrupts disabled.
+ * This serves two purposes: it makes it much less likely that we would
+ * accidentally schedule in exception context and it will force a warning
+ * if we somehow manage to schedule by accident.
+ */
+static void debug_exception_enter(struct pt_regs *regs)
+{
+	preempt_disable();
+
+	/* This code is a bit fragile.  Test it. */
+	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
+}
+NOKPROBE_SYMBOL(debug_exception_enter);
+
+static void debug_exception_exit(struct pt_regs *regs)
+{
+	preempt_enable_no_resched();
+}
+NOKPROBE_SYMBOL(debug_exception_exit);
+
 UNHANDLED(el1t, 64, sync)
 UNHANDLED(el1t, 64, irq)
 UNHANDLED(el1t, 64, fiq)
-- 
2.43.0


