Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A98FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gp/mYrwMs8fZrFgK1lG+xfr464sIdREx4PfA+LK/Nak=; b=IARJ/a5QjpewRPeE01JECwTjtu
	PWKwUrD9QuXTzb8e7nVTmwTjzWIUEKbrQN9QS2XsDV62iXRNdypn7/zQ5+oYB4YMIk+X1uCZsi5fx
	Q6/Ii7d37qem6h3L3/11mDV4sOXV1jMLgmmj88bA7Zi5kw8ap4QoQOnmdLQ6SpVS+M6RYiBF/+P4c
	yIGH1TsNRaGhwl3nuciKjANipGMtR/yDEXOUZKCgg8vFhrWWk9D04pRdAGHdpkAwuyFpZDgaQBCMb
	qE3zeOvlHajwgD/7AZ29tFdOWM4u4taW5wUnz2FEMOuyiK8tgDCuAjXQ+jgRXttwGXLgKTlBb0n1O
	0qxFDANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJw4-0000000GlNZ-3AL7;
	Mon, 27 Apr 2026 11:15:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJvr-0000000Gl8o-0H5H;
	Mon, 27 Apr 2026 11:15:20 +0000
X-UUID: 5c2c17a6422a11f19e7563141e833ce8-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Gp/mYrwMs8fZrFgK1lG+xfr464sIdREx4PfA+LK/Nak=;
	b=aMjzbvbRCr35hNZu1JeLTs0eCocIMKELK9+fqO7BhjCsgsLrSkPl67qMOWh7JeZVoML3uxclR4gUW2O2xLpC62ND9KXR72fizdguVjv8B3qzSzdcvx4qUPpLs2u0GwrKZ0MH2SWooiI8FxUFQgE2vbq3JgQJss1yAxz3FQSdHJE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:2e240948-2c3a-400b-9d53-3007988d4ffc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:417d82be-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5c2c17a6422a11f19e7563141e833ce8-20260427
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1314916850; Mon, 27 Apr 2026 04:15:12 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 19:15:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 19:15:08 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<Hailong.Fan@mediatek.com>, Huayu Zong <Huayu.Zong@mediatek.com>, Jarried Lin
	<Jarried.Lin@mediatek.com>, Justin Yeh <Justin.Yeh@mediatek.com>, "Vince-WL
 Liu" <Vince-WL.Liu@mediatek.com>, Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Subject: [PATCH v4 6/7] remoteproc: mediatek: vcp: Add vcp suspend and resume feature
Date: Mon, 27 Apr 2026 19:04:45 +0800
Message-ID: <20260427111446.22955-7-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
References: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_041519_193329_C2E522A4 
X-CRM114-Status: GOOD (  19.22  )
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

Implement power management support for the VCP remoteproc driver by
adding suspend and resume callbacks. This allows the VCP coprocessor
to properly transition to low-power states when the system suspends,
and restore functionality when the system resumes.

The suspend/resume functionality coordinates with the VCP firmware
to ensure graceful state transitions and maintain communication
channel integrity across power state changes.

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 drivers/remoteproc/mtk_vcp_common.c | 111 ++++++++++++++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h |   6 ++
 drivers/remoteproc/mtk_vcp_rproc.c  |  67 +++++++++++++++++
 drivers/remoteproc/mtk_vcp_rproc.h  |   2 +
 4 files changed, 186 insertions(+)

diff --git a/drivers/remoteproc/mtk_vcp_common.c b/drivers/remoteproc/mtk_vcp_common.c
index 039c0a469631..a1e2e6e0ada2 100644
--- a/drivers/remoteproc/mtk_vcp_common.c
+++ b/drivers/remoteproc/mtk_vcp_common.c
@@ -207,6 +207,11 @@ bool is_vcp_ready(struct mtk_vcp_device *vcp,
 	return vcp_is_core_ready(vcp, core_id);
 }
 
+bool is_vcp_suspending(struct mtk_vcp_device *vcp)
+{
+	return vcp->vcp_cluster->is_suspending;
+}
+
 int wait_core_hart_shutdown(struct mtk_vcp_device *vcp,
 			    enum vcp_core_id core_id)
 {
@@ -269,6 +274,92 @@ int wait_core_hart_shutdown(struct mtk_vcp_device *vcp,
 	return 0;
 }
 
+void vcp_wait_core_stop(struct mtk_vcp_device *vcp, enum vcp_core_id core_id)
+{
+	u32 status;
+	u32 stop_ctrl;
+	u32 num_harts;
+	int ret;
+
+	if (core_id >= VCP_CORE_TOTAL) {
+		dev_err(vcp->dev, "%s, Invalid core id %d\n", __func__, core_id);
+		return;
+	}
+
+	num_harts = vcp->vcp_cluster->hart_count[core_id];
+
+	/* Build stop control mask based on number of harts */
+	stop_ctrl = B_CORE_GATED | B_HART0_HALT | B_CORE_AXIS_BUSY;
+	if (num_harts > 1)
+		stop_ctrl |= B_HART1_HALT;
+
+	if (core_id == VCP_ID) {
+		ret = readl_poll_timeout(vcp->vcp_cluster->cfg + R_CORE0_STATUS,
+					 status,
+					 (status & stop_ctrl) == (stop_ctrl & ~B_CORE_AXIS_BUSY),
+					 USEC_PER_MSEC,
+					 CORE_HART_SHUTDOWN_TIMEOUT_MS * USEC_PER_MSEC);
+		if (ret)
+			dev_err(vcp->dev, "VCP core stop timeout, status 0x%x\n", status);
+	} else if (core_id == MMUP_ID) {
+		ret = readl_poll_timeout(vcp->vcp_cluster->cfg + R_CORE1_STATUS,
+					 status,
+					 (status & stop_ctrl) == (stop_ctrl & ~B_CORE_AXIS_BUSY),
+					 USEC_PER_MSEC,
+					 CORE_HART_SHUTDOWN_TIMEOUT_MS * USEC_PER_MSEC);
+		if (ret)
+			dev_err(vcp->dev, "MMUP core stop timeout, status 0x%x\n", status);
+	}
+}
+
+static bool vcp_get_suspend_resume_status(struct mtk_vcp_device *vcp)
+{
+	if (vcp->vcp_cluster->core_nums > MMUP_ID)
+		return !!(readl(vcp->vcp_cluster->cfg_sec + R_GPR3_SEC) & VCP_AP_SUSPEND) &&
+		       !!(readl(vcp->vcp_cluster->cfg_sec + R_GPR2_SEC) & MMUP_AP_SUSPEND);
+
+	return !!(readl(vcp->vcp_cluster->cfg_sec + R_GPR3_SEC) & VCP_AP_SUSPEND);
+}
+
+void vcp_wait_suspend_resume(struct mtk_vcp_device *vcp, bool suspend)
+{
+	bool status;
+	int ret;
+
+	if (suspend) {
+		writel(B_CORE0_SUSPEND, vcp->vcp_cluster->cfg_core + AP_R_GPR2);
+		writel(SUSPEND_MAGIC, vcp->vcp_cluster->cfg + VCP_C0_GPR0_SUSPEND_RESUME);
+		if (vcp->vcp_cluster->core_nums > MMUP_ID) {
+			writel(B_CORE1_SUSPEND, vcp->vcp_cluster->cfg_core + AP_R_GPR3);
+			writel(SUSPEND_MAGIC, vcp->vcp_cluster->cfg + VCP_C1_GPR0_SUSPEND_RESUME);
+		}
+	} else {
+		writel(B_CORE0_RESUME, vcp->vcp_cluster->cfg_core + AP_R_GPR2);
+		writel(RESUME_MAGIC, vcp->vcp_cluster->cfg + VCP_C0_GPR0_SUSPEND_RESUME);
+		if (vcp->vcp_cluster->core_nums > MMUP_ID) {
+			writel(B_CORE1_RESUME, vcp->vcp_cluster->cfg_core + AP_R_GPR3);
+			writel(RESUME_MAGIC, vcp->vcp_cluster->cfg + VCP_C1_GPR0_SUSPEND_RESUME);
+		}
+	}
+
+	writel(B_GIPC4_SETCLR_3, vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET);
+
+	ret = read_poll_timeout(vcp_get_suspend_resume_status,
+				status, (status == suspend),
+				USEC_PER_MSEC,
+				SUSPEND_WAIT_TIMEOUT_MS * USEC_PER_MSEC,
+				false, vcp);
+	if (ret)
+		dev_err(vcp->dev, "vcp %s timeout GPIC 0x%x 0x%x 0x%x 0x%x flag 0x%x 0x%x\n",
+			suspend ? "suspend" : "resume",
+			readl(vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET),
+			readl(vcp->vcp_cluster->cfg_core + R_GIPC_IN_CLR),
+			readl(vcp->vcp_cluster->cfg_core + AP_R_GPR2),
+			readl(vcp->vcp_cluster->cfg_core + AP_R_GPR3),
+			readl(vcp->vcp_cluster->cfg_sec + R_GPR2_SEC),
+			readl(vcp->vcp_cluster->cfg_sec + R_GPR3_SEC));
+}
+
 void vcp_register_notify(struct mtk_vcp_device *vcp,
 			 enum vcp_feature_id id,
 			 struct notifier_block *nb)
@@ -438,6 +529,16 @@ static int vcp_enable_pm_clk(struct mtk_vcp_device *vcp, enum vcp_feature_id id)
 	bool suspend_status;
 	int ret;
 
+	ret = read_poll_timeout(is_vcp_suspending,
+				suspend_status, !suspend_status,
+				USEC_PER_MSEC,
+				SUSPEND_WAIT_TIMEOUT_MS * USEC_PER_MSEC,
+				false, vcp);
+	if (ret) {
+		dev_err(vcp->dev, "%s blocked by vcp suspend\n", __func__);
+		return ret;
+	}
+
 	if (vcp->vcp_cluster->feature_enable[id]) {
 		dev_err(vcp->dev, "%s feature(id=%d) already enabled\n",
 			__func__, id);
@@ -465,6 +566,16 @@ static int vcp_disable_pm_clk(struct mtk_vcp_device *vcp, enum vcp_feature_id id
 	bool suspend_status;
 	int ret;
 
+	ret = read_poll_timeout(is_vcp_suspending,
+				suspend_status, !suspend_status,
+				USEC_PER_MSEC,
+				SUSPEND_WAIT_TIMEOUT_MS * USEC_PER_MSEC,
+				false, vcp);
+	if (ret) {
+		dev_err(vcp->dev, "%s blocked by vcp suspend\n", __func__);
+		return ret;
+	}
+
 	if (!vcp->vcp_cluster->feature_enable[id]) {
 		dev_err(vcp->dev, "%s feature(id=%d) already disabled\n",
 			__func__, id);
diff --git a/drivers/remoteproc/mtk_vcp_common.h b/drivers/remoteproc/mtk_vcp_common.h
index 1238a165cac4..f193e2f66796 100644
--- a/drivers/remoteproc/mtk_vcp_common.h
+++ b/drivers/remoteproc/mtk_vcp_common.h
@@ -16,9 +16,12 @@
 #define VCP_READY_TIMEOUT_MS 3000
 #define VCP_IPI_DEV_READY_TIMEOUT 1000
 #define CORE_HART_SHUTDOWN_TIMEOUT_MS 10
+#define SUSPEND_WAIT_TIMEOUT_MS 100
 
 /* VCP platform definition */
 #define DMA_MAX_MASK_BIT 33
+#define RESUME_MAGIC 0x12345678
+#define SUSPEND_MAGIC 0x87654321
 #define PIN_OUT_C_SIZE_SLEEP_0 2
 
 /* VCP load image definition */
@@ -271,5 +274,8 @@ int vcp_register_feature(struct mtk_vcp_device *vcp,
 int vcp_deregister_feature(struct mtk_vcp_device *vcp,
 			   enum vcp_feature_id id);
 
+bool is_vcp_suspending(struct mtk_vcp_device *vcp);
 int wait_core_hart_shutdown(struct mtk_vcp_device *vcp, enum vcp_core_id core_id);
+void vcp_wait_core_stop(struct mtk_vcp_device *vcp, enum vcp_core_id core_id);
+void vcp_wait_suspend_resume(struct mtk_vcp_device *vcp, bool suspend);
 #endif
diff --git a/drivers/remoteproc/mtk_vcp_rproc.c b/drivers/remoteproc/mtk_vcp_rproc.c
index 2f320849fe15..b27bf1b6f668 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.c
+++ b/drivers/remoteproc/mtk_vcp_rproc.c
@@ -11,6 +11,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/suspend.h>
 #include <linux/remoteproc.h>
 
 #include "mtk_vcp_common.h"
@@ -71,6 +72,66 @@ struct mtk_ipi_device *vcp_get_ipidev(struct mtk_vcp_device *vcp)
 }
 EXPORT_SYMBOL_GPL(vcp_get_ipidev);
 
+static int mtk_vcp_suspend(struct device *dev)
+{
+	struct mtk_vcp_device *vcp = platform_get_drvdata(to_platform_device(dev));
+	u32 f_id;
+	int ret;
+
+	vcp_extern_notify(VCP_ID, VCP_EVENT_SUSPEND);
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_SUSPEND);
+
+	for (f_id = RTOS_FEATURE_ID + 1; f_id < NUM_FEATURE_ID; f_id++) {
+		if (vcp->vcp_cluster->feature_enable[f_id]) {
+			dev_err(vcp->dev, "%s, Feature %d still active\n", __func__, f_id);
+			return -EBUSY;
+		}
+	}
+
+	if (!vcp->vcp_cluster->is_suspending) {
+		vcp->vcp_cluster->is_suspending = true;
+		vcp->vcp_cluster->vcp_ready[VCP_ID] = false;
+		vcp->vcp_cluster->vcp_ready[MMUP_ID] = false;
+
+		flush_workqueue(vcp->vcp_cluster->vcp_workqueue);
+
+		vcp_wait_suspend_resume(vcp, true);
+		vcp_wait_core_stop(vcp, VCP_ID);
+		vcp_wait_core_stop(vcp, MMUP_ID);
+
+		ret = pm_runtime_put_sync(dev);
+		if (ret < 0) {
+			dev_err(dev, "%s, Failed to suspend: %d\n", __func__, ret);
+			vcp->vcp_cluster->is_suspending = false;
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int mtk_vcp_resume(struct device *dev)
+{
+	struct mtk_vcp_device *vcp = platform_get_drvdata(to_platform_device(dev));
+	int ret;
+
+	if (vcp->vcp_cluster->is_suspending) {
+		ret = pm_runtime_get_sync(dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(dev);
+			return ret;
+		}
+
+		vcp_wait_suspend_resume(vcp, false);
+	}
+	vcp->vcp_cluster->is_suspending = false;
+
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_RESUME);
+	vcp_extern_notify(VCP_ID, VCP_EVENT_RESUME);
+
+	return 0;
+}
+
 static int mtk_vcp_start(struct rproc *rproc)
 {
 	struct mtk_vcp_device *vcp = rproc->priv;
@@ -491,6 +552,11 @@ static const struct mtk_vcp_of_data mt8196_of_data = {
 	},
 };
 
+static const struct dev_pm_ops mtk_vcp_rproc_pm_ops = {
+	.suspend_noirq = mtk_vcp_suspend,
+	.resume_noirq = mtk_vcp_resume,
+};
+
 static const struct of_device_id mtk_vcp_of_match[] = {
 	{ .compatible = "mediatek,mt8196-vcp", .data = &mt8196_of_data},
 	{}
@@ -504,6 +570,7 @@ static struct platform_driver mtk_vcp_device = {
 	.driver = {
 		.name = "mtk-vcp",
 		.of_match_table = mtk_vcp_of_match,
+		.pm = pm_ptr(&mtk_vcp_rproc_pm_ops),
 	},
 };
 
diff --git a/drivers/remoteproc/mtk_vcp_rproc.h b/drivers/remoteproc/mtk_vcp_rproc.h
index 64a25287dc5c..a1ac6c7efd08 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.h
+++ b/drivers/remoteproc/mtk_vcp_rproc.h
@@ -23,6 +23,7 @@
  * @msg_vcp_ready1: core1 ready ipi msg data
  * @slp_ipi_ack_data: sleep ipi msg data
  * @feature_enable: feature status count data
+ * @is_suspending: suspend status flag
  * @vcp_ready: vcp core status flag
  * @share_mem_iova: shared memory iova base
  * @share_mem_size: shared memory size
@@ -46,6 +47,7 @@ struct mtk_vcp_of_cluster {
 	u32 msg_vcp_ready1;
 	u32 slp_ipi_ack_data;
 	bool feature_enable[NUM_FEATURE_ID];
+	bool is_suspending;
 	bool vcp_ready[VCP_CORE_TOTAL];
 	dma_addr_t share_mem_iova;
 	size_t share_mem_size;
-- 
2.46.0


