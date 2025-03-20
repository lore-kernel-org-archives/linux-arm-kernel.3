Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F524C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 08:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJV9USVZmsP9ZdAAuuoldoMM46JkHDHsnIzVnX7GtUI=; b=rKtdf3POkJUgJmzG7/a1loPKdh
	TRt3ifbd1h9SkjqCK2Qc0VzIMkkABuISx6bayhOKOTj1ildm+rAnPZpT8MmNHsJKTB8TJW5E2rbib
	IYgAIzNJ86DowpPP5MCCArbAHQllPCwXDpHwblOe7hsXWavQLfEMACbhXlg1EUNnSrxfTv1lW2IYn
	i2Pf52dl9uOcLTjFSVh/Om2kitiCmHzgpCcLyJ+8WjQfakyWGfyG6nE14eTlAG+Eksky6VtpstrCP
	jM6R9qD0v5KpfHNI3L/c83sOI45q0+ovFPqUFUKT3zPi/GIx40refeNJBGuF9NOQ9I5i6JNgGzDCC
	7NFI6a7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBfY-0000000Bbgs-1h5m;
	Thu, 20 Mar 2025 08:54:28 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBaW-0000000Baq4-3cVZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 08:49:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so2726485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742460555; x=1743065355; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJV9USVZmsP9ZdAAuuoldoMM46JkHDHsnIzVnX7GtUI=;
        b=abaq9KTHAZZWdXIX+Mt2EnQNgTSYvSu2m35QxDkYRk++l3eZHYmQwe5fdwUk23v7Go
         KApkW5oTf9HEay4tDdgu7IQTqHvbhVPQetls8ob0WdLY7zBXlxTcro4vBfzaWxSQRDTB
         AreUCw36ddhgeyLISVKfmb+7ifpYQNLgjVn1d83cVOYiPWEHvj0XlCKFcQ+pHZZDLdt5
         vehNauR0HSzcE2Z6zKEuIg8Xni/4Otclp5dS4FR6gevMLca1MHxC5ujVTXICGzLx3r9x
         6cZfG3M54EA5fvJGekePIsme4kynd+S/pASHrOFbEV6i6ARtMhx8E1IoDJ1TW6oRV7Im
         LIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460555; x=1743065355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJV9USVZmsP9ZdAAuuoldoMM46JkHDHsnIzVnX7GtUI=;
        b=OPjuH9roxe/vcyXKo1T8nluLmLkFawG0eBWCdnuwEapq9FZwQYE5yM/bLO1w+Sgxj1
         ByTJgdcn2W4edh+7mlWWjHymg1RCpelsgA/DXRGL+JNTl5pFCT5jg4HZTKp0cx4EqfMB
         fb4w5CxwXyVmC+vwpwVeQAcuV1EdtZd3hmyLsO5uu0br0FiWOrh39pWRSaIjQnqGFPdJ
         ZPeCev/+FqUi6vs6JGsombD66rKsa82na2zlwP3otCeNbJN6rBcOUhDHO4S2J9bnJnwe
         SoXyca3agx5pvzaNIVsXKjQq52A49t4/PmAoZNuW/iSTExKWRE55FmByi1KiVEXlTV6C
         STXg==
X-Gm-Message-State: AOJu0YyUT2Wy/nuC/dyz9jt/3JmM/vjjmYyQdIMoba3sZTaFZ5uNgZmS
	2pMDkGy69hCc8L/iF8/qY2vdW57IoBfS/1JoFP4BEJeIlAHMs4wFyUG3RoI4u6k=
X-Gm-Gg: ASbGncvx+JUpJSaeXcUKZ98KCeGImvBEguEiYrloaHwxtrwGlpewiGj8CVZn2OE3yk7
	HXzvP30hejTX+UibEkcp+c0oZbIXi629W/JKPKr5twEybw4062CGAXq3EE8ByQnptgbFNyt1cT8
	yphNN0WAjeBmooI2qEhW5ZqSohpoN8Z4Q13lLec22H9kwyCzgB/fA8wlaaw83AKqQU1qfC1H3Up
	7ECjX7JG/niq4JVZUM16G/aNfIrqSgUDinVoIiXZ55QBRFYU1IbByqB/v3NZg3c3JipMsBOLARW
	tXClYVEUGLYtDMij4Dz3IV2CgnEXnZVM5F3idDaKHKAEFB1PIHxD8A4Yb1c=
X-Google-Smtp-Source: AGHT+IGvyzObe3HUgUPIOkcUmHLI+6xANcIGJKxeOg9jouXNulvNZlxlIH6nFdT6PpdEkn3OcgskSQ==
X-Received: by 2002:a05:600c:138d:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-43d4ac2b356mr13977715e9.6.1742460555324;
        Thu, 20 Mar 2025 01:49:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:c11c:487d:c821:54a0])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d43fdac9dsm41381655e9.30.2025.03.20.01.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:49:14 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 20 Mar 2025 09:48:46 +0100
Subject: [PATCH v8 2/3] drm/panel: startek-kd070fhfid015: add another init
 step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v8-2-c2dd7b0fb2bd@baylibre.com>
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
In-Reply-To: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2311; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=gHl0LdUTqSzXFqfH/bwqt0Qp3EzE+6UWudOR8k0D9wo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn29aHBpzXiGFeZYZjQ2WV79w2etmusdRumeCDA2/j
 En4xIveJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ9vWhwAKCRArRkmdfjHURUS3D/
 9vN0KMVYZZKmprhPA5LN7rawwuTGP/uyEhk9jFV0/j6JL6U4PVd0nArK1OQLjxBSyc8nUS1QhpHFhL
 GNVR07l6xuu0efimjhIgzKpfapyc0xJDcsSLokHgtrFYnnFsxhYNegLt2qFhQnAzfhs6CkD8JQRe7j
 K5ZiuZbQaE9rSuPU9dMg9/Nc9+eO8HpPVfckzLWretHlNh7yz42U0FAUp9KvfnDilzIcxzydGuuNzy
 Jd/N0DstuCiy80SPtbL4cE8FVcQZpZe5jPrx+mMVIUtyaVPTkJwyP++ureQvWDzAQ334cDPfrwy2Ei
 Oeh0VnncqzOktXqxToMmHFzuFwKfoDr0/6LV+dlVtsI2RP/3/bW67t8xKV0I6eMGMGESBck72W9vwD
 ca1+TzhnFFesumJlEkaj/XnlS6mvr4PPLAaqauBwaKTiAXgZT/btqNWTVJBx+sYj3/dyd+1Sy0NtJ2
 lpmstf0PEKIOMLotSfh7vkJ/+71UqXjgjVbmV6k0f1lgMLHIpGEEqNz/Us0zURzuYQEVwsj6cFRsyw
 W6Lz1Pgec4nQ9wjY5aeCuLQPAkLl9D87UWlEs4SeCgePB7fs9v/PogO0y5kTxHItyjqRqV2XGGIAxe
 Lu9b+dTaPTCrjNEDXVF5nGl/HyIMiJ8yrA1aWPFooOUtSOMg18/vt4NOuirQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_014916_932973_E0ED3473 
X-CRM114-Status: GOOD (  14.83  )
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

Currently, the panel set power, set gpio and enable the display link
in stk_panel_prepare, pointed by drm_panel_funcs.prepare, called by
panel_bridge_atomic_pre_enable, pointed by
drm_bridge_funcs.atomic_pre_enable. According to the drm_bridge.h,
atomic_pre_enable must not enable the display link

Since the DSI driver is properly inited by the DRM, the panel try to
communicate with the panel before DSI is powered on.

To solve that, use stk_panel_enable to enable the display link because
it's called after the mtk_dsi_bridge_atomic_pre_enable which is power
on the DSI.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 25 +++++++++++++---------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
index c0c95355b7435..bc3c4038bf4f5 100644
--- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
+++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
@@ -135,19 +135,9 @@ static int stk_panel_prepare(struct drm_panel *panel)
 	gpiod_set_value(stk->enable_gpio, 1);
 	mdelay(20);
 	gpiod_set_value(stk->reset_gpio, 1);
-	mdelay(10);
-	ret = stk_panel_init(stk);
-	if (ret < 0)
-		goto poweroff;
-
-	ret = stk_panel_on(stk);
-	if (ret < 0)
-		goto poweroff;
 
 	return 0;
 
-poweroff:
-	regulator_disable(stk->supplies[POWER].consumer);
 iovccoff:
 	regulator_disable(stk->supplies[IOVCC].consumer);
 	gpiod_set_value(stk->reset_gpio, 0);
@@ -156,6 +146,20 @@ static int stk_panel_prepare(struct drm_panel *panel)
 	return ret;
 }
 
+static int stk_panel_enable(struct drm_panel *panel)
+{
+	struct stk_panel *stk = to_stk_panel(panel);
+	int ret;
+
+	ret = stk_panel_init(stk);
+	if (ret < 0)
+		return ret;
+
+	ret = stk_panel_on(stk);
+
+	return ret;
+}
+
 static const struct drm_display_mode default_mode = {
 		.clock = 163204,
 		.hdisplay = 1200,
@@ -239,6 +243,7 @@ drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
 }
 
 static const struct drm_panel_funcs stk_panel_funcs = {
+	.enable = stk_panel_enable,
 	.unprepare = stk_panel_unprepare,
 	.prepare = stk_panel_prepare,
 	.get_modes = stk_panel_get_modes,

-- 
2.25.1


