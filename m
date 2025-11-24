Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4269BCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkFPhvnssFwdabScSzVUBJl7AWvF4qJiRWBgEepccCU=; b=dhXe17nHPxmsbGardp/GYfbKp/
	yZSvewT6LMxUVTv16Wy/B/x5Iz6NRNCaqTr6aDeZp0ITnKJeJbuTHlFdwpy5CgzPingCneWhwvFUB
	iqJHbS9ApIHyhqYMvGo1iYOCspXlEgnLd4V/j8NAGq6ro73+PGO5GOKHiedWnszXy9Tey1CGF2RoT
	MIty8hzIZrmn+B6Y0CcmxFK726OxYhX68yxV6to9AaSEN+D3RK54x0sVQL70ZjZoWv2gRjeGA+wuw
	cR8PatAnxTHwk0NnRHYVvkVBG2Bh1kdo2D19M4+uYzaFXGdWDjlkxfU0kppkD86ohUGQGa6rFZEUh
	A3t5GFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUPq-0000000BVKx-2WOA;
	Mon, 24 Nov 2025 11:07:30 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUPk-0000000BVFm-1Pce;
	Mon, 24 Nov 2025 11:07:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763982435; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UD0Wb+j5c6m/0ShV/FUC9GVDFrHSx0YYSY7Ziib54ppZ2bsLBPL3Mqf3eVEemtHEIzViarboarRGo6uHGkP2rpG2ZZev5HJ6Bf70LEL1Lj4Prfcpf3SgEZcPfmayA6UA2mjxRsNdLXX1owUt8kAeUDU9rUo22OQpDRJPX4xAU3g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763982435; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kkFPhvnssFwdabScSzVUBJl7AWvF4qJiRWBgEepccCU=; 
	b=cLxqs0eQDApWct70qGZj5Nq0AN/rozNzHM9+UHr5gxQSQ2wnWlMEh+gfo1GinpDnZGL5I+xXLN82Xpxqdme1QOKnZPphabPYUJidrKE81xfsq4645UxKBtUP9q8xlqAVDq/caLvaByblv+h4DlLAlMrqA0coUrtFNfHr54XGim8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763982435;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=kkFPhvnssFwdabScSzVUBJl7AWvF4qJiRWBgEepccCU=;
	b=UL/OfK1+YmvySUgeXnPsXvTKBW33wn2MXm86Q2idLyojW/SEm/LIzgl6MsCati72
	tkWCdRkyPXSOAiANpou+h36/mrjCJltyBBgxUW4RCHoGY3zmSQWUNykmkHoVvcgQuzP
	gVQTPipILgOBHFHOz8EJ6WPKsUNlpoAlbP4bV+g0=
Received: by mx.zohomail.com with SMTPS id 1763982434008998.6034952190819;
	Mon, 24 Nov 2025 03:07:14 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 24 Nov 2025 12:06:54 +0100
Subject: [PATCH v2 05/13] soc: mediatek: mtk-dvfsrc: Add and propagate
 DVFSRC bandwidth type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-mt8196-dvfsrc-v2-5-d9c1334db9f3@collabora.com>
References: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
In-Reply-To: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Henry Chen <henryc.chen@mediatek.com>, Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_030724_466866_FBDBF05B 
X-CRM114-Status: GOOD (  11.40  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

In preparation for adding support for DVFSRC Version 4, add a new
mtk_dvfsrc_bw_type enumeration, and propagate it from specific bw
setting callbacks to __dvfsrc_set_dram_bw_v1(), which will use it
to choose calculation multipliers and dividers in v4 callbacks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 7708b07ab2d6..a684e405daf7 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -36,6 +36,13 @@
 #define MTK_SIP_DVFSRC_INIT		0x0
 #define MTK_SIP_DVFSRC_START		0x1
 
+enum mtk_dvfsrc_bw_type {
+	DVFSRC_BW_AVG,
+	DVFSRC_BW_PEAK,
+	DVFSRC_BW_HRT,
+	DVFSRC_BW_MAX,
+};
+
 struct dvfsrc_bw_constraints {
 	u16 max_dram_nom_bw;
 	u16 max_dram_peak_bw;
@@ -268,7 +275,7 @@ static void dvfsrc_set_vscp_level_v2(struct mtk_dvfsrc *dvfsrc, u32 level)
 }
 
 static void __dvfsrc_set_dram_bw_v1(struct mtk_dvfsrc *dvfsrc, u32 reg,
-				    u16 max_bw, u16 min_bw, u64 bw)
+				    int type, u16 max_bw, u16 min_bw, u64 bw)
 {
 	u32 new_bw = (u32)div_u64(bw, 100 * 1000);
 
@@ -285,21 +292,21 @@ static void dvfsrc_set_dram_bw_v1(struct mtk_dvfsrc *dvfsrc, u64 bw)
 {
 	u64 max_bw = dvfsrc->dvd->bw_constraints->max_dram_nom_bw;
 
-	__dvfsrc_set_dram_bw_v1(dvfsrc, DVFSRC_SW_BW, max_bw, 0, bw);
+	__dvfsrc_set_dram_bw_v1(dvfsrc, DVFSRC_SW_BW, DVFSRC_BW_AVG, max_bw, 0, bw);
 };
 
 static void dvfsrc_set_dram_peak_bw_v1(struct mtk_dvfsrc *dvfsrc, u64 bw)
 {
 	u64 max_bw = dvfsrc->dvd->bw_constraints->max_dram_peak_bw;
 
-	__dvfsrc_set_dram_bw_v1(dvfsrc, DVFSRC_SW_PEAK_BW, max_bw, 0, bw);
+	__dvfsrc_set_dram_bw_v1(dvfsrc, DVFSRC_SW_PEAK_BW, DVFSRC_BW_PEAK, max_bw, 0, bw);
 }
 
 static void dvfsrc_set_dram_hrt_bw_v1(struct mtk_dvfsrc *dvfsrc, u64 bw)
 {
 	u64 max_bw = dvfsrc->dvd->bw_constraints->max_dram_hrt_bw;
 
-	__dvfsrc_set_dram_bw_v1(dvfsrc, DVFSRC_SW_HRT_BW, max_bw, 0, bw);
+	__dvfsrc_set_dram_bw_v1(dvfsrc, DVFSRC_SW_HRT_BW, DVFSRC_BW_HRT, max_bw, 0, bw);
 }
 
 static void dvfsrc_set_opp_level_v1(struct mtk_dvfsrc *dvfsrc, u32 level)

-- 
2.52.0


