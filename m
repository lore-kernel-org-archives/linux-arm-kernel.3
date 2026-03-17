Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A61FEDA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 19:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=utwObQp63pBMb8wBU24YfUsTgXDwwHCc0NNvyQURJJU=; b=PHCqa/enNq0GPRKSDNGeEqFAGa
	5EN2YewxBPH/lJ/8T1GnkAH9575mcrmwA8K4mEE09W8jeVNQhhmYbEGQZwnN1KeSlytXHzZuEND3/
	TXOnI0m5dtcASmSRbi+saKQ1P/4QPXFoxM1bAW/q4r/iCt4AEvbkW0nn6Pw5n4qz3Af+Y6HH7trqR
	2RzC4ow79XnWfORUuapBRTMrc6jgX3fpGwTFh0aUEdVqWgNaVN2wOZ0Ab+DjG7ENotYxcmUcyRnqY
	CqUqtrWlukEw6M1Mijdws5i44k5f+bhF+QS2YOTLw/w+Xffjr8VErNP5EXHQtDuG6oHOumGQ/vLMi
	W5G5PVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2aAK-000000078VG-0QBf;
	Tue, 17 Mar 2026 19:33:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2aAH-000000078Up-11W8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 19:33:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so14988165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 12:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773775995; x=1774380795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=utwObQp63pBMb8wBU24YfUsTgXDwwHCc0NNvyQURJJU=;
        b=D396UpL96kq7STL3QBGjPBZMm9p8qoDQO33qRsq0Tvu40Npgqnn7zBzhz6BECczU0U
         NjHQc9g8UYMKR3zHxZDLvYyGBv+faNaNS7ipRCUKlMJZWBQqpqFGXTKniLw232hzNUfi
         6bsXI6iedK2HbpSWWuuV5aWla2FD6xiOO7IqdNiAZF8rFYH5YrR9z4CWcCL4VrYxI4rH
         J19CroyDB1stbKwjHMr+dfGmbS2PbqccFDwO3EPFKPTskUbnNN4CdlUpnBprE64ZSZAG
         Ayn5BKcbWomyDZ5fgsmCh1OMxGH/LGtKxYJxmjQ5KpOYfZmtBZksxoCcB61dSCsyHd84
         NBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773775995; x=1774380795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utwObQp63pBMb8wBU24YfUsTgXDwwHCc0NNvyQURJJU=;
        b=hW1dp60e1JTJH4Uz4O/TXVtGyoVQW7RqR2nZkPj+gorAWQaCMGLtPBl/vMWF7mwqFK
         1EncIJV4tIvzqpsum9nsq+v+A1bofhYjA7l5G9gRtekK2dJIqv0m1eKS5n8+ppoZG+Vg
         QZbIEqJ9hXyh/iAMCVeYffn7PpfOzcN89zm4UsrdYKQe4yTonbo+PHXfq19JJ6694hcY
         THIeqFEpDU25NGcxw9NJZ1Dog1kXKgk4gxlTWlF7VIYA5NInEA45DLqGmIcJZrx690Xu
         LBFCCBsouyYxQ6nmMepcMCyjYQxWbQNSAvro9Z6/8BfVUBES59jS320XKFXFma+Rhr9x
         7L6A==
X-Forwarded-Encrypted: i=1; AJvYcCXu7MBepb6oYMyOLDB7s5f2n2zDLxc8zQLsZFajhZMc4xpHs+kIh9eki2Qtx1avaydz/O2cI6M9IrrQo/BeeWiL@lists.infradead.org
X-Gm-Message-State: AOJu0YxfwwMg+RR/cuAZoUJSytDbwrJBzMMssCpMh6PtVMEpid2Uq4Fz
	/Gp35UP4zJdmSAi6TgMBfnr0iuzf5nK4gTPq/o5txRmZN8/esR06a+l3
X-Gm-Gg: ATEYQzwIHg/w5tSG1wyEEZt7ATR2hOtO6ZEjysqyF7xLYNHOFIJQ/Zl+a1zbld1ntYy
	Nz2zlq1MiL4kt+Ty2dXgDSTW/q5zOi3ZLM/OJV1iUHTLoEW24RtE4EqTQdKUqaw59Eh59cZhiLc
	2HJMqshtqRqnuWkhYGcRxZcFPJo30JCw+5kOMswZ6nnZTUBARvc6k8wapwpn2zoXcl5IekvkJQn
	qliDbkkjO4hvdW2Fkt5PurhNtcbOqVMGYNrtj8YumHixvc6Cy2bDCtPDaLaLeSMlBDkVdrvGzAg
	0OMIZ+Fb0/fdvFvCfyXSda/3L/EcPuSaRK5bGNcXuoCho47AyO4vrbRvt6aFkAJmv55lTJlSYGC
	4+sDxGsTrhbYCyZT1p9oS0nYaQ2vjkExlnXcOp4EDKwKOgP4G3er3HgfHJFMAlS5EWpA29xWgky
	TP50TIwDk1yKkB7ODWn8NnwYofrePuaJ3E4zGQTTU7ec50
X-Received: by 2002:a05:600c:314c:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-486f443845dmr15339245e9.13.1773775994499;
        Tue, 17 Mar 2026 12:33:14 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f41d0c5bsm16762645e9.0.2026.03.17.12.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:33:14 -0700 (PDT)
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
Subject: [PATCH v4] mmc: sdhci-esdhc-imx: consolidate imx25/35 data
Date: Tue, 17 Mar 2026 20:33:09 +0100
Message-ID: <20260317193309.14091-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_123317_302004_65CFDA9E 
X-CRM114-Status: GOOD (  11.57  )
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

Consolidate esdhc_imx25 and esdhc_imx35 soc data into a single shared struct since they share the same flags. This reduces redundancy and simplifies data management for i.MX25 and i.MX35 SoCs.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

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


