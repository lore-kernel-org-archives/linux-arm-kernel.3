Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7685C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 22:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wqgRj8Zu/oLhBcm8V6wCiIRsYY69FuThlNcNP+a4SnE=; b=YHRyKD5nNmOSxzv1zUbpgZBZQE
	jXW8wQhZhv5FPOvbJPXc8tuL3PHhIBP5T48togDfhYmq1VyfSeymlvWRJtcVDfMkDUowXjQrVW3lh
	4tGlZR2z1G0BR2IQU1s7djFK6hvFyv04JMqCkKWPND8uzGaydtSENiceY92XCZz2oc4eX88ZAv2KS
	GmuOsCuJivsafipef8qLYqcmENibzd+ErpXm4Gq+aTA6338G5gj8SAiIn04SlwVmjzmWLMbTSc6GT
	evWWxGeXcoYJHTr3BYe0eULacPN3nCMYnSCbWc/7Sh/9RbbzL9WbhlAox+uoftcAC29OkhcaWdAC7
	xnh5fmIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6yKJ-0000000ADDF-1Y70;
	Wed, 16 Sep 2026 22:42:03 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6yKH-0000000ADCW-0Ldo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 22:42:02 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d8fe517774so2808275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 15:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789598519; x=1790203319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wqgRj8Zu/oLhBcm8V6wCiIRsYY69FuThlNcNP+a4SnE=;
        b=oOowRF3pTqtBXLf4GTkTPetyWEBypqy6svmmeTYbsueYVwe+9K+hx20+y5l6FiW3c8
         cLRuTLIqhNX1l70Aha0BwELQ/kfcjRkEQy0Hx/eFbd8ovfMIJn7ineyERuVANfaMUJf8
         FRUMJauTMJeteOifpEI02JxlZsPMia48yT5ZTiD90vxi+nFce22HxcZKWH6GDNXQxqZL
         EV5rHDIJmXgczlLb4a58w5KqwqZbgV0F2jVBC2ovbShzx8jUQRNGTqRrNSR+90txjJNP
         nrA8BFJwDroAd708R0/QKd1sTy8QsrhJZ14smYpEoBDwGUnDKT4UIlD5eUH2I2n997K3
         kE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789598519; x=1790203319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wqgRj8Zu/oLhBcm8V6wCiIRsYY69FuThlNcNP+a4SnE=;
        b=b+LJ2CqsUhk6YD1E1les/8xivL6ewUKb/9F8KpPvt4KGy9OfvFIzywP4l/oLcrCvQX
         yBVIagH4cqhMoV4kdKmhoe0Wo2X9Uy+6MlQsZtcl3TaBIaR30C/4F0m5ytZtiqYdzbpe
         ozam2vt4sKSwOlNI+vHleB+De4JAZ2TEhZBA3kzG5wfNmoEzr+0MjE8IvKuIzQlJBgKp
         /m2CiOdVrs04Z0JyWsbPSo5lu+Kdan6Ja032adC+OLOQLwlHVK/EcK+nroQ5jhXqW5Bd
         PL0bI2zKRJDjX4Tm7Vrtmgyda45zRzCJ0HXA5EPDZig+jPfA68XolVYnIJtjLHSF4y5R
         rLow==
X-Forwarded-Encrypted: i=1; AKwUvBxPNSeS6yVqdTPyEWko3k1E89Z2DGc7wkC7+o1gW+927zhT2xzzU9+fznU9cffmbahrBC8zH+dZyLtv0Mob/Sck@lists.infradead.org
X-Gm-Message-State: AFuF++mreWEJAR8jqbpr3Ut1IyLIvxSFA0iFFG3+IiDXCtECaA5zcOun
	LTmG9uM/luwELkQZSl5Fm30DsEkYhwQUAtq74a/apKKROBQpfLiq2Hqp
X-Gm-Gg: AYBFou0FL1HlVGHgrxOLKrFvSiHJhBiZPmav8+GB7S+WWqRUCBaLxXFfvHZ3vYZAXZH
	2SnEnJA+c+iR/l8DqMvmMAUjB5WtLguEmYhY3xUkQem1EtgYFdKmQfQi+dnHgOC9pftQ78fQiCY
	0tYagaUfiyUTPQj9ccBVdXjAOVtNNU0qh9T0e1UOBQ9OwmzOmnAsiXl40Ow5Yjd7wxkA5nufpL2
	h6ZI6zBrX7Zjw8CrMwYaFugWgN9geQdMupkaMM8Yk/pqmnDavZ/sLOz/J87ksH1zh4zcIYmHgLv
	IDwmcVjzUTX5L9qJLVcmv1TFe2xsFHnHG1ykftJii75rQt20RQhzFZ7l/O20e8DGXO4hbBSY5LY
	AzisDXu5oYNnalnkzQncKzxvX23wZcpph+cRZ9w83XcyQZvBrxHozsdIm9cTq983Ys12YucB/Pi
	3qcbs1ohPdrYetTBkeLHLj3uImwM4Izt9Jcea5A3MoBpiad2ancyUnCSdSNtAsc95qavRuT7S6r
	MNvlHMp5Vg0HaVqy/LVp9rdQqtu2YMYxTgqZuzN4czVLmXR4iP06QSTuh2oLa3zvLXO6+XQD3/r
	eIQVirSf0F5qXnMxAqmtzk/9JSL4WP2jwLVYRUQOgC2h2aar
X-Received: by 2002:a17:90b:560e:b0:39e:3bd2:8998 with SMTP id 98e67ed59e1d1-39e3bd28b84mr1304054a91.22.1789598519204;
        Wed, 16 Sep 2026 15:41:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395caccf1sm8260106c88.2.2026.09.16.15.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 15:41:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCHv2] dmaengine: bestcomm: use platform machinery to get irq
Date: Wed, 16 Sep 2026 15:41:56 -0700
Message-ID: <20260916224156.276511-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_154201_122621_2575B1C5 
X-CRM114-Status: GOOD (  20.83  )
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

platform_get_irq() avoids having to explicitly map and dispose of an irq
by having the platform_device machinery take care of it.

This requires replacing the device_node with a platform_device in the
bcom_eng struct so that platform_get_irq() can use it.

Conveniently, this also allows getting rid of of_node_get and
of_node_put as the platform_device machinery also handles that.

Replace the open-coded resource lookup, request_mem_region, ioremap and
the manual iounmap/release_mem_region cleanup in probe/remove with the
managed devm_platform_get_and_ioremap_resource() helper. This removes the
now-unused error-unmap/release paths and simplifies the driver.

Adjust the goto labels in bcom_task_alloc to match what is being freed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: resend.
 drivers/dma/bestcomm/bestcomm.c            | 47 ++++++++--------------
 include/linux/fsl/bestcomm/bestcomm_priv.h |  2 +-
 2 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index 241a91936fe8..1006030ff167 100644
--- a/drivers/dma/bestcomm/bestcomm.c
+++ b/drivers/dma/bestcomm/bestcomm.c
@@ -47,6 +47,7 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 {
 	int i, tasknum = -1;
 	struct bcom_task *tsk;
+	int irq;
 
 	/* Don't try to do anything if bestcomm init failed */
 	if (!bcom_eng)
@@ -67,30 +68,32 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 	if (tasknum < 0)
 		return NULL;
 
+	irq = platform_get_irq(bcom_eng->pdev, tasknum);
+	if (irq < 0)
+		goto err1;
+
 	/* Allocate our structure */
 	tsk = kzalloc(sizeof(struct bcom_task) + priv_size, GFP_KERNEL);
 	if (!tsk)
-		goto error;
+		goto err1;
 
 	tsk->tasknum = tasknum;
 	if (priv_size)
 		tsk->priv = (void*)tsk + sizeof(struct bcom_task);
 
 	/* Get IRQ of that task */
-	tsk->irq = irq_of_parse_and_map(bcom_eng->ofnode, tsk->tasknum);
-	if (!tsk->irq)
-		goto error;
+	tsk->irq = irq;
 
 	/* Init the BDs, if needed */
 	if (bd_count) {
 		tsk->cookie = kmalloc_array(bd_count, sizeof(void *),
 					    GFP_KERNEL);
 		if (!tsk->cookie)
-			goto error;
+			goto err2;
 
 		tsk->bd = bcom_sram_alloc(bd_count * bd_size, 4, &tsk->bd_pa);
 		if (!tsk->bd)
-			goto error;
+			goto err3;
 		memset_io(tsk->bd, 0x00, bd_count * bd_size);
 
 		tsk->num_bd = bd_count;
@@ -99,17 +102,12 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 
 	return tsk;
 
-error:
-	if (tsk) {
-		if (tsk->irq)
-			irq_dispose_mapping(tsk->irq);
-		bcom_sram_free(tsk->bd);
-		kfree(tsk->cookie);
-		kfree(tsk);
-	}
-
+err3:
+	kfree(tsk->cookie);
+err2:
+	kfree(tsk);
+err1:
 	bcom_eng->tdt[tasknum].stop = 0;
-
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(bcom_task_alloc);
@@ -125,7 +123,6 @@ bcom_task_free(struct bcom_task *tsk)
 	bcom_eng->tdt[tsk->tasknum].stop  = 0;
 
 	/* Free everything */
-	irq_dispose_mapping(tsk->irq);
 	bcom_sram_free(tsk->bd);
 	kfree(tsk->cookie);
 	kfree(tsk);
@@ -377,16 +374,12 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	/* Get the bestcomm node */
-	of_node_get(op->dev.of_node);
-
 	/* Prepare SRAM */
 	ofn_sram = of_find_matching_node(NULL, mpc52xx_sram_ids);
 	if (!ofn_sram) {
 		printk(KERN_ERR DRIVER_NAME ": "
 			"No SRAM found in device tree\n");
-		rv = -ENODEV;
-		goto error_ofput;
+		return -ENODEV;
 	}
 	rv = bcom_sram_init(ofn_sram, DRIVER_NAME);
 	of_node_put(ofn_sram);
@@ -394,7 +387,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	if (rv) {
 		printk(KERN_ERR DRIVER_NAME ": "
 			"Error in SRAM init\n");
-		goto error_ofput;
+		return rv;
 	}
 
 	/* Get a clean struct */
@@ -405,8 +398,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	}
 
 	/* Save the node */
-	bcom_eng->ofnode = op->dev.of_node;
-
+	bcom_eng->pdev = op;
 	bcom_eng->regs = regs;
 	bcom_eng->regs_base = res_bcom->start;
 
@@ -426,8 +418,6 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	kfree(bcom_eng);
 	bcom_eng = NULL;
 	bcom_sram_cleanup();
-error_ofput:
-	of_node_put(op->dev.of_node);
 
 	printk(KERN_ERR "DMA: MPC52xx BestComm init failed !\n");
 
@@ -443,9 +433,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
 	/* Cleanup SRAM */
 	bcom_sram_cleanup();
 
-	/* Release the node */
-	of_node_put(bcom_eng->ofnode);
-
 	/* Release memory */
 	kfree(bcom_eng);
 	bcom_eng = NULL;
diff --git a/include/linux/fsl/bestcomm/bestcomm_priv.h b/include/linux/fsl/bestcomm/bestcomm_priv.h
index 3b52f3ffbdf8..cddde7c74cb5 100644
--- a/include/linux/fsl/bestcomm/bestcomm_priv.h
+++ b/include/linux/fsl/bestcomm/bestcomm_priv.h
@@ -66,7 +66,7 @@ struct bcom_tdt {
  * This holds all info needed globaly to handle the engine
  */
 struct bcom_engine {
-	struct device_node		*ofnode;
+	struct platform_device		*pdev;
 	struct mpc52xx_sdma __iomem     *regs;
 	phys_addr_t                      regs_base;
 
-- 
2.55.0


