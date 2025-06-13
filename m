Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC9EC71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 11:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0zhQKz4Ee/Bx/7AaoaiAsvcUBTpZsPGbwdxDBI3hziA=; b=zI5JVBNe6h1Q3pIL09xumaKG1K
	lstX/RbNZVLxjhk+agP4SpXT2E2pf3VGPViOi1LQHizdaTYqDC9M4Np3HcVkWmWVMjVa9+FCcdpr7
	1Bb6P56pmLxDOjXfnKSEpeAnKphZstiOSweXW0yIaZF8Ckwx7ZdbHP4fkn3I01BX0Pv5DNUQNTByM
	cE9LPYHO2J6e7ZntnVQCLhX+qWS97i3ufdKstrcTKThN6R5hMNJ0sFQXPib6pmyCfpNUXpoE88Ya3
	pCLI2kSD0DJ1QjiivtWQWmmQAwQM7hPIgwIz1BHjJAi3ivBz+f63tE6lAvrkYKHKz3BZKm56asrro
	C5P/Hk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2co-0000000GBOe-26cp;
	Fri, 13 Jun 2025 11:31:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ1VE-0000000G3zE-2v4R;
	Fri, 13 Jun 2025 10:19:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08C82A50C1E;
	Fri, 13 Jun 2025 10:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6607EC4CEE3;
	Fri, 13 Jun 2025 10:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749809955;
	bh=njX/mlzpKVPxzlfofqg5PPE565FrxEuTn25GxNu82eI=;
	h=From:To:Cc:Subject:Date:From;
	b=kvr/67nKdYCR8A8E5zE4MaNfG5/hUQr6DBWoU6y1SMGIeiILwGzQPlWj9QfrESUSz
	 dHO41Nk3z4NMpQGhh2JETtD4PNSlubutNUESD3p1ey0DotXhlPsCLPQME6s/gr2q5e
	 kCB0jCFjU6yWFyEpWWQ6ihngnoKCmabZ5uq9wdhRtVFwPCYFbW6f5Ks796IxjlJzHw
	 E+sB9mLssVUzswmUoN7cojG9lU+2pT1+qWxbd516WAaI9YXYskvVSQLuFy4Q4tEOWE
	 TVhJNOnCfX6XvXx/UMsSoDAyDjTJRUNwaDRQ57bcF1SvkJ+u4SkHvUF83e2ikxo3MU
	 PSdBdoM99vBRA==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2] PCI: dw-rockchip: Delay link training after hot reset in EP mode
Date: Fri, 13 Jun 2025 12:19:09 +0200
Message-ID: <20250613101908.2182053-2-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3218; i=cassel@kernel.org; h=from:subject; bh=A0LONFhSyCrAhZKTdpj0VQlSUgSYu5k5R0omco5tlfE=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDK8f8vEWi+vadkicULgWd1i302S14oWza35oK+26e4zI yd9iZthHaUsDGJcDLJiiiy+P1z2F3e7TzmueMcGZg4rE8gQBi5OAZjI5KkM/91+LfnhVHzwYKbo tLAcRt1Nk237UpQedZgtU+nayj1b4h/Db9aPZlGFJ07+jsmoV6gql/Dqe9Dtq+76u3j9ZR9dTi1 ZPgA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_031916_880787_B60F1BCE 
X-CRM114-Status: GOOD (  13.23  )
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

RK3588 TRM, section "11.6.1.3.3 Hot Reset and Link-Down Reset" states that:
"""
If you want to delay link re-establishment (after reset) so that you can
reprogram some registers through DBI, you must set app_ltssm_enable =0
immediately after core_rst_n as shown in above. This can be achieved by
enable the app_dly2_en, and end-up the delay by assert app_dly2_done.
"""

I.e. setting app_dly2_en will automatically deassert app_ltssm_enable on
a hot reset, and setting app_dly2_done will re-assert app_ltssm_enable,
re-enabling link training.

When receiving a hot reset/link-down IRQ when running in EP mode, we will
call dw_pcie_ep_linkdown(), which will call the .link_down() callback in
the currently bound endpoint function (EPF) drivers.

The callback in an EPF driver can theoretically take a long time to
complete, so make sure that the link is not re-established until after
dw_pcie_ep_linkdown() (which calls the .link_down() callback(s)
synchronously).

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Co-developed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
Changes since v1:
-Rebased on v6.16-rc1

 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 93171a392879..cd1e9352b21f 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -58,6 +58,8 @@
 
 /* Hot Reset Control Register */
 #define PCIE_CLIENT_HOT_RESET_CTRL	0x180
+#define  PCIE_LTSSM_APP_DLY2_EN		BIT(1)
+#define  PCIE_LTSSM_APP_DLY2_DONE	BIT(3)
 #define  PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
 
 /* LTSSM Status Register */
@@ -474,7 +476,7 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
 	struct rockchip_pcie *rockchip = arg;
 	struct dw_pcie *pci = &rockchip->pci;
 	struct device *dev = pci->dev;
-	u32 reg;
+	u32 reg, val;
 
 	reg = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_STATUS_MISC);
 	rockchip_pcie_writel_apb(rockchip, reg, PCIE_CLIENT_INTR_STATUS_MISC);
@@ -485,6 +487,10 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
 	if (reg & PCIE_LINK_REQ_RST_NOT_INT) {
 		dev_dbg(dev, "hot reset or link-down reset\n");
 		dw_pcie_ep_linkdown(&pci->ep);
+		/* Stop delaying link training. */
+		val = HIWORD_UPDATE_BIT(PCIE_LTSSM_APP_DLY2_DONE);
+		rockchip_pcie_writel_apb(rockchip, val,
+					 PCIE_CLIENT_HOT_RESET_CTRL);
 	}
 
 	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
@@ -566,8 +572,11 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 		return ret;
 	}
 
-	/* LTSSM enable control mode */
-	val = HIWORD_UPDATE_BIT(PCIE_LTSSM_ENABLE_ENHANCE);
+	/*
+	 * LTSSM enable control mode, and automatically delay link training on
+	 * hot reset/link-down reset.
+	 */
+	val = HIWORD_UPDATE_BIT(PCIE_LTSSM_ENABLE_ENHANCE | PCIE_LTSSM_APP_DLY2_EN);
 	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
 
 	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_EP_MODE,
-- 
2.49.0


