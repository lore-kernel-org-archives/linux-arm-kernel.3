Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A94C83F19
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+h5Qt8EcpRKlZLel120dEL1HB3bFDuSbg3WaTP0VSU=; b=WZm42eowo8SUlX21cV/291cH3n
	ADlYJVcN4HxuGM0+DmSsecgVuAv7oAQVdoS59KiBROWPY/gSGm3YLtd//K6fHQptC9UAoy9SGYDCk
	LKzOOCRf2Qwd+WMdkqn1bF6YJyQdx++X/sCEi81lQZPXqGS9UtU2hpcmowuZTmsgHtYO21LHlFL84
	lqWiGenm1g1o/CGIBqiCwzuGBXwPB6GQqcIV+gOQbaFn61ZuU5tMyr9MxOS5ArRXstEKcU4NkoNO+
	NFJU05DJC8fMtjGl9nx9IGuQRGhoREPsHlqIWJgko1sSBi/IEIIr0YI6lh6hQ5Vqs3TwlbW9RGi2F
	8R+APaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdim-0000000A97E-2LsF;
	Wed, 09 Jul 2025 22:57:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZbwJ-00000009rPt-2GWE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 21:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAF0246D7E;
	Wed,  9 Jul 2025 21:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F6A3C4CEFC;
	Wed,  9 Jul 2025 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752094970;
	bh=yfPKmVMhY+gbXvaT/+cR0sE6ZwAyCoBhja/l0byv5u0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o6sjYR7MLYIvq9k4HiQ0ti/MSOvwJ3ZGOPHUu/birxeREIpyzoAUaTfuTTP9aUSjO
	 J6HMYK/RI05CFmPb0qlGEO9djvhIKowYqfIfmecEVCMHMdbpcjjK50YV4qhcMvL1nO
	 hv7116AboM1xIXUEd7DIbr+fd04iYkYobolqnmjzesZA8KBd2GBQtt+CxFWmzR1/hz
	 rnyWxMtUkCI1VVRMSeCpTBr7Jti6PGOAr0641LJZG7t/6lrT56A81GAX4zcikNxhPu
	 vmimCx+CPLh2sfdfaECFfromqPPKthm+qiznrJKij/RtOOO9sUUarYd5RvGGMTyrXS
	 L7Nn6PXgk8TvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363C6C83F0A;
	Wed,  9 Jul 2025 21:02:50 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Wed, 09 Jul 2025 17:02:13 -0400
Subject: [PATCH v20 1/9] PCI: imx6: Add helper function
 imx_pcie_add_lut_by_rid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-ep-msi-v20-1-43d56f9bd54a@nxp.com>
References: <20250709-ep-msi-v20-0-43d56f9bd54a@nxp.com>
In-Reply-To: <20250709-ep-msi-v20-0-43d56f9bd54a@nxp.com>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <apatel@ventanamicro.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752094968; l=1939;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=FTsRKbmGJkqXdF0l3uL9gIhRFF4JXE9vNw1HW1VASns=;
 b=w670n6CIt8AYMkZpKlgafc6T2YyiGWMKL6670dFKYT/lynE0ssEky74HbAP8Eii0hjBm0L+YN
 xQUvqxATm7BDjeHrLPgJdsJbx6THK9dXZhSSpf+tFIeCu1nmwtH7Z+n
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_140251_624893_296FB4D0 
X-CRM114-Status: GOOD (  12.79  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Add helper function imx_pcie_add_lut_by_rid(), which will be used for MSI
doorbell support in endpoint mode in the future. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
- change in v20
- update commit message.

change from v14 to v16
- none

change from v13 to v14
- new patch
---
 drivers/pci/controller/dwc/pci-imx6.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 5a38cfaf989b1c9606660f2e0bcd10d88fa2d6b1..032b906c44dfaa374a32f511098402a494ef5677 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1096,18 +1096,14 @@ static void imx_pcie_remove_lut(struct imx_pcie *imx_pcie, u16 rid)
 	}
 }
 
-static int imx_pcie_enable_device(struct pci_host_bridge *bridge,
-				  struct pci_dev *pdev)
+static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
 {
-	struct imx_pcie *imx_pcie = to_imx_pcie(to_dw_pcie_from_pp(bridge->sysdata));
-	u32 sid_i, sid_m, rid = pci_dev_id(pdev);
+	struct device *dev = imx_pcie->pci->dev;
 	struct device_node *target;
-	struct device *dev;
+	u32 sid_i, sid_m;
 	int err_i, err_m;
 	u32 sid = 0;
 
-	dev = imx_pcie->pci->dev;
-
 	target = NULL;
 	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask",
 			  &target, &sid_i);
@@ -1182,6 +1178,13 @@ static int imx_pcie_enable_device(struct pci_host_bridge *bridge,
 	return imx_pcie_add_lut(imx_pcie, rid, sid);
 }
 
+static int imx_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_dev *pdev)
+{
+	struct imx_pcie *imx_pcie = to_imx_pcie(to_dw_pcie_from_pp(bridge->sysdata));
+
+	return imx_pcie_add_lut_by_rid(imx_pcie, pci_dev_id(pdev));
+}
+
 static void imx_pcie_disable_device(struct pci_host_bridge *bridge,
 				    struct pci_dev *pdev)
 {

-- 
2.34.1



