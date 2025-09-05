Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04694CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 04:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=peVwaQeh+TOHz0Hsg8BOJYSLvTrJ6RjkKG2WghI8PEQ=; b=ysCJE0UlgvK3FdwlWO1hVwYGmj
	cUXpLJpwfuds3b7Bgc7/X+15Xo6Vz0PxKbCZolI9IwxF2+HzOqecefkoZeJIh+5mIhZHTiQ8Rg2Wa
	8C+hWbJ5v0fKNdKbmnE7dSV1JPAOC5S1rfIiVJPxKXhXHWgxzn3Mw/ecveC7FddexZdoifYP756YF
	r56jKOlX523QLvlmkl4mryMdPpP3fn+osqC93l1Aw1FuIvvFbfQTDtvycFpoo1XxCTSx5BofkI52I
	5EEZj3+Mgvw9ZZwaagCOE5BEtLKubfqHhkWsAghfHqN789iiA15FysaAFHy/yu4VKLE9eUpulGudN
	COCJZJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuO7C-0000000Gjxy-2qTc;
	Fri, 05 Sep 2025 04:31:58 +0000
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuO3X-0000000Gj6G-0VeN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 04:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757046491; x=1788582491;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xalTBGUaJut6FZ6AT7b/pJ5ppOEk0X/YlTA6n0kDWQs=;
  b=MR+37HYba934GV4+0/c2kUkneZvRVzcy2ZiBfjLcsfoVYbe+ZvDSqOsW
   hc8PPAfjYGXCN7X+pKnGNnrUlczZ4NWKEfe/OgWarlbDfMiWQ6Qj5dlkF
   dxUmZ/17f85REr7g6/UkobaoMId25Z1UiNsm9arhWTVy4IBuoykvp8Y2f
   87LK2WcF52z9bn8sv0hjbA0ulEvgdOOSvcUJCKBh2kjDGyrCZjvC/2T+j
   ansvoRIrYZJV6Xt1veIqt9PJxuC0v6328uNKMPBgE8UhK4/uCK/N4iLC8
   72EodnMBsIrOJOUAUoKgR0Qnu02pP5SC2TYXjQtDPio9PkRGRkEa3s88L
   Q==;
X-CSE-ConnectionGUID: bExH94y4SY6LKaqESFp4bg==
X-CSE-MsgGUID: thCMWbSVTdmj/zxZ/mU32w==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="215274792"
X-IronPort-AV: E=Sophos;i="6.18,240,1751209200"; 
   d="scan'208";a="215274792"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 13:28:05 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 3FF9F8203CF
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 04:28:05 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E371818000E2
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 04:28:04 +0000 (UTC)
Received: from sm-arm-grace07.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 139881013115;
	Fri,  5 Sep 2025 04:27:59 +0000 (UTC)
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
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Subject: [PATCH v3] ACPI: AGDI: Add interrupt signaling mode support
Date: Fri,  5 Sep 2025 13:27:45 +0900
Message-ID: <20250905042751.945616-1-fj1078ii@aa.jp.fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_212811_646387_03316ED5 
X-CRM114-Status: GOOD (  24.67  )
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
Therefore, add support for interrupt signaling mode
The interrupt vector is retrieved from the AGDI table, and call panic
function when an interrupt occurs.

Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
---
I keep normal IRQ code when NMI cannot be used.
If there is any concern, please let me know.

v2->v3
 - Fix bug in the return value of agdi_probe function.
 - Remove unnecessary curly braces in the agdi_remove function.

v2: https://lore.kernel.org/all/20250829101154.2377800-1-fj1078ii@aa.jp.fujitsu.com/
v1->v2
 - Remove acpica update since there is no need to update define value
   for this patch.
---
 drivers/acpi/arm64/agdi.c | 95 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 88 insertions(+), 7 deletions(-)

diff --git a/drivers/acpi/arm64/agdi.c b/drivers/acpi/arm64/agdi.c
index e0df3daa4abf..2313a46f01cd 100644
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
@@ -55,12 +108,15 @@ static int agdi_probe(struct platform_device *pdev)
 	if (!adata)
 		return -EINVAL;
 
-	return agdi_sdei_probe(pdev, adata);
+	if (adata->flags & ACPI_AGDI_SIGNALING_MODE)
+		return agdi_interrupt_probe(pdev, adata);
+	else
+		return agdi_sdei_probe(pdev, adata);
 }
 
-static void agdi_remove(struct platform_device *pdev)
+static void agdi_sdei_remove(struct platform_device *pdev,
+			     struct agdi_data *adata)
 {
-	struct agdi_data *adata = dev_get_platdata(&pdev->dev);
 	int err, i;
 
 	err = sdei_event_disable(adata->sdei_event);
@@ -83,6 +139,29 @@ static void agdi_remove(struct platform_device *pdev)
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
+	if (adata->flags & ACPI_AGDI_SIGNALING_MODE)
+		agdi_interrupt_remove(pdev, adata);
+	else
+		agdi_sdei_remove(pdev, adata);
+}
+
 static struct platform_driver agdi_driver = {
 	.driver = {
 		.name = "agdi",
@@ -94,7 +173,7 @@ static struct platform_driver agdi_driver = {
 void __init acpi_agdi_init(void)
 {
 	struct acpi_table_agdi *agdi_table;
-	struct agdi_data pdata;
+	struct agdi_data pdata = {0};
 	struct platform_device *pdev;
 	acpi_status status;
 
@@ -104,11 +183,13 @@ void __init acpi_agdi_init(void)
 		return;
 
 	if (agdi_table->flags & ACPI_AGDI_SIGNALING_MODE) {
-		pr_warn("Interrupt signaling is not supported");
-		goto err_put_table;
+		pdata.gsiv = agdi_table->gsiv;
+	} else {
+		pdata.sdei_event = agdi_table->sdei_event;
 	}
 
-	pdata.sdei_event = agdi_table->sdei_event;
+	pdata.irq = -1;
+	pdata.flags = agdi_table->flags;
 
 	pdev = platform_device_register_data(NULL, "agdi", 0, &pdata, sizeof(pdata));
 	if (IS_ERR(pdev))
-- 
2.43.0


