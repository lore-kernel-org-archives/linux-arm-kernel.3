Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ED7C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOH1XofXvP/3fMrR28Yvu3oSZ/7CVBEt7HLdvRWECt0=; b=0CI00zrxkauKMMnQBZpGee792Z
	oQ8mFPAJONN5FA74L+ud/MfIZ2qW3P1USddy9ty56/IZJWS8Ui/7+vxwAnMDp6EQSF8kZrmHE25Nz
	x5BgCHKDlLYGPn7FIR04sAGl8QBDZpz/5JUxhmROM9wuumNozGoXA4Fh/FxLLScGFxtQv4n6KkJis
	hWfSrRDK7Hyj4LvjDMbKO39MMhCwUMmP1bn42mh++IwHdTEMO7gp/RD8LCYdaCxVhTEA2VYemylHD
	4McyzP9ei4JiigGwiH6mGd+QLB/BXvcldANnzobfU6RVRKaz3Qe0anVlnXh4Wi3Ot+AGVyM40Qamg
	6Kht2svA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5KT-000000063LM-2R4D;
	Tue, 24 Jun 2025 15:12:57 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45H-00000005n3i-063R;
	Tue, 24 Jun 2025 13:53:12 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-553b5165cf5so595294e87.0;
        Tue, 24 Jun 2025 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773189; x=1751377989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOH1XofXvP/3fMrR28Yvu3oSZ/7CVBEt7HLdvRWECt0=;
        b=iO4/ZX4eb5a2yyF+KPD9icDnDbOzPHJGYGuSTrfkiiuLJDaFhJ1PiS6NXtRdE2C0+2
         BcIEWGH9z05RhJDRbPYDZt4IGZp1Og/mG9c9ryGF54hNqFaaxc7njolGFkjvmXX5e84f
         wdLybtXkf9+DMxuVhCJ0URNbGYDhRZEwfcsjALSTqzV5stlbMyYlTw71gntt8y2KpsEM
         MeTZ9iCOtSd9YErTJwCT30dkFeyYjXsI7vDbYJ45Ok0oQQZq57SbGUe7SVr9EVMZznJO
         wv2sIBbcaaIi5bMEjs/agKT4K02YB1ax14dB6YY0Oa1Xy/4jtcggHrf8Yhhb26SBxiVv
         71EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773189; x=1751377989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOH1XofXvP/3fMrR28Yvu3oSZ/7CVBEt7HLdvRWECt0=;
        b=mCqNEvHKOhNd5cupgZAaMN5KwMjkliRjNPTPz4E0N81jMFVjo8OY5AD650RKKZLti7
         I4NOr2TBdfVuDGzEU6u9xFj+SH4WSQ2fSlykRUekg6OJMKoLY+9uPCE8pGz3FMXkPavC
         nMIYTj08YEyA6tD68whaFK/3tiXHMMPDFGVJpbEQvKec125sipQDu0BTWhN+TaKjYfFB
         d2phwLUqSbjmvxc3y4SAJRxzGltdAHHEML83oKYTX7dOk64tdVlTjNTkIwPX3Ko+nOMJ
         W6K4QHpeB0xsxHbIas0Atj0FAiLOpNPptTql0K+kFvT9fCxeDiNXq1pcrjZ5sj+aEakn
         m3yg==
X-Forwarded-Encrypted: i=1; AJvYcCVGvMKl4/yHddGyjn08BZwsqYJv/DOU/jakkFkItJxzk/uCcipRj8g9zkXwRuYiKzNk6bH+BfLmuEVOjUXXnCrPPw==@lists.infradead.org, AJvYcCXYV2OORRTL966tIKdZ3EFAfQOrUxhxmtsO5IDOJw0laDloxST5okx2M7OjzvgvqwAUeis+HkkshT9cVMVn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy19U/qX7IiCVs/abVrmwHTAsFtA4NmWW4x4LOoI3ttbPtnMi8+
	Wy8RG9qdyWtoluFV2xRNkSbCkTY8R/db/W8ORMfAbBTrSukjL4zyT3qz
X-Gm-Gg: ASbGncunWtM6oHGnw6U2eGCzNVE7qdONoluTo+Nwws0a69M+soU9odK6lCouAroJl1q
	Xvo6Co2CRdITWw6tZHKG4Ja0I94WP2/9OJAdIjacBDJztNRKz9C1+bXF7D2mK14Rh3rzqAdoFzF
	PBf7vAGL6RWZk96WOKjJ1rBEKRS4rDXwvls3aCprXZXs4T4eQ3eFuOQeIU9K7r7oc6EOZHVfIxO
	a4+219pEAhqx61YnwQVMn4pM45uL1SYwh2O+Rf7jirRuGv2uVwRyc88w9+ibX3YQNk5XKG7dH+C
	FmpkmbTymFZf0YyNZav/DpvWQO4hbvCEA1g9sNYsqiW8x2ZCriBcf+MrKpRmYYi+3byaCFIhNKB
	hXUQiWgttlC0MyQHxbUJvLJ2H+9ikv0FfuFx8PiMiyyOVx3VqVM1KEE7WtiPFlg==
X-Google-Smtp-Source: AGHT+IHTyCe/FN5IR8181aO2FrwcATp3fU0/WyX0ea0RPA+5nhuEUmv38QxaI8BQxCM5Yp3mS3ZujQ==
X-Received: by 2002:a05:6512:1104:b0:553:aa32:4106 with SMTP id 2adb3069b0e04-553e3bdb2f0mr4751311e87.23.1750773189026;
        Tue, 24 Jun 2025 06:53:09 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:08 -0700 (PDT)
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
Subject: [PATCH v12 04/22] crypto: amlogic - Add MMIO helpers
Date: Tue, 24 Jun 2025 16:51:56 +0300
Message-Id: <20250624135214.1355051-5-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065311_062574_9F533727 
X-CRM114-Status: GOOD (  13.63  )
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

Add MMIO access helpers: meson_dma_start() and meson_dma_ready().

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 24 ++++++++++++++++-----
 drivers/crypto/amlogic/amlogic-gxl.h        |  2 ++
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 7eff3ae7356f..1fe916b0a138 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -225,7 +225,7 @@ static int meson_cipher(struct skcipher_request *areq)
 
 	reinit_completion(&mc->chanlist[flow].complete);
 	mc->chanlist[flow].status = 0;
-	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_reg + flow) << 2));
+	meson_dma_start(mc, flow);
 	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
 						  msecs_to_jiffies(500));
 	if (mc->chanlist[flow].status == 0) {
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 90b539401b71..e617dddf5e2b 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -22,18 +22,32 @@
 
 #include "amlogic-gxl.h"
 
+void meson_dma_start(struct meson_dev *mc, int flow)
+{
+	u32 offset = (mc->pdata->descs_reg + flow) << 2;
+
+	writel(mc->chanlist[flow].t_phy | 2, mc->base + offset);
+}
+
+static bool meson_dma_ready(struct meson_dev *mc, int flow)
+{
+	u32 offset = (mc->pdata->status_reg + flow) << 2;
+	u32 data = readl(mc->base + offset);
+
+	if (data)
+		writel_relaxed(0xF, mc->base + offset);
+
+	return data;
+}
+
 static irqreturn_t meson_irq_handler(int irq, void *data)
 {
 	struct meson_dev *mc = (struct meson_dev *)data;
 	int flow;
-	u32 p;
 
 	for (flow = 0; flow < mc->flow_cnt; flow++) {
 		if (mc->chanlist[flow].irq == irq) {
-			p = readl(mc->base + ((mc->pdata->status_reg + flow) << 2));
-			if (p) {
-				writel_relaxed(0xF, mc->base +
-					      ((mc->pdata->status_reg + flow) << 2));
+			if (meson_dma_ready(mc, flow)) {
 				mc->chanlist[flow].status = 1;
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index e0bc5c39bf2c..0ccf6542995f 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -161,6 +161,8 @@ struct meson_alg_template {
 #endif
 };
 
+void meson_dma_start(struct meson_dev *mc, int flow);
+
 int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		     unsigned int keylen);
 int meson_cipher_init(struct crypto_tfm *tfm);
-- 
2.34.1


