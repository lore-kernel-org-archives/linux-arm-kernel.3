Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95ADC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIOMFqyNUBF162fetCo3wyfrnMMJk+JlU3hf3FfA/ng=; b=qr+qMIgygf/D7wQYlqnx+TOsf+
	dfHMyapsTvA8gW4VubMYejZloYIy+KuYkd3ISf9aKcYdhIy5uw/DqhJOEXeNla1qnAhaawhVxqF4p
	eNa/ROOjwm7UYB2WDpDmVFLE8PPp8dRcw7NZXInkqCOuMy3PGjV3fKU4hXbhKxHTcZ3jysf96wAR/
	DQ/7oN6/d8OgNPFtbLL+HHy7/9e9yR87mJqmvA6a9KpuVCtovczSqZwdHK34kc0xc5GgUHsp/F6Nl
	Zj7g/hsjoDy8ax5husS3IVmBP4zpJgb9AH0dT56Ru8isMdoWf8hrFgC6NN297QNoQiS+/Z6zH7TSX
	KHVpG8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUw3v-0000000D3v8-1kFV;
	Thu, 26 Jun 2025 23:31:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUu4i-0000000Cp9l-055N;
	Thu, 26 Jun 2025 21:24:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso5406675e9.0;
        Thu, 26 Jun 2025 14:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750973042; x=1751577842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIOMFqyNUBF162fetCo3wyfrnMMJk+JlU3hf3FfA/ng=;
        b=nFCCw2PGmfrCLS3+wRCvPtNl25Afi3ULj5NjEuJxTHxkapuYnKz/4g+SYL1DKglasf
         vWSHWlESuENf+zm+p6hx+8igfMQ1N1Zel6gLw/F6QANVeW/OX08nCQJXf1fgesmwT1Vk
         EimJa/Hu2BWN3fExLLtCfbDMughWjDFC7M+lduy22lIXc3PKpoePmgU06tEQWgJJhIND
         IycF536/5kBfWKg2s6RRcMvhYFP2Ipm8eYtLmAEAavwRd2D3vZDzQfWSUjY07dZOfXjM
         0vyB8F3UpJb1an3WkKsOuTDT2VroHFen5K53K+c9VbURmtMSetzYstA/1TDCbWUcoZXu
         f2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750973042; x=1751577842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIOMFqyNUBF162fetCo3wyfrnMMJk+JlU3hf3FfA/ng=;
        b=PROXxj9/3CLO7xO1HZW1nbeAnH9yddKQWW6cMq7gf+Oxv4re+oBAhNVM4B+iPvRugM
         NXtX1wu+d2V1FzrCui3T+jyaQTMt1sCDyuTP2Og4ZIoEZgbkV1KpP9CG8/LwlWdgwb6E
         RcpIAEr/u2rEPr7wXS+euS9RJXTjtdEA3dlhw22ZNEBftnUbtWBxp/Es2H3ZUyUittlP
         RFHjgQS9x1rMXnDgwsc2PMf8daoqYw/j9PVdVp+onBOZJRZJVja/rSRGwrO/HYa9Sc13
         /Bgn+oTF+SS1wmKEPkbXxVJEBXPuetfutEMC/TNu/7Hzi9A6ipb2ceWhuwfDam0j0T10
         clnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7qp5r/4/o6MyoIv3bB01XAXmeZg9MnK18SoSmjmOpabzFuzezBe1B8fvAAiOflFn/lyNuejskgbDjmMCuXA0=@lists.infradead.org, AJvYcCV9DCsTj3MU0n53jIde9dGGcuGz9lW5cn5oaTn0BFjcqmIklCHu9k7AahK1J3cLDwbx3gRs2GbsabCWbCVNxkcD@lists.infradead.org
X-Gm-Message-State: AOJu0YwT9hCOPcvfiIzuqzPniNPzBrXgi9kV5dLY84QlDhAjvPJqBnk9
	UaGa5ZeWnT8gHeIhNWLU+eJnpLlbvyAA+hzMreP7lSvJr1f+naN7WbnY
X-Gm-Gg: ASbGncv2447i6oEV65EvOSblZxdmbrqQ0Mi4kbdQNtzIBzz66wAuhfWEuWDCCgwoe7S
	H+hDJpNjqMx3/hh0VKN1aLPe3K/Ps5RIJKWqTQX06kMVDdpPcA/yVFtLhWJndQL1CqWQdUuV5NE
	PFDPan9PSZtpCdU1/CnYWyiHSHg5cDldJVoqoob2NKd2F0HhxuUlScnVdO+BJgaATHeiFJQOaBd
	Q9xlOgrIcG6P0z0ij+fIlZIfmj225Dzo+C0K2ySyrVRMSFp+xolVINzA7/n2VmwfYo7h21Q6gxA
	AUmo7CdMYwwRItJoR8J4NigFZArE1y6f7mz1sgUXU7fj4VduJkWot18Ct/4lEJDJNGdgMglhLRU
	hXYSLb3N+rc8IfA3IsMfAHXFZpmFjgiY=
X-Google-Smtp-Source: AGHT+IGYoTCE2ejOG9HTcWhAHwI4ndhvI/OD/F9Oaq0DjE5kPHJxe/T8XEsB2iQptOTFDVbPGZnj9Q==
X-Received: by 2002:a05:600c:828f:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-4538fdfbd9amr488595e9.0.1750973042423;
        Thu, 26 Jun 2025 14:24:02 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453835798acsm57186475e9.10.2025.06.26.14.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:24:02 -0700 (PDT)
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
Subject: [net-next PATCH v15 07/12] nvmem: an8855: Add support for Airoha AN8855 Switch EFUSE
Date: Thu, 26 Jun 2025 23:23:06 +0200
Message-ID: <20250626212321.28114-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250626212321.28114-1-ansuelsmth@gmail.com>
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_142404_059784_5826C56A 
X-CRM114-Status: GOOD (  21.77  )
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
index d370b2ad11e7..8fb1a0efd431 100644
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
2.48.1


