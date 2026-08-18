Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E0EC5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEUnJVKyRqaw2oJE0p+7XPzDoUMdTd1XhCSyTm76Sls=; b=c8yxa+ScGKZ9EC6kogT77sJseF
	WCUrSL9vA8fJ9OtqGu43UbhftwoH5DhQ/g09wusltgje3kIU+KvIotGW7/8PFTcDCSDC0rzeDYcH3
	6DCKF9x18kbKMF1iGS0eVf7TEu7t7eeFgVp170NI4pHLgvL6TSXiYYVo1A3UiEKhIOTTbgOKnUwAq
	MlSZr+Sq9tEsZvyTHDiy4TgPHVc+vkdnSJLEbXplZQhCA8OBCKRibZpL9Iykt8Yrm8dIMwX+k5Kis
	kBKHJVZn4J4+swUhbDc8EuSE7fhBjuOBOdj1eL3La1iZsVbFEOP6quP80c7WiwfxVhybcl/66rIbF
	v0zuVZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJHT-00000007yFz-1ljq;
	Tue, 18 Aug 2026 12:51:03 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJHR-00000007yEN-0e5l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 12:51:02 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 012C98458B;
	Tue, 18 Aug 2026 12:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787057427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vEUnJVKyRqaw2oJE0p+7XPzDoUMdTd1XhCSyTm76Sls=;
	b=SB8IqDt930lx8gbu6TDdQTbWBQOd/m0orN5xNz8FCnU9Va+6xvZYDhY6z4csnEas0nNZDR
	OjH4eC05RWLWFG+gqj9fo3/p4ERYB1qusj34DsU5Z6ojaBLAHtxu1uwcj0TyKtL+sxBEZc
	MS1FOshTKl4kIUDW2V/NXv59kQBp0PU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787057427;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vEUnJVKyRqaw2oJE0p+7XPzDoUMdTd1XhCSyTm76Sls=;
	b=cGJZVIK3mLo5oUSlaPuth8y+rlk7EvLl5mowmfdy3xZKK82uG7gtC/l8AHJ7fN+A0tG4Bd
	JRtVA0QRZhpxv6BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787057423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vEUnJVKyRqaw2oJE0p+7XPzDoUMdTd1XhCSyTm76Sls=;
	b=enSAMH7jcNTe+Q2jqJSROkKDRaCTWjGQB3SwTlh+qv8WPG7gfnSEh85HTpI9B6JpWAwu9l
	mSDk0+ajXFfjrLJ70bd1pCXRrcPZGr+BA9ntgoIxHcnM/qlD1zPsHtl/nb1Tlk7QTHDWFI
	WJRbDBeHhvB54mv+nQcUba9Qyjj5Iig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787057423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vEUnJVKyRqaw2oJE0p+7XPzDoUMdTd1XhCSyTm76Sls=;
	b=frjoziAgcX9tx1QDqoAV9prLlG8E/W+IdI5WShAjZlEomWGjGWEFHXi3u4e30s1wL4rzmp
	nVHW0yqY25j+GSBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C063F367B;
	Tue, 18 Aug 2026 12:50:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0DjJLQtVhGojIAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Aug 2026 12:50:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	virtualization@lists.linux.dev,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/12] drm/panic: Pass colors to draw_panic_dispatch()
Date: Tue, 18 Aug 2026 14:28:03 +0200
Message-ID: <20260818125012.468092-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818125012.468092-1-tzimmermann@suse.de>
References: <20260818125012.468092-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_055101_496243_611E0E60 
X-CRM114-Status: GOOD (  18.85  )
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

Set the panic-screen colors in draw_panic_plane() as a single point
of truth. Pass the values into the individual drawing functions.

In the test cases, replace the Kconfig-defined colors with white and
black. Allows for removal of the tests' limitations and dependency on
the exact values. All tests now always verify the generated output.

Hardcoding the test colors will later also allow for building the
test case without having DRM panic handling enabled.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_panic.c            | 54 +++++++++++++++-----------
 drivers/gpu/drm/tests/drm_panic_test.c | 26 +++++++++----
 2 files changed, 49 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 594235661710..ede620b27515 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -478,12 +478,8 @@ static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct drm_rect *
 				   fg_color);
 }
 
-static int draw_panic_screen_user(struct drm_scanout_buffer *sb)
+static int draw_panic_screen_user(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
 {
-	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
-						    sb->format->format);
-	u32 bg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR,
-						    sb->format->format);
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen, r_logo, r_msg;
 	unsigned int msg_width, msg_height;
@@ -491,6 +487,9 @@ static int draw_panic_screen_user(struct drm_scanout_buffer *sb)
 	if (!font)
 		return -EINVAL;
 
+	fg_color = drm_draw_color_from_xrgb8888(fg_color, sb->format->format);
+	bg_color = drm_draw_color_from_xrgb8888(bg_color, sb->format->format);
+
 	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 	drm_panic_logo_rect(&r_logo, font);
 
@@ -549,12 +548,8 @@ static int draw_line_with_wrap(struct drm_scanout_buffer *sb, const struct font_
  * Draw the kmsg buffer to the screen, starting from the youngest message at the bottom,
  * and going up until reaching the top of the screen.
  */
-static int draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
+static int draw_panic_screen_kmsg(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
 {
-	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
-						    sb->format->format);
-	u32 bg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR,
-						    sb->format->format);
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 	struct kmsg_dump_iter iter;
@@ -566,6 +561,9 @@ static int draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
 	if (!font || font->width > sb->width)
 		return -EINVAL;
 
+	fg_color = drm_draw_color_from_xrgb8888(fg_color, sb->format->format);
+	bg_color = drm_draw_color_from_xrgb8888(bg_color, sb->format->format);
+
 	yoffset = sb->height - font->height - (sb->height % font->height) / 2;
 
 	/* Fill with the background color, and draw text on top */
@@ -748,12 +746,9 @@ static int drm_panic_get_qr_code(u8 **qr_image)
 /*
  * Draw the panic message at the center of the screen, with a QR Code
  */
-static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
+static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
+				      u32 fg_color, u32 bg_color)
 {
-	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
-						    sb->format->format);
-	u32 bg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR,
-						    sb->format->format);
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
 	unsigned int max_qr_size, scale;
@@ -766,6 +761,9 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 	if (!font)
 		return -EINVAL;
 
+	fg_color = drm_draw_color_from_xrgb8888(fg_color, sb->format->format);
+	bg_color = drm_draw_color_from_xrgb8888(bg_color, sb->format->format);
+
 	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 
 	drm_panic_logo_rect(&r_logo, font);
@@ -818,10 +816,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 	return 0;
 }
 
-static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
+static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
 {
-	if (_draw_panic_screen_qr_code(sb))
-		draw_panic_screen_user(sb);
+	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color))
+		draw_panic_screen_user(sb, fg_color, bg_color);
 	return 0;
 }
 #else
@@ -893,22 +891,22 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
 	return drm_draw_can_convert_from_xrgb8888(format->format);
 }
 
-static int draw_panic_dispatch(struct drm_scanout_buffer *sb)
+static int draw_panic_dispatch(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
 {
 	int ret;
 
 	switch (drm_panic_type) {
 	case DRM_PANIC_TYPE_KMSG:
-		ret = draw_panic_screen_kmsg(sb);
+		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
 		break;
 #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
 	case DRM_PANIC_TYPE_QR:
-		ret = draw_panic_screen_qr_code(sb);
+		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color);
 		break;
 #endif
 	case DRM_PANIC_TYPE_USER:
 	default:
-		ret = draw_panic_screen_user(sb);
+		ret = draw_panic_screen_user(sb, fg_color, bg_color);
 	}
 
 	return ret;
@@ -943,6 +941,16 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
 	struct drm_scanout_buffer sb = { };
 	int ret;
 	unsigned long flags;
+#if defined(CONFIG_DRM_PANIC_FOREGROUND_COLOR)
+	u32 fg_color = CONFIG_DRM_PANIC_FOREGROUND_COLOR;
+#else
+	u32 fg_color = 0x00ffffff;
+#endif
+#if defined(CONFIG_DRM_PANIC_BACKGROUND_COLOR)
+	u32 bg_color = CONFIG_DRM_PANIC_BACKGROUND_COLOR;
+#else
+	u32 bg_color = 0x00000000;
+#endif
 
 	if (!drm_panic_trylock(plane->dev, flags))
 		return;
@@ -958,7 +966,7 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
 
 	drm_panic_set_description(description);
 
-	ret = draw_panic_dispatch(&sb);
+	ret = draw_panic_dispatch(&sb, fg_color, bg_color);
 	if (!ret) {
 		/*
 		 * Only flush if we have a panic screen to display. Otherwise
diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
index fdd77b0cc54c..969a096ec840 100644
--- a/drivers/gpu/drm/tests/drm_panic_test.c
+++ b/drivers/gpu/drm/tests/drm_panic_test.c
@@ -14,17 +14,10 @@
 #include <linux/units.h>
 #include <linux/vmalloc.h>
 
-/* Check the framebuffer color only if the panic colors are the default */
-#if (CONFIG_DRM_PANIC_BACKGROUND_COLOR == 0 && \
-	CONFIG_DRM_PANIC_FOREGROUND_COLOR == 0xffffff)
-
 static void drm_panic_check_color_byte(struct kunit *test, u8 b)
 {
 	KUNIT_EXPECT_TRUE(test, (b == 0 || b == 0xff));
 }
-#else
-static void drm_panic_check_color_byte(struct kunit *test, u8 b) {}
-#endif
 
 struct drm_test_mode {
 	const int width;
@@ -48,10 +41,27 @@ struct drm_test_mode {
 	.width = w, \
 	.height = h, \
 	.format = f, \
-	.draw_screen = draw_panic_screen_##name, \
+	.draw_screen = draw_panic_screen_ ## name ## _default, \
 	.fname = #name, \
 	}, \
 
+static int draw_panic_screen_user_default(struct drm_scanout_buffer *sb)
+{
+	return draw_panic_screen_user(sb, 0x00ffffff, 0x00000000);
+}
+
+static int draw_panic_screen_kmsg_default(struct drm_scanout_buffer *sb)
+{
+	return draw_panic_screen_kmsg(sb, 0x00ffffff, 0x00000000);
+}
+
+#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
+static int draw_panic_screen_qr_code_default(struct drm_scanout_buffer *sb)
+{
+	return draw_panic_screen_qr_code(sb, 0x00ffffff, 0x00000000);
+}
+#endif
+
 static const struct drm_test_mode drm_test_modes_cases[] = {
 	DRM_TEST_MODE_LIST(user)
 	DRM_TEST_MODE_LIST(kmsg)
-- 
2.55.0


