Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE20CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8l3hhh0BJXqGQJ0LjwbL4s0v/PSbE1SJ4uhUYSBBQeA=; b=O7P3ZRgIcEriT2r8VumaaOtrR+
	GAqv+cBOsdCV3TY8lufh9x1wBSE+QcagEivmbOJ80G0fzitrpvFL+Y4whBztXx9U+2havpJoWKbg5
	/4T4ZL+rsI7z3MQmFHgr2whu03xkjV8FnzM1Y131GSN63bb19yOtNwPydWG1LrUUuMLsl9+gXAAAb
	rLuDayb7o66s7L4zTA9++cHAUjQ6xTSmBeN4LYZ5lOXZS8eZU7DcMqtt7pF7Aw2IHrMz4DjNsrrGT
	Gd/iHz7JFA+SEJ4S3xOZJjVaaAA0TI9eMFFLgKKwJPbeEjDq8DIF4C9jj0yASeFvxqPqNP6kU15B+
	05wtmhsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAQR-00000002Isw-3C6k;
	Wed, 29 Oct 2025 17:57:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAQ1-00000002IRW-28W2;
	Wed, 29 Oct 2025 17:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761760622;
	bh=P089A2E+Yx4OzfNu1PedtURbJw0D3+0WliIVTgNh9oM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nLgG/oWa8uLS1lDc6moMj4xLneOSVBAen/YSCWNrNd3s0lSOyZd0RRnq9y/3CgHpI
	 jt+9y4KUL3RZBAFAhk5bWFP2R9c8rqBuPM0ONmq24+6N8z6Z+v3tPoKf1VmCFlQEkB
	 Nf1D1rbU+WjSHYBgYR5QCQxqXWXNy7X8wRxMZ56KQzYNRg+6Tfok6lEBKz/2oEiXll
	 33RjIeisikpwDq7UO/GHHJ4VSzlmD3cQp99kySNJjUdTpLqm3oBgPcaRSHk8DrbqQe
	 vUtk+tfffBl87053UkcF/k7v17JincHeHhC4kgrkUTsMLSw6ZLZiHBYVUT5mEKOytL
	 p0KvpWnwOhhyA==
Received: from jupiter.universe (dyndsl-091-248-085-053.ewe-ip-backbone.de [91.248.85.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC20417E1406;
	Wed, 29 Oct 2025 18:57:02 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 23994480065; Wed, 29 Oct 2025 18:57:02 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 29 Oct 2025 18:56:46 +0100
Subject: [PATCH v4 7/9] PCI: dw-rockchip: Add pme_turn_off support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-rockchip-pcie-system-suspend-v4-7-ce2e1b0692d2@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3128;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=P089A2E+Yx4OzfNu1PedtURbJw0D3+0WliIVTgNh9oM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGkCVW1Wt1a/xsLih4NUKwQilYZGT5JbSjfLy
 F+sq7zgeGgJV4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpAlVtAAoJENju1/PI
 O/qarBYQAKRbmJ3JJI3lbkEWqfHq5RikyR+GXm6YOa3t457RVmznsMBtGcpWpVEvy//BBlKOigh
 wxWhnqT98WHoDwJrvt3HoTWtJS+8f+xYPZIn4JQKtnXU1RQiTIFhK5Xjor1JhkTErPJJnO/69Pf
 /U9nP8+xPlXvmV5jh0WydvgE7UaZcjqoVSVi62O2FyrzJZhwcVyEHQkFf9mOzTOoVJoVVWE3x0P
 LCld4ZmDSUeumXiBDPRBXIUnLnB+6Oa+lTydcn0i/wSeQKnoU9DU7d79E4JN0v7mfAVkYG35TmW
 Uv+jtKhoKsSVQ8m5JXlw7eb+IvpBUlWZ0hcDLDQMaQJ7fD2zIJlNtMoC3nnfCCkQi9LCnC6cKoh
 J4EyQHfI9ekNe6qQlXEDyYomFs5pVoDhOcwiLON3Gsf53E7lDN1z77XX6nw+zeWdueLTBwig/UE
 6Ig2MRx4nsmVFAPzBaCsi9ObqmPIx0ALxYkVKl1cuRvNFpTUaOPxfiZ0Pc5W9uTqnTdLCAi3F7y
 rH43eo68SneRceVeT4jRWBSCBnuZ6oPddoZ+uVQvRVklsyRSY7hWyGy7EGRlkteROrr/r1ErnRj
 nYlvWGNvw4AxGOmOjS/mm1JS1dJ6Nbdl+BgSG6fUvSi09b6NJmKaBRjZY50MT9JpdM4ozhDTUKz
 RIMgY3HmK+Sk0t3u/RUssxQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_105709_718055_633C4BA9 
X-CRM114-Status: GOOD (  15.36  )
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

Co-developed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index ad4a907c991f..d887513a63d6 100644
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
 
 /* Hot Reset Control Register */
 #define PCIE_CLIENT_HOT_RESET_CTRL	0x180
@@ -277,8 +283,46 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
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


