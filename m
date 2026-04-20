Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0E0F5A8B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 20:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d8mi/dHnhOhKjn37TMzbYeLkesk0gPSMBEcSGzvI0/4=; b=Danz441eaYIPrO/MO0xgVr/NB5
	iNkAqIYCOv9d/0B4YZsm5Y0PY7KNAgforSDRrtCrwClPsmpIRmV1cAO3g8oyUL3YrWs0GYDV0zbgu
	0UZCnGnFGfnWqhdyNM4ey+k+wFRmEKHQOb/ffM1olMQTIeE/G4FQQDVIB1u4KTMXW5/z5h+V1iyBv
	fGpv/FuO93Su/91yb+KBVB6Hcdws9Yd5mg8Kn56uQ65BSQik3EONMqSZDixKbP6BhfCRfFCREDfuL
	J6uefqjcCGn22G72S8MpY9v/309lxy5TcUfuMdtKRF+ZyhZO7q8VNyCiCZWf4PIZcxSUYV0Geyuj0
	ykI77wog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvIk-00000007dFK-2b1H;
	Mon, 20 Apr 2026 20:33:02 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvIh-00000007dEx-1XE9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 20:33:01 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-12c7212836bso9193352c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 13:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776717178; x=1777321978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8mi/dHnhOhKjn37TMzbYeLkesk0gPSMBEcSGzvI0/4=;
        b=i653zbJJJ81R1g7xm8InZpOXQYuKlgGGZDpgH21f7/YkbspCZ24SBCPgIvd4tgZWFG
         DtR5te6Nuu558z5RvhJyivJg5p4BVHJqMGTkjrVg0gHB/4Y0/wII6/bo1+17zaHwm4Hl
         PNcmlXUckJKT1XGbCuz0YZPoOM5SfTLezcBBPYusrQIBvCvn5hVadfDoiGADvL+xZYve
         pbMWQkNDmndCFV5kfI+Vr/cgBGTLpMyH/eWatikRlk0Mt2HoJm4uF+HJE4YhkQqJud6J
         cJVzVH7Wpvz7T5aiXxOgcnz0RFkae7J5PeXSxdWAL2GzoBQZJZM9YZNA6AHbFQmfA2wl
         TsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776717178; x=1777321978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8mi/dHnhOhKjn37TMzbYeLkesk0gPSMBEcSGzvI0/4=;
        b=NB7d5n5HJQUTvr/sD2il7oEuCuBgasPNAAuufbXYPIfdivzVkxv495dB1SYZ4cxnSO
         X8qq5Rz4jilbK+OqfMsUUbWEfAzJNHuTXt+PFXzqFs6BsiiNg2iPiR792iH4WovpC2WX
         lqfYW2lGpYw6XgSNPTAgQKsKITcrU7AIKPOJvJ6uDzmgz6AxQQEbsGT++TJJ0aNtm56M
         i5PPqU6QQ6HNqkJdg5dMiHwBDGMChD6BI5ijXoJcH4VHQR1xUNKp+2zUSefck8bJyWcH
         wWpfKgrfXsL0jWgvWYMFp/vy/aLrFCch40QTudVfJzU3P3FhN2/9YvnuaGPWpyInXu+k
         JKaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/npCbyu5v6Wpss5FHdAADseSRPeE3PKfepV1MX/mpVtT9hbUdyXJsvVV7+6cnvFo9U/XVT/jNZibSBACazw0lc@lists.infradead.org
X-Gm-Message-State: AOJu0YwYFsDyqZrCp444jH1gLMaWUt6JQO+ZmQx3GlcjeuTCFAZZG4QY
	pIt3STAi0WpX7K0Hhp5AUUomHZzmfrJy7zk38BshPxO9L8TyTm8V99whXJftRNs3v2E=
X-Gm-Gg: AeBDiet0dvMVxQ+X8mHC50XwAmcwDHnS8usPkPI1mzXDwpfg6XnAuS3kRJXbAFMH+rP
	qVK+ZdKBmagClSVnp9ePHdQhJAiEFLGqUhgNn/Z/pxjI9aPG9FIgA1aIaysAN07UhZd3jG6KR7u
	gzoFJpspq8kj0X/iupn7aLkvpU2olmp0dbFKPQ4t9QByfwWwSq6t6vm4g1l82Llus6hadM0RJiT
	4eGob6O4bdAv9V0llJuktti/LWV6fL2CgRbOUMwVFr08NXVDhS/2fMC3zLpLDQOOFywVT6yYXT+
	m3IjbuHx8b69wTUHiQIrbIfxDCoPJimXorL9ZgC/46cN1ezL0y7AqX28dUigYEGwmsT3zc/Napr
	T2qWkuA1Iang24teIsSVR/jpaDmG9HZmAp1CDQyw/hklJBaxBBIx8hcX5XfUuZF6R4Jnz74JLpf
	tGHZWnBSfS7YSHYJUYugUaEiz2l7wto/+K
X-Received: by 2002:a05:7022:6882:b0:128:d5f1:d593 with SMTP id a92af1059eb24-12c73f6d5c2mr8565237c88.1.1776717177718;
        Mon, 20 Apr 2026 13:32:57 -0700 (PDT)
Received: from com.. ([187.114.199.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c770516f1sm14972223c88.7.2026.04.20.13.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 13:32:57 -0700 (PDT)
From: "Joao Marinho joao.bcc@usp.br" <joao.bcc@usp.br>
To: claudiu.beznea@tuxon.dev,
	andrei.simion@microchip.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Cc: =?UTF-8?q?Jo=C3=A3o?= <joao.bcc@usp.br>,
	Micael Vinicius <micael0208@usp.br>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ASoC: mchp-spdifrx: Replace manual bitfield manipulations with macros and typo correction
Date: Mon, 20 Apr 2026 17:32:03 -0300
Message-ID: <20260420203218.15060-1-joao.bcc@usp.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_133259_925013_986447D3 
X-CRM114-Status: GOOD (  12.41  )
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

From: João <joao.bcc@usp.br>

Replace manual bitfield manipulations with FIELD_GET() and
FIELD_PREP() in order to improve code readability, security
and manageability. Also correcting GENAMSK typo for GENMASK.

Signed-off-by: João Marinho <joao.bcc@usp.br>
Co-developed-by: Micael Vinicius <micael0208@usp.br>
Signed-off-by: Micael Vinicius <micael0208@usp.br>
---
 sound/soc/atmel/mchp-spdifrx.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 521bee499..2c47aabdc 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -6,6 +6,7 @@
 //
 // Author: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -41,6 +42,13 @@
 
 #define SPDIFRX_VERSION			0xFC	/* Version Register */
 
+
+/* 32-bit word byte masks */
+#define SPDIFRX_BYTE_0_MASK         GENMASK(7, 0)
+#define SPDIFRX_BYTE_1_MASK         GENMASK(15, 8)
+#define SPDIFRX_BYTE_2_MASK         GENMASK(23, 16)
+#define SPDIFRX_BYTE_3_MASK         GENMASK(31, 24)
+
 /*
  * ---- Control Register (Write-only) ----
  */
@@ -55,7 +63,7 @@
 #define SPDIFRX_MR_RXEN_ENABLE		(1 << 0)	/* SPDIF Receiver Enabled */
 
 /* Validity Bit Mode */
-#define SPDIFRX_MR_VBMODE_MASK		GENAMSK(1, 1)
+#define SPDIFRX_MR_VBMODE_MASK		GENMASK(1, 1)
 #define SPDIFRX_MR_VBMODE_ALWAYS_LOAD \
 	(0 << 1)	/* Load sample regardless of validity bit value */
 #define SPDIFRX_MR_VBMODE_DISCARD_IF_VB1 \
@@ -74,7 +82,7 @@
 /* Sample Data Width */
 #define SPDIFRX_MR_DATAWIDTH_MASK	GENMASK(5, 4)
 #define SPDIFRX_MR_DATAWIDTH(width) \
-	(((6 - (width) / 4) << 4) & SPDIFRX_MR_DATAWIDTH_MASK)
+	FIELD_PREP(SPDIFRX_MR_DATAWIDTH_MASK, 6 - ((width) / 4))
 
 /* Packed Data Mode in Receive Holding Register */
 #define SPDIFRX_MR_PACK_MASK		GENMASK(7, 7)
@@ -118,15 +126,14 @@
 #define SPDIFRX_RSR_LOWF			BIT(2)
 #define SPDIFRX_RSR_NOSIGNAL			BIT(3)
 #define SPDIFRX_RSR_IFS_MASK			GENMASK(27, 16)
-#define SPDIFRX_RSR_IFS(reg)			\
-	(((reg) & SPDIFRX_RSR_IFS_MASK) >> 16)
+#define SPDIFRX_RSR_IFS(reg)			FIELD_GET(SPDIFRX_RSR_IFS_MASK, reg)
 
 /*
  *  ---- Version Register (Read-only) ----
  */
 #define SPDIFRX_VERSION_MASK		GENMASK(11, 0)
 #define SPDIFRX_VERSION_MFN_MASK	GENMASK(18, 16)
-#define SPDIFRX_VERSION_MFN(reg)	(((reg) & SPDIFRX_VERSION_MFN_MASK) >> 16)
+#define SPDIFRX_VERSION_MFN(reg)	FIELD_GET(SPDIFRX_VERSION_MFN_MASK, reg)
 
 static bool mchp_spdifrx_readable_reg(struct device *dev, unsigned int reg)
 {
@@ -317,10 +324,10 @@ static void mchp_spdifrx_channel_status_read(struct mchp_spdifrx_dev *dev,
 
 	for (i = 0; i < ARRAY_SIZE(ctrl->ch_stat[channel].data) / 4; i++) {
 		regmap_read(dev->regmap, SPDIFRX_CHSR(channel, i), &val);
-		*ch_stat++ = val & 0xFF;
-		*ch_stat++ = (val >> 8) & 0xFF;
-		*ch_stat++ = (val >> 16) & 0xFF;
-		*ch_stat++ = (val >> 24) & 0xFF;
+		*ch_stat++ = FIELD_GET(SPDIFRX_BYTE_0_MASK, val);
+		*ch_stat++ = FIELD_GET(SPDIFRX_BYTE_1_MASK, val);
+		*ch_stat++ = FIELD_GET(SPDIFRX_BYTE_2_MASK, val);
+		*ch_stat++ = FIELD_GET(SPDIFRX_BYTE_3_MASK, val);
 	}
 }
 
@@ -334,10 +341,10 @@ static void mchp_spdifrx_channel_user_data_read(struct mchp_spdifrx_dev *dev,
 
 	for (i = 0; i < ARRAY_SIZE(ctrl->user_data[channel].data) / 4; i++) {
 		regmap_read(dev->regmap, SPDIFRX_CHUD(channel, i), &val);
-		*user_data++ = val & 0xFF;
-		*user_data++ = (val >> 8) & 0xFF;
-		*user_data++ = (val >> 16) & 0xFF;
-		*user_data++ = (val >> 24) & 0xFF;
+		*user_data++ = FIELD_GET(SPDIFRX_BYTE_0_MASK, val);
+		*user_data++ = FIELD_GET(SPDIFRX_BYTE_1_MASK, val);
+		*user_data++ = FIELD_GET(SPDIFRX_BYTE_2_MASK, val);
+		*user_data++ = FIELD_GET(SPDIFRX_BYTE_3_MASK, val);
 	}
 }
 
-- 
2.43.0


