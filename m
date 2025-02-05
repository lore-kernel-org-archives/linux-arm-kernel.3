Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE046C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 10:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spcugB6t6p78x878lmlqUL8jciWNu5Mk1BUINRx7Dfc=; b=BRuzIluIPbp0cbtmyd0unf0ysg
	vvZE3LjYZl/xnVFYYva396Wx/Sco6xGYGAS2H27IldylU2WFVjAVtXw8Ba8h3Z5I0NLH0RqExVV6I
	BBn6C7ZwE28j/OEr6Zx6DyCB+0fbGvSQQjGC742OejrCuAQ5TaxExb6w4BxwbsV4zSOMVyWzKnAMM
	rDEoI6I1PQeLzjH0muOMdZhauQFQQuaeg/2lFpDKfQ6UkL8NnDpbzjyUCl3fmC2SGqEOJ0LG6X9og
	ip56y2ZNHIpGnBJT/2NjzVHXHUFrNVNv+E+VSYNZoIar9hmzqVqk7sS8TZ25CrBK+LMjfasNlkXDV
	oTR4Fbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfd0D-00000002wwm-2g1B;
	Wed, 05 Feb 2025 10:51:29 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcyq-00000002wkj-1LxV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 10:50:05 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id ADD9BA037B;
	Wed,  5 Feb 2025 11:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=spcugB6t6p78x878lmlq
	UL8jciWNu5Mk1BUINRx7Dfc=; b=YPaTCIhdnLydCfO6rCc/SmKW7gJAUJ3DinjO
	XLgsi3pfr6P0N+3lnghvktG7yuuu1ESnlf6JPFRhEPTt8BFmTM5E99W0I+s51cPP
	xScZsc8XRfrKvXkvWtky1+O6eBGkzRwZ73LV8Goj5Wsgi3SMY5JlLS7etHMsU0yV
	KpCpgGDYwqANtYm4O2QNMvpnyNmcDKlMEH+2MM2UlqbYuXjFK6B2kPHAZDTNq+Tr
	g5nVBxpuU9hd3cFFy3bVfyytIyMje8YAG5UQDV/IAqV0kTia2kBOvj7HLj7PfoEG
	G3udsarQqxMIxN/+dSf+4Fjhpl/FDVFTseIgmnwXukSG5KBEhNY4frlSzPBKeGXY
	h83VIkX/qAPKhQDdIT/1J0iAcBQ8ejQ/5OSXAMrymrmuqH9r5fBoF0vccCIJPBdx
	lCMKlJMfcgsiiz0tJ3KGgnhzQp0+bCP47IyxTJ0C5O/C5dk+T+UhHvQf+OZcjmiL
	2AUDNLo0l4s5CH07GXtqxf0n0MRz8hTKrnzrXq7Wl8LiUs2A//t3xMHsm+SyJjBa
	TdwQOaAxPekWXnchNPyz5L/CPfg8eWn6MnkIH8unDDeKuG8uPsOknwn6rAUMN5OE
	UGUitADqQW/PoL3lAze65x7/6D49Rk5egcdbywyMxYBllj7lwTM4RoushY8nbvL1
	5Z1hEqo=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v3 1/2] counter: microchip-tcb-capture: Add IRQ handling
Date: Wed, 5 Feb 2025 11:49:53 +0100
Message-ID: <20250205104957.95236-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250205104957.95236-1-csokas.bence@prolan.hu>
References: <20250205104957.95236-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1738752601;VERSION=7985;MC=1293086803;ID=233956;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852667264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_025004_543447_16254DFC 
X-CRM114-Status: GOOD (  16.82  )
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

 drivers/counter/microchip-tcb-capture.c | 67 +++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 2f096a5b973d..fef4bb69b486 100644
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
@@ -18,6 +20,9 @@
 				 ATMEL_TC_ETRGEDG_RISING | ATMEL_TC_LDBDIS | \
 				 ATMEL_TC_LDBSTOP)
 
+#define ATMEL_TC_DEF_IRQS	(ATMEL_TC_ETRGS | ATMEL_TC_COVFS | \
+				 ATMEL_TC_LDRAS | ATMEL_TC_LDRBS | ATMEL_TC_CPCS)
+
 #define ATMEL_TC_QDEN			BIT(8)
 #define ATMEL_TC_POSEN			BIT(9)
 
@@ -27,6 +32,7 @@ struct mchp_tc_data {
 	int qdec_mode;
 	int num_channels;
 	int channel[2];
+	int irq;
 };
 
 static const enum counter_function mchp_tc_count_functions[] = {
@@ -294,6 +300,60 @@ static const struct of_device_id atmel_tc_of_match[] = {
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
+	if (sr & ATMEL_TC_LDRAS)
+		counter_push_event(counter, COUNTER_EVENT_CAPTURE, 0);
+	if (sr & ATMEL_TC_LDRBS)
+		counter_push_event(counter, COUNTER_EVENT_CAPTURE, 1);
+	if (sr & ATMEL_TC_CPCS)
+		counter_push_event(counter, COUNTER_EVENT_THRESHOLD, 2);
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
@@ -378,6 +438,13 @@ static int mchp_tc_probe(struct platform_device *pdev)
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



