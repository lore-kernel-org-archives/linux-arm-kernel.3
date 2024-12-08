Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A98DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 00:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5jmD11PWNeZDLqwGfXpBO8z0RHdtHLmNHFwpPU8zIg=; b=lBa+/zPtwuILRiHie2Afg2WUlr
	u9pOmQjjOJZkmcoA3LSrL2IEpBhW4glaiB30xWbxrMOY4bTVU+Bt3BUSAVM+jwO8B5ozBJdeeMTAx
	Z8YFLhcoXSLye4m5XxNcUm2jrL+qFN0o1ZbgsmiDdv6my5cKXHJygU1qdhT+jsIs6B1Da18FhC7R2
	w9/8xb8mvc0aJX7S6311n4Tjd9k3L1oIG7SPTLNVVXtDtU8t31KkAp+ZG7y9fx+5Hig/aK251o1+O
	LScu3RdbqOIwTpRdKvEMoJnRn33BtmrdkwylIn3y5Uvjyoq7Uq7PIiYV7/BFOQC+Nt904+oD6MWEh
	A/DIdNVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK5BT-00000004cYT-3B4v;
	Sun, 08 Dec 2024 00:30:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK53f-00000004bDe-3Uix;
	Sun, 08 Dec 2024 00:22:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434a1639637so34420815e9.1;
        Sat, 07 Dec 2024 16:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733617318; x=1734222118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5jmD11PWNeZDLqwGfXpBO8z0RHdtHLmNHFwpPU8zIg=;
        b=ANrx5iUlJU6k8o2+pe6dC2pBfXAIqiLXhc1mxCtNB7lw2CqEVAVedYF1A7skxPeIzp
         nU4xHScRPCGz7lAWavavbmAt9VVsXBVf6pqiNwei/ORyGmsMEZThzW8EIufk4BcQQu+4
         XYSmd4fAHJcbwB1btYmtifctTuFrdY8q+AVKid7hfD09EuZ+BmUb3H9oAiqP3bXUMD5N
         MzEhg2dk7Y7nGSyqQPx0kKW1WVGysrBs1D0SgEwlIg7jgtXi7ffieOFZHsgv4P9sC3ZC
         Y1kPQ/a/tnnSv93siofsTc/h5pIhwM9zGgZeoh9P5I6hQBMF3T7YXE9yL+ONK715ZzvQ
         nuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733617318; x=1734222118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5jmD11PWNeZDLqwGfXpBO8z0RHdtHLmNHFwpPU8zIg=;
        b=bwk+3vWiLgZ974PWnxfw1DDlIBdQmJVielHDo7udDWmPdYKItL25fJeT+MjYQN46NR
         aBZs+Hh3X2dehcUDT6sfNJz0whogUfrk6PG7K21cFX1v0127ajvzN/AYv5tHVWNOj9oO
         PRlQeo9krA5Ujt1Vy6g0+flaVf40NPFIf0MK5l2Z9QEqVW2ckZVWhCpSc6nPLrVctk9t
         10mCxqYWjq6WCZAOnEFQOyOLZE0UyCRL+qqkdFXykV2cygxeItA2z9RkFcFK1xg5ERgz
         DYTjknX/CYgvFG9LyRJjqmMpcKdB6MujiYnWzbHJsu20XbwFhM54yWUuYAFJrAWh++VP
         n0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Jy/pzTc5P73IC1x4EFXICn2ZZLD+eNfSu0bWJtl5a8dgRTK2mEhYtwSW06+uBkgfegDbDMyVYyEpM0nkr8Q=@lists.infradead.org, AJvYcCWi0XrcAu4HIdz6+OJQ9WFOW0m1CwmHsBdsGFiCGMykKVsVjX5rTBlGY4+P4OvZncavIveIFZIEZMQnlfgeBAre@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5PcrbQEbj7XUiYdX/IE5W1mf1yJGlNkzNcG+Nma5StEp9rk94
	8KteS9RaahghrT5EwzllYk8xgwNXWHsStS4FWuqmHRx58phDq2U91awZQw==
X-Gm-Gg: ASbGncsIk32EuexKu48wi9Btr3PWZtd3CgbKCgUw1C6ISQwF6guqhOJOXEhj1qwtRK6
	zmD2AvZddpxlTqHfK4Hrk0XGVge/rEZtKZm22sSx4H7uypXRhhwddDa4vtuNvhh3/bTsBWN2y+9
	FfZXVzv3UT0rtfR2TIPuuBCslpVsz8hDuA2wmdtiS4pqLPoD4W9SADuaxeLm6ePAq1qiNs1l2kc
	w54VLWyClczM/OMrC7WGAerDO1cwpVoR4tPqVkfjCx6ym8OhlsFAqCR1jq+/DFtaYm7EHTSW98g
	o+It+TsnAhit7JjvPH8=
X-Google-Smtp-Source: AGHT+IGlPxkhjBZU1P+ViteFWg8IjOymFmWAF0Cioi7pkGseebSWl4/7ZlAniruzdMwAXUnW8MNN4A==
X-Received: by 2002:a05:600c:310c:b0:434:a962:2aa0 with SMTP id 5b1f17b1804b1-434ddedbb7fmr58050725e9.32.1733617318340;
        Sat, 07 Dec 2024 16:21:58 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38621909644sm8719170f8f.76.2024.12.07.16.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 16:21:57 -0800 (PST)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v10 7/9] nvmem: an8855: Add support for Airoha AN8855 Switch EFUSE
Date: Sun,  8 Dec 2024 01:20:42 +0100
Message-ID: <20241208002105.18074-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241208002105.18074-1-ansuelsmth@gmail.com>
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_162159_874424_AB070282 
X-CRM114-Status: GOOD (  21.01  )
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
index 38c7b2362c92..a67d147276a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -723,6 +723,7 @@ F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 F:	drivers/mfd/airoha-an8855.c
 F:	drivers/net/mdio/mdio-an8855.c
+F:	drivers/nvmem/an8855-efuse.c
 
 AIROHA ETHERNET DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b9..599014970c22 100644
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
+	  be called nvmem-apple-efuse.
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
index 000000000000..cdb7654bf694
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
+	an8855_nvmem_config.priv = dev_get_regmap(dev->parent, NULL);
+	an8855_nvmem_config.dev = dev;
+	nvmem = devm_nvmem_register(dev, &an8855_nvmem_config);
+
+	return PTR_ERR_OR_ZERO(nvmem);
+}
+
+static const struct of_device_id an8855_efuse_of_match[] = {
+	{ .compatible = "airoha,an8855-efuse", },
+	{/* sentinel */},
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
2.45.2


