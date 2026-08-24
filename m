Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5DBC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 12:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBllh5can9W5YA89sy1f8T8AcT26iEoRNQ/HwHVjaKw=; b=kC/OPB8PMOWS096NkkOAJTWACZ
	pHNhm18k3OjFkmTgoT93WRWDpR0iAfrgAxbD4bfXSsvPEiW90sJfoDuW3MLDjzrpJyR5kgZd0NbFI
	CBsp9US9/YeKhqWqkAhVYXWmm4sNTRnSIy3WtwnNrlQ4tIMnNoa5kNTrx6eH7qzVf3DgOGwUyS7CI
	CylpqFghk2hHh7nV86qehVX3lykUyscrDg8iKFP5lFCHJxO3uII6huXy3XW06QD67ZhQDKqSGlzub
	Uq8ljbZNjnz54GM0Y0jEX0Pix8Iy85wpvUAiRF49CGKissRvviBr+ALN58HcFGqwtsvkUhWqdH9TK
	IqqQzu2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUFZ-0000000GeHW-17xV;
	Mon, 24 Aug 2026 12:58:05 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUFW-0000000GeGc-3dpC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 12:58:04 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8968E1F794;
	Mon, 24 Aug 2026 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787575935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBllh5can9W5YA89sy1f8T8AcT26iEoRNQ/HwHVjaKw=;
	b=JF9q9IFMUsb3KVqD0m8ibeDTLKv2fDw+SXYglKFr6C42+Fy47y1c131nUPAW474AUAAKM2
	ZHfni8BF4gmTWNWuCYetC5VcykBP47dtB9Qyz37le3sQH94LcywM+mb9VOtv2RSAnrlUI4
	jyr1kiZ3YOP9tFxslEDbn/kfQyIle/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787575935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBllh5can9W5YA89sy1f8T8AcT26iEoRNQ/HwHVjaKw=;
	b=Mew956bjmCx1q2kgdKrAJhIZLb5KGMxJVDQQ7oXI9bsH+Et9XCIy8lQHztU8E2aSPbTruP
	izq0P6zruT7g7dAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787575931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBllh5can9W5YA89sy1f8T8AcT26iEoRNQ/HwHVjaKw=;
	b=SDXzwoeS7N38EGhv/iGYCJ8JFjJ9P1qM8AfRH3HojySA3Q6AliR6txJGBGzgDTsgXWRObY
	va8eWIiq0ffVtN8wCw10nsX+K7fySxLsAaxFi1v0KDjbWtT5BP1Xe82/XKIx3HLinSwxEM
	W7PFFpB/hIOM324U+rv39RZ4h0fJ3vY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787575931;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBllh5can9W5YA89sy1f8T8AcT26iEoRNQ/HwHVjaKw=;
	b=PYmSypWYR+brgRVFbn0UjQnrLMnUl2/8U4C2NknCn+HAbvMB9jlOImuLmptUVAcFGaPbNf
	+nduWeArj2X9RGAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6822913408;
	Mon, 24 Aug 2026 12:52:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UBkzGHk+jGpyNwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 24 Aug 2026 12:52:09 +0000
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
Subject: [PATCH v2 07/13] drm/panic: Retry in dispatch function if panic output fails
Date: Mon, 24 Aug 2026 14:43:38 +0200
Message-ID: <20260824125201.218863-8-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_055803_060717_A1B3EB67 
X-CRM114-Status: GOOD (  16.64  )
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

On failed output of QR codes and kmsg buffers, fall back to a user
message. QR-code output already did this internally, but now formally
support it in drm_panic_dispatch(). Streamlines the existing logic.

Also pass module parameter drm_panic_type as a parameter to
drm_panic_dispatch(). This simpifies the implementation. It will later
allow for moving the function into a helper library.

With the implicit fallback removed from QR-code support, the tests
cases fail for thr smallest output size (300x200). This is because the
QR code requires a minimal output size. Increase the size to 494x494,
which is the minimum supported size for QR output.

v2:
- fix minimum test size (Sashiko)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c            | 24 ++++++++++++------------
 drivers/gpu/drm/tests/drm_panic_test.c |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index f597ef04c5bc..bc7c096c4236 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -740,9 +740,9 @@ static int drm_panic_get_qr_code(u8 **qr_image, unsigned int qr_version)
 /*
  * Draw the panic message at the center of the screen, with a QR Code
  */
-static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
-				      u32 fg_color, u32 bg_color,
-				      unsigned int qr_version)
+static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
+				     u32 fg_color, u32 bg_color,
+				     unsigned int qr_version)
 {
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
@@ -812,15 +812,6 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
 	drm_panic_blit(sb, &r_qr, qr_image, qr_pitch, scale, fg_color);
 	return 0;
 }
-
-static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
-				     u32 fg_color, u32 bg_color,
-				     unsigned int qr_version)
-{
-	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version))
-		return draw_panic_screen_user(sb, fg_color, bg_color);
-	return 0;
-}
 #else
 static void drm_panic_qr_init(void) {};
 static void drm_panic_qr_exit(void) {};
@@ -895,13 +886,22 @@ static int draw_panic_dispatch(struct drm_scanout_buffer *sb, enum drm_panic_typ
 {
 	int ret;
 
+retry:
 	switch (panic_type) {
 	case DRM_PANIC_TYPE_KMSG:
 		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
+		if (ret) {
+			panic_type = DRM_PANIC_TYPE_USER;
+			goto retry;
+		}
 		break;
 #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
 	case DRM_PANIC_TYPE_QR:
 		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version);
+		if (ret) {
+			panic_type = DRM_PANIC_TYPE_USER;
+			goto retry;
+		}
 		break;
 #endif
 	case DRM_PANIC_TYPE_USER:
diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
index 196496238d23..55d77bc203df 100644
--- a/drivers/gpu/drm/tests/drm_panic_test.c
+++ b/drivers/gpu/drm/tests/drm_panic_test.c
@@ -32,7 +32,7 @@ struct drm_test_mode {
  */
 #define DRM_TEST_MODE_LIST(func) \
 	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_XRGB8888, func) \
-	DRM_PANIC_TEST_MODE(300, 200, DRM_FORMAT_XRGB8888, func) \
+	DRM_PANIC_TEST_MODE(494, 494, DRM_FORMAT_XRGB8888, func) \
 	DRM_PANIC_TEST_MODE(1920, 1080, DRM_FORMAT_XRGB8888, func) \
 	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB565, func) \
 	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB888, func) \
-- 
2.55.0


