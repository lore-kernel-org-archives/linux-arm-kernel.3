Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4623C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 06:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYPAX7LoVN1/JdJmBbS2hnQMHCw7Autq/Ry7rigjYjU=; b=GS/1hJc6tK6MZwcd9My8qux01p
	gGbDYVi2WidRN032NpEZBGe5skquHLO8m3HMH4OtbKhwMjI2DCM01sjsqbjkkv2l2EYHf8wx8fQsG
	J1DfIjcU6VnvIDGv9dHR68JCqWqQnWxTEMzupXQDTO0KhGjR3O1N4GQk72mj5abLTV6aOAj8QaumS
	A7dG5oLB2TaWlO7C64g+auInCmF2av7b8aSCb8r6oagZifkj9n0KAhKUQXFCKVAcHSgxUVjYGZpBD
	E/0YAczoChb9jkn8pZrrBaoZLvtArdlypR6rcXyDmjgwTS8ItyNXcicbO4FU7/AFwVTKjyT+wpjL1
	SJbQ56Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8Ca-000000072g2-3kb3;
	Tue, 21 Jan 2025 06:57:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta86C-000000071ub-40Ak;
	Tue, 21 Jan 2025 06:50:58 +0000
X-UUID: 0e5e7d06d7c411ef9048ed6ed365623b-20250120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JYPAX7LoVN1/JdJmBbS2hnQMHCw7Autq/Ry7rigjYjU=;
	b=PGmKEFtaO94yD+kI6vRoN8lDW00uBqL6XQk5eza4HZVu6RAdRuhMVNc0h6SQwocaeOq7V1sBgRsDwhJq2YClrfzzVX3Klf9xp+WpVg11G+nnckQfti8PiCsSab5ZtGmMujLRpWEiqN6bnykEWF5QeoX/HRQbAZ7m34wvI6jCtGs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:88689237-cf79-4263-a6b3-c9a1b2f07d3e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:43c3380f-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:5,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0e5e7d06d7c411ef9048ed6ed365623b-20250120
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 465865602; Mon, 20 Jan 2025 23:50:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 21 Jan 2025 14:50:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 21 Jan 2025 14:50:48 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Garmin Chang
	<garmin.chang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: Friday Yang <friday.yang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 2/2] clk: mediatek: Add SMI LARBs reset for MT8188
Date: Tue, 21 Jan 2025 14:50:41 +0800
Message-ID: <20250121065045.13514-3-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250121065045.13514-1-friday.yang@mediatek.com>
References: <20250121065045.13514-1-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_225057_002464_0B30C5AE 
X-CRM114-Status: GOOD (  10.78  )
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

SMI LARBs require reset functions when applying clamp operations.
Add reset platform data for SMI LARBs in the image, camera and IPE
subsystems.

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8188-cam.c | 17 +++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-img.c | 18 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-ipe.c | 14 ++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8188-cam.c b/drivers/clk/mediatek/clk-mt8188-cam.c
index 7500bd25387f..9b029fdd584e 100644
--- a/drivers/clk/mediatek/clk-mt8188-cam.c
+++ b/drivers/clk/mediatek/clk-mt8188-cam.c
@@ -20,6 +20,8 @@ static const struct mtk_gate_regs cam_cg_regs = {
 #define GATE_CAM(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &cam_cg_regs, _shift, &mtk_clk_gate_ops_setclr)

+#define CAM_SYS_SMI_LARB_RST_OFF	(0xA0)
+
 static const struct mtk_gate cam_main_clks[] = {
 	GATE_CAM(CLK_CAM_MAIN_LARB13, "cam_main_larb13", "top_cam", 0),
 	GATE_CAM(CLK_CAM_MAIN_LARB14, "cam_main_larb14", "top_cam", 1),
@@ -72,6 +74,17 @@ static const struct mtk_gate cam_yuvb_clks[] = {
 	GATE_CAM(CLK_CAM_YUVB_CAMTG, "cam_yuvb_camtg", "top_cam", 2),
 };

+/* Reset for SMI larb 16a/16b/17a/17b */
+static u16 cam_sys_rst_ofs[] = {
+	CAM_SYS_SMI_LARB_RST_OFF,
+};
+
+static const struct mtk_clk_rst_desc cam_sys_rst_desc = {
+	.version = MTK_RST_SIMPLE,
+	.rst_bank_ofs = cam_sys_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(cam_sys_rst_ofs),
+};
+
 static const struct mtk_clk_desc cam_main_desc = {
 	.clks = cam_main_clks,
 	.num_clks = ARRAY_SIZE(cam_main_clks),
@@ -80,21 +93,25 @@ static const struct mtk_clk_desc cam_main_desc = {
 static const struct mtk_clk_desc cam_rawa_desc = {
 	.clks = cam_rawa_clks,
 	.num_clks = ARRAY_SIZE(cam_rawa_clks),
+	.rst_desc = &cam_sys_rst_desc,
 };

 static const struct mtk_clk_desc cam_rawb_desc = {
 	.clks = cam_rawb_clks,
 	.num_clks = ARRAY_SIZE(cam_rawb_clks),
+	.rst_desc = &cam_sys_rst_desc,
 };

 static const struct mtk_clk_desc cam_yuva_desc = {
 	.clks = cam_yuva_clks,
 	.num_clks = ARRAY_SIZE(cam_yuva_clks),
+	.rst_desc = &cam_sys_rst_desc,
 };

 static const struct mtk_clk_desc cam_yuvb_desc = {
 	.clks = cam_yuvb_clks,
 	.num_clks = ARRAY_SIZE(cam_yuvb_clks),
+	.rst_desc = &cam_sys_rst_desc,
 };

 static const struct of_device_id of_match_clk_mt8188_cam[] = {
diff --git a/drivers/clk/mediatek/clk-mt8188-img.c b/drivers/clk/mediatek/clk-mt8188-img.c
index cb2fbd4136b9..d44bfbd8308a 100644
--- a/drivers/clk/mediatek/clk-mt8188-img.c
+++ b/drivers/clk/mediatek/clk-mt8188-img.c
@@ -20,6 +20,8 @@ static const struct mtk_gate_regs imgsys_cg_regs = {
 #define GATE_IMGSYS(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &imgsys_cg_regs, _shift, &mtk_clk_gate_ops_setclr)

+#define IMG_SYS_SMI_LARB_RST_OFF	(0xC)
+
 static const struct mtk_gate imgsys_main_clks[] = {
 	GATE_IMGSYS(CLK_IMGSYS_MAIN_LARB9, "imgsys_main_larb9", "top_img", 0),
 	GATE_IMGSYS(CLK_IMGSYS_MAIN_TRAW0, "imgsys_main_traw0", "top_img", 1),
@@ -58,6 +60,17 @@ static const struct mtk_gate imgsys1_dip_nr_clks[] = {
 	GATE_IMGSYS(CLK_IMGSYS1_DIP_NR_DIP_NR, "imgsys1_dip_nr_dip_nr", "top_img", 1),
 };

+/* Reset for SMI larb 10/11a/11b/11c/15 */
+static u16 img_sys_rst_ofs[] = {
+	IMG_SYS_SMI_LARB_RST_OFF,
+};
+
+static const struct mtk_clk_rst_desc img_sys_rst_desc = {
+	.version = MTK_RST_SIMPLE,
+	.rst_bank_ofs = img_sys_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(img_sys_rst_ofs),
+};
+
 static const struct mtk_clk_desc imgsys_main_desc = {
 	.clks = imgsys_main_clks,
 	.num_clks = ARRAY_SIZE(imgsys_main_clks),
@@ -66,26 +79,31 @@ static const struct mtk_clk_desc imgsys_main_desc = {
 static const struct mtk_clk_desc imgsys_wpe1_desc = {
 	.clks = imgsys_wpe1_clks,
 	.num_clks = ARRAY_SIZE(imgsys_wpe1_clks),
+	.rst_desc = &img_sys_rst_desc,
 };

 static const struct mtk_clk_desc imgsys_wpe2_desc = {
 	.clks = imgsys_wpe2_clks,
 	.num_clks = ARRAY_SIZE(imgsys_wpe2_clks),
+	.rst_desc = &img_sys_rst_desc,
 };

 static const struct mtk_clk_desc imgsys_wpe3_desc = {
 	.clks = imgsys_wpe3_clks,
 	.num_clks = ARRAY_SIZE(imgsys_wpe3_clks),
+	.rst_desc = &img_sys_rst_desc,
 };

 static const struct mtk_clk_desc imgsys1_dip_top_desc = {
 	.clks = imgsys1_dip_top_clks,
 	.num_clks = ARRAY_SIZE(imgsys1_dip_top_clks),
+	.rst_desc = &img_sys_rst_desc,
 };

 static const struct mtk_clk_desc imgsys1_dip_nr_desc = {
 	.clks = imgsys1_dip_nr_clks,
 	.num_clks = ARRAY_SIZE(imgsys1_dip_nr_clks),
+	.rst_desc = &img_sys_rst_desc,
 };

 static const struct of_device_id of_match_clk_mt8188_imgsys_main[] = {
diff --git a/drivers/clk/mediatek/clk-mt8188-ipe.c b/drivers/clk/mediatek/clk-mt8188-ipe.c
index 8f1933b71e28..70a011c1f9ce 100644
--- a/drivers/clk/mediatek/clk-mt8188-ipe.c
+++ b/drivers/clk/mediatek/clk-mt8188-ipe.c
@@ -20,6 +20,8 @@ static const struct mtk_gate_regs ipe_cg_regs = {
 #define GATE_IPE(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &ipe_cg_regs, _shift, &mtk_clk_gate_ops_setclr)

+#define IPE_SYS_SMI_LARB_RST_OFF	(0xC)
+
 static const struct mtk_gate ipe_clks[] = {
 	GATE_IPE(CLK_IPE_DPE, "ipe_dpe", "top_ipe", 0),
 	GATE_IPE(CLK_IPE_FDVT, "ipe_fdvt", "top_ipe", 1),
@@ -28,9 +30,21 @@ static const struct mtk_gate ipe_clks[] = {
 	GATE_IPE(CLK_IPE_SMI_LARB12, "ipe_smi_larb12", "top_ipe", 4),
 };

+/* Reset for SMI larb 12 */
+static u16 ipe_sys_rst_ofs[] = {
+	IPE_SYS_SMI_LARB_RST_OFF,
+};
+
+static const struct mtk_clk_rst_desc ipe_sys_rst_desc = {
+	.version = MTK_RST_SIMPLE,
+	.rst_bank_ofs = ipe_sys_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(ipe_sys_rst_ofs),
+};
+
 static const struct mtk_clk_desc ipe_desc = {
 	.clks = ipe_clks,
 	.num_clks = ARRAY_SIZE(ipe_clks),
+	.rst_desc = &ipe_sys_rst_desc,
 };

 static const struct of_device_id of_match_clk_mt8188_ipe[] = {
--
2.46.0


