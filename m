Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1E8CFC291
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTriyQZYYbnJqpQ9NHQXwg7JbzvLw55voRo8bIRkgF0=; b=JO7kM8wYye5++J0MtVRvB/+M60
	vkfGMC7xFhS0YUto7b33afSb3ft7Tb9f7KnCBvwaiYHZjB/tAmmXRBbM4NMlJRs8RymGvl+Bx3VIr
	JjqEdivMKX6aIK3pv1eSkUGSv8qUzR1cEo/vO21ALQKHIf/c1ieB8MZc72FNLym9ibdeInRNUU+rw
	r7exN7zbvgTDWyH/8ypHIo0Qlym3avQAz7Qfw96NyxmkdiR1hhGg5liyFyp3m2JwBQy6Rlc5XXmRK
	R+Oc+2HLoZikYSIq2W2quKpvLlbGuZmgnjITZ/0sEDwofuqOXP+WHp2oXX5lqCCaXj9lom/mD+c/O
	rVvNiNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTHk-00000008dEX-0BFZ;
	Fri, 21 Nov 2025 15:42:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTHd-00000008d9m-0SLj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 15:42:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CA9824E41832;
	Fri, 21 Nov 2025 15:42:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9E51D60719;
	Fri, 21 Nov 2025 15:42:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A793210372188;
	Fri, 21 Nov 2025 16:42:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763739765; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BTriyQZYYbnJqpQ9NHQXwg7JbzvLw55voRo8bIRkgF0=;
	b=cvmVBhT6OnVhWqrq/NM5dwpFkuXvXiRy+NzWEqJJOy1dNawbXqrlhyFSOExl1av7RgTWXV
	pWRRuJ25YYOIquXNd9ssNDDExXKSelGjameE8FGYnF45biWFSmLXHqd7NiRdfEUBkIq76I
	RuddAFVlYFKhIGyPdGXHVZ4A/S6uL7Gj7R3KqfpoSxfh9UJTQG8TXuYNEyh1rYYdm1Yo7X
	/i1Io1C8oJUV0ljSZZbRYVVbRlmdvAlQTYKATPKK0XFHTSO/MLb16BIY1vO5E5j4auqknt
	URLxal3XwSQOoUZ3rsexAtskjDkthSvpHJSr0R/ehNAJiNfrdJ8LF1yl8SL3vw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 21 Nov 2025 16:42:37 +0100
Subject: [PATCH v2 3/3] mtd: physmap: Add support for RAM reserved memory
 regions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-mtd-memregion-v2-3-c5535fdcebe4@bootlin.com>
References: <20251121-mtd-memregion-v2-0-c5535fdcebe4@bootlin.com>
In-Reply-To: <20251121-mtd-memregion-v2-0-c5535fdcebe4@bootlin.com>
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_074249_417303_CD005E54 
X-CRM114-Status: GOOD (  23.37  )
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

MTD fixed-partitions can now be exposed for reserved RAM regions, not
just ROM reg regions. This is achieved by using a memory-region
phandle to reference the reserved RAM region instead of the reg
property.

Based on the work of Muhammad Musa <muhammad.musa@intel.com>

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/mtd/maps/physmap-core.c | 56 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 2bd7a1af898c9..f084f6f34d611 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -39,6 +39,7 @@
 #include <linux/mtd/cfi_endian.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pm_runtime.h>
 #include <linux/gpio/consumer.h>
 
@@ -263,6 +264,14 @@ static const struct of_device_id of_flash_match[] = {
 		.type = "rom",
 		.compatible = "direct-mapped"
 	},
+	{
+		.compatible = "mtd-mem",
+		.data = "map_ram",
+	},
+	{
+		.compatible = "mtd-memro",
+		.data = "map_rom",
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, of_flash_match);
@@ -446,8 +455,9 @@ static int physmap_flash_pdata_init(struct platform_device *dev)
 static int physmap_flash_probe(struct platform_device *dev)
 {
 	struct physmap_flash_info *info;
-	int err = 0;
-	int i;
+	struct resource *res_array;
+	int err = 0, is_rsvd_mem = 0, nreg = 0;
+	int i, curr_reg;
 
 	if (!dev->dev.of_node && !dev_get_platdata(&dev->dev))
 		return -EINVAL;
@@ -459,9 +469,13 @@ static int physmap_flash_probe(struct platform_device *dev)
 	while (platform_get_resource(dev, IORESOURCE_MEM, info->nmaps))
 		info->nmaps++;
 
-	if (!info->nmaps)
-		return -ENODEV;
-
+	if (!info->nmaps) {
+		info->nmaps = of_reserved_mem_region_total_count(dev->dev.of_node);
+		if (info->nmaps > 0)
+			is_rsvd_mem = 1;
+		else
+			return -ENODEV;
+	}
 	info->maps = devm_kzalloc(&dev->dev,
 				  sizeof(*info->maps) * info->nmaps,
 				  GFP_KERNEL);
@@ -503,7 +517,23 @@ static int physmap_flash_probe(struct platform_device *dev)
 	for (i = 0; i < info->nmaps; i++) {
 		struct resource *res;
 
-		info->maps[i].virt = devm_platform_get_and_ioremap_resource(dev, i, &res);
+		if (is_rsvd_mem) {
+			if (nreg <= i) {
+				int cnt = of_reserved_mem_region_to_resource_array(&dev->dev,
+							   dev->dev.of_node, i, &res_array);
+				if (cnt < 0) {
+					err = cnt;
+					goto err_out;
+				}
+				nreg += cnt;
+				curr_reg = 0;
+			}
+			res = &res_array[curr_reg++];
+			info->maps[i].virt = devm_ioremap_resource(&dev->dev, res);
+		} else {
+			info->maps[i].virt = devm_platform_get_and_ioremap_resource(dev, i, &res);
+		}
+
 		if (IS_ERR(info->maps[i].virt)) {
 			err = PTR_ERR(info->maps[i].virt);
 			goto err_out;
@@ -519,9 +549,17 @@ static int physmap_flash_probe(struct platform_device *dev)
 			info->maps[i].phys = res->start;
 
 		info->win_order = fls64(resource_size(res)) - 1;
-		info->maps[i].size = BIT(info->win_order +
-					 (info->gpios ?
-					  info->gpios->ndescs : 0));
+		/* When using a memory region, the size is not necessarily a
+		 * power of 2, so win_order is not applicable. Since GPIOs are
+		 * unavailable in this context, directly using the region's size
+		 * is safe.
+		 */
+		if (is_rsvd_mem)
+			info->maps[i].size = resource_size(res);
+		else
+			info->maps[i].size = BIT(info->win_order +
+						 (info->gpios ?
+						  info->gpios->ndescs : 0));
 
 		info->maps[i].map_priv_1 = (unsigned long)dev;
 

-- 
2.51.0


