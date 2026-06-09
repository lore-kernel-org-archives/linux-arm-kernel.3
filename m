Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5226CCD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ah8w3Udia5Uf8f7IAKPt49JbdNJKDfUC4gBLeS1QUbg=; b=Ly7podmp4fgRJN+rJ8XDKSXa2M
	TKVAOeNzUSUXOK6VnWFUbqiTPr2jc5PlGud0U4uHUT6rzXGiQEEEjSYvnRHVfFNmCWjRK+kE/WNMx
	X47iYm2TQvfENKvS94o3bVXeDooJpkbwKlYCWROvBkXrsnHAwoGRugF5O/8SXGahJuAlBPmVNRm5a
	yfKHWvYeLAJy9jFuYMGQpZGre5QDmUh594IYiW27fwIcfPZa1ZyJihPtA9qh82Sp45/am4d/Krpw1
	OpdTnHYFdb8WTBX5VaWo/fonBUPBLXE/dSkUD55ZUy0szQwTfxUXu349YIamVaXKECno64y6OfTIi
	kFBJhuPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2AB-00000006HfA-1a9y;
	Tue, 09 Jun 2026 19:31:03 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2A9-00000006Hel-00B3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 19:31:02 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-7e3b2a435ecso54922787b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 12:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781033459; x=1781638259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ah8w3Udia5Uf8f7IAKPt49JbdNJKDfUC4gBLeS1QUbg=;
        b=Fq6Sufhrki3T67eQ4U99UG/37Zn3F5II9eW4UiiEIKrINs9EociwJvIrSfCZmvUvYb
         gxZB6k2DB8CdeWD24saFRtYEUe+BOXtR1OMRYv2DwZSh8C5M73NxOoioALCqriGrV3/Z
         ru3mGIjUBG1R7P95hcCoH8pKZwDCANbEoJJ9zJKUwTgBF3U5nqFxSZbZPkTZlRvSdkbQ
         4zEY2nOsxZsrOqALEXfvzz7nTiyfmgcMIhfakYdey3B4x4gWCOXlOmh/LUa4CrpHUXS4
         fEuSsa0791/3jDHPkKIB097bSlkYSzQI1PYxpVCq3Nl1m9kJLOSJsUB8MSJfJlwXuNBW
         G/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781033459; x=1781638259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah8w3Udia5Uf8f7IAKPt49JbdNJKDfUC4gBLeS1QUbg=;
        b=PHrkYHqggqXDLCQiDn49kzK1QRchVIJ8USpV/oy1kVosycsC8s+3AAgXlI169cTKvq
         MlMG4c3M6uULteWbavWgVeSTDXiPQBjD9KoC2htP5PKyV0GGDqKDaE8+nxvGsiZqNWxZ
         fOtGx7ywr+iEu99lfW2kp29VpBjZ2Db3mIwW6+es8lOikf1KOafkLj2bVxRhq4qtv+p3
         QKeMNLRfnI1MasCq3c6HKt3RCMcRpWTAk5+O6W2jIinNmBdq1PjnQhqoRd90sA9QRx60
         F0YNUvH7tO90G4clWzKcLoDd9vxwSdsmZikBdFObr7c/QIMImz6gLFXOt1yhtjuDzobe
         JKMA==
X-Forwarded-Encrypted: i=1; AFNElJ8klY7jNwcHx2zDtAywOhs3p4K3KYAHwLMMXuKkKtPJYJmU90VXKC9B+Yjj2I6AQl8TcJrGlbQlJwlYehAJUAP/@lists.infradead.org
X-Gm-Message-State: AOJu0YzdGJ8AoWJ1XjQD/q1QNYtwz2/wX1JOKef8qE4+U5zqRo+a6ZBv
	Kt5v4UpYh4Vu8U9xqTGnRrhLdjE8q1F4eRojtS5EewYri1K2WnVm8dRfIoM72ugK
X-Gm-Gg: Acq92OF7WOTGebQtTD6+T2Fc6P7csla4HLkAgPOnmHLUCBDVHhhYHLUanwVR3JP2RC/
	tv1UccJRIC80LGSJ25M8KxWFDlxMkqMs1dXg7vs0c2X1gAX/BaYq4hwGnjHbA4xRZRHCxKkG7Ws
	yJNAZHge4MmzstMqUG+uyWctTTSJs1ILb+Q8FDThUUGonBGrnA3e/AkVn2JppobgZSmcaybOBJe
	YoXIjEEVPyxchdQKNWOE+vFd47sCFJ3XGvraZ83nlcR+jY7PaDZujhtq+h12UBtEtPgdGhDA1lW
	Hs+wm6FmtkHFX/LyXEmNZDhpgFtnMFBvV9rVWU1Mrp43yS9nJ6Q1E6scMYkrE8UC7/G6PCoHJoS
	aniAtI5kXjklNsmVEtyFjk57S9sOS3F3KShBq/aGM04WE7e6mYMMAfdNvmMnvTZAxx60tPwd/xE
	adees/1jaqfnIQ/3SmjAKC/gVRrh6slsLXSMOPUp/K7+eMKTvDk9gOI240dtX4p3EBM6UKiMhVH
	XQNDHD+ZNqWlv8Xp2ye/uRb0G33lM6Rh/rO+O5e5NS0zGVgNdl12FqR
X-Received: by 2002:a05:690c:c508:b0:7d1:c256:b5a8 with SMTP id 00721157ae682-7ed0cee7e6fmr196251467b3.40.1781033459087;
        Tue, 09 Jun 2026 12:30:59 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea23a97729sm102970987b3.36.2026.06.09.12.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:30:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv2] dmaengine: st_fdma: simplify allocation by using flexible array
Date: Tue,  9 Jun 2026 12:30:40 -0700
Message-ID: <20260609193040.4504-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_123101_045207_407FCF3D 
X-CRM114-Status: GOOD (  14.21  )
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
after allocation before any array accesses.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: Update subject
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
2.54.0


