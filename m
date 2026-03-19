Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8738109190B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J98G/61sc667kDXVS1HdzK2h40Uy+YIn7bV3QsVznPU=; b=C+Iho89Aur1/w+StIdkY87Y0VG
	wGk3SgsphkvWX28YcU+BL7L1cPApGpOM81ROKRfjasM5Upu0elOWTC0mxYoE8S984/7xO6gdg+wLM
	qlhCC5wZEMBmtuKnOlQ0Di24nxqjaYFu8AA9qDHDUVF9Pq5JPBEfTNWyrokCUQixymUutSXUatMyd
	SSAWJUu7wTyY9841V8QWdD+s3ynTQUeFJ96+G/8BIXKClSV4C4+/+ngpAheJUPlauD59ouVF2ouZh
	VKqrXku7WuayxsvOSzz+ObY81rQFNbSTTi5Uj3F9YRDxhr5GJ+fOJ1thv/tG6KXuTqkzG2Qhy0M5k
	QOHJajUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I7w-0000000BLfF-1aNU;
	Thu, 19 Mar 2026 18:29:48 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I7u-0000000BLd7-22EC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:29:47 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so6762405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773944984; x=1774549784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J98G/61sc667kDXVS1HdzK2h40Uy+YIn7bV3QsVznPU=;
        b=hZIsapHkV1/08wyfeRAnWjvfQJBxvpG17lEsRtlRglhwAqIbtrk9XSERiA02Hk/ex5
         EnWYpenZSKcAYZ2XKhc+MLcJPrjoB/Tx6nto2NRGqssW+N8+2ZCRcXaatKGGf6peJho+
         MNFjmqeHSBjE2nbhaxCpox3u0UJe8RX4IKihClhUMawyM9pJVESDrVnu2hB+Y2cmhsAn
         unif8Jkww56Wdc3ZtWgJxaokyhRxN2QBYCrUjkYCTaP+dnzOSCghNl8cWPE9qZ0llEy8
         Hdxop5W0PphVSmFOKMwWQk2HPnUI56EKjGn+Ul0BXJW8Lw8OBIh6hMZzmF7iKn7NYz/N
         5ZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773944984; x=1774549784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J98G/61sc667kDXVS1HdzK2h40Uy+YIn7bV3QsVznPU=;
        b=itVuyc+4SH6+nG25nbBzwr+mAk5ODdtwNTUZXaGfOMfDjh1CKUW+VC/ZT0M0WPwFXB
         5TVMx2WYYPBpykklmA62bYb45QfZIRTF4bPQFE+AwndSSmR8svJz4MwIXUwT+rLsX8Eo
         nPmwlEZoBX1eP/1xhkVIrckA/W8pUJ74QkuNzI6BSxjUHTAkMzNdgxYQGNOT6D8g5bnp
         2GkxXicW9dKeSAD0YX0tNA8+KMIzTI1nbtlsB5vg3tg3NzPvk/D3Ie+4vC7Htn3sWYa0
         j3xlVJEeAXIrUyG4GwyUNgZ45QPUFMGqWlYdlS+csfOfByVByvc6zyRfo1QFJyS6gx3W
         X10Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGHnFWFD1znYZ+MZ7YPNDuIj+v/Psnv25WfVjnJWfkqL1CKFzU8Mk/yStp12IRYLeZmVou55BHtVA0IjMc9Nub@lists.infradead.org
X-Gm-Message-State: AOJu0YxBWTIm6bTIdvdMR6KF3SNAT+zfnvQXmCu7RuJgprO5iwoz9CdV
	ObLEXUR5CPjo0P6Jc4IdI/ITgx+6OJJvXnYidi9qN0TLhym8nX/gwHjb
X-Gm-Gg: ATEYQzzKAc0PSE38foJI+4Y/mXlwdDuF7SsX4cERO5JskmE30Ut34nX/S2WpDnZYpxf
	7EJkWDhFDKZsSdWGTDH4aQ3VTg5+F87l/5zcvnQlG+/ZaepBxA3DWlRp4Pjr5z+W23+0DNPUw9a
	win7KOhtXUNLUBN9N91BzB6vTj7CSmUevrgs1CUsbEnO1vr4uegxkE9VNPtUZkuKi61ROAQgMAm
	jRK7dObT0pwegNtk1qyZLd8CiZYdgKfQqLQucLXLIHr5TNTl6fS444VeotjPgn8esikVTCM/iWH
	216HGyxH2KklzRf8H9pFLo4L61kyFYuYpj+8ubMiKV0h6ZvgS206+7kLAQYQXzNR4lnT9x1xbdg
	bEwXqO46MBrH9cUK/uViK/AsRB/M2VosoBaUxrSr9lzzB9eilZUNMKCr8mBWZsJbFSmu2NlnLeN
	4e2BH8fDplnrFRPI+Dqiws9XD2Tj6ApQaYcacA1JvptqKt
X-Received: by 2002:a05:600c:c493:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-486fedbd0b0mr2311045e9.11.1773944983675;
        Thu, 19 Mar 2026 11:29:43 -0700 (PDT)
Received: from debian.lan ([171.22.85.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b949e1sm142204505e9.9.2026.03.19.11.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:29:43 -0700 (PDT)
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
Subject: [PATCH v7 3/3] mmc: sdhci-esdhc-imx: remove redundant mx25 handling and consolidate soc data
Date: Thu, 19 Mar 2026 19:29:38 +0100
Message-ID: <20260319182938.19525-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_112946_543152_0BD00132 
X-CRM114-Status: GOOD (  13.85  )
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

Remove the is_imx25_esdhc check and redundant mx25-specific handling as it's no longer necessary since the new_soc initialization. Consolidate the drive data structs for imx25/35.

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


