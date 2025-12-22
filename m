Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEFBE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 06:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qwO5Fz2vHqn7n0eKcYvf4GfayL/tTmLm6RSqBxdZk1Y=; b=rcbeEVMOTf+AUXH2REsFcBJHeX
	tpdhZNEz3q7kesrLGh5Dm7deOuXHs7zkkz6H2gSoPfx/AlPUySXXzFfeXiIFzYYw6tgEU253CnPkF
	AwQ9qEywDPmYc+RZcHGEIa9Rb4IEG8fewBbVWkP6zUaPFOwuARWg0IWokfZHkV8VScmKZo4TVC+pJ
	jpSYMGSH+cwg9/dHlo/jf1A0TR2fMax7gY4PW96F9VTvG/HThW5oP63zNNA4tptyW1sRb5SqmccdJ
	8FSP8urWL3SSeJ7zroHJ+J1iDSAN8XPuDS1qaaC4caV+dP2FX0Vt9xF9slMqORKg1kSk7y92Y0TGt
	Xdh42RlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZoO-0000000DKel-11Xf;
	Mon, 22 Dec 2025 06:54:35 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZoG-0000000DKeA-0xgE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 06:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766386464; x=1797922464;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bTaSSWqtn98z2Qj6qEHjHoQ1Z9LeLdTFS9bX5rBwXd4=;
  b=R8Ig6QxCc0Blbfu/tQ6Hf/GfuBpAW+JPREiiQHxLqXh9WwaLhmFB/8ql
   Z1JC9GfIGyrY28b1aXXKdrlytz8LpUg/T7Z2GlwEuufSNDo2CXp5ev9CS
   RmWFP7X9JFefBdvz1ZB4dBkp0MAQ+tZoxN2hEIM1wiXfybOAuUOwhG1Z+
   S4evX9vs+XXfrvfBebuqsGsuwehfTB/uDwpu+SaG1/Q903q3zrpjP9kh4
   PrxJVAJIFhe6Oaw5ovg0Blm0aMe1Gz+YyrkesEK1AyuyMB7FT6vlX9lDD
   b2jv2RwZ03n2yfKU48am9714cjSwv8Sc6uSrQtw414OzCJ7ni5JDXf2Rz
   Q==;
X-CSE-ConnectionGUID: SlXMmxvFQQGOu61w2ZAC8g==
X-CSE-MsgGUID: 4vXtGpXuSZGlCgXE8MTdpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="223435988"
X-IronPort-AV: E=Sophos;i="6.21,167,1763391600"; 
   d="scan'208";a="223435988"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:54:16 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 51F141C1C70F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:54:16 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 0FFBDC00205
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:54:16 +0000 (UTC)
Received: from sm-arm-grace07.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 2D0A34046BC;
	Mon, 22 Dec 2025 06:54:10 +0000 (UTC)
From: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>,
	Koichi Okuno <fj2767dz@aa.jp.fujitsu.com>
Subject: [PATCH v5] ACPI: AGDI: Add interrupt signaling mode support
Date: Mon, 22 Dec 2025 15:53:34 +0900
Message-ID: <20251222065359.27330-1-fj1078ii@aa.jp.fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_225424_866071_5080479B 
X-CRM114-Status: GOOD (  28.92  )
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
Therefore, add support for interrupt signaling mode.
The interrupt vector is retrieved from the AGDI table, and call panic
function when an interrupt occurs.

Acked-by: Hanjun Guo <guohanjun@huawei.com>
Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>

---
This patch (v5) has been rebased to align with the 6.19-rc1 release.
There are no functional changes since v4.
The IRQF_NO_AUTOEN flag discussed in the v4 patch review was ultimately left unchanged.
It has been tested and confirmed to work without issues.
Please let us know if you have any questions or concerns.

v4->v5
 - Rebase to 6.19-rc1.
 - Add acked-by from Hanjun Guo.

v4: https://lore.kernel.org/all/20251017073935.1746365-1-fj1078ii@aa.jp.fujitsu.com/
v3->v4
 - Add a comment to the flags member.
 - Fix agdi_interrupt_probe.
 - Fix agdi_interrupt_remove.
 - Add space in struct initializsation.
 - Delete curly braces.

v3: https://lore.kernel.org/all/20250905042751.945616-1-fj1078ii@aa.jp.fujitsu.com/
v2->v3
 - Fix bug in the return value of agdi_probe function.
 - Remove unnecessary curly braces in the agdi_remove function.

v2: https://lore.kernel.org/all/20250829101154.2377800-1-fj1078ii@aa.jp.fujitsu.com/
v1->v2
 - Remove acpica update since there is no need to update define value
   for this patch.
---
 drivers/acpi/arm64/agdi.c | 114 +++++++++++++++++++++++++++++++++++---
 include/acpi/actbl2.h     |   4 +-
 2 files changed, 110 insertions(+), 8 deletions(-)

diff --git a/drivers/acpi/arm64/agdi.c b/drivers/acpi/arm64/agdi.c
index e0df3daa4abf..c514bb874c5d 100644
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
index f726bce3eb84..706699f3f294 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -340,7 +340,9 @@ struct acpi_table_agdi {
 
 /* Mask for Flags field above */
 
-#define ACPI_AGDI_SIGNALING_MODE (1)
+#define ACPI_AGDI_SIGNALING_MODE_MASK (3)
+#define ACPI_AGDI_SIGNALING_MODE_SDEI (0)
+#define ACPI_AGDI_SIGNALING_MODE_INTERRUPT (1)
 
 /*******************************************************************************
  *
-- 
2.43.0


