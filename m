Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BC9CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wdGzrOc2mzR/pLTHPy1l+tqOL/PpRG8HP3rdHvxnns=; b=4ExIW2vk4A/rxhXXKkpGsWFz2J
	I7pYolCYPn3dLdIM4J0ldzASIEtEL10IyU6RBmfrq+YHxo6uFH2PFxxuqEW3bgIkvhmap6sx3ZH0U
	m4a/PiSjA4L8IycJIZhI7lURDte5LEbFhh4tB4EYfc2GZu7uhFvagAZaQfLtJzzPu9lFjMoHebALJ
	6+TNGwpPJyr6u/8vrAavyB+z+NGG2xlEFWGOTQ+Ju2F1Lf/KOgdMG9yMNaPggWoF1imppxp4CkMBs
	MdU7YV6wuRcYX8jrtdWGeDUNkV3weM1U/wgLWvNH927o1Y/aEPg4rnrNePkbaD0SPwGEOLHe2sPDE
	6yGt8ilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIp3-00000009YHF-43Ux;
	Thu, 01 Oct 2026 15:35:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIov-00000009YBB-0ftS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:35:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 826DC175A;
	Thu,  1 Oct 2026 08:35:36 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49DD73F86F;
	Thu,  1 Oct 2026 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790868939; bh=mdC572ePxA6ofwYTj0zQNdzpyqFb2aD1cG2hcWQc33w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MTg2yc5pPuM9Q0+H4k783a22Pr+B4/zmaNGoF7oFK35+xcP0+mV0iiqYQiIbelXuR
	 hTBNZKEQTFZ23NRo4sGYLgwl80Ezt9FmzakgFMoqH4HdonusZ5Io+OaxaEDmDQmsuS
	 QvSpztZM9o4gOyN/N+1HV/+xMHDBm4kLM8D+4Ouk=
From: Andre Przywara <andre.przywara@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>,
	Lee Trager <lee@trager.us>,
	Ritwick Sharma <ritwick.sharma@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	linux-acpi@vger.kernel.org--cc,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 12/13] arm_mpam: change MPAM-Fb error IRQ to use a threaded IRQ handler
Date: Thu,  1 Oct 2026 17:34:37 +0200
Message-ID: <20261001153439.3295416-13-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001153439.3295416-1-andre.przywara@arm.com>
References: <20261001153439.3295416-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_083541_339220_AA023D87 
X-CRM114-Status: GOOD (  25.66  )
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

When an MPAM MSC gets into an error condition, it can trigger an error
IRQ. We cannot really do much about those errors, but we at least query
and log the error, then disable MPAM functionality.

This error report relies on reading the MSC's error status register
(ESR) in the current hard-IRQ handler, which is not possible for MPAM-Fb
based MSC accesses, since they involve mailbox routines that might sleep.
The same is true for clearing the interrupt at the source, which requires
a (potentially sleeping) MSC access as well.

Change the error IRQ handler to be a threaded interrupt, but keep the
handling in the hard-IRQ part for MMIO MSCs. This is needed since the
CPU affinity check in the MSC accessors requires a non-preemptible
context.
When the MSC is using an MPAM-Fb based access, we push the work into the
threaded part of the handler, where the accessors are allowed to sleep.
Also forbid per-CPU interrupts (PPIs) for MPAM-Fb, as we cannot use a
threaded IRQ here.

The actual IRQ handler learns how to deal with errors. We cannot really
handle them, but we can try our best to disable the IRQ anyway.
Should the level IRQ line deactivation fail on the device side, we mask
the IRQ on the irqchip level, to prevent an interrupt storm.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 77 ++++++++++++++++++++++++++++------
 1 file changed, 65 insertions(+), 12 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 63469f3b0a90a..08b1e84e3f794 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2734,24 +2734,42 @@ static int mpam_disable_msc_ecr(void *_msc)
 	return __mpam_write_reg(msc, MPAMF_ECR, 0);
 }
 
+/*
+ * This will run as the threaded IRQ handler part when using MPAM-Fb, but
+ * as the sole hard-IRQ handler for MMIO based accesses.
+ */
 static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
 {
 	u64 reg;
+	int ret;
 	u16 partid;
 	u8 errcode, pmg, ris;
 
-	if (WARN_ON_ONCE(!msc) ||
+	if (WARN_ON_ONCE(!msc))
+		return IRQ_NONE;
+
+	if (msc->iface == MPAM_IFACE_MMIO &&
 	    WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(),
 					   &msc->accessibility)))
 		return IRQ_NONE;
 
-	mpam_msc_read_esr(msc, &reg);
+	ret = mpam_msc_read_esr(msc, &reg);
+	if (ret) {
+		pr_err_ratelimited("unknown error irq from msc:%u\n", msc->id);
+
+		/* Try out best here ... */
+		goto out_disable;
+	}
 
 	errcode = FIELD_GET(MPAMF_ESR_ERRCODE, reg);
 	if (!errcode)
 		return IRQ_NONE;
 
-	/* Clear level triggered irq */
+	/*
+	 * Clear the level triggered IRQ. If that fails, we cannot do anything
+	 * about it, so ignore any errors. We will disable the IRQ either on
+	 * the device side or on the irqchip level next anyway.
+	 */
 	mpam_msc_clear_esr(msc);
 
 	partid = FIELD_GET(MPAMF_ESR_PARTID_MON, reg);
@@ -2762,16 +2780,24 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
 			   msc->id, mpam_errcode_names[errcode], partid, pmg,
 			   ris);
 
-	/* Disable this interrupt. */
-	mpam_disable_msc_ecr(msc);
+out_disable:
+	/*
+	 * Disable this interrupt on the device side. If that fails, disable
+	 * the IRQ on the irqchip level, as we must prevent further handler
+	 * invocations. We only take the interrupt once anyway, as we
+	 * are going to free the IRQ next, in mpam_disable().
+	 */
+	ret = mpam_disable_msc_ecr(msc);
+	if (ret)
+		disable_irq_nosync(irq);
 
-	/* Are we racing with the thread disabling MPAM? */
+	/* Check whether we are racing with the thread disabling MPAM. */
 	if (!mpam_is_enabled())
 		return IRQ_HANDLED;
 
 	/*
-	 * Schedule the teardown work. Don't use a threaded IRQ as we can't
-	 * unregister the interrupt from the threaded part of the handler.
+	 * Schedule the teardown work. We have to defer it as we can't
+	 * unregister the interrupt from the threaded part of a handler.
 	 */
 	mpam_disable_reason = "hardware error interrupt";
 	schedule_work(&mpam_broken_work);
@@ -2786,10 +2812,30 @@ static irqreturn_t mpam_ppi_handler(int irq, void *dev_id)
 	return __mpam_irq_handler(irq, msc);
 }
 
-static irqreturn_t mpam_spi_handler(int irq, void *dev_id)
+/*
+ * MMIO based MSC accesses must run in non-preemptible context, as they
+ * might have affinity requirements to check.
+ * MPAM-Fb based MSC accesses must NOT run in hard-IRQ context, as they
+ * can sleep.
+ * So split the IRQ handling up, depending on the MSC access type.
+ */
+static irqreturn_t mpam_shared_hard_irq(int irq, void *dev_id)
 {
 	struct mpam_msc *msc = dev_id;
 
+	if (msc->iface == MPAM_IFACE_MMIO)
+		return __mpam_irq_handler(irq, msc);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t mpam_shared_thread_irq(int irq, void *dev_id)
+{
+	struct mpam_msc *msc = dev_id;
+
+	if (msc->iface == MPAM_IFACE_MMIO)
+		return IRQ_HANDLED;
+
 	return __mpam_irq_handler(irq, msc);
 }
 
@@ -2810,6 +2856,11 @@ static int mpam_register_irqs(void)
 		/* The MPAM spec says the interrupt can be SPI, PPI or LPI */
 		/* We anticipate sharing the interrupt with other MSCs */
 		if (irq_is_percpu(irq)) {
+			if (msc->iface != MPAM_IFACE_MMIO) {
+				dev_err(&msc->pdev->dev,
+					"Only MMIO MSCs can use per-CPU interrupts\n");
+				return -EINVAL;
+			}
 			err = request_percpu_irq(irq, &mpam_ppi_handler,
 						 "mpam:msc:error",
 						 msc->error_dev_id);
@@ -2821,9 +2872,11 @@ static int mpam_register_irqs(void)
 					       &_enable_percpu_irq, &irq,
 					       true);
 		} else {
-			err = devm_request_irq(&msc->pdev->dev, irq,
-					       &mpam_spi_handler, IRQF_SHARED,
-					       "mpam:msc:error", msc);
+			err = devm_request_threaded_irq(&msc->pdev->dev, irq,
+							&mpam_shared_hard_irq,
+							&mpam_shared_thread_irq,
+							IRQF_SHARED | IRQF_ONESHOT,
+							"mpam:msc:error", msc);
 			if (err)
 				return err;
 		}
-- 
2.43.0


