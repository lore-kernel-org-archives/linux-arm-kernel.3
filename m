Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF0C1061B08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UW7odxZPYSWuCgnGtpRjdMtnRpvYwb8B9YLZ+r/hXWM=; b=K+V/TJbAG+9Omwoh/ZTFOgiy4m
	m7a+l4aqEGl3OS8BP0CQK0/SiQvcCFc3HhXAe6Ky7Z/OKJ+ui2s6Q8E/2RYKzFxChsLtzcXlF6EnL
	F4DbevtWd1WF05BPwR9jrgyyF8ZkUvi4jiILcmJDbae2NfQthE1Gkus2eoTrVuYEAExCf9oYZJy+m
	DcF4u+/K3lxHH7kzx0TOEN5HNcJ2Nk22pyWov6jhdANKPgUNwNYEDcIV1bHAxrhAfaVuVoFWYRIYW
	FVlWF40q6NnK+b6lDsU6gL/Nd2Cd+q2owoJ6G8owYJkU0ewXA2ko1w/e3vl1MX1pOZl/VUQfzfRuK
	PKmsFqtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jy4-0000000Btsl-3MiW;
	Mon, 30 Mar 2026 21:16:16 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jy2-0000000BtsQ-0tKq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:16:15 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-829781b2b01so2519288b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774905373; x=1775510173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UW7odxZPYSWuCgnGtpRjdMtnRpvYwb8B9YLZ+r/hXWM=;
        b=tEenbX++NHPJI/b9cYrC3qvPICck1mme2Ftka0AUMPxI6dfjnlDM98kjR/W5JZcLL3
         JpzqoPR6yV4DG7LtAZVBqMH2xhic5BO7YSTKfPy5654/Ngcc/7emjImeMLeQhcGczvjc
         c5JtTx0qfcnzsDXDFt0j1J1FAc3n5EAO2fTXp5dmL1VXV0db1Oug/51UMBcb4jArGOil
         a3fSLzlhVpj5j4b3B0miUlUKs6wAu1uwU5N+tbtv34tbJK9UH3EYiyy/JCd+3uWQONM8
         m5bYg5BSUNjONwQ4J3JQR/EBW4SMulIIQhi5/vj8hlNAxrXAR+nPUrvwZkyhnsmPuKnR
         nnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905373; x=1775510173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UW7odxZPYSWuCgnGtpRjdMtnRpvYwb8B9YLZ+r/hXWM=;
        b=c8zXgiNNpGaazwDyol8pbxhk/fmlncvWCr/t9qgEYRv4Dpm9SL2gkbRMBsx29jBrRN
         GwwvF+rtgoUo7fUHkOpppIbYnWB6EtAVSuXtJGIs/CcaQl6Q3+02C4THzPMvxUFi7UBY
         mbRTPkd65TuFeysruo9yG9+0Ie3dJSPXAuWfob+GHZLNcYVXK90q5T0EzzdZ0zwMVgRS
         lJCAC6gVfxpERCH8ofMySPDUmIkRvjNhJU6BfkAih7l9dvtcG0nxe5IatSnsT+VI+rkE
         Np1OB9+NnaC5PXvpXdnS33n8n9IQLrbq79o9vx6QMmvhxcJStwtx8I3oq5hIYp72zcXW
         QDAw==
X-Forwarded-Encrypted: i=1; AJvYcCVJEyNb3dvUlkKPD9XLT0ohiG/KnCaBkspZxWl/tckH6KvuP6gZGo7O4nhIhKIA92fYnagtBDaZ2/YMm5TIzYAg@lists.infradead.org
X-Gm-Message-State: AOJu0YwjsgjwlCR26Rhc/gXogKFvvS2uze3mMKDt2wocRag2vZtJmGR8
	YIlNjOfpyixijt2s+jezB4/mmUERz7I558A1xrx0LyJzv1wVXTa7v3Us
X-Gm-Gg: ATEYQzy8NNYZ9QIY4k2uV58+GcwF5jgQRARK6o2kRKbsShtZy1cDMhsnPfMCBzdVnIb
	Lv34286rWKXv+DWpdyiemJ9JxRImgK/wjWgzHfEnjq9ceAcvxARp0QoBR32DXDeBzkK4l9fIvto
	dhm+Q5jOmn12gGlwEqig2AYGJm2WHQYUB4m+Ahsb+wkt1PTmXwLHCCKDjdDRsijKgyqy+QlcuKJ
	h2V/gWSS2jkxy9QG3EWq9Mg/ToVJSArcDQK1chUnopxB5bl0uXf0SAcibsiQKsNFjOzK4EtAM2r
	z1HbKC3HYjXxwxw2xTMNY66XWcxQfILCYnpa/IZaxLcs9rfPgiQlY61TPqtqY1U0OPzdXE83nMQ
	dYxFJldJ7ENOGtm90TYPr8LBVabAYgx8FEKPluLVr9Sttnja+WmhehCT6Xr1zBZmvX8FW4Fg/Gy
	hOl0kux2wRJ024aKGqHP6JCMDRDlFqD6zuNEhJdwY1jTgNnOd5Qcg/lXc=
X-Received: by 2002:a05:6a00:4146:b0:82c:9126:31f1 with SMTP id d2e1a72fcca58-82c95c2188bmr14066508b3a.14.1774905373173;
        Mon, 30 Mar 2026 14:16:13 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8466d89sm8661610b3a.22.2026.03.30.14.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:16:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] dmaengine: st_fdma: simplify allocation
Date: Mon, 30 Mar 2026 14:15:55 -0700
Message-ID: <20260330211555.13974-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_141614_273443_B53B8147 
X-CRM114-Status: GOOD (  14.52  )
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

Use a flexible array member to combine kzalloc and kcalloc to a single
allocation.

Add __counted_by for extra runtime analysis. Assign counting variable
after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/st_fdma.c | 27 ++++++++-------------------
 drivers/dma/st_fdma.h |  4 ++--
 2 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index d9547017f3bd..3ec0d6731b8d 100644
--- a/drivers/dma/st_fdma.c
+++ b/drivers/dma/st_fdma.c
@@ -710,16 +710,6 @@ static const struct of_device_id st_fdma_match[] = {
 };
 MODULE_DEVICE_TABLE(of, st_fdma_match);
 
-static int st_fdma_parse_dt(struct platform_device *pdev,
-			const struct st_fdma_driverdata *drvdata,
-			struct st_fdma_dev *fdev)
-{
-	snprintf(fdev->fw_name, FW_NAME_SIZE, "fdma_%s_%d.elf",
-		drvdata->name, drvdata->id);
-
-	return of_property_read_u32(pdev->dev.of_node, "dma-channels",
-				    &fdev->nr_channels);
-}
 #define FDMA_DMA_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
 				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
 				 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
@@ -742,27 +732,26 @@ static int st_fdma_probe(struct platform_device *pdev)
 	struct st_fdma_dev *fdev;
 	struct device_node *np = pdev->dev.of_node;
 	const struct st_fdma_driverdata *drvdata;
+	u32 nr_channels;
 	int ret, i;
 
 	drvdata = device_get_match_data(&pdev->dev);
 
-	fdev = devm_kzalloc(&pdev->dev, sizeof(*fdev), GFP_KERNEL);
-	if (!fdev)
-		return -ENOMEM;
-
-	ret = st_fdma_parse_dt(pdev, drvdata, fdev);
+	ret = of_property_read_u32(pdev->dev.of_node, "dma-channels", &nr_channels);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to find platform data\n");
-		goto err;
+		return ret;
 	}
 
-	fdev->chans = devm_kcalloc(&pdev->dev, fdev->nr_channels,
-				   sizeof(struct st_fdma_chan), GFP_KERNEL);
-	if (!fdev->chans)
+	fdev = devm_kzalloc(&pdev->dev, struct_size(fdev, chans, nr_channels), GFP_KERNEL);
+	if (!fdev)
 		return -ENOMEM;
 
+	fdev->nr_channels = nr_channels;
 	fdev->dev = &pdev->dev;
 	fdev->drvdata = drvdata;
+	snprintf(fdev->fw_name, FW_NAME_SIZE, "fdma_%s_%d.elf", drvdata->name, drvdata->id);
+
 	platform_set_drvdata(pdev, fdev);
 
 	fdev->irq = platform_get_irq(pdev, 0);
diff --git a/drivers/dma/st_fdma.h b/drivers/dma/st_fdma.h
index f1e746f7bc7d..27ded555879f 100644
--- a/drivers/dma/st_fdma.h
+++ b/drivers/dma/st_fdma.h
@@ -136,13 +136,13 @@ struct st_fdma_dev {
 
 	int irq;
 
-	struct st_fdma_chan *chans;
-
 	spinlock_t dreq_lock;
 	unsigned long dreq_mask;
 
 	u32 nr_channels;
 	char fw_name[FW_NAME_SIZE];
+
+	struct st_fdma_chan chans[] __counted_by(nr_channels);
 };
 
 /* Peripheral Registers*/
-- 
2.53.0


