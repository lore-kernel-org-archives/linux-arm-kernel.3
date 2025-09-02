Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351ECCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aaecNdmQjRiKZJguz7vt+CPGtlc/Ef3Ox4gaPS8SLbU=; b=QjpZeG0MFypIf5+3HiFjnDS5PN
	A7xPefPMqVKtSK85jAiOBZv8TTrK2qP3rsbENNSwHEsDPgOFM/dOPzvVr0JRBL3SIrb8F8haRIoyG
	yeUyX8/aTlbu1bIjdAHuGfquNmghN5QqoxNChJax4erFcqEdUKHsLVz0+XDkabvqXJuKo7HYBwMlf
	VB8ZNzQTtg9HU7JayYWqcBYd9tyXkjZM8fxkNgSHeRVU1I/f7ioHMgtVtImFZ6RHcfxEo4o+9fZPn
	HGt9rYKCAgC4/QyGnAxU8wJjrsCGY+t+ChTakKVw7Wq/CsP7/QJ0yuNxtQ9rCGH+AMR4AsoYY4+P8
	8L4DZZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ6q-0000000HE8R-2umY;
	Tue, 02 Sep 2025 12:27:36 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utN3m-0000000GI7x-2yRD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:12:16 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5828lbYo000888;
	Tue, 2 Sep 2025 11:12:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=aaecNdmQjRiKZJguz7vt+C
	PGtlc/Ef3Ox4gaPS8SLbU=; b=7O8Zs5jsQ4za/Y3eJL/shgp64ezbCeXace0Bjp
	3qpJBvSZ3icz8GbrjE7LDkB5LFX5D4kX6cGfPPQIhjDQJzryCo/fGiqY/f53xrnT
	x84GyajQzFPOqzuraMcqoJVQK5VFmN6FETO5Ktdk4QfSkGyQFUyb0Giz7J4Cmy/+
	WL0fYaEVAGDMR47UhRuiNswPNijdiw506g0MtWFuUgf/D3zuUW/6Ih8KvEjzEOKQ
	VzIG0uiyZA2i2bAFl1mLl2ijq4aFHy6KXTizT5rCkY5ZqfZxFbSh4lRQRNGDptpc
	m3puQFOrYDwzT7djbvZ5c28vS1xtHt6KicHpoNrcRm09Oh/g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmxaum7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 11:12:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 612B54002D;
	Tue,  2 Sep 2025 11:11:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1FBD4025B7;
	Tue,  2 Sep 2025 11:10:53 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 2 Sep
 2025 11:10:53 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <maz@kernel.org>, <tglx@linutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <fabrice.gasnier@foss.st.com>, <mani@kernel.org>,
        Christian Bruel
	<christian.bruel@foss.st.com>
Subject: [PATCH v2] irqchip: gic-v2m: Handle Multiple MSI base IRQ Alignment
Date: Tue, 2 Sep 2025 11:10:45 +0200
Message-ID: <20250902091045.220847-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_021215_374861_20DEFA23 
X-CRM114-Status: GOOD (  15.79  )
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

The PCI Local Bus Specification 3.0 (section 6.8.1.6) allows modifying the
low-order bits of the MSI Message DATA register to encode nr_irqs interrupt
numbers in the log2(nr_irqs) bits for the domain.

The problem arises if the base vector (GICV2m base spi) is not aligned with
nr_irqs; in this case, the low-order log2(nr_irqs) bits from the base
vector conflict with the nr_irqs masking, causing the wrong MSI interrupt
to be identified.

To fix this, use bitmap_find_next_zero_area_off() instead of
bitmap_find_free_region() to align the initial base vector with nr_irqs.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
Changes in v2:
   (Marc Zyngier)
 - Move align_off definition inside the loop
 - Reworked Commit Message

Changes in v1:
   (Marc Zyngier)
 - Replace the incorrect usage of msi_attrib.multiple with nr_irqs
 - Reworked changelog
---
 drivers/irqchip/irq-gic-v2m.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index 24ef5af569fe..8a3410c2b7b5 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -153,14 +153,19 @@ static int gicv2m_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 {
 	msi_alloc_info_t *info = args;
 	struct v2m_data *v2m = NULL, *tmp;
-	int hwirq, offset, i, err = 0;
+	int hwirq, i, err = 0;
+	unsigned long offset;
+	unsigned long align_mask = nr_irqs - 1;
 
 	spin_lock(&v2m_lock);
 	list_for_each_entry(tmp, &v2m_nodes, entry) {
-		offset = bitmap_find_free_region(tmp->bm, tmp->nr_spis,
-						 get_count_order(nr_irqs));
-		if (offset >= 0) {
+		unsigned long align_off = tmp->spi_start - (tmp->spi_start & ~align_mask);
+
+		offset = bitmap_find_next_zero_area_off(tmp->bm, tmp->nr_spis, 0,
+							nr_irqs, align_mask, align_off);
+		if (offset < tmp->nr_spis) {
 			v2m = tmp;
+			bitmap_set(v2m->bm, offset, nr_irqs);
 			break;
 		}
 	}
-- 
2.34.1


