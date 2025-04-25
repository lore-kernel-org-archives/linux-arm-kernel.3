Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319BEC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+IUEz94ha9tzpIf5diXNYx0EEgvKeMrSzQ2Gsv9lsg=; b=FE62O1Bsw6KKWlAHFN9v3lsRsq
	z15ly03iD5IyJNL3bgV75K8iQRRnWPERJ5+YfzedoNMRMbQ4QDZbK3ecju37OV8jPxzJ9CSSBHNq4
	WmA28MnhkVvRx+U4nuWn+KaY+DRzEPbC4/sVUysLfvfN793w7/MM4VWVrC1yWPBLOo0MVWgZ9o1Xz
	qWtsB59ARFzMQhWOWF6VYN6WlgWgFR1sbT0Bd0mDZ0FlAJ2RPyYhWkmBl43VdLzzfSrBDgbE5AUTn
	FW0pCUMMz5lt9h0I/LEBYfjCuWSP539QFMS/aqP1rmHt/QHKJDCDPM4mI/adRUtZ+4Eu96JNAt+aK
	rBKAo0Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Gwm-0000000Gsr0-1qav;
	Fri, 25 Apr 2025 11:10:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FfA-0000000GbgH-01vA;
	Fri, 25 Apr 2025 09:48:05 +0000
X-UUID: 3c9a9ed221b811f0a2405d5ef59ce188-20250425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=m+IUEz94ha9tzpIf5diXNYx0EEgvKeMrSzQ2Gsv9lsg=;
	b=bHa4SENkIZhaJF3b7tRE0b6F8b829KM7/lKTyjwg5YfnanQaCmmSzhmIyjFMGXUfhbkN/Fzd7bwB6ADVV/4WnwBOMpwpuxViLkpCF+5vxuOwmsW7hpzvS98gLSnVGqeey2x7XLQBZhwYyKIaFbk/DDSozSR8bsJ3qJOS4+AZyag=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:049e2e86-7064-4d35-ba91-6ab0b0fb6d6a,IP:0,UR
	L:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-35
X-CID-META: VersionHash:0ef645f,CLOUDID:991d9df0-ff26-40e8-a637-f0e9524b171a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:2,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3c9a9ed221b811f0a2405d5ef59ce188-20250425
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 866577474; Fri, 25 Apr 2025 02:32:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 25 Apr 2025 17:32:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 25 Apr 2025 17:32:39 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <pual-pl.chen@mediatek.com>, "Moudy
 Ho" <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v5 10/19] mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
Date: Fri, 25 Apr 2025 17:28:42 +0800
Message-ID: <20250425093237.1543918-11-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250425093237.1543918-1-jason-jh.lin@mediatek.com>
References: <20250425093237.1543918-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_024804_044002_8804C5A3 
X-CRM114-Status: GOOD (  21.12  )
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

The GCE hardware virtualization configuration supports the isolation of
GCE hardware resources across different OS environments. Each OS is
treated as a virtual machine (VM) for GCE purposes.
There are 6 VMs and 1 host VM. The host VM has main control over the
GCE virtualization settings for all VMs.

To properly access the GCE thread registers, it is necessary to
configure access permissions for specific GCE threads assigned to
different VMs.
Currently, since only the host VM is being used, it is required to
enable access permissions for all GCE threads for the host VM.

There are 2 VM configurations:
1. VM_ID_MAP
There are 4 registers to allocate 32 GCE threads across different VMs:
VM_ID_MAP0 for threads 0-9, VM_ID_MAP1 for threads 10-19,
VM_ID_MAP2 for threads 20-29, and VM_ID_MAP3 for threads 30-31.
Each thread has a 3-bit configuration, where setting all bits to 1
configures the thread for the host VM.

2. VM_CPR_GSIZE
It is used to allocate the CPR SRAM size to each VM. Each VM has 4-bit
configuration, where setting bit 0-3 to configures the size of host VM.
This setting must be configured before the VM configuration to prevent
resource leakage.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 52 ++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index b18808855680..c946766c215a 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -43,6 +43,13 @@
 #define GCE_CTRL_BY_SW				GENMASK(2, 0)
 #define GCE_DDR_EN				GENMASK(18, 16)
 
+#define GCE_VM_ID_MAP(n)		(0x5018 + (n) / 10 * 4)
+#define GCE_VM_ID_MAP_THR_FLD_SHIFT(n)		((n) % 10 * 3)
+#define GCE_VM_ID_MAP_HOST_VM			GENMASK(2, 0)
+#define GCE_VM_CPR_GSIZE		0x50c4
+#define GCE_VM_CPR_GSIZE_FLD_SHIFT(vm_id)	((vm_id) * 4)
+#define GCE_VM_CPR_GSIZE_MAX			GENMASK(3, 0)
+
 #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
 #define CMDQ_THR_ENABLED		0x1
 #define CMDQ_THR_DISABLED		0x0
@@ -89,6 +96,7 @@ struct gce_plat {
 	u8 shift;
 	bool control_by_sw;
 	bool sw_ddr_en;
+	bool gce_vm;
 	u32 gce_num;
 };
 
@@ -110,6 +118,47 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
 }
 EXPORT_SYMBOL(cmdq_get_mbox_priv);
 
+static void cmdq_vm_toggle(struct cmdq *cmdq, bool enable)
+{
+	int i;
+	u32 vm_cpr_gsize = 0, vm_id_map = 0;
+	u32 *vm_map = NULL;
+
+	if (!cmdq->pdata->gce_vm)
+		return;
+
+	vm_map = kcalloc(cmdq->pdata->thread_nr, sizeof(*vm_map), GFP_KERNEL);
+	if (!vm_map)
+		return;
+
+	if (enable) {
+		/* only configure the max CPR SRAM size to host vm (vm_id = 0) currently */
+		vm_cpr_gsize = GCE_VM_CPR_GSIZE_MAX << GCE_VM_CPR_GSIZE_FLD_SHIFT(0);
+
+		/* set all thread mapping to host vm currently */
+		for (i = 0; i < cmdq->pdata->thread_nr; i++)
+			vm_map[i] = GCE_VM_ID_MAP_HOST_VM << GCE_VM_ID_MAP_THR_FLD_SHIFT(i);
+	}
+
+	/* set the amount of CPR SRAM to allocate to each VM */
+	writel(vm_cpr_gsize, cmdq->base + GCE_VM_CPR_GSIZE);
+
+	/* config CPR_GSIZE before setting VM_ID_MAP to avoid data leakage */
+	for (i = 0; i < cmdq->pdata->thread_nr; i++) {
+		vm_id_map |= vm_map[i];
+		/* config every 10 threads, e.g., thread id=0~9, 10~19, ..., into one register */
+		if ((i + 1) % 10 == 0) {
+			writel(vm_id_map, cmdq->base + GCE_VM_ID_MAP(i));
+			vm_id_map = 0;
+		}
+	}
+	/* config remaining threads settings */
+	if (cmdq->pdata->thread_nr % 10 != 0)
+		writel(vm_id_map, cmdq->base + GCE_VM_ID_MAP(cmdq->pdata->thread_nr - 1));
+
+	kfree(vm_map);
+}
+
 static void cmdq_gctl_value_toggle(struct cmdq *cmdq, bool ddr_enable)
 {
 	u32 val = cmdq->pdata->control_by_sw ? GCE_CTRL_BY_SW : 0;
@@ -154,6 +203,7 @@ static void cmdq_init(struct cmdq *cmdq)
 
 	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
 
+	cmdq_vm_toggle(cmdq, true);
 	cmdq_gctl_value_toggle(cmdq, true);
 
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
@@ -327,6 +377,7 @@ static int cmdq_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	cmdq_vm_toggle(cmdq, true);
 	cmdq_gctl_value_toggle(cmdq, true);
 	return 0;
 }
@@ -336,6 +387,7 @@ static int cmdq_runtime_suspend(struct device *dev)
 	struct cmdq *cmdq = dev_get_drvdata(dev);
 
 	cmdq_gctl_value_toggle(cmdq, false);
+	cmdq_vm_toggle(cmdq, false);
 	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
 	return 0;
 }
-- 
2.43.0


