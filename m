Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE007C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mnjQSbOC4oHs3NtC4TqHzfmBo9PpGjNbcQzvcBVoxss=; b=IIf+gylzajydBOf0oIX81pivUq
	AAWougUhx3S2gqSbZHK9D/JIzdHLS5uEjDxK6GTucbGU3ftif0tCTEjda4+Rvxw8VXc83jDGoFffF
	JXUuBI1hGSV7Ik8eTLBxResgy63NICfzSx4z/CxPC9+ZLx+xnDVn7+8AjkfNTqRCEDOar/5ttvHJq
	ZzcvgSnuG0u1NOG8BmmrbbQSoQ8yrJD9Z+1FRM5mqJrCT/GbsN+k1qOMC/+kLyZz8l1nkUolS7g4l
	A+XbDISHSALj7V0IlmIT1ShqrTpdLMyFAFCXJHMf39lVgfOQ142O022KTHOCe4Q8N7kqUvJfQK+XJ
	z6bhOwZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmV4F-0000000Cyjn-2x9O;
	Mon, 24 Feb 2025 09:48:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUsv-0000000Cwhi-05kA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 09:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740389780; x=1771925780;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FWYWFNS+oT7mj2E21f3jXpR3gYQLoWEmXq14pHcLk7o=;
  b=BLC0g3salrPZyPpOaNJkR/QdgaNXH87WNsfK9NEzOSQW8dnBVg+MjGSS
   qKK1eTmFn9gDm3mYwPxU/Q6qQWJI+SfE/uR8ENBUwUdpQp7PODrvzhpGv
   d4/qgt0KO5K0L9fu75jg6rx3OpXGxlGP7Pce10sBphYPDRkjAnfd2mFUD
   2njPrE/6jNlEX0V+i6R2Fg4n90AKUFfOtLagnOKuKItXrAG7PeyeaVAkX
   Q2VwqEDTC5DRB11DDTxbZBVaq+G7E6uLbNpSnH43H86r7Bb1lZFNQg1es
   grHP/joami0LGPMyi/WKwx4fZHRt/3nMXduQ7/OQu1V/ydA8pt8Ds3dBp
   w==;
X-CSE-ConnectionGUID: UsE/WXwmTmibXe7m321U4A==
X-CSE-MsgGUID: OrAZ7Jx8RAeeUXHDGrzUBg==
X-IronPort-AV: E=Sophos;i="6.13,309,1732604400"; 
   d="scan'208";a="42160288"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Feb 2025 02:36:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Feb 2025 02:36:17 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 24 Feb 2025 02:36:15 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <p.zabel@pengutronix.de>, <Steen.Hegelund@microchip.com>,
	<daniel.machon@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<herve.codina@bootlin.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH] reset: mchp: sparx5: Fix for lan966x
Date: Mon, 24 Feb 2025 10:29:23 +0100
Message-ID: <20250224092923.2648680-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_013621_186677_CFC38B9B 
X-CRM114-Status: GOOD (  14.08  )
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
Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 drivers/reset/reset-microchip-sparx5.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/reset-microchip-sparx5.c b/drivers/reset/reset-microchip-sparx5.c
index aa5464be7053b..5a75f9833a91a 100644
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
@@ -72,14 +73,17 @@ static struct regmap *mchp_lan966x_syscon_to_regmap(struct device *dev,
 						    struct device_node *syscon_np)
 {
 	struct regmap_config regmap_config = mchp_lan966x_syscon_regmap_config;
-	resource_size_t size;
+	struct resource res;
 	void __iomem *base;
 
-	base = devm_of_iomap(dev, syscon_np, 0, &size);
-	if (IS_ERR(base))
-		return ERR_CAST(base);
+	if (of_address_to_resource(syscon_np, 0, &res))
+		return ERR_PTR(-ENOMEM);
 
-	regmap_config.max_register = size - 4;
+	base = of_iomap(syscon_np, 0);
+	if (!base)
+		return ERR_PTR(-ENOMEM);
+
+	regmap_config.max_register =  resource_size(&res) - 4;
 
 	return devm_regmap_init_mmio(dev, base, &regmap_config);
 }
-- 
2.34.1


