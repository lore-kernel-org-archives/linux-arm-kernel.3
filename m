Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F378C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 00:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MHPfgHpVyaUa15qKDBAtKU0EMneYSzvSUcpDvb8HIw0=; b=1Sg6KP8++RtLIIBXVlLUMnDhma
	Cz8MPMi8pUFTa/6Syoag8iM5ofzIbBn2SnBfrFHYgX6O1IJytV3odAmjfk6DlFJgBkYC5xYDiOJRP
	53Wifujibwzctyu4F3N6d77N8SvYaU3A7b2U/sQKFEP60cn4dhyXqw+tzp1wRoIpQ/u69qBfKQgtn
	bT4NmNbhylIrmncsZAlbIdcqzSTQ+gdpFh6FafYjBwzVvismg2rJErkmSNGNnB0kfzm7gkPSMnEiN
	xXNIKBSRxIXg5zw1nmkyGncC8P4kk+sCwnsxIjYIPsDSJQIEVCpiLfJ4oQgh7W8CzhFxSda1jPIa2
	xdzuXufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7inp-0000000Fk9U-3zZp;
	Sat, 19 Sep 2026 00:19:37 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7inm-0000000Fk98-41aL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 00:19:36 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-85469d249c6so1194577b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 17:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789777173; x=1790381973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHPfgHpVyaUa15qKDBAtKU0EMneYSzvSUcpDvb8HIw0=;
        b=MJW8J3lAxgu6Ey2MVzLlzildEwv9Z6jfL4+SE4rsIN7h9gEGocICUnORzM/qvIcc0D
         BkV0smQfacyat9uql/cIS6GBRGEwmwOGFXq31YuD04CxT/wPT8Ab46VXu99BN4w1TU3d
         Hm1Y4qDE5kLhp4MDcK1KuAqgu3TyaGFPO6SYv6fDkkDA2IFNit7VXE8+JLb4EuLjgjAJ
         +ibDFwSAPfuUwU1+pgOZ0Us7ONvZl2renWBHa94rcgLFlR4OvGRRZif8MH7rHErhrSAy
         h/8nEQUfAlcjqjx3X9a0iXHy5/gnTM75O/LjX/R2Oe1/6Ja4UdScPri0GHbsmS61o9Lm
         7f5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789777173; x=1790381973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHPfgHpVyaUa15qKDBAtKU0EMneYSzvSUcpDvb8HIw0=;
        b=A/zE/KiqD7dRPfL3rY3JMBzW0Iv2ZQ+6nxQ3ayig15hJjn6N7zcaLMzn2oiOTqvt1p
         EJcAXX2dU9APyc19AmcPdpbHRQFnDIRhNyeexLI1d6OSouq7CCrMQDXkMzE5A42/Sfod
         R2mR2gmll5U6i/XzjsoRan8k9SQgR1VGWWZ+obTmIHYFN48An3mEy0HAs9X/gejsdWlL
         hdfBUlYLmoI2xibTbGMbUkp6CKuNtiTK4zFD/eufuvV7aDTLgM7s09potfCxWOjLtxR2
         zoDxTbEnqIcerEb3AD5tPPuxkkrrnYfiHDVh5e7JMvDVO5cWTuM8nKC8NdCU7w+0tXcI
         X76g==
X-Forwarded-Encrypted: i=1; AKwUvBz0zDyP8Zmt3e9qBiPsUtXrRYa7hamlGwoOlzBWRMvraEf5gaD67T2tJ8MWOOtmI+wwnkyBjvH2mty3Ge+1CnZy@lists.infradead.org
X-Gm-Message-State: AFuF++mC7Xk3tYapJIXTrI7CD7FE8rn1SK4UYijqQn6fKhRr3xH4kwIO
	HnSlpj4KFElb451DoYHpxn9O7/f29wbleVsCUEX09sXuIUO0NxVslRsIJatZBQ==
X-Gm-Gg: AYBFou0ypGiCCK3WAr9Bltcm8UDDpdRq+yPETxbaOHvy21tilu/Qa5dJsOTQD4ouGmJ
	IJ54OauLbtErFdux4FKdBtzxvfk+qpUc3WNLo/2n+8hNiZpfheYeHAXLiVKjDlgY0JJmPb/TDYq
	ScRXHeSFHFtXg5Vjc9gTqMlRoxNQJxYcvhidt9BIsqc+yK/l0vdHOLCqHw6MgMxZdUKvwdocuI9
	YmuZgfPflnhj41nXtBWKfeSa7KoVTzIFgX87zChSGdF7DRE7EpWF6mjzUgE0K70TG3U+p1ovDY4
	YfEdSFYY6VoXm6DsSNmHKrfIuBw4sUGqg3urSEBaowrdbOHXzme1/ScKrCQfsyvgVKim7fJl2z4
	wPRN3dcsn6+W6TvMgbbykKHmYLcLFCgFFLX3l6WKim9nAM+XWoHlmH9d/apBrYFI2avmZGVrUpz
	MYHIVa6G/MeRVzTtEdO7tVac1gJDu60JCObMQdgB9rZEpuByr3sbjBLCly1+tuNf1EY4N5ocGE6
	jj4up2vcZ6+QG+xD5Sj9PLMn4qL64SGYL0gr3XDz7X4PieSRBGAZjOaGEBphZi4II3nf2UJrbjk
	88adiyUAnkDZjQl4mav3qNk6LgpH628RGAymiqwqTYJWnedXrvKlYJ5TvYY=
X-Received: by 2002:a05:6a00:148f:b0:870:c2db:da2c with SMTP id d2e1a72fcca58-874de2125femr7108980b3a.25.1789777173083;
        Fri, 18 Sep 2026 17:19:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6bec90dsm391673b3a.8.2026.09.18.17.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 17:19:32 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCHv4] dmaengine: bestcomm: use platform machinery to get irq
Date: Fri, 18 Sep 2026 17:19:31 -0700
Message-ID: <20260919001931.723402-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_171935_005462_35A67EBC 
X-CRM114-Status: GOOD (  20.74  )
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
 v4: drop whitespace change
 v3: drop stale description
 v2: resend
 drivers/dma/bestcomm/bestcomm.c            | 46 ++++++++--------------
 include/linux/fsl/bestcomm/bestcomm_priv.h |  2 +-
 2 files changed, 18 insertions(+), 30 deletions(-)

diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index 241a91936fe8..310792ccd748 100644
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
@@ -99,15 +102,11 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 
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
 
 	return NULL;
@@ -125,7 +124,6 @@ bcom_task_free(struct bcom_task *tsk)
 	bcom_eng->tdt[tsk->tasknum].stop  = 0;
 
 	/* Free everything */
-	irq_dispose_mapping(tsk->irq);
 	bcom_sram_free(tsk->bd);
 	kfree(tsk->cookie);
 	kfree(tsk);
@@ -377,16 +375,12 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
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
@@ -394,7 +388,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	if (rv) {
 		printk(KERN_ERR DRIVER_NAME ": "
 			"Error in SRAM init\n");
-		goto error_ofput;
+		return rv;
 	}
 
 	/* Get a clean struct */
@@ -405,8 +399,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	}
 
 	/* Save the node */
-	bcom_eng->ofnode = op->dev.of_node;
-
+	bcom_eng->pdev = op;
 	bcom_eng->regs = regs;
 	bcom_eng->regs_base = res_bcom->start;
 
@@ -426,8 +419,6 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	kfree(bcom_eng);
 	bcom_eng = NULL;
 	bcom_sram_cleanup();
-error_ofput:
-	of_node_put(op->dev.of_node);
 
 	printk(KERN_ERR "DMA: MPC52xx BestComm init failed !\n");
 
@@ -443,9 +434,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
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


