Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB0160A5BC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FBa1mpHy;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VaXHEf0y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhNgb12bmkpmtNiDfvB9a1bGebOiAzBKY22qKyemjR4=; b=FBa1mpHyZ3pRT1ocrkWB4p8HPi
	0eYw22JnQEpRJx0a4/FjojO/4/SJTGtk0+RenkCQeeF9Q8IU/6SPKG/6HM9opnieVBCviCaMcuaAn
	hbUQsZGtUr3G4Jp/qGAaa2RlnZIT2KO+wj4YzaB6+tTACj0PnHu1sK4Z+SJvnkApKAF52KdzOQf0f
	t3pjW2Ig2bMMJ+0r5z+wHmnABX6Svn12msEcS4hvMCEfPbSSy57jZw9WCCbrByubSxPc94oFid5Is
	hxEY6JVuQMsH/5NbPrFyg+e5JSQPH06EUMWN8BiEhlZdz3ff7aFUvoH1k2cTFNP2/FInpkCJ3gdGV
	pyM23XtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVFQ-0000000BmmM-0udt;
	Wed, 21 Oct 2026 12:16:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVFN-0000000Bmly-3Kos;
	Wed, 21 Oct 2026 12:16:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C7EA447A8;
	Wed, 21 Oct 2026 12:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C260E1F000C5;
	Wed, 21 Oct 2026 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585005;
	bh=WhNgb12bmkpmtNiDfvB9a1bGebOiAzBKY22qKyemjR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VaXHEf0y8d+f0YELTloNrW7Y/82Vbp9IaGc/JFlu0Q3AzpFU7ahYiQLRAu3l8KY8r
	 Mi1VAzUg5sMlwWmwWjOw8dtImHy5MdKDu1G7jFPbxqTB70Zu531mwUycohkZgvoTR/
	 ZmHLO21q8pwfzEvnuCr9nF7sl8Sj42c/iziz+4Lj4yQCeFwCdUl2hGAbTJXOEtfEm+
	 bQNpJf9mjxG30CQ4NJcHEPS432r7Uvxc/NZIFPK0EUqfzkMoyvwqsTE9PZ/GI5U2u1
	 UZZfw9TF6GssDtrUtFV9TaytbhW9bBDDhs+M+bIgS9W98j7lCsYRA0T0INvKvoR3pE
	 /OkYsP03H+37A==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH 25/28] mfd: mt6397: Manage IRQ domain lifecycle with devres
Date: Wed, 21 Oct 2026 12:09:47 +0000
Message-ID: <20261021121245.3111563-25-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021121245.3111563-1-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt6397_irq_init() and mt6358_irq_init() create chip->irq_domain with
irq_domain_create_linear() before registering the parent interrupt via
devm_request_threaded_irq().  If devm_mfd_add_devices() fails in
mt6397_probe(), irq_domain_remove() is called before devres frees the
threaded IRQ and without disposing child IRQ mappings, allowing an
in-flight interrupt handler or late IRQ lookup to dereference the
removed domain.  Conversely, when the driver is unbound, the IRQ
mappings and domain are never removed at all.

Register a devres action immediately after irq_domain_create_linear() to
dispose all mapped hardware interrupts and remove chip->irq_domain so
that the domain is torn down after child MFD devices and the managed IRQ
handler have been released on both probe failure and unbind.

Fixes: 6df8dd5c185b ("mfd: Add support for the MediaTek MT6397 PMIC")
Closes: https://sashiko.dev/#/bug/linux-b296fbe4-6e83-40c0-91c7-2c31e8d226d0
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/mt6358-irq.c  | 17 ++++++++++++++++-
 drivers/mfd/mt6397-core.c |  4 +---
 drivers/mfd/mt6397-irq.c  | 16 +++++++++++++++-
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
index 74cf20843044..c747cae909ea 100644
--- a/drivers/mfd/mt6358-irq.c
+++ b/drivers/mfd/mt6358-irq.c
@@ -224,6 +224,17 @@ static const struct irq_domain_ops mt6358_irq_domain_ops = {
 	.xlate = irq_domain_xlate_twocell,
 };
 
+static void mt6358_irq_domain_remove(void *data)
+{
+	struct mt6397_chip *chip = data;
+	struct pmic_irq_data *irqd = chip->irq_data;
+
+	for (unsigned int hwirq = 0; hwirq < irqd->num_pmic_irqs; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(chip->irq_domain, hwirq));
+
+	irq_domain_remove(chip->irq_domain);
+}
+
 int mt6358_irq_init(struct mt6397_chip *chip)
 {
 	int i, j, ret;
@@ -279,13 +290,17 @@ int mt6358_irq_init(struct mt6397_chip *chip)
 		return -ENODEV;
 	}
 
+	ret = devm_add_action_or_reset(chip->dev, mt6358_irq_domain_remove,
+				       chip);
+	if (ret)
+		return ret;
+
 	ret = devm_request_threaded_irq(chip->dev, chip->irq, NULL,
 					mt6358_irq_handler, IRQF_ONESHOT,
 					mt6358_irq_chip.name, chip);
 	if (ret) {
 		dev_err(chip->dev, "Failed to register IRQ=%d, ret=%d\n",
 			chip->irq, ret);
-		irq_domain_remove(chip->irq_domain);
 		return ret;
 	}
 
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..e94e37cba249 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -395,10 +395,8 @@ static int mt6397_probe(struct platform_device *pdev)
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
index 5d2e5459f744..58645dbd8095 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -169,6 +169,16 @@ static int mt6397_irq_pm_notifier(struct notifier_block *notifier,
 	return NOTIFY_DONE;
 }
 
+static void mt6397_irq_domain_remove(void *data)
+{
+	struct mt6397_chip *chip = data;
+
+	for (int hwirq = 0; hwirq < MT6397_IRQ_NR; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(chip->irq_domain, hwirq));
+
+	irq_domain_remove(chip->irq_domain);
+}
+
 int mt6397_irq_init(struct mt6397_chip *chip)
 {
 	int ret;
@@ -223,13 +233,17 @@ int mt6397_irq_init(struct mt6397_chip *chip)
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
 
-- 
2.56.0.218.g1ec904b173-goog


