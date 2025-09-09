Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59FACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8ZxWh8QbSoPIVp/7cwB8nhVxGRfzfajbCEssA2+7fk=; b=E/NWnYBeIOpWG7ZFMX0BvhxS9m
	2hV107DaSqxlwKpM7482UeMp8Xcdw+L6SKhzfDvKrsRVi/q1IsilSPJSIY+gFSEcHUzjM1qlCvEze
	ZGGvLGru26cAgHIPRXm1x67qTZ6XEXkD96L1oObQv344iogjj2Hhj3pailkNhA/TmcZU+PVP9lglL
	+wDntLQi4SgweZ7PdxOtYhDIVrABT8J5ajyxK7MxwvwpxqoHArDkxSr9hN2u9jM3SCOJqNy2QMDLH
	og/uBRt0my0JcBUPFrajEj4UN2tlmSjtS09V8CoHNgEyBKfWo8I0g+6qyXkeme+gFP8MO+eC90x0Q
	+eQCTJRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsFU-00000004u6I-2vef;
	Tue, 09 Sep 2025 06:54:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmSq-00000003I2T-1M7L;
	Tue, 09 Sep 2025 00:44:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45cb5492350so32269035e9.1;
        Mon, 08 Sep 2025 17:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757378643; x=1757983443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8ZxWh8QbSoPIVp/7cwB8nhVxGRfzfajbCEssA2+7fk=;
        b=bO8Q9lZ7NuClCdSZ3/CcOJK8j6/htVYdO/dCfU0EVZfDBPfK5oQev3sy6pwifE3z9Z
         dkFh1Jm5GWC4w343qQoKGQ6MkGrUxjcug/h6qT0MGjBNS/OZFIABw1vTCULa8XcYM2tn
         QdZRzULZ1pgolU8mevNeLaz8GvDprTCyDL6b4swl/OQDn8ph0uy3WxieZe7n3JhsFSQ/
         DuVhDnh2GOBxeAHlRa26n0S4P9s4SyLRXoUSqQsKxdFaGWaIVFHdKyvsUq427o0eTDYw
         byaImcR+95mApBxn3tvU88T+wM7IFsLYpjTgkvb05L/zszOuDNZw+ir/BbYEWFQgeo1n
         Iy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757378643; x=1757983443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8ZxWh8QbSoPIVp/7cwB8nhVxGRfzfajbCEssA2+7fk=;
        b=aSjBwNsj21Xkfm8ZwslIeDfvQblrkDhVINaZK3qSnAt9+lrOy6J1rJ19b0CxblLS2l
         p+noTcEug3JtvukwodyVYzpkzlz2Ww48veDBlAc7lYardpPVW+Dtmg6oXzILYhGFzH6p
         su91aI/wcW9onu92X7IoU4TRcALuM167dcrCO4Ovj066oKmKOyytcTaqn8dXSCaH/G90
         qHF1P/3KdQlCduEKeIfyTKirbF7ReQEiVe46OwfVUNKyi68UU/MDtXyJR8P4Vw9L8pBM
         IsgpewyjAcZWeKdUk5+Xhal0tjGXK4HbmZ02hQFT5eKec1nHp2rFznRWnInkMNnT7v4B
         YjVw==
X-Forwarded-Encrypted: i=1; AJvYcCWqooOWuQA165bY4FIR7vUIs9WuiUqPrWF7Nu/rFJmt0u+lSAjUFCWY5AXjrJNYe58FOsYGlFyLDYLavQiJZk92@lists.infradead.org, AJvYcCXh6cCnLTqFCOhIWqyKR2DM89Bzd5RUVmAX1JkV/vY+dJruQtUh/1tojavzs0MhIFgX7lv+sg5kZxOaEqyRKSM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzojuGAsbgHN3O+SjaTvGTHsGQ5x2BIG6eCdJPEzdRArcxrDBso
	2LAUbb6suUQI/qLV3TEkXE6qirvQkkvvS6Ec82w3xDk77QxJAtokyk99
X-Gm-Gg: ASbGncv/JgeF4U7BLBkOfcHrtcgveoMJAQzVNl2SCCVIRibpS/K7nEpIIuiaq31QyUQ
	+LWUWqIp0EqXu3RDkvR8R31DkFCtAXPrbDBx/NgEgO3NPR2A9zSWhwBN+et9JG3aLmceyyLRftb
	AFDclR+CIswdk36PIVFGM3j4SZ6FriM4V+8fbjeWBV6reXvEb+z7BSvyiHk+BCKQq2HlcXG34oi
	qAHalMKym/w331RCh3+beDZw2HaDxbCE7oLO6E5VBTm7yXQcwaaZcmh/e+YzAwdNMl7ng8ODiGe
	4CBzQ7Em17YUDkyeK0YOlElka7g1zpItcoEXT3iW8AUdTVwGNSgeYbUTHJxHhC6UgjSTI7JruQ4
	u0itdDDbRxUdkIobLhXwmEpWf42Khm3JGXUFvSirpax0+//bR08olGyCagp5pjodkMX8UrAU=
X-Google-Smtp-Source: AGHT+IH2QZT//ViKYRYMV5MXicqqc5U2Nniw6K5/BIDkRECDDT9hG2C49l/NAs8DHGYP02QVVHvpTg==
X-Received: by 2002:a05:600c:3113:b0:45c:b5e0:2cf5 with SMTP id 5b1f17b1804b1-45dddee9c4cmr90116085e9.24.1757378642688;
        Mon, 08 Sep 2025 17:44:02 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45decf8759esm13526385e9.23.2025.09.08.17.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 17:44:02 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v16 05/10] nvmem: an8855: Add support for Airoha AN8855 Switch EFUSE
Date: Tue,  9 Sep 2025 02:43:36 +0200
Message-ID: <20250909004343.18790-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909004343.18790-1-ansuelsmth@gmail.com>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_174404_361240_B6AA8836 
X-CRM114-Status: GOOD (  21.89  )
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
 drivers/nvmem/Kconfig        | 11 ++++++
 drivers/nvmem/Makefile       |  2 ++
 drivers/nvmem/an8855-efuse.c | 68 ++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 drivers/nvmem/an8855-efuse.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index edd811444ce5..446818a875da 100644
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
index 2021d59688db..5c9e6e450181 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -10,6 +10,8 @@ nvmem_layouts-y			:= layouts.o
 obj-y				+= layouts/
 
 # Devices
+obj-$(CONFIG_NVMEM_AN8855_EFUSE)	+= nvmem-an8855-efuse.o
+nvmem-an8855-efuse-y 			:= an8855-efuse.o
 obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
 nvmem-apple-efuses-y 			:= apple-efuses.o
 obj-$(CONFIG_NVMEM_APPLE_SPMI)		+= apple_nvmem_spmi.o
diff --git a/drivers/nvmem/an8855-efuse.c b/drivers/nvmem/an8855-efuse.c
new file mode 100644
index 000000000000..d1afde6f623f
--- /dev/null
+++ b/drivers/nvmem/an8855-efuse.c
@@ -0,0 +1,68 @@
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
+	struct regmap *regmap;
+
+	/* Assign NVMEM priv to MFD regmap */
+	regmap = dev_get_regmap(dev->parent, NULL);
+	if (!regmap)
+		return -ENOENT;
+
+	an8855_nvmem_config.priv = regmap;
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
2.51.0


