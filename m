Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADCCCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SJiWkaej3T5ZvnwQ/jubWsvu+QLfdNQ8pCe5sfEOeqI=; b=dBaVcg6CTlJZ+J9/kk5pr9lrHx
	soWrpsekOt+h6ItBcU3JgTS6+O6fMyf9xPddEVPzdnSGidpVcGPgDDPuukDc6TILSFmHrT0e/Exnv
	7G/VodI4NQWxkYqEe0o6lTgyEo/flLsKuiARFKshAqZlQ4pTgRmHYX2Rpp7WPoK6xSr1pTZegZEHc
	IeZciQldBYRLc52kvWWJtJ9yx3HXKtKVxwE1D+bsYjlBxWPXhNTuqDsbn+AP5vu8Z5ZykbhvLt7Bl
	4sgE1kT3KH4bUy8Cn2un3jHS+P68FzHuWDlENtlcaKSxJzporYRM3djWwq+Y1RMvewZ1kbLb99G4+
	Ha7qNqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unueH-00000006pIP-1vc1;
	Mon, 18 Aug 2025 07:51:21 +0000
Received: from esa9.hc1455-7.c3s2.iphmx.com ([139.138.36.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untlf-00000006jJ6-3s10
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 06:54:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755500096; x=1787036096;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SYqtjbS5xj6kVXRvjoAEi4rEMpnH5VOdZ8cA9FjUtd8=;
  b=Suu8mJmSJ+AaXVvmr3RSPxd+dUKvtCzxk595Z/EA3Vu7WNSoXrQLBszZ
   bRSsUOMDEf7ujc19Ni3Rofi4+u/5WCYq2+wFGOuqRhbm87vrExIgJJgH2
   8BDE0gqgyYdFcpqZswwdYutHftyJcY2Y/XjJGVlB62PlqR9cOmK6s29y6
   PE9x9XStKvs6qpFQZ91YkeT4wzJwElPxvyTYBMSlyFO9gA4DwZhdi2J21
   iQHn1bPMFYx+cuQrKyX7B/XOEU/QbDROGjiD/vnP4JG29Rb8/AbGCBK0P
   kP7JjSt37ez9x/GjKfYnYv40M7/SMy3DQWp3iumV+LFyPv8FN8GoyArQO
   A==;
X-CSE-ConnectionGUID: c6dl0y6ySRSfFJhZntYKBA==
X-CSE-MsgGUID: Ldw48o4AQ+C4y42REt4b7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="198072029"
X-IronPort-AV: E=Sophos;i="6.17,293,1747666800"; 
   d="scan'208";a="198072029"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 15:54:51 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8AAB7C0022D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 06:54:51 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 38E1614003CC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 06:54:51 +0000 (UTC)
Received: from sm-arm-grace07.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8F6941400126;
	Mon, 18 Aug 2025 06:54:46 +0000 (UTC)
From: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
Subject: [PATCH] ACPI: AGDI: Add interrupt signaling mode support
Date: Mon, 18 Aug 2025 15:54:32 +0900
Message-ID: <20250818065437.85905-1-fj1078ii@aa.jp.fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_235456_248868_4658C2B5 
X-CRM114-Status: GOOD (  24.15  )
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

AGDI has two types of signaling modes: SDEI and interrupt.
Currently, the AGDI driver only supports SDEI.
Therefore, add support for interrupt singaling mode
The interrupt vector is retrieved from the AGDI table, and call panic
function when an interrupt occurs.
SDEI & Interrupt mode is not supported.

Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
---
 drivers/acpi/arm64/agdi.c | 114 +++++++++++++++++++++++++++++++++++---
 include/acpi/actbl2.h     |   4 +-
 2 files changed, 110 insertions(+), 8 deletions(-)

diff --git a/drivers/acpi/arm64/agdi.c b/drivers/acpi/arm64/agdi.c
index e0df3daa4abf0..c514bb874c5d3 100644
--- a/drivers/acpi/arm64/agdi.c
+++ b/drivers/acpi/arm64/agdi.c
@@ -16,7 +16,11 @@
 #include "init.h"
 
 struct agdi_data {
+	unsigned char flags;
 	int sdei_event;
+	unsigned int gsiv;
+	bool use_nmi;
+	int irq;
 };
 
 static int agdi_sdei_handler(u32 sdei_event, struct pt_regs *regs, void *arg)
@@ -48,6 +52,55 @@ static int agdi_sdei_probe(struct platform_device *pdev,
 	return 0;
 }
 
+static irqreturn_t agdi_interrupt_handler_nmi(int irq, void *dev_id)
+{
+	nmi_panic(NULL, "Arm Generic Diagnostic Dump and Reset NMI Interrupt event issued\n");
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t agdi_interrupt_handler_irq(int irq, void *dev_id)
+{
+	panic("Arm Generic Diagnostic Dump and Reset Interrupt event issued\n");
+	return IRQ_HANDLED;
+}
+
+static int agdi_interrupt_probe(struct platform_device *pdev,
+				struct agdi_data *adata)
+{
+	unsigned long irq_flags;
+	int ret;
+	int irq;
+
+	irq = acpi_register_gsi(NULL, adata->gsiv, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_HIGH);
+	if (irq < 0) {
+		dev_err(&pdev->dev, "cannot register GSI#%d (%d)\n", adata->gsiv, irq);
+		return irq;
+	}
+
+	irq_flags = IRQF_PERCPU | IRQF_NOBALANCING | IRQF_NO_AUTOEN |
+		    IRQF_NO_THREAD;
+	/* try NMI first */
+	ret = request_nmi(irq, &agdi_interrupt_handler_nmi, irq_flags,
+			  "agdi_interrupt_nmi", NULL);
+	if (ret) {
+		ret = request_irq(irq, &agdi_interrupt_handler_irq,
+				  irq_flags, "agdi_interrupt_irq", NULL);
+		if (ret) {
+			dev_err(&pdev->dev, "cannot register IRQ %d\n", ret);
+			acpi_unregister_gsi(adata->gsiv);
+			return ret;
+		}
+		enable_irq(irq);
+		adata->irq = irq;
+	} else {
+		enable_nmi(irq);
+		adata->irq = irq;
+		adata->use_nmi = true;
+	}
+
+	return 0;
+}
+
 static int agdi_probe(struct platform_device *pdev)
 {
 	struct agdi_data *adata = dev_get_platdata(&pdev->dev);
@@ -55,12 +108,20 @@ static int agdi_probe(struct platform_device *pdev)
 	if (!adata)
 		return -EINVAL;
 
-	return agdi_sdei_probe(pdev, adata);
+	switch (adata->flags & ACPI_AGDI_SIGNALING_MODE_MASK) {
+	case ACPI_AGDI_SIGNALING_MODE_SDEI:
+		return agdi_sdei_probe(pdev, adata);
+
+	case ACPI_AGDI_SIGNALING_MODE_INTERRUPT:
+		return agdi_interrupt_probe(pdev, adata);
+	}
+
+	return 0;
 }
 
-static void agdi_remove(struct platform_device *pdev)
+static void agdi_sdei_remove(struct platform_device *pdev,
+			     struct agdi_data *adata)
 {
-	struct agdi_data *adata = dev_get_platdata(&pdev->dev);
 	int err, i;
 
 	err = sdei_event_disable(adata->sdei_event);
@@ -83,6 +144,34 @@ static void agdi_remove(struct platform_device *pdev)
 			adata->sdei_event, ERR_PTR(err));
 }
 
+static void agdi_interrupt_remove(struct platform_device *pdev,
+				  struct agdi_data *adata)
+{
+	if (adata->irq != -1) {
+		if (adata->use_nmi)
+			free_nmi(adata->irq, NULL);
+		else
+			free_irq(adata->irq, NULL);
+
+		acpi_unregister_gsi(adata->gsiv);
+	}
+}
+
+static void agdi_remove(struct platform_device *pdev)
+{
+	struct agdi_data *adata = dev_get_platdata(&pdev->dev);
+
+	switch (adata->flags & ACPI_AGDI_SIGNALING_MODE_MASK) {
+	case ACPI_AGDI_SIGNALING_MODE_SDEI:
+		agdi_sdei_remove(pdev, adata);
+		break;
+
+	case ACPI_AGDI_SIGNALING_MODE_INTERRUPT:
+		agdi_interrupt_remove(pdev, adata);
+		break;
+	}
+}
+
 static struct platform_driver agdi_driver = {
 	.driver = {
 		.name = "agdi",
@@ -94,7 +183,7 @@ static struct platform_driver agdi_driver = {
 void __init acpi_agdi_init(void)
 {
 	struct acpi_table_agdi *agdi_table;
-	struct agdi_data pdata;
+	struct agdi_data pdata = {0};
 	struct platform_device *pdev;
 	acpi_status status;
 
@@ -103,12 +192,23 @@ void __init acpi_agdi_init(void)
 	if (ACPI_FAILURE(status))
 		return;
 
-	if (agdi_table->flags & ACPI_AGDI_SIGNALING_MODE) {
-		pr_warn("Interrupt signaling is not supported");
+	switch (agdi_table->flags & ACPI_AGDI_SIGNALING_MODE_MASK) {
+	case ACPI_AGDI_SIGNALING_MODE_SDEI:
+		pdata.sdei_event = agdi_table->sdei_event;
+		break;
+
+	case ACPI_AGDI_SIGNALING_MODE_INTERRUPT:
+		pdata.gsiv = agdi_table->gsiv;
+		break;
+
+	default:
+		pr_warn("Signaling mode(%d) is not supported",
+			agdi_table->flags & ACPI_AGDI_SIGNALING_MODE_MASK);
 		goto err_put_table;
 	}
 
-	pdata.sdei_event = agdi_table->sdei_event;
+	pdata.irq = -1;
+	pdata.flags = agdi_table->flags;
 
 	pdev = platform_device_register_data(NULL, "agdi", 0, &pdata, sizeof(pdata));
 	if (IS_ERR(pdev))
diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index 048f5f47f8b88..9ddbdd772f139 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -339,7 +339,9 @@ struct acpi_table_agdi {
 
 /* Mask for Flags field above */
 
-#define ACPI_AGDI_SIGNALING_MODE (1)
+#define ACPI_AGDI_SIGNALING_MODE_MASK (3)
+#define ACPI_AGDI_SIGNALING_MODE_SDEI (0)
+#define ACPI_AGDI_SIGNALING_MODE_INTERRUPT (1)
 
 /*******************************************************************************
  *
-- 
2.43.0


