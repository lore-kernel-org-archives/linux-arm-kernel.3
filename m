Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B544DCA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzOEbNfjD3OpqFZFEVxnhgWiMymsFPxW/9SXAAccjko=; b=GbkGjtHFwOjlygKvDFUIYoH/xo
	M3sjveWehiJXTfZIJk8H1zt3ggIAEUJmb1TPMcWjCKvUtl+lKo4tIeXPxoWuHBzvmvx9DLch93tjq
	j797ASZw0dFNG4RzgSqbAzvWPRwhkRZju86GrdEwMpHpKkPlWENlulzj8Lv4eXqj8ZBNm6FjO/GvY
	JR8+uMHmYER1MGp7vhwI6Rm/82ESz00dfx20X/AmutzGZ06nr97zppo2h+i8qjSmPw2NxWGDyawnp
	WZgdTmtssdLy5FEccBdEEGUaFsxzb0U/OZrfufLP0rsu2dgGUVyq4M8S7oiDp5nwAI4kEKsLkQAAa
	zwejRT5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmV-00000002G6T-146M;
	Tue, 29 Sep 2026 03:45:27 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmR-00000002G4t-16VW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:45:24 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc795ad1f5aso1901240a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653522; x=1791258322; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzOEbNfjD3OpqFZFEVxnhgWiMymsFPxW/9SXAAccjko=;
        b=bMJSU1tFkZEytbMfQlCHKXiQD5ntqNip3Ll56IhX+hosb+5eNxAyM/ElzL/b/qm2fJ
         f/qpJvzMcrKZGU90mC1VZIP2cM1jJ/BIkqthdwlVjPCIHchU9NL0ebiReNpZ60V21j5f
         UfFWhYUjvUoY5n5U6dgNqMzF/ncWC4GRwR2NB7t/wz1rVNcbviG3eYwwYn/EZ165ucmh
         DdzmuX+iPcVWDcuKGCESiIjQOfwvONtWEI9eWi5LjuxQgEc8fvYXjiYDSf9iac36CB7f
         lh6WYSMf8qh8QVNB0VFvUPIHBSxwvrkjH21uAdV6nJZqdJ3L/YipeCV+BYGqvN2B2qXP
         6/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653522; x=1791258322;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzOEbNfjD3OpqFZFEVxnhgWiMymsFPxW/9SXAAccjko=;
        b=OkUyR3wLUS47BcbUKxYxJImhQN6sliF7k80B61eGFfj5YikxOyyjgLhX32RzhoYaku
         V5yvUD5GHIxtAQl3gt+K8+weF20e1CfEcjaEtnPKzn5+VFrU9Wlri609BdrTqUICapdz
         +2O9s+xHdlabgk8kFM7gjdSviehC40ltiekfBN38CNbs+pZO0OfBoOPTSBmXfBCS35p/
         de5JQHXl7jEx1jOwNZLRoHGb5u/b08GpqEmOwTtE2uoqCh3f1QNeG5GYRYrdborkLvlU
         6e0I6kzBceOaY1dDbWyOqZPQiBVYhdzrLAzgyeC9R0z4Vf993uJ9v8/t1PR1EKBTCV0Z
         3DmA==
X-Forwarded-Encrypted: i=1; AKwUvBxrv4vmEae2iXMGGGaI1IGJgtuk0DkZcoMp3fR74t8gjaBEmaiGhsfQAatzIq1JWRou7M39QvRuHrmY2bZQIB4/@lists.infradead.org
X-Gm-Message-State: AFuF++mHme0nqH60jFOdmJshuEsO4+7m3liHJu13OHsTnJID42uoELei
	5lnyDGYolup5L4jX+74p+sCSHbvMcpgqGKn+v2/C1ybC9JIMMZPl2rJ6SzthtGNNeHN+xulGd1b
	SAw==
X-Received: from pgnn16.prod.google.com ([2002:a05:6a02:4f10:b0:cc4:ac4b:d736])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:820c:b0:3da:b089:dba4
 with SMTP id adf61e73a8af0-3de0e6f1564mr15182146637.2.1790653521605; Mon, 28
 Sep 2026 20:45:21 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:44:57 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-4-praan@google.com>
Subject: [PATCH v11 03/16] iommu/arm-smmu-v3: Add arm_smmu_drain_queue() helper
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_204523_320337_58374778 
X-CRM114-Status: GOOD (  23.88  )
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

From: Nicolin Chen <nicolinc@nvidia.com>

Add a counting-based arm_smmu_drain_queue() helper, to replace queue
specific polling loops. Its until_empty mode serves the suspend and
runtime PM routines that would drain the CMDQ. Any timed-out drain fires
a WARN_ON as well, since reaching the timeout would take some stuck
consumer in any realistic case.

The existing queue_poll() API is not reusable for such a drain: it is the
atomic busy-wait for the command issuing paths, and it assumes a hardware
consumer making progress. A drain caller is sleepable, in contrast, while
the EVTQ/PRIQ consumer is a threaded IRQ handler that needs the CPU: such
a busy wait would starve the handler throughout an entire timeout, whenever
the waiter and the handler shared one CPU on a non-preemptible kernel. So,
this new sleeping helper is marked with a might_sleep() as well, given that
an atomic-context misuse would otherwise hide behind an empty queue.

Note that a drained event is dequeued, but not necessarily handled, since
queue_remove_raw() moves the MMIO CONS before the threaded IRQ handler gets
to push the event onto the IOPF workqueue. A subsequent change will invoke
synchronize_irq() and iopf_queue_flush_dev() to close that gap, and it will
act on the errno of a timed-out drain too.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 81 +++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 06b7de2e6e4b..84b56849f6dc 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -948,6 +948,87 @@ static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
 					   cmds->num, true);
 }
 
+/**
+ * arm_smmu_drain_queue - Drain an SMMU queue
+ * @smmu: the SMMU device
+ * @q: the queue to drain
+ * @until_empty: target selection
+ *
+ * With @until_empty == true (for CMDQ), exit once the queue is observed empty:
+ *
+ *   cons0                cons                                prod
+ *     |                   |                                   |
+ *  ---+###################+=====================+=============+--->
+ *                         |<--------- undrained==0? --------->|
+ *
+ * With @until_empty == false (for EVTQ/PRIQ), exit once "drained" reaches its
+ * target: "pending" (i.e. prod0 - cons0, frozen at the entry time):
+ *
+ *   cons0                cons                 prod0         (prod)
+ *     |<---- drained ---->|                     |             |
+ *  ---+###################+=====================+=============+--->
+ *     |<--------------- pending --------------->|
+ *
+ * Note that a drained entry is dequeued, but not necessarily handled: the
+ * EVTQ/PRIQ callers must follow up with a synchronize_irq() to wait for the
+ * threaded IRQ handler to finish handling the dequeued entries.
+ *
+ * Context: Process context; may sleep.
+ * Return: 0 on success or a negative errno on timeout.
+ */
+static int __maybe_unused arm_smmu_drain_queue(struct arm_smmu_device *smmu,
+					       struct arm_smmu_queue *q,
+					       bool until_empty)
+{
+	ktime_t timeout = ktime_add_us(ktime_get(), ARM_SMMU_POLL_TIMEOUT_US);
+	u32 cons, prod, prev, undrained;
+	u32 drained = 0, pending;
+
+	might_sleep();
+
+	cons = readl_relaxed(q->cons_reg);
+	prod = readl_relaxed(q->prod_reg);
+	/* The exit target: the number of entries in the queue at entry */
+	pending = Q_POS(&q->llq, prod - cons);
+
+	while (true) {
+		/* Accumulate the entries consumed since the last poll */
+		prev = cons;
+		cons = readl_relaxed(q->cons_reg);
+		drained += Q_POS(&q->llq, cons - prev);
+
+		prod = readl_relaxed(q->prod_reg);
+		undrained = Q_POS(&q->llq, prod - cons);
+
+		/* Exit on an empty queue, regardless of until_empty */
+		if (!undrained)
+			return 0;
+
+		/* Snapshot mode: exit once the pending entries are drained */
+		if (!until_empty && drained >= pending)
+			return 0;
+
+		/*
+		 * A timeout means the consumer might be stuck. In theory, if it
+		 * moves 2 * qsize entries or more within a single poll interval
+		 * Q_POS() would wrap and undercount drained: that could trigger
+		 * a spurious warning too, if the queue was never once observed
+		 * empty. Yet, that much consumption in such a short interval is
+		 * unrealistic. WARN it only, as a stuck consumer is a real bug.
+		 */
+		if (WARN_ON(ktime_compare(ktime_get(), timeout) > 0))
+			break;
+
+		/* The consumer might be a threaded IRQ handler. Yield to it */
+		usleep_range(100, 200);
+	}
+
+	dev_warn_ratelimited(smmu->dev,
+			     "queue drain timed out at prod=0x%x cons=0x%x\n",
+			     prod, cons);
+	return -ETIMEDOUT;
+}
+
 static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
 				   struct iommu_page_response *resp)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


