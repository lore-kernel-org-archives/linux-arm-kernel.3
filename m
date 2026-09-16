Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A707C982CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CcYzq1fPBKkeFjAunrawbz06tsDi+w7l4bgn1rNWTU=; b=nSQi/YoHDHzgT+y+LtcmtdWYm9
	kdDDG7Y+RDs+NXL4hDN/dId3lnOUil3K63MtMDcbRnDUDwmST5ovNP/SOPmcwErTGeOLvlH+9IDK4
	jwnwNeuL4jy4mMkuXgLrfAVWK6eDK64ULgbKdPUdok4uxujT715SWbjL6+YZI2gRA7JWUAtPygQDj
	576fy8pk2r/CyZQBFUjqqPTmO3i5KDB9BdWqsIyqX8OGM+hzF0tM9bZbIN3lgnUbmmTTGMWyUrQ+4
	MVqHQJtIE1ruS82N61DxVMrpz4jchf13bVawdJP/syav7qIwWnFFUDIxFpnqPc9vX9L251e2j0V47
	q2awdOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rjw-00000009byW-1PBN;
	Wed, 16 Sep 2026 15:40:04 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rjn-00000009boA-3LrQ;
	Wed, 16 Sep 2026 15:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+C
	cYzq1fPBKkeFjAunrawbz06tsDi+w7l4bgn1rNWTU=; b=Iwjw8jhDmstaC72nRm
	WmlNYw2GD3Nnzb13EYpSEXZ5CL5Y5iow7+ve5z3uIgFAwybzkiE6G0y7kOMUgJr9
	Wa9H1KnPSwrB+4gkX94+XfIeiAv3lRXLYFfDwpgFbXrnDKBRuhAiqJfqGQj5GeOn
	znutz6hKemPIM1Q2xikS210eg=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnbxQduKpqGzAlBA--.54876S5;
	Wed, 16 Sep 2026 23:39:13 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	heiko@sntech.de,
	mani@kernel.org,
	yue.wang@Amlogic.com
Cc: pali@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	cassel@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v9 3/3] PCI: dwc: Remove redundant MPS configuration
Date: Wed, 16 Sep 2026 23:39:07 +0800
Message-Id: <20260916153907.60344-4-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916153907.60344-1-18255117159@163.com>
References: <20260916153907.60344-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnbxQduKpqGzAlBA--.54876S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxury8Kr15XF43Gw4ftrWkWFg_yoW5trWfpF
	y3WF4vkF4rJr45Wr4qkan5Ca13tFnxAr17Jr9rWw4Sv3ZIyFsrJa4akFWFk3yxXrWDWF9Y
	krn8Gr48Z3Wrtr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziBT5dUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:a95a:12fc:887a:b0f1]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wF7H2qquCHiEAAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_083956_207088_52899485 
X-CRM114-Status: GOOD (  11.80  )
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

The Meson PCIe controller driver manually configures maximum payload
size (MPS) through meson_set_max_payload, duplicating functionality now
centralized in the PCI core.  Deprecating redundant code simplifies the
driver and aligns it with the consolidated MPS management strategy,
improving long-term maintainability.

With meson_set_max_payload() gone, meson_size_to_payload() is only used
for MRRS.  Rename it to meson_size_to_mrrs(), update the warning message,
and drop the now-unused PCIE_CAP_MAX_PAYLOAD_SIZE and MAX_PAYLOAD_SIZE
macros.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 8559d132dcde..1d3687566dda 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -21,7 +21,6 @@
 
 #define to_meson_pcie(x) dev_get_drvdata((x)->dev)
 
-#define PCIE_CAP_MAX_PAYLOAD_SIZE(x)	((x) << 5)
 #define PCIE_CAP_MAX_READ_REQ_SIZE(x)	((x) << 12)
 
 /* PCIe specific config registers */
@@ -37,7 +36,6 @@
 #define PM_CURRENT_STATE(x)		(((x) >> 7) & 0x1)
 
 #define PORT_CLK_RATE			100000000UL
-#define MAX_PAYLOAD_SIZE		256
 #define MAX_READ_REQ_SIZE		256
 #define PCIE_RESET_DELAY		500
 #define PCIE_SHARED_RESET		1
@@ -256,7 +254,7 @@ static void meson_pcie_ltssm_enable(struct meson_pcie *mp)
 	meson_cfg_writel(mp, val, PCIE_CFG0);
 }
 
-static int meson_size_to_payload(struct meson_pcie *mp, int size)
+static int meson_size_to_mrrs(struct meson_pcie *mp, int size)
 {
 	struct device *dev = mp->pci.dev;
 
@@ -266,35 +264,19 @@ static int meson_size_to_payload(struct meson_pcie *mp, int size)
 	 * than 2^12, just set to default size 2^(1+7).
 	 */
 	if (!is_power_of_2(size) || size < 128 || size > 4096) {
-		dev_warn(dev, "payload size %d, set to default 256\n", size);
+		dev_warn(dev, "MRRS %d, set to default 256\n", size);
 		return 1;
 	}
 
 	return fls(size) - 8;
 }
 
-static void meson_set_max_payload(struct meson_pcie *mp, int size)
-{
-	struct dw_pcie *pci = &mp->pci;
-	u32 val;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-	int max_payload_size = meson_size_to_payload(mp, size);
-
-	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
-	val &= ~PCI_EXP_DEVCTL_PAYLOAD;
-	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
-
-	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
-	val |= PCIE_CAP_MAX_PAYLOAD_SIZE(max_payload_size);
-	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
-}
-
 static void meson_set_max_rd_req_size(struct meson_pcie *mp, int size)
 {
 	struct dw_pcie *pci = &mp->pci;
 	u32 val;
 	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-	int max_rd_req_size = meson_size_to_payload(mp, size);
+	int max_rd_req_size = meson_size_to_mrrs(mp, size);
 
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
 	val &= ~PCI_EXP_DEVCTL_READRQ;
@@ -363,7 +345,6 @@ static int meson_pcie_host_init(struct dw_pcie_rp *pp)
 
 	pp->bridge->ops = &meson_pci_ops;
 
-	meson_set_max_payload(mp, MAX_PAYLOAD_SIZE);
 	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
 
 	return 0;
-- 
2.34.1


