Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2DACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejkL8TsFG1o5XiPy9Gcy/NzA7/ogTbLjmhfX6D7QHow=; b=N9GaCG5G+k25SENnVkjqvCLTXU
	l00p844afR6zQ5HNYocpQ++A7Dvt1O116rIGxCuzf6TtWQKH7Tg9Zq78MyAD3oE7VxznrQwEDMmf5
	K6sOANvRrjuyplGKXrLRgiMCIOORyRTXo0ytxjDOMoz9MxypBh/HkzzKYgMv8/G51Tkkqa4tJtFUB
	PsON0XczCU9lRSJrS5PP4i5lZyP1xiTZi6uNku+lT0Vx2xM58XCM8oHSC9YCtGlTFvAuet4oedwSg
	tIfN7LWWwM9Gjz7Aa94Cz9PQsOSpjA9BRXYtdt6gCF3vXHmtMnB5jG2M2I9rbYrRUWQCrU4LLzP9K
	PLkglpJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUc-0000000CMAh-0Qou;
	Tue, 04 Nov 2025 18:10:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUL-0000000CLiv-0qpw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47756a07b34so5042815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279835; x=1762884635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejkL8TsFG1o5XiPy9Gcy/NzA7/ogTbLjmhfX6D7QHow=;
        b=gyDXrR59p2U2+P6p7WZvR34DtMFEqLuUlxcs8Gy5lMlPWvID65b+Up0FW6ORe+OtM9
         +Tv4ZuwtclOd6271e/zLhV6INoLW73z0IAPS9fGhdg9lqcrf7fEe9WPwdKKD8MFgOzN0
         UQ+bb1klVJuZPIto9W4ACgB7V9YCyV6BRZ/EBrToqf0jGNBymc82WV6I4BARa2+vWuYk
         0Sqn3LACA0vJxZucxReXhDmEBVDG1e86T1T0/PhD9YAQM6gUKBYCbUACSx8p+ar/W51e
         NJsx3MqmOtX8i9pv6oBotsnjxZy2ejOkEyVUJxIGESB8rB3UsVLZWMePnG0T9nADObZU
         MASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279835; x=1762884635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejkL8TsFG1o5XiPy9Gcy/NzA7/ogTbLjmhfX6D7QHow=;
        b=MJAcCRk1Yi+zunVLE5UF2OuRzUXjvrB3kh0owaoGFR75uoSqaLgz+BTj/nDjjtIncg
         hiUasHcX5hFf+sVIn7XJFBcfgTpIB8Oere6MTTF/lfgTM41WQvE6t7DN+6VGCCWS1I1q
         9oa9GVdpm3kwXzDYcYsITIfwckfbgnm1sr3DnfvTYQHQexSmSuo0V3atP2IGm1c6r8MI
         o9k1E55xt27n4VSDbVPbHlrhBXP2LSyqJ5HFfxoLXDhmtiWHYXM6uJppVJAT0j8DfxZT
         XPtTtYzBVXvE2qa4zi2t1T5tflg3bxWLJcDJddBO+SZVBKxc3UEi8yi0eOAzimAeEDEQ
         Jh8w==
X-Forwarded-Encrypted: i=1; AJvYcCVukPj9lfxuEL9CkaYpvjrqDO9x9FRMwdnZUBae4H3eC4ZYSyAE0KJN8OLKhRc4wUr80Mbbh4zi9tqEw7IumWzG@lists.infradead.org
X-Gm-Message-State: AOJu0YwaQfrblXyRtpTDOMY0S+ZvanPlfSIm17f6qa6MUJUHg2GN8gWJ
	VueTzSpvlSgU14THH2sC2lN4H9+78J9VRAyca91NZ8NiKUkEABoZnRBv
X-Gm-Gg: ASbGncuwMac35Bv8fk6N0Fox4dnYIrqnQMUb2CNMnL7mnPSBx2+8wzHlJl3DQoCr+WX
	PcI36my44CpXt8wvU7KDhLSqhTILD3QmMaauvSX6wzshWfQWIsk3Fp/yBOMKC7xJEqmtYc3N/UN
	9GovgeKOL+CGF5qeEPOs3Y3drQEyp8ZFojyJQjoNKK+ieLCJ9SyI6kfjl0BYHdPNs42wd4js2vr
	INngSgP59aOi8wvzu9CoF04kaPdnq5HUCkTCLwzFZImO9i0emq9mhdgZhyVrgZ3aJfLybHaupVP
	uOZLJG7kFuF4d0xgZCZtnKpBqLg++5w+RBqtLcYc9J9y/B0jeULQhFXkrmksYfssF5rsRV6DoSX
	0Xns0ipSElNshx8cbkyhrnkFozbSxVHZtjlkOhfaLS7v6abqponpF/OgIWBewFVpeFVJ4F/WlBS
	d4Cx/EGEgqi/iFBmmcIA==
X-Google-Smtp-Source: AGHT+IGULxezyFxQaS+IhExoUiRMdNFxErCJ8jQuxzUcsuWhQgiYwKFm3qElEomNCT+mnTz7K/5UIQ==
X-Received: by 2002:a05:600c:5488:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-4775ce14dd0mr2937075e9.31.1762279834562;
        Tue, 04 Nov 2025 10:10:34 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:34 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 26/30] drm/sun4i: mixer: Add quirk for number of VI scalers
Date: Tue,  4 Nov 2025 19:09:38 +0100
Message-ID: <20251104180942.61538-27-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101037_331237_14852B5E 
X-CRM114-Status: GOOD (  19.01  )
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

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- switched position of vi_scaler_num quirk

 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 11 +++++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  2 ++
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 10 +++++-----
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 78bbfbe62833..da3148f42646 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -705,6 +705,7 @@ static void sun8i_mixer_remove(struct platform_device *pdev)
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -715,6 +716,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -726,6 +728,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 432000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -737,6 +740,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -748,6 +752,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -759,6 +764,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.de_type = SUN8I_MIXER_DE2,
 	.vi_num = 2,
 	.ui_num = 1,
+	.vi_scaler_num	= 2,
 	.scaler_mask = 0x3,
 	.scanline_yuv = 2048,
 	.ccsc = CCSC_MIXER0_LAYOUT,
@@ -769,6 +775,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.ccsc		= CCSC_D1_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -780,6 +787,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
 	.de2_fcc_alpha	= 1,
@@ -791,6 +799,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
 	.de2_fcc_alpha	= 1,
@@ -802,6 +811,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -812,6 +822,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.de_type	= SUN8I_MIXER_DE3,
 	.mod_rate	= 600000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
 	.ui_num		= 3,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index def07afd37e1..8c2e8005fc5b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -167,6 +167,7 @@ enum sun8i_mixer_type {
  * struct sun8i_mixer_cfg - mixer HW configuration
  * @vi_num: number of VI channels
  * @ui_num: number of UI channels
+ * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
  * @scaler_mask: bitmask which tells which channel supports scaling
  *	First, scaler supports for VI channels is defined and after that, scaler
  *	support for UI channels. For example, if mixer has 2 VI channels without
@@ -183,6 +184,7 @@ enum sun8i_mixer_type {
 struct sun8i_mixer_cfg {
 	int		vi_num;
 	int		ui_num;
+	unsigned int	vi_scaler_num;
 	int		scaler_mask;
 	int		ccsc;
 	unsigned long	mod_rate;
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
2.51.2


