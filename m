Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023C4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 23:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R/OhoPPBTzc3LPiEVOqTj2N7bTO/EHX3LN9XksDcbPw=; b=VknEt9YojwFj5k6VYsCk36cHTr
	/ks+WLZNqhT3iaqZtF5hi1F5H+6MGdOmm5/6MuuPmgELARHgQMvoUmNsMkHD7QS0ODZtSeLIo77he
	oFS6hM/trWbcsvf+kzqq/FvKuIxgY0fhFIxgIEADrnJHyTgQkL4S/EiDW7wRoeP9cWh+TSxpcWaG2
	UlUBgYVKMedvugaY8N9kOVRamIkVxzLGdx76vv6giydF/bfNdQglyzR93YqGuBcert+wmX4b5W0Ke
	+RKeWDfbqqJmEl/sY+aLP+QgoIuki8WnJQWVG/yiOn6dWMrhMzP0y+IA0ZIwbU08v1IpiuwCGBeQt
	+HAqjcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfYr-0000000A9nk-1QGL;
	Wed, 08 Jan 2025 23:34:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfX7-0000000A9Sp-3QSs;
	Wed, 08 Jan 2025 23:32:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B833F5C542F;
	Wed,  8 Jan 2025 23:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B0CC4AF0C;
	Wed,  8 Jan 2025 23:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736379088;
	bh=GiFdQ5UtYcRYcp3zYYBYEPklXgFurcCnVm6n3PHnxS4=;
	h=From:Date:Subject:To:Cc:From;
	b=T4BNrrHl85zlnYCSFcnydKLUpbyeiEbSFAIQKlfT9kmdA4WPJBsHhPwOPqt+FAAJI
	 wdxdoc7/ckxgK5+8AeTFvi6dN6h56k2PlVqF+0SHi2V9Og1eQs74ojuz6ivsgTnP9N
	 Lo8x5h1RWI/I2UpoNtbLOMT6HLRyBDwKeSBFFgaFZRluaF/QeKMNzilsnqlck4xGkj
	 JA8Gpx1CRHFscY2vGao5y/z5lunNkLansocBlQZ8NlDB30e0jb3xaO1sRSuTvTW4je
	 QgsDVXEqwptaex83Rj3AXYAlc+6kt9CWP2rXVjjBCAlDaTQ9x24Z6g5w2XJLSA2aCb
	 wqSzOVqrkRY/Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 09 Jan 2025 00:30:45 +0100
Subject: [PATCH v4] PCI: mediatek-gen3: Avoid PCIe resetting via PERST# for
 Airoha EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-pcie-en7581-rst-fix-v4-1-4a45c89fb143@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKQKf2cC/x2MQQqAIBAAvxJ7bkEXResr0SF0q71YaEQg/T3pO
 AMzFQpn4QJjVyHzLUWO1MD0HYR9SRujxMZAiqzSyuMZhJGTs15jLheu8qAzjsjbSHrQ0Mozc9P
 /dZrf9wOnOeLEZQAAAA==
X-Change-ID: 20250108-pcie-en7581-rst-fix-7472285d2191
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Hui Ma <hui.ma@airoha.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_153217_936548_4A8935F6 
X-CRM114-Status: GOOD (  17.03  )
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

Airoha EN7581 has a hw bug asserting/releasing PERST# signal causing
occasional PCIe link down issues. In order to overcome the problem,
PERST# signal is not asserted/released during device probe or
suspend/resume phase and the PCIe block is reset using
en7523_reset_assert() and en7581_pci_enable().

Introduce flags field in the mtk_gen3_pcie_pdata struct in order to
specify per-SoC capabilities.

Tested-by: Hui Ma <hui.ma@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v4:
- fix typos and comments
- Link to v3: https://lore.kernel.org/r/20241113-pcie-en7581-rst-fix-v3-1-23c5082335f7@kernel.org

Changes in v3:
- cosmetics
- Link to v2: https://lore.kernel.org/r/20241104-pcie-en7581-rst-fix-v2-1-ffe5839c76d8@kernel.org

Changes in v2:
- introduce flags field in mtk_gen3_pcie_flags struct instead of adding
  reset callback
- fix the leftover case in mtk_pcie_suspend_noirq routine
- add more comments
- Link to v1: https://lore.kernel.org/r/20240920-pcie-en7581-rst-fix-v1-1-1043fb63ffc9@kernel.org
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 59 ++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index be52e3a123abd0d0086f9f1a603e3abaa18f319f..74dfef8ce9ec1bbc28c4a25cd1025f92ba3638a7 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -133,10 +133,18 @@ struct mtk_gen3_pcie;
 #define PCIE_CONF_LINK2_CTL_STS		(PCIE_CFG_OFFSET_ADDR + 0xb0)
 #define PCIE_CONF_LINK2_LCR2_LINK_SPEED	GENMASK(3, 0)
 
+enum mtk_gen3_pcie_flags {
+	SKIP_PCIE_RSTB	= BIT(0), /* Skip PERST# assertion during device
+				   * probing or suspend/resume phase to
+				   * avoid hw bugs/issues.
+				   */
+};
+
 /**
  * struct mtk_gen3_pcie_pdata - differentiate between host generations
  * @power_up: pcie power_up callback
  * @phy_resets: phy reset lines SoC data.
+ * @flags: pcie device flags.
  */
 struct mtk_gen3_pcie_pdata {
 	int (*power_up)(struct mtk_gen3_pcie *pcie);
@@ -144,6 +152,7 @@ struct mtk_gen3_pcie_pdata {
 		const char *id[MAX_NUM_PHY_RESETS];
 		int num_resets;
 	} phy_resets;
+	u32 flags;
 };
 
 /**
@@ -438,22 +447,33 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
 	writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
 
-	/* Assert all reset signals */
-	val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
-	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
-	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
-
 	/*
-	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
-	 * and 2.2.1 (Initial Power-Up (G3 to S0)).
-	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
-	 * for the power and clock to become stable.
+	 * Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
+	 * causing occasional PCIe link down. In order to overcome the issue,
+	 * PCIE_RSTB signals are not asserted/released at this stage and the
+	 * PCIe block is reset using en7523_reset_assert() and
+	 * en7581_pci_enable().
 	 */
-	msleep(100);
-
-	/* De-assert reset signals */
-	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
-	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
+		/* Assert all reset signals */
+		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
+		val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
+		       PCIE_PE_RSTB;
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+
+		/*
+		 * Described in PCIe CEM specification revision 6.0.
+		 *
+		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
+		 * for the power and clock to become stable.
+		 */
+		msleep(PCIE_T_PVPERL_MS);
+
+		/* De-assert reset signals */
+		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
+			 PCIE_PE_RSTB);
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
 
 	/* Check if the link is up or not */
 	err = readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val,
@@ -1231,10 +1251,12 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
 		return err;
 	}
 
-	/* Pull down the PERST# pin */
-	val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
-	val |= PCIE_PE_RSTB;
-	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
+		/* Assert the PERST# pin */
+		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
+		val |= PCIE_PE_RSTB;
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
 
 	dev_dbg(pcie->dev, "entered L2 states successfully");
 
@@ -1285,6 +1307,7 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
 		.id[2] = "phy-lane2",
 		.num_resets = 3,
 	},
+	.flags = SKIP_PCIE_RSTB,
 };
 
 static const struct of_device_id mtk_pcie_of_match[] = {

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20250108-pcie-en7581-rst-fix-7472285d2191

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


