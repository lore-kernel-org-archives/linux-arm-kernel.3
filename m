Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25199CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5OMj0CSdajzATG6j/dCDhDtBgJ3gMytB+btoMqUqdQ=; b=P08Avfqj80cAXCAGFUubMJvXTi
	Qmk3+Epl++XHjP9Fl9wFrkT27+yk6Z99myWaTGfNolpu8eK/Pw0oq7agLejFZuV6CNMHg2B3RO4x6
	szGRkULILBM1Igpy6VDFp21Hv9/+rXvwsKiifq8wPppBpLJY6EsBLapjiCAdI/b7ih3Cl+GKLgw9r
	nc1vLqeXsZxmFB2vhB2i1Otv2T56Z3mAGfpkpO0E/8FSXIX0aLsMAAvg67Iq+et3mDOTrnwP3oE4+
	/I2zAYkX2bpfBXNQuFxrw8XT3n80Xvc7IP2arWijkkFXsHWpWT95wFmsbTtyY5HaQ+LGCObeysCD5
	z3CCRW1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3xN-0000000GmJQ-2Pi5;
	Mon, 18 May 2026 19:48:53 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3xJ-0000000Gm9b-32hO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779133729; bh=l5OMj0CSdajzATG6j/dCDhDtBgJ3gMytB+btoMqUqdQ=;
 b=eyczZspXGNb5oSD3Vtvvv2v/EWuMO8WkyaAFnH841dfF7TmamPLt4js8zjgQx/lF0BxWJ4ZhP
 9oml/ak0TmkssAHCXoXeoajCwK6dZHEKU7YVrtN01Kip4oRRVjovXR3U0XNw25LNp+e6Wg9QQgG
 ez4VagmyAZV9EawgJUoR+YbHE5irLJkGBTOf7t1ju8IDigdPqFodcp1LLFXDt2yPawREDt1bOsz
 I6Dygj8jgGRmMhdCSbnBwUjwc7fSMnJWzucKDXomwRWhT+wrk/JNuWDvOfGdQ4THGj4YNpmKHs2
 UgBw5QDrUsMZbr08eZ3QuYtGLeXFyrCQ/jhPj2W3G9iw==
X-Forward-Email-ID: 6a0b6d0fb74b0ebd362eef17
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 09/13] drm/meson: dw-hdmi: Use devm_clk_get_enabled() helper
Date: Mon, 18 May 2026 19:47:37 +0000
Message-ID: <20260518194744.2483580-10-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518194744.2483580-1-jonas@kwiboo.se>
References: <20260518194744.2483580-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124849_888402_1B6DD2C2 
X-CRM114-Status: GOOD (  12.03  )
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

Change to use the devm_clk_get_enabled() helper instead of using an
open-coded variant.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 48 +++++++++------------------
 1 file changed, 16 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index fcd2426af9fc..d0cf2042d41c 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -634,29 +634,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 
 }
 
-static void meson_disable_clk(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
-static int meson_enable_clk(struct device *dev, char *name)
-{
-	struct clk *clk;
-	int ret;
-
-	clk = devm_clk_get(dev, name);
-	if (IS_ERR(clk)) {
-		dev_err(dev, "Unable to get %s pclk\n", name);
-		return PTR_ERR(clk);
-	}
-
-	ret = clk_prepare_enable(clk);
-	if (!ret)
-		ret = devm_add_action_or_reset(dev, meson_disable_clk, clk);
-
-	return ret;
-}
-
 static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 				void *data)
 {
@@ -666,6 +643,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct meson_drm *priv = drm->dev_private;
 	struct dw_hdmi_plat_data *dw_plat_data;
+	struct clk *clk;
 	int irq;
 	int ret;
 
@@ -716,17 +694,23 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (IS_ERR(meson_dw_hdmi->hdmitx))
 		return PTR_ERR(meson_dw_hdmi->hdmitx);
 
-	ret = meson_enable_clk(dev, "isfr");
-	if (ret)
-		return ret;
+	clk = devm_clk_get_enabled(dev, "isfr");
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Unable to get isfr pclk\n");
+		return PTR_ERR(clk);
+	}
 
-	ret = meson_enable_clk(dev, "iahb");
-	if (ret)
-		return ret;
+	clk = devm_clk_get_enabled(dev, "iahb");
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Unable to get iahb pclk\n");
+		return PTR_ERR(clk);
+	}
 
-	ret = meson_enable_clk(dev, "venci");
-	if (ret)
-		return ret;
+	clk = devm_clk_get_enabled(dev, "venci");
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Unable to get venci pclk\n");
+		return PTR_ERR(clk);
+	}
 
 	dw_plat_data->regm = devm_regmap_init(dev, NULL, meson_dw_hdmi,
 					      &meson_dw_hdmi_regmap_config);
-- 
2.54.0


