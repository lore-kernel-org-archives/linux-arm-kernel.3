Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9224BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SOYtw5N8V1W/8HjyEXXVA2dBh8//SmboKULJ8eZ2dw=; b=JvNNUrCbS7tos9cYU1n4ER9L8y
	SBWOuXeWVsW2zfbA87gU8z5IO4gb2d4y9uBv518McJAkBViQ1ASPJYkbMzZqwK7lQtd2Yk9obCxLT
	4VrRpIQ2DCggIjJE9ec26VuvTaHa05GDIFedFnBdOlxSlgBvuuNkEyUTM6VRAtdCrq8h9Evz/kx30
	6MCbjo1g0SfxpNnk+I2jRp/wC+4KZCoYmdmyhPL5g2uQT3pkJA9FaFY63Ux56fJh2Wcn11L1ISVin
	lFDzhVX2u99vZsv7H4w0R+jkuicGo+ew5pNYpqw+vD2HlX6ckDlJNhiGC6MwUjTo9c2FM104bL4uy
	7y6iRoQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5Dg-0000000622B-1ScH;
	Tue, 24 Jun 2025 15:05:56 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45B-00000005n1p-41EY;
	Tue, 24 Jun 2025 13:53:07 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-553b51f5218so451207e87.0;
        Tue, 24 Jun 2025 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773184; x=1751377984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SOYtw5N8V1W/8HjyEXXVA2dBh8//SmboKULJ8eZ2dw=;
        b=Ux3PVPB2RJHmdUBrGxMIER5a4WpEKEu8OhW5HGTuKGyg+HGPIq2uYsIWPMIhYBpvlA
         9lvpNMgpPMZZrbKX4HvJcsMbIuwxg3usyAa/hEZcXCog5pvgYNT6/wGWDYL5kqDLUt+8
         08AHtj9/C4nqziFUTZ1j7qDI+AfG6hRJgR1hLHjEo0IXuqnYf/3qtO2QxR7LsnrK25eG
         DMMmc+bO7k6nF+RbvAJJJ7MvscUpXEq5YHcRNE6G7QSIo2vy/20g37kWZ9pc1N2j3VYb
         /qFLDGZ4fIp9zAfFLx+m67tkRQvSSxGnxR09jzWp2m0nw5N84s61Yol0Np/Ew5g+xlmq
         7Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773184; x=1751377984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SOYtw5N8V1W/8HjyEXXVA2dBh8//SmboKULJ8eZ2dw=;
        b=HE73iRhonCT9WqrO8/4cC+8puIKVJV5BlQ8hOckQV19jic3nN0qFQUhUKSYfGpEerZ
         B+RvX5EukKDiWOOA5ChsfDnzX/Fhjjh+94irWuT6eMJBH3lTnHCcfB5UJWj/fWHzT6aP
         GcYwHs7uF/FXUTgtD4zAxhKtzNSXN2+T6Ao9jcGj/IOSdLdrO1kWFbB7jHeVIqauhtcZ
         omzD61/C3FUQ1Qaipq8mk4KJ6bczH/FtrloK3So1FlHwh9PcmuEoAeUO+uOHBOpsWAA7
         z5HiB31A0UGo5IezF3gHGatfUUp26bpuA/08IseZHNmL14nfg0berBlrXab/+Qn/jkqg
         7j0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFjwLlPbP85s+x5fYT+kvgak2yFAFFHVwNEbFxwg6aLItQ9uC5wPd+Oo14eDVFGT8p9IeAnS+mLcxj0dDhc7+uZw==@lists.infradead.org, AJvYcCW1Jjryh3fNfC7iznkj6UueV+PsomTgcNwc/6X4RKgIKxcy3DNFbhJ+2JZ8DB/KTaRvuXSn5ytgUm8uGpfZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5dcfwXQZ6DSx+567GDOGx7koubVeEKC9VoG7YThRcQjaKi3dJ
	2Bql6d3kGBxgxV17z83q7tcDy4XuqqkvoiltcyxxZrMLUpbAxAJKrrox
X-Gm-Gg: ASbGncuvH3nNQhZBd3YJJXYyxY1GT3rj4aLmNEsL++R/7BKlxUh9J7reM4Lb39RUior
	eItOdzpborxz1c39F40M4J/9c6olOltlH5hUo/2MzxpvBuUls8K5udW0uS7B+ROASR+GaOTa2PA
	p01Mig7JM1s182uUJ508J+XOcI8K4QAzwo++gvonJh7WwWXq2kv2otqb7OSdx4IIFt4FodvcesU
	WPt7lOOIAtvXl/RyCmtfz6E/umdz87s7OF7a/Sy4rngHXAOcEMt6faTR6FhUuBOi6ary3Jk5MUs
	+ks7wo0xXSdv8U/jR2Q5mmjjcdvDLEVjsddm6tSP6UN+6o70T60j9ChFKAAKjpc4ylwB8Jk03/m
	v39indUvg7FARwObQ6Vl+oOtmuM89ledIgJzuCYqhpu4rMRmaZZ+iOcIukRBtGN/rjD8F6suS
X-Google-Smtp-Source: AGHT+IE12D8YIPSuzd8ZFmyOV+t4aSAtt702FpdsVE+qQZhOojJTiEYmpgrPUspu2EzIEcL1+cnh3w==
X-Received: by 2002:ac2:5f61:0:b0:554:f74b:78c1 with SMTP id 2adb3069b0e04-554f74b7c00mr680882e87.43.1750773183947;
        Tue, 24 Jun 2025 06:53:03 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:03 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 01/22] crypto: amlogic - Don't hardcode IRQ count
Date: Tue, 24 Jun 2025 16:51:53 +0300
Message-Id: <20250624135214.1355051-2-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065305_997986_12FC3D65 
X-CRM114-Status: GOOD (  21.16  )
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

IRQ count is no longer hardcoded, and make it part of
struct meson_flow. We need this for extend driver support for
other Amlogic SoC's.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 47 ++++++++++++---------
 drivers/crypto/amlogic/amlogic-gxl.h        |  8 ++--
 3 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 29048da6f50a..b19032f92415 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -19,7 +19,7 @@
 
 static int get_engine_number(struct meson_dev *mc)
 {
-	return atomic_inc_return(&mc->flow) % MAXFLOW;
+	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
 }
 
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 1c18a5b8470e..dc35d7304eb0 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -28,8 +28,8 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 	int flow;
 	u32 p;
 
-	for (flow = 0; flow < MAXFLOW; flow++) {
-		if (mc->irqs[flow] == irq) {
+	for (flow = 0; flow < mc->flow_cnt; flow++) {
+		if (mc->chanlist[flow].irq == irq) {
 			p = readl(mc->base + ((0x04 + flow) << 2));
 			if (p) {
 				writel_relaxed(0xF, mc->base + ((0x4 + flow) << 2));
@@ -110,7 +110,7 @@ static int meson_debugfs_show(struct seq_file *seq, void *v)
 	struct meson_dev *mc __maybe_unused = seq->private;
 	int i;
 
-	for (i = 0; i < MAXFLOW; i++)
+	for (i = 0; i < mc->flow_cnt; i++)
 		seq_printf(seq, "Channel %d: nreq %lu\n", i,
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 			   mc->chanlist[i].stat_req);
@@ -153,14 +153,32 @@ static void meson_free_chanlist(struct meson_dev *mc, int i)
  */
 static int meson_allocate_chanlist(struct meson_dev *mc)
 {
+	struct platform_device *pdev = to_platform_device(mc->dev);
 	int i, err;
 
-	mc->chanlist = devm_kcalloc(mc->dev, MAXFLOW,
+	mc->flow_cnt = platform_irq_count(pdev);
+	if (mc->flow_cnt <= 0) {
+		dev_err(mc->dev, "No IRQs defined\n");
+		return -ENODEV;
+	}
+
+	mc->chanlist = devm_kcalloc(mc->dev, mc->flow_cnt,
 				    sizeof(struct meson_flow), GFP_KERNEL);
 	if (!mc->chanlist)
 		return -ENOMEM;
 
-	for (i = 0; i < MAXFLOW; i++) {
+	for (i = 0; i < mc->flow_cnt; i++) {
+		mc->chanlist[i].irq = platform_get_irq(pdev, i);
+		if (mc->chanlist[i].irq < 0)
+			return mc->chanlist[i].irq;
+
+		err = devm_request_irq(mc->dev, mc->chanlist[i].irq,
+				       meson_irq_handler, 0, "aml-crypto", mc);
+		if (err < 0) {
+			dev_err(mc->dev, "Cannot request IRQ for flow %d\n", i);
+			return err;
+		}
+
 		init_completion(&mc->chanlist[i].complete);
 
 		mc->chanlist[i].engine = crypto_engine_alloc_init(mc->dev, true);
@@ -230,7 +248,7 @@ static void meson_unregister_algs(struct meson_dev *mc)
 static int meson_crypto_probe(struct platform_device *pdev)
 {
 	struct meson_dev *mc;
-	int err, i;
+	int err;
 
 	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
 	if (!mc)
@@ -250,19 +268,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	for (i = 0; i < MAXFLOW; i++) {
-		mc->irqs[i] = platform_get_irq(pdev, i);
-		if (mc->irqs[i] < 0)
-			return mc->irqs[i];
-
-		err = devm_request_irq(&pdev->dev, mc->irqs[i], meson_irq_handler, 0,
-				       "gxl-crypto", mc);
-		if (err < 0) {
-			dev_err(mc->dev, "Cannot request IRQ for flow %d\n", i);
-			return err;
-		}
-	}
-
 	err = clk_prepare_enable(mc->busclk);
 	if (err != 0) {
 		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
@@ -292,7 +297,7 @@ static int meson_crypto_probe(struct platform_device *pdev)
 error_alg:
 	meson_unregister_algs(mc);
 error_flow:
-	meson_free_chanlist(mc, MAXFLOW - 1);
+	meson_free_chanlist(mc, mc->flow_cnt - 1);
 	clk_disable_unprepare(mc->busclk);
 	return err;
 }
@@ -307,7 +312,7 @@ static void meson_crypto_remove(struct platform_device *pdev)
 
 	meson_unregister_algs(mc);
 
-	meson_free_chanlist(mc, MAXFLOW - 1);
+	meson_free_chanlist(mc, mc->flow_cnt - 1);
 
 	clk_disable_unprepare(mc->busclk);
 }
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index d68094ffb70a..9f1ef87333ae 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -22,8 +22,6 @@
 #define MESON_OPMODE_ECB 0
 #define MESON_OPMODE_CBC 1
 
-#define MAXFLOW 2
-
 #define MAXDESC 64
 
 #define DESC_LAST BIT(18)
@@ -62,6 +60,7 @@ struct meson_desc {
  * @keylen:	keylen for this flow operation
  * @complete:	completion for the current task on this flow
  * @status:	set to 1 by interrupt if task is done
+ * @irq:	IRQ number for amlogic-crypto
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
  * @stat_req:	number of request done by this flow
@@ -70,6 +69,7 @@ struct meson_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
 	int status;
+	int irq;
 	unsigned int keylen;
 	dma_addr_t t_phy;
 	struct meson_desc *tl;
@@ -85,7 +85,7 @@ struct meson_flow {
  * @dev:	the platform device
  * @chanlist:	array of all flow
  * @flow:	flow to use in next request
- * @irqs:	IRQ numbers for amlogic-crypto
+ * @flow_cnt:	flow count for amlogic-crypto
  * @dbgfs_dir:	Debugfs dentry for statistic directory
  * @dbgfs_stats: Debugfs dentry for statistic counters
  */
@@ -95,7 +95,7 @@ struct meson_dev {
 	struct device *dev;
 	struct meson_flow *chanlist;
 	atomic_t flow;
-	int irqs[MAXFLOW];
+	int flow_cnt;
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 	struct dentry *dbgfs_dir;
 #endif
-- 
2.34.1


