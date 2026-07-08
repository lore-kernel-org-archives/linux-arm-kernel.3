Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B050C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZx0CqGWbyzDUzo0/NyEFqDoVb8LDJ7NHysAd8cbbL8=; b=OabJ6Ta+mksFM2RzBrtzeQLDNx
	G5qRucZJ67tdQO+vP+lk4/EJmOvY6GlQsiJmg0bX0207/1kBfXZiY6LozC1UhjVH6br5HYkOPwDuQ
	EI8i72ZaIYnKqxmEwD0DlR/daaIKRSuWhBi/OqoYBjOAwJdxKp4Sle0vVbseHDqD//jUR3bMwuYqX
	ktB23EaKDDvajacmpiCctrUmMwEpNKHG2IDM9yefp3M4sxxpbtJwN88dSSI3SK/Vdnfex5asuHWam
	CfainLT/8wCcQ56oz8LXDbbfBLHTmednPCBG66RS/AJDYAfGCV5XB1W7peDv586iEVyz16Mm7HeF7
	X6Uj6/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUMF-0000000HUx5-2Ldb;
	Wed, 08 Jul 2026 15:38:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUMC-0000000HUsy-1wgT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:38:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so585866f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 08:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1783525118; x=1784129918; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uZx0CqGWbyzDUzo0/NyEFqDoVb8LDJ7NHysAd8cbbL8=;
        b=bXriEt9CLOPNkSMb2MJX19mdT7BeFz917/jVRkwVsrnbKNIRE/FZLQT11XSxAQ4pvK
         BJsZpLM+G4lrjKUmlCs71h5H05PAAD7IP7wimd+di1UhGDKt1DKHBOpO5E6lVFimRr5C
         qKA7CexMbhc0+xcfUWOpCe+meRmbRS/PKS+TfhpE4ZVEfTYkFL7qeu5qieC0MvfSu663
         VsbFJ2aErjBun3m8X9VY5olEBhQ2CBMgyN7aspvNl8f4i6HxMN/tfPZ3LmShlof2fnTT
         bdRahwCYlPaY6IfH4gRgYrcerY4hkjxD7Pm10zfJAELz1eTPV85ZEoIVKzWf3LEZh7zd
         h6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525118; x=1784129918;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZx0CqGWbyzDUzo0/NyEFqDoVb8LDJ7NHysAd8cbbL8=;
        b=IQm8XPFYdChe7OpHz2RD1TpkNqngx1lOLX4YqRbHv6x3EGT/wDbDY1y5iGXA1d3mTU
         jIF5jKFFl+QfQNJNjlmvjRyLOPnIi2I55XbobFl3NXuAcLSk2ruaoQu6WYuzfg0yWfdZ
         kJ74JU1JO9RqS/kim+cQf+Dzi51npieVqdebj89xFiBS7+ms66gpfBVO82m/Fef+YBXR
         FLBZQ+EVRDtrVGv6TLFiAL6SxQzjv9vbJZtgOFRRbrZFGb7SFM6mVD3CxUeG1K3rF83c
         5UxTveXyYoKqlyWWymhliPQ6zk93DX6wbQKZKUDWQBnJk69CgdO2SKjwuZVIT1FK5b3n
         ew1A==
X-Forwarded-Encrypted: i=1; AHgh+RpBfZMGJBup7sJnKInn8AOjXRKJZUpZN8fkYZB/t0FWJkbW5SXhDb/eKbOX339zINi+bS7uErWJDF7epWTYBLBR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx12HW/pYjrwGhCKljH39OQszmkZKW2UtuOM2ZToC7c6ZoXBNFH
	3bV/IUONUR31Ppg6U8vV4XXt0u+QNAmP8IqexdEAryjHTLhAseSjT2d2YQNy77v+6cY=
X-Gm-Gg: AfdE7cmTDYYN3KeJL/hUXk+3CZdrcL2s6yTZDBKAHutdu1lrqfG8QllcKiedxEesRy9
	9CW+d5aFFbH/CxGM+E8DF510WyPn6W3aZiwCEWDM7o649bZHRGA2TiN/R2z4ZF+G6dJQFkeneMV
	UfFOymlq8PCl5gNmod8NxdLN39PNF0nCxr6Tq2d2cuquOPlE1xyMYkEwuRw6ZIoBpM5LKzh6H6n
	e0K2gaqUHsrE6h4BmXe553owcaFqGchLV2on+LN2MdmlnBFB3UnZ5+BkFJ8C3p3MkjaTchl7wh4
	3AgYFpitHDx7RJpYh+R6gooI5kfsLyjJUx/2s4sN8zlrroqidWvsUOo3hiQAYejIksQDp5V+0bh
	++tHYnfKiA6hpacEGcYRz+o9wqnnP6W4ImV80NWzeJ4/h2pJkeQLfDKncp172xcFKTDERHrrDLY
	uqNt/7s/l50OPRXljN6CGJZbE0b4pOlQmUedEhrp5yXBZxd7zTF9e4Y0TPQEAUIbjMD94VAbSWf
	yFeGU5cPeL9QE16f408C+hOC93C0wHHIY33KG0=
X-Received: by 2002:a5d:5846:0:b0:472:edc7:b4c9 with SMTP id ffacd0b85a97d-47df07896demr3174799f8f.38.1783525118187;
        Wed, 08 Jul 2026 08:38:38 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm44254136f8f.15.2026.07.08.08.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:38:37 -0700 (PDT)
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
Subject: [PATCH v4 4/7] serial: 8250_aspeed_vuart: add VUART over PCI
Date: Wed,  8 Jul 2026 15:35:56 +0000
Message-ID: <28c6e7c493559feffc7e6231b0a2f0b73b7fda41.1783524645.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_083840_550753_6FD80F9D 
X-CRM114-Status: GOOD (  26.16  )
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

Enable the VUART over PCI for the AST2600. Activate it only if the
'aspeed,vuart-over-pci' property flag is set on an
'ast2600-vuart' compatible node.

The AST2600 has 2 VUART that are usable over PCI. These are already defined as
the VUART3 and VUART4 in the 'aspeed-g6.dtsi'.

Sets the BMC PCI device enable bits, sets the PCI class code to
unassgined/device specific, and configures MSI interrupts.

There is no disable function. Removing this driver should not disable
the BMC PCI device, as other drivers could use it.
However, if all the drivers using it are removed, the
BMC PCI device will still be activated, which is not ideal. But in reality,
this is not a use case for a BMC, the drivers will never be removed.

This is useful on PCIe BMC expansion cards that use the AST2600, such as the
ASUS Kommando IPMI Expansion Card.

Register initialisation taken from ASPEED 6.18 Kernel SDK.
Add return code checks to each register write.
Simplify the code and add macros.

The ASPEED_SCUC24 regmap update is missing a macro for 'BIT(14)'. I was
unable to determine the purpose of this bit. In the AST2600 A3
datasheet it is marked as 'reserved'. It is only used on the other
revision. As I only have the AST2600A3, I was unable to try this code
path. This BIT14 was set in the ASPEED SDK so I kept it.
I can remove it and the untested path if necessary.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 86 +++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 6afa2f4057e1..4d09c04cb972 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -32,6 +32,26 @@
 #define ASPEED_VUART_DEFAULT_SIRQ	4
 #define ASPEED_VUART_DEFAULT_SIRQ_POLARITY	IRQ_TYPE_LEVEL_LOW
 
+#define ASPEED_SCU_SILICON_REVISION_ID			0x04
+#define AST2600A3_REVISION_ID				0x05030303
+
+#define ASPEED_SCUC24			0xC24
+#define  ASPEED_SCUC24_MSI_ROUTING_MASK			GENMASK(11, 10)
+#define  ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1		(0x2 << 10)
+#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN		BIT(18)
+#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN			BIT(17)
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
@@ -412,6 +432,63 @@ static int aspeed_vuart_map_irq_polarity(u32 dt)
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
+				SCU_PCIE_CONF_BMC_DEV_EN_MMIO |
+				SCU_PCIE_CONF_BMC_DEV_EN_MSI |
+				SCU_PCIE_CONF_BMC_DEV_EN_PCIE_BUS_MASTER |
+				SCU_PCIE_CONF_BMC_DEV_EN_E2L |
+				SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE |
+				SCU_PCIE_CONF_BMC_DEV_EN;
+
+	scu = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
+	if (IS_ERR(scu)) {
+		dev_err(&pdev->dev, "failed to find SCU regmap\n");
+		return PTR_ERR(scu);
+	}
+
+	/* update class code to be an Unassigned/device specific class device */
+	if (regmap_write(scu, ASPEED_SCU_BMC_DEV_CLASS, 0xff000000)) {
+		dev_err(dev, "could not set PCI class code\n");
+		return -EIO;
+	}
+
+	if (regmap_update_bits(scu, ASPEED_SCU_PCIE_CONF_CTRL,
+			       pcie_config_ctl, pcie_config_ctl)) {
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
+					ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN | ASPEED_SCUC24_MSI_ROUTING_MASK,
+					ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN | ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1);
+	else
+		rc = regmap_update_bits(scu, ASPEED_SCUC24,
+					/**
+					 * The bit 14 is reserved in the Datasheet.
+					 */
+					ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN | BIT(14) | ASPEED_SCUC24_MSI_ROUTING_MASK,
+					ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN | BIT(14) | ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1);
+	if (rc) {
+		dev_err(dev, "could not set PCI device 1 MSI interrupt routing\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int aspeed_vuart_probe(struct platform_device *pdev)
 {
 	struct of_phandle_args sirq_polarity_sense_args;
@@ -540,6 +617,15 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	aspeed_vuart_set_host_tx_discard(vuart, true);
 	platform_set_drvdata(pdev, vuart);
 
+	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-vuart") &&
+	    of_property_read_bool(dev->of_node, "aspeed,vuart-over-pci")) {
+		rc = aspeed_ast2600_vuart_over_pci_set_enabled(pdev);
+		if (rc < 0) {
+			dev_err_probe(dev, rc, "could not enable VUART over PCI\n");
+			goto err_sysfs_remove;
+		}
+	}
+
 	return 0;
 
 err_sysfs_remove:
-- 
2.54.0


