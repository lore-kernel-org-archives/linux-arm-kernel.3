Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1DCCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sl5xhQEQ5jJjs9NVyTu44PT+PkxvqNJiAQ/dgYRRiPE=; b=V3kGQD/1/xGTm8OJPkKDGUBULK
	hBhUqvIDaOyLCs8jAMt1voaB90gwWwdRfYbFY1dfuqStO64Tp/xWz7MoQPIOGdsSVcr8QdJKIHNf4
	3H2Ggl9+GQT3t+2bhnOBh9FAnGJgpzXbnWurxKP17+U72zAm2Y+m3wG9TQYgFklWURa+Msn+H7sQt
	7yVqXNRljLw35rqN/zupwgSLAWWaKT1X4nPsyTT3WOxcZyEV6FxBXJT4Evc5JzaThuqs5E3Y7S97F
	JIIRnUteBTD6+xs3jLzvfFk4zchCA5kv+wTzxbHF7LhnQptENb9N907NgVmDfUoCDld/RQMmpuxrY
	8LQHniAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbMy-00000003siq-1NNv;
	Mon, 08 Jun 2026 14:54:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbMv-00000003shI-30M1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:54:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490b12270b3so26645045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780930464; x=1781535264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sl5xhQEQ5jJjs9NVyTu44PT+PkxvqNJiAQ/dgYRRiPE=;
        b=VLwrHcPSsnRAEe2n7Zvcpd0cFQ0cugpWTNT5xAMDOoPQYqYVLjlL3hMecg9DYvxz1y
         i0MfPmRjNp/yIKw6uBU+I38mux10qw1/7/e7lnrX2s9pmnLJ1ilgXSqkE/JKn5BfkYCW
         zKFso6b+h5wDPiEglWrVVfkD8P6KYquMxuoh13sEERNFJt+n09FE2ofaPtbhdhp6DCP9
         /OYk1kREP3cBTRm5wTW/mE7F60GMwZk5U0kjF41SSWDR40kcp+cWAE7QC5Yu7KIxRP7k
         cOI7B1fsSeD06+tWsFPslH79fPdoA5hVBs5QZbcnZdzhicrPwsPpMjfjFbwnmnQxzHf6
         rfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930464; x=1781535264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sl5xhQEQ5jJjs9NVyTu44PT+PkxvqNJiAQ/dgYRRiPE=;
        b=qlLx5nTv/oDnPtvP+PY09NHhT8B2JetsHOqFL/JWCht6sofLPWv2nylsbcTsUj52Km
         5asnKFDa+5smL8ZRC6N4bZ4zOYXSfAHsuD5kdpv2BqYaY3T1kN6fSfVuEiAscFp0QiI1
         nqbnNIEfeWQzhc9Hag4R6+LKxlYageytGvp241Q/Oy84Sne6QgrXwILd127ahNVO29RU
         pwayFV2lrzeGO92Wwp2jjkf1SHec4GOLGaqx7LB/NeNUeI2jDfu21Tfew2X1oPSJ/sE1
         3N+SMMGxtqdG1koksMVRFm346sAY5E6MjUpsSzRwrKrNwZOO39hDISrQHS/9GZH10iac
         twGQ==
X-Forwarded-Encrypted: i=1; AFNElJ97U8LQfl/9IWFuA88BbVMLseVeu+cznrI2itoUGxjh3GOAt2rXEQdBCY/enq5Ho9t4EKymIuzfkcbTfStugF/1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/mFEwNm7vdKN+vYnGdyGudNhNtJ9SkgvoQsKWwUIUpKVm6N01
	iPGwG/N+7TCs8XOt3sMJgTnH7PJkySnB13gPWIZEpCInnQxl78VQbhmDu3jl798kgdU=
X-Gm-Gg: Acq92OFB8zXMru4PGdjnm0iao9giyulEQ7leYsRO5knLllypnIDzXeNpNohduwt6L/D
	eO+oG6Jg1Qxx+Jsf5i8c6MGtzoxICH+YbKBRGFPSQ36pN6882mSjt/tpbybTmJ4fpGUG+BgZaKl
	UMM1V1nnS0aQhOoQ6LXeix2qmsOhV18DpL+6fzdfAYct0GA3k8BmOEL7nec5i7NIhxIUtUmg+/s
	/coAuHX1O8gcCnIlo+2xNYLh/dY9LRYaSUqZkRt+BLOZ7y2xpsH09JRZuwhj0xJQBWEYQ396uou
	YBG0/N6WJ9SQpz77j5lfhPaED1FwkROgCUm1CiB6F05E4SynqA+dYs/UESBdddzPtz6bvGqSxQI
	zST7V0ppF3u6cLMQo7JTL+A3jdh4/vtCwn8vJgPqiHipWeeFviHzDDlt9DIvHB+vK/6ha2hrbG1
	zPFGncYTbv8We6EXth2DFXLf0RDYvwYUuClzXEh+m9MB/W0Ho+GVBLM8fP8mRfsaMQ6881GQw=
X-Received: by 2002:a05:600c:870f:b0:490:44eb:c1e7 with SMTP id 5b1f17b1804b1-490c2624a03mr258100705e9.30.1780930463932;
        Mon, 08 Jun 2026 07:54:23 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm56927851f8f.36.2026.06.08.07.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:54:23 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v2 1/2] soc: aspeed: add BMC-side PCIe BMC device driver
Date: Mon,  8 Jun 2026 14:51:22 +0000
Message-ID: <af322e76d34ad504e0bdec470293a017b489cfd7.1780929570.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1780929570.git.gregoire.layet@9elements.com>
References: <cover.1780929570.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_075425_912848_4C4F3214 
X-CRM114-Status: GOOD (  25.25  )
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

Taken from ASPEED 6.18 Kernel SDK

Add support for VUART over PCIe between BMC and host.
This add BMC side driver.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
Tested-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/soc/aspeed/Kconfig          |   7 ++
 drivers/soc/aspeed/Makefile         |   1 +
 drivers/soc/aspeed/aspeed-bmc-dev.c | 187 ++++++++++++++++++++++++++++
 3 files changed, 195 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-bmc-dev.c

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index f579ee0b5afa..3e1fcf3c3268 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -4,6 +4,13 @@ if ARCH_ASPEED || COMPILE_TEST
 
 menu "ASPEED SoC drivers"
 
+config ASPEED_BMC_DEV
+	tristate "ASPEED BMC Device"
+	default n
+	help
+	  Enable support for the ASPEED AST2600 BMC Device.
+	  This exposes the PCIe-to-LPC bridge of the BMC to the host over PCIe.
+
 config ASPEED_LPC_CTRL
 	tristate "ASPEED LPC firmware cycle control"
 	select REGMAP
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index b35d74592964..fab0d247df66 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_ASPEED_BMC_DEV)		+= aspeed-bmc-dev.o
 obj-$(CONFIG_ASPEED_LPC_CTRL)		+= aspeed-lpc-ctrl.o
 obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
diff --git a/drivers/soc/aspeed/aspeed-bmc-dev.c b/drivers/soc/aspeed/aspeed-bmc-dev.c
new file mode 100644
index 000000000000..7a204b543c97
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-bmc-dev.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (C) ASPEED Technology Inc.
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/errno.h>
+
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+
+#include <linux/regmap.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
+
+#define SCU_TRIGGER_MSI
+
+/* AST2600 SCU */
+#define ASPEED_SCU04			0x04
+#define AST2600A3_SCU04				0x05030303
+#define ASPEED_SCUC20			0xC20
+#define ASPEED_SCUC24			0xC24
+#define MSI_ROUTING_MASK			GENMASK(11, 10)
+#define PCIDEV1_INTX_MSI_HOST2BMC_EN		BIT(18)
+#define MSI_ROUTING_PCIe2LPC_PCIDEV0		(0x1 << 10)
+#define MSI_ROUTING_PCIe2LPC_PCIDEV1		(0x2 << 10)
+
+#define ASPEED_SCU_PCIE_CONF_CTRL	0xC20
+#define  SCU_PCIE_CONF_BMC_DEV_EN			 BIT(8)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_MMIO		 BIT(9)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_MSI		 BIT(11)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_IRQ		 BIT(13)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_DMA		 BIT(14)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_E2L		 BIT(15)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE BIT(21)
+
+#define ASPEED_SCU_BMC_DEV_CLASS	0xC68
+
+
+struct aspeed_platform {
+	int (*init)(struct platform_device *pdev);
+};
+
+struct aspeed_bmc_device {
+	struct device *dev;
+	int id;
+	void __iomem *reg_base;
+
+	int pcie2lpc;
+	int irq;
+
+	const struct aspeed_platform *platform;
+
+	struct regmap *scu;
+	int pcie_irq;
+};
+
+
+static int aspeed_ast2600_init(struct platform_device *pdev)
+{
+	struct aspeed_bmc_device *bmc_device = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	u32 pcie_config_ctl = SCU_PCIE_CONF_BMC_DEV_EN_IRQ |
+			      SCU_PCIE_CONF_BMC_DEV_EN_MMIO | SCU_PCIE_CONF_BMC_DEV_EN;
+	u32 scu_id;
+
+	bmc_device->scu = syscon_regmap_lookup_by_phandle(dev->of_node, "aspeed,scu");
+	if (IS_ERR(bmc_device->scu)) {
+		dev_err(&pdev->dev, "failed to find SCU regmap\n");
+		return PTR_ERR(bmc_device->scu);
+	}
+
+	if (bmc_device->pcie2lpc)
+		pcie_config_ctl |= SCU_PCIE_CONF_BMC_DEV_EN_E2L |
+				   SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE;
+
+	regmap_update_bits(bmc_device->scu, ASPEED_SCU_PCIE_CONF_CTRL,
+			   pcie_config_ctl, pcie_config_ctl);
+
+	/* update class code to others as it is a MFD device */
+	regmap_write(bmc_device->scu, ASPEED_SCU_BMC_DEV_CLASS, 0xff000000);
+
+#ifdef SCU_TRIGGER_MSI
+	//SCUC24[17]: Enable PCI device 1 INTx/MSI from SCU560[15]. Will be added in next version
+	regmap_update_bits(bmc_device->scu, ASPEED_SCUC20, BIT(11) | BIT(14), BIT(11) | BIT(14));
+
+	regmap_read(bmc_device->scu, ASPEED_SCU04, &scu_id);
+	if (scu_id == AST2600A3_SCU04)
+		regmap_update_bits(bmc_device->scu, ASPEED_SCUC24,
+				   PCIDEV1_INTX_MSI_HOST2BMC_EN | MSI_ROUTING_MASK,
+				   PCIDEV1_INTX_MSI_HOST2BMC_EN | MSI_ROUTING_PCIe2LPC_PCIDEV1);
+	else
+		regmap_update_bits(bmc_device->scu, ASPEED_SCUC24,
+				   BIT(17) | BIT(14) | BIT(11), BIT(17) | BIT(14) | BIT(11));
+#else
+	//SCUC24[18]: Enable PCI device 1 INTx/MSI from Host-to-BMC controller.
+	regmap_update_bits(bmc_device->scu, 0xc24, BIT(18) | BIT(14), BIT(18) | BIT(14));
+#endif
+
+
+	return 0;
+}
+
+
+static struct aspeed_platform ast2600_plaform = {
+	.init = aspeed_ast2600_init
+};
+
+
+static const struct of_device_id aspeed_bmc_device_of_matches[] = {
+	{ .compatible = "aspeed,ast2600-bmc-device", .data = &ast2600_plaform },
+	{},
+};
+MODULE_DEVICE_TABLE(of, aspeed_bmc_device_of_matches);
+
+static int aspeed_bmc_device_probe(struct platform_device *pdev)
+{
+	struct aspeed_bmc_device *bmc_device;
+	struct device *dev = &pdev->dev;
+	const void *md = of_device_get_match_data(dev);
+	int ret = 0;
+
+	if (!md)
+		return -ENODEV;
+
+	bmc_device = devm_kzalloc(&pdev->dev, sizeof(struct aspeed_bmc_device), GFP_KERNEL);
+	if (!bmc_device)
+		return -ENOMEM;
+	dev_set_drvdata(dev, bmc_device);
+
+	bmc_device->platform = md;
+
+	bmc_device->id = of_alias_get_id(dev->of_node, "bmcdev");
+	if (bmc_device->id < 0)
+		bmc_device->id = 0;
+
+	bmc_device->dev = dev;
+	bmc_device->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(bmc_device->reg_base))
+		return PTR_ERR(bmc_device->reg_base);
+
+	bmc_device->irq = platform_get_irq(pdev, 0);
+	if (bmc_device->irq < 0) {
+		dev_err(&pdev->dev, "platform get of irq[=%d] failed!\n", bmc_device->irq);
+		return bmc_device->irq;
+	}
+
+	if (of_property_read_bool(dev->of_node, "pcie2lpc"))
+		bmc_device->pcie2lpc = 1;
+
+	ret = bmc_device->platform->init(pdev);
+	if (ret) {
+		dev_err(dev, "Initialize bmc device failed\n");
+		goto out;
+	}
+
+	dev_info(dev, "aspeed bmc device: driver successfully loaded.\n");
+
+	return 0;
+
+out:
+	dev_warn(dev, "aspeed bmc device: driver init failed (ret=%d)!\n", ret);
+	return ret;
+}
+
+static void aspeed_bmc_device_remove(struct platform_device *pdev)
+{
+	struct aspeed_bmc_device *bmc_device = platform_get_drvdata(pdev);
+
+	devm_free_irq(&pdev->dev, bmc_device->irq, bmc_device);
+	devm_kfree(&pdev->dev, bmc_device);
+}
+
+static struct platform_driver aspeed_bmc_device_driver = {
+	.probe		= aspeed_bmc_device_probe,
+	.remove		= aspeed_bmc_device_remove,
+	.driver		= {
+		.name	= KBUILD_MODNAME,
+		.of_match_table = aspeed_bmc_device_of_matches,
+	},
+};
+
+module_platform_driver(aspeed_bmc_device_driver);
+
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_DESCRIPTION("ASPEED BMC DEVICE Driver");
+MODULE_LICENSE("GPL");
\ No newline at end of file
-- 
2.51.2


