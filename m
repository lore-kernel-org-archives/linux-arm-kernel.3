Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E651091915
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Z+t3nij9duvH51q1jubZS0ZmVziEVK5rVexkb8LriA=; b=tzaadxm8LUmX84DAzKoTzEanEy
	cLXb9tfQ0rO78uZfF6NTpGPTXrExAeKjfvHjUgYBR9m4uj3tv6n1UoNDdL+oHI98YWunfl93sScE2
	F2/orDGAOnJVUZI0/Z1gayh99Cw4F8nZGXvN8e8cbV8tvHT3kz4PlECM2YBSqRX5YV+S+HbVngnDA
	tv7okvbrayY83UWlj68akSzs8gUU25CE9y+HnkmpnApPr7skdku7Gksg7+8+Yt3OzyaZEJDMUtn1t
	8rxDbIdjXeR4bKwqcrBG/2BcCl2Y/OIbeumdZOWcgq0SdHAUwQcCoURhRcImcxJg1aR30RDQ2F2tp
	sJH+yjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Jgp-0000000BVOC-3GCh;
	Thu, 19 Mar 2026 20:09:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Jgm-0000000BVNj-2fCr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 20:09:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so173045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773950991; x=1774555791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Z+t3nij9duvH51q1jubZS0ZmVziEVK5rVexkb8LriA=;
        b=Lw+LDd4aaZ8FTkdjt73ddO4JzCoNxYcC2+8TYcPk9ri4Ez4rLmTvGRKUBN2++a7RAr
         KUbhL4UogF5nrOw7y7DF1RVDW+SYZaH9vaJC4LLLeEPLdo/k6iUqJnQnk/aVYH2J2L8I
         d5YeMnwq23Ykk7DUxLyfZwRKGqE2g7eAMcHRNxdP5SMLjSMJ/ietDy+1DGlhTkKwMToL
         uTEC+bLKTsBHQwUUcxMetKAJtHllxH7QFCYIJfEPDAdyG3joTEtP0FKyvuhkm+vQq6AQ
         W0yJRyAm4p8EG/BVH4Ib0GE/EFiLqCaN5qOBm2Kxv2doYAHEwHyMzCCPg1bVejjUzYwm
         mzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773950991; x=1774555791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Z+t3nij9duvH51q1jubZS0ZmVziEVK5rVexkb8LriA=;
        b=puXN0mX6CMCnhs/T+AaYdcUBEDuszz6N4Dm/lQGsmfYHA7m6Ht5y80pHzhxg2euXwT
         5dfqWCFwy+akS1Om2CC6Ba7sjXB/Pp8uAxvrATjcb52AuNZtDZ+oclVQvRkJ4lGoGas/
         bWngysXjpILtkGVEb7w3oxnNx/kxTFJDPJABErL0zdlsHLJyNnAzRNE936iUo7NdJncH
         hcJSpSgc6wZP7YdWzKyhyTOIVNHYmzSHDWeUO+SL2vjzQSZsCPv42yLNp/azQm0baMYD
         3oU+MOH1lvD/q63X8UVXoiMQpFzbTEaha4agKlIVpXOGoCdMzdoIct/CkfhDGirljzLM
         ygHA==
X-Forwarded-Encrypted: i=1; AJvYcCXdacRxVe5u6KHyb2ipe5fXFQaHYtKxyJLLRd0U39psvM4tQeHWwhJnxR9KGrempipf8mcgzkB+zMGsrT6CH/Oo@lists.infradead.org
X-Gm-Message-State: AOJu0YzXoGq4fAQY5XwYAkXGjI7cjOWJULVEYSudQH7E83RWhbHOcvPs
	JhRrHdb8w5weDWmIAYwcAW0qZh3hDZdTuQLN/Ci3b4d2oJT19iPD9N1h
X-Gm-Gg: ATEYQzxEf3vmKsBvtgUtRJJKolz59uwC8zgShDzILgUXyEBpVYmk2xhhzlwXkKLDqWc
	cbG8/RwoIqwLdGDNp+o8jCct71kuMVtfRnsWmHA+r7JRcuCh4C+OPSXq+wHpD0vo/KZMd1Myb/h
	9AzlU1rDo1qg+HoQEGdkvez7Uj/vQVtFQnWwbBvpEwao/wStm0tOUKv072DVQu0bHjF1NVUYjNq
	qaPm/GFU+Yt1mTNAqOOoimQ36Lao8tGghz6HZRpfrn8hGauprn0MfCxdw9/NRLBOHeJ71rim/oP
	IQqsZVtkDQFw5tEg2lHrgWm5mZ1j67cUtVColYsxI2ALh30+tsgFi1kKCQEYFty5y8fghuZr7Wb
	2bTsk5t2qBiJ7wWRFwQ15/eoHg1iK0/EsE9SjOH2jWRPkwzFK2rw/IaG2ouziruwyNIHqBvpBkd
	EehNdzfX+RAKAtevgbMSUg8RcPjIqHq1wKbg==
X-Received: by 2002:a05:600c:a4a:b0:486:fe83:8621 with SMTP id 5b1f17b1804b1-486fee1ab20mr5793965e9.23.1773950990582;
        Thu, 19 Mar 2026 13:09:50 -0700 (PDT)
Received: from debian.lan ([171.22.85.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe967c64sm8991685e9.2.2026.03.19.13.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:09:50 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH v8 3/3] mmc: sdhci-esdhc-imx: remove redundant mx25 handling and consolidate soc data
Date: Thu, 19 Mar 2026 21:09:45 +0100
Message-ID: <20260319200945.23333-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_130953_539232_9A9FA712 
X-CRM114-Status: GOOD (  14.39  )
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

The is_imx25_esdhc check and redundant mx25-specific handling are no
longer necessary since the initial SoC data initialization covers
all relevant compatibility cases.

Remove the is_imx25_esdhc helper and its associated logic. Consolidate
the drive data structures for imx25 and imx35 to reduce code size
and improve maintainability.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index a7a5df673b0f6..3dc43f1e517aa 100644
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
@@ -412,10 +408,6 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, imx_esdhc_dt_ids);
 
-static inline int is_imx25_esdhc(struct pltfm_imx_data *data)
-{
-	return data->socdata == &esdhc_imx25_data;
-}
 
 static inline int is_imx53_esdhc(struct pltfm_imx_data *data)
 {
@@ -873,11 +865,8 @@ static void esdhc_writeb_le(struct sdhci_host *host, u8 val, int reg)
 		new_val = val & SDHCI_CTRL_LED;
 		/* ensure the endianness */
 		new_val |= ESDHC_HOST_CONTROL_LE;
-		/* bits 8&9 are reserved on mx25 */
-		if (!is_imx25_esdhc(imx_data)) {
-			/* DMA mode bits are shifted */
-			new_val |= (val & SDHCI_CTRL_DMA_MASK) << 5;
-		}
+		/* DMA mode bits are shifted */
+		new_val |= (val & SDHCI_CTRL_DMA_MASK) << 5;
 
 		/*
 		 * Do not touch buswidth bits here. This is done in
-- 
2.47.3


