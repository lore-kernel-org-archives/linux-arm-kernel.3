Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47072CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ah+6oejjEa4mXT9CXZAT+ZYjD1Tg2TrhXGQzZp6VuSo=; b=c6GswW75/RWfTapB7Hvg966TC5
	JK8vQotmi1+RHQIrrL27q1XwusgP0ISOuCaPhzS2tVt1+b/Fr+MMqh3buFJERhxyRbQp6arXL2PpZ
	kaIPd19Ok1mLdJfcP/ndZyQU3DAszpeIlDK9dKkphxxRPwHx16grz5+Ak3+K7ILRF/9hm71vvXwix
	dA9Webi+FHswixdMKqL7iMD9VaUD4LEKoL2JSoKbWeyAX2zzeTwJH+NJ4IsvfZC5FO9mK05UUZMNZ
	HHTpasC0/wTMh+mg1/ka0axrlnrXKc0TW2fLe3nqMrn9uBGNSTwFoIf/q4k7uHF7u5YQFNjaXOCse
	qGf+dKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV99-00000003CnK-1E3F;
	Tue, 29 Sep 2026 10:33:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV8O-00000003Bnq-3KAc;
	Tue, 29 Sep 2026 10:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ah+6oejjEa4mXT9CXZAT+ZYjD1Tg2TrhXGQzZp6VuSo=; b=qotjO62mfozQWhl8WoV83w1OZq
	pdmrND3j5T4etKk3wFe16HIgIQeExIi0BpY9ECIfLQ4pbYqu4HwPgqMDSfHUkY6C26/AIqmSKrg8i
	GfeeaRAyiVZdGlblrrQKdl+vY79maLL8hGH+QZLy6NzkS5QsoyK19O4Wk/L6Dkn96fcN10VwHGdNr
	BGKbhDja6bztdZaGhee9MMabxnYxEkpGrYjuqCyAr+my9spmMmMFUTFK3e+uClXB3n4gMpBV6g2WL
	nzK4+RQjepLSWM2IIAx6pUDtaIYDkCw/DEPDYrimRkA+/7yt5QKBcSvtgjjDX/dR/5fwcSlYw/vLq
	u3A1XlKA==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBV8J-00000002UAA-0akt;
	Tue, 29 Sep 2026 10:32:26 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260929103222euoutp0125a819f35be59fa21ab1abf25e0a47ad~ZxBnbuozr2203722037euoutp01M;
	Tue, 29 Sep 2026 10:32:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260929103222euoutp0125a819f35be59fa21ab1abf25e0a47ad~ZxBnbuozr2203722037euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790677942;
	bh=Ah+6oejjEa4mXT9CXZAT+ZYjD1Tg2TrhXGQzZp6VuSo=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=uwWI1NJDr7LUcgZ0JM/N27SZR7wumI+R3G5Lvhe3tSKAaSr8EwlhdNCqfgD4B+dYt
	 qFSwV608YvUzocp64xK3y3OcqzNnRe4YyIdIueKSEqaog7us1iym3eqd/Ojxh7IP6y
	 Cpa9BH3GMfMgOUWePNO5jGWnOJHbgtRJvj72n/x0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260929103221eucas1p264107850882dde96fcda4772332d4f41~ZxBnJAG1q0795707957eucas1p2S;
	Tue, 29 Sep 2026 10:32:21 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260929103219eusmtip16bb9ba02b2c6356ae9b3c8d18581dd9c~ZxBkebgML0259202592eusmtip1x;
	Tue, 29 Sep 2026 10:32:18 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 29 Sep 2026 12:31:05 +0200
Subject: [PATCH v5 08/21] drm/bridge: inno-hdmi: Split probe out of bind
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-jh7110-clean-send-v5-8-82b4d8e3c6c7@samsung.com>
In-Reply-To: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,  Robert Foss
	<rfoss@kernel.org>,  Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Andy Yan
	<andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>,  Emil
	Renner Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, 
	Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
	<sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260929103221eucas1p264107850882dde96fcda4772332d4f41
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260929103221eucas1p264107850882dde96fcda4772332d4f41
X-EPHeader: CA
X-CMS-RootMailID: 20260929103221eucas1p264107850882dde96fcda4772332d4f41
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20260929103221eucas1p264107850882dde96fcda4772332d4f41@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_113225_310192_709E7FF8 
X-CRM114-Status: GOOD (  26.56  )
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

inno_hdmi_bind() both sets up the bridge and attaches it to a DRM
encoder. A platform whose HDMI controller is a child of a larger device
needs the first half without the second, since it registers as its own
platform driver and lets the DRM core bind the bridge later.

Move the setup into a new exported inno_hdmi_probe(), and reduce
inno_hdmi_bind() to a wrapper around it.

No functional change intended.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 49 +++++++++++++++++++++++++++++++++-----
 include/drm/bridge/inno_hdmi.h     |  4 ++++
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index d7c33b92e2ddf4ced84d17304463f44be52270b8..7a9f54dce2647f0320d77629a28154eade14385f 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -929,7 +929,14 @@ static irqreturn_t inno_hdmi_irq(int irq, void *dev_id)
 {
 	struct inno_hdmi *hdmi = dev_id;
 
-	drm_helper_hpd_irq_event(hdmi->bridge.dev);
+	/*
+	 * The interrupt is requested in probe, but bridge.dev is only set once
+	 * the DRM master binds and attaches the bridge, which may never happen.
+	 * Drop hotplug events that arrive before then rather than dereference a
+	 * NULL drm_device.
+	 */
+	if (hdmi->bridge.dev)
+		drm_helper_hpd_irq_event(hdmi->bridge.dev);
 
 	return IRQ_HANDLED;
 }
@@ -1061,11 +1068,24 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 	return adap;
 }
 
-struct inno_hdmi *inno_hdmi_bind(struct device *dev,
-				 struct drm_encoder *encoder,
-				 const struct inno_hdmi_plat_data *plat_data)
+/**
+ * inno_hdmi_probe - Internal helper to perform common setup
+ * @pdev: platform device
+ * @plat_data: SoC-specific platform data
+ *
+ * This function handles all the common hardware setup: allocating the main
+ * struct, mapping registers, getting clocks, initializing the hardware,
+ * setting up the IRQ, and initializing the DDC adapter and bridge struct.
+ * It returns a pointer to the inno_hdmi struct on success, or an ERR_PTR
+ * on failure.
+ *
+ * This function is used by modern, decoupled MFD/glue drivers. It registers
+ * the bridge but does not attach it.
+ */
+struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
+				  const struct inno_hdmi_plat_data *plat_data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
+	struct device *dev = &pdev->dev;
 	struct inno_hdmi *hdmi;
 	int irq;
 	int ret;
@@ -1128,7 +1148,24 @@ struct inno_hdmi *inno_hdmi_bind(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	return hdmi;
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_probe);
+
+struct inno_hdmi *inno_hdmi_bind(struct device *dev,
+				 struct drm_encoder *encoder,
+				 const struct inno_hdmi_plat_data *plat_data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct inno_hdmi *hdmi;
+	int ret;
+
+	hdmi = inno_hdmi_probe(pdev, plat_data);
+	if (IS_ERR(hdmi))
+		return hdmi;
+
+	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
index 5bbcaeea94e2a20fd0dc0ae0c6946eb5604bbaf6..81da9d9bcd79db8fe26c6dff4569371e484df608 100644
--- a/include/drm/bridge/inno_hdmi.h
+++ b/include/drm/bridge/inno_hdmi.h
@@ -12,6 +12,7 @@ struct device;
 struct drm_encoder;
 struct drm_display_mode;
 struct inno_hdmi;
+struct platform_device;
 
 struct inno_hdmi_plat_ops {
 	void (*enable)(struct device *pdev, struct drm_display_mode *mode);
@@ -32,4 +33,7 @@ struct inno_hdmi_plat_data {
 struct inno_hdmi *inno_hdmi_bind(struct device *pdev,
 				 struct drm_encoder *encoder,
 				 const struct inno_hdmi_plat_data *plat_data);
+
+struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
+				  const struct inno_hdmi_plat_data *plat_data);
 #endif /* __INNO_HDMI__ */

-- 
2.34.1


