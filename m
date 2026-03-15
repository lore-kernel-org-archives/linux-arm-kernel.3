Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3103F3026D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubQ1v6PBsq99cAcF2yrnS1WsB85d1f/acmJVUU/lg1s=; b=wOgnbeSci049tWVGfdQzwDUlpU
	/IEyBG3e6dN4md77Hiskl7zmGiyo/Uo7UMnzTvb/a7ZUVN67fRD4rsfuVinod3/06kLRCvLUHgqR2
	CPTNJQTv5jg9uhTFRi6ZjVPW9tAfFx012tEJDB5kqBiRWLBrn0yDKwWRmDNb7gejDQj3NOKieDEZB
	Of1kld3YNhKqYifSgsDk8dkqtEI4/zsIhILF/GNvHOP92htZ91RNTtQwimDNWh1aP38MsFYgJSWrQ
	PEoM3zf2Lz5WbsEANFlSUbgTAXnQgwiXj/w1hRPJG+A0yWgs5TzgjuqF5hq71YeWC3uDCI6i6Rbfh
	rSOia7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pDQ-00000002ltS-2hYc;
	Sun, 15 Mar 2026 17:25:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pDO-00000002lrI-0Ot8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 17:25:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso22711135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 10:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595520; x=1774200320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubQ1v6PBsq99cAcF2yrnS1WsB85d1f/acmJVUU/lg1s=;
        b=bUoopWOOSvE2nc+Ofssfn1d1hQQNwLcqfPB+t1VBHClqFB+10qL/Vk92M/ox6Cktpr
         dfLvDjNLQYRoLsQlW15SOUeCj/F2DTwsmWFjIluo3Y9YepsGTJ+YGQkl8KLqhyPg1d91
         75bJLbagMUwhYn1Gt4s21af1ppF/CnAGZD/u2jSzTAMdKlIs7Mq32ugMXpUx/4Uw28yP
         GTcTU8mfzCYfcfgLJR3H9WeP4/YcGjUYf1UlPSfGv23TFDeYUch5h9h1+OtH0nygqEFc
         em+bLT+wxK/RfUCjLfKW9zXs4A/1o9gicg50+NHWY7q2P7TkQe2bySf+HG22WHL5yMZa
         EU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595520; x=1774200320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ubQ1v6PBsq99cAcF2yrnS1WsB85d1f/acmJVUU/lg1s=;
        b=MtAx4ie3vw044IuVJwiOg4tI9JwcXXxVBkxS4eqymusWMXkxQk/mUH72p++Wt4ABXm
         ZmpRdHZRrgR+BMTM58GvPP/hcMwaa4PJzETnFdLIhtN2bJHm6RpRP2JMM6m1haTYW6j3
         BQP1aF7GO0UhlSaB1psUVmMFv/V6nCbCJeF3w3cv26rfWCxJ3+2Km47aR+/ddeUUk8Rj
         CXD65h1GlPXaI3zluFzJsuKPRYITg7zn3ZATZn0WFOOnBPPTpDjU9ILRNnAgZkadNvhO
         SlrXqyV9eKdD9QdA+bIBcjBuNMNtpah/e454DpdLOt2FHYYUNnvcuuLwaVrf3JcHpceq
         0QOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8nfndwrhD1H3hvVEx8GzfrCoHlXLE91LSvZoKCgEIpVvi4lqdr973NXf48kxXJaLXT3vaOA/bWduZbMgGcPSc@lists.infradead.org
X-Gm-Message-State: AOJu0YwP18z3Bpx0brcAWcSX/7I4dOPua578kDG0O6Ckppb1thhwlWnl
	TDkCUsgCAwhJ14O5ExxfthsssNPjX+7rLS2jCElKdbyoEIHm8mOaZxNC
X-Gm-Gg: ATEYQzxesW9wV7KKOWBkRhxRZi04jDnVSeo0dCbBrUlwyJYomDq+KUDEZmIvyJ71bFh
	Ia5Is6fwSEWQmqvPgyh85P6z74iywYg8H27cbkOUQjQeHBBX3OjXTkdMsnf/KK+Lzbg9/ZlxlpB
	08mhxpUyG6oBhJM9Ok4ybj8Unrp8QLSGlJB4RblWk4aNJLpIFvxEBfiYfhBg/zqhO3EKJpT1LBx
	9LOMVCW2FAGcgqKLhR48VotquyMLD9kBNE+TmJJQ7dZKZZetf0U5FvwmVigDj+YHaEqCxWxn+za
	VRi5Ed2pfdba9LcHQin9cmGxhZ943MtYaenQlOoKqpEg5hxWJp8FcLBVEoRet9UpAbBkLEZ9OSN
	wb4rn67U1Bgo6PpWp18tNRCfo/P06uYU8Ry9ehGhFvi5PpbzpD0+txQIPFBigFamHobAirikiq2
	Bv1Kwzs4zKP6cICouQ9fQxz/RrMWcuhOigjUw1YI5QxM7Rig==
X-Received: by 2002:a05:600c:4592:b0:485:3dfc:57a with SMTP id 5b1f17b1804b1-4855671044fmr171605205e9.32.1773595519800;
        Sun, 15 Mar 2026 10:25:19 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm457168325e9.3.2026.03.15.10.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:25:19 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>,
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 3/3] mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
Date: Sun, 15 Mar 2026 18:25:07 +0100
Message-ID: <20260315172507.270480-4-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
References: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_102522_145760_9B8C6001 
X-CRM114-Status: GOOD (  14.06  )
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

Consolidate esdhc_imx25 and esdhc_imx35 soc data into a single shared
struct since they share the same flags. This reduces redundancy. Also
add the CID_MANFID_KINGSTON definition to quirks.h for centralized
management.

Signed-off-by: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
---
 drivers/mmc/core/quirks.h          |  4 ++++
 drivers/mmc/host/sdhci-esdhc-imx.c | 12 ++++--------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
index c417ed34c..d736bb4be 100644
--- a/drivers/mmc/core/quirks.h
+++ b/drivers/mmc/core/quirks.h
@@ -15,6 +15,10 @@
 
 #include "card.h"
 
+#ifndef CID_MANFID_KINGSTON
+#define CID_MANFID_KINGSTON	0x70
+#endif
+
 static const struct mmc_fixup __maybe_unused mmc_sd_fixups[] = {
 	/*
 	 * Kingston Canvas Go! Plus microSD cards never finish SD cache flush.
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index a7a5df673..9cfa26722 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -256,11 +256,7 @@ struct esdhc_soc_data {
 	u32 quirks;
 };
 
-static const struct esdhc_soc_data esdhc_imx25_data = {
-	.flags = ESDHC_FLAG_ERR004536,
-};
-
-static const struct esdhc_soc_data esdhc_imx35_data = {
+static const struct esdhc_soc_data esdhc_imx25_35_data = {
 	.flags = ESDHC_FLAG_ERR004536,
 };
 
@@ -391,8 +387,8 @@ struct pltfm_imx_data {
 };
 
 static const struct of_device_id imx_esdhc_dt_ids[] = {
-	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_data, },
-	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx35_data, },
+	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_35_data, },
+	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx25_35_data, },
 	{ .compatible = "fsl,imx51-esdhc", .data = &esdhc_imx51_data, },
 	{ .compatible = "fsl,imx53-esdhc", .data = &esdhc_imx53_data, },
 	{ .compatible = "fsl,imx6sx-usdhc", .data = &usdhc_imx6sx_data, },
@@ -414,7 +410,7 @@ MODULE_DEVICE_TABLE(of, imx_esdhc_dt_ids);
 
 static inline int is_imx25_esdhc(struct pltfm_imx_data *data)
 {
-	return data->socdata == &esdhc_imx25_data;
+	return data->socdata == &esdhc_imx25_35_data;
 }
 
 static inline int is_imx53_esdhc(struct pltfm_imx_data *data)
-- 
2.47.3


