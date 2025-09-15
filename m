Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB11CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 05:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqR+ppY1+M7FmQw/yXywzIU9wOnzidoHtbD+k8x7ndc=; b=T9ihT/SLHEn6sO4rlaDhU5cXxw
	/x7lJp7C5z87JRfANewXadUbdSaLWR6aJGdwAnQVH3punbtV0WlkCIvzAn9SKb5C8XfD0cLw0hqQH
	zepzvsH4Tvnj1urjPFEJw3EtB13DRhiUIWonCe7OT1Y94SR0hqTqodSyqfa7DwXsLCX957aWkdrwj
	08nOny83nRRdTTeLBK+PfJ4nwt9Vtv0gBzSkuG+dMzpTkondq5x+GZ8i/StpPA111kToKN8sGEZAt
	8qoRiLvfJJm38D2dOJW4cV8XM6N+1yqVIhAp2jEPh9Q9FzwnZr3cb1VFeawx9h7RkMQ9MaYGqTauZ
	tySW5etQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1Uu-00000002p9m-0ibm;
	Mon, 15 Sep 2025 05:11:28 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1Ui-00000002p3Y-2c1r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 05:11:21 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250915051108epoutp03b79f108c8ee31fc62ef37624ddabd237~lXJ8plECJ2559025590epoutp035
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 05:11:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250915051108epoutp03b79f108c8ee31fc62ef37624ddabd237~lXJ8plECJ2559025590epoutp035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757913068;
	bh=MqR+ppY1+M7FmQw/yXywzIU9wOnzidoHtbD+k8x7ndc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sVG7MYoxdN/HlkgTt06tbC22pZPDuyDI5Oz8ztjzPaIV8p0nESYq+eUeHBiQHbqxO
	 WJR/wtpNnmQoL2sPXa2mMeV0lJs8Y0EnKptMp/hPatFGDVY8buW+I36NVmtChVO8pS
	 /IgVSBp/ZpLXPZTpJzeEB1WJu/XVBm79l9yDmmuo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250915051107epcas2p2f7f74748758ba78d478d612b8fa49f85~lXJ8E3LyL2932829328epcas2p2B;
	Mon, 15 Sep 2025 05:11:07 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cQCmW1Vxtz2SSKf; Mon, 15 Sep
	2025 05:11:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250915051106epcas2p1c1bdb06ec2ec65aad8a96ffe155ed8b6~lXJ62q-Gf2401124011epcas2p10;
	Mon, 15 Sep 2025 05:11:06 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250915051106epsmtip1cb82a386fc1574787e65837ae889b45c~lXJ6xvIz-0858908589epsmtip14;
	Mon, 15 Sep 2025 05:11:06 +0000 (GMT)
From: "myunggeun.ji" <myunggeun.ji@samsung.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Jongho Park <jongho0910.park@samsung.com>, kiisung lee
	<kiisung.lee@samsung.com>, "myunggeun.ji" <myunggeun.ji@samsung.com>
Subject: [PATCH 1/2] iommu/exynos: Implement register set and fault handling
 on SysMMU v9
Date: Mon, 15 Sep 2025 14:13:19 +0900
Message-ID: <20250915051320.3378957-2-myunggeun.ji@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250915051320.3378957-1-myunggeun.ji@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915051106epcas2p1c1bdb06ec2ec65aad8a96ffe155ed8b6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915051106epcas2p1c1bdb06ec2ec65aad8a96ffe155ed8b6
References: <20250915051320.3378957-1-myunggeun.ji@samsung.com>
	<CGME20250915051106epcas2p1c1bdb06ec2ec65aad8a96ffe155ed8b6@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_221117_156662_44A88F9E 
X-CRM114-Status: GOOD (  22.15  )
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

SysMMU v9 has a bit different registers.
- Major and Minor version BIT are changed to BIT[31:28] and BIT[27:24]
- FLPT(First Level Page Table) offset is changed.
- interrupt status register has different bits w.r.t. previous SysMMU
  versions

Add correct register set and fault handling  for SysMMU v9,
according to all mentioned differences.

Signed-off-by: myunggeun.ji <myunggeun.ji@samsung.com>
---
 drivers/iommu/exynos-iommu.c | 73 +++++++++++++++++++++++++++++++-----
 1 file changed, 64 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index b6edd178fe25..00f4129a7bf2 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -152,7 +152,9 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
 
 #define MMU_MAJ_VER(val)	((val) >> 7)
 #define MMU_MIN_VER(val)	((val) & 0x7F)
-#define MMU_RAW_VER(reg)	(((reg) >> 21) & ((1 << 11) - 1)) /* 11 bits */
+#define MMU_RAW_VER(reg)	(((reg) >> 28 < 7) ? \
+				(((reg) >> 21) & ((1 << 11) - 1)) : \
+				(((reg) >> 24) & ((1 << 8) - 1)))
 
 #define MAKE_MMU_VER(maj, min)	((((maj) & 0xF) << 7) | ((min) & 0x7F))
 
@@ -171,6 +173,17 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
 #define REG_V7_CAPA1		0x874
 #define REG_V7_CTRL_VM		0x8000
 
+/* v9.x registers */
+#define REG_V9_CTRL_VM				0x8000
+#define REG_MMU_CONTEXT0_CFG_ATTRIBUTE_VM       0x8408
+
+#define MMU_MAJ_VER_V9(val)		((val) >> 4)
+#define MMU_MIN_VER_V9(val)		((val) & 0xF)
+#define MMU_RAW_VER_V9(reg)		(((reg) >> 24) & ((1 << 8) - 1)) /* 8 bits */
+
+#define MAKE_MMU_VER_V9(maj, min)	((((maj) & 0xF) << 7) | ((min) & 0xF))
+#define MAKE_MMU_VM_OFFSET(vid)		((vid) * 0x1000)
+
 #define has_sysmmu(dev)		(dev_iommu_priv_get(dev) != NULL)
 
 static struct device *dma_dev;
@@ -228,6 +241,14 @@ static const char * const sysmmu_v7_fault_names[] = {
 	"RESERVED"
 };
 
+static const char * const sysmmu_v9_fault_names[] = {
+	"PTW",
+	"PAGE",
+	"ACCESS PROTECTION",
+	"CONTEXT_FAULT",
+	"RESERVED"
+};
+
 /*
  * This structure is attached to dev->iommu->priv of the master device
  * on device add, contains a list of SYSMMU controllers defined by device tree,
@@ -363,6 +384,19 @@ static int exynos_sysmmu_v7_get_fault_info(struct sysmmu_drvdata *data,
 	return 0;
 }
 
+static int exynos_sysmmu_v9_get_fault_info(struct sysmmu_drvdata *data,
+					   unsigned int itype,
+					   struct sysmmu_fault *fault)
+{
+	u32 info = readl(SYSMMU_REG(data, fault_info));
+
+	fault->addr = readl(SYSMMU_REG(data, fault_va));
+	fault->name = sysmmu_v9_fault_names[itype % 5];
+	fault->type = (info & BIT(20)) ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ;
+
+	return 0;
+}
+
 /* SysMMU v1..v3 */
 static const struct sysmmu_variant sysmmu_v1_variant = {
 	.flush_all	= 0x0c,
@@ -420,6 +454,21 @@ static const struct sysmmu_variant sysmmu_v7_vm_variant = {
 	.get_fault_info	= exynos_sysmmu_v7_get_fault_info,
 };
 
+/* SysMMU v9: VM capable register layout */
+static const struct sysmmu_variant sysmmu_v9_vm_variant = {
+	.pt_base        = 0x8404,
+	.flush_all      = 0x8010,
+	.flush_entry    = 0x8014,
+	.flush_start    = 0x8020,
+	.flush_end      = 0x8024,
+	.int_status     = 0x8060,
+	.int_clear      = 0x8064,
+	.fault_va       = 0x8070,
+	.fault_info     = 0x8074,
+
+	.get_fault_info = exynos_sysmmu_v9_get_fault_info,
+};
+
 static struct exynos_iommu_domain *to_exynos_domain(struct iommu_domain *dom)
 {
 	return container_of(dom, struct exynos_iommu_domain, domain);
@@ -522,19 +571,26 @@ static void __sysmmu_get_version(struct sysmmu_drvdata *data)
 	ver = readl(data->sfrbase + REG_MMU_VERSION);
 
 	/* controllers on some SoCs don't report proper version */
+
 	if (ver == 0x80000001u)
 		data->version = MAKE_MMU_VER(1, 0);
 	else
 		data->version = MMU_RAW_VER(ver);
 
-	dev_dbg(data->sysmmu, "hardware version: %d.%d\n",
-		MMU_MAJ_VER(data->version), MMU_MIN_VER(data->version));
+	if (data->version != 0x91)
+		dev_err(data->sysmmu, "hardware version: %d.%d\n",
+			MMU_MAJ_VER(data->version), MMU_MIN_VER(data->version));
+	else if (data->version == 0x91)
+		dev_err(data->sysmmu, "hardware version: %d.%d\n",
+			MMU_MAJ_VER_V9(data->version), MMU_MIN_VER_V9(data->version));
 
-	if (MMU_MAJ_VER(data->version) < 5) {
+	if (data->version == 0x91) {
+		data->variant = &sysmmu_v9_vm_variant;
+	} else if (MMU_MAJ_VER(data->version) < 5) {
 		data->variant = &sysmmu_v1_variant;
 	} else if (MMU_MAJ_VER(data->version) < 7) {
 		data->variant = &sysmmu_v5_variant;
-	} else {
+	} else if (MMU_MAJ_VER(data->version) < 9) {
 		if (__sysmmu_has_capa1(data))
 			__sysmmu_get_vcr(data);
 		if (data->has_vcr)
@@ -763,10 +819,9 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 	if (IS_ERR(data->pclk))
 		return PTR_ERR(data->pclk);
 
-	if (!data->clk && (!data->aclk || !data->pclk)) {
-		dev_err(dev, "Failed to get device clock(s)!\n");
-		return -ENOSYS;
-	}
+	/* There is no clock information after v9 */
+	if (!data->clk && (!data->aclk || !data->pclk))
+		dev_warn(dev, "Failed to get device clock(s)!\n");
 
 	data->clk_master = devm_clk_get_optional(dev, "master");
 	if (IS_ERR(data->clk_master))
-- 
2.50.1


