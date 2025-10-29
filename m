Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DBCCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2LMjwnTMw2k/RgMk8oz6z18BX6+s/l1Q8X2BlWtugo=; b=lHm6q5Pephz+gaU6BwOfrZC5AV
	4M598jon3h2StRDFWwRDy9Egi24mQPLcEV0ObfNwvXxozw/3Q8sVGF4li1U8i9H9L12CNKKJjUYmf
	cmEIq6oxOZR/T511fG4xw9/2G3lc9BzieGtn1dvn2h5HTjS7hj8NYJOzVny5JMlo6F6YIHjQPEulC
	S0F0qXRYp+Tiy7nN8CQFgG4hLrEzgOOhrYFnh7FePo7KP3IxXgN/50ty8i7gd8m1YBL6poVhIe769
	h1sNMRJ9LjjyEsfJin/DWdKjZO65aQgPqNGiBy3d75eZRQEKCevQH1i1ot2hhXAvybtlr4l3zn/Us
	LMXxOm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAQm-00000002JIN-0cHO;
	Wed, 29 Oct 2025 17:57:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAQ3-00000002IT6-04QQ;
	Wed, 29 Oct 2025 17:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761760627;
	bh=PIWbCQVMLO0czKmSk54OiAydafyyJJiqIu+dfGb7c8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IaYzqsF7TCa2rwrQEf08gFu9l0zxMAj77yNREbGLKJSspPg9nw1AzKE6fxobygUd8
	 +L1tHQsh1EVMtz+hIYyMhfX7pPD9aDk7ljkF0xU5sf6VScGPX4nv+xJAQLXtye22cK
	 IuUhvs2aP0UIy3EkZMpoJ+04jzQr6egSvNUX352hX+55ASg1UrmZUfZ+KJmAlwRbxS
	 ia09ik60qmaOGAfzQzh4KNflrw57Cedjmw9CNXMyNz0HIXXLHlESd+mK8dAy+JFve7
	 2+woAtJQ88p0YOjzNeF8KxtOndGwLKCgnb7FonYc3TXQ0JdgyCO8AYKIkxbNV+Tr+j
	 TQJXbqf7cr32g==
Received: from jupiter.universe (dyndsl-091-248-085-053.ewe-ip-backbone.de [91.248.85.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 63C2817E1423;
	Wed, 29 Oct 2025 18:57:07 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1FBFC480055; Wed, 29 Oct 2025 18:57:02 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 29 Oct 2025 18:56:43 +0100
Subject: [PATCH v4 4/9] PCI: dw-rockchip: Add helper function for enhanced
 LTSSM control mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-rockchip-pcie-system-suspend-v4-4-ce2e1b0692d2@collabora.com>
References: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
In-Reply-To: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=PIWbCQVMLO0czKmSk54OiAydafyyJJiqIu+dfGb7c8Q=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGkCVW0oCjxq418OHByOeSI3S7y61NUnIPR7a
 mx8V+8rLxpwyokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpAlVtAAoJENju1/PI
 O/qa4PgP+QFeVp8gqhGnqA8uz6mf2ojDd1Qa8C48wxy9ixGhMgrqKQ8GJaVVhku3ImLZ1dZrrDk
 nONU6XPkMtJ0nia+NfID0iymRJQQaMdlZfrPoJwt1Astj5RsCVWQWUxsHEjPfdXLAbdVys7P6p4
 Ks3lSS4nfhep5obHN38Jfs+7EHHoFL7qeGQZFRVEiCNECMno9lDfMiPw6w7yNzKaBf+Bqw6mp+9
 EoCrkIQQfYGOQL8GVgw/wsRg2J/1pR+OERZBZH+sTSCeDhEcOhN58bziLIee0rh3+2hV+XUbKJD
 d19PlL/zjF8uND9Jc0DOMtOrQTghjXleSszN03JS4qoWZjI0R87/WXfjcpq7yzNpz+WkKK4LBrS
 fcR61eSfgbseVYwrItSkD2j8zoVOs1uUz/2qeVT6LjjhiWBrGP/tmZbmcYlBUT1N24pqo5Y3H27
 Ik/VNkYG7NJ3QwWehqak2N0+0hWw5dzljlS4Utudc6pVZd+whlVqY5FP4qnlIWPnfzbVA2lk9Vs
 korQzc/wpKz3VnQUN1fG/YDsUJls48f8rEZjuzaREv+gTx39+ctGDTXpHL6HQt35SJRPsQ78Uau
 ytocMmYVhuwnt7rwom7bFyz6x4D3dYUInsqw7DAHIpGxsOX5ItHAf5AAFCq1m44iBHbfA5htu2e
 /0IJUh2xO5eaqjOiVur4kdA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_105711_362151_FAC58BD0 
X-CRM114-Status: GOOD (  14.45  )
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

Remove code duplocation and improve readability by introducing a new
function to setup the enhanced LTSSM mode.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 8e584016e244..45586a964ead 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -511,13 +511,24 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
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
 static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 				      struct rockchip_pcie *rockchip)
 {
 	struct device *dev = &pdev->dev;
 	struct dw_pcie_rp *pp;
 	int irq, ret;
-	u32 val;
 
 	if (!IS_ENABLED(CONFIG_PCIE_ROCKCHIP_DW_HOST))
 		return -ENODEV;
@@ -534,10 +545,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 		return ret;
 	}
 
-	/* LTSSM enable control mode */
-	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
-
+	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, 0);
 	rockchip_pcie_writel_apb(rockchip,
 				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),
 				 PCIE_CLIENT_GENERAL_CON);
@@ -581,14 +589,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 		return ret;
 	}
 
-	/*
-	 * LTSSM enable control mode, and automatically delay link training on
-	 * hot reset/link-down reset.
-	 */
-	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1) |
-	      FIELD_PREP_WM16(PCIE_LTSSM_APP_DLY2_EN, 1);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
-
+	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, PCIE_LTSSM_APP_DLY2_EN);
 	rockchip_pcie_writel_apb(rockchip,
 				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_EP),
 				 PCIE_CLIENT_GENERAL_CON);

-- 
2.51.0


