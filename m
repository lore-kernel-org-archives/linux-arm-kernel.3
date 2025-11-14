Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E02ECE8D5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBNppj9n8G9I5rZ5ZCWBnly+G9WuuKNxvXd4j7qblpE=; b=Zbpn4CZL/cEnuyfVvt5F5bs8cF
	Ke8C2QYfMvo8JPb2cn3bP4rRehLNDEe7yLaga3OmxxJ2xLoNRNZLNv+MoPCdJKFo5LTrOiHVMZolp
	WLJJoKMS0GeHeurw0JtuoAcMk4KvM6kgUlPGS9WEZuo0VEilRGmSkHbtLqQzkAeYXTWnLduNR+1a1
	JPA6OJfnA3rZYleAp6D31QHEcuFNeW5UeB85uznvaRxZm6LFhKKksTOT1zYZUY+0IeqbKcQmBiUpN
	h9i/VwKT2zojwoViP++NW0sK/FcuMOp3AyeDsa1V1Bfe1fiReNeSj5hIgJe96DUG0qN5NQh8axTwv
	KzZSXJmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4i-0000000CmSj-2JVv;
	Fri, 14 Nov 2025 16:55:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4e-0000000CmLy-1yuS;
	Fri, 14 Nov 2025 16:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oBNppj9n8G9I5rZ5ZCWBnly+G9WuuKNxvXd4j7qblpE=; b=hzzYcliu6lFeh8yitRT6MLl8ZZ
	ax4/kEIm3X00nrUQiirIaiupoWY8DOAbwVDSgwBSqlOOElPGAgd09lz1LgWen7hOrFpOoKCZwxGOF
	SpPBNVZ99J8De6WNdAMCjuwscGaKlYoZe0HcdI5UaHylQCYKwzEpPVVUkuK6P0LsmN/ya9o4B/AKG
	ETGQlyf2FRplPTk1nbMJzK7wC3ZKe70ZgRcPLZwap3BvxEDFeNNFoLbsAdi3cLoBBMc2ynWdqIa8w
	LD6IOtp2HqgsB3Ipja8OjiDzyySLTN44ZOA+qbBU4vU3b+EcsJdhQOeys/oDPIT53no5ryHcrWVKu
	HGckkI7Q==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwCw-000000032l1-2fts;
	Fri, 14 Nov 2025 15:59:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763139288; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OsAumg5KqtylI97bFCEr1BFqjARaS/OX63v+UixpmLgP9ev6/5RAWDMviYgjdQ8Wqx2KdxKoz2/NPHxZzYiSce7Gfm23e44KGtdMMzPn/fVcjdmYSdNgQFK1TXVMsQjn5Ipo/NdL+lTS8mlUNOUiZtkHERYkNQvOxJQfYgCHOk8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763139288; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oBNppj9n8G9I5rZ5ZCWBnly+G9WuuKNxvXd4j7qblpE=; 
	b=LzTsrAE+uw8UgNzSgYM+p4dKsrJ4QexxjvtfRqLTZv29QIz1HC3JcKXcSi6/NApdCUIaPcWRnUZLMcgO0UUaEXnzkceUpqonZDm3wpcVXhR5rWlacL+1tuGQZyiS8txa+/DAX5jvhzQOPg4o5Y1xN+EBHu5eXWKLqeSw7nFiqq0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763139288;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=oBNppj9n8G9I5rZ5ZCWBnly+G9WuuKNxvXd4j7qblpE=;
	b=BrzLyPTGScIlsqy5ZcaRSfgB+MeuHtLRmO5cxBgHdWQHkDAQSZd139fOY1VnzQZt
	lKLyWiHg13IKK0PKQr26OWxxNBgD75Z1INuyMZLI1LZmqHFEpl0Y9m2pVy1UTeimN/L
	0lJf++mSxpnWpsZ1/YVSt5T9CIcABjn1KdGSKa5k=
Received: by mx.zohomail.com with SMTPS id 1763139286657725.1281713324897;
	Fri, 14 Nov 2025 08:54:46 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 14 Nov 2025 17:54:05 +0100
Subject: [PATCH 11/13] interconnect: mediatek: Add support for MediaTek
 MT8196 EMI ICC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mt8196-dvfsrc-v1-11-b956d4631468@collabora.com>
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
In-Reply-To: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Henry Chen <henryc.chen@mediatek.com>, Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_155931_010321_BF4848C4 
X-CRM114-Status: GOOD (  15.10  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add a new driver with data to register the External Memory
Interface (EMI) Interconnect on the MediaTek MT8196 Chromebook
SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/interconnect/mediatek/Kconfig  |   7 +
 drivers/interconnect/mediatek/Makefile |   1 +
 drivers/interconnect/mediatek/mt8196.c | 383 +++++++++++++++++++++++++++++++++
 3 files changed, 391 insertions(+)

diff --git a/drivers/interconnect/mediatek/Kconfig b/drivers/interconnect/mediatek/Kconfig
index 985c849efac3..9fd3f2170443 100644
--- a/drivers/interconnect/mediatek/Kconfig
+++ b/drivers/interconnect/mediatek/Kconfig
@@ -27,3 +27,10 @@ config INTERCONNECT_MTK_MT8195
 	help
 	  This is a driver for the MediaTek bus interconnect on MT8195-based
 	  platforms.
+
+config INTERCONNECT_MTK_MT8196
+	tristate "MediaTek MT8196 interconnect driver"
+	depends on INTERCONNECT_MTK_DVFSRC_EMI
+	help
+	  This is a driver for the MediaTek bus interconnect on MT8196-based
+	  platforms.
diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 8e2283a9a5b5..6bd656668f5d 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
diff --git a/drivers/interconnect/mediatek/mt8196.c b/drivers/interconnect/mediatek/mt8196.c
new file mode 100644
index 000000000000..e9af32065be1
--- /dev/null
+++ b/drivers/interconnect/mediatek/mt8196.c
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/device.h>
+#include <linux/interconnect.h>
+#include <linux/interconnect-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/interconnect/mediatek,mt8196.h>
+
+#include "icc-emi.h"
+
+static struct mtk_icc_node ddr_emi = {
+	.name = "ddr-emi",
+	.id = SLAVE_DDR_EMI,
+	.ep = 1,
+};
+
+static struct mtk_icc_node mcusys = {
+	.name = "mcusys",
+	.id = MASTER_MCUSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node mcu_port0 = {
+	.name = "mcu-port0",
+	.id = MASTER_MCU_0,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node mcu_port1 = {
+	.name = "mcu-port1",
+	.id = MASTER_MCU_1,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node mcu_port2 = {
+	.name = "mcu-port2",
+	.id = MASTER_MCU_2,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node mcu_port3 = {
+	.name = "mcu-port3",
+	.id = MASTER_MCU_3,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node mcu_port4 = {
+	.name = "mcu-port4",
+	.id = MASTER_MCU_4,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node gpu = {
+	.name = "gpu",
+	.id = MASTER_GPUSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node mmsys = {
+	.name = "mmsys",
+	.id = MASTER_MMSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node mm_vpu = {
+	.name = "mm-vpu",
+	.id = MASTER_MM_VPU,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_disp = {
+	.name = "mm-disp",
+	.id = MASTER_MM_DISP,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_vdec = {
+	.name = "mm-vdec",
+	.id = MASTER_MM_VDEC,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_venc = {
+	.name = "mm-venc",
+	.id = MASTER_MM_VENC,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_cam = {
+	.name = "mm-cam",
+	.id = MASTER_MM_CAM,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_img = {
+	.name = "mm-img",
+	.id = MASTER_MM_IMG,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_mdp = {
+	.name = "mm-mdp",
+	.id = MASTER_MM_MDP,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node vpusys = {
+	.name = "vpusys",
+	.id = MASTER_VPUSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node vpu_port0 = {
+	.name = "vpu-port0",
+	.id = MASTER_VPU_0,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_VPUSYS }
+};
+
+static struct mtk_icc_node vpu_port1 = {
+	.name = "vpu-port1",
+	.id = MASTER_VPU_1,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_VPUSYS }
+};
+
+static struct mtk_icc_node mdlasys = {
+	.name = "mdlasys",
+	.id = MASTER_MDLASYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node mdla_port0 = {
+	.name = "mdla-port0",
+	.id = MASTER_MDLA_0,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MDLASYS }
+};
+
+static struct mtk_icc_node ufs = {
+	.name = "ufs",
+	.id = MASTER_UFS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node pcie = {
+	.name = "pcie",
+	.id = MASTER_PCIE,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node usb = {
+	.name = "usb",
+	.id = MASTER_USB,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node wifi = {
+	.name = "wifi",
+	.id = MASTER_WIFI,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node bt = {
+	.name = "bt",
+	.id = MASTER_BT,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node netsys = {
+	.name = "netsys",
+	.id = MASTER_NETSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node dbgif = {
+	.name = "dbgif",
+	.id = MASTER_DBGIF,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node hrt_ddr_emi = {
+	.name = "hrt-ddr-emi",
+	.id = SLAVE_HRT_DDR_EMI,
+	.ep = 2,
+};
+
+static struct mtk_icc_node hrt_mmsys = {
+	.name = "hrt-mmsys",
+	.id = MASTER_HRT_MMSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_HRT_DDR_EMI }
+};
+
+static struct mtk_icc_node hrt_mm_disp = {
+	.name = "hrt-mm-disp",
+	.id = MASTER_HRT_MM_DISP,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_HRT_MMSYS }
+};
+
+static struct mtk_icc_node hrt_mm_vdec = {
+	.name = "hrt-mm-vdec",
+	.id = MASTER_HRT_MM_VDEC,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_HRT_MMSYS }
+};
+
+static struct mtk_icc_node hrt_mm_venc = {
+	.name = "hrt-mm-venc",
+	.id = MASTER_HRT_MM_VENC,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_HRT_MMSYS }
+};
+
+static struct mtk_icc_node hrt_mm_cam = {
+	.name = "hrt-mm-cam",
+	.id = MASTER_HRT_MM_CAM,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_HRT_MMSYS }
+};
+
+static struct mtk_icc_node hrt_mm_img = {
+	.name = "hrt-mm-img",
+	.id = MASTER_HRT_MM_IMG,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_HRT_MMSYS }
+};
+
+static struct mtk_icc_node hrt_mm_mdp = {
+	.name = "hrt-mm-mdp",
+	.id = MASTER_HRT_MM_MDP,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_HRT_MMSYS }
+};
+
+static struct mtk_icc_node hrt_adsp = {
+	.name = "hrt-adsp",
+	.id = MASTER_HRT_ADSP,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_HRT_DDR_EMI }
+};
+
+static struct mtk_icc_node hrt_dbgif = {
+	.name = "hrt-dbgif",
+	.id = MASTER_HRT_DBGIF,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_HRT_DDR_EMI }
+};
+
+static struct mtk_icc_node *mt8196_emi_icc_nodes[] = {
+	[SLAVE_DDR_EMI] = &ddr_emi,
+	[MASTER_MCUSYS] = &mcusys,
+	[MASTER_MCU_0] = &mcu_port0,
+	[MASTER_MCU_1] = &mcu_port1,
+	[MASTER_MCU_2] = &mcu_port2,
+	[MASTER_MCU_3] = &mcu_port3,
+	[MASTER_MCU_4] = &mcu_port4,
+	[MASTER_GPUSYS] = &gpu,
+	[MASTER_MMSYS] = &mmsys,
+	[MASTER_MM_VPU] = &mm_vpu,
+	[MASTER_MM_DISP] = &mm_disp,
+	[MASTER_MM_VDEC] = &mm_vdec,
+	[MASTER_MM_VENC] = &mm_venc,
+	[MASTER_MM_CAM] = &mm_cam,
+	[MASTER_MM_IMG] = &mm_img,
+	[MASTER_MM_MDP] = &mm_mdp,
+	[MASTER_VPUSYS] = &vpusys,
+	[MASTER_VPU_0] = &vpu_port0,
+	[MASTER_VPU_1] = &vpu_port1,
+	[MASTER_MDLASYS] = &mdlasys,
+	[MASTER_MDLA_0] = &mdla_port0,
+	[MASTER_UFS] = &ufs,
+	[MASTER_PCIE] = &pcie,
+	[MASTER_USB] = &usb,
+	[MASTER_WIFI] = &wifi,
+	[MASTER_BT] = &bt,
+	[MASTER_NETSYS] = &netsys,
+	[MASTER_DBGIF] = &dbgif,
+	[SLAVE_HRT_DDR_EMI] = &hrt_ddr_emi,
+	[MASTER_HRT_MMSYS] = &hrt_mmsys,
+	[MASTER_HRT_MM_DISP] = &hrt_mm_disp,
+	[MASTER_HRT_MM_VDEC] = &hrt_mm_vdec,
+	[MASTER_HRT_MM_VENC] = &hrt_mm_venc,
+	[MASTER_HRT_MM_CAM] = &hrt_mm_cam,
+	[MASTER_HRT_MM_IMG] = &hrt_mm_img,
+	[MASTER_HRT_MM_MDP] = &hrt_mm_mdp,
+	[MASTER_HRT_ADSP] = &hrt_adsp,
+	[MASTER_HRT_DBGIF] = &hrt_dbgif
+};
+
+static struct mtk_icc_desc mt8196_emi_icc = {
+	.nodes = mt8196_emi_icc_nodes,
+	.num_nodes = ARRAY_SIZE(mt8196_emi_icc_nodes),
+};
+
+static const struct of_device_id mtk_mt8196_emi_icc_of_match[] = {
+	{ .compatible = "mediatek,mt8196-emi", .data = &mt8196_emi_icc },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mtk_mt8196_emi_icc_of_match);
+
+static struct platform_driver mtk_emi_icc_mt8196_driver = {
+	.driver = {
+		.name = "emi-icc-mt8196",
+		.of_match_table = mtk_mt8196_emi_icc_of_match,
+		.sync_state = icc_sync_state,
+	},
+	.probe = mtk_emi_icc_probe,
+	.remove = mtk_emi_icc_remove,
+
+};
+module_platform_driver(mtk_emi_icc_mt8196_driver);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT8196 EMI ICC driver");
+MODULE_LICENSE("GPL");

-- 
2.51.2


