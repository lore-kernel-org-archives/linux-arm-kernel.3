Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486D9C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=frNa2nBmhsFWjChnvqTYWMGE1qrm7ecsPfV2Lh8SkAY=; b=qQerUxSxd4pp0rZ4w//Wifyj5m
	0Ulpg66zedSOEFOJ06h2L92KCGYeeLzfdlUrxO8kc0qc/rYTOT4q95xFcrSLK2bCI+Dr2gN0RwH2T
	ExNueY+H+6rCMxn+dDPVB8iuIxW2HoGMW+Lnf2aGIlLvXo6Kc65KlO910CmMoenYT234f9Ls799k3
	JtIeiuvm7PQ2wp8DOo3kkYZaTEpoA+6319NxozA+h3X+QnMCnZG1hwF2H67drBe1g0YrMz1pFOfM8
	+fuQ7Kaf7qYrDEnADDZRi47/qElBqwjqqHt8IaFtVw3VpQWDmbnneYUlTz1kCDLdD3J6Hwdx2jyac
	/jmvjecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzBF-00000000RNb-1Mmc;
	Thu, 07 Aug 2025 11:53:09 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujz80-00000000QiZ-21y4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 11:49:50 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779orbi011575;
	Thu, 7 Aug 2025 13:49:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=frNa2nBmhsFWjChnvqTYWM
	GE1qrm7ecsPfV2Lh8SkAY=; b=1SEAdqomI6QeZCcCa/1A9G2A0MPtbf3ABTp7TG
	nHaKWPw7ZTirAUS+EDyu/dL8FvPSg4bnlT/LBNNMQNGcS367UJwFHrA2W2p9wEwd
	1j/GEvh1GBB9zprn1d7I4XB86LKjfOhCmVRvNYwY8t5IDtbgxkOoFBqBM2qwg5B5
	+Dkzh+8NOZS4YNul6LWVP/JBfP114Hdl3pCfHWfjSvwQVOu0hmSFzNBm2iI1LEbB
	RyI39NhXp0QRVkzkBswGJvI0GixmrJeNuYWMVLuo2SnfDV9ljyoZY4+iUcM8R/70
	0HLsloN2j5JDi9TexUo7kZcbQX9gHXOCJ+Xh0haVEjypPZEA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48c7mcutra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:49:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B0E4140048;
	Thu,  7 Aug 2025 13:48:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16AEA71FDA0;
	Thu,  7 Aug 2025 13:48:14 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 13:48:13 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <maz@kernel.org>, <tglx@linutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <fabrice.gasnier@foss.st.com>, <mani@kernel.org>,
        Christian Bruel
	<christian.bruel@foss.st.com>
Subject: [PATCH] irqchip: gic-v2m: Handle multiple MSI base IRQ mis-alignment
Date: Thu, 7 Aug 2025 13:47:58 +0200
Message-ID: <20250807114759.3966195-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_044948_899797_FDB9707C 
X-CRM114-Status: GOOD (  15.33  )
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

The PCI Local Bus Specification (section 6.8.3.4 in Rev 3) allows modifying
the low-order bits of the MSI Message Data to encode the interrupt number.
However, the base SPI used for allocation may not be aligned to the
requested number of irqs.

For instance, on STM32MP25 with an initial MSI_TYPER base SPI of 0x16A,
allocating a multiple MSI of size 8 with the first two slots reserved, the
offset returned is 8, resulting in an MSI DATA base of 0x172.
This causes the endpoint device to send a wrong interrupt number:

1st MSI = 0x172 | 0x0 = 0x172
2nd MSI = 0x172 | 0x1 = 0x173
3rd MSI = 0x172 | 0x2 = 0x172 wrongly triggers the 1st MSI

The alignment offset can be computed in the gicv2m driver:
replacing bitmap_find_free_region() with bitmap_find_next_zero_area_off()
to accommodate the required alignment.

Without this fix, the workaround is to force the alignment in the DT
within the MSI range (if 32 MSIs are mapped from 362 to 393):
arm,msi-base-spi = <368>
arm,msi-num-spis = <26>
with the effect of reducing the number of available MSIs.

Change-Id: I316a580755cd1b1684929d2540295f4a45f0532d
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 drivers/irqchip/irq-gic-v2m.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index 24ef5af569fe..21a14d15e7a9 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -153,14 +153,18 @@ static int gicv2m_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 {
 	msi_alloc_info_t *info = args;
 	struct v2m_data *v2m = NULL, *tmp;
-	int hwirq, offset, i, err = 0;
+	int hwirq, i, err = 0;
+	unsigned long align_mask = (1 << get_count_order(nr_irqs)) - 1;
+	unsigned long align_off, offset;
 
 	spin_lock(&v2m_lock);
 	list_for_each_entry(tmp, &v2m_nodes, entry) {
-		offset = bitmap_find_free_region(tmp->bm, tmp->nr_spis,
-						 get_count_order(nr_irqs));
-		if (offset >= 0) {
+		align_off = tmp->spi_start & info->desc->pci.msi_attrib.multiple;
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


