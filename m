Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD89DC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVSqy39KPUEyemBjxNh59V1S2mLikoM+a25IdDBC+9o=; b=MFYgY7/iNPFuJ4emgquCPxtGAU
	yztiqu/15tXJ4Zi5RG+6iF9aZWnAaKtgMvt/R9LFZ0LzNqcF1CXuwMtwfHjOxHeFu/EZox+TVdRer
	bz0Qae+eMgUc881jIvohG7qMUhI8PBlDJsjitUkVU4OSe29fQgGGd2ZVDsY0VRg9OrynDaLdrivti
	HEh//vVFdaBNhpVFQXs8ovkHNtnatBeaqjcaJ7IxCfB6l2P9r24nK7NW7kkZs189FdM4UvIkcxbAg
	r8Z3d3Qb9LITsmq0CE/uSnjXLk2yGhRFFmc3LdSS/ooLmNSguM0dGk4nd/G2EWa5M8jq/OjCWJgiJ
	wxLSG2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4YW-000000089vm-0IDE;
	Wed, 29 Jul 2026 13:42:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Y7-000000089eW-2PfM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Jul 2026 13:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DVSqy39KPUEyemBjxNh59V1S2mLikoM+a25IdDBC+9o=; b=dBFT6CP507TRONWBf9wVWffIED
	iDMtMZoAHarFBXrrcPUFpivtcBr7g+ycK3pGOm6L8GbJY0K4wm035HDZmqZk88AAS7g6pL2sEm5/9
	Wq8yFZ1JkkUHprvdwiim1HF1HU4YO5xshFf54zxtQwvhacZ2uoJeH5Ku3PNQlfkmz/JbSS0oKkz9P
	MQRRmg3gTVEJcqnJbaJ6917aZ6eH6v90gTpkxpOdTa266rqBWl/Afea2FLNlykU0l5hnEt9SA0Cw8
	7z8Qao2Zy/EPCiFTPgpuFfA3dLGT82qUxQcFMY8AAlYp87wgsacqfHkSa0ePMDszilWHKA+Wd2KC8
	qAFrdBHw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp4Y4-00000005rUj-32MZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:42:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11C1A1688;
	Wed, 29 Jul 2026 06:42:11 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38E3B3F86F;
	Wed, 29 Jul 2026 06:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785332535; bh=RqYExXP2DIonUIxmNtWY0w3UKUHFPDqA2PRi+qzWdBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aOQSp6l2HD6QUqzCKVmMfx+VBU9njGp2Gwfvla9/Gruw8ErKYwHAt79KHur/FdZ2d
	 ZyI2H81hBOfSBh8fzIB4+ZU+rP+pjXCRPyH3f4Q8XmghJT9l4FZnJW+YVafZEQ3Tw+
	 V0UFFVVXi09a6ZFnlaR3OdFEvK3yxarLBzMdh8KQ=
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
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/10] arm_mpam: change error IRQ to use a threaded IRQ handler
Date: Wed, 29 Jul 2026 15:41:23 +0200
Message-ID: <20260729134124.2506269-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729134124.2506269-1-andre.przywara@arm.com>
References: <20260729134124.2506269-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_144217_053813_444297E7 
X-CRM114-Status: GOOD (  19.91  )
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
(ESR) in the IRQ handler, which is not possible for MPAM-Fb based
MSC accesses, since they involve mailbox routines that might sleep.
The same is true for clearing the interrupt at the source, which
requires an MSC access as well.

Change the error IRQ to use a threaded IRQ handler, with an empty hard
IRQ routine, and doing all the MSC accesses (to access the status and
disable the IRQ line) in the threaded part. The change is minimal, we
just check for the first MSC access error and bail out early.
Also forbid per-CPU interrupts (PPIs) for MPAM-Fb, as we cannot use a
threaded IRQ here.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 42 ++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index abe1e628928f..e535603d2c7d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2659,9 +2659,11 @@ static int mpam_disable_msc_ecr(void *_msc)
 	return 0;
 }
 
+/* threaded IRQ handler for shared IRQs, to allow MPAM-Fb accesses to sleep */
 static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
 {
 	u64 reg;
+	int ret;
 	u16 partid;
 	u8 errcode, pmg, ris;
 
@@ -2670,13 +2672,19 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
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
+	/* Clear level triggered irq. Ignore errors, we need to proceed. */
 	mpam_msc_clear_esr(msc);
 
 	partid = FIELD_GET(MPAMF_ESR_PARTID_MON, reg);
@@ -2687,19 +2695,19 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
 			   msc->id, mpam_errcode_names[errcode], partid, pmg,
 			   ris);
 
-	/* Disable this interrupt. */
+out_disable:
+	/* Disable this interrupt. Ignore errors, we need to proceed anyway. */
 	mpam_disable_msc_ecr(msc);
 
-	/* Are we racing with the thread disabling MPAM? */
-	if (!mpam_is_enabled())
-		return IRQ_HANDLED;
-
 	/*
-	 * Schedule the teardown work. Don't use a threaded IRQ as we can't
-	 * unregister the interrupt from the threaded part of the handler.
+	 * Schedule the teardown work. We have to defer it as we can't
+	 * unregister the interrupt from the threaded part of a handler.
+	 * Check whether we are racing with the thread disabling MPAM.
 	 */
-	mpam_disable_reason = "hardware error interrupt";
-	schedule_work(&mpam_broken_work);
+	if (mpam_is_enabled()) {
+		mpam_disable_reason = "hardware error interrupt";
+		schedule_work(&mpam_broken_work);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -2735,6 +2743,11 @@ static int mpam_register_irqs(void)
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
@@ -2746,9 +2759,10 @@ static int mpam_register_irqs(void)
 					       &_enable_percpu_irq, &irq,
 					       true);
 		} else {
-			err = devm_request_irq(&msc->pdev->dev, irq,
-					       &mpam_spi_handler, IRQF_SHARED,
-					       "mpam:msc:error", msc);
+			err = devm_request_threaded_irq(&msc->pdev->dev, irq,
+							NULL, &mpam_spi_handler,
+							IRQF_SHARED | IRQF_ONESHOT,
+							"mpam:msc:error", msc);
 			if (err)
 				return err;
 		}
-- 
2.43.0


