Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A40ECCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtfZqtpuShLv1nU1aubYkk3yFU+GUfrCfqGs419v49U=; b=E6W8b4y+lMBY0xvE9QcTdraNRH
	UkEj+fRXF56g3u4JGOdrZ5qrHp2doQv689mPhISFkMJ005aPWiQTRxGQPlMeWiuL7W4GE8s1VH7F4
	0d2EegdagZMPs8rU5u/3/PwELhan7shAr073cZ+1JpIBV/FiluyOqMBmStCvriFvZScyHOAFUUely
	1JFfWSQ8Ize/axBZTGft2QWjT8Gu5McbkIdkgWtNe4ATDprwQ8IXFeCNGPvgsiCS/PQSmDzl2P0oT
	AANy2UgzyVhZe62Ck87g0LbW8Qu5ujIRwtbW1i1akedDO/8AEB0jWvHow8usQWAx2ehoNkSEWi65h
	O8BC9SDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81gV-0000000Bgz2-1mJp;
	Sun, 12 Oct 2025 19:24:47 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fx-0000000Bg6t-3OXP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:18 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-62ecd3c21d3so5669214a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297051; x=1760901851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtfZqtpuShLv1nU1aubYkk3yFU+GUfrCfqGs419v49U=;
        b=FWW9Vwc0xcBk9fz0w7DH3fDJcd6rLPeYJ6lngY2AxLtq08/ekJ5DeSISQslxVhzFKa
         UsQ3yYxWt7vYNKFRy9fscalSr4lDFd9WWAU284scqM/xJ5XlgjXXAvHjPOKgiQndTx56
         qwNPotuGaC+JM2pOOODJX8R01MhHqAxz34LJv/UyB90PRvFFwI0QhCNKrhkuTMGyN+ZH
         3TEyaQl0hCDrh3FwOf6QicSl5cKP9+DXIA0rQkJ0sXKD2fp8edAh9uGEWu7mpBPcagd4
         G/H0TXbLoRRZPlpikbdl8FXygzqv8GstgHN4oMuzyi5Dzq7Y7NKqY2qbDwF8rCGWjq+0
         7lMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297051; x=1760901851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtfZqtpuShLv1nU1aubYkk3yFU+GUfrCfqGs419v49U=;
        b=OvI/goBW/Q4/ZJFqzkZiSbWHOrOwvGxgKdoxOBtmpM1AUckb77FRkuUoPRBS0ZBJDL
         OmDNU9FP2FMBB8HcQFJQQTaWuo2VEZGc0RKpcTOdg29XH0/jOBvZI05Hz7nyaDMJzQSz
         O2I5rIQ4IuaiG+lB6qSb322xF9APSKcVsQ/zCTbTHGDH9Sn40u4v1sUgGXRQ2/D65iL9
         jeu08MTkd22q7fZe4C3Mkj8EaeI8TvZitbGCERZtdObCWTRugXRQt66ravJnURuNvNAK
         gpz+dKHgLZBss6Z82uuC3dNQz4EJkLKsfY2m5hWxIoOzpQEIS0Fj5UKpuFSan01aways
         Fx6A==
X-Forwarded-Encrypted: i=1; AJvYcCXsu8IVW/Gb0/YXTPThuhUJz4zsMrsvNUJCMFVl7Rh0SSCL+KC8YPOjnUHiLM0XndfRfu9MK/cR6a4LDLqEbQmX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwru6oceByCq6QzJt7naAQYxoq+pn7FpBcefqBLsNIop6y0sxT
	zel2rOiU/pQECwBbmmugeWdL8dojsXwUdTvBB679q6V4oqCkkBCYhqUS
X-Gm-Gg: ASbGncvKC/4T57Xj/wq51Nhyo7SJpHaXz7biFCX3yj011BlX6U52YgB9cJvGp8LDnpH
	aKi9BTZ9A9nzmXVCL/6Yb9fHEmtAgDU7xSryywZibME3yFFeBzrcYaDaT9LN0n5hmRIzjWQ5NT1
	BApg9UWeJsC7lwnSA15ENIKBXOew1vI0lHZyqTQuEKmVMIYyTGFDZnwXCz4srHjzL72Ir0HbgLi
	4t66QjkRuk58nZVvqqbbFGpJVMkdFCcruwejr0PEj9ReQl3kYp6/HLqd1XcqQ0MWiM5llbNn7cF
	FCHXDRRrJBOVWFdJM3ZRu09dl78NSszeVV1ZjDLKYOxZGL89P55SgOmSS17WcNoiO2QSclOAwda
	1Cv8E8436twqFWUMUsxLSbQGSeSEA+qaA1jS+Q4397nc1CdB9aGDyPHB0+M7yTrw6SH5UJV6LEL
	KETQwKnlP9yv/Ha53v9lcUr7GyEUvKgmA=
X-Google-Smtp-Source: AGHT+IHB34QQqDlmEWSULWlkvhSNkqtePImbxaBbIAD1Quq/9BnRqWHi2Xd84ZFnczeko4HHUeU2JA==
X-Received: by 2002:a17:907:2689:b0:b3e:bb87:772c with SMTP id a640c23a62f3a-b50aab9c912mr2070025566b.17.1760297050626;
        Sun, 12 Oct 2025 12:24:10 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:10 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 26/30] drm/sun4i: mixer: Add quirk for number of VI scalers
Date: Sun, 12 Oct 2025 21:23:26 +0200
Message-ID: <20251012192330.6903-27-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122413_980190_1CC96DB2 
X-CRM114-Status: GOOD (  16.98  )
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

On DE2 and DE3, UI scalers are located right after VI scalers. So in
order to calculate proper UI scaler base address, number of VI scalers
must be known. In practice, it is same as number of VI channels, but it
doesn't need to be.

Let's make a quirk for this number. Code for configuring channels and
associated functions won't have access to vi_num quirk anymore after
rework for independent planes.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 11 +++++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  2 ++
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 10 +++++-----
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 78bbfbe62833..f9131396f22f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -708,6 +708,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -718,6 +719,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -729,6 +731,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -740,6 +743,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -751,6 +755,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -761,6 +766,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.ui_num = 1,
 	.scaler_mask = 0x3,
 	.scanline_yuv = 2048,
+	.vi_scaler_num	= 2,
 	.ccsc = CCSC_MIXER0_LAYOUT,
 	.mod_rate = 150000000,
 };
@@ -772,6 +778,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -783,6 +790,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 0,
 	.vi_num		= 1,
 };
@@ -794,6 +802,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -805,6 +814,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -814,6 +824,7 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index def07afd37e1..40b800022237 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -178,6 +178,7 @@ enum sun8i_mixer_type {
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
  * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
  *	Most DE2 cores has FCC. If number of VI planes is one, enable this.
+ * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
  * @map: channel map for DE variants processing YUV separately (DE33)
  */
 struct sun8i_mixer_cfg {
@@ -189,6 +190,7 @@ struct sun8i_mixer_cfg {
 	unsigned int	de_type;
 	unsigned int	scanline_yuv;
 	unsigned int	de2_fcc_alpha : 1;
+	unsigned int	vi_scaler_num;
 	unsigned int	map[6];
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index c0947ccf675b..0ba1482688d7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -91,16 +91,16 @@ static const u32 lan2coefftab16[240] = {
 
 static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	int vi_num = mixer->cfg->vi_num;
+	int offset = mixer->cfg->vi_scaler_num;
 
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
-		       DE3_VI_SCALER_UNIT_SIZE * vi_num +
-		       DE3_UI_SCALER_UNIT_SIZE * (channel - vi_num);
+		       DE3_VI_SCALER_UNIT_SIZE * offset +
+		       DE3_UI_SCALER_UNIT_SIZE * (channel - offset);
 	else
 		return DE2_VI_SCALER_UNIT_BASE +
-		       DE2_VI_SCALER_UNIT_SIZE * vi_num +
-		       DE2_UI_SCALER_UNIT_SIZE * (channel - vi_num);
+		       DE2_VI_SCALER_UNIT_SIZE * offset +
+		       DE2_UI_SCALER_UNIT_SIZE * (channel - offset);
 }
 
 static int sun8i_ui_scaler_coef_index(unsigned int step)
-- 
2.51.0


