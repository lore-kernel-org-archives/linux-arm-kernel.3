Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C8CC982D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 00:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ze9VNiKl6gpQF1dbQkXgpHisrGJOTGys22qHllYAsvk=; b=YpFJ1Ynci+Ghs3jjy72P98h/Ov
	Heyf0IyUvbiR0TcW5mjlszUAyIBgdc+NGUkPQw2MIqtkNtGKolnO0nuPILr2qo/b+5anp1r23DANp
	eJBvA8mhJrmcusNx+Yrx2YvKNrFFOKa+eBMdcvHS3lXr+vNm9KEXF5u21BfUKmEU5+mwKMnw7FAvs
	nDhgeFeSQYmqz+wmU+vDh7kNv36u7wF6xGi4ZI7aIn+0xNbEXUMmGvsJEg5lvUFM2JUk8j46a0QMz
	5a97vZ/E9nwKyxmR6LHMOevdr6xnUhD6tCwMPnCEaPo7sVqL8KHVYyHgO4dnBpccjwySXyyDtdEmc
	Ff2UvxZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7MJO-0000000D0hO-0n4B;
	Fri, 18 Sep 2026 00:18:42 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7MJM-0000000D0gt-2We8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 00:18:41 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so47415a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789690720; x=1790295520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ze9VNiKl6gpQF1dbQkXgpHisrGJOTGys22qHllYAsvk=;
        b=VHjqDcK1P2moYPhgiJT2FqK/FuXGYLKsBvtPQwIK9BKCGzthQamrxEZk1UDXPxH0Jm
         hnx/YQcymFNbHDPdi7R2832l/20raVfu2PN4GNvFP/H3UAKiM8u1v7tfnnAzm10iUir6
         3oU1nvcovMs7BWzXgfggAs0+oyMk9g4qSJqVm769wc9WUSX8Mq9tBaAdVn7TTamc6+yY
         9qPikwLKPwg1VDwkt3/vgpMLl4YbGjFiWK77tPUoO7aUfRSl624tzXYFJlxwtT/5Rfsy
         ps7UYtwMT7eY+gxAZGJBwDrJl9xFNsNzwhItZHCDHMYyZl4Huhsgsv3rMmgnoTBTX6TC
         Nz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789690720; x=1790295520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ze9VNiKl6gpQF1dbQkXgpHisrGJOTGys22qHllYAsvk=;
        b=z2f+ZJ5FvKIRIa6Z2VYfKlzVUFPdbVzGoa6tDjT1jjn0mID46a+2QyGvzQnJRf9Mc1
         3NJcfrV3By5R+1XjLfnAxX9wzD5nx5+oidZ5n6a6tRBrBeqmzy6KPIf3HC0zDxvNv4ul
         Xp1vLUYHbs7HnvDc8u8j8UBB52kZRzO2pIfgZcYyozogVmlMsTKnZbkpcpe27kp3FQe4
         6+EkS7yKQZaL4Qk9+IQUNQAz0uQc+tkf/RL+/LiIUmXVVBCv0hKQabNB8va+ilbc2UDd
         uRRXDUvDiFGPnmvlRJ8EQngwW2iHCJKU740b6oUQ3UsueS4NXUa8RDFejIQ1QsSqoCka
         hycQ==
X-Forwarded-Encrypted: i=1; AKwUvBznQBEMYqdHn5M8+a6d9HtmUvrPpTK6E7jPEqtcwuuV2wbTnWHLay1yD+mgmhm0op8D5IZzdsKpdNuihQAacUIJ@lists.infradead.org
X-Gm-Message-State: AFuF++nC/2A3U71HPkIzmQ95c7US22bt3sUrbO8XO7TiYy5ACNi5yHU5
	l/rYCJgt/pok8l2Ja1NUup3IH6xenokdSLo8/KcS/DlCuAsA08ghpWfglFG/Fw==
X-Gm-Gg: AYBFou26IdwhZ+PL1T7DOr46EORdabS1AcUJfq5o4w0M7Arm//AMEe98lUdenDa4JvE
	teAi7a9JoqKORdk2SeBxlELBIQCZ1nKgKpesY7fDr1DAjj0a25vqabXduacqGvh7Ipp8W+VX201
	FDdBYk9RzsmFSk2EUzboxB4ajjG4aYMH6hOBdTXmgWIondkLU/kEaeo9jw7paetPB9/jRvGJ9LL
	xHWOplEMqtEE43upUpRBYOVx0wXMmSendvJ2WgpNctJuA/B3kl1ybtgGlQE6oco3oqZzuoTy++9
	yre/0Gtz60lmAR4biLPl4RP02VKSGexgebBan3EIGojH5PhIbcsqWVN/8nbFx3HutOva8IhYSNl
	EnWQ9qnam9S4esbjwHM6sPPTP7IWHDXraQ965cmMpWFUokFl5TdernyTKAQRRRDhwDRoICJcT0s
	YVely8svaic4meF/JdQceigxlINqYiS2oSyZXgjPal6ls1cV+kfhdRYAJQuKd8ixzieRsinkJd8
	ew8FgfijTsPVywPu5Fq5nSHGouvDpP1bJJplSfzZCwPttttjvrYS9sYybGHkniRRgT6NJ+xKFcD
	FU5h7hM90wuxNrHbpAvAFSv1oVWTVJoqZHmtm8JK6QW8HTB7
X-Received: by 2002:a17:90b:2886:b0:39e:25c2:b9e0 with SMTP id 98e67ed59e1d1-39e54d564ccmr1600831a91.25.1789690719570;
        Thu, 17 Sep 2026 17:18:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55a0e7e2sm337468a91.4.2026.09.17.17.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 17:18:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCHv3] dmaengine: bestcomm: use platform machinery to get irq
Date: Thu, 17 Sep 2026 17:18:35 -0700
Message-ID: <20260918001835.154305-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_171840_641318_ECA82E52 
X-CRM114-Status: GOOD (  20.05  )
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

Adjust the goto labels in bcom_task_alloc to match what is being freed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: drop stale description
 v2: resend
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


