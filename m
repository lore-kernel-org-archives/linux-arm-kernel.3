Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27415606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pk5Znh3f;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=IsEmX5RW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XA2MACvdwjYjMWDGZCzFIel+dC9w9QelP0SCpke7IM8=; b=Pk5Znh3fabowHR
	FCZ8XkttEcHHvSkpd0s4okstugo84D7YGwuRdzsrk0li8tgACENRNzl+4P87iDO76tHDW7HHYWEI4
	IUStDKxKZ7CQhOhqlOaZNPVz9mai6VLEbH6rwzGvnvNCVHglV9iu797OLDupoFOQ4tXSb6C5P2NNn
	tPGMUHhcGak2czyaQjnajU8FM6IS9riAIRgtNBGIE+JFqXMaYCp2U3VAhDh8UNMpCBM463nkGSsP2
	xgAPPHv0LCiLsfMFaaExw8F/A7PLo1FO5pVDTefm8W5zKn2eVQzYS7wbvdr4jqhG18sAcokIkRo/F
	+4YTwYwYInnRWScNw2Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxau-000000098bQ-2nnv;
	Thu, 05 Nov 2026 13:33:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxaf-000000098Ar-2wbT;
	Thu, 05 Nov 2026 13:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793885591;
	bh=Zuu47c5Rl5LpijQfd0h428pfqqmH6gW6BuU2h4/pz4A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IsEmX5RWnl7+GxAeuG6RfWFlhJGJixQLnvJjaMlith2w1fRs0oNX5loFOvk0Hl73K
	 MUvmskG19d6qT0qS5lDKbkmnBlq2oj4Ei34CZNOuHXg90rYPL2Yxjt9rX9iYgkFzWj
	 5GRckTZPDgn2QrKzhLnrPLODy6zNVypPBO3HyxSY8Glka+MAsCp2I4i6QI8MkZjm7J
	 A109Sr24KpWwUgv17inikvIeI/wY1pR0cf21z1FSJy3f7GzMfivGAz4VLhbUOkaCX1
	 N9sbxJLap+yH8Dem5uKuqxSQmd9VKv8APeGIvU1RzFKo0T6NnW8l4kDWNN7cq0d0ub
	 462cdJHOvw29Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9897D17E0C18;
	Thu, 05 Nov 2026 14:33:11 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EC97648003A; Thu, 05 Nov 2026 14:33:10 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 14:33:15 +0100
Subject: [PATCH v9 7/9] PCI: dw-rockchip: Add pme_turn_off support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-rockchip-pcie-system-suspend-v9-7-a2e55846649e@collabora.com>
References: <20261105-rockchip-pcie-system-suspend-v9-0-a2e55846649e@collabora.com>
In-Reply-To: <20261105-rockchip-pcie-system-suspend-v9-0-a2e55846649e@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3140;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Zuu47c5Rl5LpijQfd0h428pfqqmH6gW6BuU2h4/pz4A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrshZYw8YNoXWbCm5k9W3bBXqoP1EG7nVnn0
 UthRW0K3YPCtokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7IWWAAoJENju1/PI
 O/qaAnAP/RTmEXV+YSygiU4hYFEqUXwXbIfHoHC5JgBBrDccFfAsKgXPPGJuyz/NyzCwZhFPGVl
 DkdSK2tPwmhRVaQ7OhYSRukbHQ77g0OAU0U+BppXMVKnfFxcZVAEfo0yf7mDwtaLULskpBpJnh9
 w7glBFZ/QmLDAkF2InaEp48NPsYLcBH5fYnal2cb7yDSUbZx+DljSe1eZk4i/y+/nbU7Lr8vq59
 PZMRrOcOjTmsfhHObdmNLRy9VrKYot4/hTPmFswNEqe12TCkL56WdBADZuydX5PjSYsFVBHaxSF
 /EtdENvvRYSXgPpBhRnBkhRxLu3S+ZVjuIN9nTymajeRJarF64xDd/TayEV7HFq+NYS9m844NMd
 paCUXQrWKHrN4qUVYZAp8XfCHVHcuQBoo2+JewfrvZxzG5WcBC30eZZSNYZ0holpnjMqUNh6Xst
 N+5b24SH8zzKPPo3zpPvINQ+K1CkLYCvLcet7b1t3I5psFgNyahPa0gfcJMCyhbqmSVli2NcKiT
 AWkpPAKoxsVYBhOWvRJ+zKmjV3xZ2eniKDd3lqGwQe+uwBmOfFOpF5fwSYiuchMCyHbiwDd2zfH
 4nD50o/4DrWPktiTs69y2gMgj/CEmBW5Ont8SCOFBCrizWcKsYrKT5Q4R588u+4trM+0M+Nua4z
 wNQ6AJ0BWU9meVX17Dyou8g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_053317_927353_815BD277 
X-CRM114-Status: GOOD (  14.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Prepare Rockchip PCIe controller for system suspend support by
adding the PME turn off operation.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 47 +++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index b4f53ce86079..d8968743732c 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -47,6 +47,10 @@
 #define  PCIE_CLIENT_ENABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 1)
 #define  PCIE_CLIENT_DISABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 0)
 
+/* Interrupt Status Register for Received Messages */
+#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x04
+#define  PME_TO_ACK			BIT(9)
+
 /* Interrupt Status Register Related to Legacy Interrupt */
 #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
 
@@ -71,6 +75,11 @@
 #define  PCIE_CLKREQ_READY		FIELD_PREP_WM16(BIT(0), 1)
 #define  PCIE_CLKREQ_NOT_READY		FIELD_PREP_WM16(BIT(0), 0)
 #define  PCIE_CLKREQ_PULL_DOWN		FIELD_PREP_WM16(GENMASK(13, 12), 1)
+#define  PME_READY_ENTER_L23		BIT(3)
+
+/* Message Request Register */
+#define PCIE_CLIENT_MSG_GEN		0x34
+#define  PME_TURN_OFF			FIELD_PREP_WM16(BIT(4), 1)
 
 /* RASDES TBA information */
 #define PCIE_CLIENT_CDM_RASDES_TBA_INFO_CMN	0x154
@@ -439,8 +448,46 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
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
+	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_POWER_CON,
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
2.53.0


