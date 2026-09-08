Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5FDC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K362LUcIHCx1ISIeEWiRFxl4f7U5Izr6QENaEXFnmsg=; b=bs9XiW8l+b5Kaqr0H6MovOo3d7
	KzKqO/XgKZR7PC+sKZirCmX/iBml4r4VGM0SaqFvfOrNyjPgKiO54sdJLZm3EidksWpI0btw8eN5V
	uqgJ/qdckqOh9labW34qif7j99kqLV5Hk2TqsDdGQFJiQNedV2c7ygrWz3z5VwfWuR6Xsr+Yy7P5F
	jpQ2TuIxIs5orUIuF+gyih/jNe5Q95KI03TZCeKvx5dGJzQ6mxytLhS5cYCn/n95mZMa8vAWyLJKL
	brEGOcHHdWs7Y6kW4/d0c7yPn/ABskucVb19VKHIIbkhm0HDHgqsY5bpYITp0N+e2qAZ+fYiwJdCD
	VHGkNdew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAt-00000009KIN-3FwI;
	Tue, 08 Sep 2026 14:51:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAo-00000009KC4-2nuQ;
	Tue, 08 Sep 2026 14:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788879101;
	bh=pQ075WLFf2brXAVxwHCIqRV7MiZ2UQ9bz57J6cuXjls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tlr2ZA8xG8wupPbHFg9adiM37IzUpaw5DIVzYbhDijv9DA17+mrqZFRk65xYfRwiR
	 8a0CRf1mx3QWt1+636B/HbF0n9eXQUQBE4jNvB3EBL3AVrOvTz+uCxM2mWjcdefVvL
	 u0zGkbOPIlU6dRNLpONP4FMOD0QHhxq4RmOYobKVV1Nz4Tv4it8soBwKhwd0t6Y10m
	 8Ty+TkI+AIkKsfsdLD37uucyxpSiN7hwLYfWpTZ9OzXEKtF64l3Ltzp6dFk1LW+Nms
	 5yLvLBOtESuEsTRQFdrkamDPibFzYFDvceuUYurdPAkcarG9jhxI4YIkdEQESEH+nq
	 33sfrsABq5cLA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 35DD017E0D7F;
	Tue, 08 Sep 2026 16:51:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 95DE1480038; Tue, 08 Sep 2026 16:51:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 08 Sep 2026 16:51:24 +0200
Subject: [PATCH v6 06/10] PCI: dw-rockchip: Add helper function for DDL
 indicator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-rockchip-pcie-system-suspend-v6-6-fbabcca9921b@collabora.com>
References: <20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com>
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=pQ075WLFf2brXAVxwHCIqRV7MiZ2UQ9bz57J6cuXjls=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqgIPxanYSFeNaTKI80U9Qk5pMvLkD/tATIm
 bJl2oJDZLST14kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqoCD8AAoJENju1/PI
 O/qaIeQP/2bqoeDyDW7+kPK44HOhBltY6S7QNU3cZa+i6Q8PIxcsQXUjVfb8OoBsWSKB8YvIrqJ
 x2GzmmRTwNlvzcdaq3wZ6a9za/lmATJoLnM4gv+yC5Wfnq6+qcu2kDMrtLx/D3+Wih7WGF5cTyS
 jOAg4gzcf3HYU03/cpcp/xJsmdW+h3DPCrkp7Imf+6aOC6R1j+0PU3zC8IoJi0CdNC7SsIxncuZ
 seMM/55ddl9jWkM7TYyZGqjwYiKxP2QnAfLPhSXjAUHChHgGcOfZlSH4M/Odd81zwpTEiXNLhyt
 GsxLUxsgrV/SUSSqruNMuDhGdbOP6OTY2LIVHn4YSY24I7HKWZCFNofs5t9X7E6T8ntbMQkjfWx
 KO6sMZUfzbGdqKvlutq2Yv6Z78iTRLGvNZKdC9F0AVsRtadNIfOiV1N2WMqYHHXpYM96/icyLtj
 Shj0rNBUBWF9K+1SSFvGvzhcBEuFPghLKLE9VzxbZrURkfizsPdyLR9kqQDEbpZertOyAev1M85
 9maIGOXdasRs/KO18Lr2C6uP3q8fJSO3NRqjOFoMihM2+BTq6gKOnBejTEUx4dooDlTrghWq9GB
 FH2ZrblBWvvtF5HMubmv0DEvRxDAfs9ROGVY2RxT8FvVgt4xH20w9M6tA1vy70BRjhIKxPnkpxN
 TQYkvtHyh9gunyGptVQo3mw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_075146_860386_CC5F6557 
X-CRM114-Status: GOOD (  13.52  )
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
function to setup the DLL indicator.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 211776bbcb99..1e48099e36e4 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -713,6 +713,16 @@ static void rockchip_pcie_set_controller_mode(struct rockchip_pcie *rockchip, u3
 	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_SET_MODE(mode), PCIE_CLIENT_GENERAL_CON);
 }
 
+static void rockchip_pcie_unmask_dll_indicator(struct rockchip_pcie *rockchip)
+{
+	u32 val;
+
+	/* unmask DLL up/down indicator and hot reset/link-down reset */
+	val = FIELD_PREP_WM16(PCIE_RDLH_LINK_UP_CHGED, 0) |
+	      FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
+}
+
 static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 				      struct rockchip_pcie *rockchip)
 {
@@ -760,7 +770,6 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	int irq, ret;
-	u32 val;
 
 	if (!IS_ENABLED(CONFIG_PCIE_ROCKCHIP_DW_EP))
 		return -ENODEV;
@@ -800,10 +809,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 
 	pci_epc_init_notify(rockchip->pci.ep.epc);
 
-	/* unmask DLL up/down indicator and hot reset/link-down reset */
-	val = FIELD_PREP_WM16(PCIE_RDLH_LINK_UP_CHGED, 0) |
-	      FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
+	rockchip_pcie_unmask_dll_indicator(rockchip);
 
 	return ret;
 }

-- 
2.53.0


