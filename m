Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A74CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 03:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uilWK9pxP4N3+juvbcZo5GClSyfc42uLaTShdPX4r0I=; b=RpHvZ6wKC/NkX3Du8aKjn2WFig
	TOAgD4vN/Y4vmKEuZJ4eIMan/v9ogX3x2XbYIh5jIU8wY2QExUtrEfpZM7aBh9h//Jmm5UgnVVBq9
	DCtoqpZGt8XTZ7yLrToXkrj8aweOZ318Wf+IYUKSHvhs89ZHfaDFFGJwudhKrHov8yS5rqYp1ltKk
	+hqozhRM/Rlcm/AFbj/gjpbh7LRw+4UhLByXYfCDucBgZIduCS/ZZ/zD6gMNBGeJDi7XkXvv+BSEa
	58cgvZp6MLuniEJTzqq4QsB9jPHlElFIxrSBv+kZQqSEayeKe6Ma9hoFj1GWx4vRQxsAyXa+1Od5Q
	hmIxeuUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGULx-0000000CxQt-1AK3;
	Wed, 05 Nov 2025 03:38:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGULs-0000000CxOX-1ijl;
	Wed, 05 Nov 2025 03:38:29 +0000
X-UUID: e2c752aeb9f811f0a52f393f94899d25-20251104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uilWK9pxP4N3+juvbcZo5GClSyfc42uLaTShdPX4r0I=;
	b=soyDW3pElaHLbCKgqx85jzG1xabJModRxN2rF4UkrRF9wFB7zssy2J7iXgRhQRIQnk9SQogKgpYJmxL4DJfzOrn3dPaunxYhYRIHxqBzgMIwXFO/US8/+SCJ7pB4f1xPHNeCPfx8Z3FY01HJUaDt3sn5Ev51tmdFmY676Kkjnuc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:7069a1eb-3dec-4b5f-9d8a-3ed8868211ca,IP:0,UR
	L:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-20
X-CID-META: VersionHash:a9d874c,CLOUDID:2ce1eb7c-f9d7-466d-a1f7-15b5fcad2ce6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:1,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e2c752aeb9f811f0a52f393f94899d25-20251104
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <niklaus.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1351772141; Tue, 04 Nov 2025 20:38:25 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 5 Nov 2025 11:38:22 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 5 Nov 2025 11:38:22 +0800
From: niklaus.liu <Niklaus.Liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <zhigang.qin@mediatek.com>, <sen.chu@mediatek.com>,
	Niklaus Liu <niklaus.liu@mediatek.com>
Subject: [PATCH v4 1/1] soc: mediatek: mtk-regulator-coupler: Add support for MT8189
Date: Wed, 5 Nov 2025 11:38:03 +0800
Message-ID: <20251105033817.20427-2-Niklaus.Liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251105033817.20427-1-Niklaus.Liu@mediatek.com>
References: <20251105033817.20427-1-Niklaus.Liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_193828_445454_8475E113 
X-CRM114-Status: GOOD (  15.62  )
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

From: Niklaus Liu <niklaus.liu@mediatek.com>

Enhance the regulator coupler driver to support GPU power control on the
MediaTek MT8189 platform. This update ensures proper coordination of
multiple regulators required for GPU operation,improving power management
and system stability.

Signed-off-by: Niklaus Liu <niklaus.liu@mediatek.com>
---
 drivers/soc/mediatek/mtk-regulator-coupler.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/mediatek/mtk-regulator-coupler.c
index 0b6a2884145e..e2a1fb459e42 100644
--- a/drivers/soc/mediatek/mtk-regulator-coupler.c
+++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
@@ -42,6 +42,18 @@ static int mediatek_regulator_balance_voltage(struct regulator_coupler *coupler,
 	int max_uV = INT_MAX;
 	int ret;
 
+	/*
+	 * When vsram_gpu is enabled or disabled and the use_count of the
+	 * vsram_gpu regulator is zero, the regulator coupler driver will
+	 * execute regulator_do_balance_voltage, which adjusts the vsram_gpu
+	 * voltage to the minimum value. This may result in vsram_gpu being
+	 * lower than vgpu. Therefore, when enabling or disabling vsram_gpu,
+	 * the 8189 temporarily skips the regulator coupler driver's modification
+	 * of the vsram_gpu voltage.
+	 */
+	if (of_machine_is_compatible("mediatek,mt8189") && rdev == mrc->vsram_rdev)
+		return 0;
+
 	/*
 	 * If the target device is on, setting the SRAM voltage directly
 	 * is not supported as it scales through its coupled supply voltage.
@@ -148,6 +160,7 @@ static int mediatek_regulator_coupler_init(void)
 	if (!of_machine_is_compatible("mediatek,mt8183") &&
 	    !of_machine_is_compatible("mediatek,mt8186") &&
 	    !of_machine_is_compatible("mediatek,mt8188") &&
+	    !of_machine_is_compatible("mediatek,mt8189") &&
 	    !of_machine_is_compatible("mediatek,mt8192"))
 		return 0;
 
-- 
2.46.0


