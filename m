Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11104CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywirQdX8Th5t598s3arxiMTYccRGA/aeoVhwlL2g8rE=; b=Bu+tCxxv6FjLz+xecXtmtm1m53
	waMEbdkK/md2m1x4Rn0rRoYNUX/ME0fC5kIw68/09jnGhx8Pg6u/LASy+Y/7NDt6CRa3flEOujdhy
	oA/smHf5Z1QQQEtgscPoqcxrKGcgIxZhZZPIHVQu2QN5pCNqlF2d2vg/hi8pEGWyPCu2ZjovTrYJc
	5GhrI4bhl7v8EYNtGyP6C2N/Ip7BkPYO4bnmLVxLwcCnQwYJ0pPdcNwEy44SBahXrJYumgJI26mes
	8W7W4+rbMQlcmUvhS61uoMDe5mEDKeuO237hOyfd8t4pmp+2u8bNCfYnvXAZx2nRLN2o5eN/ZROXa
	ma8nEg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAQM-00000002InY-0R6l;
	Wed, 29 Oct 2025 17:57:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAPz-00000002IOm-39Q6;
	Wed, 29 Oct 2025 17:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761760622;
	bh=gaQ6PhWIvkF7IvK5kYE/g8/88NuFUu8QFhhiMCw+Mjg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SVSaYA3Rlj4kq+syR9xCMMFpfJ6Gy8VgB6noI32UIkHwf8SWJQB+Sd7+SU2I8+SBj
	 iLLIQ/5Ntb+QJt809FRiRI0AXLVtYReKLOLhKhMEQsBaZVIxBwVTWZoqS+1rL7dsVv
	 2hU8c6CKvXxteB3iB26MEabpREtagXK9pz7knd6Yua7yTVIyO+6NdCHGM9Wluvu3/9
	 19d7Vm3dErM8RqVZiI+EBvdXFaKHCDO/EX/EDt03FbJ4WH695mB8Pck66GPW1UFY2u
	 RoNZhvEe4l/HONVUK9kBkHVzKxnC+8Ig5ge5LPb8NlUzMgKaw5SWq2x65NdTS6uHWq
	 FoSLV5OBFaSUw==
Received: from jupiter.universe (dyndsl-091-248-085-053.ewe-ip-backbone.de [91.248.85.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C567B17E13F9;
	Wed, 29 Oct 2025 18:57:02 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 21057480062; Wed, 29 Oct 2025 18:57:02 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 29 Oct 2025 18:56:44 +0100
Subject: [PATCH v4 5/9] PCI: dw-rockchip: Add helper function for
 controller mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-rockchip-pcie-system-suspend-v4-5-ce2e1b0692d2@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1954;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gaQ6PhWIvkF7IvK5kYE/g8/88NuFUu8QFhhiMCw+Mjg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGkCVW3feJBw5VJVIAUNbSIQ1BUn2NdGO2FxA
 PdWqXC9j3d88YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpAlVtAAoJENju1/PI
 O/qaYWkQAIIfCyKZgR2sek5kFYRGVB2I28xxykuPxKo93XHAkAA1sYFvmdCdyR46uXlZUJxBOTd
 7aC31QgE13T62P8HrFlulEgUlhUBAypWDSKtbmayN+pmTmXPPYcG/Q7jVeCfleZObo8pZ92LPdU
 MRLYZSZ8wZb4Bqkj33xjV1uQjwGVoLklHVCFFRM3URLuCx6dedaE+lxYa4HpTmtCcg3OuwiMrGX
 ELOVl5uwZUvC5ZlBUf6aL6QW/+uWr0Kf8cZxfYvX/nYvUNbYt78h0poibhYSLuL4zC2VncdVSyL
 ctVOM+gY1o0auMWJ1Ol5ilbnr/qinvRcYtkBQPfMTRTJmWKb2ouf2OJPN5SlpBfLSqGFGjMoxgO
 K+3Q1y+8nxU5CiuQXDlorw65TrGT6TDexokpsaOfuoMIh1VazaGg15js6tx0wxcqM/3KpUr1tfb
 WZWG0qYIXNOKR0TLfWRaiwgulgfzoN8W7R/GvTjUL257pfauJg+7/XrjAvHPwo02Jesss/ugCu+
 A5nejRcUJArnvdBxXbUijfJzN11vyCY4OnfoVx16Kh6HBXeTg53KhmDx9ItaQn6Z5WYeo+9+vyJ
 JIMqs4YHlIU63h0XdF3KTxuXAI7fT/kLejZG6WgdZDz1nI8A+x40WMW120PT7UAupMs5OIDcEHX
 m7625g8mwhLPrHhrRMKUvnw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_105707_953604_D6B6D3C6 
X-CRM114-Status: GOOD (  11.80  )
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
function to setup the controller mode.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 45586a964ead..5c8d30e15a44 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -523,6 +523,11 @@ static void rockchip_pcie_enable_enhanced_ltssm_control_mode(struct rockchip_pci
 	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
 }
 
+static void rockchip_pcie_set_controller_mode(struct rockchip_pcie *rockchip, u32 mode)
+{
+	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_SET_MODE(mode), PCIE_CLIENT_GENERAL_CON);
+}
+
 static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 				      struct rockchip_pcie *rockchip)
 {
@@ -546,9 +551,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 	}
 
 	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, 0);
-	rockchip_pcie_writel_apb(rockchip,
-				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),
-				 PCIE_CLIENT_GENERAL_CON);
+	rockchip_pcie_set_controller_mode(rockchip, PCIE_CLIENT_MODE_RC);
 
 	pp = &rockchip->pci.pp;
 	pp->ops = &rockchip_pcie_host_ops;
@@ -590,9 +593,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 	}
 
 	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, PCIE_LTSSM_APP_DLY2_EN);
-	rockchip_pcie_writel_apb(rockchip,
-				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_EP),
-				 PCIE_CLIENT_GENERAL_CON);
+	rockchip_pcie_set_controller_mode(rockchip, PCIE_CLIENT_MODE_EP);
 
 	rockchip->pci.ep.ops = &rockchip_pcie_ep_ops;
 	rockchip->pci.ep.page_size = SZ_64K;

-- 
2.51.0


