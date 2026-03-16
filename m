Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BCDF53D8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 19:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0rF2/jSWMSaGUFW3sNWM/aaCKgV2RrpIcBrgKB8dlg=; b=s0pnBTO5t+xQjII/llnD+kWqI2
	WuHzlPWarqNQQ1fIux4I3WdgbzLgGaR7chgVeaM7p4uMDf30VC4oH4Dp73d7mE1aztP5t6n5B4rPp
	o8lbg5jIbPNLW/IRfI3lADhSiq9r0B3N5STuNvbdaK6vWaXQpI96Ts/XrCPR4SP7OCV0KXOs0BfwD
	8PG9npLPzWVyD/wJiEIsR0XlLZ+Iewhnn+4EpDza5w3zEedT2ayz4r87BI3y5lwhdbACDeThOy4kK
	GJ4wbaS75j0GFd1x8muVOUdICyQYBAIYU97kjqliue9Zv8K6UYonEMWFGr3HYEISqon3sbUa2/waL
	l6lSPmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DLF-00000004inq-1AgL;
	Mon, 16 Mar 2026 19:11:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DLB-00000004ilg-3Mxr;
	Mon, 16 Mar 2026 19:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773688259;
	bh=OYXle65UbA6FXNL9sgz1bXYwlnjQ+Q0zKkucafw1AGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ozeg3B/l8UrzIxvpSbXs7JAf4/lE3OieAw5RcZz9iK/2U15d67BJV8DbRI7WiQnZB
	 ipycME0V3i4vHdx7qgY4trSkpg456wjS0r6o45JADwyu9Zgk8oJNWAt0MXD3SYgKyE
	 sL05Y3Q0AFoXCYZtvEgyemW5b0M4A+1ZD3hIdv8tpb7nCm/2KFBC6+pMfF12X4y5Qd
	 8UfXekf9VttAv0jpRT63hfOTWA11YpjqsQS3OB0NFe2yniUeNBDxw3GvX1Jj7O019a
	 wX5BbYaLNdId3xcrKe80ihUQW1e2beyFjptgZ9cCbR6ZlI19QEmBkXN207teyqhnQ/
	 DADE7TcoqdkRQ==
Received: from jupiter.universe (dyndsl-091-248-189-119.ewe-ip-backbone.de [91.248.189.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D0A6717E0EFE;
	Mon, 16 Mar 2026 20:10:58 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9B1C148002D; Mon, 16 Mar 2026 20:10:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 16 Mar 2026 20:10:47 +0100
Subject: [PATCH v5 3/8] PCI: dw-rockchip: Add helper function for enhanced
 LTSSM control mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-rockchip-pcie-system-suspend-v5-3-5bb5ad37d643@collabora.com>
References: <20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com>
In-Reply-To: <20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2215;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=OYXle65UbA6FXNL9sgz1bXYwlnjQ+Q0zKkucafw1AGs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm4VcKBEX4NXTZGVci2GLSQDvzdgbHWZLMF9
 OKR7QmoLFwUY4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpuFXCAAoJENju1/PI
 O/qa+VwP/0UkmxpK8YUfWnjif3FG/KXOdSG77gUXHv7GY9v1dnpGTfq5WM6jVOIRvPDje/aPlIk
 PlVPhPJdY3oeKQYizzvvllHJTKGBOLBmw31H4ysqC2lDUMHmreyVRI3JWsbGBNuX4sKHowXzPkg
 N1/W7hL2AKet960ePnNB7QhRLAVUXDvCwoEu+Fm+HNjIUK4ApGcCfFJolJlp/2iCZZZ+AInFxgU
 M39hcTROx3F3UqcmcKDfg0tul7tqmCEJo1cdKthCOo0/bc9i1d4HqENvHrOUHkZuL3E+ETNit49
 9tqYZfQs4Nqufsip+lkqqLiL8UEmXew8YbUIzu3IKFVgaHd3669qCRiUAQW5zs4UGqeMWDdekkD
 EcwgYWO6ghYMxXXPJgQL2QVHfEFekxicZqK//YZvoHxlwUJDUgfGe8a5nKknZPwGfMBLjL5bSw0
 pHDpSCO+btiqqT39pqpwwveFDNfM22WZf6ASEH1YmOoMQzfhbo+svBLEuBcHkiPmkrmQD9rT4cy
 EM0uHUBem56sl2T7gXCBtezBYqq8X9TeTLBB7AuEJYj1rZkCy7O64JiAjxqIfLKrXDMP0W0ubt1
 1FBgF82OZJHFiMpnsNPZBy+elWloJbMRlrXWjifrdMr+JQDn20AqyyRjvMD8DhSXkbLMVhnHFSj
 t+zVqm86GfKwVXfNLdNEz1g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_121102_003353_DBEA4A25 
X-CRM114-Status: GOOD (  13.53  )
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

Remove code duplication and improve readability by introducing a new
function to setup the enhanced LTSSM mode.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 0228f7b6f100..508d069ffd75 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -543,17 +543,26 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static void rockchip_pcie_enable_enhanced_ltssm_control_mode(struct rockchip_pcie *rockchip,
+							     u32 flags)
+{
+	u32 val;
+
+	/* Enable the enhanced control mode of signal app_ltssm_enable */
+	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
+	if (flags)
+		val |= FIELD_PREP_WM16(flags, 1);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+}
+
 static int rockchip_pcie_configure_rc(struct rockchip_pcie *rockchip)
 {
 	struct dw_pcie_rp *pp;
-	u32 val;
 
 	if (!IS_ENABLED(CONFIG_PCIE_ROCKCHIP_DW_HOST))
 		return -ENODEV;
 
-	/* LTSSM enable control mode */
-	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, 0);
 
 	rockchip_pcie_writel_apb(rockchip,
 				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),
@@ -587,13 +596,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 		return ret;
 	}
 
-	/*
-	 * LTSSM enable control mode, and automatically delay link training on
-	 * hot reset/link-down reset.
-	 */
-	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1) |
-	      FIELD_PREP_WM16(PCIE_LTSSM_APP_DLY2_EN, 1);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, PCIE_LTSSM_APP_DLY2_EN);
 
 	rockchip_pcie_writel_apb(rockchip,
 				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_EP),

-- 
2.51.0


