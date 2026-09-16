Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511A4C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BQX5u7EIxGzspS9y6lVMIsO1LhHcOtkZEQ0httCNGZU=; b=DNsh8/lOIKJmgErHj3vN2z9twQ
	gBSZmm2aHCjMIJ3l1+mzGV5Qb59yR0Lq4tw+9/Twj3VGshv2bKu3t/wZBmIdBNzSNooptfvzCWZCs
	LmSPTXRdX3/KX2GMz9mWpH+nXywYfXZBFJG6e6pyQ0qxg8PazgjHnV/gJeQhYMs0TxL8SLcTeru8T
	aRxabvHCq3GHmJXx5FdsrbvgcvZCOtKeOIYLph8yWgIBB+29RYq4wi7/mrLYonBN3ZHxu342sSSV0
	eJd4ot8ZUJCBIMx96SD/Rxvn8lJUXjVc5arh7mOCZAReg+8q5bR/RO2JWwjp5tTllhcohXMDx0Xt3
	aHG3a3lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tgs-00000009tOF-3xYF;
	Wed, 16 Sep 2026 17:45:02 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tgq-00000009tNP-2sNe;
	Wed, 16 Sep 2026 17:45:02 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACXATyS1apq+9duCA--.23293S2;
	Thu, 17 Sep 2026 01:44:50 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	martin.blumenstingl@googlemail.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] drm/meson: Fix next_bridge reference leak in meson_encoder_cvbs_probe()
Date: Wed, 16 Sep 2026 17:44:22 +0000
Message-Id: <20260916174422.2088967-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACXATyS1apq+9duCA--.23293S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF1kZF17Gry8ury3AF4ruFg_yoW8ZFyrpr
	Z7tanxtry8Xw1rAw1DAF45AFsaywsrZF4fGw4qvw4fu34fCF1Utr93AF4Ykr1UCa90qF4r
	t3Z5Xr48WFW5CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9v14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF
	7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVWxJr
	0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VU1go2UUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAAMA2qqpO9ruAAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_104501_102684_439383E2 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

The failure paths after drm_bridge_add() return without removing the
bridge, so the bridge stays in the global bridge list, the reference
dropped by drm_bridge_add() is never released and the bridge is never
freed, leaking the next_bridge reference as well. Remove the bridge on
the encoder init, bridge attach and bridge connector error paths.

Fixes: 47fa48b3faa7 ("drm/meson: encoder_cvbs: get/put the next bridge")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 41071d6e05e5..a4d280c5f8ed 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -259,9 +259,11 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 	/* Encoder */
 	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
 				      DRM_MODE_ENCODER_TVDAC);
-	if (ret)
+	if (ret) {
+		drm_bridge_remove(&meson_encoder_cvbs->bridge);
 		return dev_err_probe(priv->dev, ret,
 				     "Failed to init CVBS encoder\n");
+	}
 
 	meson_encoder_cvbs->encoder.possible_crtcs = BIT(0);
 
@@ -270,14 +272,17 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
+		drm_bridge_remove(&meson_encoder_cvbs->bridge);
 		return ret;
 	}
 
 	/* Initialize & attach Bridge Connector */
 	connector = drm_bridge_connector_init(priv->drm, &meson_encoder_cvbs->encoder);
-	if (IS_ERR(connector))
+	if (IS_ERR(connector)) {
+		drm_bridge_remove(&meson_encoder_cvbs->bridge);
 		return dev_err_probe(priv->dev, PTR_ERR(connector),
 				     "Unable to create CVBS bridge connector\n");
+	}
 
 	drm_connector_attach_encoder(connector, &meson_encoder_cvbs->encoder);
 
-- 
2.34.1


