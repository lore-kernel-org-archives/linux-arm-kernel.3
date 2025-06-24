Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2478C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzoQtJ2+Gby/Cw80qh1dP5yN37TDjaDpOb4iIQblBnY=; b=NBi5JOFQxF11iHYx00TlcjTQD+
	Usxm3NA7oxLbp6AMZI9/YKWTST4V7XT8BTin3r0gexaQuLkIBun/53Vtv+O005xM2tn/7C+Pnweks
	9lHdueUQjjShd2eBAzclb+W/y4xMWJX5P555r2olV37uB5wbV+9VNEpQBshUJISYJx7lYQJUp6Bkt
	0nz92o+6q1hTFX+gooBzRXYqQ5RrqC3XCyMlUd0qLooUcvD27GwTta5NNOn2EbCBoqkjDGAqcmT5O
	ElT3Vk56k3Vc5renN/TxEenayvDNlxJO1sVD5C8jXBdiq6POUkcjrXSCN0qXtGRkn+XG//OKBIbP3
	Pp7MwjMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5Fv-000000062M5-1m2z;
	Tue, 24 Jun 2025 15:08:15 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45E-00000005n2O-09Qr;
	Tue, 24 Jun 2025 13:53:10 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso575027e87.1;
        Tue, 24 Jun 2025 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773186; x=1751377986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzoQtJ2+Gby/Cw80qh1dP5yN37TDjaDpOb4iIQblBnY=;
        b=Rrsw3pEQSacKIFY5q68HZYg0FiZsJFC4Aie9LiPwjTr0zU7zqZTS/ovO9j9Us66JOz
         TbzLchDY9ZSae6Uhe57aVvtMAb0Iluq5s5HsWqD+VqB/fPM/6SXTLfYAtyc8S/mfudTy
         f3r6nU9eRg/zR+B34ELo4GvEmOP4Bm6U6qs6cVuLkaBWvJrGIJuW8/Z6PVXNyTECk1T3
         aj/RDXhmwyWQxwiLKJQbCLqGSKsZMzuG0CxRW69phC5HpFQaCs/f7GgW5L2P0HkEqihN
         BCSFPGIWOndMAOm6zLaYaPgEC5rWDu+qrpOuBe7o7oywpHFS9sD2kG7oSzxaJ/2VujQu
         b9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773186; x=1751377986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzoQtJ2+Gby/Cw80qh1dP5yN37TDjaDpOb4iIQblBnY=;
        b=MuqoAiog4VZ+Wvr04KtImIJQ4EIkqzuMRD2rw5WZX/xSLCyTWAL59oxaz4eIU4776D
         xMHslMcRjyf+udBCPKtuZzAR1L/QM2Sgzbld4ixiXlD4GJzrVuMpI7R1gQ9o1B99QI1e
         S5qxZedK1v+I6hQOiz16FnyW+rNKbRnmAXYCZcc8y0rjHyBUrfyh2XBK1JYmgkLBV3Ns
         YcGw/a+Ft7XubjEZB/T7tLxCj9rTlqb8hQ3PjfKPLfDOCuq8HWltD6dRLK7zGlMsI09X
         HwhV9G7BDlMjtenxBJ12gPhqHS3Fr/Urz3V9AoE/M8xZmofujdFJTcypefphCK8xYiKK
         xTdA==
X-Forwarded-Encrypted: i=1; AJvYcCX0R5VjslxTW2sznQNcyDtS3joCkLXna51UehHvev9gUrr58hWc1iGgZREm3+YN75opzinI3KdkPf10q3Yw3yxCrQ==@lists.infradead.org, AJvYcCXHO+rgDfBN6QtVdVkZWVrnyN2sisgroY2uA89w8f5nZ9S3qGopuvOk9Z8idpgUKTfEh/MzVFKJ3n4JJ9tC@lists.infradead.org
X-Gm-Message-State: AOJu0YwEVXWbUUVla254QerjR4+uBUo/3Y9EA/2UdZY8HTaOb05sAFnt
	UDXyv2vx+X2g5WePuqHdZEIi1zdI4njgNaN3yBA5T6Z7p+wEeJN/6z2c
X-Gm-Gg: ASbGncsA/ssCBMC/2CPYrLZG5o28jblz7rAHaaAJc+iO1Cu8U5INu7FQ90CE5PRMhzV
	8TmWAOR6GGqZIY1cYRMXlBGdQu9/AsFCjMcBM3/f2jGwrTLKeNXZYwhZj4chZKJyUHFiVak/rMh
	rWhgQJKRYtskyBzMbRDsXbkLBw2X9hoMu5racrwZs1hS/7jyW4kO2ygBrDVFwBNEnlb2R9Y2Dmj
	NaldUwYyVM2iCg5Do9/emjT3siKDVJVSU9GzoIGpyM4CxZh9PXx2od4Uf3ITUDM23FZLfct+X1M
	WUmyti42Vgqe3gxBcVAy+aCL9UEDfMvgsGbbz5RICemgoMJrbqV9V85UNy2XFs7H8YrzQZCM3vH
	w136V36KtHxfOn3fUjT5a7r1D4Iy+nMjnlm3K9lpUcP+w8TEVy/E1aHWMEBCNPA==
X-Google-Smtp-Source: AGHT+IFMNI8Veoel+fiiWLgZH3VVejMWZ1Zn0rb/ht0ioBubOtSiNdwqsWxi4IL2PzRtmQkU0o+yIQ==
X-Received: by 2002:a05:6512:ac4:b0:553:ae47:6856 with SMTP id 2adb3069b0e04-553e3b9a603mr5057869e87.10.1750773186027;
        Tue, 24 Jun 2025 06:53:06 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:05 -0700 (PDT)
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
Subject: [PATCH v12 02/22] crypto: amlogic - Add platform data
Date: Tue, 24 Jun 2025 16:51:54 +0300
Message-Id: <20250624135214.1355051-3-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065308_085929_53A6284A 
X-CRM114-Status: GOOD (  18.47  )
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

To support other Amlogic SoC's we have to
use platform data: descriptors and status registers
offsets are individual for each SoC series.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 22 +++++++++++++++++----
 drivers/crypto/amlogic/amlogic-gxl.h        | 11 +++++++++++
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index b19032f92415..7eff3ae7356f 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -225,7 +225,7 @@ static int meson_cipher(struct skcipher_request *areq)
 
 	reinit_completion(&mc->chanlist[flow].complete);
 	mc->chanlist[flow].status = 0;
-	writel(mc->chanlist[flow].t_phy | 2, mc->base + (flow << 2));
+	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_reg + flow) << 2));
 	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
 						  msecs_to_jiffies(500));
 	if (mc->chanlist[flow].status == 0) {
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index dc35d7304eb0..d7e455f73c04 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -18,6 +18,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include "amlogic-gxl.h"
@@ -30,9 +31,10 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 
 	for (flow = 0; flow < mc->flow_cnt; flow++) {
 		if (mc->chanlist[flow].irq == irq) {
-			p = readl(mc->base + ((0x04 + flow) << 2));
+			p = readl(mc->base + ((mc->pdata->status_reg + flow) << 2));
 			if (p) {
-				writel_relaxed(0xF, mc->base + ((0x4 + flow) << 2));
+				writel_relaxed(0xF, mc->base +
+					      ((mc->pdata->status_reg + flow) << 2));
 				mc->chanlist[flow].status = 1;
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
@@ -254,6 +256,10 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (!mc)
 		return -ENOMEM;
 
+	mc->pdata = of_device_get_match_data(&pdev->dev);
+	if (!mc->pdata)
+		return -EINVAL;
+
 	mc->dev = &pdev->dev;
 	platform_set_drvdata(pdev, mc);
 
@@ -317,9 +323,17 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	clk_disable_unprepare(mc->busclk);
 }
 
+static const struct meson_pdata meson_gxl_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x4,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
-	{ .compatible = "amlogic,gxl-crypto", },
-	{}
+	{
+		.compatible = "amlogic,gxl-crypto",
+		.data = &meson_gxl_pdata,
+	},
+	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 9f1ef87333ae..e0bc5c39bf2c 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -78,6 +78,16 @@ struct meson_flow {
 #endif
 };
 
+/*
+ * struct meson_pdata - SoC series dependent data.
+ * @reg_descs:	offset to descriptors register
+ * @reg_status:	offset to status register
+ */
+struct meson_pdata {
+	u32 descs_reg;
+	u32 status_reg;
+};
+
 /*
  * struct meson_dev - main container for all this driver information
  * @base:	base address of amlogic-crypto
@@ -93,6 +103,7 @@ struct meson_dev {
 	void __iomem *base;
 	struct clk *busclk;
 	struct device *dev;
+	const struct meson_pdata *pdata;
 	struct meson_flow *chanlist;
 	atomic_t flow;
 	int flow_cnt;
-- 
2.34.1


