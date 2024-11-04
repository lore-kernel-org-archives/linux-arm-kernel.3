Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292C7D1CA01
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 22:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VY9tkcWTPJUgfHHmT3U5Z7yTaauPqUOAetmWDprOH4c=; b=Xl0xF6zyCoyqcS+ORwMBPKPoKd
	gDzqZGwfsOb7NXe93RZZLPTC+I0Q8lI+UeZSdGVfSkupTf7rJygssYuDS+EskZtOv/jSSghlcnbZU
	HLlSWPFa/qXbDWNAYviBKgaKWqCz8ERrviWKGvCQzj3UNf3rEKJ8GELEPXdyr14Fx+WBnk8deZ2Vi
	a5fdDHC0m5Um3aEhOLo8r3GoiwsYA7oH2Zq1IR5vmdxnWCozm6SuSNKLL2Vb/pedw+jCqgOs/OFRw
	HroWzCja+ZvXgpWT1sZ1yrt4kZ5/F4GvWBxGqxZidS4lF2d358ZXOFLJq8Bu32XS+wlgJ+VMOWwDk
	34U57dGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t859k-0000000FFPb-2qeU;
	Mon, 04 Nov 2024 22:02:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8584-0000000FFIr-0hcX;
	Mon, 04 Nov 2024 22:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=VY9tkcWTPJUgfHHmT3U5Z7yTaauPqUOAetmWDprOH4c=; b=bcSGTo/XN1fFva9h7iZd06Q9ob
	1sN23pvjYZwwq231qYFFzUscXakKn4U4OqPf/l7VDsKdCX3/8M2ZDdL9EsS6UqzJuR2exyLjh6qCy
	djzXWVQq/K0P1xFS/tPvB40JCiyvSfPoWrOZdxtEFr5ZLHuR4WRJI8YUPv+3r53IOLobzzOf5nCtW
	OYqXXK9/DQKmU05LncUv+9lG7F+kdzzzpSTSrSZ5acjidUBtGXNS8w0IF3kA09I0J79Us5bSZlEo4
	XRf/p9GaZyPTCU0qCM1c8VXLgJW7n/9y3NXuuFmDmtZB9LvwK68FW5zgGdEHQ1aKNVPrLPvbFrIMW
	NWESqU5A==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t857t-0000000Bauk-3F07;
	Mon, 04 Nov 2024 22:00:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2AFA55C4CFB;
	Mon,  4 Nov 2024 21:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244E3C4CECE;
	Mon,  4 Nov 2024 22:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730757641;
	bh=+VNwD/bhJNlJ4Sdav4k2eb5Sxm4/XDUeAcINK2T1xvI=;
	h=From:Date:Subject:To:Cc:From;
	b=K4L6yKwAxI9ReGi4IgdFDHSO/dOJfh2+ybOFRdVjT/DKszNgF5Kl6ipHld/hwCJNn
	 gOPj0YYseZrnYeShBn2r2Mkh+ILYIpqYuaxY7WGomcgB7MQ1eLRfZFKOzCJSRJ19a6
	 f1VgxRpCDLS30PkTCetfZuJuij2SumKirrq1QuNH3XzGpvGoDlaskdHIV8r/fXdenZ
	 ila2hhWji/tXeixvKxSp9qN4hQZegVvfMUBCMUqEDdgWT/DWHk4JStfQHaJDuHhoKV
	 0WEY4MGrtEX4c1c9/M47N65YxJXrwjVKUNyFXWxMuhBzQiD0HZEvMG5CiGePbdzCW6
	 UKCH2nKUld2Hg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 04 Nov 2024 23:00:05 +0100
Subject: [PATCH v2] PCI: mediatek-gen3: Avoid PCIe resetting via PCIE_RSTB
 for Airoha EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241104-pcie-en7581-rst-fix-v2-1-ffe5839c76d8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAORDKWcC/32NQQ6CMBBFr0Jm7Zi2QAVX3sOw0DqFiaYlU9JoC
 He3cgDzV+8n//0VEglTgnO1glDmxDEUMIcK3HQLIyE/CoNRplG9UTg7JqRwajuNkhb0/MZOW23
 bzunaNVCWs1Cpd+t1KDxxWqJ89pOsf+1/X9ZYopra323tvesvT5JAr2OUEYZt274ZHstQtwAAA
 A==
X-Change-ID: 20240920-pcie-en7581-rst-fix-8161658c13c4
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, Hui Ma <hui.ma@airoha.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_220046_423234_3804A79B 
X-CRM114-Status: GOOD (  16.86  )
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

Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
causing occasional PCIe link down issues. In order to overcome the
problem, PCIE_RSTB signals are not asserted/released during device probe or
suspend/resume phase and the PCIe block is reset using REG_PCI_CONTROL
(0x88) and REG_RESET_CONTROL (0x834) registers available via the clock
module.
Introduce flags field in the mtk_gen3_pcie_pdata struct in order to
specify per-SoC capabilities.

Tested-by: Hui Ma <hui.ma@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
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
index 66ce4b5d309bb6d64618c70ac5e0a529e0910511..8e4704ff3509867fc0ff799e9fb99e71e46756cd 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -125,10 +125,18 @@
 
 struct mtk_gen3_pcie;
 
+enum mtk_gen3_pcie_flags {
+	SKIP_PCIE_RSTB	= BIT(0), /* skip PCIE_RSTB signals configuration
+				   * during device probing or suspend/resume
+				   * phase in order to avoid hw bugs/issues.
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
@@ -136,6 +144,7 @@ struct mtk_gen3_pcie_pdata {
 		const char *id[MAX_NUM_PHY_RESETS];
 		int num_resets;
 	} phy_resets;
+	u32 flags;
 };
 
 /**
@@ -402,22 +411,33 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
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
+	 * PCIe block is reset using REG_PCI_CONTROL (0x88) and
+	 * REG_RESET_CONTROL (0x834) registers available via the clock module.
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
+		 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
+		 * and 2.2.1 (Initial Power-Up (G3 to S0)).
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
@@ -1160,10 +1180,12 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
 		return err;
 	}
 
-	/* Pull down the PERST# pin */
-	val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
-	val |= PCIE_PE_RSTB;
-	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
+		/* Pull down the PERST# pin */
+		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
+		val |= PCIE_PE_RSTB;
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
 
 	dev_dbg(pcie->dev, "entered L2 states successfully");
 
@@ -1214,6 +1236,7 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
 		.id[2] = "phy-lane2",
 		.num_resets = 3,
 	},
+	.flags = SKIP_PCIE_RSTB,
 };
 
 static const struct of_device_id mtk_pcie_of_match[] = {

---
base-commit: 3102ce10f3111e4c3b8fb233dc93f29e220adaf7
change-id: 20240920-pcie-en7581-rst-fix-8161658c13c4

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


