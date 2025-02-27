Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B37C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7fmU8TJDq6KTOuPGSb8jkfqdk5VnvNn0zD+r2C2d+k=; b=eYSgNjt7rc7fLVzab+q8EIhcbH
	8znVmfWytT7tsDydDMnJtrhArlGCxg923JzUmOm/T3jvf2UtxwRiHOZ5MH/WYcJykuU4z94QSk3FB
	l/vhjT/sgyNk1Tku9yMJlkS8kR+IRDjaT4l2QYvNa7qWqS73zDAJ58RLiwHiYxb51tYiqWmrmuQ0z
	I9ZWFSjlcYGeO+yb9kCR/CevJKMzmyBcrRkFiiANtDso12aG+kGhkK3KUlDt2q7OXx+X5f316GJUV
	sWK746Q0M6XTRUuSVsy6G2+ne8zvhajGEqMgNaLxeaV7KE7QlwpSLwoHdYnnzTvOGrHay8me8afWw
	J2llZvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjh7-00000008Tir-2iLb;
	Thu, 27 Feb 2025 19:37:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf4b-00000007mu2-2peI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Feb 2025 14:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=d7fmU8TJDq6KTOuPGSb8jkfqdk5VnvNn0zD+r2C2d+k=; b=ol6tYN8SBccO16QYXX9993249k
	GuoCHgmYH5l5bg+VONt4YlAjyLzrGF49H74x0SEkoRAzcht+tKe73W7r3vQj4082Nv4RMfxhoQBWb
	U/yH4S5mEnEnB7cQ7T6HG58IK8Sd94k0yDVRLVzmAks+HusVbrpOdvK6CjjqLKhIbxzgNoJ4pq735
	Lbq/4Yzl9qJm4NWhBkDRLvrYlc2NKWy1Ccpj48PTe4pUK9gy7sLeAINAzsG6yZPQSmgNCdnrqOJXi
	fjhLMPhpzD5etanjK3zCpSxaQuOkD3jhfQvrNK7V+Y2k9zFaEgapVt0s85ZCHlfjyCQfb+uBPPkVi
	YhS11mRA==;
Received: from fw2.prolan.hu ([193.68.50.107])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf4Y-00000003oY8-3bPo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:41:12 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 7A905A0A38;
	Thu, 27 Feb 2025 15:41:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=d7fmU8TJDq6KTOuPGSb8
	jkfqdk5VnvNn0zD+r2C2d+k=; b=O1UizQKB3lDlHAEzczTGNJqqb/e8WZ14yN4w
	OsVBOvCIgun0meCOlpCdOZWbHXyS0v5KtkMGJn7YPrWo2rmLJNXrOTVY/h0d87m9
	B1Vh12ik53l98gAKJ+ydcaND0iUl9sFaShIVdn+uBkwXB5Tf0c4AxA1tfYrhzBTS
	D8ZmHwicOiQPjB+FjLG5Y3MqefWGej0Z5aspFTrvJTVe8jJy0FccBFbtC+jblaZD
	ojq1JSTfdYbl6eXzfAwvIcE64GIjPGCDnhIlASMsut2WnkKc4Yt1RYv4ehoBkpMN
	7TGRQsezvPcqVCpT7yUaDbxu5wPBLMwa7mCSv/P4jmlotr93V0gUSkP3n5X5PoSZ
	vQ3X2ipQODCGRq/5Pz2l4e6HR1LIamZzUgIdH5fYKcFDDDQ16IIE8Ry/7gPuGVwN
	pMWfv/b3FvzOzMIYo5VCRwwbdpggnfinylqUjYqp50DmFqEHuTj8LYVfkKren4Lx
	lg3hXP2xFXQ6ieK6V0cGmpO4+zRPwkh5CEB0X/OJSYN2ZW9iU5ZQ+rNa4WpPibLY
	/qdLSlh3Lz73fWatGHp/uOwLt2SHGYl6O0o1uPFCZm7yYQyewM/Fh8e2odFqbhM2
	5U+CBh4nNR9Dh9QCGQKBKaPrCBHPdPWfggi9KY2dCOT+wfPaWaFuzB3MGz9LYQ+8
	OrTfsPM=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v6 2/3] counter: microchip-tcb-capture: Add IRQ handling
Date: Thu, 27 Feb 2025 15:40:19 +0100
Message-ID: <20250227144023.64530-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227144023.64530-1-csokas.bence@prolan.hu>
References: <20250227144023.64530-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1740667260;VERSION=7985;MC=2154083884;ID=1452435;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852637760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_144111_049056_7AB6A882 
X-CRM114-Status: GOOD (  18.54  )
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

Add interrupt servicing to allow userspace to wait for the following events:
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

 drivers/counter/microchip-tcb-capture.c       | 75 +++++++++++++++++++
 .../linux/counter/microchip-tcb-capture.h     | 18 +++++
 2 files changed, 93 insertions(+)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 2f096a5b973d..cc12c2e2113a 100644
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
 
@@ -27,6 +33,7 @@ struct mchp_tc_data {
 	int qdec_mode;
 	int num_channels;
 	int channel[2];
+	int irq;
 };
 
 static const enum counter_function mchp_tc_count_functions[] = {
@@ -294,6 +301,65 @@ static const struct of_device_id atmel_tc_of_match[] = {
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
+static int mchp_tc_irq_enable(struct counter_device *const counter)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+	int ret = devm_request_irq(counter->parent, priv->irq, mchp_tc_isr, 0,
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
@@ -378,6 +444,15 @@ static int mchp_tc_probe(struct platform_device *pdev)
 	counter->num_signals = ARRAY_SIZE(mchp_tc_count_signals);
 	counter->signals = mchp_tc_count_signals;
 
+	priv->irq = of_irq_get(np->parent, 0);
+	if (priv->irq == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+	if (priv->irq > 0) {
+		ret = mchp_tc_irq_enable(counter);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "Failed to set up IRQ");
+	}
+
 	ret = devm_counter_add(&pdev->dev, counter);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret, "Failed to add counter\n");
diff --git a/include/uapi/linux/counter/microchip-tcb-capture.h b/include/uapi/linux/counter/microchip-tcb-capture.h
index 7bda5fdef19b..ee72f1463594 100644
--- a/include/uapi/linux/counter/microchip-tcb-capture.h
+++ b/include/uapi/linux/counter/microchip-tcb-capture.h
@@ -12,6 +12,17 @@
  * Count 0
  * \__  Synapse 0 -- Signal 0 (Channel A, i.e. TIOA)
  * \__  Synapse 1 -- Signal 1 (Channel B, i.e. TIOB)
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
  */
 
 enum counter_mchp_signals {
@@ -19,4 +30,11 @@ enum counter_mchp_signals {
 	COUNTER_MCHP_SIG_TIOB,
 };
 
+enum counter_mchp_event_channels {
+	COUNTER_MCHP_EVCHN_CV = 0,
+	COUNTER_MCHP_EVCHN_RA = 0,
+	COUNTER_MCHP_EVCHN_RB,
+	COUNTER_MCHP_EVCHN_RC,
+};
+
 #endif /* _UAPI_COUNTER_MCHP_TCB_H_ */
-- 
2.48.1



