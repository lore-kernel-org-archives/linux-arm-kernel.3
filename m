Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F5A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RPEx6eGn;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=enbsc4f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FXwzbr01RC3qFTRcykqQkqibGIllJ7arxXZjCgc8U0o=; b=RPEx6eGnfAWRWP
	uKR2RrU9zwi4Myrv6YUvebjbdVB5pTOUHZfGGSJJ2pYdl1aD9og2LA0H28I2sxiL6aDuCZUopuqbX
	z69KnSLXjKbE+L9XciVFnDjMDGx7jeWg+GhMjxWXAqpxSWwCzRCVpcLN3F1+02xTU+uGCgSrewyeI
	VwlV9ytRb6b2VENSdharZxCfnr3MzZmVyqu+0WmLoTFeyl0YHeL+IvU92CCCEgWE1HEzdmdI1Rv9t
	HCOcdHtkzljJHun06Fa5jnaHd+/pmb9neYf0phbw9c7feI+5IzMOIypRkJV9gU/uqrBbzP/NMjnjF
	SnFHd+X1vebc1gsn0PQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeZt-00000004JNh-1gAU;
	Tue, 27 Oct 2026 10:38:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeZs-00000004JNL-0NhC;
	Tue, 27 Oct 2026 10:38:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87E956022B;
	Tue, 27 Oct 2026 10:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CE11F01829;
	Tue, 27 Oct 2026 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793097527;
	bh=FXwzbr01RC3qFTRcykqQkqibGIllJ7arxXZjCgc8U0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=enbsc4f2Oks9BATfQnmlOXqcXXnW6Yv4XctQhX8KNj7aLTT8cnc+IB1uQeNOvHXiT
	 d+zoJJvihvYRvBdhWf27Yyw8GrAjPyTc8OB4NgAbrIKCumo19X8nYkDFLY5NkUOYkT
	 kMr0b5KUnxf7F9SUBNk0p/7QmA7vbyC5+8k7ZmJT+1yKloPHr24Tlu6I4RCdJQUKbo
	 K+Ohibl5SJJAQOkj4A/55UE9LzSTvtHZp6DS2HOEzYXVfjlIXeq0klfyvZ940fcCw/
	 loqvg+d2RIVD6AuwEQYPec3MyKO0xNyzJxODJLMrmO6/n55Gvg+y76vhqiSwyEN8im
	 2dV1tria+fHzA==
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
Subject: [PATCH v2 24/27] mfd: mt6397: Manage IRQ domain lifecycle with devres
Date: Tue, 27 Oct 2026 09:30:53 +0000
Message-ID: <20261027093306.2812695-25-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261027093306.2812695-1-lee@kernel.org>
References: <20261027093306.2812695-1-lee@kernel.org>
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
2.56.0.307.g5fe7bd680c-goog


