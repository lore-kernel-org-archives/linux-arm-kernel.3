Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD3DCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrODbfuk3wTJKoiHHRnLVW+57KNQX+3wAOmW/vQujTc=; b=Xqgo3w8fgTIHqi41Vq8Yx7jAZt
	sievjYja+A9a2AbHSq/Cw8a+4WDpqxIjQ2vUViROJ8kR/JOoprIpYKeFMktPxf9vfQH3PjDHlW3c7
	sgZAaoYpDfBhQ34eCGZ0zrq2Bxj3p9m6wE2Y+iSr45t4F4Te8Ai9IVNuyjO19wFim3szws7VyFOWV
	zV+YMsyZ9iq22F0fLCGS0u0MLKVd/eZhBdh555Pn605PLJ4pnJtYAI5lYyBHZTCPBSGstwj4qNnBo
	dyKGAdr9RwlDkOjiee5tcugJ7iW4JThc9t619nSyk6YWBZQDDjx1ise4oLs2ZsekH7WUEtADNCOy5
	V/2p0Svg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwWs-00000005MKq-3SQx;
	Fri, 29 Aug 2025 10:40:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvI4-000000057hW-36eA;
	Fri, 29 Aug 2025 09:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756459259;
	bh=y/P+FPCXH4aX8jtnTkUBgDHbGcECOoCrXxvz0EPV99Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=meAcL0ZhwrR3MaUlpszpdIIDIg/d7+db9v7KD0FlU2ET/FxLCQZfLHNcQklJnDoi9
	 LNG+2m2pmHURGmE+R3zZYcWMjYboCxYm6xg2NMnhjFlX54zyymIrByUcz9i1BQAfQf
	 nzi5lldbl1vk6QzBhpJiSEH0eeYABLspEQigfr1kp8mZY6jeHwsNV0/ct9SV24wFjM
	 R/q65/Iynuo9t2PSjy8AWKc8EA8Q+yAa4v9musoLmGaM1U5BekBFBr1h4NhklBlXu4
	 qzlOGKDF4bcTxXvyejDe4pLp2U2CGAOSxjw+qKK2NjriUbGIElPJM6UXu3nUe/USus
	 rotGVab8pFbtQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:f5b1:db54:a11a:c333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 620A717E12A2;
	Fri, 29 Aug 2025 11:20:58 +0200 (CEST)
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
Subject: [PATCH v5 04/27] clk: mediatek: clk-mtk: Introduce mtk_clk_get_hwv_regmap()
Date: Fri, 29 Aug 2025 11:18:50 +0200
Message-Id: <20250829091913.131528-5-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829091913.131528-1-laura.nao@collabora.com>
References: <20250829091913.131528-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_022100_947078_8AC1E433 
X-CRM114-Status: GOOD (  11.56  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
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
index c17fe1c2d732..11962fac43ea 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -245,5 +245,6 @@ int mtk_clk_pdev_probe(struct platform_device *pdev);
 void mtk_clk_pdev_remove(struct platform_device *pdev);
 int mtk_clk_simple_probe(struct platform_device *pdev);
 void mtk_clk_simple_remove(struct platform_device *pdev);
+struct regmap *mtk_clk_get_hwv_regmap(struct device_node *node);
 
 #endif /* __DRV_CLK_MTK_H */
-- 
2.39.5


