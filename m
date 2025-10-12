Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55226CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lx6RwmSdgU4IIQBCfnjkaHIgGiO5u++wyA5NWC/K61U=; b=NgQIwYbYXCyzIjZxEIS7XfhI5o
	gbjCV2geqG+sd25HecRs04k2kOqLuZPO9DuP4p+zEkUkjerIV/2MTL92oHMFAVEgs7tc6UmZxttfA
	zjbHn7K+Ly1N+xJ+xv9JO1FJdB79H4V4RSypbnNetcIrjY7rGtbSlACKk+HgS4Xmf4l+d/q693AuD
	T0+DfdRSQ3OqUw0SERZe2RNBgBlBN4m6uplD8ufFpscSOmM/YDjG8+tnH6mCaUoHuZRr0GlxWc+oE
	CzXre60QEo0FD2WrGoQBXs6DULOV57NojF22bQ6ZL0YG4V4jmY1l4nPCRBnUp/fIQ3AvIxQdkRBP+
	Yqg40grA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81gO-0000000BgmJ-3nOn;
	Sun, 12 Oct 2025 19:24:40 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81ft-0000000Bfzo-24x6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:12 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so656589166b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297047; x=1760901847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lx6RwmSdgU4IIQBCfnjkaHIgGiO5u++wyA5NWC/K61U=;
        b=ax57vuwzwZ5BwymTmx/4w4prh88jRqRRHC2FhpSGB2EuGtK8wgk0DhkM1Z+QgvwKc4
         ki6bxnLCmC4SMnuKOKZ8Am1MjiM9Q4IMx8kLdnScZDLgq9IbAVAHJeii1oGCtMg8u2JN
         paIcCTkKiLMN0sD8sfLd8QTZv73Zu95l0HJ12LCXruWQHIGglyPaMTthSHaKO5wpQF2e
         y9Yhwvt7aKLr/D4diX2P6iRpL2FRrQmnKqJK0UmsnNwbo2HrkbXoFKziPDkbqFjkVSdk
         odZX4/DwyQHNpKdMsuBpwphG08eQbfldh3D1NkO4Q038mzaeHqHmHy6g+msdRKn5Jd+R
         7uKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297047; x=1760901847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lx6RwmSdgU4IIQBCfnjkaHIgGiO5u++wyA5NWC/K61U=;
        b=hMXDZDzuYXSvXn+/6JSJKKeYsIFCwphScL2fhVbftQA68Y8tn+Fsvn/64MO9VbVont
         oaNgaHMPnqLnX1z5jMTZbgSt59p7IumpfpvL6vL283VRESjyYKI2gnJb4mgxK83TIJBg
         FF774n563vYtB4LQG7drDmq9eTuzUZLIgepMBiJ2B0CGhkD3+HRRQ53k09qZTwXI7TLa
         wzMsxh4xO3nB+ftLVUr9Cp/n5TFiuW57AD9EgKj+3tejZ81AX+dRjxpZxPFapHglgdqo
         fITVfkFX1vnU4R2nj/oesV2Yr8byG5ORYwsCG0fx+Qq+PHTP+NL3opJDNwGATHGP4kCb
         rMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyhO85NlR20uoDqk2aPEod0SAI3OP24P4voX4SN7msVuoeebtbIV3erNepE0QJ+zDk0o4evkLMiueasIIpklsL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2UWuvmbjVo7VFrcUr32a4WLY9WR6wCLKZEtjFooj/RmBglSM/
	x0O1qjPsX3L9uIAQ9lO+keV/fb9ddhpsv+gc/Pu75VGfnhqBFkNOcEBG
X-Gm-Gg: ASbGnctCRHXJYKTe3OHkf0uGgnukGbBX9IwFQ/xbsUmqt8H1kQrjQEFY7H9Xdx9gELO
	LPe7sKAHNmggc/YBNZiKo3s39m0jGlVjJrGFjGtKtjkddT7nDstYxUfESvFud4ELqQ0QVl9Z4LF
	a8nb0VRzfIDfizlfecFzZr/qTT/byGBJDYgW/Mz5a+48o6lOYmiXb5fC70epgkVzgvwnV8r/mBN
	JyOhmkPLFiHFIvJ1KVsm3vMtvwMfb+erRFyfXoEMZB7mQv9hpXIxIDx0ksfV4GH9Gheqfh65qEC
	tF6di06omts2NprYRAEx7nMqAdSfnTd1NB0u4IzYBvPxKh2OlTP/1t5IfWmw/C3YkmlmYlaDTji
	bxy6pAmo0wwPWQXvIwx4OaeGlAhhgffC1ALEApmWEaFBVGPYBs0fVAJttBNWc6s8VO1G8+Y8rQN
	6xSEh4i/m3p8DZGt1bsF3JjKgcz7i9hIA=
X-Google-Smtp-Source: AGHT+IGH9C/CoLClf1Jkf0CjCgobVw/ZwbzYhFdY1bLk6LH3leZZDbDIp409NxGuCUrOaIqSIPGpIg==
X-Received: by 2002:a17:907:3f97:b0:b3c:8940:6239 with SMTP id a640c23a62f3a-b50ac3cbd52mr2018365366b.52.1760297047252;
        Sun, 12 Oct 2025 12:24:07 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:07 -0700 (PDT)
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
Subject: [PATCH 23/30] drm/sun4i: vi_scaler: Update DE33 base calculation
Date: Sun, 12 Oct 2025 21:23:23 +0200
Message-ID: <20251012192330.6903-24-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122409_640787_410B8312 
X-CRM114-Status: GOOD (  13.98  )
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

Now that channel base calculation is straightforward, let's update VI
scaler base calculation to be simpler. At the same time, also introduce
macro to avoid magic numbers.

Note, reason why current magic value and new macro value isn't the same
is because sun8i_channel_base() already introduces offset to channel
registers. Previous value is just the difference to VI scaler registers.
However, new code calculates scaler base from channel base. This is also
easier to understand when looking into BSP driver. Macro value can be
easily found whereas old diff value was not.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 3 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 0e308feb492a..fe0bb1de6f08 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -836,7 +836,8 @@ static const u32 bicubic4coefftab32[480] = {
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return sun8i_channel_base(mixer, channel) + 0x3000;
+		return DE33_VI_SCALER_UNIT_BASE +
+		       DE33_CH_SIZE * channel;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 73eecc4d1b1d..245fe2f431c3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -18,6 +18,8 @@
 #define DE3_VI_SCALER_UNIT_BASE 0x20000
 #define DE3_VI_SCALER_UNIT_SIZE 0x08000
 
+#define DE33_VI_SCALER_UNIT_BASE 0x4000
+
 /* this two macros assumes 16 fractional bits which is standard in DRM */
 #define SUN8I_VI_SCALER_SCALE_MIN		1
 #define SUN8I_VI_SCALER_SCALE_MAX		((1UL << 20) - 1)
-- 
2.51.0


