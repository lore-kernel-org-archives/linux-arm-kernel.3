Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD99CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8n6bDh4FZgkURMOCPjf6gdU5zRoop7LpjSpVYCLjO4=; b=Dh6IDzLeUx23BhWjxQ2s9yQJ7J
	2xKtRvI+W8vQh0ZvYFyZr8lThWMgLBjK+AoVlpJK4M7jLAja/+YxKcmXahFH6DGrTjNkyqbrRJFqo
	3pJbuXYcdT9bzGHno44lL13CZF5ofxGeyDNsTPbw1MWp2W44zeXlMz+HIp8xim/NjbjuQOsubiWru
	cXBtcW0tTKIyR1Mhb5HRJJHyRubRF5XgaOsS0CG6QjniyEUwOvS5nxRWzLn8ijvmXQNUU0zChwVM7
	4MOieiPf2ACHW1Tkwi3R8L2m2HNkXgvnHu8kWKrGwQx85XVEVWroGU3X/pSk10/A6XddV36EzyWSK
	0cL8eD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrk1-0000000BKSg-30Lr;
	Tue, 12 Aug 2025 16:20:50 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uln3m-0000000AbBe-2qPJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 11:20:55 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1TBP1bFMz9sSt;
	Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THilcENmYILV; Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1TBN4pjRz9sSs;
	Tue, 12 Aug 2025 13:03:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 902498B765;
	Tue, 12 Aug 2025 13:03:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XDZeo0gya3AY; Tue, 12 Aug 2025 13:03:08 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EAD738B764;
	Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] soc: fsl: qe: Change GPIO driver to a proper platform driver
Date: Tue, 12 Aug 2025 13:02:52 +0200
Message-ID: <f4d04d0c9d72d089af7490c6ce91bb4c455fbffd.1754996033.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1754996033.git.christophe.leroy@csgroup.eu>
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754996575; l=3238; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=VYssVgP/HSCvUsH61iWhixO+M16MVUEty2f4L9mgniA=; b=iodPhBkh8iWD/od14mpEwzyP2AImC5CmU51Db62oh3CqMDvFaocRNpunshUxSvRzZ/wMVVWaw WMzyeRAJqalAHJY+M1Y8ugaWisKOtZ46bpCFGqhsP7ObMLulySbbKO+
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_042054_884969_EC943804 
X-CRM114-Status: GOOD (  18.66  )
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

In order to be able to add interrupts to the GPIOs, first change the
QE GPIO driver to the proper platform driver in order to allow
initialisation to be done in the right order, otherwise the GPIOs
get added before the interrupts are registered.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/gpio.c | 88 +++++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 35 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 8df1e8fa86a5f..b502377193192 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <linux/property.h>
+#include <linux/platform_device.h>
 
 #include <soc/fsl/qe/qe.h>
 
@@ -295,45 +296,62 @@ void qe_pin_set_gpio(struct qe_pin *qe_pin)
 }
 EXPORT_SYMBOL(qe_pin_set_gpio);
 
-static int __init qe_add_gpiochips(void)
+static int qe_gpio_probe(struct platform_device *ofdev)
 {
-	struct device_node *np;
-
-	for_each_compatible_node(np, NULL, "fsl,mpc8323-qe-pario-bank") {
-		int ret;
-		struct qe_gpio_chip *qe_gc;
-		struct of_mm_gpio_chip *mm_gc;
-		struct gpio_chip *gc;
-
-		qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
-		if (!qe_gc) {
-			ret = -ENOMEM;
-			goto err;
-		}
+	struct device *dev = &ofdev->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+	struct qe_gpio_chip *qe_gc;
+	struct of_mm_gpio_chip *mm_gc;
+	struct gpio_chip *gc;
+
+	qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
+	if (!qe_gc) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
-		spin_lock_init(&qe_gc->lock);
+	spin_lock_init(&qe_gc->lock);
 
-		mm_gc = &qe_gc->mm_gc;
-		gc = &mm_gc->gc;
+	mm_gc = &qe_gc->mm_gc;
+	gc = &mm_gc->gc;
 
-		mm_gc->save_regs = qe_gpio_save_regs;
-		gc->ngpio = QE_PIO_PINS;
-		gc->direction_input = qe_gpio_dir_in;
-		gc->direction_output = qe_gpio_dir_out;
-		gc->get = qe_gpio_get;
-		gc->set = qe_gpio_set;
-		gc->set_multiple = qe_gpio_set_multiple;
+	mm_gc->save_regs = qe_gpio_save_regs;
+	gc->ngpio = QE_PIO_PINS;
+	gc->direction_input = qe_gpio_dir_in;
+	gc->direction_output = qe_gpio_dir_out;
+	gc->get = qe_gpio_get;
+	gc->set = qe_gpio_set;
+	gc->set_multiple = qe_gpio_set_multiple;
 
-		ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
-		if (ret)
-			goto err;
-		continue;
+	ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
+	if (!ret)
+		return 0;
 err:
-		pr_err("%pOF: registration failed with status %d\n",
-		       np, ret);
-		kfree(qe_gc);
-		/* try others anyway */
-	}
-	return 0;
+	dev_err(dev, "registration failed with status %d\n", ret);
+	kfree(qe_gc);
+
+	return ret;
+}
+
+static const struct of_device_id qe_gpio_match[] = {
+	{
+		.compatible = "fsl,mpc8323-qe-pario-bank",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, qe_gpio_match);
+
+static struct platform_driver qe_gpio_driver = {
+	.probe		= qe_gpio_probe,
+	.driver		= {
+		.name	= "qe-gpio",
+		.of_match_table	= qe_gpio_match,
+	},
+};
+
+static int __init qe_gpio_init(void)
+{
+	return platform_driver_register(&qe_gpio_driver);
 }
-arch_initcall(qe_add_gpiochips);
+arch_initcall(qe_gpio_init);
-- 
2.49.0


