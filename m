Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5FFCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8I2k12PqhaohH81SnpOZtIgku1siAzcIeNEK95fSU9s=; b=HfEJSIv8sKMbM69XK93gn3Bue1
	ts8JsSRpVe1IGmf992HS7ORvG2IpK8jz9KsaSUtaeYASG1sa1QT4/UnCDm8aw3L7HMTY/T76vb95z
	Xi9uYO86SlWfn09AtBg/iZrJnnT8LOUvjHmis8VFm2k+Bo7GzqHmr/EW3BGsOnCqr6hSyjjOQE1gt
	t21s6LE6SIkO51UtlGweGGzNfe7+aCqmwQlfdjsSjDBql9qNtNLmMN0fLqjH9Q5UCS+wh6GrPRWLo
	Q5nHhaEpLFGMosU7025ZS/U4FEalKy8QthnM/0jJaWl6o4exg/hqFfxVTmwlvOTKjXgWotL+EX3Ai
	tKkkkTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGvO-0000000Bs9O-0vQv;
	Tue, 04 Nov 2025 13:18:14 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGvM-0000000Bs8s-0HJo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:18:13 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BBB291F385;
	Tue,  4 Nov 2025 13:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762262288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8I2k12PqhaohH81SnpOZtIgku1siAzcIeNEK95fSU9s=;
	b=L5dysWudkNHvMO8s+VocZO9X+LhiJuC7UpFXuPunkHcWh5j4qeCoTZ84d/t+IyCoPH6Izc
	DLU00ITrr66QvfyxlRfhWWxIgXTYtcAd4OP6MGpki18mJDn4I1PC24NRdTs30DtL4Np9RV
	QyhoPGjeYO0sqTo1smRlRO6XaTVv3xs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762262288;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8I2k12PqhaohH81SnpOZtIgku1siAzcIeNEK95fSU9s=;
	b=mvUya3UAOBGNdkh0pyL2z2w4DAB01zqhlZ2+UuGwEEGaKjTt5xqBo1ZMStD54ykw6lktWV
	lqx9sKIzjavVW0Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762262287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8I2k12PqhaohH81SnpOZtIgku1siAzcIeNEK95fSU9s=;
	b=Kj2AuuMIlrQ11caOjtJe09asAigbQTbCDqsmZcC1cSp6ryiSVTN4B57noXtZ6ktLNw8lZY
	cIEQnE9Sw+2OA8bzHe8ROA3ItXDxgSRal+xVVPqRBqCgVJSxNqzaKStmYxTZfxSVbMd8lB
	B9fCju7SEeNS7oc1ILTV2edW7nSAhCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762262287;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8I2k12PqhaohH81SnpOZtIgku1siAzcIeNEK95fSU9s=;
	b=Eju4QiKg0udlYdNC3N4wgdBVk0S5E8EM5uz5K1Nl3u6mooL3zIQbn8WLonDi/I0UG6t2Sq
	J066O+qY9eCzR3Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 600C5139A9;
	Tue,  4 Nov 2025 13:18:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I+wGFg/9CWmeBAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 04 Nov 2025 13:18:07 +0000
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
Subject: [PATCH] drm/imx/ipuv3: Fix dumb-buffer allocation for non-RGB formats
Date: Tue,  4 Nov 2025 14:14:56 +0100
Message-ID: <20251104131803.180126-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,qualcomm.com:email,linux.dev:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com,oss.qualcomm.com,linux.intel.com,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_051812_277175_C0C417DA 
X-CRM114-Status: GOOD (  15.73  )
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
index 465b5a6ad5bb..5116f33a5973 100644
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
+		pitch_align = round_up(args->width, 8) * DIV_ROUND_UP(args->bpp, SZ_8);
+	}
 	if (!pitch_align || pitch_align > U32_MAX)
 		return -EINVAL;
 	ret = drm_mode_size_dumb(drm, args, pitch_align, 0);
-- 
2.51.1


