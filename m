Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97D7D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 03:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VqqEAsneNFYY8k+GNal8ibP1/hmLNkCH05sJ3ZMoVw=; b=ZIzFAgH+1o3zIsY1Ti+qYIVIsb
	nHL7oi9Sk71QDZycNbwtkrn3U/vw4JWIM9PtrDINTImHmhaaabXuwTaBJAKW3VXnP8D6E94joQHkj
	dApl4uDkh9AjN8RxIOunOnSDrz/YGvx5ZnUVXp+uBj9cV3neqTWIQZzZ/0Km+xZ0vVQKVfC1FQds1
	teax81OP/bXcd+4BtT42kgqcTlnk/f7hi2xjwqc62O362CXg2zv9MLfDCoh10tFJhkFCmRbdIy4g1
	udfQskVA8To9CiZd0IIIygLsisEbzyQp7qgwBy5maSDozSHwcFztZwyUm6dvfhSCtZt8LJq36EevN
	3+XsB9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUzcJ-000000030KS-3h3I;
	Mon, 15 Dec 2025 03:51:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUzb0-00000002zfK-30Nd;
	Mon, 15 Dec 2025 03:50:07 +0000
X-UUID: 1dd5eb00d96911f0a52f393f94899d25-20251214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5VqqEAsneNFYY8k+GNal8ibP1/hmLNkCH05sJ3ZMoVw=;
	b=exij0irmpi0KKBZyi50mmAoTRqQWQSI4DfTOkwKU/BKYl2Cg6OnCwgvnNcAHFwV00D9TkhvwkVvrh8i/hSRkbo2M1kfwpJsSc1biDorXJ0874fFlHGtBcGXKZpgMtGojvT9EBQ0dUIvNQgAZPRH+ybqIY3vSGBixvXpy6aVMGX8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:dbaf5c6a-eb9b-4aad-b05c-c310384f1581,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:c26970c6-8a73-4871-aac2-7b886d064f36,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1dd5eb00d96911f0a52f393f94899d25-20251214
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1869142994; Sun, 14 Dec 2025 20:49:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 11:49:51 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 11:49:51 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Richard Cochran <richardcochran@gmail.com>
CC: Qiqi Wang <qiqi.wang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <irving-ch.lin@mediatek.com>
Subject: [PATCH v4 03/21] clk: mediatek: clk-mux: Make sure bypass clk enabled while setting MFG rate
Date: Mon, 15 Dec 2025 11:49:12 +0800
Message-ID: <20251215034944.2973003-4-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
References: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_195004_101480_84BB941B 
X-CRM114-Status: GOOD (  11.15  )
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

From: Irving-CH Lin <irving-ch.lin@mediatek.com>

Enable bypass clock before MFG changing rate, to make sure
MFG reference clock available during transient.

Fixes: b66add7a74e8 ("clk: mediatek: mux: add clk notifier functions")
Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 drivers/clk/mediatek/clk-mux.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index c5af6dc078a3..07f1f18b38bc 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -414,16 +414,21 @@ static int mtk_clk_mux_notifier_cb(struct notifier_block *nb,
 	struct clk_notifier_data *data = _data;
 	struct clk_hw *hw = __clk_get_hw(data->clk);
 	struct mtk_mux_nb *mux_nb = to_mtk_mux_nb(nb);
+	struct clk_hw *p_hw = clk_hw_get_parent_by_index(hw, mux_nb->bypass_index);
 	int ret = 0;
 
 	switch (event) {
 	case PRE_RATE_CHANGE:
-		mux_nb->original_index = mux_nb->ops->get_parent(hw);
-		ret = mux_nb->ops->set_parent(hw, mux_nb->bypass_index);
+		ret = clk_prepare_enable(p_hw->clk);
+		if (ret == 0) {
+			mux_nb->original_index = mux_nb->ops->get_parent(hw);
+			ret = mux_nb->ops->set_parent(hw, mux_nb->bypass_index);
+		}
 		break;
 	case POST_RATE_CHANGE:
 	case ABORT_RATE_CHANGE:
 		ret = mux_nb->ops->set_parent(hw, mux_nb->original_index);
+		clk_disable_unprepare(p_hw->clk);
 		break;
 	}
 
-- 
2.45.2


