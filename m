Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461BFCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RhDxX4cHuT4tfnpR0AipKseIEfBclnv+hzggOQhE2+U=; b=Pn8VHigNwmCs3Yr/Il+rVvtZbe
	+OdTtJ7By09rX8IdoFVb2KZU2o9dUA+ueeU3rS8e8HVcCwL13iSsvcUR28OR2myO1vvL9hjq/fhCL
	MXff6qoZHDaVuuHBM42V64limxuzdpwn+bDL2G2kLPrBsjltEFtAAWPmt6jHn8OlwQbG+Nh50o7H5
	/5ZNfMy5ywKsnUHzNS985K7OlP2ZAauSIbVjH/FqkHDx+4lRz0sGj5Pr/AOxGDwuyy5DVHqNicCXZ
	8U29kxlHaC36KZjZBhdsHJtRIg9YetJX+HD+Xnq+Ue6Ar1Kh8HJTdbVM1oa67bKe/khxsbQvKGtQH
	785jbJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacWb-00000002njl-0CDL;
	Fri, 19 Jun 2026 16:57:01 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacWZ-00000002niz-07Gg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 16:57:00 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-51780bbc560so29478871cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 09:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781888217; x=1782493017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RhDxX4cHuT4tfnpR0AipKseIEfBclnv+hzggOQhE2+U=;
        b=d09vqytijNjdE+YZnbADkCa7VssXbNtHrfp068cAVgeYlLJ46y/tU8fRi1bs0IMHl5
         VbBMB6rZ73/NsDP+RBE1VgleDAcFc0ZqV1hTyg+v4z09EhwaL8D5N1TVMaEvO2keWyEc
         O4KDOaAnovlZbyicIpT4QOW0y9HaicUkFrnHV/mrU7wPUFk2vK5mgRfhlbKvhcIkm63/
         hpaHxXT0KKxZewLFVKHmNHpzlQSMyk8FL81q5mfJhfMakS4qhwqOueo8/3b1hxMeA5M5
         SAWjQbJGPHZPyJ4RNbvMqY5tQMDmNjp2IOz7rEZuNAN1GG2S9MYBgW4c9Ch+Bg/ejD3b
         u0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781888217; x=1782493017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhDxX4cHuT4tfnpR0AipKseIEfBclnv+hzggOQhE2+U=;
        b=oQ2E0t57ifCa1qHXNTfmGR0r2N6nBcm9gRUuBeqVrAXCj9MJnyXMWfvb5nFF57JAyS
         jbfW0TerkwKFEP98RXfLT1GzLbXyaH/6qVptgj67KQoG3TSJiuCd4oiWSyd6VsDmq7Np
         Tvdn5JCcL8O4C7ba9KSkIf0qy2YtAw98Np/M75uPoS2SqQ2U7i29c7VLePovSBSkUsl7
         zlTKCfFmi462hWxK1YDGdSp9mS1pkD0badvQMVAkFElh0IVfBR3lBRATluIzsxe4U8C7
         EAAGclnOnsLvjwP8TfkMlNoVPfMhqlGSAKttj/GPpBPY4QTLt5Wf7A+vLKNFoBTJo3d7
         Icgw==
X-Forwarded-Encrypted: i=1; AFNElJ/36L3XMSXZhXBSjmwsR6Yp6+m41iMWX64iYPzAjB1c7VYRqOvJrFyO4dnKpgySwDPobshNVRKQHpRvks2sSlKJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx/m/ogNMz0TeefMB0TYX0ij+QVrQnZCIy0AeTDi6YXocM218/
	b3uFV4sPEs9Kp3wYzV2KlgDoVnnhgd3aV8ymz5t8WFR179adBwVifpS9
X-Gm-Gg: AfdE7cnA0bUyNRReCKoq7KL+9SxgKMmQEEF8xBVLgVxHyG3SXkRVJekghyBH6tUyU0T
	VuVlNmISrHPRFGOuOVKltByukX9OHsqG/+7iLpK1w5OYa2I7zdOtxsqHKoQgoIDIjOgEFQj31Yx
	gNKyh/fj80rc/dPaDUQsnFD+Mtfdnfh3gN9raf15FdBoz4feUP9ZKb5hxXT9uP40HyzXobtVMYM
	9fGKWHZwve/fRPcukpPtfa/hzk72cfFIPpHmWD2wykTufNyzgjWjA5o7q6BizZn4+LSTtqY/Ffp
	mHjziGiEfhqdREvr6CQ9ffFnApCmyHbpXgOxATli//M7GwcImf2orwY2i7CDYLZqWEbfwv+FZ7V
	AixXLXmRe+eMPv6tp4faaxly78YWUMyfVfCnfnzyG3yXQfU+bgWGodOlMxuYgf9b5aZpCtxUYkL
	YjaQ5DbXGy7cG6JfPqJRHfYJE4FD0pVQ==
X-Received: by 2002:ac8:7fd5:0:b0:50f:b61c:ec4c with SMTP id d75a77b69052e-519e6618f84mr51242181cf.7.1781888217426;
        Fri, 19 Jun 2026 09:56:57 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-519e6127858sm24687081cf.27.2026.06.19.09.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:56:56 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v2] mfd: mt6397-irq: Fix PM notifier and IRQ domain teardown
Date: Fri, 19 Jun 2026 12:56:49 -0400
Message-ID: <20260619165649.1067266-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_095659_077721_8D7B9CBB 
X-CRM114-Status: GOOD (  19.29  )
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

mt6397_irq_init() registers a PM notifier and creates an irq_domain. Both
objects point back to the devm-managed mt6397_chip.

The notifier was not unregistered on probe failure or unbind, so a later PM
transition could dereference freed chip state. The irq_domain had the
opposite lifetime problem: it could be removed while the devm-managed
parent IRQ was still active, but it was leaked on successful unbind.

Manage both lifetimes with devm actions. Register the domain cleanup before
requesting the parent IRQ, so devres frees the parent IRQ before removing
child mappings and the irq_domain. This keeps the domain alive while the
parent IRQ handler can still run.

Also serialize PM notifier mask writes with irqlock. While suspend is in
progress, keep wake_mask programmed in hardware even if a concurrent IRQ
sync updates irq_masks_cur in software.

Fixes: a4872e80ce7d ("mfd: mt6397: Extract IRQ related code from core driver")
Fixes: 4e2e7cfec13a ("mfd: mt6397: Modify suspend/resume behavior")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
Changes in v2:
- Use devm actions for PM notifier and irq_domain cleanup.
- Remove direct irq_domain_remove() calls from failure paths.
- Serialize PM notifier mask writes with irqlock.
---
 drivers/mfd/mt6397-core.c       |  4 +-
 drivers/mfd/mt6397-irq.c        | 85 +++++++++++++++++++++++----------
 include/linux/mfd/mt6397/core.h |  1 +
 3 files changed, 63 insertions(+), 27 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 1bdacda9a933..ff1e393202ee 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -389,10 +389,8 @@ static int mt6397_probe(struct platform_device *pdev)
 	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
 				   pmic_core->cells, pmic_core->cell_size,
 				   NULL, 0, pmic->irq_domain);
-	if (ret) {
-		irq_domain_remove(pmic->irq_domain);
+	if (ret)
 		dev_err(&pdev->dev, "failed to add child devices: %d\n", ret);
-	}
 
 	return ret;
 }
diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
index 5d2e5459f744..4be74d8325cd 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -25,17 +25,23 @@ static void mt6397_irq_lock(struct irq_data *data)
 	mutex_lock(&mt6397->irqlock);
 }
 
+static void mt6397_irq_write_masks(struct mt6397_chip *mt6397,
+				   const u16 *masks)
+{
+	regmap_write(mt6397->regmap, mt6397->int_con[0], masks[0]);
+	regmap_write(mt6397->regmap, mt6397->int_con[1], masks[1]);
+	if (mt6397->int_con[2])
+		regmap_write(mt6397->regmap, mt6397->int_con[2], masks[2]);
+}
+
 static void mt6397_irq_sync_unlock(struct irq_data *data)
 {
 	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
+	const u16 *masks;
 
-	regmap_write(mt6397->regmap, mt6397->int_con[0],
-		     mt6397->irq_masks_cur[0]);
-	regmap_write(mt6397->regmap, mt6397->int_con[1],
-		     mt6397->irq_masks_cur[1]);
-	if (mt6397->int_con[2])
-		regmap_write(mt6397->regmap, mt6397->int_con[2],
-			     mt6397->irq_masks_cur[2]);
+	masks = mt6397->irq_suspended ? mt6397->wake_mask :
+					mt6397->irq_masks_cur;
+	mt6397_irq_write_masks(mt6397, masks);
 
 	mutex_unlock(&mt6397->irqlock);
 }
@@ -141,24 +147,20 @@ static int mt6397_irq_pm_notifier(struct notifier_block *notifier,
 
 	switch (pm_event) {
 	case PM_SUSPEND_PREPARE:
-		regmap_write(chip->regmap,
-			     chip->int_con[0], chip->wake_mask[0]);
-		regmap_write(chip->regmap,
-			     chip->int_con[1], chip->wake_mask[1]);
-		if (chip->int_con[2])
-			regmap_write(chip->regmap,
-				     chip->int_con[2], chip->wake_mask[2]);
+		mutex_lock(&chip->irqlock);
+		chip->irq_suspended = true;
+		mt6397_irq_write_masks(chip, chip->wake_mask);
+		mutex_unlock(&chip->irqlock);
+
 		enable_irq_wake(chip->irq);
 		break;
 
 	case PM_POST_SUSPEND:
-		regmap_write(chip->regmap,
-			     chip->int_con[0], chip->irq_masks_cur[0]);
-		regmap_write(chip->regmap,
-			     chip->int_con[1], chip->irq_masks_cur[1]);
-		if (chip->int_con[2])
-			regmap_write(chip->regmap,
-				     chip->int_con[2], chip->irq_masks_cur[2]);
+		mutex_lock(&chip->irqlock);
+		chip->irq_suspended = false;
+		mt6397_irq_write_masks(chip, chip->irq_masks_cur);
+		mutex_unlock(&chip->irqlock);
+
 		disable_irq_wake(chip->irq);
 		break;
 
@@ -169,6 +171,29 @@ static int mt6397_irq_pm_notifier(struct notifier_block *notifier,
 	return NOTIFY_DONE;
 }
 
+static void mt6397_irq_pm_notifier_unregister(void *data)
+{
+	struct mt6397_chip *chip = data;
+
+	unregister_pm_notifier(&chip->pm_nb);
+}
+
+static void mt6397_irq_domain_remove(void *data)
+{
+	struct mt6397_chip *chip = data;
+	unsigned int hwirq;
+	unsigned int virq;
+
+	for (hwirq = 0; hwirq < MT6397_IRQ_NR; hwirq++) {
+		virq = irq_find_mapping(chip->irq_domain, hwirq);
+		if (virq)
+			irq_dispose_mapping(virq);
+	}
+
+	irq_domain_remove(chip->irq_domain);
+	chip->irq_domain = NULL;
+}
+
 int mt6397_irq_init(struct mt6397_chip *chip)
 {
 	int ret;
@@ -223,16 +248,28 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 		return -ENOMEM;
 	}
 
+	ret = devm_add_action_or_reset(chip->dev, mt6397_irq_domain_remove,
+				       chip);
+	if (ret)
+		return ret;
+
 	ret = devm_request_threaded_irq(chip->dev, chip->irq, NULL,
 					mt6397_irq_thread, IRQF_ONESHOT,
 					"mt6397-pmic", chip);
 	if (ret) {
 		dev_err(chip->dev, "failed to register irq=%d; err: %d\n",
 			chip->irq, ret);
-		irq_domain_remove(chip->irq_domain);
 		return ret;
 	}
 
-	register_pm_notifier(&chip->pm_nb);
-	return 0;
+	ret = register_pm_notifier(&chip->pm_nb);
+	if (ret) {
+		dev_err(chip->dev, "failed to register PM notifier: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(chip->dev,
+				       mt6397_irq_pm_notifier_unregister, chip);
+
+	return ret;
 }
diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
index 340fc72e22aa..f9c2cbd17c5c 100644
--- a/include/linux/mfd/mt6397/core.h
+++ b/include/linux/mfd/mt6397/core.h
@@ -66,6 +66,7 @@ struct mt6397_chip {
 	int irq;
 	struct irq_domain *irq_domain;
 	struct mutex irqlock;
+	bool irq_suspended;
 	u16 wake_mask[3];
 	u16 irq_masks_cur[3];
 	u16 irq_masks_cache[3];
-- 
2.43.0


