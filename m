Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35F6CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 03:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8puwOoLD87XowANRHNZLv+HGgvf6chJeML29i5kTFE=; b=gBrJfqBZooUyn9CNcxQ6znQ5vD
	AX6snlDtTyGooGBlD+kHXNbTN5pi9u5A+lNwlQxhF5OTAFgUcNXG3ONgjrzTw5r4tcMFH2D9VTOP3
	SwLGk1D98d2RTmHqD71qA0D6XkRlI0tgKkheZPYKyobetwr13IDCcQlsO1LL/Bq4pNa3urX/cxDjj
	cmydYseZpDxux/hN/fBaIBuntX+Mvt9kcbqfNy9KA6yvlz6MZRJSQspS4HsvbQSePKw9xYQjnyeyf
	6d39AvYVrmkoqghU/I49q2I4HwUtPIWlGqNTTcRsg/4v2u2zrEsiQwi4h1zpiHIWQzWQ5zmPizQ7/
	DVKRqfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uml49-00000001I2U-1h1N;
	Fri, 15 Aug 2025 03:25:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkmc-00000001Fh4-2g4c
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 Aug 2025 03:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Y8puwOoLD87XowANRHNZLv+HGgvf6chJeML29i5kTFE=; b=PEMPl9fMCcbEvM41H85N3Gmjls
	RhmUS+UEHd7tZUxIzx4XZVSoSJpakPOW1AS3/zThrEHdsBqOdqYu8kNe0Q+KCEfYzJAGq26ea0TcP
	gQtUWV0qOcnWajfGuAncUtqmWX4NNnSFaGIUxpAOAUui/JU9TSNyZoWKahWgd7rM8NC7s9e/Aw2PZ
	meKqMQIExc+7R/aDNaSskLgm2HpWhAHTiGjyLz3188eIec+kSyioDuMw4STpQ7AYERDBDEUj74spd
	QyhYio+eATHz8Dl42SdkpGEFJL0OJcb7NrWCf/iORb9H4VSfHcoqiuMOSjeLO+lNPRMSr3MsQFQ71
	3OVJ7S0g==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkmY-0000000GbS4-1ohT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 03:07:09 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c36TM0qYmzvX7B;
	Fri, 15 Aug 2025 11:06:47 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 403C41402D0;
	Fri, 15 Aug 2025 11:06:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 15 Aug
 2025 11:06:46 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <mark.rutland@arm.com>, <ada.coupriediaz@arm.com>,
	<mbenes@suse.cz>, <broonie@kernel.org>, <anshuman.khandual@arm.com>,
	<ryan.roberts@arm.com>, <chenl311@chinatelecom.cn>, <liaochang1@huawei.com>,
	<kristina.martsenko@arm.com>, <leitao@debian.org>, <ardb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8 3/8] arm64: entry: Rework arm64_preempt_schedule_irq()
Date: Fri, 15 Aug 2025 11:06:28 +0800
Message-ID: <20250815030633.448613-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815030633.448613-1-ruanjinjie@huawei.com>
References: <20250815030633.448613-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_040707_482872_F937C216 
X-CRM114-Status: GOOD (  12.79  )
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

The generic entry code has the form:

| raw_irqentry_exit_cond_resched()
| {
| 	if (!preempt_count()) {
| 		...
| 		if (need_resched())
| 			preempt_schedule_irq();
| 	}
| }

In preparation for moving arm64 over to the generic entry code, align
the structure of the arm64 code with raw_irqentry_exit_cond_resched() from
the generic entry code.

Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/entry-common.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 93c95fc51cc0..dd7903f371ad 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -294,10 +294,10 @@ DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
 #define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
 #endif
 
-static void __sched arm64_preempt_schedule_irq(void)
+static inline bool arm64_preempt_schedule_irq(void)
 {
 	if (!need_irq_preemption())
-		return;
+		return false;
 
 	/*
 	 * Note: thread_info::preempt_count includes both thread_info::count
@@ -305,7 +305,7 @@ static void __sched arm64_preempt_schedule_irq(void)
 	 * preempt_count().
 	 */
 	if (READ_ONCE(current_thread_info()->preempt_count) != 0)
-		return;
+		return false;
 
 	/*
 	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
@@ -314,7 +314,7 @@ static void __sched arm64_preempt_schedule_irq(void)
 	 * DAIF we must have handled an NMI, so skip preemption.
 	 */
 	if (system_uses_irq_prio_masking() && read_sysreg(daif))
-		return;
+		return false;
 
 	/*
 	 * Preempting a task from an IRQ means we leave copies of PSTATE
@@ -324,8 +324,10 @@ static void __sched arm64_preempt_schedule_irq(void)
 	 * Only allow a task to be preempted once cpufeatures have been
 	 * enabled.
 	 */
-	if (system_capabilities_finalized())
-		preempt_schedule_irq();
+	if (!system_capabilities_finalized())
+		return false;
+
+	return true;
 }
 
 static void do_interrupt_handler(struct pt_regs *regs,
@@ -699,7 +701,8 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
-	arm64_preempt_schedule_irq();
+	if (arm64_preempt_schedule_irq())
+		preempt_schedule_irq();
 
 	exit_to_kernel_mode(regs, state);
 }
-- 
2.34.1


