Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E62CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y61aEmdvGyw4vA5vqIRiaVFAr9v3XoVduGYp096gOyM=; b=cziHsnrQ0tts52vJRopfmTd4Vf
	l1Mx++Nt/27bm2ebUaqfqt24QOj7OX09QCG76r13b6B9DVBsSBDGzkT+Bpn1X2AgcDxWY6cUQk2qm
	8QugdtAriyB0Q5jfY4/gJvTH2VcLtrhB+IlExDeylB9Hkn7OE9q9q0LdglmHUOz9TgTMcYuRQxgKO
	yPj7qZV1btqvbjQgdSKJof5OnplZQh2UX6o/E9XvgK3d4as/ad7RhefUhoKwm4yYFr0EzbSKV3LV4
	ojDrB9BxuYs0ErkBGt2znB82epyYQa9C5MEMdrhez+qV7GD28A7ur+4l1sdV9hu2e/pB0qBVvtEyu
	fOF1sn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3nN-0000000GiCA-1PiB;
	Mon, 18 May 2026 19:38:33 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3nC-0000000Gi0J-0oX2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779133101; bh=Y61aEmdvGyw4vA5vqIRiaVFAr9v3XoVduGYp096gOyM=;
 b=pupMPilSewp4WaEJ89AZm2yRP5tJ2pLx7uYe6Sek81oFnewVmXFx50cGFI8ANS9ZMTR6XMWTD
 zCOOp6jSDeuromdoMx2Du3GNHFUBX4r9BcKqer8cUYuqXpYSwhX7nOII50DV4zzJP7A6UHVNgne
 zVFyRhupYr7aOL7S1CBcnIjeW49SWBUQgTqBGyK0odMWo+PuzOOaSwkcPhZ8Dx13v73IZxXBSY/
 e/8jj1ypMMsb63lMo0aN/aRmI3caGYBMAJS/BUD7Hc3d8E9ObmRN5zyqyDLvhdd6ie0BK6u9vEA
 tI6I7ZveCpUL5N+QR6wXEdGRnJctrQkC5HCNWjPuLPKg==
X-Forward-Email-ID: 6a0b6aa9486b4b38b826fa41
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.12
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
Subject: [PATCH v2 06/11] drm/rockchip: dw_hdmi: Remove empty encoder helper funcs
Date: Mon, 18 May 2026 19:37:40 +0000
Message-ID: <20260518193748.2482823-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518193748.2482823-1-jonas@kwiboo.se>
References: <20260518193748.2482823-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_123822_331152_2595F299 
X-CRM114-Status: UNSURE (   9.76  )
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

Remove the empty disable() and static return true mode_fixup() encoder
helper funcs as they do not provide any useful functionality.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: No change
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 538906e342d2..bd530321b49c 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -226,18 +226,6 @@ dw_hdmi_rockchip_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
 	return MODE_OK;
 }
 
-static void dw_hdmi_rockchip_encoder_disable(struct drm_encoder *encoder)
-{
-}
-
-static bool
-dw_hdmi_rockchip_encoder_mode_fixup(struct drm_encoder *encoder,
-				    const struct drm_display_mode *mode,
-				    struct drm_display_mode *adj_mode)
-{
-	return true;
-}
-
 static void dw_hdmi_rockchip_encoder_mode_set(struct drm_encoder *encoder,
 					      struct drm_display_mode *mode,
 					      struct drm_display_mode *adj_mode)
@@ -290,10 +278,8 @@ dw_hdmi_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs dw_hdmi_rockchip_encoder_helper_funcs = {
-	.mode_fixup = dw_hdmi_rockchip_encoder_mode_fixup,
-	.mode_set   = dw_hdmi_rockchip_encoder_mode_set,
-	.enable     = dw_hdmi_rockchip_encoder_enable,
-	.disable    = dw_hdmi_rockchip_encoder_disable,
+	.mode_set = dw_hdmi_rockchip_encoder_mode_set,
+	.enable = dw_hdmi_rockchip_encoder_enable,
 	.atomic_check = dw_hdmi_rockchip_encoder_atomic_check,
 };
 
-- 
2.54.0


