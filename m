Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95D9CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tm2VHiGgE02AiafDAdBgBBcxmDkPRVXXTrYESYA0XhU=; b=qSYc2DnrmvqpLNuE60Y2Vn9EX/
	MaRuioBsxlQ4fvHQwhGsHAgtlrnIfv2kBY5NFO1C9LFgxNbjY7TUKwydKp6L6CVW5c5iIqx0S+bqN
	0Psyi6al+rSbcRpgNbovxclg24KABAxjMEZRjX3MXEHdepXBm1VFXFv/mLlqtVLvKw5h0GzltlITm
	68NaGznFY4NSzbvb5SaElWt+zBXc/+DSPK/BBsK2X69tHfkJR/XpCKkIkvXPljoVzwow4f5lY907w
	VTSTh5FLojjiSK531JcYsMGVcvzWKGRrLeEK6G9gI7dt2/PA06wzqb42NtwsGM0mbdsHoS8cD/wxx
	yN4MxuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBNk-0000000By2f-0b5V;
	Mon, 01 Jun 2026 22:45:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBNh-0000000By0a-3Cjc;
	Mon, 01 Jun 2026 22:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780353911;
	bh=1TxawDU3yjqoMhD2RXj7CT9lQcvokN1vb2eWoTYf5Z4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TSOvRfFw5F3RtSqH3MW9Q5fC8Y58+untt3VP+tevALOHtUb5jwKJhjoHnOaeiwymu
	 BIvlgQ00gYQwP55hA3+aQKsVInMQ5ky8I1KUs0c2xBoQeJSYP9a8h8BcOKqL+Xm3NG
	 XcuAauYfJEBgBrnDlhKFnXOYgGqURxU4YTdHDgsJgXcChjAYdWB9WYrkAku2KKlXNf
	 ApB1jdqevU9Z7zUEwmN/6y9/h8I6cNXMhi7KaDlhlurDYbl4a9XHhPc6mf2kE44zvi
	 XN1zDxD9DeXOgcIW1oqCDwbZxxuTKyx5eNRtNljtEaYmClqxPbbMcyx/91dye7HBIf
	 hqPXgpW2a9lrg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 078C017E01B6;
	Tue,  2 Jun 2026 00:45:11 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 02 Jun 2026 01:44:01 +0300
Subject: [PATCH v7 01/30] drm/fb-helper: Remove unused local variable in
 hotplug_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dw-hdmi-qp-scramb-v7-1-445eb54ee1ed@collabora.com>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_154513_952636_6126365C 
X-CRM114-Status: GOOD (  11.14  )
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

Remove the 'err' local variable in drm_fb_helper_hotplug_event() which
only stores a return value that is never used beyond the immediate
return statement.  This simplifies the code without behavior changes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 7b11a582f8ec..3316bb00a662 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1744,21 +1744,17 @@ EXPORT_SYMBOL(drm_fb_helper_initial_config);
  */
 int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 {
-	int err = 0;
-
 	if (!drm_fbdev_emulation || !fb_helper)
 		return 0;
 
 	mutex_lock(&fb_helper->lock);
-	if (fb_helper->deferred_setup) {
-		err = __drm_fb_helper_initial_config_and_unlock(fb_helper);
-		return err;
-	}
+	if (fb_helper->deferred_setup)
+		return __drm_fb_helper_initial_config_and_unlock(fb_helper);
 
 	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
 		fb_helper->delayed_hotplug = true;
 		mutex_unlock(&fb_helper->lock);
-		return err;
+		return 0;
 	}
 
 	drm_master_internal_release(fb_helper->dev);
@@ -1802,4 +1798,3 @@ bool drm_fb_helper_gem_is_fb(const struct drm_fb_helper *fb_helper,
 	return gem == obj;
 }
 EXPORT_SYMBOL_GPL(drm_fb_helper_gem_is_fb);
-

-- 
2.54.0


