Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCD7C5DF84
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjRJ6CK8+10XxSw1IIq1k9Y5+IsaxjCnKt7BPw+fxxg=; b=nDj2s8DUoW+1RvpNGJo7cEe+79
	knxrxhNU8ZKhKUxY1qkYE278HGSr4466ea5OYss295QBmWebF/8U7QEEVfhpI7RoE+SOqIaX4y0L6
	S+pIKgkrNZtRKcCU7z6HA++8zgSt4BAFZGFvDlnCYSFUJ5UkpRgMNij7PB38PXolwvjOOiRZZ/Sik
	d8X+VpBLDl0uykLN2sGmNhCHXV6OJOQMtlBc6mrJTevSkx9TzPegs+7PquFtZXxKvRSxjkCpXrSIZ
	WdarX6Qxul5JP480UXNINwLd+Fczc+4rvBLbGzrH3jKjpJiOAY4Ujur1Vv5KkkSe6Kb1jfuUdMO7N
	o5tUMXRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6r-00000007io3-2cAB;
	Tue, 18 Aug 2026 10:31:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6j-00000007ihy-0rlw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:31:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4956869750eso29951395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049107; x=1787653907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjRJ6CK8+10XxSw1IIq1k9Y5+IsaxjCnKt7BPw+fxxg=;
        b=EAgbcIzKR+e6gM8iy6i1nzhTVkH5WUhMrUVbuYgze1CtkQtQORe+FtCAL8I355DrGQ
         3F8hpNCcM3lP7b++gHJHKVokwzxLhLg3UNsAGcxUZY1Sdn/QZkHYHYSt2jn7G4f6nc4y
         BQzVnRZVKXhnXL3QEbaVRFpYtYLWDZQCf+9StXwAxyGOw3dEQBTYOxQCfDM6DLA4WCdn
         88NRRyEHhfEOeA+TRwkmsORLljPR1sqm9VDMdic+JhrPFe5nsGzkiauE82Y70p3uyb0Y
         eGRZgWHSHJri34n5aciIT7vLLg9tst9h4EPAbPAnlj3OQuwQWht5p8r89lUQ9kH6sdOd
         jZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049107; x=1787653907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjRJ6CK8+10XxSw1IIq1k9Y5+IsaxjCnKt7BPw+fxxg=;
        b=HQMIpcmy3r6Jh/Jmn+QC2oFq7CT2j14JwZnVhuw8jCdk26cwHX9c68U6of79enzCQR
         kOFtYOyYwnl1nTCy1tdpoh4oLNFRBqZ9e0flz/DHhhxOADe0mRQ0cXQXKdO/96GAmILD
         d/j0ykj4Tff5D8D9ErZO6OUIJNcTt5JEQiIujPY7ftmd1ATcQlYnThsmzMRdjj3Prqsr
         lljXqYGUPwHzA+LWD2kbjsqI7cettiDVdqfJhOP/09c92Xy+016DEjH5f8A+03adBU2F
         UtRbtJ9v2RdvQ6KEnowa4+kNWTa2HGTW1LS/IdH2ikmJ4PzRzZLTyJL0gJt+FPnN9EuQ
         wWOg==
X-Forwarded-Encrypted: i=1; AHgh+RrlVRjYa8MGhPdXc1UWOgmpQ6+OPOHPluYTCNV4Z4fZUbztlgOSGVkwoXBkZUbKKag3dksqWQb8mj+mF8XqNyZ+@lists.infradead.org
X-Gm-Message-State: AOJu0YwD9TBWu/Yab9iqHCU2j5QNrnwQV0oMMjlI0ZSlUBZG746A5sXe
	OiwUWqhzpkjF2mvzbMw0K1J4kgsi5aGZ5RvDNutV8wk9rmMDASapoGsy3vcuD+PzLcU=
X-Gm-Gg: AR+sD1178IkRtNWSQW5UUWHiZUeG6omEitSEwwVW4OFrPqS3oTxAzEUJcqVOI4Zt7p6
	ohIb+2pR0Y2QLncKCA++02wRKvGfsz6Rj1Zso4nbYiso/JJLVquQBjMPp0PQAjzk8hxLqH1yYEJ
	RFUqr5hE8ezdB/TGMzW/DMRkE1nApoSeaVAzgsaghoFlzLsyMe9XavECuR6bKOZugFHBhJSqL8v
	nob/lCYZD0Q7syGt+4d+JzV0XMwFRd8MUfW4f5ca+YkDEFPce1fys6+bybHlH8srO069kSWrmyY
	QnTr4NaBISZdsZAMdgVYt3JyUK0/kVPMcuqvw73vEviQyAQbmOaesB3mEZMSTEMImzkTD4U2tJw
	tiv+8YXohnrWhdwGXF2/wAqT6NSGezAI9QDnu1DQ7QsOZ47XgFx6sM/1xY1l6vx6S7R8hAqRbor
	yr7LzyYrKzocCg6yBBTZm7BiuETbHrLwGxT1AXDsefmAzFywhGA9NL1pJjEowZ20Ck3JUMgaaXa
	1GvCusZWQXa6WPZ58GG1XJ0l/CW2kLIooXkorMzHBI8z0LHJSLfB+dSWT3o
X-Received: by 2002:a05:600c:3b1d:b0:499:79b9:e226 with SMTP id 5b1f17b1804b1-49988057986mr490766875e9.0.1787049107156;
        Tue, 18 Aug 2026 03:31:47 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:46 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 18 Aug 2026 10:29:16 +0000
Subject: [PATCH v6 3/6] serial: 8250_aspeed_vuart: add VUART over PCI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-aspeed-driver-v6-v6-3-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_033149_316121_C3A90E62 
X-CRM114-Status: GOOD (  25.27  )
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

The AST2600 has 2 VUART that are usable over PCI. These are already
defined as the VUART3 and VUART4 in the 'aspeed-g6.dtsi'.

Sets the BMC PCI device enable bits, sets the PCI class code to
unassgined/device specific, and configures MSI interrupts.

There is no disable function. Removing this driver should not disable
the BMC PCI device, as other drivers could use it.
However, if all the drivers using it are removed, the
BMC PCI device will still be activated, which is not ideal. But in reality,
this is not a use case for a BMC, the drivers will never be removed.

This is useful on PCIe BMC expansion cards that use the AST2600,
such as the ASUS Kommando IPMI Expansion Card.

Register initialisation taken from ASPEED 6.18 Kernel SDK.
Add return code checks to each register write.
Simplify the code and add macros.

The ASPEED_SCUC24 regmap update is use an undefined reserved register
ASPEED_SCUC24_RESERVED_14. I was unable to determine the purpose of this
bit. In the AST2600 A3 datasheet it is marked as 'reserved'. It is only
used on the other revision. As I only have the AST2600A3, I was unable
to try this code path. This BIT14 was set in the ASPEED SDK so I kept it.
I can remove it and the untested path if necessary.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
Reviewed-by: Tan Siewert <tan.siewert@9elements.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 91 +++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 6afa2f4057e1..2360d37139bf 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -32,6 +32,28 @@
 #define ASPEED_VUART_DEFAULT_SIRQ	4
 #define ASPEED_VUART_DEFAULT_SIRQ_POLARITY	IRQ_TYPE_LEVEL_LOW
 
+#define ASPEED_SCU_SILICON_REVISION_ID			0x04
+#define AST2600A3_REVISION_ID				0x05030303
+
+#define ASPEED_SCU_PCIE_CONF_CTRL 0xC20
+#define  SCU_PCIE_CONF_BMC_DEV_EN					BIT(8)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_MMIO				BIT(9)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_MSI				BIT(11)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_IRQ				BIT(13)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_PCIE_BUS_MASTER	BIT(14)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_E2L				BIT(15)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE		BIT(21)
+
+#define ASPEED_SCUC24 0xC24
+#define  ASPEED_SCUC24_MSI_ROUTING_MASK				GENMASK(11, 10)
+#define  ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1 \
+		FIELD_PREP(ASPEED_SCUC24_MSI_ROUTING_MASK, 2)
+#define  ASPEED_SCUC24_RESERVED_14					BIT(14)
+#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN	BIT(17)
+#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN	BIT(18)
+
+#define ASPEED_SCU_BMC_DEV_CLASS	0xC68
+
 struct aspeed_vuart {
 	struct device		*dev;
 	int			line;
@@ -412,6 +434,66 @@ static int aspeed_vuart_map_irq_polarity(u32 dt)
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
+	scu = syscon_regmap_lookup_by_phandle(dev->of_node, "aspeed,scu-syscon");
+	if (IS_ERR(scu)) {
+		dev_err(dev, "failed to find SCU regmap\n");
+		return PTR_ERR(scu);
+	}
+
+	/* update class code to be an Unassigned/device specific class device */
+	if (regmap_write(scu, ASPEED_SCU_BMC_DEV_CLASS, 0xff000000)) {
+		dev_err(dev, "could not set PCIe class code\n");
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
+					ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN |
+					ASPEED_SCUC24_MSI_ROUTING_MASK,
+					ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN |
+					ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1);
+	else
+		rc = regmap_update_bits(scu, ASPEED_SCUC24,
+					ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN |
+					ASPEED_SCUC24_RESERVED_14 |
+					ASPEED_SCUC24_MSI_ROUTING_MASK,
+					ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN |
+					ASPEED_SCUC24_RESERVED_14 |
+					ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1);
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
@@ -540,6 +622,15 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
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


