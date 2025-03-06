Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19172C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLk06+greqV0MrWizgfVlU/n7X6aL6nrTao414/zYCA=; b=gJFdr3BcvNvep+FVYUALgJAsHx
	w7jZrZ6E/BLqiVHzPYI+IHrQ3BsfHvW/DYe3HoFykW4bEceWHgOiALWVMb22XxuBlzmGUhVI9h9YH
	GW01nBbE7MzpHKxkZMTkGVg9Xr0x7FFSzwdhxitZXKcDC0fQ0LSnHKRG03EGYrIoUYKfsPO+QcuGU
	YSWWdlMRmMlsKq+HscRHZCIhADFLxAGeMLJj7K2EB1dLBVBFgFCZbWiJBwAGnkDyNKQIvFKRasDzg
	79HxerOWwi6Vjtaou6Gjfc+bHzrS793NXFO2BIZ9Gs6k47YL+X7vhUqaNBUWUVTZ+VuGHb4sKIxLx
	Flgiiy2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBfU-0000000B7FT-2cHq;
	Thu, 06 Mar 2025 13:53:44 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBWy-0000000B5jR-0mhp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 13:44:58 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A4B5AA0758;
	Thu,  6 Mar 2025 14:44:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=kLk06+greqV0MrWizgfV
	lU/n7X6aL6nrTao414/zYCA=; b=gKmBk/U57dc0fCIusykJmOIYai1ewqSjQDcD
	rc63IyeLPS54O38U5DH94/KeYlzu8Ed4w90HhO5NJzRYr7kdjC7AnRe/DNLaNhxK
	MXeDuuBt/6LHLyxzZ9bYO2e3z4YSAIhuqAxIZ76w/a8u5L1fqjlc7hmBSVY1+uI5
	WIl4ASd0IgMGozNOWDD1f+ePw21PtH1ytdv0gv0DQqYADMVJlsndMlRDfYXmxx1T
	Bo4BV4bGbkAhfHTRJ0QVC6p7QgwoEvGl5Wfrqtv0/P8Iz7CRmMxzYcWhg7PxbzAV
	wboHiIlezBXccUFy8mPPU6ei5fLGpob3ATaZG5YoaEannANirtNb9M4A0PNPdkOg
	SUqZ+r+Nao0i2y2bhBwFAT8AGzpiKuPUsLYFEn9E4ls32O0uoghqB+i2Aj8+aPt8
	LiSqQeqVS32aExZwwWQUK54XI6MNg1TTVhJTKVmMUPQMmNxZ/whzseE01Nxy/Ijr
	hRDyAbJe/4yiGgM+cKShaqgv77FMbpa0BInZkZvMe19xcTmIZqxoHaQKcd4YWm9y
	eosZyzGW2XY3KffoDUDMy8qExO64DR6bVzAd3swqXuufUzvOdA0401nzIIklRXRs
	MscZs78hp0dp4DiivqfBndV846TvMWujVDxqYcTybFmqrXORg/tO2j56VWtujOtt
	v1Y7Jxw=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-iio@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v8 1/2] counter: microchip-tcb-capture: Add IRQ handling
Date: Thu, 6 Mar 2025 14:44:36 +0100
Message-ID: <20250306134441.582819-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306134441.582819-1-csokas.bence@prolan.hu>
References: <20250306134441.582819-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1741268684;VERSION=7985;MC=3654015039;ID=1566296;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637C6A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_054456_655697_F71DD3DF 
X-CRM114-Status: GOOD (  23.69  )
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

Add interrupt servicing to allow userspace to wait for the following:
* Change-of-state caused by external trigger
* Capture of timer value into RA/RB
* Compare to RC register
* Overflow

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---

Notes:
    New in v2
    Changes in v3:
    * Add IRQs for Capture events (from next patch)
    * Add IRQ for RC Compare
    * Add events as bullet points to commit msg
    Changes in v4:
    * Add uapi header, names for the event channels
    * Add check for -EPROBE_DEFER from `of_irq_get()`
    Changes in v5:
    * Split out UAPI header introduction
    Changes in v7:
    * Revert split-out
    * Drop `enum counter_mchp_signals` from UAPI
    * Change enums to #define's in UAPI header
    Changes in v8:
    * Remove `priv->irq` and replace with function arg

 MAINTAINERS                                   |  1 +
 drivers/counter/microchip-tcb-capture.c       | 74 +++++++++++++++++++
 .../linux/counter/microchip-tcb-capture.h     | 34 +++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 include/uapi/linux/counter/microchip-tcb-capture.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e047e20fbd8..d1d264210690 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15579,6 +15579,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	drivers/counter/microchip-tcb-capture.c
+F:	include/uapi/linux/counter/microchip-tcb-capture.h
 
 MICROCHIP USB251XB DRIVER
 M:	Richard Leitner <richard.leitner@skidata.com>
diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 2f096a5b973d..16707099bd69 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -6,18 +6,24 @@
  */
 #include <linux/clk.h>
 #include <linux/counter.h>
+#include <linux/interrupt.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <uapi/linux/counter/microchip-tcb-capture.h>
 #include <soc/at91/atmel_tcb.h>
 
 #define ATMEL_TC_CMR_MASK	(ATMEL_TC_LDRA_RISING | ATMEL_TC_LDRB_FALLING | \
 				 ATMEL_TC_ETRGEDG_RISING | ATMEL_TC_LDBDIS | \
 				 ATMEL_TC_LDBSTOP)
 
+#define ATMEL_TC_DEF_IRQS	(ATMEL_TC_ETRGS | ATMEL_TC_COVFS | \
+				 ATMEL_TC_LDRAS | ATMEL_TC_LDRBS | ATMEL_TC_CPCS)
+
 #define ATMEL_TC_QDEN			BIT(8)
 #define ATMEL_TC_POSEN			BIT(9)
 
@@ -294,6 +300,65 @@ static const struct of_device_id atmel_tc_of_match[] = {
 	{ /* sentinel */ }
 };
 
+static irqreturn_t mchp_tc_isr(int irq, void *dev_id)
+{
+	struct counter_device *const counter = dev_id;
+	struct mchp_tc_data *const priv = counter_priv(counter);
+	u32 sr, mask;
+
+	regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], SR), &sr);
+	regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], IMR), &mask);
+
+	sr &= mask;
+	if (!(sr & ATMEL_TC_ALL_IRQ))
+		return IRQ_NONE;
+
+	if (sr & ATMEL_TC_ETRGS)
+		counter_push_event(counter, COUNTER_EVENT_CHANGE_OF_STATE,
+				   COUNTER_MCHP_EVCHN_CV);
+	if (sr & ATMEL_TC_LDRAS)
+		counter_push_event(counter, COUNTER_EVENT_CAPTURE,
+				   COUNTER_MCHP_EVCHN_RA);
+	if (sr & ATMEL_TC_LDRBS)
+		counter_push_event(counter, COUNTER_EVENT_CAPTURE,
+				   COUNTER_MCHP_EVCHN_RB);
+	if (sr & ATMEL_TC_CPCS)
+		counter_push_event(counter, COUNTER_EVENT_THRESHOLD,
+				   COUNTER_MCHP_EVCHN_RC);
+	if (sr & ATMEL_TC_COVFS)
+		counter_push_event(counter, COUNTER_EVENT_OVERFLOW,
+				   COUNTER_MCHP_EVCHN_CV);
+
+	return IRQ_HANDLED;
+}
+
+static void mchp_tc_irq_remove(void *ptr)
+{
+	struct mchp_tc_data *priv = ptr;
+
+	regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], IDR), ATMEL_TC_DEF_IRQS);
+}
+
+static int mchp_tc_irq_enable(struct counter_device *const counter, int irq)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+	int ret = devm_request_irq(counter->parent, irq, mchp_tc_isr, 0,
+				   dev_name(counter->parent), counter);
+
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], IER), ATMEL_TC_DEF_IRQS);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_add_action_or_reset(counter->parent, mchp_tc_irq_remove, priv);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static void mchp_tc_clk_remove(void *ptr)
 {
 	clk_disable_unprepare((struct clk *)ptr);
@@ -378,6 +443,15 @@ static int mchp_tc_probe(struct platform_device *pdev)
 	counter->num_signals = ARRAY_SIZE(mchp_tc_count_signals);
 	counter->signals = mchp_tc_count_signals;
 
+	i = of_irq_get(np->parent, 0);
+	if (i == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+	if (i > 0) {
+		ret = mchp_tc_irq_enable(counter, i);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "Failed to set up IRQ");
+	}
+
 	ret = devm_counter_add(&pdev->dev, counter);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret, "Failed to add counter\n");
diff --git a/include/uapi/linux/counter/microchip-tcb-capture.h b/include/uapi/linux/counter/microchip-tcb-capture.h
new file mode 100644
index 000000000000..f3ef315fe9f6
--- /dev/null
+++ b/include/uapi/linux/counter/microchip-tcb-capture.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Channel numbers used by the microchip-tcb-capture driver
+ * Copyright (C) 2025 Bence Csókás
+ */
+#ifndef _UAPI_COUNTER_MCHP_TCB_H_
+#define _UAPI_COUNTER_MCHP_TCB_H_
+
+/*
+ * The driver defines the following components:
+ *
+ * Count 0
+ * \__  Synapse 0 -- Signal 0 (Channel A, i.e. TIOA)
+ * \__  Synapse 1 -- Signal 1 (Channel B, i.e. TIOB)
+ *
+ * It also supports the following events:
+ *
+ * Channel 0:
+ * - CV register changed
+ * - CV overflowed
+ * - RA captured
+ * Channel 1:
+ * - RB captured
+ * Channel 2:
+ * - RC compare triggered
+ */
+
+/* Event channels */
+#define COUNTER_MCHP_EVCHN_CV 0
+#define COUNTER_MCHP_EVCHN_RA 0
+#define COUNTER_MCHP_EVCHN_RB 1
+#define COUNTER_MCHP_EVCHN_RC 2
+
+#endif /* _UAPI_COUNTER_MCHP_TCB_H_ */
-- 
2.48.1



