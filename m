Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAD0CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDalP+fAD9h4amarteHVv5NV0txtylfgkFfIHGkc0CU=; b=uFwDl9e5uztT8y29ASItMmtoB5
	BQoFKGcxPUDu4FX9xH5JzpHcdqMQCFaqm0bftgq4gAMxDWpEZ5B1KKSJCu3neGBZknaTV2VeMn9Bu
	eJM+WvuPAGBjlvEBUlhC30cH2MPkbk1ba/kqBxQTVrK2BIvxhi8g6kY9RLwlxyvkJ8CL0xzmHaMpp
	wcCv1Ubd5noA5S+li1zgrVNqq7swQ07LCubpR3qpxBUfrop4KDainJmUCEn9/FOia4LFsPthrmXUf
	93qDPe3vgV0wwayZzesIP9qv8xUiEFP556RwqDNA9vxK71nQm+CVg7HOxLurDcb485gMly82wcMmE
	u076MmRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFe-0000000CC97-2zMS;
	Fri, 02 Oct 2026 17:40:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFN-0000000CBd0-1Zq9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 814132F;
	Fri,  2 Oct 2026 10:40:33 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E6E43F85F;
	Fri,  2 Oct 2026 10:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962836; bh=LUmnIPted8ZDVgexFP2/PhlwwggERnA/NJ+z/5vkB7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MpuPaejC+q5BrmhibOpQwIC5mQ6M1gBofUGhCg1I57DLa50TBJ+CBHFdGYVnfeZJf
	 yhueYDeQFqQWU1hRBCHIR5X/Bx/LjRq2ahAVFueqPBXq80k0RJGazyPHSDgb64go5e
	 r7z6cPnujzfwSTjf0TrEKVjqzG4rFfSpXTaf+BEg=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gavin Shan <gshan@redhat.com>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 26/27] arm_mpam: change MPAM-Fb error IRQ to use a threaded IRQ handler
Date: Fri,  2 Oct 2026 18:39:39 +0100
Message-ID: <20261002173941.292319-27-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104037_523983_B9E52327 
X-CRM114-Status: GOOD (  26.39  )
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

From: Andre Przywara <andre.przywara@arm.com>

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
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 77 ++++++++++++++++++++++++++++------
 1 file changed, 65 insertions(+), 12 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 89706106e890..95caa151b27a 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2767,24 +2767,42 @@ static char *mpam_errcode_names[16] = {
 	[12 ... 15] = "Reserved"
 };
 
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
@@ -2795,16 +2813,24 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
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
@@ -2819,10 +2845,30 @@ static irqreturn_t mpam_ppi_handler(int irq, void *dev_id)
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
 
@@ -2843,6 +2889,11 @@ static int mpam_register_irqs(void)
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
@@ -2854,9 +2905,11 @@ static int mpam_register_irqs(void)
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
2.53.0


