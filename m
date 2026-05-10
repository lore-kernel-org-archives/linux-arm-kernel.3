Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8232DCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 18:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GhoY1fOJO8LWPdJh9qNDaVbnqnWOq2pyB0m4w0Zjdo=; b=HUg4Os0z9DuNCq7NWggHgbkDml
	djiPe+7OfuopnzhXv44dfPtZt7olcZb1AD2lal9t4jlgTrDV25a3o5G86kgsnp6cvzRyufOwMlFQI
	Zl2pLaDRRL7KxDjBaY5IkAt7P/9osOIfylMJImLeJE9TrdbAkfrq82luHBVthbXUbsUt9GD+CW/We
	VGZkKbUahxiW8OIPFf4fctQR3E6Q1xJD5yyMMQgEuUdMKUVSfaUYRtfGC5MMj2pTD33ZEqGonhjwE
	JdAMbTHdWXb2BZostmP4CLNJ6o6xxdtSzjKKMEJ5OYWc/jIM/ybFpehsNYGeCEb4Pfc4nkPJd7Yjq
	SGnU0DCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM8wX-0000000BMLR-1gvX;
	Sun, 10 May 2026 18:31:57 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM8wV-0000000BMJ7-1Eej
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 18:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778437905; bh=4GhoY1fOJO8LWPdJh9qNDaVbnqnWOq2pyB0m4w0Zjdo=;
 b=zJpIhBGWMydjTRFiBfGOBmqjvNHcsKrXqwkUbbRgwoEinae8BW6y97yhokkY7g5eF7KsVCCgn
 B+MVkpaKoJjviDihlWvf0xPVCTN96IlVVvJRSq/u4icYw0xgJOfa+dDfMIToP3Aa5iiExpXR4ZR
 NmqGYeZSfT1StGBkQuPIbBCZPDP+HsCKVvLqfkMsMMt7tORNKUYt4SkgyluI8wKVbyzjwPyyGt2
 3kQWnO9wXI45ItzTvdzwPryjwX/aYjpQGfoJQe/Xd1Yya7sBz9ZjujaLxTckZ/lZ2l+6fty7Eee
 9Kfy/JhGXpZBEXhhmq4AIyJ9VMRQ8/hvh8g8unI6Ymsw==
X-Forward-Email-ID: 6a00cf0b61db3ab145b0f292
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 05/10] drm/rockchip: dw_hdmi: Hold a reference to the dw-hdmi bridge
Date: Sun, 10 May 2026 18:31:06 +0000
Message-ID: <20260510183114.1248840-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510183114.1248840-1-jonas@kwiboo.se>
References: <20260510183114.1248840-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_113155_435089_58A49A92 
X-CRM114-Status: GOOD (  11.32  )
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

Take a reference on the dw-hdmi bridge during bind and drop it again
from unbind to ensure the bridge is kept alive for the lifetime of the
encoder component.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index c5cdf2d1f04b..c7933f3eb64f 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -79,6 +79,7 @@ struct rockchip_hdmi {
 	struct clk *hdmiphy_clk;
 	struct clk *ref_clk;
 	struct clk *grf_clk;
+	struct drm_bridge *bridge;
 	struct dw_hdmi *hdmi;
 	struct phy *phy;
 };
@@ -609,6 +610,13 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 		return dev_err_probe(dev, PTR_ERR(hdmi->hdmi),
 				     "failed to bind encoder\n");
 
+	hdmi->bridge = of_drm_find_and_get_bridge(np);
+	if (!hdmi->bridge) {
+		dw_hdmi_remove(hdmi->hdmi);
+		return dev_err_probe(dev, -ENODEV,
+				     "failed to find bridge\n");
+	}
+
 	return 0;
 }
 
@@ -617,6 +625,7 @@ static void dw_hdmi_rockchip_unbind(struct device *dev, struct device *master,
 {
 	struct rockchip_hdmi *hdmi = dev_get_drvdata(dev);
 
+	drm_bridge_put(hdmi->bridge);
 	dw_hdmi_unbind(hdmi->hdmi);
 }
 
-- 
2.54.0


