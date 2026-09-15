Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A728C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 18:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6fvPaWKuH74Rj66uteSOuQL+AbF/NoYDvfe8MEEc324=; b=qdApbjlQaHzPC6L+fEJrsOCr6R
	EDx8uPjkOhq/KY+u41xb/HWqvxhXd43BQh1yMHK9qd+WRKXoy6w9maRaVpsN2cEjotV6/SDVF4Oa1
	joV68x1ZjpmEqY+5/VYYBewICS8+9zGsl5tIb1BiKfCAWIjk2paqGZPKBDlQQASwZL0HiTOPgLWlL
	bVF2n145fEK+1ThWI2CGCyDumF9HhWwv4WQf2ruPaoBA9Ogw2KDWV5X2Mk8SehB1u35nlKBwuEz0l
	ZsmMvneWIdAd4Jy/DlaqNOLq+rk2pvD266s/1rSd/XGv99HE5xEL3+CmcCnD4Gqm6HP5xh2XBnaNE
	/tgNT9og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Xe5-00000007i3w-3ZGM;
	Tue, 15 Sep 2026 18:12:41 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Xe3-00000007i2n-2XKh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 18:12:40 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-910537b51a0so498786d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 11:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789495958; x=1790100758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6fvPaWKuH74Rj66uteSOuQL+AbF/NoYDvfe8MEEc324=;
        b=jnmQta9gCzIRziqeFM7ud+0oa+rmDFrILk3iHqxEas38lkXeYMnlwhpVEvdiPwFbxk
         xnAfbNb5L9rmM0LZiaQeCSDz+X4l0sTQDtusZ2BTwTAVtIgjiIQdK2PnB01RQ8zw3Zmi
         T8c9Myclw6zOlYGRce+NhkubhSmsoRvxJMt58uWgcTC3M3u6gdJQTDT1gv1A1Mm4ajC+
         uSF9w6+O518IZwnXdO+Lap5lggriDwfbMj6ONDG/Dqwk9M3ENsyhsTGODZbFPXHTKINo
         M5AlZ245/7yA+Yd11L7t3huncMYVC1gWBB6NWUw+UDvrLjYcLKWWGgWyQx1Y0Fo5ObrC
         1asA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495958; x=1790100758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fvPaWKuH74Rj66uteSOuQL+AbF/NoYDvfe8MEEc324=;
        b=wPxXu5GHoK1wHP0RfR0hIce7wL1k8SzYQQjR+q0P/Kixn/shx/mDAJCqghtdeSeSc7
         ZALlYoACyVu7vCf5Zsf1n2/bk36Bn7oOUbkpwskwLP8AYzLgWQw/vBwxOQq6f6hnE7HQ
         0R7zvDQxgrWteadxtQeBNA1DFe5xRjr0tTSxJD94juMBbZoed5qIW3oVAlhHmOjtNM3c
         R00BCWoObvcUP8fQYvtZYU29w0klTktXkYu7anJxsG5evxtvcXxg7fIwPYZUq0tviPHE
         oFqWxQvvQgichzdP/5pJrnVM0z+ER5XdrOX8YfUxIlmt0J5QVbFy462byDklkynbhm31
         HFjA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ0CBaLPzuLcBac9i/X2mo8KR2Z8Qw6rRrbiJyY0tPaZx0SzppMmzqbhwb4ChHg9vULaiK34nfUMoMUm/bW3q/@lists.infradead.org
X-Gm-Message-State: AFuF++ksN3Kh35HsnYz85BmXFt7yZ/Do4EiIVGg4pS0xRMsFh/9qcQbI
	Yj3mfNYn0kJ+MrX/EJ1pX99nGWQqbo1f72y2gYql+BczCE3hX+pAXUis
X-Gm-Gg: AYBFou3GpEMZ/RN3NOuZ3qlZ0mFelEVvuTqnsrMnaC49u+A8uchi7i5PL8YhMD/kb96
	XvmrYKt3RnOakEmsAKmKvW0tB/ggoerQEK4WEjKVqFTflIorGuet+r9qqrjhzlbOd8X/WSqGUgy
	N+QGi1Fpoc6zx+RwtnwmGRKHn9G/XLgqq8rbLz5N3gmYJ7u2jvmtsxhZBaAuL+JcJAlp6/dYMbm
	I3EcMg+fKRAssy7yDxURPQoNA6tuwbE2/jyRlFMjFvqOyrnc84DhIXWZp+jAzl2GxYYYQ5WaZ+F
	sN8mRG6ApBolH3swZV3YpF+MkjadCtNHG6l0LzR046o8hT4lu8JsPH7FMSLpwp/dJ8vre4f1yYN
	+f6yaV8pejoeIxHlLQQ+GGP9NdlzCmT5vSZOMHzHLLu9RgiKzWm+KAl3aFyZwSyyBNe1g7PKdYW
	XErK6jjNzF8Vlvdxdxp9lEK4ozdglDjjKTRqBmQmfnBCNSY/qzDkUT88YZB7Re8clvPRnoYONef
	fXbZxYnNINcqH7H0iKWzN23EtNRxIhTvNMgKl/U2PF/ROTU42snVvd3DlJWWpMB2kPfmXjl5Ip8
	vgDZDLgNJuv9L+lc1D9Zz+DivzIaNbRopejBQhfzwhqA38DM
X-Received: by 2002:a05:6214:2128:b0:911:2a79:cf11 with SMTP id 6a1803df08f44-9123a526c78mr33549316d6.22.1789495957590;
        Tue, 15 Sep 2026 11:12:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123bed6f76sm4250996d6.43.2026.09.15.11.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:12:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCH] dmaengine: bestcomm: use platform machinery to get irq
Date: Tue, 15 Sep 2026 11:12:34 -0700
Message-ID: <20260915181234.9839-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_111239_661907_1B671492 
X-CRM114-Status: GOOD (  20.92  )
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


