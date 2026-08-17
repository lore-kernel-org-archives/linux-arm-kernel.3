Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4285CC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 00:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=virBiSedo0RsjgNtDHeYNu9b5zOw0VcBr57wB4SYviw=; b=qjUz9yMGx8QGRwsCa32IH5c2HU
	You+5aD52kU3JCLIGMslFKgvbevNZmcKXwpS+CYotJ3qCf9oTqmy3FhwPfolbBM+UsLiAJGsztElA
	ZRCGlr4YBTdKZfGLXuuxaSUT5tpWBap8HErPEfrx1xhS3/oyPT89ysXKkBIDF67iaHjQ0Q0FY/brb
	dflOYGtU3iOxOFiQpjRUwxOGQk6GE81uaP/A5GF6VrvVrqSgCn2qOW7NOot5ioWQg7a2gyLDtNaoq
	+BFt4QncQD6gClFp/Fok1kWLBj7TbgHChoHuPtnNjpulZ7iWrZuRwLgM6aw67gw4LKNSNAbMYd/2a
	/gBEAvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvlTQ-00000005EI1-1Rp9;
	Mon, 17 Aug 2026 00:45:08 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvlTO-00000005EHd-0Vx6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 00:45:07 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso1733427a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 17:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786927504; x=1787532304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=virBiSedo0RsjgNtDHeYNu9b5zOw0VcBr57wB4SYviw=;
        b=jW1pkbxWETC0S9QCzLJSIGWMe7VyDEklxmJPvoIMmAXTMJP8AQqdeKnyNfdCNenova
         zgYTfiL7q5sKwLQKHlTN4aq+xi2LkOjoegeB1mP+dnbSToMiP/8p9rrM1sa72KO4cxp0
         KS9cCFt/Y+Y1bqtsNjN0lhfimWFy7Ay35I3zgD8rQ2wA2wF5zAdDZzYoFZxxcQqU19JX
         hnyDAq9LDZCZC0ynzgxuXym6hItydlWaIgWKP0+XXXlyi8uXOIECleeRKkOKsBYR7EpN
         OtY70wSM+pUaR7QlJp1rhoh+DrOVD4Ei7XHumlNnz4prHEeY75fuKxQH2jA7jQO/sPG+
         fBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786927504; x=1787532304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=virBiSedo0RsjgNtDHeYNu9b5zOw0VcBr57wB4SYviw=;
        b=JzeOoPppMgEG5JcGWmZPFkyzqfP2hHYPQReCPeYjDNlY6wpddeR4B7SN1EQ+j3vbPN
         NGuLSUeUTjmdBqFn1cAuIdrKsLHv0etD7+6KF+8+RV7lib/p1PDA0pFUv+4xoK8C36o2
         3utKeyzhm1N4rWE92XPdZntPO2ENlVNTxFPsuYlHr4lAHQcjdjxYF64n2F3yt2wk8qU4
         K+qG0rZKRmQJ7SfakkYszBRMuS/Stfql+wGjNioKAaeuOlOWjPXLVIf8VBx/zkJHSYDe
         nyss14kmYlanoL72fL44g/U5F5G54UmOI3EZl6YTyIaTgtTlxAjLeA+OCkykAXbtDJi9
         Efsg==
X-Forwarded-Encrypted: i=1; AHgh+RrwvwGT6f5a7hQsh8x/qCIhgg0GbTSGUJFiD25Kk/+WIWAU2vi5K1XRdH838GoDvTjtKLDzj+I2/LQaYghhIr+Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo5FqVKVV56q7sVVeccVxgWc9BzS0FJ5DW4HMgT7V4SZWe7uhN
	qCpplPOTgxKkSS6qlu3MJckO7fES3JGtHK9KBJCihgy6aeeuYnW+YoS7
X-Gm-Gg: AR+sD11kwRhxCbPWGabzNQIb1WpgCGvp+QSnb50nOht0nzGzRDMcwsKApf9ySvPcY9E
	uvQq2AokOwB+33fgnM38v7taBIm7ju3dwHiWxDvMh17otGllsrMK22QNyUyAjZs9H5wOmcwkeEg
	qs00stOVQUJwPsBH460TOx35PINzFVOG2866hODYmJ5E0MyHDsMzWQAaqEWxdeMggnaJoRxVtVK
	FKaLK3fC+wasIv5CM+d7qWD/QNqKLdDFRGXYddTFSukS21jOq+1UQJwFpJbg31zGYaYy1GhdRmv
	4GLVlU1KA0fO0slvU4WGN3Xm2rHSB359hqiljwqmiraV3tq6zT87+GG+wdBiy+GqUyGMIwt0NZw
	5NdhJQTPQHUIFI4pQkiGSBX/+VByzobL3CCfmdRxMeLJurQAvNcYmL99uNd6T9PPNujUgLli1D/
	2VONtbeEKQdkIUCn6AFBrRUnzAT13MIIXFb30oBEIz49KVCBdcgdHs0Th56tZtW4yrUlJwkDzYV
	2tJqFUV4Hu8v89IruZVA5QbUgouQwMS3LKL6Lsuep4OfyjLsdIVQWnFjlFx5UZizUo7KYvbS7GH
	hezbK9JzZsxuVsS9YJeHdXMSbY1LIYFiM07aK+ClbRqfXe6q
X-Received: by 2002:a05:6a00:179f:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-84fde364c19mr20472853b3a.7.1786927504085;
        Sun, 16 Aug 2026 17:45:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d01c2e7sm2164077b3a.13.2026.08.16.17.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 17:45:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCH] dmaengine: bestcomm: ioremap and get irq early
Date: Sun, 16 Aug 2026 17:45:00 -0700
Message-ID: <20260817004500.59251-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_174506_182835_8A6B3DB4 
X-CRM114-Status: GOOD (  20.37  )
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

Doing so allows handling potential -EPROBE_DEFER before any work gets
done.

Replace the open-coded resource lookup, request_mem_region, ioremap and
the manual iounmap/release_mem_region cleanup in probe/remove with the
managed devm_platform_get_and_ioremap_resource() helper. This removes the
now-unused error-unmap/release paths and simplifies the driver.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: get irq early

platform_get_irq can return -EPROBE_DEFER, which is useful to avoid
doing extra work in such a case

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/bestcomm/bestcomm.c            | 70 ++++++----------------
 include/linux/fsl/bestcomm/bestcomm_priv.h |  2 +-
 2 files changed, 18 insertions(+), 54 deletions(-)

diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index 432b43520ddc..55ad7bc34df7 100644
--- a/drivers/dma/bestcomm/bestcomm.c
+++ b/drivers/dma/bestcomm/bestcomm.c
@@ -48,6 +48,7 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 {
 	int i, tasknum = -1;
 	struct bcom_task *tsk;
+	int irq;
 
 	/* Don't try to do anything if bestcomm init failed */
 	if (!bcom_eng)
@@ -68,6 +69,10 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 	if (tasknum < 0)
 		return NULL;
 
+	irq = platform_get_irq(bcom_eng->pdev, tasknum);
+	if (irq < 0)
+		return irq;
+
 	/* Allocate our structure */
 	tsk = kzalloc(sizeof(struct bcom_task) + priv_size, GFP_KERNEL);
 	if (!tsk)
@@ -77,10 +82,7 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 	if (priv_size)
 		tsk->priv = (void*)tsk + sizeof(struct bcom_task);
 
-	/* Get IRQ of that task */
-	tsk->irq = irq_of_parse_and_map(bcom_eng->ofnode, tsk->tasknum);
-	if (!tsk->irq)
-		goto error;
+	tsk->irq = irq;
 
 	/* Init the BDs, if needed */
 	if (bd_count) {
@@ -102,8 +104,6 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 
 error:
 	if (tsk) {
-		if (tsk->irq)
-			irq_dispose_mapping(tsk->irq);
 		bcom_sram_free(tsk->bd);
 		kfree(tsk->cookie);
 		kfree(tsk);
@@ -126,7 +126,6 @@ bcom_task_free(struct bcom_task *tsk)
 	bcom_eng->tdt[tsk->tasknum].stop  = 0;
 
 	/* Free everything */
-	irq_dispose_mapping(tsk->irq);
 	bcom_sram_free(tsk->bd);
 	kfree(tsk->cookie);
 	kfree(tsk);
@@ -365,23 +364,24 @@ bcom_engine_cleanup(void)
 static int mpc52xx_bcom_probe(struct platform_device *op)
 {
 	struct device_node *ofn_sram;
-	struct resource res_bcom;
+	struct resource *res_bcom;
+	void __iomem *regs;
 
 	int rv;
 
 	/* Inform user we're ok so far */
 	printk(KERN_INFO "DMA: MPC52xx BestComm driver\n");
 
-	/* Get the bestcomm node */
-	of_node_get(op->dev.of_node);
+	regs = devm_platform_get_and_ioremap_resource(op, 0, &res_bcom);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
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
@@ -389,7 +389,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	if (rv) {
 		printk(KERN_ERR DRIVER_NAME ": "
 			"Error in SRAM init\n");
-		goto error_ofput;
+		return rv;
 	}
 
 	/* Get a clean struct */
@@ -400,37 +400,14 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	}
 
 	/* Save the node */
-	bcom_eng->ofnode = op->dev.of_node;
-
-	/* Get, reserve & map io */
-	if (of_address_to_resource(op->dev.of_node, 0, &res_bcom)) {
-		printk(KERN_ERR DRIVER_NAME ": "
-			"Can't get resource\n");
-		rv = -EINVAL;
-		goto error_sramclean;
-	}
-
-	if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
-				DRIVER_NAME)) {
-		printk(KERN_ERR DRIVER_NAME ": "
-			"Can't request registers region\n");
-		rv = -EBUSY;
-		goto error_sramclean;
-	}
-
-	bcom_eng->regs_base = res_bcom.start;
-	bcom_eng->regs = ioremap(res_bcom.start, sizeof(struct mpc52xx_sdma));
-	if (!bcom_eng->regs) {
-		printk(KERN_ERR DRIVER_NAME ": "
-			"Can't map registers\n");
-		rv = -ENOMEM;
-		goto error_release;
-	}
+	bcom_eng->pdev = op;
+	bcom_eng->regs = regs;
+	bcom_eng->regs_base = res_bcom->start;
 
 	/* Now, do the real init */
 	rv = bcom_engine_init();
 	if (rv)
-		goto error_unmap;
+		goto error_sramclean;
 
 	/* Done ! */
 	printk(KERN_INFO "DMA: MPC52xx BestComm engine @%08lx ok !\n",
@@ -439,15 +416,9 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	return 0;
 
 	/* Error path */
-error_unmap:
-	iounmap(bcom_eng->regs);
-error_release:
-	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
 error_sramclean:
 	kfree(bcom_eng);
 	bcom_sram_cleanup();
-error_ofput:
-	of_node_put(op->dev.of_node);
 
 	printk(KERN_ERR "DMA: MPC52xx BestComm init failed !\n");
 
@@ -463,13 +434,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
 	/* Cleanup SRAM */
 	bcom_sram_cleanup();
 
-	/* Release regs */
-	iounmap(bcom_eng->regs);
-	release_mem_region(bcom_eng->regs_base, sizeof(struct mpc52xx_sdma));
-
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


