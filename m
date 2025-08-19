Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD4ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 02:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rt7a9tFP3NJpqQ87VNq7BzaEeeFPAru3oeg14qBjfDA=; b=4xtlnPHUC38VNDF8vcPyT9PT+L
	lB1v+iwoorfJJwVog5D1c9DZMAtUyzxqCZh++g9eDMl4Jjo+7o1a/KeY2WUG425faU18nOwrjCPE1
	MW5mhG5W7Ya58oC6Rh//mRwi0Yva3oiGSv2de+vDOMze8qON3lhF21j5/IyefWjb5NEcT2mQ5W379
	nnv1NQP0ghYCo5RbEs+FT0lHK50H5cCwCwR3Sr+IQ4UOW8zUFeM2V01WFCrUkrO/EeiGLfgQP3/3h
	fPlD3/FUfYUKFDx8Bm0E/1fAv4sIGhBWYPvm/IQDLreaf7RJWJXxEyoRk2ljhecS+CmSo+KWD7/Jw
	H+Qd1d1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBiw-00000009AOH-2nMO;
	Tue, 19 Aug 2025 02:05:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBdr-000000099bp-2Ey5;
	Tue, 19 Aug 2025 02:00:04 +0000
X-UUID: 373de2767ca011f09eb0dd999d3936bf-20250818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rt7a9tFP3NJpqQ87VNq7BzaEeeFPAru3oeg14qBjfDA=;
	b=spkpvnUHaOGPNbTYb0/pxI/5KmUQxZTYN3QJl7V8NqBznXKJ4lNlkewwqs2uSQuDgXoTImNgOWueEEpjutKa/Q9Ew2+qdpJcgeo0uRS2tLjpbQUT+URKZfGRem8uds8dQQPfrnGwjTNVLIHRKwWqzkBH+BG93xFBBdrvftsMd14=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:baac1536-53ec-40ca-9569-2740827cf468,IP:0,UR
	L:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:100
X-CID-META: VersionHash:f1326cf,CLOUDID:9f099d44-18c5-4075-a135-4c0afe29f9d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|801,TC:-5,Content:3|15|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 373de2767ca011f09eb0dd999d3936bf-20250818
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <xiandong.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1940605690; Mon, 18 Aug 2025 19:00:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 19 Aug 2025 09:59:58 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 19 Aug 2025 09:59:56 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Houlong Wei
	<houlong.wei@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: [PATCH v2 2/4] mailbox: mtk-cmdq: Add cmdq driver for mt8189
Date: Tue, 19 Aug 2025 09:59:39 +0800
Message-ID: <20250819015948.15450-3-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250819015948.15450-1-xiandong.wang@mediatek.com>
References: <20250819015948.15450-1-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_190003_579951_F0B8B672 
X-CRM114-Status: GOOD (  11.49  )
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

add cmdq driver support for mt8189

Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 177de5ab0ab2..543cd86b5bb0 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -799,12 +799,22 @@ static const struct gce_plat gce_plat_mt8195 = {
 	.gce_num = 2
 };
 
+static const struct gce_plat gce_plat_mt8189 = {
+	.thread_nr = 32,
+	.shift = 3,
+	.mminfra_offset = 0x40000000, /* 1GB */
+	.control_by_sw = false,
+	.sw_ddr_en = true,
+	.gce_num = 2
+};
+
 static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_mt6779},
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_mt8173},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_mt8183},
 	{.compatible = "mediatek,mt8186-gce", .data = (void *)&gce_plat_mt8186},
 	{.compatible = "mediatek,mt8188-gce", .data = (void *)&gce_plat_mt8188},
+	{.compatible = "mediatek,mt8189-gce", .data = (void *)&gce_plat_mt8189},
 	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_mt8192},
 	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_mt8195},
 	{}
-- 
2.46.0


