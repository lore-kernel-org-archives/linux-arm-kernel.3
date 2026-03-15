Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773DEF30283
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 20:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CPceeNJxYcOrj32GCH9mA8vAA8Kap02ECqmiWtmSPh4=; b=OMz94DBWkBhRcOFzv0Hsr917If
	By5ztuuw0mg9EP1nGmDYa+hJz2w3jlFmmc5l8YduPqIKQcSQUQjKYYTF/UEl7Xg1gqrC7qvGXjUw6
	STDmX9Q1ZJJCeaDKVMNl+N1TNWHWx/liyJemZxGchfGtZrzIv/CvOg4LhuEOzEySVMarmF4Zjd0xi
	sjq1C+3+k3p+9/J4QJUKz3YoceOiKD7A1mPFYQrUmRjaYfTd2r42CKKwGKwrsOSnKj5NYPTtwkOGY
	DJgJ1W3vB2X6j8AUfMYhcI+6Obf2kmWQxA7GDRoGNCa29w4FCkthJ8ghIoEPwLwva/pXTeMljh8d9
	W5CF0rQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1rz7-00000002tgk-1Qdf;
	Sun, 15 Mar 2026 20:22:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1rz4-00000002tgO-2YHh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 20:22:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48534237460so43240165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 13:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773606165; x=1774210965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CPceeNJxYcOrj32GCH9mA8vAA8Kap02ECqmiWtmSPh4=;
        b=QKgb6ds81jydXLcXHXenOQEFEOS1Xh9dX5h2XjsQKoZvjBMfQnAkdajQxVCBsV/D2w
         Gv8CChYIOEFfUtTbAuTpY4yCBzgwJeRR1GQ4i61xmdKo7T9S5p9kkonxxuk1xSn4p6gC
         JOsEcVyT3SdjENYIlE2vbSl2R4ZE/pR+SLfFynSFSlECUfH/xyEcNmQ3NK+Zx7z+pOtP
         8uTfAKZW43yZ3VzAnQX8DEmA7GQxPcnwrvp5fUmQhHkkSD2cdMRH67/8D8HIDlcagmk5
         CV2H31lDaUBryiLsXL/+IK+WObWbgtnLcFnK3A2QXehgcP+p1uYy1B2Z4Pd/OyvS9SsS
         I5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773606165; x=1774210965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPceeNJxYcOrj32GCH9mA8vAA8Kap02ECqmiWtmSPh4=;
        b=j4GTAnIX9wdhtm9+Xn6U2+oeF5dFRE/1rv5fA0I6B49HE6H1E/strgOFBrB/TuNFFD
         ipO6kq2D7FeB1LVCJw6b6BLlHnEkaQEwv1aqTR1j5F8B2K+XKTQABk59IwukHFo83/ny
         zyFe1nQF3QfhPn1Mb3kWINiCa7r9e8+vMcZihw3eOnp0M9m3eRFOmXFO4f0FpAhJjM/C
         9IzMUdvQo8fukv9Vxe2KAbpiFvmlbCpMZ+dUh5jb7wwV0KhJ6Yhrm62w+2y9wMY5bJHu
         K6ZI0U5jA91wYLISGkyjc2Av1PVikbp3UeQclPIECPEs8sPtZBvnq4Q6z8+S6fF6pTIl
         173A==
X-Forwarded-Encrypted: i=1; AJvYcCXKewsxRTEaWzhUBNLlTKmUrgd6xAZg8kWyNlMjZqfh60ByL9v5QGHtZnxPY5QIuJbUYHO0T0vt8gXwAYup2XBz@lists.infradead.org
X-Gm-Message-State: AOJu0YynIx9dJA87brAxxmB6+urokwrT7r+q0ufi266CzTNn7RO27+aw
	/r6qQTvfhJJbE1VbasSAJHMyEkdnEv8zrZza831g0FzKgo3+G2FhVivX
X-Gm-Gg: ATEYQzyLRAvYvKyJox0QDy4oC0+aXsCuBu0gsWRRMZUR03HraH94uWLNBI5TukO2OE2
	44kDjzEv820cpK1bQSOWjhRg9dfALgsQO9pbrzICA3aA4UUFNa8laOvnAIzzxvwD9y3Xvpckeic
	8qZIr3n+qVpt1O2uFIPvGyii8jCQDX2uZp2uU+tC4lG/JoaM9di7hW86jrWfMtruomoKELVFspR
	FHFpk1BhSFKfAqJ7uBk0gaQEHp8ptQ7kDlnkzS8JUPZMVMMMG3ywnaLmtYQs6U9JeBreiYekfhJ
	u7ePoHKZgEPcdOzLtxYmIz3hPS1ZiPA+QL4tU8Y79qlM6b8URYaelNyQoOZZJwyiLGteK1jkhgg
	kRUEwRZTg7qdILIqivphC81UlrBH9qMNA6KyNDSrbOcmsnYR5Vw/ffeoOQPGossWad6lTwJeiJ4
	NPRKgsN1CvBMnUkZ1c/xjX0JcC56ebzx9JNQ==
X-Received: by 2002:a05:600c:3552:b0:485:46fd:100a with SMTP id 5b1f17b1804b1-4855670299dmr172636005e9.25.1773606164279;
        Sun, 15 Mar 2026 13:22:44 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485563f619csm121862955e9.1.2026.03.15.13.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:22:43 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH v3 3/3] mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
Date: Sun, 15 Mar 2026 21:22:34 +0100
Message-ID: <20260315202238.15758-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_132246_661018_235CD7C0 
X-CRM114-Status: GOOD (  13.66  )
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

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
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


