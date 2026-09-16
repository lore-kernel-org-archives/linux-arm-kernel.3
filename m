Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA28C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7w1uPyaYjbV/AzoYagowX8aCeRR8/9jNsyB2/i8ji+c=; b=Mpj0g7RbYLdEMXGA6fvBoNaKui
	P+IyKURh5qYYX+3kXjhyYhGjUkBNw8ZN9jKKq5G9g+rG+J4f8kmJk6UwRlw3IkB26CLKwKF5Fu8go
	7yn0WFDNVZD9IjRqIhwnKJ/pHIXxoj2HcnoR4GLU6oYtqlVmicAQjtZY5KQ8Vcnas2LP8cIOWhnl7
	2TZPjElSRl2mFlS+7fTFCyEWShqh3iaxsudEhLg62kdSxT3caucDPn3H2tr+0XePNdWGUKoRrQXx7
	OkVoqmGRKm53XK3QbzU7zEePOFtTM9ZXFrey6fIbEW1e7bSvA6Mi/qSWq2KzG6Car767dah+dzDpq
	gC/Gwprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pyY-00000009J5G-0auI;
	Wed, 16 Sep 2026 13:47:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pyK-00000009IsG-16BF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 13:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7w1uPyaYjbV/AzoYagowX8aCeRR8/9jNsyB2/i8ji+c=; b=Op9hYDjeaPCBf0drDoJcEmyN+H
	FjWIIuPPJFPimNW2n/4SRTdIKHtJx9UB2LvccrIdetiGX6qxUGZOwD19N7ki1/42lFWs6kA9y1bGl
	ChXeM8FIHyGhB8PK6UuAXtoiauLPQwXYOxe/AngQ8z0BZq2/DthR9//ZNeVSbHgJlgoga8zpksBES
	6a1z9tExuUY2zxWrksmwtGQLG4UV6VSNfJLHmCW8hlTaMM4Ve/44ry1T+zwknn//wlvqn+LmtFNPO
	XYzR4gaFC/3KMvdzE8livqbpShdJYhvhV1Bqqf/EPgha26E1U4E6BqO4JPvLasAsNSmiwVdfjpzKi
	OD1iOVGg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6pyH-00000007vxE-29hG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:46:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B396FC5CD63;
	Wed, 16 Sep 2026 13:47:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B325960337;
	Wed, 16 Sep 2026 13:46:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4434511C7B040;
	Wed, 16 Sep 2026 15:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789566396; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7w1uPyaYjbV/AzoYagowX8aCeRR8/9jNsyB2/i8ji+c=;
	b=CD66GLPbez6qUMGecDMwJly8JKoywBC1WJmMkpDzjFZPuWVq6yeMis4y+VCYVecsY3WIYm
	vsTHwQ61/noyLOFbuH2W6zMSQuXb2qLUvPlIhnVT50bz0GbCHWdWqHX/9Unmf0zwOdOru6
	LlmYDl/lmfZjOaSV7RWFuEFS/pY7IcwATZO+TbkaIf1QWlNf+Yx+EJPcLd+s31ga3oGG7b
	j5Aq5ByReKclJX44jXbDQYXcdqJgOlfqCTmsMg2qrbaFTKopsM15hucnJuu11yjgWCS8Cj
	U9+qTNQhtCjIbNLNta57oF1BRBsIhnyd0nzOEHKs+j9o8fCl1azbb/U3BjqTIQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 16 Sep 2026 15:45:31 +0200
Subject: [PATCH v3 07/19] drm/panel: deprecate panel-bridge APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-drm-bridge-every-panel-v3-7-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Sean Paul <sean@poorly.run>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Albert Esteve <aesteve@redhat.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, asahi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_144645_674933_66DFF0D7 
X-CRM114-Status: GOOD (  15.27  )
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

Now that a drm_bridge is embedded into every drm_panel, the panel_bridge is
not needed anymore. Its APIs are just accessing the embedded drm_bridge
transparently.

Deprecate them all, encouraging to use the drm_bridge API.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_panel.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 707ad9aa907a..c00529bfb706 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -250,6 +250,9 @@ EXPORT_SYMBOL(drm_bridge_is_panel);
  *
  * @panel: The drm_panel being wrapped.  Must be non-NULL.
  *
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and update your driver to stop using it.
+ *
  * For drivers converting from directly using drm_panel: The expected
  * usage pattern is that during either encoder module probe or DSI
  * host attach, a drm_panel will be looked up through
@@ -287,9 +290,8 @@ EXPORT_SYMBOL(drm_panel_bridge_add);
  * This is just like drm_panel_bridge_add(), but forces the connector type to
  * @connector_type instead of infering it from the panel.
  *
- * This function is deprecated and should not be used in new drivers. Use
- * drm_panel_bridge_add() instead, and fix panel drivers as necessary if they
- * don't report a connector type.
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and update your driver to stop using it.
  */
 struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 					      u32 connector_type)
@@ -306,6 +308,10 @@ EXPORT_SYMBOL(drm_panel_bridge_add_typed);
  * created by drm_panel_bridge_add().
  *
  * @bridge: The drm_bridge being freed.
+ *
+ * This function is deprecated. A drm_bridge is embedded into every panel
+ * and removed when the panel is removed.  Don't use it in new drivers and
+ * update your driver to stop using it.
  */
 void drm_panel_bridge_remove(struct drm_bridge *bridge)
 {
@@ -355,6 +361,9 @@ static void devm_drm_panel_bridge_release(struct device *dev, void *res)
  * @dev: device to tie the bridge lifetime to
  * @panel: The drm_panel being wrapped.  Must be non-NULL.
  *
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and update your driver to stop using it.
+ *
  * This is the managed version of drm_panel_bridge_add() which automatically
  * calls drm_panel_bridge_remove() when @dev is unbound.
  */
@@ -379,9 +388,8 @@ EXPORT_SYMBOL(devm_drm_panel_bridge_add);
  * This is just like devm_drm_panel_bridge_add(), but forces the connector type
  * to @connector_type instead of infering it from the panel.
  *
- * This function is deprecated and should not be used in new drivers. Use
- * devm_drm_panel_bridge_add() instead, and fix panel drivers as necessary if
- * they don't report a connector type.
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and update your driver to stop using it.
  */
 struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 						   struct drm_panel *panel,
@@ -422,6 +430,9 @@ static void drmm_drm_panel_bridge_release(struct drm_device *drm, void *ptr)
  * @drm: DRM device to tie the bridge lifetime to
  * @panel: The drm_panel being wrapped.  Must be non-NULL.
  *
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and update your driver to stop using it.
+ *
  * This is the DRM-managed version of drm_panel_bridge_add() which
  * automatically calls drm_panel_bridge_remove() when @dev is cleaned
  * up.
@@ -472,6 +483,10 @@ EXPORT_SYMBOL(drm_panel_bridge_connector);
  * @port: port in the device tree node
  * @endpoint: endpoint in the device tree node
  *
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and convert your driver to
+ * of_drm_get_bridge_by_endpoint().
+ *
  * Given a DT node's port and endpoint number, finds the connected node
  * and returns the associated bridge if any, or creates and returns a
  * drm panel bridge instance if a panel is connected.
@@ -508,6 +523,10 @@ EXPORT_SYMBOL(devm_drm_of_get_bridge);
  * @port: port in the device tree node
  * @endpoint: endpoint in the device tree node
  *
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and convert your driver to
+ * of_drm_get_bridge_by_endpoint().
+ *
  * Given a DT node's port and endpoint number, finds the connected node
  * and returns the associated bridge if any, or creates and returns a
  * drm panel bridge instance if a panel is connected.

-- 
2.55.0


