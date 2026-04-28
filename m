Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2456FF8879
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQdxFQjVWCy/XZYaSQtnKUmOMyNnhAeA9kkWuvoZABg=; b=xymkwAEy7fadi+EloydDve9gfx
	GfhrrUQgHqbsh8DYPsRjS5dMRSux9Pk1TuKURAxqyub7jXCKDqoEMvUVl6zSdreu2E4d3nbo/RYiD
	qBWIhxLyBj1vhpjU8UKJN4TOdsBGdkd+LMVSF0qjLgarhgfp0EFWaSykx4yUv4ERnRupUvlDnJuVQ
	4F3kKhcNEf6i9WaP5JxyVzlerdCsavAVovgKQQ94Mv0TP0J7aJZ+78cOJRw8Yp8T1XgcKNtTu6pl2
	hRCwm3MQdhCdTswaOF1STmvEGrwnCNO7V7AgCwQm+J97toLbHIsKykdoL6oGcYzAKPqI5eVlCH4sf
	/sdsSXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnG0-000000025J8-3Wqc;
	Tue, 28 Apr 2026 18:34:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFq-000000025DW-1BQQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2739444371;
	Tue, 28 Apr 2026 18:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCD7C2BCB3;
	Tue, 28 Apr 2026 18:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777401233;
	bh=KI+QPKXDOWz4gqqVl9tSItHxeUexJDKcaqOYZAUOUDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hqPI2aJTrZ6eFWW16hHtkiXn0B3l7o3L+Mqt61tgXMNh7DuWojwoPxJ+b3K+S/BqH
	 NSOZ08qIR0Df4ISLavIqXM9DBBDUGC/7PwQO3rPAb1WPLDzbAnQ2UmsO/ZB0B3/eaU
	 IsfvmSMFYwjHWPa3Ya4pj86jduKVpRhLc+sycdPgUPJi899dKL0102dc7CLB4ayEQU
	 avokTj658+6e6cqLHT5uO11PtrIQRriaOTC8HH8DdW7KhOB/BZnnR4D6No4kn+Dd+b
	 xkknnFt08olpLLq4yud6OsF5uVn2EQb0DfZpugOr5qo2kDxzslU/T+uJMITos/6O6T
	 aUi1w+9dDDLFw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 28 Apr 2026 19:33:27 +0100
Subject: [PATCH v2 03/11] firmware: arm_ffa: Avoid collapsing NPI work from
 different CPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-ffa_fixes-v2-3-8595ae450034@kernel.org>
References: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
In-Reply-To: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_113354_380487_1E41C013 
X-CRM114-Status: GOOD (  13.89  )
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

Notification pending interrupts are registered as per-CPU IRQs, but the
driver queues all NPI handling through a single shared work_struct.

That allows queue_work_on() calls from different CPUs to collapse onto a
single pending work item even though the work function uses the CPU it
runs on to fetch and handle per-CPU notifications.

Move notif_pcpu_work into the per-CPU ffa_pcpu_irq state and initialize
one work item per CPU. This keeps NPI handling independent per CPU and
avoids losing notifications when multiple CPUs queue work concurrently.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index e6a051b20cb7..4e66c7325a4e 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -87,6 +87,7 @@ static inline int ffa_to_linux_errno(int errno)
 
 struct ffa_pcpu_irq {
 	struct ffa_drv_info *info;
+	struct work_struct notif_pcpu_work;
 };
 
 struct ffa_drv_info {
@@ -106,7 +107,6 @@ struct ffa_drv_info {
 	unsigned int cpuhp_state;
 	struct ffa_pcpu_irq __percpu *irq_pcpu;
 	struct workqueue_struct *notif_pcpu_wq;
-	struct work_struct notif_pcpu_work;
 	struct work_struct sched_recv_irq_work;
 	struct xarray partition_info;
 	DECLARE_HASHTABLE(notifier_hash, ilog2(FFA_MAX_NOTIFICATIONS));
@@ -1539,8 +1539,9 @@ ffa_self_notif_handle(u16 vcpu, bool is_per_vcpu, void *cb_data)
 
 static void notif_pcpu_irq_work_fn(struct work_struct *work)
 {
-	struct ffa_drv_info *info = container_of(work, struct ffa_drv_info,
+	struct ffa_pcpu_irq *pcpu = container_of(work, struct ffa_pcpu_irq,
 						 notif_pcpu_work);
+	struct ffa_drv_info *info = pcpu->info;
 
 	ffa_self_notif_handle(smp_processor_id(), true, info);
 }
@@ -1811,7 +1812,7 @@ static irqreturn_t notif_pend_irq_handler(int irq, void *irq_data)
 	struct ffa_drv_info *info = pcpu->info;
 
 	queue_work_on(smp_processor_id(), info->notif_pcpu_wq,
-		      &info->notif_pcpu_work);
+		      &pcpu->notif_pcpu_work);
 
 	return IRQ_HANDLED;
 }
@@ -1928,8 +1929,11 @@ static int ffa_init_pcpu_irq(void)
 	if (!irq_pcpu)
 		return -ENOMEM;
 
-	for_each_present_cpu(cpu)
+	for_each_present_cpu(cpu) {
 		per_cpu_ptr(irq_pcpu, cpu)->info = drv_info;
+		INIT_WORK(&per_cpu_ptr(irq_pcpu, cpu)->notif_pcpu_work,
+			  notif_pcpu_irq_work_fn);
+	}
 
 	drv_info->irq_pcpu = irq_pcpu;
 
@@ -1958,7 +1962,6 @@ static int ffa_init_pcpu_irq(void)
 	}
 
 	INIT_WORK(&drv_info->sched_recv_irq_work, ffa_sched_recv_irq_work_fn);
-	INIT_WORK(&drv_info->notif_pcpu_work, notif_pcpu_irq_work_fn);
 	drv_info->notif_pcpu_wq = create_workqueue("ffa_pcpu_irq_notification");
 	if (!drv_info->notif_pcpu_wq)
 		return -EINVAL;

-- 
2.43.0


