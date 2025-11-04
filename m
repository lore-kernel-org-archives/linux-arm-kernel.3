Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040BBCCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=amFe5OzZjkIwBTzqXd7tKqpumogn9x3YmmiMXkrqhWY=; b=S3bQ1iKVIF2Qm49xtm42YvjyJu
	MJwLSM32UvqTIaS3QuRDXZ1gG2i6zsr9A5V0YXG4YZEDQGnlsiv6W+n+RV68FNvYdbQ8kUutK7/gq
	KJeuIqm2ItHYAzN3UEtB9Pjetp0LLoFfSzmglBgiiuuMzl/T96UU317Z7tMhD2YmnDqKE8TvhIjHh
	1zn4iPkXJJG3MeUyDHHo+fxdF3Fq2cpd0lSoZTIkoShD+0ItYzOXxkli+9UzuveG1mOEdjkpCN7GD
	VTfJR3ovGju8Yl2VhvGkyJzn2wY/72ityPnA1cVymdSqnxtbpx9hPOA+QRX8c41gLGWIRiXKOr4jJ
	CZa6nNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJ7K-0000000C70b-120h;
	Tue, 04 Nov 2025 15:38:42 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJ7H-0000000C6zm-2AJI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:38:41 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 61E7C2118F;
	Tue,  4 Nov 2025 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762270717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=amFe5OzZjkIwBTzqXd7tKqpumogn9x3YmmiMXkrqhWY=;
	b=u1/LWY6cZUZX11Pcul8YN5PCjc3xqGCX+64ygbVaDwYJCH6cvomONl2KC3hyT+SRUeWk1T
	RwDOhpyrECqigbUb8k1s+u5d7QhfB2/hBH7AGc5460c9cUhUST0EpmqSFpOY3R+RKeXNjI
	VEiaKm5C/qpF0pVrNayQAw5Y20XXcyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762270717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=amFe5OzZjkIwBTzqXd7tKqpumogn9x3YmmiMXkrqhWY=;
	b=H/TCw+Q6BItM7URQN+7pLUSpZumJAAML/PZR2iYgycljwtAV59D5GkMFtQMmF0vDkp92YP
	7grTlBreMg8RycAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="u1/LWY6c";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="H/TCw+Q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762270717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=amFe5OzZjkIwBTzqXd7tKqpumogn9x3YmmiMXkrqhWY=;
	b=u1/LWY6cZUZX11Pcul8YN5PCjc3xqGCX+64ygbVaDwYJCH6cvomONl2KC3hyT+SRUeWk1T
	RwDOhpyrECqigbUb8k1s+u5d7QhfB2/hBH7AGc5460c9cUhUST0EpmqSFpOY3R+RKeXNjI
	VEiaKm5C/qpF0pVrNayQAw5Y20XXcyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762270717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=amFe5OzZjkIwBTzqXd7tKqpumogn9x3YmmiMXkrqhWY=;
	b=H/TCw+Q6BItM7URQN+7pLUSpZumJAAML/PZR2iYgycljwtAV59D5GkMFtQMmF0vDkp92YP
	7grTlBreMg8RycAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE55B139A9;
	Tue,  4 Nov 2025 15:38:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id txe5OPwdCmmcFAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 04 Nov 2025 15:38:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: p.zabel@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	dmitry.baryshkov@oss.qualcomm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2] drm/imx/ipuv3: Fix dumb-buffer allocation for non-RGB formats
Date: Tue,  4 Nov 2025 16:38:05 +0100
Message-ID: <20251104153832.189666-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 61E7C2118F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com,oss.qualcomm.com,linux.intel.com,ffwll.ch];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,qualcomm.com:email,suse.de:dkim,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_073839_730455_F4B18201 
X-CRM114-Status: GOOD (  15.68  )
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

Align pitch to multiples of 8 pixels for bpp values that do not map
to RGB formats. The call to drm_driver_color_mode_format() fails with
DRM_INVALID_FORMAT in these cases. Fall back to manually computing
the pitch alignment from which drm_mode_size_dumb() can compute the
correct pitch.

Fixes userspace that allocates dumb buffers for YUV formats, where
bpp equals 12. A common example is the IGT kms_getfb test.

v2:
- ignore width in calculation

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b1d0e470f881 ("drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
This patch is based on Dmitry's fix for msm. [1] Please test.

There could later be a helper to contain these aligmentment calculations
in a single place.

[1] https://lore.kernel.org/dri-devel/20251103-drm-msm-fix-nv12-v2-1-75103b64576e@oss.qualcomm.com/
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 465b5a6ad5bb..eddb471119c6 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -144,7 +144,6 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
 			       struct drm_mode_create_dumb *args)
 {
 	u32 fourcc;
-	const struct drm_format_info *info;
 	u64 pitch_align;
 	int ret;
 
@@ -156,12 +155,15 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
 	 * the allocated buffer.
 	 */
 	fourcc = drm_driver_color_mode_format(drm, args->bpp);
-	if (fourcc == DRM_FORMAT_INVALID)
-		return -EINVAL;
-	info = drm_format_info(fourcc);
-	if (!info)
-		return -EINVAL;
-	pitch_align = drm_format_info_min_pitch(info, 0, SZ_8);
+	if (fourcc != DRM_FORMAT_INVALID) {
+		const struct drm_format_info *info = drm_format_info(fourcc);
+
+		if (!info)
+			return -EINVAL;
+		pitch_align = drm_format_info_min_pitch(info, 0, 8);
+	} else {
+		pitch_align = DIV_ROUND_UP(args->bpp, SZ_8) * 8;
+	}
 	if (!pitch_align || pitch_align > U32_MAX)
 		return -EINVAL;
 	ret = drm_mode_size_dumb(drm, args, pitch_align, 0);
-- 
2.51.1


