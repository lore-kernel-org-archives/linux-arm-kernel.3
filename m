Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5843C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/rqSAHt9/OA2l3CBgPr0JoENW2JxaW1dKXIPiByOCdg=; b=PH8ikKnN0No+ox/QqosMJuewhv
	1F3Fom15/Ma0x6gB8usmgqCfYtB/x0RkUENnEvvHHk3BzEmtVi27nK+FwcpIQ6BXRL2KhzgbFMbKq
	NzPcat4vAfz2cbUGVhio3Jnj2QryL3XJRzFFH4FBzCDEhZdeFkmUVgw+lrmlU/hNqeZJWTSzgNKH1
	fEXWoJrhBF5QNBwxcJFHjgcDFGQbQWqT7TTaZ5jDcx3mQSEqIEJHGAi9zacV0XS5NYRXKT6DqbHoe
	MK7pTExXnSrUnZmVF1zzSkZQThmArxLgDolBPvS07AREcg7aYgutm1CGLEZFAkdu+obVR2ehA+wnK
	jnfNwCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbhH-000000075Rr-3hQp;
	Thu, 27 Feb 2025 11:04:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbax-000000074F4-1AKU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 10:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740653903; x=1772189903;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=teTDa3liTei2AdNqaa9IqgRmnKDfj0qKFfTebiwSFag=;
  b=QhrhG1MNfXqM0BrH9/XB+Pg10P9SYp4w0HbvfV1uEkBcN4w4EOlTW36n
   w0F7qg0YweAt235spcpx0ry4K5Rvgog60Oiu+jTHbYkU5ppS42IOgf1nF
   SdcdjAl6NZ2qKCfzl9nDh6br6tcNkOwVrGULFQoR2xTYPZZIdIKJ9ious
   SlkDScLF6kqh9uavzvZokDYzk0Ba0CDmCgUKoHWDN+i2Z92vu/qnQSQnN
   s61eBAG0lO9EhAUSuQnHA0RwLPrJAF/PCJE4oNpDkRucdfIhY+es6M9QS
   Yhh/lWaH4sVlh741hIM40aaUUC3nog620qLAGn65kj4iAIsOjbna+Ho42
   w==;
X-CSE-ConnectionGUID: JWjrnE6DQtWZk0nVbJYONA==
X-CSE-MsgGUID: JCcOmOIfRpqgToz9BX0Zsw==
X-IronPort-AV: E=Sophos;i="6.13,319,1732604400"; 
   d="scan'208";a="269594456"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 03:58:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 03:58:12 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 27 Feb 2025 03:58:10 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <p.zabel@pengutronix.de>, <Steen.Hegelund@microchip.com>,
	<daniel.machon@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<herve.codina@bootlin.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v4] reset: mchp: sparx5: Fix for lan966x
Date: Thu, 27 Feb 2025 11:55:02 +0100
Message-ID: <20250227105502.25125-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_025823_430362_4B10144B 
X-CRM114-Status: GOOD (  17.43  )
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

With the blamed commit it seems that lan966x doesn't seem to boot
anymore when the internal CPU is used.
The reason seems to be the usage of the devm_of_iomap, if we replace
this with devm_ioremap, this seems to fix the issue as we use the same
region also for other devices.

Fixes: 0426a920d6269c ("reset: mchp: sparx5: Map cpu-syscon locally in case of LAN966x")
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
v3->v4:
- update commit message to match the actual changes
- add comment explaining why we can't use devm_of_iomap
v2->v3:
- forward error from of_address_to_resource
- use devm_ioremap instead of_iomap
v1->v2:
- make sure to use iounmap when driver is removed
---
 drivers/reset/reset-microchip-sparx5.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/reset-microchip-sparx5.c b/drivers/reset/reset-microchip-sparx5.c
index aa5464be7053b..6d3e75b33260e 100644
--- a/drivers/reset/reset-microchip-sparx5.c
+++ b/drivers/reset/reset-microchip-sparx5.c
@@ -8,6 +8,7 @@
  */
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -72,14 +73,22 @@ static struct regmap *mchp_lan966x_syscon_to_regmap(struct device *dev,
 						    struct device_node *syscon_np)
 {
 	struct regmap_config regmap_config = mchp_lan966x_syscon_regmap_config;
-	resource_size_t size;
+	struct resource res;
 	void __iomem *base;
+	int err;
+
+	err = of_address_to_resource(syscon_np, 0, &res);
+	if (err)
+		return ERR_PTR(err);
 
-	base = devm_of_iomap(dev, syscon_np, 0, &size);
-	if (IS_ERR(base))
-		return ERR_CAST(base);
+	/* It is not possible to use devm_of_iomap because this resource is
+	 * shared with other drivers.
+	 */
+	base = devm_ioremap(dev, res.start, resource_size(&res));
+	if (!base)
+		return ERR_PTR(-ENOMEM);
 
-	regmap_config.max_register = size - 4;
+	regmap_config.max_register =  resource_size(&res) - 4;
 
 	return devm_regmap_init_mmio(dev, base, &regmap_config);
 }
-- 
2.34.1


