Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1257AC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 10:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FUB6ZWjzcnRZpyYqQxmh0hZhd9uu2jl0jpKqWCj1cZc=; b=xDk2v36WBxXV0CVfTkRtMHWKem
	Ze+ZVAHJAYuw4hs2FyA/NjUpJSSzPmNOF+TXcCac6dTlAdV85oMKqdWTo6/OYg5Sx+xem+jfhvUoq
	VBVVxwfQcVV7G1ulXBPdNQbzHgWorQPQtRuXxdoLvxtM2V1IsQgembYmPRaNAQY1oVkGDNHYTtxAY
	qNAI4aRdAT8aTBuLiMpvfVVoXqpUDR0cxbAm9m7SXUvIstNDK5exmavojKJ2kHw98F8B6d5Ea/Ajb
	XExRcDSsEpaPq9rOKdYdcjLytVlInv47AR7gsCI6ZVpRxTZmeuKrGMUJcT60GmGg+DMwhXuNvkFuQ
	w/FBCYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRoW-0000000GO7r-1vYN;
	Mon, 24 Aug 2026 10:22:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRoV-0000000GO7d-2YWQ;
	Mon, 24 Aug 2026 10:21:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03AB243CC0;
	Mon, 24 Aug 2026 10:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB4BAC19425;
	Mon, 24 Aug 2026 10:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787566918;
	bh=mMxPnnGmmA+G7+r/GPriWEypHgjV/TV1mgBQxiAlsWc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tUo+Tct2bXXJenCEYtP0OWxu54STdxMBV/D6tDgt2t0EEcL7E87MKNICC6tTtkMrz
	 gnOUIWuHw/vtNLMsbZzARPMzLHvx0c6AkYSOAJneTyTXq94G/p+9Olo94gu0Po4l4C
	 n7bU9Ektwb+M4V53OUjRaSC+0PPJOKs4o8gx67M6zaQ5f91UG3nW/S2kPcD5ltLsv2
	 8npdbk97bylm2fcwSj6Ynsk0f5VpJJU5YLB7IiEo8HKvsj7f0TODGXSzsFfajlqpUp
	 +IBhRjLUYy109iIs1tlSi4Qb2SLvzGxhC9O8sEnFjs+LVGB4FcdTPqokLhkv/jbjE+
	 b7LybSmQ8lHnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6290C5DF9C;
	Mon, 24 Aug 2026 10:21:58 +0000 (UTC)
From: Johan Jonker via B4 Relay <devnull+jbx6244.gmail.com@kernel.org>
Date: Mon, 24 Aug 2026 12:21:19 +0200
Subject: [PATCH v2] drm/rockchip: rk3066_hdmi: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260824-drm-v2-1-7f9273c6020b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB4bjGoC/x2MQQqAMAzAviI9O5ChY/oV8dDNqj04pRURxL87P
 YaE3KAkTApdcYPQycpbymDLAuKCaSbDY2awlXWVt7UZZTVUO99OrsHgI+QyoJIJgikuX7uiHiS
 f2IUmvv59PzzPC0fXXRZuAAAA
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?H=C3=BCseyin_BIYIK?= <boogiepop@gmx.com>, 
 Johan Jonker <jbx6244@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787566916; l=1499;
 i=jbx6244@gmail.com; s=20260824; h=from:subject:message-id;
 bh=gBdOBm+5/o1a1xd4Bmk6AhfjkzD8KksLg7XU8cwssNc=;
 b=z6EnmGaIvC0JCbT+oiwCL4cHH96OWndTvfdzzWB2RDFX8yV33FbbSVgPjKU5kQIxXBk31f5z8
 1MCSkG9dw1/C6YYUQvnNufsRh0pyf1RgmtH81zuxSWVfXyT26r1UCjR
X-Developer-Key: i=jbx6244@gmail.com; a=ed25519;
 pk=MK5Flx1ndjAF0uwXdNm8VvvoghD4KWCNd2hQE8QGyl0=
X-Endpoint-Received: by B4 Relay for jbx6244@gmail.com/20260824 with
 auth_id=971
X-Original-From: Johan Jonker <jbx6244@gmail.com>
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
Reply-To: jbx6244@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hüseyin BIYIK <boogiepop@gmx.com>

The function devm_drm_bridge_alloc() is the new API for allocating DRM bridges.
This conversion was missed during the initial conversion of all bridges to
the new API.

Signed-off-by: Hüseyin BIYIK <boogiepop@gmx.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index f28d6a883e09..39c65ee07caa 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -703,7 +703,6 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	hdmi->bridge.driver_private = hdmi;
-	hdmi->bridge.funcs = &rk3066_hdmi_bridge_funcs;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
 			   DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HDMI |
@@ -747,9 +746,10 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 	int irq;
 	int ret;
 
-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
+	hdmi = devm_drm_bridge_alloc(dev, struct rk3066_hdmi, bridge,
+				     &rk3066_hdmi_bridge_funcs);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
 
 	hdmi->dev = dev;
 	hdmi->drm_dev = drm;

---
base-commit: 2709dd5ae32f0828f386327c76bba9f39f63a1c6
change-id: 20260824-drm-e4689f65ab8c

Best regards,
-- 
Johan Jonker <jbx6244@gmail.com>



