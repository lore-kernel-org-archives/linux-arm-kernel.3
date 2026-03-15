Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF04F3026D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubQ1v6PBsq99cAcF2yrnS1WsB85d1f/acmJVUU/lg1s=; b=z0sc3hIgQwZ4GRyrWJyV724Z+1
	wIP8Zi5FuvHiNojP8Z82dh8qWVFtdjN44jdPJzk/ObBn1X9CN8/OgbzBCmju5029fdfSdgSXmXzCB
	VbgWcfdBKVqcoDDhTf/7rbraNiYXgyzk5xOZumlSHImjcnF4j6iqQ3MTakPgTYxCtSkl+AlXjxMXn
	IwR+ghQ4LS2Y9vd7/zBooCoc6GeiOmCy2ww+pUzuVar+KCScq9NQzY/huxMsbrkD0lO18iLXGM3s2
	hkpxS4sfCvrJQeaawB39gjAqUGKCRo0RNRfro9EISR0LPJdZ+lmmAitdmgeMvlDoO5AEqfRpUh6oa
	u3i0HoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1p5P-00000002lD5-0JEO;
	Sun, 15 Mar 2026 17:17:07 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1p5J-00000002lAs-0TkX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 17:17:02 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43b44c0bcdbso53035f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 10:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595019; x=1774199819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubQ1v6PBsq99cAcF2yrnS1WsB85d1f/acmJVUU/lg1s=;
        b=h40I1r37WzpNnp6HN+quVxT05T4MN7RAMoCsfArXtMFTyC+hOSS2vVhf+H7jMxt+J8
         4EFlfb6YmemzsiC+8TmSwCuz6MzRV2sFzX5gjNt67h4I/cuC73105aR/24o7HmMupFlX
         DS5qZTKrbLR+TFokjkXxCkEXkmRSf+oCZnJnvx2j3UL/Oi1UMPb+vrGlEZT26Ldi0Q+W
         GP3rGCj75dQv5kAj/f27RL2JWc60BNUd9XIjj2FAPAncDeqqhH6DTD9e6ivAJ/iqgzOU
         0ewatstjCjZbSGRGCiAzwxaJLe2eUb7sl/rwT57vE841SCENV/zQWV+X7/2itHQowRqP
         AJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595019; x=1774199819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ubQ1v6PBsq99cAcF2yrnS1WsB85d1f/acmJVUU/lg1s=;
        b=ooK8cFuAoi5dq3rkkp6f4R7sv666YPjpvf+jBw0ZrT7I/8p0hQ87fyR0HD9d1OmT1U
         3Nx6jVTNGA/faJWGs4keVrOAGrZIfDBSMbuRkgUCvsWLQSMErSHcsBKkxLXE9rpTJ92D
         gQGULc5sC0711R4NsLF9lpJsDovW3riARBZzwqteVfAQL6yLGKjimCsCW4Jz+EPmkTUy
         YvDGOBKFDUxjZ+rIdqAwJPZUEKQoJUrgw0Sgpch+PoFdVQyiIxVWO+cswewb/OxwpVBd
         QcgioJiZBYG/vXzRH/pCUB3ON7WMZHMdj4Y9F6t8SyKWgpJ5kVz33d/O68+Wk1kHym1P
         NTJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlv8qTLGKCIWnJ/rSPRvWChhlJj+C1aSRP0uVTisHULhvhEkomSDzGTdH2XpD7I4Moa5rX3Cd7dKVnnq6u6ASn@lists.infradead.org
X-Gm-Message-State: AOJu0YznsY0uZb6ZFiokej6FwTJRS3JcBbkYQcqP8pSCmcEaLimpVpDt
	8uqn6+UyOgTPN0z4P+Cwgx+GZCg0k9g7C3hgimtgSfR5gZMVpnfWH7M4
X-Gm-Gg: ATEYQzw2yvcmhOWDWi4jvts5GvaUn4Ddws4H99W6KXjMEdDSFV0waYQNAqllkBHwT16
	UogDNMtpDGiofuz6tDYF7U+SiKmgWiOf8Y0LcbTcPhBORm3CZZ3m+rdO0sGnl+nf0sZz6nwrLz/
	wclHk0IS84/OxIsOyOQC4j6I8k0tHFhSNnMi2RZ/Pe3aAklP1aCRi4iL/lBm5jqD40j7MqUNbXz
	R8KFRzuJ+96mYl4F47mTivlPigViAZ3aoE6IffxMJx/z0TYJRvsv20g35AQAxShyCllk5XTTnCF
	68azMKB8EbK2Ph3iharP6ZhS+pj5aatiqP65Vg6Ej7wK0Gk3BCnwtUL0VGEPDJwPdDVUT9MEEBA
	5LXxQZwfMvEGZN8d3+9pHiJS+4TIRS6GNS7eWd4RTA/w21rPTO19WpqY4LAOQsp0ptIlu12RKcc
	lvzAeAJI0qb0xTJTtqxtxiJBbEOLrv65vuAQ==
X-Received: by 2002:a05:6000:200f:b0:439:b59e:5e65 with SMTP id ffacd0b85a97d-43a04d79252mr18547646f8f.6.1773595018822;
        Sun, 15 Mar 2026 10:16:58 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm40536429f8f.27.2026.03.15.10.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:16:58 -0700 (PDT)
From: Adrian Garcia Cicuelo <adriangarciacasado42@gmail.com>
X-Google-Original-From: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
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
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 1/3] mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
Date: Sun, 15 Mar 2026 18:16:50 +0100
Message-ID: <20260315171652.269020-2-adriangarciacicuelo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
References: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_101701_185736_160D4946 
X-CRM114-Status: GOOD (  13.65  )
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


