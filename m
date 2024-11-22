Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8C6E65D3A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+pN3XKvVFmetq3YJbHAkykp748W6pEN5H4vcdcbZbk=; b=gCiz2X6JJf08gK9eVryTrXNLlJ
	nf0pokO97qRsxLaIZ1PmT7SUmxFaWwFuRxTOV73f4T8XEUYhBaCMEbM0xhu/njAfG3SWX56Au3AGF
	YQtLkuU9WzKKY6y31rm6FffMKyJOV8NSwynHDHclgAzIzHMCHqSvPilSr0YAYpuL96/UMq+VYgx+8
	ES+kr4zMon2RUQ9Ft+ZYIEA+gS92mUnVP+BGl2VvBL17v6Hx6NDpRNHJVYoSmzIXu6aCUtSzmFpyS
	EwBtxKF8EqNbpG1RrzC78S6RBkv+gH2nlpvRqjsbKdtjBCcRCTlNIghY95FLxqKj6wRLbPX00NIol
	jRF5IiDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPtC-000000025EN-0Gmq;
	Fri, 22 Nov 2024 09:23:46 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPjL-000000021pG-428S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:13:37 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so365771e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266814; x=1732871614; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+pN3XKvVFmetq3YJbHAkykp748W6pEN5H4vcdcbZbk=;
        b=AnXm8KA3Jn4H3D38+yx3X5RSiZuMndu13/RwE7ZX01l1iiCXgPzY9HFldMh1cX3GYw
         pCzD/DodVQAOOhg2Eu7wioqO+zWxur2LyqffpYXC7WgqvpLV0koGpXNiKUWYw2lzS9jk
         Yoe2I7plHHgfzw3nbN9HrOqA3c/VszN47uxDYSIQDtaaC1/TcbxPCgP9JD1ZLnwTuXxR
         4wkcyacSsl1PapfY3IV4IcKP0A/IDMpfm9Y92QSN8w4kaFbxxcvWBkYXaTBmIPs+AaYo
         vApMBrjN1cedFNJs45rZgbf+N7NpEApx2b/XRKrAuCGB0gugiPaHbZQbFhfkEN6VzLcy
         UFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266814; x=1732871614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+pN3XKvVFmetq3YJbHAkykp748W6pEN5H4vcdcbZbk=;
        b=a50v6kNsdxFoQOdnnMboeNJbKkizrXTsRpmySUo+mE8tegNXHaku6vtONde1q++h91
         N6OKpiQvwLtn6+EtgaBHhq6c3KjkBcVDvMOo10JbtNtji0lhX+W6k6a4loqIldsWd7QA
         Z4URj4Lcrc1BO6+Wgt8dw5No4poBT6yErbF2koY4lKdHIbrGnNggM/IilEi84P0B+qGH
         roWM8KjP+wrF2vfmi9IHHOIV7ssrInVirsfKuYSl95YNjBa7vmn4hFK1D3YQeuG1r5RZ
         smvVatwHGQd7l5hlyizXLPj4UKqBYw0tfgvvmBXMBbuTOhaPJP0ZxOI92PrjB9rM1pcB
         t+gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxEvwV9CqV7/fb9giJE6/0p+VyybJSk/E4tBu5UNVimdvoF3UEPUDwReyisTvokXJo7FCy3bzskYztSsaOgPKh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4flMIq7QI5eEHgZiQUN2/KsBRsx2yFZPaFQ1cP+biHZwikLR0
	+33B/YG4jLokXFc1NJyAjl9+IlCpfr6Adl9K8a51hlz6BYW9a7ZBa4GhEnzGRqU=
X-Gm-Gg: ASbGncvU6weKt/ityw1qsfrsDrWkeOSxET32lCfwemiGtLmFeMlWnKFlRmk95J0pnbj
	pX88O9tCbhb3GrU4PJwIE5pgUF5UMH863wnvsRr+2NaZYUcxJQBszUniVNfSms6oTVe/6S1trFx
	SiVm4o7ZQy3kCcIfRfap5N7rVLNwnQuJh129UESU4eIO9ARBwHmTCzrJ3a/5PtjiCDPaRm9i638
	6R/MwXyAb1xWGAtluTAuaXjY65GpFHG6Em++xjrEog5mXMn6BRf8G8PLA==
X-Google-Smtp-Source: AGHT+IFuPDVVeiIBHBx+sqGVLigoH/J3FctzJhynNILKoVJRUYGgovyLxnstEYxyEorm8Lhl1P2kvQ==
X-Received: by 2002:a05:6512:230b:b0:539:f6c4:c29d with SMTP id 2adb3069b0e04-53dd39b4d2bmr879301e87.54.1732266814401;
        Fri, 22 Nov 2024 01:13:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:06 +0200
Subject: [PATCH v4 10/10] drm/sun4i: use
 drm_atomic_helper_connector_hdmi_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-10-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
In-Reply-To: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NRpLumrdDZhSXCJcusWkwzHsBkwvkTsOwVSCIyGYQBU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsiTDOV2BoHyoyOts+0adMkGX+r4MYsJsnPa
 Far8OQb/72JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIgAKCRCLPIo+Aiko
 1UrVB/4mHUMcziWq1wY32ABnFkVrTROOJMHkHk+6+aK4dszHbnC762R/MtVLV2lOqnA6MnxSNW0
 EVuY2bQWv4PVDAZe+RPKyAm1fyLq9OizOUvRo1l12zL/O2139m41O4x3tI0r6uFqif8Pn4rZMCk
 t2ZMyaLmzPC6ufRtblUgk+VXVLehNTanDBHYRGga0siqsAnC662tRVl9Nf7/u1NOCILS6qYcKel
 P1sPNcHJSvULZIp9OJpXG/FZB4M7PHg/tR5MlTQzjrj0PWaj0798D+vDyF6eDysiUqnzifGcaGx
 giuaughGqZtani8SvGv0/wuVrNdnUepnAPAPfoATeqV2sc3E
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_011336_019963_EB217CE9 
X-CRM114-Status: GOOD (  11.79  )
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

Replace sun4i_hdmi_connector_atomic_check(), which performs just TMDS
char rate check, with drm_atomic_helper_connector_hdmi_check(), which
performs additional checks basing on the HDMI Connector's state.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 54b72fe220afacc208b3fd48d5160031127ea14a..b05fd77870b00aac97d003f3fb9c2b98cb73abc0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -187,24 +187,6 @@ sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	return MODE_NOCLOCK;
 }
 
-static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
-					     struct drm_atomic_state *state)
-{
-	struct drm_connector_state *conn_state =
-		drm_atomic_get_new_connector_state(state, connector);
-	struct drm_crtc *crtc = conn_state->crtc;
-	struct drm_crtc_state *crtc_state = crtc->state;
-	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	enum drm_mode_status status;
-
-	status = sun4i_hdmi_connector_clock_valid(connector, mode,
-						  conn_state->hdmi.tmds_char_rate);
-	if (status != MODE_OK)
-		return -EINVAL;
-
-	return 0;
-}
-
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
@@ -258,7 +240,7 @@ static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 };
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
-	.atomic_check	= sun4i_hdmi_connector_atomic_check,
+	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
 	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };

-- 
2.39.5


