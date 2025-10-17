Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB93CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+s08UDkslV26YtK+gc8ujVOn5d//WSt9TAVmnZFWOI=; b=XHEd2YidLvSdYYnfw23AQSCsuX
	is8BGnx8ZBQ3P2g7r5S2zRpCIJ8QB4ZGnIVYjxYPCcd2K7iwUr5/AZrjVX42kV6bNtxq3t2E5W6UN
	2uBzYBLByOsDEKPyQ1RFabLEBq97Z4w39HTE8atnY1nCkijzhl2z3xFH2u7Dh7pVFe7u8Tmir/dhB
	Rq8IimeA7cLZCdPWTwBhABlTk5xoPcUoJDKp5sh6+IavAWbg9G6duCa19TNjsDYP16qDnfZCJu+iH
	0Rs/iDJeXb4Lvy1Rl/ymV75Hagkcegjt3rCDgFN4R3WFxvaoZ3ETtizlNdxDsXTVU+r8rUKOJcXMD
	nzaPzTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eIf-00000006qWh-1TMi;
	Fri, 17 Oct 2025 06:50:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eIT-00000006qAg-2pUm;
	Fri, 17 Oct 2025 06:50:43 +0000
X-UUID: 94d89422ab2511f09f706fa2197c6ceb-20251016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=N+s08UDkslV26YtK+gc8ujVOn5d//WSt9TAVmnZFWOI=;
	b=Q5ZbYDzf2BwUAVvv0BbTsZ7K+vxRZ4/LhZ8Kzv9e0Ox/C6WYDl/2wWqH2LnukPD2GeqSzI1Y7xYtFjvmkDnzAE4Gu8jqI664YD2BbYzPQ/QTbH9dFO+DhxTIxdT92nzLvhaWRECb1+GN6PwZCJ57SNRN+osfgDVil7251Ue6WoQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:4d4563e3-7be6-4187-9898-591f6c0e49a1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:236d45b9-795c-4f99-91f3-c115e0d49051,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 94d89422ab2511f09f706fa2197c6ceb-20251016
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 114205450; Thu, 16 Oct 2025 23:50:34 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Oct 2025 14:50:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 17 Oct 2025 14:50:30 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v8 06/20] mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
Date: Fri, 17 Oct 2025 14:44:31 +0800
Message-ID: <20251017065028.1676930-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_235041_776061_0021AD7C 
X-CRM114-Status: GOOD (  19.28  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 95e8a5331b7c..a544108ddae7 100644
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
 
@@ -120,6 +128,45 @@ u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL(cmdq_get_shift_pa);
 
+static void cmdq_vm_init(struct cmdq *cmdq)
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
+	/* only configure the max CPR SRAM size to host vm (vm_id = 0) currently */
+	vm_cpr_gsize = GCE_VM_CPR_GSIZE_MAX << GCE_VM_CPR_GSIZE_FLD_SHIFT(0);
+
+	/* set all thread mapping to host vm currently */
+	for (i = 0; i < cmdq->pdata->thread_nr; i++)
+		vm_map[i] = GCE_VM_ID_MAP_HOST_VM << GCE_VM_ID_MAP_THR_FLD_SHIFT(i);
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
@@ -164,6 +211,7 @@ static void cmdq_init(struct cmdq *cmdq)
 
 	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
 
+	cmdq_vm_init(cmdq);
 	cmdq_gctl_value_toggle(cmdq, true);
 
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
-- 
2.43.0


