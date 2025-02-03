Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7224C02197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 16:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HK4s81J1k83QEgvXWPtd0kbv6ClLvjUueZlqzkVxOI8=; b=DiqGY/eXaLKbRp+AqcPacwNOqP
	RCya+mo5LW/hmN/Mv4ak+uzNISnKZ525ecPANuNQr0GhcCzSn0e/7y1qPVxURTmlCt03xCZa6QtXr
	v7f6hwmihfRTcr/ncOqnQZNv9uQSj9Gxpeya68aC1r22B2oqLkDnBjGcebhTIr9Any7dhu/q3wy4V
	2N9N+6udPuUYwavd7L56IiMqwhrwuRkbiz9/nGhs6ZwJwTpsgYYTSEIjwnOKr3LaPWm2XZ6qfQpiQ
	QbcNKaqhziJ+5p5fFzpyylgqu7hQEj0IE36BI+xHzC14j7wITWFdgBFAAa9VYPMAuMgqmNJfJS4bD
	jGYaGoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tezSo-0000000G1K6-2bFl;
	Mon, 03 Feb 2025 16:38:22 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tezMN-0000000G01f-23DD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 16:31:45 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 6E7D2A0E19;
	Mon,  3 Feb 2025 17:31:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=HK4s81J1k83QEgvXWPtd
	0kbv6ClLvjUueZlqzkVxOI8=; b=idGHTcRQINOpTLzJwksjtJJDi4dieWUuSG+v
	gcYcbDKv3TiaHEIYmC8rW+iFS3oCDIoFtIQVHBbySXMk0P3SoFYMs48c1Uj/uSYl
	EhqmTJ2pzfVLYzuY5flTsnmT8kXNTKlWYsjBmI1PrApj6FTlcy+Z+ywEc0i4qEIR
	6ydIRymdwJ/NBCEvAXb/gr6mrRUBoUIYzsOfnv7JB1eEt/9AWXa5D/VvVbHT03X+
	XgnIat6UDbOb5e7WRc1TfzJglnxk1EVvbFvqCrIOObME6yaawX473zbWHWvtb7aJ
	+nmKygQTiK9lwl/saAvKQUFb0jxnYN+GQgXnQiRDTXi5Kzv1cC4oorjKy/g9Ou44
	sysmA3h7PDW8iWC1npMiTL92dDSl3ELQQSvmWjOo4ZUciME/bUeWh5b8pqQ6C+LL
	yqGlrSHhNNTV1PFDIGYl+BiopL5XC6iqKnzpjH7sLiuZZFXl1AIIofdzuWKmqSjG
	tCQCJzhkKVLiiTELy0Dc8ZpdtyT9MIMx3EifRMvST/VNT1ZCTYT0/rVG/3EP95P4
	kFGsZw1RAxzAefT4tJgKDtYB4dSlbfbRysX343AP0oBoZz+9qwFtjxxiv3SO8+R3
	i6PTgG5SNEePWOrisksBSj9qceUxmy8Ma20F00okcxUax2Eee/x8FY4PXjArzMWV
	cfs0OF8=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v2 2/2] counter: microchip-tcb-capture: Add capture extensions for registers RA-RC
Date: Mon, 3 Feb 2025 17:29:53 +0100
Message-ID: <20250203162955.102559-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203162955.102559-1-csokas.bence@prolan.hu>
References: <20250203162955.102559-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1738600299;VERSION=7984;MC=3773513757;ID=183986;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852667064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_083144_002030_298433F0 
X-CRM114-Status: GOOD (  13.59  )
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

TCB hardware is capable of capturing the timer value to registers RA and
RB. On top, it is capable of triggering on compare against a third
register, RC. Add these registers as extensions.

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/counter/microchip-tcb-capture.c | 65 ++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 316755c7659a..a25b54493c7f 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -20,7 +20,8 @@
 				 ATMEL_TC_ETRGEDG_RISING | ATMEL_TC_LDBDIS | \
 				 ATMEL_TC_LDBSTOP)
 
-#define ATMEL_TC_DEF_IRQS	(ATMEL_TC_ETRGS | ATMEL_TC_COVFS)
+#define ATMEL_TC_DEF_IRQS	(ATMEL_TC_ETRGS | ATMEL_TC_COVFS | \
+				 ATMEL_TC_LDRAS | ATMEL_TC_LDRBS)
 
 #define ATMEL_TC_QDEN			BIT(8)
 #define ATMEL_TC_POSEN			BIT(9)
@@ -252,6 +253,62 @@ static int mchp_tc_count_read(struct counter_device *counter,
 	return 0;
 }
 
+static int mchp_tc_count_cap_read(struct counter_device *counter,
+				  struct counter_count *count, size_t idx, u64 *val)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+	u32 cnt;
+
+	switch (idx) {
+	case 0:
+		regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RA), &cnt);
+		break;
+	case 1:
+		regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RB), &cnt);
+		break;
+	case 2:
+		regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RC), &cnt);
+		break;
+	default:
+		return -EINVAL;
+	}
+	*val = cnt;
+
+	return 0;
+}
+
+static int mchp_tc_count_cap_write(struct counter_device *counter,
+				   struct counter_count *count, size_t idx, u64 val)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+
+	if (val > U32_MAX)
+		return -ERANGE;
+
+	switch (idx) {
+	case 0:
+		regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RA), val);
+		break;
+	case 1:
+		regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RB), val);
+		break;
+	case 2:
+		regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RC), val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static DEFINE_COUNTER_ARRAY_CAPTURE(mchp_tc_cnt_cap_array, 3);
+
+static struct counter_comp mchp_tc_count_ext[] = {
+	COUNTER_COMP_ARRAY_CAPTURE(mchp_tc_count_cap_read, mchp_tc_count_cap_write,
+				   mchp_tc_cnt_cap_array),
+};
+
 static struct counter_count mchp_tc_counts[] = {
 	{
 		.id = 0,
@@ -260,6 +317,8 @@ static struct counter_count mchp_tc_counts[] = {
 		.num_functions = ARRAY_SIZE(mchp_tc_count_functions),
 		.synapses = mchp_tc_count_synapses,
 		.num_synapses = ARRAY_SIZE(mchp_tc_count_synapses),
+		.ext = mchp_tc_count_ext,
+		.num_ext = ARRAY_SIZE(mchp_tc_count_ext),
 	},
 };
 
@@ -314,6 +373,10 @@ static irqreturn_t mchp_tc_isr(int irq, void *dev_id)
 
 	if (sr & ATMEL_TC_ETRGS)
 		counter_push_event(counter, COUNTER_EVENT_CHANGE_OF_STATE, 0);
+	if (sr & ATMEL_TC_LDRAS)
+		counter_push_event(counter, COUNTER_EVENT_CAPTURE, 0);
+	if (sr & ATMEL_TC_LDRBS)
+		counter_push_event(counter, COUNTER_EVENT_CAPTURE, 1);
 	if (sr & ATMEL_TC_COVFS)
 		counter_push_event(counter, COUNTER_EVENT_OVERFLOW, 0);
 
-- 
2.48.1



