Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C5CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAoRbpj/I9KHjqRNCxcAOoeExD7CWt0cTY6Bc2WE4B4=; b=XxscawQFrfpDN9QsgS09gPweoF
	FqvMcZpYMdrg/wAAWuiR/Es178ZSsNxZdG0F6gCCCpO/LcevWbly58jwFXvsy2gj8gBkDvf6Be2K1
	XWx47ZEoiG2lu6EKopSzbzeE10v8a5FrwR2LwZ66wc6HQbcvRbSmV6kMKq1DJKnmHZSc89QrhMrUW
	feNcbV85NgehVXouCJAj7902mTxaUchQsWqrCI79nCGnUN+GNWP1bAFL2uYTW/pW1oBP+JAlSg6F6
	mLtXT0+25AKF//aVimapUom6r7ECBNmPdman3KfLUQv9Y3lkrBkHvxGK+bdG6gf5dR0pJrkaFIwq1
	uO0MeUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeDB-00000008690-0JRd;
	Mon, 09 Dec 2024 13:54:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKe59-000000083aJ-2b3p;
	Mon, 09 Dec 2024 13:45:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434f74e59c7so11438845e9.3;
        Mon, 09 Dec 2024 05:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733751950; x=1734356750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAoRbpj/I9KHjqRNCxcAOoeExD7CWt0cTY6Bc2WE4B4=;
        b=Vgjfm4Kqm9rgNMZ9mivg6R/rtc2f9/ImybCU8f7N6QS1lKetj1Kf2bT1/qjBAq02EL
         /U69le1cr5M/G8IJslj1Z6ibc9sgG7TVSiE/XiVzOJr0z3ThB1r7ztdpu4JMxSdWCwQn
         Fp5RktOzqJMsm7/NCbIA5L7VnOGZmWW/dSxTNBqP5d7kpMQhs/uUAR2MMBCjAZZ2CM0Z
         Lhb4Yv7keU+wQ1YNA9Jb7gSE+ZJPfdLpS3b1IMTVnfNgeBiGVnb/dFX1PLFCnIeCpO+A
         S3HUcydzHZXMMHC2jzfxI/nndjF5bhPaSj2p6/L38diZU3SGOlkaWpN4zkccu1mmdvmT
         Nk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751950; x=1734356750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAoRbpj/I9KHjqRNCxcAOoeExD7CWt0cTY6Bc2WE4B4=;
        b=RhVaUmIo1XvoY465A0d3og7/L83m/rmL5b3MqVuj+oSRJWBKATWLkBt+eiwp/S5xsz
         edmhOSIKyC+FM7vIeWjM2Dj5yaKCTc/lSwITtmQRYJoKKEno0ji+hQ1Bhmv7HFqd/P9L
         3v6cdSgK7D6WpvzHW8HX2zmNBYa4dvZKuwDAsSMr7TP7WDmrIn4pyQfDoAp0oNiP/0y0
         RW27VNcm4tXy5dsMcXY9xKD2UDZhk6ife0luKvmt0eVAmi6HSJsUP6k/6s1XMqqGHHNS
         QP7pJqfDhiFBRoMiT5kuu0la/d3pUV1MAhb1Ax1fFuLtBty2Rtg+tJjX7Z873lJj3eMR
         qOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/dFmoLTFyl6zzdlIF/hsWBdhDiJuLnXE5gkidIeU2sT1trkwFVbugTGNeFqzp3MSKeq/SgYDd2zh37yw90yo=@lists.infradead.org, AJvYcCVoMpRKnqKFuTcuP/GI049l6iuoboLn8O6NOgkCfb91sBqNvu9B5M/zHp8U8jY4qJq4qgBBI1kzCJIx3KVP3Ce0@lists.infradead.org
X-Gm-Message-State: AOJu0YzYrWCxuGEQrdQQPHM2esm1RK/1bJztfbuoLhO6EmaANLMHqvyh
	O+RipOX3QT1DBCwPQxz0G4GmW0h6o3JpVPAJnqfNwLdhpYSeVm5j
X-Gm-Gg: ASbGncsGiBHJpxE5gZRY9RfARuPT9htqPY6tI9n5fOCiADmXAfcyq15q9Keq4tQzQCd
	m8mRW9xDRJukYhIPTYTf/ZsNGqQlbWjiRVTgIe08JjRkemYfLzooof8SbTZ+KLOBmQR+95Njmo9
	9EFSndNtX0Ex6fMeqkEKvqGGqBOSmH5u7wUAtEISsDn0lIHqUPk9DzKXNPuSu8HyBnL9qRxTCgT
	kaOOjfU56dXNwPAotBnBrN8e5nBciD6Z7jZnThv8+9hT8GpSW63hSbpRPTkF97nZ+O67Cng/oxt
	teizPPhZq3cZdoJXMY8=
X-Google-Smtp-Source: AGHT+IFnJqIAyRA3SpMKzCKWGti35qLZlCEBlzZyV4S0XM++5A+ijfnInJHHTpme99QqdYPh2M13xQ==
X-Received: by 2002:a05:600c:3b99:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-434fff41467mr5994205e9.11.1733751949475;
        Mon, 09 Dec 2024 05:45:49 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434f30bceadsm62705135e9.41.2024.12.09.05.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:45:49 -0800 (PST)
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
Subject: [net-next PATCH v11 7/9] nvmem: an8855: Add support for Airoha AN8855 Switch EFUSE
Date: Mon,  9 Dec 2024 14:44:24 +0100
Message-ID: <20241209134459.27110-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209134459.27110-1-ansuelsmth@gmail.com>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_054551_656890_926D3321 
X-CRM114-Status: GOOD (  21.95  )
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
index 000000000000..7940453d6e58
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
2.45.2


