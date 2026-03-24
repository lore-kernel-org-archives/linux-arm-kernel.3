Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DC6F532CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxNLCKQ9ddz7+TDTiXJxhPHv6/rZ1vPdRVALXT4wAJk=; b=lMda9YqrBWE2oElfR69M1dlrEx
	oSgawivL824LruNpQOJOJrq+GMWJxMzKtbGGe8P/xz9vFaWHEPw+84wa0ACP9VS3SAc2qP6qmM9HO
	WgZ5lFrgRORjmx2h6IE7P1wXTmKmmcL0fXRk1C7A52Ew/k2o94f7uINyu+VaGI7SQtnZpx+jTKRv3
	l3/31gTujQsTV9c7FX6lcb5A3EiHcPyGY2u/0Fd3IwLmQYKTfi0EsfV63rKJ0LWtYcWb02oQWYK2n
	YYLc5n0hFiHuEK4KM7VNajFgha+uymk9cAaBS728klrP93lZyIjCm+II45uembxcHs9mtdVd1lsiO
	552MBtkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sPk-00000000TtR-1Z8g;
	Tue, 24 Mar 2026 03:26:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sPe-00000000TpB-2RDf;
	Tue, 24 Mar 2026 03:26:39 +0000
X-UUID: 41f7e5b8273111f1a6de359d7043e138-20260323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AxNLCKQ9ddz7+TDTiXJxhPHv6/rZ1vPdRVALXT4wAJk=;
	b=scr16/URaN+UQdkWCxUWsOAFaif1VrryuADEkNyEgDve8NjrHBrImhdNJ9DJEvOyFtnmBz8X//WFuVh+YlU/9muLi6OgRbhx3KVRGgwy1e9LxMevGyUqWhYAdGC/7LWZrPnUFTH9SPA7eElTAG+1CozpqyTkgZ5TJK81f6+UUjg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:72de558c-0c8e-40d0-8228-17283dadc3a0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:a8532294-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 41f7e5b8273111f1a6de359d7043e138-20260323
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ot_meiker.gao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 603645903; Mon, 23 Mar 2026 20:26:33 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 24 Mar 2026 11:26:31 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 24 Mar 2026 11:26:31 +0800
From: Meiker Gao <ot_meiker.gao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Bayi Cheng <bayi.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Meiker Gao <ot_meiker.gao@mediatek.com>
Subject: [PATCH 2/2] [v3] spi: spi-mtk-nor: Modify and optimization the SNFC.
Date: Tue, 24 Mar 2026 11:26:18 +0800
Message-ID: <20260324032624.1708029-3-ot_meiker.gao@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260324032624.1708029-1-ot_meiker.gao@mediatek.com>
References: <20260324032624.1708029-1-ot_meiker.gao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_202638_624714_C6C2288D 
X-CRM114-Status: GOOD (  14.81  )
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

Changes in v3:
    -this patch is a further optimization for version v2.

Changes in v2:
    -Use clk_bulk_xxx related functions to enable/disable clocks.

Changes in v1:
    -Add new function mtk_nor_parse_clk() to parse nor clock parameters.

Signed-off-by: Meiker Gao <ot_meiker.gao@mediatek.com>
Change-Id: Ifa13f9f08aebf6feb376ca98b0fd69f379037ff3
---
 drivers/spi/spi-mtk-nor.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 702339a6c817..6d24932053e5 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -100,7 +100,6 @@
 
 #define CLK_TO_US(sp, clkcnt)		DIV_ROUND_UP(clkcnt, sp->spi_freq / 1000000)
 
-#define MAX_CLOCK_CNT		6
 
 struct mtk_nor_caps {
 	u8 dma_bits;
@@ -119,8 +118,8 @@ struct mtk_nor {
 	void __iomem *base;
 	u8 *buffer;
 	dma_addr_t buffer_dma;
-	struct clk_bulk_data clocks[MAX_CLOCK_CNT];
-	int clock_cnt;
+	struct clk_bulk_data *clocks;
+	u8 clock_cnt;
 	unsigned int spi_freq;
 	bool wbuf_en;
 	bool has_irq;
@@ -733,19 +732,16 @@ static int mtk_nor_enable_clk(struct mtk_nor *sp)
 static int mtk_nor_parse_clk(struct device *dev, struct mtk_nor *sp)
 {
 	struct device_node *np = dev->of_node;
-	int ret;
 	const char *name;
-	int cnt,i;
+	int cnt,i,ret;
 
 	cnt = of_property_count_strings(np, "clock-names");
 	if (!cnt || (cnt == -EINVAL)) {
 		dev_err(dev, "Unable to find clocks\n");
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	} else if (cnt < 0) {
 		dev_err(dev, "Count clock strings failed, err %d\n", cnt);
-		ret = cnt;
-		goto out;
+		return cnt;
 	}
 
 	sp->clock_cnt = cnt;
@@ -760,9 +756,10 @@ static int mtk_nor_parse_clk(struct device *dev, struct mtk_nor *sp)
 	}
 
 	ret = devm_clk_bulk_get(dev, sp->clock_cnt, sp->clocks);
+	if (ret)
+		return ret;
 
-out:
-	return ret;
+	return 0;
 }
 
 static void mtk_nor_init(struct mtk_nor *sp)
-- 
2.45.2


