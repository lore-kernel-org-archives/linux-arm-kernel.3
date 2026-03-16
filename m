Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812D6F53D89
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 19:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vW4wNaLpPpVcg+OmnMFbXl7UCVsc/HeNgrRo5J8C6JU=; b=vb5hjG/DnNw1Mv9sWHs3QRVOYe
	QbvNScZzNljfe30lCsuw+e4BAooSyCta28ublFkelofdo9Cxvmo0omw8FmJlNjGrH+4VJs2BPEbBg
	aH0RbOLgMeBfLC7ZZ1Vb0FB0Kx7AoKxEW+efuu5+YMAR0IrMATKgVCmY6LkZ148/2VXGw1ntk68ty
	KgGTgPWOVpTiweJSK4pCVltXBKKfREbOzTiaCoDVkagd+EyVQX21+OCLqWsrYzpyRSpAmPXMWSDHX
	mlTH9AogyDnR5NO6tCOn8p6Tlw5v0CDeBw57irjbdHZF6J9rhmELow80KQfsov3a8EUlCDMK64kaJ
	aU5VFbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DLX-00000004j4G-2rPJ;
	Mon, 16 Mar 2026 19:11:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DLF-00000004inG-1U1t;
	Mon, 16 Mar 2026 19:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773688259;
	bh=cc8ocOs4WP7lCWUMJwF/hXBI0/GUSTf6xdSHBRSav84=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iPAkY3Fb7jl92zzJPZwPA7QM4y+eA5et60E9A6TWfwtAillBqsvCWHdY4/OAaU1wH
	 3LjOREheyE0uEr1NX1qPCPNmE0qrvIfn9nhV2XBtwEqdM1rdFwU34xEDQdeDG7XSmq
	 Z2iSobr0bPZCsmmycqCSTgCybfy2Cl3c+ht2HpiWesn3poPiCdwqs5CsOd1oEfNQcg
	 5eaYcC+ZBDTUMxoKmb4ihUUPwLlXJ0x8jdZ0JF3DyZH3EC/quIF11xZzSE6DOdQvnI
	 j9qdawDm7YezrbBEJgEE+Kzu/1SIMZJ+4CP3nh8dGZfssGdyN/l1TaBDI6WXwiV4Y8
	 wCGr87DvtwkjQ==
Received: from jupiter.universe (dyndsl-091-248-189-119.ewe-ip-backbone.de [91.248.189.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3992617E1513;
	Mon, 16 Mar 2026 20:10:59 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A090C480030; Mon, 16 Mar 2026 20:10:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 16 Mar 2026 20:10:50 +0100
Subject: [PATCH v5 6/8] PCI: dw-rockchip: Add pme_turn_off support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-rockchip-pcie-system-suspend-v5-6-5bb5ad37d643@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3022;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=cc8ocOs4WP7lCWUMJwF/hXBI0/GUSTf6xdSHBRSav84=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm4VcI/Q/Cle+MYuTYA1G+cbzOBb6T4b+953
 +du9qpYYfH0/4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpuFXCAAoJENju1/PI
 O/qaofoP/jUXEx0aC9VDXf+iOx9ONBxh6HwSYnMnLLtbTGDtEcBBuGm2xKy6zBB0jfpmwEEzm4c
 4+43KJz8N0psbeIAdpxzhJnUNZXknNgwrtKZ0k1g8eBN0boeFzErKKgJtNrOZrF2TQZY9yh8TDw
 dY75MxKvvZh/8T9/cTBkYH00s2Z9IHBxDcmqbA7Zt8uLLhcnWXp6GdBIwc+iozESBmDLaMT8el0
 M+AvWK743B0X64+Ozj7Jaoco1UQgypw9Ywepcuvd1N0qrpz8auV41TVQHEsCywRlu52NbLJwnuW
 v4pLpoGl3JfIG9CuVZVlcHZLd15TYEpWuDFV2CCjjRlgHrVtZOHE8kwzBN4rm3WP0dh3EQ01EUL
 ikU0TM4/6m9tkWkoB8FsmyeLiYJv1pwUc2j2sDhcoZRgSPy30bpcSmB+0rvVIpvNoFF11OyjwVl
 Kn7Gpdpg69eqXGYLLHICilscFbpqp9sVcFC2eORMKdmIwUETfFcXiVz5HJIoIsEeZn+Pd3+3z9Y
 Kp8O6Yg3JP7RjiNRrojlkNXdYokc8NS1p/zSK7wBFsDs36BxeNxzFNLwJuNntHSpgdxEKwO3Uhi
 fpq5ifKIYx3puPXOydYJJ/4KQtCQ6XHG8B+DXY/QptUJOS8muwbsa1Rx53TLb4i94o7jIcDI5uh
 +E94+RVZx6+xZ+RivoM4rgw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_121105_585541_01D9FB50 
X-CRM114-Status: GOOD (  14.44  )
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

Prepare Rockchip PCIe controller for system suspend support by
adding the PME turn off operation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 8cb0040b4ae1..147add66db15 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -42,6 +42,7 @@
 #define  PCIE_CLIENT_LD_RQ_RST_GRT	FIELD_PREP_WM16(BIT(3), 1)
 #define  PCIE_CLIENT_ENABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 1)
 #define  PCIE_CLIENT_DISABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 0)
+#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x04
 
 /* Interrupt Status Register Related to Legacy Interrupt */
 #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
@@ -61,6 +62,11 @@
 
 /* Interrupt Mask Register Related to Miscellaneous Operation */
 #define PCIE_CLIENT_INTR_MASK_MISC	0x24
+#define PCIE_CLIENT_POWER		0x2c
+#define PCIE_CLIENT_MSG_GEN		0x34
+#define PME_READY_ENTER_L23		BIT(3)
+#define PME_TURN_OFF			FIELD_PREP_WM16(BIT(4), 1)
+#define PME_TO_ACK			FIELD_PREP_WM16(BIT(9), 1)
 
 /* Power Management Control Register */
 #define PCIE_CLIENT_POWER_CON		0x2c
@@ -334,8 +340,46 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
+	struct device *dev = rockchip->pci.dev;
+	u32 status;
+	int ret;
+
+	/* 1. Broadcast PME_Turn_Off Message, bit 4 self-clear once done */
+	rockchip_pcie_writel_apb(rockchip, PME_TURN_OFF, PCIE_CLIENT_MSG_GEN);
+	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_MSG_GEN,
+				 status, !(status & BIT(4)), PCIE_PME_TO_L2_TIMEOUT_US / 10,
+				 PCIE_PME_TO_L2_TIMEOUT_US);
+	if (ret) {
+		dev_warn(dev, "Failed to send PME_Turn_Off\n");
+		return;
+	}
+
+	/* 2. Wait for PME_TO_Ack, bit 9 will be set once received */
+	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_INTR_STATUS_MSG_RX,
+				 status, status & BIT(9), PCIE_PME_TO_L2_TIMEOUT_US / 10,
+				 PCIE_PME_TO_L2_TIMEOUT_US);
+	if (ret) {
+		dev_warn(dev, "Failed to receive PME_TO_Ack\n");
+		return;
+	}
+
+	/* 3. Clear PME_TO_Ack and Wait for ready to enter L23 message */
+	rockchip_pcie_writel_apb(rockchip, PME_TO_ACK, PCIE_CLIENT_INTR_STATUS_MSG_RX);
+	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_POWER,
+				 status, status & PME_READY_ENTER_L23,
+				 PCIE_PME_TO_L2_TIMEOUT_US / 10,
+				 PCIE_PME_TO_L2_TIMEOUT_US);
+	if (ret)
+		dev_err(dev, "Failed to get ready to enter L23 message\n");
+}
+
 static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
 	.init = rockchip_pcie_host_init,
+	.pme_turn_off = rockchip_pcie_pme_turn_off,
 };
 
 /*

-- 
2.51.0


