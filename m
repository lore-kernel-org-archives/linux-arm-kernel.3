Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5A0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFw9hDkRofkm7QyOK3hepymjuKDsl2o49j22MxsXHKQ=; b=HYxsWJK2EUSr3gcRavbs0bSdmK
	tGGH2Q0U1LwhP/Ob5s2Jqp16Rwf6XGxgimi6IRyNozGsuSojGNAvHWpA5UF/5IC/kuY1YFTb0EpRz
	kZnB4thv1euUt2VA4wGKl0T/f/3HUr951rFVdwqsKS4hrgAe66pVPVuL7w/uGCqYAO+ScZ6Nz6ZrU
	MEljV9TjZvtn7kjSgQOnBa6rj5KEallXKVO3yVQHTxQlBYXt+wF2yN9Zdqiv2EUFrtLpEZ9M6v3ws
	OXirdAtzDtJ6hJPH2mocbCGSC8d40l5YL/TBuZIodUbncV9M4nvEFgXzw6w09BHQclTpEfacC+g9s
	hajl0umg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujILu-0000000Cx7s-0I8V;
	Tue, 05 Aug 2025 14:09:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujI8n-0000000Cu82-0RCe;
	Tue, 05 Aug 2025 13:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754402143;
	bh=QrA/Xokh90+kDFECONsQQVqj9UU/nsY1j4IrUZFY+Jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bFcv2bXOmlm4namydLVeJNdj47+UeD9LlOs3lgHc0qhTzQOMwPmQMlaHCZalXK/wQ
	 FxwDLzMwRSNbWxRUlRi7HEZxo9VqA4xavs4SOYKvq9Oax91ikQ+yHrwHscHjy5HOtl
	 a+m4ycA5XNKqDKvCpf30+D7nNPJnllUpS9MylFTAZryxCednJz3SsIB92NapsJttpn
	 jdvtCa/YmnBDCKj5w/ysT9GckR6rjE4zZfs2JUVVAqXkj0zJX2j3OpRkdQlwMQ2JPt
	 3EYumniibZxa5pshiceqjAqNU3ppK/EpkThfirj4lylCsTDI94qzhtoyzKwMyn1aBg
	 CnI8CJWrQR81g==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:1976:d3fe:e682:e398])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B25A817E0DB9;
	Tue,  5 Aug 2025 15:55:42 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v4 04/27] clk: mediatek: clk-mtk: Introduce mtk_clk_get_hwv_regmap()
Date: Tue,  5 Aug 2025 15:54:24 +0200
Message-Id: <20250805135447.149231-5-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805135447.149231-1-laura.nao@collabora.com>
References: <20250805135447.149231-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_065545_299053_B351DADA 
X-CRM114-Status: GOOD (  11.85  )
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

On MT8196, some clock controllers use a separate regmap for hardware
voting via set/clear/status registers. Add mtk_clk_get_hwv_regmap() to
retrieve this optional regmap, avoiding duplicated lookup code in 
mtk_clk_register_muxes() and mtk_clk_register_gate().

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.c | 16 ++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index ba1d1c495bc2..19cd27941747 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -685,4 +685,20 @@ void mtk_clk_simple_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);
 
+struct regmap *mtk_clk_get_hwv_regmap(struct device_node *node)
+{
+	struct device_node *hwv_node;
+	struct regmap *regmap_hwv;
+
+	hwv_node = of_parse_phandle(node, "mediatek,hardware-voter", 0);
+	if (!hwv_node)
+		return NULL;
+
+	regmap_hwv = device_node_to_regmap(hwv_node);
+	of_node_put(hwv_node);
+
+	return regmap_hwv;
+}
+EXPORT_SYMBOL_GPL(mtk_clk_get_hwv_regmap);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 136a4bc6dbe6..8ed2c9208b1f 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -247,5 +247,6 @@ int mtk_clk_pdev_probe(struct platform_device *pdev);
 void mtk_clk_pdev_remove(struct platform_device *pdev);
 int mtk_clk_simple_probe(struct platform_device *pdev);
 void mtk_clk_simple_remove(struct platform_device *pdev);
+struct regmap *mtk_clk_get_hwv_regmap(struct device_node *node);
 
 #endif /* __DRV_CLK_MTK_H */
-- 
2.39.5


