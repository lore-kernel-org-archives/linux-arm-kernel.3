Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87965C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QtYOwxhJTx1c2Lg+XxDXfdFoZZ1VSsrERd5VI5gDt44=; b=x43eGTT2eYfBOM7XgMOCh5BgqL
	JMRf4PtSvH8ZfMNrZCKtC14vK/w2Xtd0zMHFIXg64VSkMolNXV50xlbjCgeuTnMBBb7YBbo7ksW4y
	P3pIEOkIXtmmNl5ZayS4rgjuTndjttnsdZpBWybYPIHMdzk1N2JFYsmx7tsxV9PKHBCblE8veDs7F
	Ri9uoGOP5WrMMT8d8fkYpesCR3RQkT5ZAGx5csPa+IjNvF3d6X5WqyNu2QFyGvFFwfgEUyTd39rd1
	SbCdyF/YvXCPVjKvrxX8vyl1C02dHvY9lKxBj20hNOXl0HDIeqZ8Xvx/PG8P4KKLoB4f9zR8jCe+f
	LqqO8vYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tezRW-0000000G17G-44vg;
	Mon, 03 Feb 2025 16:37:02 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tezMN-0000000G01O-231H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 16:31:45 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5ECEBA0E6F;
	Mon,  3 Feb 2025 17:31:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=QtYOwxhJTx1c2Lg+XxDXfdFoZZ1VSsrERd5VI5gDt44=; b=
	jSafp3RFz7Ra9BwVl/pKUEynT3E7/l4NiLaliLgryZiWmxsLgzIFGUNzUdQ2CiYa
	JLiwItIZfq6Yrnn0MKarPVvo4m4qQZhUX+nzsTdF1WFTWRQQWyu/V3NkNiVv2B8l
	UWkPRdscvaBMee2YMXxA6eLluDcrOVcuHHOjXlIP8bGK/FSDlWGaGwviakevvOiC
	eKudxH0iUhOowd/Bd2XAhYFn4Jy+cjnkWATO7nQ/nIPnjA02/2zIYO8AAWyMMpNE
	6A9To7onpiUHF1FA5kwZTT9aavToSqGrO7ykKvy4ze8Hot1QuMpu435CdvRUdV/t
	4TjHQHroNNmArdsdRK5PlfnxpWFDTWOTnN1eP3FzsoKHZJyTJLXoB6muuss1rlcb
	AYhyFxGyKLmnHtpSd0nDiEhTl7KwIUkfJyF5146k68s+jGzo/09lk6R78LwecpkR
	HDbc+uHvk+wdJr2AZhbDEPEdogclvBYepRxdBdybTxpU+ij8IyVK/BjBi3Aw1I8p
	23yWESF/1rCNeSGE/HTzXO7TzoMJ0rWBoUKFdim9Jmc+FSaei5SYZO55SfuPObnd
	m86lAK85FzqM3Y+bkpO1MMkxBQ+C1bDbT5K80RB821Sc5nzfHxe49z/bIqSFFb5w
	Q5wq8uUy2TclIfZAFQJ/1h9dSp+iLjDzNv8YIDSfLQI=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v2 1/2] counter: microchip-tcb-capture: Add IRQ handling
Date: Mon, 3 Feb 2025 17:29:52 +0100
Message-ID: <20250203162955.102559-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1738600298;VERSION=7984;MC=2545913080;ID=183984;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852667064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_083143_994721_60B47246 
X-CRM114-Status: GOOD (  15.34  )
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

Add interrupt servicing to allow userspace to wait for a trigger event.

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---

Notes:
    New in v2

 drivers/counter/microchip-tcb-capture.c | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 2f096a5b973d..316755c7659a 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -6,10 +6,12 @@
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
 #include <soc/at91/atmel_tcb.h>
@@ -18,6 +20,8 @@
 				 ATMEL_TC_ETRGEDG_RISING | ATMEL_TC_LDBDIS | \
 				 ATMEL_TC_LDBSTOP)
 
+#define ATMEL_TC_DEF_IRQS	(ATMEL_TC_ETRGS | ATMEL_TC_COVFS)
+
 #define ATMEL_TC_QDEN			BIT(8)
 #define ATMEL_TC_POSEN			BIT(9)
 
@@ -27,6 +31,7 @@ struct mchp_tc_data {
 	int qdec_mode;
 	int num_channels;
 	int channel[2];
+	int irq;
 };
 
 static const enum counter_function mchp_tc_count_functions[] = {
@@ -294,6 +299,54 @@ static const struct of_device_id atmel_tc_of_match[] = {
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
+		counter_push_event(counter, COUNTER_EVENT_CHANGE_OF_STATE, 0);
+	if (sr & ATMEL_TC_COVFS)
+		counter_push_event(counter, COUNTER_EVENT_OVERFLOW, 0);
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
@@ -378,6 +431,13 @@ static int mchp_tc_probe(struct platform_device *pdev)
 	counter->num_signals = ARRAY_SIZE(mchp_tc_count_signals);
 	counter->signals = mchp_tc_count_signals;
 
+	priv->irq = of_irq_get(np->parent, 0);
+	if (priv->irq > 0) {
+		ret = mchp_tc_irq_enable(counter);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "Failed to set up IRQ");
+	}
+
 	ret = devm_counter_add(&pdev->dev, counter);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret, "Failed to add counter\n");
-- 
2.48.1



