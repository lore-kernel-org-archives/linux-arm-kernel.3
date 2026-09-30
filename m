Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EB7CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhAtJfHaHtYaOU+oIY0SPZU9mOxMhuThiOOTuvPUlOE=; b=0+pXTQbkMvz/lv5eCPtDJvYfoE
	0LY6Js5EVomelMzr2gkjSqiy6M5iUAmJWGKXq7F/5Nx/AizSm8c/RczkKGDbC+57opIKBxLGglqmx
	CB1pG3Yebu9CKmpcTGrU7mrB9HySIYXN4almwFtwLZ6vggwMjkdtpnAASeTwua/GyNwifaiZoLfQ/
	sjdcsxHJXLXkuXtwRRwQNoUodAsdEEUAO8fR6C1faQAjauSyCQjp2mbUxLx+txlF+IUAab11+BkX6
	GiF06JA/6j58BUdwrH4gBcO6oTFOXwA2qCZHhs3f6yTUeo56vakFyE0Q8NY71nz2zIuRPs13xskEr
	3QBMzM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvg0-00000006O7s-09B3;
	Wed, 30 Sep 2026 14:52:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBve6-00000006NQQ-3Hoe;
	Wed, 30 Sep 2026 14:50:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C47960252;
	Wed, 30 Sep 2026 14:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED5B1F00899;
	Wed, 30 Sep 2026 14:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790779857;
	bh=UhAtJfHaHtYaOU+oIY0SPZU9mOxMhuThiOOTuvPUlOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h/+yFH0UqJye/HKFYFIOIYanYzLGyduTYbHX9yle3VN6ug1cnA5uw/pt6/39uXw7F
	 ZBx0lyGu4R6Ms0k/qOg+WLSPZbHdZUKjPJvA8fSyoHUEy4iA7L+fyAQadSiv5Np7NX
	 8A02kNR3Ul+KeOuAxTQTrsZJe5K50jYiptw8fojOgtya0bHQC+b3p6yEvCwFGlnG73
	 oFcN+prPmt6yIejEky6kPe3dF8fdiPDdr28Qir3U5+nx81ylZMzooSvSoLcqcCEqcc
	 F2n1GIBhJVZDTOAaNETCvfsQhQf7ZdaEjY/fmW5pmpOXldPgewuJPe5ZXs0++59UA+
	 rCuBVAiuwoqzw==
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yue Wang <yue.wang@Amlogic.com>,
	Hans Zhang <18255117159@163.com>,
	Rob Herring <robh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Keith Busch <kbusch@kernel.org>,
	mx2pg@pm.me,
	dlemoal@kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	Frank Li <Frank.Li@nxp.com>,
	Mahesh Vaidya <mahesh.vaidya@altera.com>,
	Ricardo Pardini <ricardo@pardini.net>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Myron Stowe <myron.stowe@redhat.com>,
	Jon Mason <jdmason@kudzu.us>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>
Subject: [RFC PATCH 4/4] PCI: meson: Remove redundant MPS configuration
Date: Wed, 30 Sep 2026 16:50:21 +0200
Message-ID: <20260930145017.1356088-10-cassel@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930145017.1356088-6-cassel@kernel.org>
References: <20260930145017.1356088-6-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3435; i=cassel@kernel.org; h=from:subject; bh=DlAMD3ZfDs7mvVlNQPCYHQnXtzUhkG7b37ikG/cbBaY=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGLL2Kq7+0f6vu3LZwbeNU9Y7Sc48Wbvj1RzJuc90lrzUE xD5ovXyW0cpC4MYF4OsmCKL7w+X/cXd7lOOK96xgZnDygQyhIGLUwAm0hDI8M8qgmO5voxt29dj PEH5F7Qb89tyhc2rhJXLnqyyT960Xorhv9OW+jjHWb+ZfrKtl1K6teLQN/12hQcvOz0OT4jM1+f lYgMA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
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

From: Hans Zhang <18255117159@163.com>

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
Signed-off-by: Niklas Cassel <cassel@kernel.org>
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
2.55.0


