Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE84C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 11:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C0ZJZPx2mfgjH2pMopT+tPtYYCICn14OT0CJ98yvDdk=; b=qYf5vj6Gh7vZVWggh1F0Mbrgd5
	daBdxrQO0tKnDhqWqhoAZaV3/oB0fcaAeVfZ07Aen9Qln360lhGG8lmzf3EQ/RaTR2EklLwIgBt7H
	7bIMOw1x7UjyZPyXm9QryWYabHCMmtyBdWeSdKgyD74RtYZ4auT77Z2QEOfHLu8DWGIXej8cgwBKC
	0qgkkwpPl8Dj9xyRI6LueX+610l9z2P/FSD+sHrvxe1O+aptvRvdAIsYvvpKfqwvcJsoQsKI4cCQY
	cALvdnF72Ji51ct6rejI49zaBnEyy6GQgyshTs1WQ3fWCJwrqSVfUOwVEO1KGuPeeTkUA1eOcSeXm
	BPe5k0CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjYN-00000004klt-2K00;
	Tue, 28 Jan 2025 11:14:47 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjX0-00000004kQY-39RS;
	Tue, 28 Jan 2025 11:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=C0ZJZ
	Px2mfgjH2pMopT+tPtYYCICn14OT0CJ98yvDdk=; b=AMhLtl8DfPv95KrviQfg3
	0RwKKg69vyI26pmTIJw5nfSDR/OmkewJ3gnyCxjhevTB03jWzLgpsEHWjtM/JfQb
	FB0D3xrlF5dN2Mbnd+5DE7MLjtpBnOQ2rY790kdJGUAo7iWhqBAxRvg/A2Gpy4Nc
	xuD9+xTsdVOKck7vZ/WA8k=
Received: from DESKTOP-DMSSUQ5.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3V8m3u5hn6uWxIw--.63804S2;
	Tue, 28 Jan 2025 19:12:55 +0800 (CST)
From: oushixiong1025@163.com
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/mediatek: Convert to use devm_platform_ioremap_resource
Date: Tue, 28 Jan 2025 17:41:18 +0800
Message-ID: <20250128094118.1526-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3V8m3u5hn6uWxIw--.63804S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3tryxAFW8JFWrKrW5trb_yoWktFX_Wa
	yvkrs7WryUCr95X3WxCF47CFy2yanY9FykJF13Kayava47Jw1UZrWjvr9rZrsrWws7AFyq
	yanIq3W29a1fCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8fu4UUUUUU==
X-Originating-IP: [113.247.116.130]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYw3iD2eYnOP7BQAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_031323_186956_EE5F08B5 
X-CRM114-Status: GOOD (  10.85  )
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

From: Shixiong Ou <oushixiong@kylinos.cn>

Do not need to get resource, so convert to use
devm_platform_ioremap_resource.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/mediatek/mtk_padding.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
index b4e3e5a3428b..7e302724e74a 100644
--- a/drivers/gpu/drm/mediatek/mtk_padding.c
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -95,7 +95,6 @@ static int mtk_padding_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_padding *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -107,7 +106,7 @@ static int mtk_padding_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->clk),
 				     "failed to get clk\n");
 
-	priv->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	priv->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->reg))
 		return dev_err_probe(dev, PTR_ERR(priv->reg),
 				     "failed to do ioremap\n");
-- 
2.43.0


