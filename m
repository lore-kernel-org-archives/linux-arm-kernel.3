Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FDAC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 17:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gl11OPX80cgoQ96lpDm8YOIC2yE90hWsJxNKd3hvQjY=; b=kYRGNNrd1pml8u26XRj0AXuoTE
	SNyWB/XzLNnhNwUhy8wav+a9uMwy3PhfFI4zoZGIkvzErvulRzFNVX6tSSPLwbMPfNwGcoDCpAkL0
	ANTpags8ECxciWDtpG44isBtnhzMjALiKJJrTco2sIJDvAqBZtVDKJ/pbIb7NbjaMZqDYCAceFt9E
	3Y5SGtDAZjDlxMQAo9ISZdb/zkoq5Vfzvk38ZMwpJi3rvIlmINzNiSN2Rjx+GEtc+GlajB8ahEf24
	nX+ffVeFwsxkJsO+k0YzlPrpKrQvjdQ+uGYJXHyLo4CAAI5Z2bWxdN995SEQcSPmWgQi8BfW7X0lf
	RVojKrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcppL-00000005UA1-0O1R;
	Tue, 28 Jan 2025 17:56:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpms-00000005TVR-09mM;
	Tue, 28 Jan 2025 17:54:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67B665C6136;
	Tue, 28 Jan 2025 17:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1F7C4CEE1;
	Tue, 28 Jan 2025 17:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086849;
	bh=uTwbAGSjoYcmoPMQdSqt8uRACDufhTf/5L9rzTY3n90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a6HDviyGfVHeSrpIL5DkIp26a2Blcsnv2V4ming+k5LEF7HvMT3jqTMQ4aXbjYsjz
	 a62l+Rqv6WxxoMUa9FQH/GclxE234l3DNZIVwst5j/XaZx5MFgkcKoE/n2+41i+0zO
	 mmkXYGK0T86xnR8b/zMe9216xMfHCWcX/+RSDvElhN9izQdTYkKP98st3QVsdoBWHY
	 ClldlPPcTcjmIFWkeSl0pmnBnylkZ3tJCVoUIHL8sJLqEK4yYoUMYwRgCxoKxEwPF0
	 BQ8Tyb9WhImr/rk0LLAYai1p/oqVK0TfYjGzX7EqKlCbLJxZRqY6mI18auONhZwa5n
	 1dXEM/v+eB8FA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Hui Ma <hui.ma@airoha.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.13 12/15] PCI: mediatek-gen3: Avoid PCIe resetting via PERST# for Airoha EN7581 SoC
Date: Tue, 28 Jan 2025 12:53:43 -0500
Message-Id: <20250128175346.1197097-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128175346.1197097-1-sashal@kernel.org>
References: <20250128175346.1197097-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_095410_162513_31BA83E7 
X-CRM114-Status: GOOD (  16.40  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit 491cb9c5084790aafa02e843349492c284373231 ]

Airoha EN7581 has a hw bug asserting/releasing PERST# signal causing
occasional PCIe link down issues. In order to overcome the problem,
PERST# signal is not asserted/released during device probe or
suspend/resume phase and the PCIe block is reset using
en7523_reset_assert() and en7581_pci_enable().

Introduce flags field in the mtk_gen3_pcie_pdata struct in order to
specify per-SoC capabilities.

Link: https://lore.kernel.org/r/20250109-pcie-en7581-rst-fix-v4-1-4a45c89fb143@kernel.org
Tested-by: Hui Ma <hui.ma@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 59 ++++++++++++++-------
 1 file changed, 41 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index be52e3a123abd..74dfef8ce9ec1 100644
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
-- 
2.39.5


