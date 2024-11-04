Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AF0D132B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DBF6hZcHnLBab9m7/J1oWc6GYid6noeppyBD4R1dIKY=; b=sa9/xatT5dYAAoTn9Qtm4cyGIp
	fpJs9jSHoxJTYk1anf0TTswOoxb8Rcc1CvJxRxnQ4cor6FEmDAzKwZhuLxgvGyEBQT2rzSb+CdBvn
	ZBDVfrdihAGg61IwODiBxVPr4Z6v7mNcQAN5XwylZVwDQHOT99wEFd+LKlWPSw9YH51mUzKCZFThB
	ks2te9xwI28MA0iN7ubyaTo6WGIYoh0XU8ePpG3MxuL6ErWNgyZ1xHTUwsA5GJWYL55hWg+TWfs53
	hoqjr8UCoSuTlXDDBGH/Xd0dwplJXeL8exE7NPGa32LbtSWbDhb7pg97I2IsiQtGlsakImuwWcFRD
	yJjLn75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7w1S-0000000DfUj-1yrD;
	Mon, 04 Nov 2024 12:17:30 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vn7-0000000DdHp-1DxO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 12:02:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xhqmj1RD8z2Fb4P;
	Mon,  4 Nov 2024 20:00:53 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id BF0DB1A0188;
	Mon,  4 Nov 2024 20:02:31 +0800 (CST)
Received: from huawei.com (10.145.6.51) by kwepemd200012.china.huawei.com
 (7.221.188.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 4 Nov
 2024 20:02:30 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
To: <maz@kernel.org>, <tglx@linutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>, Zhou
 Wang <wangzhou1@hisilicon.com>, Nianyao Tang <tangnianyao@huawei.com>
Subject: [PATCH] irqchip/gicv3-its: Add workaround for hip09 ITS erratum 162100801
Date: Mon, 4 Nov 2024 20:11:43 +0800
Message-ID: <20241104121143.2169264-1-wangzhou1@hisilicon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.145.6.51]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200012.china.huawei.com (7.221.188.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_040241_667271_ABD3A525 
X-CRM114-Status: GOOD (  13.77  )
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

When enabled GICv4.1 in hip09, VMAPP will fail to clear some caches
during unmapping operation, which will cause some vSGIs interrupts lost.

To fix the issue, it needs to send vinvall command after vmovp.

Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 10 ++++++
 drivers/irqchip/irq-gic-v3-its.c            | 36 ++++++++++++++++-----
 3 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 65bfab1b1861..77db10e944f0 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -258,6 +258,8 @@ stable kernels.
 | Hisilicon      | Hip{08,09,10,10C| #162001900      | N/A                         |
 |                | ,11} SMMU PMCG  |                 |                             |
 +----------------+-----------------+-----------------+-----------------------------+
+| Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd9df6dcc593..27082e075d1a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1232,6 +1232,16 @@ config HISILICON_ERRATUM_161600802
 
 	  If unsure, say Y.
 
+config HISILICON_ERRATUM_162100801
+	bool "Hip09 162100801 erratum support"
+	default y
+	help
+	  When enabled GICv4.1 in hip09, VMAPP will fail to clear some caches
+	  during unmapping operation, which will cause some vSGIs interrupts
+	  lost. So fix it by sending vinvall commands after vmovp.
+
+	  If unsure, say Y.
+
 config QCOM_FALKOR_ERRATUM_1003
 	bool "Falkor E1003: Incorrect translation due to ASID change"
 	default y
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 52f625e07658..69b09072d24d 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -44,6 +44,7 @@
 #define ITS_FLAGS_WORKAROUND_CAVIUM_22375	(1ULL << 1)
 #define ITS_FLAGS_WORKAROUND_CAVIUM_23144	(1ULL << 2)
 #define ITS_FLAGS_FORCE_NON_SHAREABLE		(1ULL << 3)
+#define ITS_FLAGS_WORKAROUND_HISILICON_162100801	(1ULL << 4)
 
 #define RD_LOCAL_LPI_ENABLED                    BIT(0)
 #define RD_LOCAL_PENDTABLE_PREALLOCATED         BIT(1)
@@ -1314,6 +1315,14 @@ static void its_send_vmapp(struct its_node *its,
 	its_send_single_vcommand(its, its_build_vmapp_cmd, &desc);
 }
 
+static void its_send_vinvall(struct its_node *its, struct its_vpe *vpe)
+{
+	struct its_cmd_desc desc;
+
+	desc.its_vinvall_cmd.vpe = vpe;
+	its_send_single_vcommand(its, its_build_vinvall_cmd, &desc);
+}
+
 static void its_send_vmovp(struct its_vpe *vpe)
 {
 	struct its_cmd_desc desc = {};
@@ -1351,17 +1360,12 @@ static void its_send_vmovp(struct its_vpe *vpe)
 
 		desc.its_vmovp_cmd.col = &its->collections[col_id];
 		its_send_single_vcommand(its, its_build_vmovp_cmd, &desc);
+		if (is_v4_1(its) && (its->flags &
+			    ITS_FLAGS_WORKAROUND_HISILICON_162100801))
+			its_send_vinvall(its, vpe);
 	}
 }
 
-static void its_send_vinvall(struct its_node *its, struct its_vpe *vpe)
-{
-	struct its_cmd_desc desc;
-
-	desc.its_vinvall_cmd.vpe = vpe;
-	its_send_single_vcommand(its, its_build_vinvall_cmd, &desc);
-}
-
 static void its_send_vinv(struct its_device *dev, u32 event_id)
 {
 	struct its_cmd_desc desc;
@@ -4781,6 +4785,14 @@ static bool its_set_non_coherent(void *data)
 	return true;
 }
 
+static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
+{
+	struct its_node *its = data;
+
+	its->flags |= ITS_FLAGS_WORKAROUND_HISILICON_162100801;
+	return true;
+}
+
 static const struct gic_quirk its_quirks[] = {
 #ifdef CONFIG_CAVIUM_ERRATUM_22375
 	{
@@ -4827,6 +4839,14 @@ static const struct gic_quirk its_quirks[] = {
 		.init	= its_enable_quirk_hip07_161600802,
 	},
 #endif
+#ifdef CONFIG_HISILICON_ERRATUM_162100801
+	{
+		.desc	= "ITS: Hip09 erratum 162100801",
+		.iidr	= 0x00051736,
+		.mask	= 0xffffffff,
+		.init	= its_enable_quirk_hip09_162100801,
+	},
+#endif
 #ifdef CONFIG_ROCKCHIP_ERRATUM_3588001
 	{
 		.desc   = "ITS: Rockchip erratum RK3588001",
-- 
2.34.1


