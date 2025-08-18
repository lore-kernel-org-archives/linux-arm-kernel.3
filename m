Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E28CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zTc9ILZszspIergQBlX6+NhSE6Fs5a72JurzfDZwPEA=; b=hLLvi0d338sQ5YUFQVuV9JL22N
	58t7xgE/FFHuNHp3ed6TE7UrsHYNcmiUJw7IWOWRkIroi9Mt23t7+ayy7AyV6b4cN9d4hIqsvsZJL
	RfaQi62aLT00XYALms7wriT7cp8VBSyMpkmjgsqayHF7yjj1GWKDsm9bFihkZAlYktVsE3CxHPWol
	iMSBXh8yIUgqWcfBK66aCU+uy9MP8gc4EBC8Y4TmMglcg4VBPgrE3t+dmPQH11sb0AWgjeQb2sNLU
	crwCTQIDm5gUNtGdfpvf73KpBgCdc/7SCgwxJ7+66sENmTokvI0a8bi7ofXEwk6ib4HMfDoY1/tzQ
	cGfi0qtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo03b-00000007UhD-2uFU;
	Mon, 18 Aug 2025 13:37:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvSB-00000006xg3-1sxW;
	Mon, 18 Aug 2025 08:42:56 +0000
X-UUID: 53ae029c7c0f11f09eb0dd999d3936bf-20250818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zTc9ILZszspIergQBlX6+NhSE6Fs5a72JurzfDZwPEA=;
	b=GibQaDwujkcuFxcFtqCRQUOl63b5NIQ5C+sDQAXh8wK/KwkX3tZBtcy8/1QF9Z2XCvWBQgDqVdeFSr0J4dp0X3/MbHuLc3l4ltUslZbcp70MMfV6Xc7O94bQdD0Ear/dEHt5w0M7aNWNMeQjdV4w6n/yqRfslqKEehq41PLO2pc=;
X-CID-CACHE: Type:Local,Time:202508180134-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:76fcc70c-f177-4135-beaa-541b09fbbf5b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:0c48556d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 53ae029c7c0f11f09eb0dd999d3936bf-20250818
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <payne.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 867325749; Mon, 18 Aug 2025 01:42:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 18 Aug 2025 16:42:48 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 18 Aug 2025 16:42:48 +0800
From: payne.lin <payne.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Bincai Liu <bincai.liu@mediatek.com>, Payne Lin
	<payne.lin@mediatek.com>
Subject: [PATCH] gpu: drm: mediatek: correct clk setting AUX_RX_UI_CNT_THR_AUX_FOR_26M
Date: Mon, 18 Aug 2025 16:42:36 +0800
Message-ID: <20250818084242.1045095-1-payne.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_014255_484949_1E928494 
X-CRM114-Status: GOOD (  11.46  )
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

From: Bincai Liu <bincai.liu@mediatek.com>

Updated the definition of AUX_RX_UI_CNT_THR_AUX_FOR_26M from 13 to 14.
No other code or logic changes were made; only the macro value was modified.
This change affects the timing configuration for AUX RX at 26MHz.
The formula is xtal_clk / 2 + 1.

Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
Signed-off-by: Payne Lin <payne.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 8ad7a9cc259e..f8c7b3c0935f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -301,7 +301,7 @@
 #define AUX_TIMEOUT_THR_AUX_TX_P0_VAL			0x1595
 #define MTK_DP_AUX_P0_3614			0x3614
 #define AUX_RX_UI_CNT_THR_AUX_TX_P0_MASK		GENMASK(6, 0)
-#define AUX_RX_UI_CNT_THR_AUX_FOR_26M			13
+#define AUX_RX_UI_CNT_THR_AUX_FOR_26M			14
 #define MTK_DP_AUX_P0_3618			0x3618
 #define AUX_RX_FIFO_FULL_AUX_TX_P0_MASK			BIT(9)
 #define AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK	GENMASK(3, 0)
-- 
2.45.2


