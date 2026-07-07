Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885C5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y3xVuote9u3D9BR80HWLFb2zecWYnRZ4sk5LiXRI0YI=; b=vSD4S3Yr9Z1JivDLyfamQbOuKA
	7TBSgsAX8rXV/Nc+Mk8kbmdid9QVD+2kkgZpq555IgqudN+Qa2bw3PZm5uAebLdwOBx4VOC9Hb0Hl
	5HewhbiSl84RqvK5uwrQ6cCONSAiMHhKGDjyAlDvkbYjX2KWnv94T9/KVEPv6woZKvkaY9sYYbQb/
	/XKIJu4872FWeO4t5TLBnvtK13AXeCXTkiSnu9rvwolK2aajWJE66O/p0AxP+fw949wsi39/sgXOb
	z8rRqsghv/dO4TDQdz/g11Fn3XI5wD3Boj54Rn0lv9uOX7wxmVdsqvq7OzESDS1Q0dvDH0jp6NxO6
	zOKiLk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Fy-0000000FDyb-2VNJ;
	Tue, 07 Jul 2026 14:58:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Fw-0000000FDyE-45rY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 14:58:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24A35601EB;
	Tue,  7 Jul 2026 14:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EA51F000E9;
	Tue,  7 Jul 2026 14:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783436319;
	bh=y3xVuote9u3D9BR80HWLFb2zecWYnRZ4sk5LiXRI0YI=;
	h=From:To:Cc:Subject:Date;
	b=dfI6HzF2IKlnSnYCYlYGAX1Mru9WuhG2EKUEyWYloiQK+VfDtqXBF6He7SzogTlLx
	 ZBktpeiXk1r6/JryEblxF7Wwh4Utc6dK0PNfFclIpTNJM6Hn1rC2MzybW0uY9NrbbE
	 xUoogzzHKP+WmFiG7CmsxYu+Liyk01MLLDRW3COJ/31eeX+AlPVkG7fFAaInpqZpV7
	 9ThfyhbZitkME77THpop1+9tgd3r8wMBeo6vXigfwGT9Aly8dPSyj7P8b3huzzQ2Tm
	 7qSpK52ShNMdp6RK1T1FniJQJtGmm+GxJuUfXC3pnwpvzf3LV+tz2ARBMyZ8+2Al2Q
	 1YBxhu2bMT4nQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH 1/2] soc: fsl: qe_ports_ic: Use generic I/O helper instead of specific powerPC ones
Date: Tue,  7 Jul 2026 16:58:14 +0200
Message-ID: <b08f76c1d8ff864774246f1e2c2158c223c001be.1783435914.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2349; i=chleroy@kernel.org; h=from:subject:message-id; bh=arvLCYHqWrUHkcx055c37FRvAlzSr7XgCPww+FFNsX8=; b=kA0DAAoW3ZBwJryrz1MByyZiAGpNFAqhsGEuFtzI08+Th4P43Q0RY7aAxNfenMFmxeCOlYxFW oh1BAAWCgAdFiEEx/8LupiK9GVvlbov3ZBwJryrz1MFAmpNFAoACgkQ3ZBwJryrz1OaEAD/ZJLU jrGNaBWQSyj2qj4rPDOldJT+4j0T2Xya5+hWbGQA/0W1CqRSxmOPzQdin2BYVlmkdXFpiaXkTEx l5dP6JYsA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
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

Use ioread32be() and iowrite32be() instead of in_be32() and out_be32()
to allow build on other platforms than powerPC.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 9b0bba64e91e4..33ca1ddafe18c 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -23,36 +23,39 @@ struct qepic_data {
 static void qepic_mask(struct irq_data *d)
 {
 	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+	u32 val = ioread32be(data->reg + CEPIMR);
 
-	clrbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
+	iowrite32be(val & ~(1 << (31 - irqd_to_hwirq(d))), data->reg + CEPIMR);
 }
 
 static void qepic_unmask(struct irq_data *d)
 {
 	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+	u32 val = ioread32be(data->reg + CEPIMR);
 
-	setbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
+	iowrite32be(val | 1 << (31 - irqd_to_hwirq(d)), data->reg + CEPIMR);
 }
 
 static void qepic_end(struct irq_data *d)
 {
 	struct qepic_data *data = irq_data_get_irq_chip_data(d);
 
-	out_be32(data->reg + CEPIER, 1 << (31 - irqd_to_hwirq(d)));
+	iowrite32be(1 << (31 - irqd_to_hwirq(d)), data->reg + CEPIER);
 }
 
 static int qepic_set_type(struct irq_data *d, unsigned int flow_type)
 {
 	struct qepic_data *data = irq_data_get_irq_chip_data(d);
 	unsigned int vec = (unsigned int)irqd_to_hwirq(d);
+	u32 val = ioread32be(data->reg + CEPICR);
 
 	switch (flow_type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_FALLING:
-		setbits32(data->reg + CEPICR, 1 << (31 - vec));
+		iowrite32be(val | 1 << (31 - vec), data->reg + CEPICR);
 		return 0;
 	case IRQ_TYPE_EDGE_BOTH:
 	case IRQ_TYPE_NONE:
-		clrbits32(data->reg + CEPICR, 1 << (31 - vec));
+		iowrite32be(val & ~(1 << (31 - vec)), data->reg + CEPICR);
 		return 0;
 	}
 	return -EINVAL;
@@ -69,7 +72,7 @@ static struct irq_chip qepic = {
 static int qepic_get_irq(struct irq_desc *desc)
 {
 	struct qepic_data *data = irq_desc_get_handler_data(desc);
-	u32 event = in_be32(data->reg + CEPIER);
+	u32 event = ioread32be(data->reg + CEPIER);
 
 	if (!event)
 		return -1;
-- 
2.54.0


