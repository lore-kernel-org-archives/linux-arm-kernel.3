Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501FB106ACD0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q894oIJ4bYAg9Q9C0Fcsffh5Nho2Uop1nYGfUhyAYk8=; b=TIY+NXVccsqNPxfQZNowX6pHlk
	DJwFm+vFDBHPa7fQZnZ3joi9+4YH67P10PgjS/aMb47Xn3envZaYuow6B9QKZaA//fge0HxLYvQOZ
	h0/iK6fZscKPbURHGHbjQXQ+CbBg8dRyv9MPjXNs1SsjcDuTixwmJdpJLlzC4s9Sd+vrZMqElvhOr
	kQmThBL3DaQ4lJzFkdZtDUDoo9em/rE/7jBi8fkq2S46Y6RJzrdmxSADGCkLS0gKLgHpwvbd6GKaO
	ozMgb1WuWvE7VDdPUj712H0vHG/+1dLUViuFOQEQTvnweClE1TW3U3SllrUVAKa8qCMJsFJs5HWV8
	4D9rd7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3J-0000000EaPT-3f2l;
	Thu, 12 Mar 2026 16:38:25 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3A-0000000EaFo-10vb;
	Thu, 12 Mar 2026 16:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=q8
	94oIJ4bYAg9Q9C0Fcsffh5Nho2Uop1nYGfUhyAYk8=; b=RVkOivPLF2oYlKsoob
	P2TTQrKWrtIY8AWtdHGOKmIFQ9Xd0hP8UhOn5PkVq8pnTqmphsbqFr1qkT8ZfZMs
	VVEphoq6HJmOjkFghoK3j6OdMWYMUW/BrUFmpQHehmcnMAJVe8RGRni5cWucza6A
	aOV65GcMc6Eqrw4cVf0Ju4toc=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnN1Gl67JpMC_OAQ--.12929S4;
	Fri, 13 Mar 2026 00:37:00 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	jingoohan1@gmail.com,
	mani@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	florian.fainelli@broadcom.com,
	jim2101024@gmail.com
Cc: robh@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v8 2/5] PCI: dwc: Use pcie_get_link_speed() helper for safe array access
Date: Fri, 13 Mar 2026 00:36:49 +0800
Message-Id: <20260312163652.113228-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312163652.113228-1-18255117159@163.com>
References: <20260312163652.113228-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnN1Gl67JpMC_OAQ--.12929S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3GFWrCFW8Jr4UXw15GF4UArb_yoW7KFWUpa
	y5tFyIyF18JF45ur4Yyas5ZFyYqFnxCrW7GwsxW3Z29FyakrZxKa48tFWftryfKFsFvry3
	Kr17t3W7CF13tr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zidHUfUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:1caf:6d92:f4ee:5e02]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wwt0Gmy66zEeQAA37
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_093816_626857_C6BA6B1F 
X-CRM114-Status: GOOD (  14.63  )
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

Replace direct indexing of pcie_link_speed[] with the new helper
pcie_get_link_speed() in all DesignWare core and glue drivers. This
ensures that out-of-range generation numbers do not cause out-of-bounds
accesses when the helper returns PCI_SPEED_UNKNOWN, and prepares for
the removal of the range check in of_pci_get_max_link_speed().

The actual validation of the "max-link-speed" DT property (e.g., fallback
to a safe default and warning) is added in subsequent patches for each
driver that reads the property.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
 drivers/pci/controller/dwc/pcie-designware.c      | 2 +-
 drivers/pci/controller/dwc/pcie-qcom-common.c     | 2 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         | 4 ++--
 drivers/pci/controller/dwc/pcie-qcom.c            | 6 +++---
 drivers/pci/controller/dwc/pcie-tegra194.c        | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 6ae6189e9b8a..0e05c5280344 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1081,7 +1081,7 @@ static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed sp
 static void dw_pcie_config_presets(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	enum pci_bus_speed speed = pcie_link_speed[pci->max_link_speed];
+	enum pci_bus_speed speed = pcie_get_link_speed(pci->max_link_speed);
 
 	/*
 	 * Lane equalization settings need to be applied for all data rates the
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 5741c09dde7f..06792ba92aa7 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -861,7 +861,7 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
 	ctrl2 = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCTL2);
 	ctrl2 &= ~PCI_EXP_LNKCTL2_TLS;
 
-	switch (pcie_link_speed[pci->max_link_speed]) {
+	switch (pcie_get_link_speed(pci->max_link_speed)) {
 	case PCIE_SPEED_2_5GT:
 		link_speed = PCI_EXP_LNKCTL2_TLS_2_5GT;
 		break;
diff --git a/drivers/pci/controller/dwc/pcie-qcom-common.c b/drivers/pci/controller/dwc/pcie-qcom-common.c
index 01c5387e53bf..5aa73c628737 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-common.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-common.c
@@ -22,7 +22,7 @@ void qcom_pcie_common_set_equalization(struct dw_pcie *pci)
 	 * applied.
 	 */
 
-	for (speed = PCIE_SPEED_8_0GT; speed <= pcie_link_speed[pci->max_link_speed]; speed++) {
+	for (speed = PCIE_SPEED_8_0GT; speed <= pcie_get_link_speed(pci->max_link_speed); speed++) {
 		if (speed > PCIE_SPEED_32_0GT) {
 			dev_warn(dev, "Skipped equalization settings for unsupported data rate\n");
 			break;
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 18460f01b2c6..4b7184d4a6fa 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -152,7 +152,7 @@
 #define WAKE_DELAY_US				2000 /* 2 ms */
 
 #define QCOM_PCIE_LINK_SPEED_TO_BW(speed) \
-		Mbps_to_icc(PCIE_SPEED2MBS_ENC(pcie_link_speed[speed]))
+		Mbps_to_icc(PCIE_SPEED2MBS_ENC(pcie_get_link_speed(speed)))
 
 #define to_pcie_ep(x)				dev_get_drvdata((x)->dev)
 
@@ -531,7 +531,7 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 
 	qcom_pcie_common_set_equalization(pci);
 
-	if (pcie_link_speed[pci->max_link_speed] == PCIE_SPEED_16_0GT)
+	if (pcie_get_link_speed(pci->max_link_speed) == PCIE_SPEED_16_0GT)
 		qcom_pcie_common_set_16gt_lane_margining(pci);
 
 	/*
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 67a16af69ddc..5c7c105bb745 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -170,7 +170,7 @@
 #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
 
 #define QCOM_PCIE_LINK_SPEED_TO_BW(speed) \
-		Mbps_to_icc(PCIE_SPEED2MBS_ENC(pcie_link_speed[speed]))
+		Mbps_to_icc(PCIE_SPEED2MBS_ENC(pcie_get_link_speed(speed)))
 
 struct qcom_pcie_resources_1_0_0 {
 	struct clk_bulk_data *clks;
@@ -320,7 +320,7 @@ static int qcom_pcie_start_link(struct dw_pcie *pci)
 
 	qcom_pcie_common_set_equalization(pci);
 
-	if (pcie_link_speed[pci->max_link_speed] == PCIE_SPEED_16_0GT)
+	if (pcie_get_link_speed(pci->max_link_speed) == PCIE_SPEED_16_0GT)
 		qcom_pcie_common_set_16gt_lane_margining(pci);
 
 	/* Enable Link Training state machine */
@@ -1579,7 +1579,7 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 				ret);
 		}
 	} else if (pcie->use_pm_opp) {
-		freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
+		freq_mbps = pcie_dev_speed_mbps(pcie_get_link_speed(speed));
 		if (freq_mbps < 0)
 			return;
 
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 06571d806ab3..47f08adfbd79 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -310,7 +310,7 @@ static void tegra_pcie_icc_set(struct tegra_pcie_dw *pcie)
 	speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, val);
 	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, val);
 
-	val = width * PCIE_SPEED2MBS_ENC(pcie_link_speed[speed]);
+	val = width * PCIE_SPEED2MBS_ENC(pcie_get_link_speed(speed));
 
 	if (icc_set_bw(pcie->icc_path, Mbps_to_icc(val), 0))
 		dev_err(pcie->dev, "can't set bw[%u]\n", val);
-- 
2.34.1


