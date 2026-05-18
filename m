Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7C0CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1OIqjzoD97WJDMvkcHJxKFh2vpQep87U1vwwejFjdw=; b=BFpkCL7JOsIRdG0/7Y60FvRNCJ
	jbDP9YVfKrMR6ZycrjSd+o1xmgq7mfUYq+HbuKuUHbaQpkgZ0Lsrz1x7JlWHX5n0+eC+U6N1G6abA
	QkzOJYDbJ8vH5Vj5NzI2krcPCLVCMMWkjryOlVv6lTOcwYMy1iaG0DZweYcgqj2WG86VKqpaZ5ccM
	VOa3ZK1+r9y9V6sEVynnteN0HkxHhD7A6vMZIE4bprCwGX9rtwf3w5MsCuPNWgwZnV/kfXppryX0e
	WIwpTkLf0xUrp8TR+m9PnaDq5Cro4j3MOalO7i53xXes2smH05EtlUemGOK5ofzfdFVzLjQlxIZTC
	HTgYYyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3xO-0000000GmME-3e0L;
	Mon, 18 May 2026 19:48:54 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3xK-0000000GmAZ-0Ntk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779133729; bh=P1OIqjzoD97WJDMvkcHJxKFh2vpQep87U1vwwejFjdw=;
 b=fVOt15BeTWyTPIU2qQfZ6QRyqwW0EiB9CMAkNgnY3DbjtAfYCyCp8DhJ8KvaGOXYoW461GUd7
 xH9RsHbGX0ilnzCMKGrlFWH25E1d/xmRETq8x/8bvFSNMTgf9Urn7yMTZvdKClvvdEwMvlkKX3o
 zNld1lspSzw97TtjqwV8PBMLpNtQqrI1trupptwicuWSXj82CnKrMKObKINSpsnNyDgdWd10H3O
 UQoSGJDwlo3n25vjYZIQesL3EBzA1KlZ9Br8RHtjaYdWvUpan//4X8NS2WQHR9JlkS4u62QztJt
 BJfQ3fCAsZyW5Ba+NJO6zTR7WZ5ZIjZsGwNi11wotujg==
X-Forward-Email-ID: 6a0b6d1cb74b0ebd362eef6a
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
Subject: [PATCH 12/13] drm/meson: dw-hdmi: Use dw_hdmi_schedule_hpd_work() helper
Date: Mon, 18 May 2026 19:47:40 +0000
Message-ID: <20260518194744.2483580-13-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518194744.2483580-1-jonas@kwiboo.se>
References: <20260518194744.2483580-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124850_237681_1E3D6656 
X-CRM114-Status: GOOD (  12.98  )
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

Change to use the dw-hdmi HPD delayed work to handle HPD events.

Also merge top and bottom half IRQ handlers to simplify IRQ handling now
that HPD event is handled using a delayed work.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 1dd59196ff7f..7b465e216759 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -145,7 +145,6 @@ struct meson_dw_hdmi {
 	struct reset_control *hdmitx_apb;
 	struct reset_control *hdmitx_ctrl;
 	struct reset_control *hdmitx_phy;
-	u32 irq_stat;
 	struct dw_hdmi *hdmi;
 	struct drm_bridge *bridge;
 };
@@ -498,10 +497,10 @@ static irqreturn_t dw_hdmi_top_irq(int irq, void *dev_id)
 	stat = dw_hdmi->data->top_read(dw_hdmi, HDMITX_TOP_INTR_STAT);
 	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_INTR_STAT_CLR, stat);
 
-	/* HPD Events, handle in the threaded interrupt handler */
+	/* HPD Events, handle in delayed work */
 	if (stat & (HDMITX_TOP_INTR_HPD_RISE | HDMITX_TOP_INTR_HPD_FALL)) {
-		dw_hdmi->irq_stat = stat;
-		return IRQ_WAKE_THREAD;
+		dw_hdmi_schedule_hpd_work(dw_hdmi->hdmi);
+		return IRQ_HANDLED;
 	}
 
 	/* HDMI Controller Interrupt */
@@ -513,20 +512,6 @@ static irqreturn_t dw_hdmi_top_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-/* Threaded interrupt handler to manage HPD events */
-static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
-{
-	struct meson_dw_hdmi *dw_hdmi = dev_id;
-	u32 stat = dw_hdmi->irq_stat;
-
-	/* HPD Events */
-	if (stat & (HDMITX_TOP_INTR_HPD_RISE | HDMITX_TOP_INTR_HPD_FALL) &&
-	    dw_hdmi->bridge)
-		drm_helper_hpd_irq_event(dw_hdmi->bridge->dev);
-
-	return IRQ_HANDLED;
-}
-
 /* DW HDMI Regmap */
 
 static int meson_dw_hdmi_reg_read(void *context, unsigned int reg,
@@ -715,9 +700,8 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_top_irq,
-					dw_hdmi_top_thread_irq, IRQF_SHARED,
-					"dw_hdmi_top_irq", meson_dw_hdmi);
+	ret = devm_request_irq(dev, irq, dw_hdmi_top_irq, IRQF_SHARED,
+			       "dw_hdmi_top_irq", meson_dw_hdmi);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to request hdmi top irq\n");
-- 
2.54.0


