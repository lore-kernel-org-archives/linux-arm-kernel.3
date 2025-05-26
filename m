Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF19C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 10:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91e5x2EcR5Mt3gBhF7/AndsuLuz3EaR21v2cOsb+1pk=; b=oswUDk/fVNO5L0CpB/ENBsZF3F
	zMmo0vpfb6VOvfJzio9tpvo1oemI1B75equNjGQ4HZqDbohGLaZFRHp8Vt8UhDYil/zr/WVOVw9zn
	a9JIahvY/LehNGASNOIqxMa8H3l3Yv9RN5UXKnJrMUPuf/3z5vLSAAOVtRaB9eHjWlklCegOQzQl8
	bbNrFJ8w04EfdLMC+1vTioG1bwK/Lln36XyAyLqWJf7EROhPwukw0WYBvhOhmWr94wqFXld833JyM
	cb9elPR1N3f2Lu1h2jTu3GYHTbc7TBozS0zzxOYfIUynBTd+zpahquOmyNvjAqnhSZIxTRXlEJoX+
	+4tUGGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVDO-00000008dKJ-1LF4;
	Mon, 26 May 2025 10:37:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJV5v-00000008cUC-1hrT;
	Mon, 26 May 2025 10:30:13 +0000
X-UUID: 64a1e5583a1c11f0bed96b30c12bc3d6-20250526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=91e5x2EcR5Mt3gBhF7/AndsuLuz3EaR21v2cOsb+1pk=;
	b=KCBqZl1ZO+kSuZNNZzRv/SND//y8NtY1mE0rWoe152sRgjMbrHjC9BH79g9U9cG2KqxfP5L/sg/f901LK3VwoOkn+8Xgynfd7VqDgAeyyeZQebnJ4dvuSzFEB7UzFcU8YcL7SccKqWC7DBn+Hp2Mo+s++Nz2uMwEy32WnAwh0/8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:28b665b3-1677-4904-8c50-34e6bb9f8b36,IP:0,UR
	L:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-55
X-CID-META: VersionHash:0ef645f,CLOUDID:87471f59-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:2,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 64a1e5583a1c11f0bed96b30c12bc3d6-20250526
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <mason-cw.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 973425830; Mon, 26 May 2025 03:30:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 26 May 2025 18:30:02 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 26 May 2025 18:30:03 +0800
From: Mason Chang <mason-cw.chang@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
	<nfraprado@collabora.com>, Julien Panis <jpanis@baylibre.com>, Nicolas Pitre
	<npitre@baylibre.com>, Colin Ian King <colin.i.king@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Chen-Yu
 Tsai" <wenst@chromium.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Frank Wunderlich
	<frank-w@public-files.de>, Daniel Golle <daniel@makrotopia.org>, Steven Liu
	<steven.liu@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
CC: Mason Chang <mason-cw.chang@mediatek.com>
Subject: [PATCH 3/3] thermal/drivers/mediatek/lvts_thermal: add mt7988 lvts commands
Date: Mon, 26 May 2025 18:26:59 +0800
Message-ID: <20250526102659.30225-4-mason-cw.chang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
References: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_033011_460221_3CC227FB 
X-CRM114-Status: GOOD (  12.15  )
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

These commands are necessary to avoid severely abnormal and inaccurate
temperature readings that are caused by using the default commands.

Signed-off-by: Mason Chang <mason-cw.chang@mediatek.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 5b7bf29a7..4d49482f0 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1443,6 +1443,8 @@ static int lvts_resume(struct device *dev)
 }
 
 static const u32 default_conn_cmds[] = { 0xC103FFFF, 0xC502FF55 };
+static const u32 mt7988_conn_cmds[] = { 0xC103FFFF, 0xC502FC55 };
+
 /*
  * Write device mask: 0xC1030000
  */
@@ -1453,6 +1455,12 @@ static const u32 default_init_cmds[] = {
 	0xC10300FC, 0xC103009D, 0xC10300F1, 0xC10300E1
 };
 
+static const u32 mt7988_init_cmds[] = {
+	0xC1030300, 0xC1030420, 0xC1030500, 0xC10307A6, 0xC1030CFC,
+	0xC1030A8C, 0xC103098D, 0xC10308F1, 0xC1030B04, 0xC1030E01,
+	0xC10306B8
+};
+
 /*
  * The MT8186 calibration data is stored as packed 3-byte little-endian
  * values using a weird layout that makes sense only when viewed as a 32-bit
@@ -1747,11 +1755,11 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_data_ctrl[] = {
 
 static const struct lvts_data mt7988_lvts_ap_data = {
 	.lvts_ctrl	= mt7988_lvts_ap_data_ctrl,
-	.conn_cmd	= default_conn_cmds,
-	.init_cmd	= default_init_cmds,
+	.conn_cmd	= mt7988_conn_cmds,
+	.init_cmd	= mt7988_init_cmds,
 	.num_lvts_ctrl	= ARRAY_SIZE(mt7988_lvts_ap_data_ctrl),
-	.num_conn_cmd	= ARRAY_SIZE(default_conn_cmds),
-	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
+	.num_conn_cmd	= ARRAY_SIZE(mt7988_conn_cmds),
+	.num_init_cmd	= ARRAY_SIZE(mt7988_init_cmds),
 	.temp_factor	= LVTS_COEFF_A_MT7988,
 	.temp_offset	= LVTS_COEFF_B_MT7988,
 	.gt_calib_bit_offset = 24,
-- 
2.45.2


