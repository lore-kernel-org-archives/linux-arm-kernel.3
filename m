Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56848C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MC0+KLKbJpYLNfJ5VRFGCqadwDqoWaUxvHFHXz5HZnc=; b=ALKUz5opyg0bHtmcqq+qKA2hky
	cBVMn5ZnQxG5tqsUzLYJJvqW2YLdDq3WPGGpWuaIyVKS9CmOkkayw5aGtbgtPthCdeXH/NaJuDgTn
	BvEE0Ow5A+ic0Q8h90v4su1BYE2Jq25ZOlVxwg7vlyMmsalOa+ECnhScdTVkyQ/PuKYs89yV3tYHj
	cH5uV0IQS3kSKIbzy844bwLjf1ds/g2tEHaGA3j4uzoxFJJUYeqK4E3trP6U6uMK2KhDlwJJonZhc
	j8XXGGvnN1LmbiiXIqO9ThxypfL8+Wnmq4GPJQj7j1i9nXmFdD9UZwVkzQiXcYIh4qvohV1w8F2zK
	7H4rwbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUG5-0000000GeNG-1jCk;
	Mon, 24 Aug 2026 12:58:37 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUG2-0000000GeMU-3QVe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 12:58:36 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 855161F793;
	Mon, 24 Aug 2026 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787575935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MC0+KLKbJpYLNfJ5VRFGCqadwDqoWaUxvHFHXz5HZnc=;
	b=obgWw2kzGBweRTNALmhwjkp4iYGjn81fa1D7NJxa4i1siT6djgftntgpd/z2tW5aWIdh+S
	uWM1/AcEThWD2yzhAXxxbWaswQ87J1u1sEZFTUZoqGxoNHbx/kS44ViGCtRcP4a6GT5Qgm
	hqbMy2Y2+eY+6BfOlhUki+1zVsmuxj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787575935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MC0+KLKbJpYLNfJ5VRFGCqadwDqoWaUxvHFHXz5HZnc=;
	b=RXT+BYj7wNzonJqhj1YsE8EcjDo61Rdj7rSLjpDJxNRKHwVuwYxfdezg4lci/Lm6vyIXWK
	h+3r4Icq4EJv/HCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787575931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MC0+KLKbJpYLNfJ5VRFGCqadwDqoWaUxvHFHXz5HZnc=;
	b=mwl4c/Tb/ixoV1iqroX/qzKElQCk9f8DUp30+/eJFXYsVcJNLZYbJbf21tIWM13fCOyV0k
	HM3k3pwMqsB0sKD120xyZDQyUigH6VIMUyRTr8SkH7NcL7YSaKmWHvARV3CH0UxdS6V3bO
	4L0XZiosaUlqtPIqdNYoOi8jFNUlPy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787575931;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MC0+KLKbJpYLNfJ5VRFGCqadwDqoWaUxvHFHXz5HZnc=;
	b=+/lh83EJjC7C+V05NWqdrrdXbfOmmiT6WFmaEZgIhFk3TBq8Ix8LHWo/uzw6eg3DbJYmXX
	Rzi9k2oqjbz8S9CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD823133F6;
	Mon, 24 Aug 2026 12:52:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sKzSNHg+jGpyNwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 24 Aug 2026 12:52:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	geert@linux-m68k.org,
	rdunlap@infradead.org
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
Subject: [PATCH v2 06/13] drm/panic: Pass global module parameters to drm_panic_dispatch()
Date: Mon, 24 Aug 2026 14:43:37 +0200
Message-ID: <20260824125201.218863-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824125201.218863-1-tzimmermann@suse.de>
References: <20260824125201.218863-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,linux-m68k.org,infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_055835_005656_5BC5A98C 
X-CRM114-Status: GOOD (  16.51  )
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

Set the panic type and QR version in draw_panic_plane() as a single
point of truth. Pass the values into the individual drawing functions.

In the test case, always create a QR code with version 40 (i.e., the
highest supported version).

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c            | 39 ++++++++++++++++----------
 drivers/gpu/drm/tests/drm_panic_test.c |  2 +-
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 834653d288a9..f597ef04c5bc 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -654,7 +654,7 @@ static void drm_panic_qr_exit(void)
 	stream.workspace = NULL;
 }
 
-static int drm_panic_get_qr_code_url(u8 **qr_image)
+static int drm_panic_get_qr_code_url(u8 **qr_image, unsigned int qr_version)
 {
 	struct kmsg_dump_iter iter;
 	char url[256];
@@ -666,7 +666,7 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
 			   CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
 			   utsname()->machine, utsname()->release);
 
-	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);
+	max_qr_data_size = drm_panic_qr_max_data_size(qr_version, url_len);
 	max_kmsg_size = min(MAX_ZLIB_RATIO * max_qr_data_size, QR_BUFFER1_SIZE);
 
 	/* get kmsg to buffer 1 */
@@ -712,11 +712,11 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
 				     qrbuf1, QR_BUFFER1_SIZE);
 }
 
-static int drm_panic_get_qr_code_raw(u8 **qr_image)
+static int drm_panic_get_qr_code_raw(u8 **qr_image, unsigned int qr_version)
 {
 	struct kmsg_dump_iter iter;
 	size_t kmsg_len;
-	size_t max_kmsg_size = min(drm_panic_qr_max_data_size(panic_qr_version, 0),
+	size_t max_kmsg_size = min(drm_panic_qr_max_data_size(qr_version, 0),
 				   QR_BUFFER1_SIZE);
 
 	kmsg_dump_rewind(&iter);
@@ -729,19 +729,20 @@ static int drm_panic_get_qr_code_raw(u8 **qr_image)
 				     qrbuf2, QR_BUFFER2_SIZE);
 }
 
-static int drm_panic_get_qr_code(u8 **qr_image)
+static int drm_panic_get_qr_code(u8 **qr_image, unsigned int qr_version)
 {
 	if (strlen(CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL) > 0)
-		return drm_panic_get_qr_code_url(qr_image);
+		return drm_panic_get_qr_code_url(qr_image, qr_version);
 	else
-		return drm_panic_get_qr_code_raw(qr_image);
+		return drm_panic_get_qr_code_raw(qr_image, qr_version);
 }
 
 /*
  * Draw the panic message at the center of the screen, with a QR Code
  */
 static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
-				      u32 fg_color, u32 bg_color)
+				      u32 fg_color, u32 bg_color,
+				      unsigned int qr_version)
 {
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
@@ -768,7 +769,7 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
 
 	max_qr_size = min(3 * sb->width / 4, 3 * sb->height / 4);
 
-	qr_width = drm_panic_get_qr_code(&qr_image);
+	qr_width = drm_panic_get_qr_code(&qr_image, qr_version);
 	if (qr_width < 0)
 		return qr_width;
 	else if (!qr_width)
@@ -812,9 +813,11 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
 	return 0;
 }
 
-static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
+static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
+				     u32 fg_color, u32 bg_color,
+				     unsigned int qr_version)
 {
-	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color))
+	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version))
 		return draw_panic_screen_user(sb, fg_color, bg_color);
 	return 0;
 }
@@ -887,17 +890,18 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
 	return drm_draw_can_convert_from_xrgb8888(format->format);
 }
 
-static int draw_panic_dispatch(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
+static int draw_panic_dispatch(struct drm_scanout_buffer *sb, enum drm_panic_type panic_type,
+			       u32 fg_color, u32 bg_color, unsigned int qr_version)
 {
 	int ret;
 
-	switch (drm_panic_type) {
+	switch (panic_type) {
 	case DRM_PANIC_TYPE_KMSG:
 		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
 		break;
 #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
 	case DRM_PANIC_TYPE_QR:
-		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color);
+		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version);
 		break;
 #endif
 	case DRM_PANIC_TYPE_USER:
@@ -947,6 +951,11 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
 #else
 	u32 bg_color = 0x00000000;
 #endif
+#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
+	unsigned int qr_version = panic_qr_version;
+#else
+	unsigned int qr_version = 0;
+#endif
 
 	if (!drm_panic_trylock(plane->dev, flags))
 		return;
@@ -962,7 +971,7 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
 
 	drm_panic_set_description(description);
 
-	ret = draw_panic_dispatch(&sb, fg_color, bg_color);
+	ret = draw_panic_dispatch(&sb, drm_panic_type, fg_color, bg_color, qr_version);
 	if (!ret) {
 		/*
 		 * Only flush if we have a panic screen to display. Otherwise
diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
index 969a096ec840..196496238d23 100644
--- a/drivers/gpu/drm/tests/drm_panic_test.c
+++ b/drivers/gpu/drm/tests/drm_panic_test.c
@@ -58,7 +58,7 @@ static int draw_panic_screen_kmsg_default(struct drm_scanout_buffer *sb)
 #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
 static int draw_panic_screen_qr_code_default(struct drm_scanout_buffer *sb)
 {
-	return draw_panic_screen_qr_code(sb, 0x00ffffff, 0x00000000);
+	return draw_panic_screen_qr_code(sb, 0x00ffffff, 0x00000000, 40);
 }
 #endif
 
-- 
2.55.0


