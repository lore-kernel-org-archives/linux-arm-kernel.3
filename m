Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9368AC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 17:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1JyU+UUO9hCdIjOoey819GpAJ67w+5u6uyc4KB2ttE=; b=3Bu7kxir+9ytJqgcjjAYxzOyri
	tSKOCahyxF7vqPbN/3D0s8YflceXhLYN2M6eyOV+C09OckI5pYfNMUI6vNxfAONE0ciANLwlYreMd
	xzOoPM+lIHn3xCDEXQ/r+haUGJkJ+YsVR2ghZdVBFkaAEIgfmFqFvy4Q69pM1kvwyfmeN3eFotoHh
	0xy3qKsyGMd9Vg46qJ6r+ytiiaWTiAKBAtXFj+3usn4CEUk0/iAzzBuP6MYcVjjKuuKthl8spfjhI
	/Xi2tya5UEM4rITslH0eQY2F8kwtLjxIhPsk9X69TQ3sZ1oAtINYoRR9/Ov6CTPFjRa8xaAhqq1RR
	Lxp/NwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKkb-00000000smF-3E0i;
	Sun, 09 Mar 2025 17:47:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKRd-00000000pv0-0GcD;
	Sun, 09 Mar 2025 17:28:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38f406e9f80so2635827f8f.2;
        Sun, 09 Mar 2025 10:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741541288; x=1742146088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1JyU+UUO9hCdIjOoey819GpAJ67w+5u6uyc4KB2ttE=;
        b=jltZYpdHBmAfzChhGBi6YBEumeIWGX5jJwJPi22RZ17R2ZWvESXRWvXaKCFjdEHMrJ
         ehtRpIiHrCGQqHVDnvgCr0/eWY6g7jbmkPpMn0bDbYgOyHXholYDHaItrUa8x9e+X4Oa
         ZbnR14uD8NJUibqzvetlxU7reW+65cezbRLTbFJFiAgUeWg67+itw9XPw33SuclvkpoH
         S/LUX/cuFIoiKh1ZcG+wuaa8MHy6IPCEJOqxenV9N5pYIHTAijIC7ySFPW+5uwAEHbv/
         c8wB1VtMrnqgQIXju/Q3wYx2yRlvfuSKJLo5+/7fAMv0OegnsZvCuP2FAflltyTiI0oo
         1fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741541288; x=1742146088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1JyU+UUO9hCdIjOoey819GpAJ67w+5u6uyc4KB2ttE=;
        b=VGl78xbDPGJ7TxTGLhN/rNf0r7x53n+2qUg6HQnRKV1JtZH7ewQnLV4QE0xGnphPr4
         Ow9XhUCyVjCSgZ8I1WgF+U1rjdBRDLWX+8q9JH4QTlpIddsqrH7FUwh+erulX+lrJngs
         wuZpBfZ48gcg/YY9tAof9sksC9m9TcF7OrGMcTDQB/wqYKk3PN5N4kzLp3j3rWznsW8A
         V1yaHfOWV7QcBo7fEqgYk8BCd4xO7DGtot4rcF8rA2zA22HK7FphyCC3xpZMt0rWzmJN
         oiylYNvpeNBQQkiGy8Fh2anOAP9SCGalycLQdunJlpJawhDo9hE0Ms2fQ/N5l7zt8Cq7
         tOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7zGtYeUVp5UFAdXEnJqGXkyLOhbfgQICVihEbuqESWaxjKWIeBG4OZ7pZQD7x/euCLRs4q5eJJAye9x+zXoo=@lists.infradead.org, AJvYcCX6nPLqUoxWm0i9sY2OwOyYxgkWlbFA8QUzBnZdabA+s/1j8H4kHwl1K3hNIgJ4ZwzY5ZRrqzTmC5jTPPIULZ7B@lists.infradead.org
X-Gm-Message-State: AOJu0YzP5blmoP4VdyJ9N4jwdh0wmmFK7i+uYmv3tyZjXwqemm8L/0rH
	VVzN7ssVuRjeNAVzAmW4tn5DUyk5h/iLmQPwLPVrIPiBM70YPcHq
X-Gm-Gg: ASbGncvvHema30hxHzFvBKHrrh81tiWKid0hTAML0V6N3/Aliwa6HxaqHx4d2gHrkIH
	xWuml8bFkuvm2+qT3dr43LdbvN/TgLCiTFkY1egF8OmBPLsjYiUJjW0GDzH+kiW6kjQ7iNe8uvc
	gdPszvLkq0xYHDJPIYEfLhq3vgzq/ZA2cw568WGmOg50uZqYtNWFtVaQZ/qzC1BY99C+yps26b1
	ta+iXkwVxVyz2S3l+G8Yd3Ba6/DZsr0GfZiqkkRGpXUJ4FHJDUjCOHICdO4tVYzu38WOrHPjCDn
	Qtx/pqaVoYwAGdXaTsq0YypTlXToz6zvOISMIdgWfT7T5lhdPeRBxun0hGDZvKoVJGgk1YUmkKV
	Zk80wiOeAJu+DrA==
X-Google-Smtp-Source: AGHT+IGNhikt/NsxmJGdqtqwlToXHAZwvEm+PC/3tUA9VKA/p27tdDCPNBTEMFW0n6AxaZPDiTn/kQ==
X-Received: by 2002:a05:6000:402a:b0:38f:2efb:b829 with SMTP id ffacd0b85a97d-39132db8f39mr7875008f8f.50.1741541287684;
        Sun, 09 Mar 2025 10:28:07 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bfdfddcsm12564875f8f.35.2025.03.09.10.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:28:07 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v12 11/13] nvmem: an8855: Add support for Airoha AN8855 Switch EFUSE
Date: Sun,  9 Mar 2025 18:26:56 +0100
Message-ID: <20250309172717.9067-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309172717.9067-1-ansuelsmth@gmail.com>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_102809_115634_9E8CB8BB 
X-CRM114-Status: GOOD (  22.59  )
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

Add support for Airoha AN8855 Switch EFUSE. These EFUSE might be used
for calibration data for the internal switch PHYs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                  |  1 +
 drivers/nvmem/Kconfig        | 11 +++++++
 drivers/nvmem/Makefile       |  2 ++
 drivers/nvmem/an8855-efuse.c | 63 ++++++++++++++++++++++++++++++++++++
 4 files changed, 77 insertions(+)
 create mode 100644 drivers/nvmem/an8855-efuse.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c83c446a69d..938b81767862 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -732,6 +732,7 @@ F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 F:	drivers/mfd/airoha-an8855.c
 F:	drivers/net/mdio/mdio-an8855.c
+F:	drivers/nvmem/an8855-efuse.c
 
 AIROHA ETHERNET DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b9..ca96c6ea685a 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -28,6 +28,17 @@ source "drivers/nvmem/layouts/Kconfig"
 
 # Devices
 
+config NVMEM_AN8855_EFUSE
+	tristate "Airoha AN8855 eFuse support"
+	depends on MFD_AIROHA_AN8855 || COMPILE_TEST
+	help
+	  Say y here to enable support for reading eFuses on Airoha AN8855
+	  Switch. These are e.g. used to store factory programmed
+	  calibration data required for the PHY.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called nvmem-an8855-efuse.
+
 config NVMEM_APPLE_EFUSES
 	tristate "Apple eFuse support"
 	depends on ARCH_APPLE || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5b77bbb6488b..c732132c0e45 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -10,6 +10,8 @@ nvmem_layouts-y			:= layouts.o
 obj-y				+= layouts/
 
 # Devices
+obj-$(CONFIG_NVMEM_AN8855_EFUSE)	+= nvmem-an8855-efuse.o
+nvmem-an8855-efuse-y 			:= an8855-efuse.o
 obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
 nvmem-apple-efuses-y 			:= apple-efuses.o
 obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
diff --git a/drivers/nvmem/an8855-efuse.c b/drivers/nvmem/an8855-efuse.c
new file mode 100644
index 000000000000..cd1564379098
--- /dev/null
+++ b/drivers/nvmem/an8855-efuse.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Airoha AN8855 Switch EFUSE Driver
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define AN8855_EFUSE_CELL		50
+
+#define AN8855_EFUSE_DATA0		0x1000a500
+#define   AN8855_EFUSE_R50O		GENMASK(30, 24)
+
+static int an8855_efuse_read(void *context, unsigned int offset,
+			     void *val, size_t bytes)
+{
+	struct regmap *regmap = context;
+
+	return regmap_bulk_read(regmap, AN8855_EFUSE_DATA0 + offset,
+				val, bytes / sizeof(u32));
+}
+
+static int an8855_efuse_probe(struct platform_device *pdev)
+{
+	struct nvmem_config an8855_nvmem_config = {
+		.name = "an8855-efuse",
+		.size = AN8855_EFUSE_CELL * sizeof(u32),
+		.stride = sizeof(u32),
+		.word_size = sizeof(u32),
+		.reg_read = an8855_efuse_read,
+	};
+	struct device *dev = &pdev->dev;
+	struct nvmem_device *nvmem;
+
+	/* Assign NVMEM priv to MFD regmap */
+	an8855_nvmem_config.priv = dev_get_regmap(dev->parent, "switch");
+	an8855_nvmem_config.dev = dev;
+	nvmem = devm_nvmem_register(dev, &an8855_nvmem_config);
+
+	return PTR_ERR_OR_ZERO(nvmem);
+}
+
+static const struct of_device_id an8855_efuse_of_match[] = {
+	{ .compatible = "airoha,an8855-efuse", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, an8855_efuse_of_match);
+
+static struct platform_driver an8855_efuse_driver = {
+	.probe = an8855_efuse_probe,
+	.driver = {
+		.name = "an8855-efuse",
+		.of_match_table = an8855_efuse_of_match,
+	},
+};
+module_platform_driver(an8855_efuse_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("Driver for AN8855 Switch EFUSE");
+MODULE_LICENSE("GPL");
-- 
2.48.1


