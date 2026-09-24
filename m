Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0715C98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrwHL2kcG+Vt4W3ByUonzTmcHea4Q9dyMEh/DeXT5Ok=; b=Ww9JtsQFH2wtBeY+C3UZgXFHvN
	TMUvPCqX6Cm7ibSDevlNmEexXSNeHJOtSXK6/q8TqzTIyrk1TlpgaJuiQmmaPM/luUM+19h5uROea
	NLQm8kL1SFOecCLW0Tm7wwipU4Zvbq/6LBWkfXdheY0yz2Fbw6XC07HvffX8mbmDoej4oPCm8OO25
	NWehqIl1k1pT815CRnS7TVI6tDNdFnSC8o52ytuk0/fJuknkZBoR/b2FRSxyt0/zvf+xsgupB23Az
	MxvvmxlNo6RpyjO7yVO9MuPS0wzzgUyovD1kJWbu1YAsoqLhAmVieFsApYIMSV4TppGxesHb8+5RT
	sCzh0whg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fnP-0000000AZsm-0xUw;
	Thu, 24 Sep 2026 09:31:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fnH-0000000AZpc-2Pow;
	Thu, 24 Sep 2026 09:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NrwHL2kcG+Vt4W3ByUonzTmcHea4Q9dyMEh/DeXT5Ok=; b=KR3NL8EyMSObWn4qLdci6cmKoU
	SjbDKinRy6b0AIzFJ+kR/2NjqwF07b6ymqs15nt0u/xVVWD7AzWTO8uei38/yvU+Aa9kfGtcC/L72
	Bsw+w5Ehr2KT66ZutmUJ6KhCaW91jbMnHkRJ/+kyhszNtTvV/4E1Jec7C2rmOuOxkz3s2taTBDTf7
	8jXiEIVHTNrJUKqPHv6ak9gDRFfXpV+d6nt4Rr+pSmSQcQcIQGLAtxwuGRyru1e+hZKq0W9vvbUgI
	QELXRsevj++pzrY5f3oNUsFd4PNw7nM343OSALAzzUbvWbN3tIrIYwepDVKDc/jSNSgagUHe++udK
	4GxBdbdA==;
Received: from smtp-out2.suse.de ([195.135.223.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9fnA-0000000Fmuo-0Lbn;
	Thu, 24 Sep 2026 09:31:04 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D9E7520063;
	Thu, 24 Sep 2026 09:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790242252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrwHL2kcG+Vt4W3ByUonzTmcHea4Q9dyMEh/DeXT5Ok=;
	b=jQ3KjtMTT91KOg0EfaZcsXxnyC0GRdtgbClXIIqihwQApNELoAAXSIR7S49Vo89AXo+jYX
	ORj+qYBKsJfPAjVgmR1sRi4nN2mI6rnQtWTVc7hzD+W036tzb02qwAvN/f08stewM59Lf+
	EaJjfoKIBTFD22lgC7JktonZA0nEUec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790242252;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrwHL2kcG+Vt4W3ByUonzTmcHea4Q9dyMEh/DeXT5Ok=;
	b=zddaX1ToapJ3crxzJgFzPI0yEzex/UQ8IAUdw9VO9gX9e6g96+2C/SuszAG3dfUnU9UpIJ
	3bvAe4uUlhMzZzCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790242247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrwHL2kcG+Vt4W3ByUonzTmcHea4Q9dyMEh/DeXT5Ok=;
	b=X8gWrMIq9Vzr85ryfinQ+GJhFZVefhP77qSMMW9YzX0TT7HEunjq2tZ/QkZ1LBirQxR4M5
	Rm4v3lzUGtl2NKa6B68qxvjpT57obN4JrPkLU3KrvhqGuYxKM/1nuFfQpHOm7LImoUswjL
	i7g7Us1BnY27M5PvVnvyxhXcXHmi5w4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790242247;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrwHL2kcG+Vt4W3ByUonzTmcHea4Q9dyMEh/DeXT5Ok=;
	b=AkQsYwlPxZwEbBkibaFAflXAJimlelhbU3AUglV8qKlGItC7RYrVeBhJbIR85t0R88nePt
	bbqMvVBazD7MG7Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09E2C1366F;
	Thu, 24 Sep 2026 09:30:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2es5CcbttGp+IgAAD6G6ig:T2
	(envelope-from <tzimmermann@suse.de>); Thu, 24 Sep 2026 09:30:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	jani.nikula@linux.intel.com,
	Alexander.Deucher@amd.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v2 1/2] drm/fbdev: Move fbdev module parameters next to module init
Date: Thu, 24 Sep 2026 11:29:13 +0200
Message-ID: <20260924093036.82356-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924093036.82356-1-tzimmermann@suse.de>
References: <20260924093036.82356-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,amd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,amd.com:email,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_103102_128753_FD5A2BDB 
X-CRM114-Status: GOOD (  16.12  )
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

Define the parameters for fbdev emulation in the source file with the
module-initialization and exit code of drm_kms_helper.ko. The parameters
control some aspects of DRM's fbdev emulation. Common usage looks like

  drm_kms_helper.drm_fbdev_overalloc=200

on the kernel's command line. This has been possible for many years
and changing it would likely upset users.

The emulation code is supposed to be moved into the module for DRM
clients. Keeping the parameters in drm_kms_helper.ko avoids breaking
systems the use them in the way described above.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/drm_crtc_helper_internal.h |  9 +++++
 drivers/gpu/drm/drm_fb_helper.c            | 32 +-----------------
 drivers/gpu/drm/drm_kms_helper_common.c    | 39 ++++++++++++++++++++++
 3 files changed, 49 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
index bae73936acf9..adcc9a2e24ee 100644
--- a/drivers/gpu/drm/drm_crtc_helper_internal.h
+++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
@@ -29,6 +29,8 @@
 #ifndef __DRM_CRTC_HELPER_INTERNAL_H__
 #define __DRM_CRTC_HELPER_INTERNAL_H__
 
+#include <linux/types.h>
+
 enum drm_mode_status;
 struct drm_connector;
 struct drm_crtc;
@@ -36,6 +38,13 @@ struct drm_display_mode;
 struct drm_encoder;
 struct drm_modeset_acquire_ctx;
 
+/* drm_kms_helper_common.c */
+#if IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION)
+extern bool drm_fbdev_emulation;
+extern int drm_fbdev_overalloc;
+extern bool drm_leak_fbdev_smem;
+#endif
+
 /* drm_probe_helper.c */
 enum drm_mode_status drm_crtc_mode_valid(struct drm_crtc *crtc,
 					 const struct drm_display_mode *mode);
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d4664ed468b2..76195410db60 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -43,39 +43,9 @@
 #include <drm/drm_vblank.h>
 
 #include "drm_internal.h"
+#include "drm_crtc_helper_internal.h"
 #include "drm_crtc_internal.h"
 
-static bool drm_fbdev_emulation = true;
-module_param_named(fbdev_emulation, drm_fbdev_emulation, bool, 0600);
-MODULE_PARM_DESC(fbdev_emulation,
-		 "Enable legacy fbdev emulation [default=true]");
-
-static int drm_fbdev_overalloc = CONFIG_DRM_FBDEV_OVERALLOC;
-module_param(drm_fbdev_overalloc, int, 0444);
-MODULE_PARM_DESC(drm_fbdev_overalloc,
-		 "Overallocation of the fbdev buffer (%) [default="
-		 __MODULE_STRING(CONFIG_DRM_FBDEV_OVERALLOC) "]");
-
-/*
- * In order to keep user-space compatibility, we want in certain use-cases
- * to keep leaking the fbdev physical address to the user-space program
- * handling the fbdev buffer.
- *
- * This is a bad habit, essentially kept to support closed-source OpenGL
- * drivers that should really be moved into open-source upstream projects
- * instead of using legacy physical addresses in user space to communicate
- * with other out-of-tree kernel modules.
- *
- * This module_param *should* be removed as soon as possible and be
- * considered as a broken and legacy behaviour from a modern fbdev device.
- */
-static bool drm_leak_fbdev_smem;
-#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
-MODULE_PARM_DESC(drm_leak_fbdev_smem,
-		 "Allow unsafe leaking fbdev physical smem address [default=false]");
-#endif
-
 /**
  * DOC: fbdev helpers
  *
diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
index b5d5b469b444..1e55ecac4698 100644
--- a/drivers/gpu/drm/drm_kms_helper_common.c
+++ b/drivers/gpu/drm/drm_kms_helper_common.c
@@ -25,10 +25,49 @@
  *
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 
+#include "drm_crtc_helper_internal.h"
 #include "drm_panic_internal.h"
 
+#if IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION)
+bool drm_fbdev_emulation = true;
+EXPORT_SYMBOL(drm_fbdev_emulation);
+module_param_named(fbdev_emulation, drm_fbdev_emulation, bool, 0600);
+MODULE_PARM_DESC(fbdev_emulation, "Enable legacy fbdev emulation [default=true]");
+
+int drm_fbdev_overalloc = CONFIG_DRM_FBDEV_OVERALLOC;
+EXPORT_SYMBOL(drm_fbdev_overalloc);
+module_param(drm_fbdev_overalloc, int, 0444);
+MODULE_PARM_DESC(drm_fbdev_overalloc,
+		 "Overallocation of the fbdev buffer (%) [default="
+		 __MODULE_STRING(CONFIG_DRM_FBDEV_OVERALLOC) "]");
+
+/*
+ * In order to keep user-space compatibility, we want in certain use-cases
+ * to keep leaking the fbdev physical address to the user-space program
+ * handling the fbdev buffer.
+ *
+ * This is a bad habit, essentially kept to support closed-source OpenGL
+ * drivers that should really be moved into open-source upstream projects
+ * instead of using legacy physical addresses in user space to communicate
+ * with other out-of-tree kernel modules.
+ *
+ * This module_param *should* be removed as soon as possible and be
+ * considered as a broken and legacy behaviour from a modern fbdev device.
+ */
+bool drm_leak_fbdev_smem;
+EXPORT_SYMBOL(drm_leak_fbdev_smem);
+#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
+module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
+MODULE_PARM_DESC(drm_leak_fbdev_smem,
+		 "Allow unsafe leaking fbdev physical smem address [default=false]");
+#endif
+
+#endif
+
 static int __init drm_kms_helper_init(void)
 {
 	return drm_panic_helper_init();
-- 
2.55.0


