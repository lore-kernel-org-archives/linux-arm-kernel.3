Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3686FCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nvx/6wkLcHShWXkNZT1A0xIy9aByre6GFax+04vmtXM=; b=ddrxRoWshOYFU8JsP/Mb9Xs2Uf
	7zkSl1VmYUzkjA0YlVHSG9nRQyzmhLGTozXHuWXisH7d27/bbqRTKNUlWpIDL8EYqMNRHUY9F6Rbi
	cxAHHtjfguAI5xsKhUFFlW8CeCI2zmqFTnL6fK49yXw+wT094H7Ann5nym3DRDai2iyX1IWPMcqyW
	TwQMj9RNBhgxe1zbaRzQzJv3LsTL1r6cjFyh5SBsojmo+XLH6ZqjmBc/7/5Z0q0QsLy1CSDnG7aj2
	VA3QeXGumu3awYvYiMWQC0WwK2KdSjRS7Y1ZwmlV4qNwiAELBkdTOGiM0NltDRxLYedG0Fu/ubaBD
	g601kDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCd84-0000000BeUh-2RnE;
	Fri, 02 Oct 2026 13:16:48 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCd81-0000000BeUI-1xN9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:16:46 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-33e46a15703so7058551eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947004; x=1791551804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nvx/6wkLcHShWXkNZT1A0xIy9aByre6GFax+04vmtXM=;
        b=GGjy2AmRZGndCn3fvzlgRWToSSq+Z5FUjm5A4ZHY2kxLPLuU2yisiTgQja97oVb8wp
         WoergcrT7CgTOLCZgxpc51VUxYc98tP8JiAz0oFeSV3FMP5rSKvGctnjspDZ7bddx4p1
         vcBjwerisvGZgVcrCp7X1ON1s76RGRe6AcbZn3hrypLB45k/YmJUUtP2sZGajBj1viYF
         4hRqoKivrTqbAJg+ySaWC69sEwyZP52wzOP9mWiMBA6IOoJ40Sn1Sq0mZ08NndnzhKS3
         Yg+ZHSHYx64K7cYIWAS1OTUfmg4QCFiTYO2J1A5KrqXFAqAaR95+iDLtRTl+KI5CYrxC
         THMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947004; x=1791551804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nvx/6wkLcHShWXkNZT1A0xIy9aByre6GFax+04vmtXM=;
        b=VoLLfOd5HR05794njvDyCqGXtnrspUsknLGNrL2GYOkQw5FdwK2wtUYmhA9rVStlYU
         rGZKt1PaqHXwWQDxEUHgIDP8kvOE03LLJzUANRmqs8h55YlzAsZ142S7EZcdWcZBFqQu
         xbNiGLNwa5jfGNo4tczhKdppayPTlDPmEPAMG2O6daksMR47sXk/dXuE+o+FICzqTU6K
         MtDDW4xSpabDgbmDWI9lIdTW8USfq+XMtwdARStj7nZaTSwmk3qTfCw+28/naxSq+7HS
         F42DNavWzSKsOEp2HqqbvjvRk2L0lghIOeH4cNwVOxGfngI6oACoZFhxGp/QGBYOxPc0
         AyYw==
X-Gm-Message-State: AFq9FYKsPPKM6tBNkUY1chEmDB6XTOy/LzIrufp0GYmdF+dytWwQLqzT
	f/p6cTdz/DKfKWBoeZLHJgtRmKZQZH/FaBiUdiGqQQTqwf4d8RDNrgG0DzxDuw==
X-Gm-Gg: AYBFou1RdXAvSFilctIm9v4qQ8tDesr+/qukBf1zKvmPsn0E5Y8zZzg2o4i1qJV+haQ
	wp2Sh3CqIYITEXvOdNWSc/2eex3PVeE74kG38X51PzRQYMbFoL0NoP26nToEQzxoy8f58eacdRh
	mxHN1G8wVlDkCtxskTKodTc4wj8hjpVhwFVRiiOUca9W36F75KJo+SU0SYXJlyfvWvSSZ/hCUbA
	RUp5KbHhUxCjeyafW0rRamppAob50mzGyoOaelXxi+r9Sigo5jtUD+k+zO06Gtq0WgrGXBF4mtw
	sA+6LRExkqp0LVQvw3/89hXBdAD0ML4U79M58Yznm44xlOVYNf5Opk2Rh+kCozrTxKOR+buu4ws
	XObN9g5iAB4UNJtFonBG5oK61nliSvZFtAiyF4HqBZtrU2h82ozKzW2tUxMbvlfEyiKcZQNEoo2
	QlyDs12gxHQAp/aoXWQ6r4H79GStU/W01rcWnJd+rqzOFbf3imhTZ/5u/e1cJzGuawaYHIAgROG
	58oPoQVXZ5nkLiGkkppDAja/vI=
X-Received: by 2002:a05:693c:8951:10b0:34d:2084:12d3 with SMTP id 5a478bee46e88-34f219a4e69mr2785581eec.39.1790947004214;
        Fri, 02 Oct 2026 06:16:44 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm15839228eec.18.2026.10.02.06.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:16:42 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	tan.siewert@9elements.com,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [RFC PATCH] soc: aspeed: Add B650D4U power passthrough support
Date: Fri,  2 Oct 2026 18:46:34 +0530
Message-ID: <20261002131634.113680-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_061645_540797_D174312E 
X-CRM114-Status: GOOD (  20.34  )
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

Add the AST2600 SCU passthrough selector support used by the
ASRock Rack B650D4U host power-control circuit. This RFC includes
the driver, Devicetree binding, and board node to discuss the final
kernel-facing interface.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 .../asrock,b650d4u-power-passthrough.yaml     |  23 ++++
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  |   5 +
 drivers/soc/aspeed/Kconfig                    |   9 ++
 drivers/soc/aspeed/Makefile                   |   1 +
 drivers/soc/aspeed/aspeed-b650d4u-power.c     | 110 ++++++++++++++++++
 5 files changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
 create mode 100644 drivers/soc/aspeed/aspeed-b650d4u-power.c

diff --git a/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
new file mode 100644
index 000000000000..e6451d17955c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/aspeed/asrock,b650d4u-power-passthrough.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASRock Rack B650D4U power passthrough
+
+maintainers:
+  - Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
+
+properties:
+  compatible:
+    const: asrock,b650d4u-power-passthrough
+
+  aspeed,scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - aspeed,scu
+
+additionalProperties: false
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
index a4e384588a54..86291c250562 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -32,6 +32,11 @@ gfx_memory: framebuffer {
 			size = <0x01000000>;
 		};
 	};
+
+	host-power-passthrough {
+		compatible = "asrock,b650d4u-power-passthrough";
+		aspeed,scu = <&syscon>;
+	};
 };
 
 &fmc {
diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 11e4db998c06..1b0281e0bfb0 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -58,6 +58,15 @@ config ASPEED_SBC
 	  Say yes to provide information about the secure boot controller in
 	  debugfs.
 
+config ASPEED_B650D4U_POWER
+	tristate "ASRock B650D4U host power passthrough"
+	select REGMAP
+	select MFD_SYSCON
+	default ARCH_ASPEED
+	help
+	  Enable the AST2600 GPIO passthrough selector used by the
+	  ASRock Rack B650D4U host power-control circuit. This selector routes the host power pulse through the board's passthrough logic during power sequencing.
+
 config ASPEED_XDMA
 	tristate "ASPEED XDMA Engine Driver"
 	select REGMAP
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index 5f61bb4cc36c..3e9618d1eafc 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
 obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
 obj-$(CONFIG_ASPEED_SBC)		+= aspeed-sbc.o
+obj-$(CONFIG_ASPEED_B650D4U_POWER)	+= aspeed-b650d4u-power.o
 obj-$(CONFIG_ASPEED_XDMA)		+= aspeed-xdma.o
diff --git a/drivers/soc/aspeed/aspeed-b650d4u-power.c b/drivers/soc/aspeed/aspeed-b650d4u-power.c
new file mode 100644
index 000000000000..22a6925539dc
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-b650d4u-power.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
+#include <linux/kstrtox.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/bits.h>
+
+#define ASPEED_SCU_PROTECTION        0x000
+#define ASPEED_SCU_GPIO_PASSTHROUGH  0x4bc
+#define ASPEED_SCU_GPIO_ACTION       0x51c
+#define ASPEED_SCU_UNLOCK_KEY        0x1688a8a8
+#define ASPEED_B650D4U_POWER_MASK    GENMASK(27, 26)
+
+static struct regmap *b650d4u_scu;
+static DEFINE_MUTEX(b650d4u_lock);
+
+static int b650d4u_set_passthrough(bool enable)
+{
+	int ret;
+
+	mutex_lock(&b650d4u_lock);
+
+	ret = regmap_write(b650d4u_scu, ASPEED_SCU_PROTECTION,
+			   ASPEED_SCU_UNLOCK_KEY);
+	if (ret) {
+		pr_err("B650D4U: SCU unlock failed: %d\n", ret);
+		goto out;
+	}
+
+	ret = regmap_update_bits(b650d4u_scu,
+				 ASPEED_SCU_GPIO_PASSTHROUGH,
+				 ASPEED_B650D4U_POWER_MASK,
+				 enable ? ASPEED_B650D4U_POWER_MASK : 0);
+	if (ret) {
+		pr_err("B650D4U: passthrough update failed: %d\n", ret);
+		goto out;
+	}
+
+	if (!enable)
+		ret = regmap_write(b650d4u_scu,
+				   ASPEED_SCU_GPIO_ACTION, 0);
+
+out:
+	mutex_unlock(&b650d4u_lock);
+	return ret;
+}
+
+static ssize_t passthrough_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	bool enable;
+	int ret;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	ret = b650d4u_set_passthrough(enable);
+	return ret ? ret : count;
+}
+static DEVICE_ATTR_WO(passthrough);
+
+static int aspeed_b650d4u_power_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	b650d4u_scu = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+						      "aspeed,scu");
+	if (IS_ERR(b650d4u_scu))
+		return dev_err_probe(&pdev->dev, PTR_ERR(b650d4u_scu),
+				     "failed to get AST2600 SCU regmap\n");
+
+	ret = b650d4u_set_passthrough(true);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to enable power GPIO passthrough\n");
+
+	ret = device_create_file(&pdev->dev, &dev_attr_passthrough);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to create passthrough control\n");
+
+	dev_info(&pdev->dev, "enabled GPIO passthrough selector 1\n");
+	return 0;
+}
+
+static const struct of_device_id aspeed_b650d4u_power_of_match[] = {
+	{ .compatible = "asrock,b650d4u-power-passthrough" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aspeed_b650d4u_power_of_match);
+
+static struct platform_driver aspeed_b650d4u_power_driver = {
+	.probe = aspeed_b650d4u_power_probe,
+	.driver = {
+		.name = "aspeed-b650d4u-power",
+		.of_match_table = aspeed_b650d4u_power_of_match,
+	},
+};
+module_platform_driver(aspeed_b650d4u_power_driver);
+
+MODULE_DESCRIPTION("ASRock Rack B650D4U host power GPIO passthrough");
+MODULE_LICENSE("GPL");
-- 
2.47.3


