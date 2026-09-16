Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40F0C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 17:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NNflU0KGPzxsMugH0hb02+dq0QxMQ8lxukbI38kfzJM=; b=KUcTfPHlk69MppW9GsoGWD1Oj0
	GAktkY+AOXte59ONLAHpUbDYmkqKe68W+76mBFHb6av6Prn3tBNLZqd/WyMvvfvaA3xcgTxif/H5H
	9BQBOR1bp3bvpNI+fYBgeG5QHh/KBZqu3pFIJhVosoNYwoq8H+Lxn+wWuB8m82F3LKxwVuAjdqVrD
	HkG6oBGV50KCNpQcFCf3xZlMxSxQSFsqlKx29nmVFat8zb9smNYiRNGL40yyg9SiCkq2BtbCoPKAy
	4l3H9AI9vV2X4Ak+DFnes0QkMxRk0st6tuDTpVMxf1NbhKbojpzdaOX7WGtwIIkRSPQfXGKKEjNLe
	N9osCHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tez-00000009tAm-2eII;
	Wed, 16 Sep 2026 17:43:05 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tex-00000009t9S-0J55;
	Wed, 16 Sep 2026 17:43:04 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAA3oDog1apqdNFuCA--.23031S2;
	Thu, 17 Sep 2026 01:42:57 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: airlied@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	louisalexis.eyraud@collabora.com,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	simona@ffwll.ch,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] drm/mediatek: Fix runtime PM leak in mtk_hdmi_ddc_v2_probe()
Date: Wed, 16 Sep 2026 17:42:29 +0000
Message-Id: <20260916174229.2088824-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3oDog1apqdNFuCA--.23031S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr4xWryfWw4kWFWrAr17GFg_yoWkGFc_uw
	4q9rnrXFnxGF1DGr17tF4rZr97tFW3uw4kWFsYya4avry5AFyqvryqqF98ZrsrXrs3AFyD
	tws2qFyfAFsxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JF
	I_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Cr1j6r
	xdYxBIdaVFxhVjvjDU0xZFpf9x0JUtgA7UUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgAMA2qqok9yLgABs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_104303_492634_3E0A94AA 
X-CRM114-Status: GOOD (  11.26  )
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

pm_runtime_get_sync() unconditionally bumps the usage counter, but
nothing puts it back when devm_i2c_add_adapter() fails, leaving the DDC
runtime-resumed after a failed probe. Drop the reference on that error
path.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
index 31e81a6de6d8..1ec973d3f52c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
@@ -376,8 +376,10 @@ static int mtk_hdmi_ddc_v2_probe(struct platform_device *pdev)
 	pm_runtime_get_sync(dev);
 
 	ret = devm_i2c_add_adapter(dev, &ddc->adap);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
 		return dev_err_probe(dev, ret, "Cannot add DDC I2C adapter\n");
+	}
 
 	platform_set_drvdata(pdev, ddc);
 	return 0;
-- 
2.34.1


