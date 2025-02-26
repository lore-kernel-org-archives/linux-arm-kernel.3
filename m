Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C615C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JOwWzpP7oPlIDVAExtJCxQRJMvs7+t0EfUbeIdzOGMc=; b=zWH83nWSplHlD12GnPVmOzZOBC
	RIFKAJ3ghgaBCtCBQ7KvmakwpkUrIMkSgUe8/Zu/KtWZlrODczC1Ls0slNXyjw8mVL5ODokAOl+Y5
	ZUSfU97qgiS148htdTWrkrAPg3hh0A5mUvxhbWwvyh0nw1VjnzSZgoFkbKmrgaTn1rycEg/uuJ2TZ
	QzJRJqGa77j6N0k4EPwwS4NlHZ6QtVY0jhxNX2HQCbLJC42R0VDsw06DojkKyBrjxe3sDdPMFzDbZ
	eF1KrC3vV1DimjbfgKDOzyRhiSkeccBKxrdo+yat/yq7WXFV6qo3yL2NsQXgs3UF7p7OcXa/GZKE3
	WG12+KLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFL-00000004GNn-2C5s;
	Wed, 26 Feb 2025 15:22:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIjB-00000004AbL-3njO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740581377; x=1772117377;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AIZC9KG4Oy6b/fGWRZ0LAFqhcEEQuHGy4hYDeydpnjM=;
  b=al/zy7gv0ZcRnxNtysyyAt1XbIDvIaHPNGWIXwtSMgBvGHhKyg9aDxUT
   pJrNOC1e3E6KSdm+4SNrCT0ncr9pvyBYzKNAQjdGr8li9Hgz1+WuB4ANr
   VnQbCEWtqn16woR5e+xAQmHt1nwsENql3a9vMTFYMlyr/nbZcBDxYZo5h
   OYYzC8Lmrn5YGOA4w8RJUF7idApt7tLLcVKe+cxv8CxxVZNI/Txu09okC
   pcWrYmkR94BSZyTMTbR8fr8CFJvZ3mmh2/gs5g0iIfBjshoLlxmjJR2vT
   sfi+7XvIsY17vro7BUP6uQrkwL58wofr4yXQOkAaSffChdhELpvlXhx/R
   A==;
X-CSE-ConnectionGUID: 9VXBx6tySd6ERCH2/JYSYg==
X-CSE-MsgGUID: 0LV2LjD8T8KwiCqKNuNbOQ==
X-IronPort-AV: E=Sophos;i="6.13,317,1732604400"; 
   d="scan'208";a="42293617"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Feb 2025 07:49:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 26 Feb 2025 07:49:08 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 26 Feb 2025 07:49:07 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <p.zabel@pengutronix.de>, <Steen.Hegelund@microchip.com>,
	<daniel.machon@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<herve.codina@bootlin.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v3] reset: mchp: sparx5: Fix for lan966x
Date: Wed, 26 Feb 2025 15:46:45 +0100
Message-ID: <20250226144645.1950451-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_064937_946679_712EA5F7 
X-CRM114-Status: GOOD (  16.44  )
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
this with of_iomap, this seems to fix the issue as we use the same
region also for other devices.

Fixes: 0426a920d6269c ("reset: mchp: sparx5: Map cpu-syscon locally in case of LAN966x")
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
v2->v3:
- forward error from of_address_to_resource
- use devm_ioremap instead of_iomap
v1->v2:
- make sure to use iounmap when driver is removed
---
 drivers/reset/reset-microchip-sparx5.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/reset-microchip-sparx5.c b/drivers/reset/reset-microchip-sparx5.c
index aa5464be7053b..176b3f46e9243 100644
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
@@ -72,14 +73,19 @@ static struct regmap *mchp_lan966x_syscon_to_regmap(struct device *dev,
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
+	base = devm_ioremap(dev, res.start, resource_size(&res));
+	if (!base)
+		return ERR_PTR(-ENOMEM);
 
-	regmap_config.max_register = size - 4;
+	regmap_config.max_register =  resource_size(&res) - 4;
 
 	return devm_regmap_init_mmio(dev, base, &regmap_config);
 }
-- 
2.34.1


