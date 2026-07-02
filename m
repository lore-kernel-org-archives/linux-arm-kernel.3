Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B880C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iu8RyMU1H1zRjI/HkBmcTMmSEJ8oABFFzr5Qqr+nn/E=; b=lQtC6Q8RkQt/EIIJ9b1iRAKseA
	ld+wvMiNG6GN2qpji2i6/YtSq/88Dx4Zt2AhDU5pYsNXLOd/g5t7HngaNTbbtiKfmZPn4LssVlXq3
	ioiz8mgo4Kq1TASF8vZwyeQ+N5lzpLHxDL9YbxDKifbMABclk28OJHApoJac0PwDL7f6UoztGeRNI
	1MKuMhzFUpiHADGr3jgn1s1mY0kQONgUUYSwU907JBHYSK0zmKH4opaWndQQ0cBrXTYT1r09akB0P
	SMKrbnA02lZawv2k8OTjmkQhPOLBw90XbukSNJ0kFwtY/6EX8gw79IidKHmEerR+qmHF5IXVBLDdB
	i/Dgb20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKCS-0000000502j-3pyu;
	Thu, 02 Jul 2026 16:23:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKCQ-00000004zyw-0ZPl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:23:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 492B135C7;
	Thu,  2 Jul 2026 09:23:33 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E37353F673;
	Thu,  2 Jul 2026 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783009417; bh=ZOi+S59YJ0B3TKXiKIEFBZs1J/FXmsi//zO+8bJPX7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bG4sXIzrIOoKahUcxII7Dou310sac30oJl7cq96iXQIqGuc7HpZLDmN4Zqm3kOrMj
	 G5b5mxAp5W7k7NvDPYR7rz5AooC3pxXiTTzPXluf5cpFGzaL9s+xOLs/2AIkb3nLTt
	 Q0J0/tCI82jX9N2aneHZSBZt6NwBaOEMSk6T2tOM=
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
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/15] arm_mpam: prevent MPAM-Fb accesses inside IRQ handler
Date: Thu,  2 Jul 2026 18:22:28 +0200
Message-ID: <20260702162229.4008659-15-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702162229.4008659-1-andre.przywara@arm.com>
References: <20260702162229.4008659-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_092338_264406_3555824D 
X-CRM114-Status: GOOD (  15.47  )
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
 drivers/resctrl/mpam_devices.c | 35 +++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b858ff389bff..4a088e6cd235 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2639,7 +2639,7 @@ static int mpam_disable_msc_ecr(void *_msc)
 
 static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
 {
-	u64 reg;
+	u64 reg = 0;
 	u16 partid;
 	u8 errcode, pmg, ris;
 
@@ -2648,25 +2648,30 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
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
+		pr_err_ratelimited("unknown error irq from msc:%u\n", msc->id);
+	}
 
 	/* Are we racing with the thread disabling MPAM? */
 	if (!mpam_is_enabled())
-- 
2.43.0


