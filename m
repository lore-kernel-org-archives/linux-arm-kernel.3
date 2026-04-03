Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13525E7E37F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 12:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KyOUdk8sUD/sDmy7Wqz7ebaRL1KwJyE3BposHwuZhfY=; b=p1CBEmQAbgWL/B3QJaDB/jQ1bE
	+CymW/pJ6MnhE0DJksrMB3oZQH+0KUQdYpzAkdYlB2LvWmFrvjjgsmEhnoY6c6IkuqHh9213Gx1K2
	l0Ql/NFQOlywjkDV7T7TFYVNOHI+ovUzLrTgN8Xx7yDtNbgmwitQR3cvxIeTAV+aypZHYeeJ8Gkoi
	us+SNVSr1xw7MocsqMUIvsKTHRg7lzzByLvf/oBfdueciR1kr8oHeUJd/qnJNXzEjwr8Gu0ytogDQ
	/kc8g0exDEOGVAJnSxZ67FlH2vK2cBC4sWKNOo5Fb7Y11EGO90lLRlMzj1QCCag+9mdDEL/sVefXW
	d+nINYwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8dCW-00000001zK8-2C2c;
	Fri, 03 Apr 2026 12:00:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8dCV-00000001zJz-1kRA;
	Fri, 03 Apr 2026 12:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF93A60127;
	Fri,  3 Apr 2026 12:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DD93C4CEF7;
	Fri,  3 Apr 2026 12:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775217634;
	bh=UUaHSx9UwNftr+A/xRgyf4A3CKUAZeQm+LUEO0i9hr8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=FTnDNmYEHuGlu/IzqKTLBW41dHDfKgeA4f62JAXgZ9gLiltvGY5sm1HKr/4wkJORE
	 W7K2wgFEz4Z2tKeYIHDF+N5hcNzU+jNy2d6bsXMznIk4mDeAnmpJfjS7/BTa4hqbvE
	 zxc0pKV3iwX/5XQmG9O30zVHKG6bCXErpDl0U5Knd7dYVIjtK9eD5Ltk31M3RSoNJL
	 ERx3egS5xpiHXKoalrlH9BQ+Pz+x2OQ6POs3gOwCx1+TNhWQz5kwK8sY9fVEghI4fm
	 7e9NzDDdxg1wWHp2wTSsQZcaj4XzhgSk+hc3eKOaHe6Cu7974VbEeT7TdyWViYYhG2
	 StysP9EdZfSoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4F6E7E36C;
	Fri,  3 Apr 2026 12:00:34 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamkalra98.zohomail.in@kernel.org>
Date: Fri, 03 Apr 2026 17:30:26 +0530
Subject: [PATCH] drm/mediatek: mtk_dpi: Open-code drm_simple_encoder_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-drm-mediatek-opencode-encoder-init-v1-1-7be86241b876@zohomail.in>
X-B4-Tracking: v=1; b=H4sIANmrz2kC/yXNwQrCMBCE4Vcpe3YhNiEHX0U81GSiqzQpmyhC6
 bsb7Wn4Lv+sVKGCSqdhJcVbqpTccTwMFO5TvoEldtNoRm+csRx15hlRpoYnlwU5lAjeR1myNLb
 eWg8XXEqWemhRJPn8T86X3fV1fSC0X5m27Qu6nSeShgAAAA==
X-Change-ID: 20260403-drm-mediatek-opencode-encoder-init-36336e4c4ff3
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Shivam Kalra <shivamkalra98@zohomail.in>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217629; l=2101;
 i=shivamkalra98@zohomail.in; s=20260402; h=from:subject:message-id;
 bh=9DjXSfOgfUU5yg/kiJD0QlllCcJ+4tIybh7zqyvb0Gs=;
 b=CrHLxQL+7xEDYiixoSol8OG9gkFNY9o81VC5AbB67EE257gn+LlkpL+BZzcJKQZPavGvGk+Bf
 t59unbL8axaCODm0YSBCBgdyugg5VYLhB8fx3mf9gsqeuXShXgfhmcW
X-Developer-Key: i=shivamkalra98@zohomail.in; a=ed25519;
 pk=U8kQSxcte8P8iZ6zB7phIj+Yl+i/5ntifBGuclgypx8=
X-Endpoint-Received: by B4 Relay for shivamkalra98@zohomail.in/20260402
 with auth_id=716
X-Original-From: Shivam Kalra <shivamkalra98@zohomail.in>
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
Reply-To: shivamkalra98@zohomail.in
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Shivam Kalra <shivamkalra98@zohomail.in>

The helper drm_simple_encoder_init() is a trivial wrapper around
drm_encoder_init() that only provides a static drm_encoder_funcs with
.destroy set to drm_encoder_cleanup(). Open-code the initialization
with a driver-specific instance of drm_encoder_funcs and remove the
dependency on drm_simple_kms_helper.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
---
Addresses the "Open-code drm_simple_encoder_init()" task from
Documentation/gpu/todo.rst.
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 53360b5d12ba..5b83ca6aecb2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -25,8 +25,8 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
@@ -993,6 +993,10 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
 	.debugfs_init = mtk_dpi_debugfs_init,
 };
 
+static const struct drm_encoder_funcs mtk_dpi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 void mtk_dpi_start(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
@@ -1026,8 +1030,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 
 	dpi->mmsys_dev = priv->mmsys_dev;
-	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
-				      DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(drm_dev, &dpi->encoder, &mtk_dpi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to initialize decoder: %d\n", ret);
 		return ret;

---
base-commit: 4b9c36c83b34f710da9573291404f6a2246251c1
change-id: 20260403-drm-mediatek-opencode-encoder-init-36336e4c4ff3

Best regards,
--  
Shivam Kalra <shivamkalra98@zohomail.in>



