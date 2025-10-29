Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEFFCCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjFN/ZUFwKt4UvY9hwt0lg8SsTegY+Ty4zNadd49HHY=; b=goUKKLUEmxWAsTI4ac5QUQQTLY
	5WePmj6pOr/n7jyz6M4GpjhKuSZunIxjAjgTOQDbzjFjQ2Lwg3lpEtxrSTcBLHK/R2oTlIyhnmrFX
	S4vkQ0j0S9f6U+fGD8dEgLAZuZwtWv28XwX3CHI6nskE3yHyQmEPpyjqYkVZ64D5nsWkBzZudLEYH
	r9DG1sZJlA+AgYhNfvFcdHbJu0d8I7yi3SGKd0iwTHTm0wbbZhbi295kW7uUEDIiypGiux1+Dpqhs
	oXZEjfcrLhxE53QaoSGNQLYvNzeAHWifNG2GfviKNhvr/C4iSIwaqJ7NEZK01dNEpfz+rS7AUUEZe
	1r6d8hmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAQB-00000002Ich-1yBs;
	Wed, 29 Oct 2025 17:57:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAPy-00000002IOw-0DWX;
	Wed, 29 Oct 2025 17:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761760622;
	bh=KOwiUHfMn1x26g5AuHjur/7d23DIKlmVDPD29Tb+wwI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TcNwTjRy5FgQpxQtD5LVNsR5bAo3cC0l2MJlPVwGrkVSzIs1ObsdrAuWeP13poSH2
	 2usb1qfzTxgZy0xZXuYYTBImuHmqPlXLF4FRWiTTm6n7ZhLMj8gCDaAVAJwMS1RHKf
	 QmLd2MTrbzNjeKcgAGXxlkFYJ9cxp3DUZVSg6UTjo93uNGCqI3KihHduu+uFB2yHQw
	 6qZ7cQpFnxPaBKTOx1yO6yufNIJY1qc9yNzoxH4je/tfIReXG6ovznlkgpomx4Pt8L
	 Zkz/Z7Yc8jA+m4P9iePSRcu1QySILJyJULQfK8AXo4qUqJ8yAuhIyei00cB0HTzHqw
	 bfWTu2K/xmHZw==
Received: from jupiter.universe (dyndsl-091-248-085-053.ewe-ip-backbone.de [91.248.85.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 94E5F17E12D5;
	Wed, 29 Oct 2025 18:57:02 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1DA9148003D; Wed, 29 Oct 2025 18:57:02 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 29 Oct 2025 18:56:40 +0100
Subject: [PATCH v4 1/9] PCI: dw-rockchip: Rename rockchip_pcie_get_ltssm
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-rockchip-pcie-system-suspend-v4-1-ce2e1b0692d2@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2340;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KOwiUHfMn1x26g5AuHjur/7d23DIKlmVDPD29Tb+wwI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGkCVW07kSfM27DEyFgIygv3KfKbO7g4Y5RUS
 0FkVNHVfQzUD4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpAlVtAAoJENju1/PI
 O/qa+8MP/0gXB/ghhIbwUxROpOWVF/mYgegB29+5ohKIbDKB0PqmmYUeh4J0jL17eXRBTBit0h4
 S7harhCtKIf8HBElCKUOSeu1OkJ1o5b1qu9ibdQz7dXNrNLIdu5AFCTSL4IR5opwgy2ziVUsWOU
 SlpbP9fKLTsSKwnqS7ihg87CA1/tZFGd4XA/MN1ovRoPrzG/LdR6JOlpeoribtBrOtSJ71aHVDm
 miaHJSqxGRH1/pVzzjDGVDWQmo4NGMDfwcFchGr9uBOlhycRuwJFXtuR8H9RYEONQK3JufzziqE
 62+AijWrjKJlr/0LLK7EjzHYgVbbyVRU7relSc7uG+PB5z1u1WDzKAL+qZlxX9We3YvW/MVYp2o
 vQcBryrzZ8cvSTbDXg2fr12t+KdkMeAtTKPjhbXfCgfZKSD5E1mivIVb1IAitX2EcXVaMD6XZVF
 55ptG+9io6a2XPxSKSEa/BUpfTcEWf6Xq65LOlaL5x2X+MJrU1PYoVPd2w3EgBFSumZRa3wBvQn
 Zw5d4joGTlBTt4VffuH91dbDsnK7y9yueikTPbeIKE8smAyZ8p6V+yUF1il3sP5F83iovwg+3Ub
 IBBpwlG9PlSq6gwaA240uQo+EROea1Oi4K3P5dBui+8/d5yGwFbbED+yPC3Ebi98/Ag7HOuy9XN
 YA0QoKdai/wwndt/Z3fowsA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_105706_294532_FD3C776C 
X-CRM114-Status: GOOD (  11.79  )
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

Rename rockchip_pcie_get_ltssm to rockchip_pcie_get_ltssm_status_reg
to avoid confusion after introducing the .get_ltssm operation support,
which requires further processing of the register.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 3e2752c7dd09..58427db1cc65 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -175,7 +175,7 @@ static int rockchip_pcie_init_irq_domain(struct rockchip_pcie *rockchip)
 	return 0;
 }
 
-static u32 rockchip_pcie_get_ltssm(struct rockchip_pcie *rockchip)
+static u32 rockchip_pcie_get_ltssm_status_reg(struct rockchip_pcie *rockchip)
 {
 	return rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_LTSSM_STATUS);
 }
@@ -195,7 +195,7 @@ static void rockchip_pcie_disable_ltssm(struct rockchip_pcie *rockchip)
 static bool rockchip_pcie_link_up(struct dw_pcie *pci)
 {
 	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
-	u32 val = rockchip_pcie_get_ltssm(rockchip);
+	u32 val = rockchip_pcie_get_ltssm_status_reg(rockchip);
 
 	return FIELD_GET(PCIE_LINKUP_MASK, val) == PCIE_LINKUP;
 }
@@ -460,7 +460,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
 	rockchip_pcie_writel_apb(rockchip, reg, PCIE_CLIENT_INTR_STATUS_MISC);
 
 	dev_dbg(dev, "PCIE_CLIENT_INTR_STATUS_MISC: %#x\n", reg);
-	dev_dbg(dev, "LTSSM_STATUS: %#x\n", rockchip_pcie_get_ltssm(rockchip));
+	dev_dbg(dev, "LTSSM_STATUS: %#x\n", rockchip_pcie_get_ltssm_status_reg(rockchip));
 
 	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
 		if (rockchip_pcie_link_up(pci)) {
@@ -487,7 +487,7 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
 	rockchip_pcie_writel_apb(rockchip, reg, PCIE_CLIENT_INTR_STATUS_MISC);
 
 	dev_dbg(dev, "PCIE_CLIENT_INTR_STATUS_MISC: %#x\n", reg);
-	dev_dbg(dev, "LTSSM_STATUS: %#x\n", rockchip_pcie_get_ltssm(rockchip));
+	dev_dbg(dev, "LTSSM_STATUS: %#x\n", rockchip_pcie_get_ltssm_status_reg(rockchip));
 
 	if (reg & PCIE_LINK_REQ_RST_NOT_INT) {
 		dev_dbg(dev, "hot reset or link-down reset\n");

-- 
2.51.0


