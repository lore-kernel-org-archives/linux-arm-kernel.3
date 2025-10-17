Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F629CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+8oEzPr5qq9q+wliDIotqMCZflVH0QaSk71eh0ISNw=; b=t2G/cfk+VspKVYgH75XkvnLg8r
	2egJcQ1AyLEDmcvvRdMENw/DhvIx+MIF/8tntAqVyirIku9yCvJ0usLfQ2OhPctLjrRMy9UxH7WOH
	lJvHxEva719qof4Wn457xone7APPPiHZYxB4d5gIw7zzH2S6Jp3yTruS1gZJuHKAwlxfSK8Vs+tpI
	eUNo2aunS4HNvL9DkcIiXoB23ztfKojdiL2whWWME34/lgxcuTM03BS08gK0T4GrMm1KIv3BlmmBt
	hGw4IwU8Q99eao6IxLoJYL8mz8UzWqPeHRstJw0iZzzO438LqRgWy4uL2gqxBwLC0NDW1fFQ8it/C
	EYGIHyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eJA-00000006rJB-1PPJ;
	Fri, 17 Oct 2025 06:51:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eIV-00000006qBQ-2kdm;
	Fri, 17 Oct 2025 06:50:46 +0000
X-UUID: 956a1082ab2511f0a52f393f94899d25-20251016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=w+8oEzPr5qq9q+wliDIotqMCZflVH0QaSk71eh0ISNw=;
	b=slQKsQ37tOkS4KJVYehOoLro2YBtJVfrHgJHPC7GYSpKgBc30udLwJpLN1vATtns20cwUFAtrRVptV5U7LK/opYnp1PUn6fbtiUmg9wVTH6M61j/BeRTjT8h4ZCbdSYPmtoCZgDLQFBz//8L3RRYg8xio4ccSz2+muNUNm/3xgU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:88d5665c-f4c1-44fd-9ddd-d7e81c59b27e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:25da5086-2e17-44e4-a09c-1e463bf6bc47,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 956a1082ab2511f0a52f393f94899d25-20251016
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 535823838; Thu, 16 Oct 2025 23:50:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 17 Oct 2025 14:50:30 +0800
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
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>, CK Hu
	<ck.hu@mediatek.com>
Subject: [PATCH v8 08/20] mailbox: mtk-cmdq: Add driver data to support for MT8196
Date: Fri, 17 Oct 2025 14:44:33 +0800
Message-ID: <20251017065028.1676930-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_235043_740086_A87AE755 
X-CRM114-Status: GOOD (  12.35  )
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

MT8196 has 2 new hardware configuration compared with the previous SoC,
which correspond to the 2 new driver data:

1. mminfra_offset: For GCE data path control
   Since GCE has been moved into mminfra, GCE needs to append the
   mminfra offset to the DRAM address when accessing the DRAM.

2. gce_vm: For GCE hardware virtualization control
   Currently, the first version of the mt8196 mailbox controller only
   requires setting the VM-related registers to enable the permissions
   of a host VM.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index a9c06e4bbad4..1bf6984948ef 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/sizes.h>
 #include <linux/mailbox_controller.h>
 #include <linux/mailbox/mtk-cmdq-mailbox.h>
 #include <linux/of.h>
@@ -840,6 +841,16 @@ static const struct gce_plat gce_plat_mt8195 = {
 	.gce_num = 2
 };
 
+static const struct gce_plat gce_plat_mt8196 = {
+	.thread_nr = 32,
+	.shift = 3,
+	.mminfra_offset = SZ_2G,
+	.control_by_sw = true,
+	.sw_ddr_en = true,
+	.gce_vm = true,
+	.gce_num = 2
+};
+
 static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_mt6779},
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_mt8173},
@@ -848,6 +859,7 @@ static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8188-gce", .data = (void *)&gce_plat_mt8188},
 	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_mt8192},
 	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_mt8195},
+	{.compatible = "mediatek,mt8196-gce", .data = (void *)&gce_plat_mt8196},
 	{}
 };
 MODULE_DEVICE_TABLE(of, cmdq_of_ids);
-- 
2.43.0


