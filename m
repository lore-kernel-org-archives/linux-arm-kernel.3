Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB07CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ys1+I3mTN4tFLUeTqimgmOWnqyRP0wdFQKXJW//HVk=; b=e8puh+kfc91Tq3L/yfK5xCeLNf
	ZvHt/iYpEk2ou7G520Ty73HZQWLGRgTbEpM+QSu0mEQPlFqtiGBfFNBfyGFcQJeCZF1njDbkp6YZb
	GpVGQnibWBVyQPiKlAVo5MdhA2mDHp/4P4JY64xMeVBLYEB3QX+BK/OOraQpw4RcOB2Fc8Y8QfFxe
	aD+bfjhJiCZDw/JhvZbfpQDCQhCZvEqrgsXKCaYAFZ61k8kjGIgLDMu5zHclpEXQ6ox1q9cmCfuwz
	4s8IGOlF/hamqGBiMEG6BTccQoFgOGNN3CLuDFZrN5eoEbu+/c4NrArjr3hLHjwdBZ0K8G2YRd2M2
	gRjHJMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28n-00000006Rdd-19jY;
	Tue, 23 Jun 2026 14:30:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28O-00000006RT0-1yrA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:29:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4924944fe6bso22493645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782224990; x=1782829790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ys1+I3mTN4tFLUeTqimgmOWnqyRP0wdFQKXJW//HVk=;
        b=HTjrpCm4F+bsBiaSSyJFb9mK3ftLu6MqKvStwx9eh5ndC/C6LLdQQY5U0/haWGfJBC
         GJVlEeBpKcJ3dwBKwhanzov+LoM7zd+Y7zo7lv7mAbnxKEyBQC+f64mG3s94pseyuSjz
         P2HIq2AxNX7HfbHONT3knklAVMx1/reftnk40bQHJ/PO9RDLYM/kU6YMcyTsY8D1NQMi
         dEnve3sjOJ09FaNfX4+gmPbHnHjWupvMT7SgFApOVC1TVoaAT1bU3FwVxjw3Hl3ImmVM
         qZHktbYkANuBVazJ+dAkVkjQzVJ1qXrh4E/jCDe7cH0ZpAVnVE7DfJdI3BIUZ+n6yF28
         MgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224990; x=1782829790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Ys1+I3mTN4tFLUeTqimgmOWnqyRP0wdFQKXJW//HVk=;
        b=TSz1F1N0+7akm1oQb4NA6vVBRG+9hdXpkC3/OJ5i2ODUUSb+rZQWfiU91bDyjEF+Xo
         tIQZo0hkP9oPmjZoq5IA2jImlIrzUPue1JkqohvbiBGPdECBzhy8DpX34JyE7jDBqh+/
         YAJPBJBroOWhGnL9ezVeAmpejDFZL1X56Rnbq7qT4w7UcObUxknlvcRk2UD4i4O3rnaJ
         VxDa85NtYcnSBqAAK24C6XEyv+ZpcxlZf16Fynzd1fvc4jBiiJeOERqYxeSExJwoHjt8
         GaSXeA6ZrAgZtSGUcYtgNqlRbakDZToUEUWoTBES0G8A3W5zAu8mvzZKqUcUVXpLBs/9
         83gw==
X-Forwarded-Encrypted: i=1; AFNElJ9caqS9MpRMQupvIQdss3rYRkdbXJIU1FI3LYMSbqBlLZh+oyagnTSC6SxlXkUI2ae5xUtEIPCJMluZMO1K0JC3@lists.infradead.org
X-Gm-Message-State: AOJu0YxTdAMCOjNgIa7Wil15EOV/5lvFY6HyaNBZL35yVccz5FMXG3lx
	Q2Aeiy6gGcJ9NUIPK+CVV9XwgoFAr791mA4g5N07AsNVNgoD44VoWBDklFWwiCYN+6w=
X-Gm-Gg: AfdE7clMLZfUBo4c9g5ghlw5x+eVFqytaosG7u8FmTx5T3FFBuqFf83CsvqmCcHLtVj
	BnGOmmi0TqG8JF8S6z+PAgH5lm4+jyIf25NwLs6XaDXu4VMKJnR9AKIVdPHScBFfkpMcpJgXOmQ
	YLTd4CTQ7Xp9hW89YgL5ckXaSvmg+H1OWwmef1v4ZrTq/spHP7Sr7XWUqRgVrog3mLRmTS/Z4Jh
	QbnIv1Aaqbssp2KRfHH7J+T0lqrDVfxpeGUnEH7HwNAy6EtVdO9T/1I2yKkQAOKo3zva73aPRLH
	x7tNH0h0WtUNVqWhW34vWR7UJzJcRNJmG7as290zdOASbbaJ3qmdCTZAWiwq9mDVIHBkNeu8tzs
	dWyPKqrGbdAIQSsNWRrpGLiFl81ekF/xOOmEAdgEUnD8WbqANat7gwe5re8RF7EgJV+1E9/ZC4P
	tkmyelHdEOtpvtZYE9sGngMp3jY+QwMWP4Kkn2luu4K02QBbmDRZjvq/j6nrfInTPyhVV1us9Ta
	bkhwjDiAnqicSKo3lkPurlcUnpi
X-Received: by 2002:a05:600c:1d1e:b0:492:4ca9:a46d with SMTP id 5b1f17b1804b1-4924ca9a4e8mr215051385e9.5.1782224990389;
        Tue, 23 Jun 2026 07:29:50 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm362507805e9.2.2026.06.23.07.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:29:49 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 4/7] serial: 8250_aspeed_vuart: add VUART over PCI
Date: Tue, 23 Jun 2026 14:25:42 +0000
Message-ID: <c3e1136d3565216c254db138e29299c2a3c6499f.1782224059.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_072952_553736_BA77F523 
X-CRM114-Status: GOOD (  24.38  )
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

This patch enables the VUART over PCI possible for the AST2600. This is
only activated if the 'aspeed,vuart-over-pci' property flag is set on an
'ast2600-vuart' compatible node.

The AST2600 has 2 VUART that are usable over PCI. These are the VUART3
and VUART4 in the 'apseed-g6.dtsi'.

This code sets the BMC PCI device enables
bits, sets the PCI class code to MFD device and configures MSI interrupts.

There is no disable function. Removing this driver should not disable
the BMC PCI device, as other drivers could use it.
However, if all the drivers using it are removed, the
BMC PCI device will still be activated, which is not ideal. Realistically though, this is not a
use case for a BMC, the drivers will never be removed.

This is useful on PCIe BMC expansion cards that use the AST2600, such as the
ASUS Kommando IPMI Expansion Card.

Registers initialisation taken from ASPEED 6.18 Kernel SDK.
Return code checks were added to each register write.
The code has been simplified and macros have been added.

The ASPEED_SCUC24 regmap update is missing a macro for 'BIT(14)'. I was
unable to  determine the purpose of this bit. In the AST2600 A3
datasheet it is marked as 'reserved'. It is only used on the other
revision. As I only have the AST2600A3, I was unable to try this code
path.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
Tested-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 86 +++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 6afa2f4057e1..e204e26fa173 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -32,6 +32,27 @@
 #define ASPEED_VUART_DEFAULT_SIRQ	4
 #define ASPEED_VUART_DEFAULT_SIRQ_POLARITY	IRQ_TYPE_LEVEL_LOW
 
+#define ASPEED_SCU_SILICON_REVISION_ID			0x04
+#define AST2600A3_REVISION_ID				0x05030303
+
+#define ASPEED_SCUC24			0xC24
+#define  ASPEED_SCUC24_MSI_ROUTING_MASK			GENMASK(11, 10)
+#define  ASPEED_SCUC24_MSI_ROUTING_PCIe2LPC_PCIDEV1		(0x2 << 10)
+#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN		BIT(18)
+#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN			BIT(17)
+
+
+#define ASPEED_SCU_PCIE_CONF_CTRL	0xC20
+#define  SCU_PCIE_CONF_BMC_DEV_EN					BIT(8)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_MMIO				BIT(9)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_MSI				BIT(11)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_IRQ				BIT(13)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_PCIE_BUS_MASTER	BIT(14)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_E2L				BIT(15)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE		BIT(21)
+
+#define ASPEED_SCU_BMC_DEV_CLASS	0xC68
+
 struct aspeed_vuart {
 	struct device		*dev;
 	int			line;
@@ -412,6 +433,62 @@ static int aspeed_vuart_map_irq_polarity(u32 dt)
 	}
 }
 
+static int aspeed_ast2600_vuart_over_pci_set_enabled(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	u32 silicon_revision_id;
+	struct regmap *scu;
+	int rc;
+
+	u32 pcie_config_ctl = SCU_PCIE_CONF_BMC_DEV_EN_IRQ |
+						SCU_PCIE_CONF_BMC_DEV_EN_MMIO |
+						SCU_PCIE_CONF_BMC_DEV_EN_MSI |
+						SCU_PCIE_CONF_BMC_DEV_EN_PCIE_BUS_MASTER |
+						SCU_PCIE_CONF_BMC_DEV_EN_E2L |
+						SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE |
+						SCU_PCIE_CONF_BMC_DEV_EN;
+
+	scu = syscon_regmap_lookup_by_phandle(dev->of_node, "clocks");
+	if (IS_ERR(scu)) {
+		dev_err(&pdev->dev, "failed to find SCU regmap\n");
+		return PTR_ERR(scu);
+	}
+
+	/* update class code to be an MFD device */
+	if (regmap_write(scu, ASPEED_SCU_BMC_DEV_CLASS, 0xff000000)) {
+		dev_err(dev, "could not set PCI class code\n");
+		return -EIO;
+	}
+
+	if (regmap_update_bits(scu, ASPEED_SCU_PCIE_CONF_CTRL,
+			   pcie_config_ctl, pcie_config_ctl)) {
+		dev_err(dev, "could not set PCIe configuration\n");
+		return -EIO;
+	}
+
+	if (regmap_read(scu, ASPEED_SCU_SILICON_REVISION_ID, &silicon_revision_id)) {
+		dev_err(dev, "could not read silicon revision\n");
+		return -EIO;
+	}
+
+	if (silicon_revision_id == AST2600A3_REVISION_ID)
+		rc = regmap_update_bits(scu, ASPEED_SCUC24,
+				   ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN | ASPEED_SCUC24_MSI_ROUTING_MASK,
+				   ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN | ASPEED_SCUC24_MSI_ROUTING_PCIe2LPC_PCIDEV1);
+	else
+		rc = regmap_update_bits(scu, ASPEED_SCUC24,
+					/* The bit 14 is reserved in the Datasheet, so we can't say what it does. This revision has not been tested */
+				   ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN | BIT(14) | ASPEED_SCUC24_MSI_ROUTING_MASK,
+				   ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN | BIT(14) | ASPEED_SCUC24_MSI_ROUTING_PCIe2LPC_PCIDEV1);
+	if (rc) {
+		dev_err(dev, "could not set PCI device 1 MSI interrupt routing\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+
 static int aspeed_vuart_probe(struct platform_device *pdev)
 {
 	struct of_phandle_args sirq_polarity_sense_args;
@@ -540,6 +617,15 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	aspeed_vuart_set_host_tx_discard(vuart, true);
 	platform_set_drvdata(pdev, vuart);
 
+	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-vuart") &&
+		of_property_read_bool(dev->of_node, "aspeed,vuart-over-pci")) {
+		rc = aspeed_ast2600_vuart_over_pci_set_enabled(pdev);
+		if (rc) {
+			dev_err(dev, "could not enable VUART over PCI\n");
+			return rc;
+		}
+	}
+
 	return 0;
 
 err_sysfs_remove:
-- 
2.54.0


