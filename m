Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA84C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDVJUxcmK92zfWUZnq3Z84p1pBOP7goh5n+LUKM2fAg=; b=KMO7rE2oxpTALRxhKuEXFH78Vq
	Sacboa5l9iNf3DQdhCUhLKirRpR2/P98tA+ez88B96GSi5jI7yp08oHsUlRnH+4BnOBLbETmf8F0F
	z6wTyIFuaiOAxFnQbPT8f1tPyr/luMSktdMaomyAZpf92vJWey3/1i8P7wRDyDuY9qm2dF3FYaM/A
	IVvlgGbVgQUBc0ODugaUUaGz0tQiqyv8lnxKsxCXV0XyzD6s9N1nh1h7rLCb/4Ps3sja1T3uIq5DD
	M4WNgSUPEquE5ScmBd1WxWXPL58FyiwuHYpTWnwIhFO1yMeRy+2nZzBeqtA9Vv5WuF7e0yLvmc+bf
	mS8Fi3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jxT-0000000EepF-2VCg;
	Wed, 02 Sep 2026 12:20:51 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jxQ-0000000EemL-2MGh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:20:50 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B4B911F811;
	Wed,  2 Sep 2026 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788351585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDVJUxcmK92zfWUZnq3Z84p1pBOP7goh5n+LUKM2fAg=;
	b=o0P9/ZGcCY4mSx2kwa/FEBbxc4RxlWPBFunRzMT/Cdtv7yAC79fv+Cc3I3OJiOLP1/K7DG
	VPOsiCtBHrwovSj5mPdCj6QLppp0g18Vpz3Q2E/a/WuOAUjt16c61lO7HxUINH/8HLGNL5
	pJEAXWU9/PINjfyp7Q8VdnqI0M9LYeo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788351585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDVJUxcmK92zfWUZnq3Z84p1pBOP7goh5n+LUKM2fAg=;
	b=sr5BG/flrimUpnQkzIejThYidgatVQPdqqJj8b0AnsFmrrxkWlcbe8KNeJipCD6NSWTZ8n
	LrcGldHILRa9S+DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788351581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDVJUxcmK92zfWUZnq3Z84p1pBOP7goh5n+LUKM2fAg=;
	b=WTQLVwL4M88kbdIsBH3dGAa7k62ivFISIdRcUEhZxRmuThskki64HRxlEXVK9kz/qizKoz
	NR7yUSQXdtyiJ7/5RjWZzlysh8YVMHe2oNb+RoMb3ClLitqPy3PaXJsVb3hjWVJVVWlAjy
	hWYqxuVlSNtAKX4d9qmKY5BOEAIvaTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788351581;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDVJUxcmK92zfWUZnq3Z84p1pBOP7goh5n+LUKM2fAg=;
	b=SS+i3sFgRBiyLSp2QgSlBb+uc8mrE+cSU/GDXXHnqQFt32LSqEDPjoBpTbtImGzdLB5fmE
	QMJdtfkequ1JkADg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B1BD513978;
	Wed,  2 Sep 2026 12:19:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YAL7KVsUmGqxEAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 02 Sep 2026 12:19:39 +0000
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
Subject: [PATCH v3 09/14] drm/panic: Split draw_panic_plane()
Date: Wed,  2 Sep 2026 14:13:17 +0200
Message-ID: <20260902121930.597222-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902121930.597222-1-tzimmermann@suse.de>
References: <20260902121930.597222-1-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_052048_762051_9B69DBE3 
X-CRM114-Status: GOOD (  17.14  )
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

Move locking and parameters from draw_panic_plane() into the new
helper drm_panic_display_panic_screen(). Call draw_panic_plane() from
there.

The new helper drm_panic_display_panic_screen() is now the DRM core's
interface for displaying a panic screen. The code remaining in
draw_panic_plane() still does all the heavy lifting. It will become a
plane helper for DRM drivers.

v2:
- use panic_type argument in draw_panic_plane() (Sashiko)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_panic.c | 62 ++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 690e96e8f1f9..624042c42a7f 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -936,42 +936,25 @@ static void drm_panic_clear_description(void)
 	desc_line->txt = NULL;
 }
 
-static void draw_panic_plane(struct drm_plane *plane, const char *description)
+static void draw_panic_plane(struct drm_plane *plane, const char *description,
+			     enum drm_panic_type panic_type, u32 fg_color, u32 bg_color,
+			     unsigned int qr_version)
 {
 	struct drm_scanout_buffer sb = { };
 	int ret;
-	unsigned long flags;
-#if defined(CONFIG_DRM_PANIC_FOREGROUND_COLOR)
-	u32 fg_color = CONFIG_DRM_PANIC_FOREGROUND_COLOR;
-#else
-	u32 fg_color = 0x00ffffff;
-#endif
-#if defined(CONFIG_DRM_PANIC_BACKGROUND_COLOR)
-	u32 bg_color = CONFIG_DRM_PANIC_BACKGROUND_COLOR;
-#else
-	u32 bg_color = 0x00000000;
-#endif
-#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
-	unsigned int qr_version = panic_qr_version;
-#else
-	unsigned int qr_version = 0;
-#endif
-
-	if (!drm_panic_trylock(plane->dev, flags))
-		return;
 
 	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
 
 	if (ret || !drm_panic_is_format_supported(sb.format))
-		goto unlock;
+		return;
 
 	/* One of these should be set, or it can't draw pixels */
 	if (!sb.set_pixel && !sb.pages && iosys_map_is_null(&sb.map[0]))
-		goto unlock;
+		return;
 
 	drm_panic_set_description(description);
 
-	ret = draw_panic_dispatch(&sb, drm_panic_type, fg_color, bg_color, qr_version);
+	ret = draw_panic_dispatch(&sb, panic_type, fg_color, bg_color, qr_version);
 	if (!ret) {
 		/*
 		 * Only flush if we have a panic screen to display. Otherwise
@@ -982,9 +965,33 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
 	}
 
 	drm_panic_clear_description();
+}
 
-unlock:
-	drm_panic_unlock(plane->dev, flags);
+static void drm_panic_display_panic_screen(struct drm_plane *plane, const char *description)
+{
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
+#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
+	unsigned int qr_version = panic_qr_version;
+#else
+	unsigned int qr_version = 0;
+#endif
+	struct drm_device *dev = plane->dev;
+	unsigned long flags;
+
+	if (drm_panic_trylock(dev, flags)) {
+		draw_panic_plane(plane, description, drm_panic_type,
+				 fg_color, bg_color, qr_version);
+		drm_panic_unlock(dev, flags);
+	}
 }
 
 static struct drm_plane *to_drm_plane(struct kmsg_dumper *kd)
@@ -997,10 +1004,9 @@ static void drm_panic(struct kmsg_dumper *dumper, struct kmsg_dump_detail *detai
 	struct drm_plane *plane = to_drm_plane(dumper);
 
 	if (detail->reason == KMSG_DUMP_PANIC)
-		draw_panic_plane(plane, detail->description);
+		drm_panic_display_panic_screen(plane, detail->description);
 }
 
-
 /*
  * DEBUG FS, This is currently unsafe.
  * Create one file per plane, so it's possible to debug one plane at a time.
@@ -1017,7 +1023,7 @@ static ssize_t debugfs_trigger_write(struct file *file, const char __user *user_
 	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run) {
 		struct drm_plane *plane = file->private_data;
 
-		draw_panic_plane(plane, "Test from debugfs");
+		drm_panic_display_panic_screen(plane, "Test from debugfs");
 	}
 	return count;
 }
-- 
2.55.0


