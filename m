Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FF7C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9IPPtvd8ubeolM852ybP4FIKkobzmqr9z+sISFxJvo=; b=iZncjMTorrvYPXOkNwzU0Mzty9
	+OQU7fnEDvOFIp0X3JyKD97NQowXO2OQ/GyscSFkZEVpXCwSZAxjr1KoUHZL4YjIq14yh7iKKps8J
	6vh3txAIgzMRTYzdqFteyC92l+mF9XhsGbD7vX9bZ20bjro9YrLcCuA/XRp2MBa/Inpce/K1wOn/e
	vvEoC/tTyheDxGmKq7etp+a2it8apwbZa/LNvmSERw0oRpptzka0K7kbkGlrvyH4fSkbm/AZVAyVF
	Y7AuC8FWENObj96y0Ug1eIuT/N6tZZGHS/2xDThuTlcsj8vMalDmXvpa/3g5StuUsHqw9+owsrYfW
	dDytEoIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvm7-0000000Eenk-0hU9;
	Thu, 23 Jul 2026 15:55:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvln-0000000EebP-0Toh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:55:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 057AC1595;
	Thu, 23 Jul 2026 08:55:30 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6DB63F66F;
	Thu, 23 Jul 2026 08:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784822134; bh=5UCprN2NQeJajnVI+vTpf77V2cpoFH+j7SWXoXNaRpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vMyyzaANv7YM4Yj2Et+PriXiRTUJr60ooXbBIscLpdyM9b7Mun3jnjYVXDpTVC6V1
	 5LzWczN14BPFgzrf+Lo92HVf/Rf6yS9e1lIzd66BQEq2vvKc2qHB6zwRNyJsC8o/Pz
	 0twMQEiO3L04+tflQYsbNpSt9PBOue/KGtLbZscg=
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
Subject: [PATCH v4 09/10] arm_mpam: prevent MPAM-Fb accesses inside IRQ handler
Date: Thu, 23 Jul 2026 17:54:53 +0200
Message-ID: <20260723155454.1760823-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723155454.1760823-1-andre.przywara@arm.com>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_085535_240157_A5AB4E77 
X-CRM114-Status: GOOD (  14.40  )
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
requires MSC access.

For simplicity just skip the ESR read when the MSC is not using direct
MMIO accesses, and just ignore the pending interrupts. We will wrap up
MPAM functionality regardless, knowing the exact error value will not
change that.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 36 +++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b8108ed4b32c..fea3161ffbe9 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2650,25 +2650,33 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
 					   &msc->accessibility)))
 		return IRQ_NONE;
 
-	mpam_msc_read_esr(msc, &reg);
+	/* MPAM-Fb MSC accesses cannot be done in atomic context. */
+	if (msc->iface == MPAM_IFACE_MMIO) {
+		mpam_msc_read_esr(msc, &reg);
 
-	errcode = FIELD_GET(MPAMF_ESR_ERRCODE, reg);
-	if (!errcode)
-		return IRQ_NONE;
+		errcode = FIELD_GET(MPAMF_ESR_ERRCODE, reg);
+		if (!errcode)
+			return IRQ_NONE;
 
-	/* Clear level triggered irq */
-	mpam_msc_clear_esr(msc);
+		/* Clear level triggered irq */
+		mpam_msc_clear_esr(msc);
 
-	partid = FIELD_GET(MPAMF_ESR_PARTID_MON, reg);
-	pmg = FIELD_GET(MPAMF_ESR_PMG, reg);
-	ris = FIELD_GET(MPAMF_ESR_RIS, reg);
+		partid = FIELD_GET(MPAMF_ESR_PARTID_MON, reg);
+		pmg = FIELD_GET(MPAMF_ESR_PMG, reg);
+		ris = FIELD_GET(MPAMF_ESR_RIS, reg);
 
-	pr_err_ratelimited("error irq from msc:%u '%s', partid:%u, pmg: %u, ris: %u\n",
-			   msc->id, mpam_errcode_names[errcode], partid, pmg,
-			   ris);
+		pr_err_ratelimited("error irq from msc:%u '%s', partid:%u, pmg: %u, ris: %u\n",
+				   msc->id, mpam_errcode_names[errcode], partid,
+				   pmg, ris);
 
-	/* Disable this interrupt. */
-	mpam_disable_msc_ecr(msc);
+		/* Disable this interrupt. */
+		mpam_disable_msc_ecr(msc);
+	} else {
+		struct irq_data *d = irq_get_irq_data(irq);
+
+		pr_err_ratelimited("unknown error irq %d/%ld from msc:%u\n",
+				   irq, d ? irqd_to_hwirq(d) : -1, msc->id);
+	}
 
 	/* Are we racing with the thread disabling MPAM? */
 	if (!mpam_is_enabled())
-- 
2.43.0


