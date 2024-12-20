Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E02E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 19:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=; b=O5gIap0gjgdZVqtmUteIuU0+TJ
	/fFEJG4z7kWhk+BYADSZe6eTT7sFS6ZnfX4429OrtH6BTFp65e5ED3NhPGl+tSsT2N8pmZptKC/u/
	Urspr2UaVHHK2P6pbvnF8lrfBgWLMZz0jaRPGOjIt+rYAdDIwabUoMGGc2LygSovb9oN6UPyKIaVA
	PKr8j49WsnFa9OGu5dT3RB6FJ4LXdtb7KCOIB22BjNzEpl9YN/x/LCUdtq3gPHaqQcR2EP462H3J5
	jcVfnT3Q6U6oDMZtzro5xPCoT4I8J4d6w68cLUGl30jpgZ6wJqJxzghXNMHPNc7G9IdgX0535ANFe
	3xg4QMeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOihD-00000005wkL-44ku;
	Fri, 20 Dec 2024 19:29:59 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiV6-00000005tfd-3VdA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 19:17:30 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53f22fd6832so2247474e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 11:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722247; x=1735327047; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
        b=MeHVQ8X/4nYVNtF6FwXYtLRawVJtD9f630kvcsdYDpsZyC8gupfMV4bxv9tS96ut+3
         sdw4zqNzrDgQMS1m2TYIUB3DGqnWkBQwRRbn/7mEiYHC28XVVyT4AogXcWew6a00nPEf
         kOeF+foHSgoFW0+9F7Cl61x57OEzdSBwo+VI0ZgNYJBjm6N8Nq2zfTD2koh5YzHdBjIm
         LUw24aIiaWmMRzuUZDH684EDsPSAqhT4busV5s1DQQljMJSAklxqN2ONbEa2YR7ZXV+r
         QkVmncC6MWM0tP9FRR5kBXtKlmxcG4qEO69iXbySDWYRFpF43/LmcVN54sA5Lk3Cqpdz
         9b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722247; x=1735327047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
        b=DYHIwKrWkw54HVKpAF9MCLJtzaB9DOQwls5sCIdXrkqsK2e9Wq1HqpK4DdkX3DLPj8
         HY85cC7xrH+xXj7m+8ITbNwkLnvJ/Ikx4wWjTq4R0rQgt7MKp93k0+S9+InBtOJf5B+2
         6SWn3dkxej/DQmH/vVBZheZclp2hj3wOKehuOCY7ZHzfrZjaUQ9zwcqjzmwV8GyD4elA
         yTsJxQoyl3akq94gtQPcqLn70PCsH85Qjx1H4dIc9a4NG/JLtCZ6fokeb3tSNQk/FYxx
         Ba8KmaEQ/Sm0UKTvtxJvwT7gqWD67YnJJPLg8TZE4tG8pMGgreZm8UWSdw2+j4s4yPN5
         Ye7w==
X-Forwarded-Encrypted: i=1; AJvYcCV5IvkPqOGz5DG0p+qCnPX3itL8yU2E02A/gaXcOoQsZvEr0syvcEtwh3JxeoSn1ybEJGYYSqFZbvYnzUd24Oby@lists.infradead.org
X-Gm-Message-State: AOJu0YyMHQjyjaxM3geNpcDeqEGSeK83XA65iLDMsdSAf91EGpf5mTEV
	ku232ByPZgh3q/8lFbVw4VO0a4fB3Gsq/MuPMl83QWRchE4UT/SyiLqXZmAAOOM=
X-Gm-Gg: ASbGncuEutFs+ZBRlnNaqX/LYV6xXD6XSXt7zGIB3LSsnZVNxRH5r4rzW2TZWZml6Ku
	AqpQVQadkwOdVK4P0pIpFSiVZQMDpye/8bLQc4cAwaRKaAMGnzJXKkJiOJomxmALrrB7gVbe6XG
	7l7XAUe5zlaAAm8hozb13dAmOMlvD3l31w6T+diKeUixERVepGsZdbgAmIQoD2oyBqQpS+Asu6K
	DhrTdLnfxQMGSV5E7oRCzVbwfxr5pQsgWSK8nsuJBlLoq9Z/U0mtjtSnoqqrFPt
X-Google-Smtp-Source: AGHT+IHe0mc2T0S/fidLlcXnIvV7arb5jH5l4ZSKmlo5D0G6qA4hbXh5msEHs+cmKpxC6EOLciu+6g==
X-Received: by 2002:a05:6512:4019:b0:540:202f:4955 with SMTP id 2adb3069b0e04-542295603c8mr1276517e87.46.1734722247275;
        Fri, 20 Dec 2024 11:17:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:07 +0200
Subject: [PATCH v8 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-10-2399dbae2990@linaro.org>
References: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
In-Reply-To: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XEE5uVlLO0AwRnx9UbXjwAPIkR4mEqLYJ4bDyDXWCRU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKve9DZuQ8ppU/Q/ZnyEt45kRCo+xjVXVr/0
 f2RRu93maOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrwAKCRCLPIo+Aiko
 1eW0B/93izm2Wfmdhsv3zy3rGU9m1u1l5dcOmfJb35f/JiJzpMofuBUPhBiSOWvd/xJyc4tPmAi
 V80XUFJHu877in1Juq8fESbqqMCPvLTEDfMXFnmUvu8oboli6HpOqnnb6g9JhbJvNtL6HsDxvZt
 KgZFkLtZeGCpHWBDeaWXihbv2a7VhnSpusAa0AcqSAdlvM9psDa1JF8yYo3tkqxTeRODSb+QDKu
 l9biQtscdPSlOgu/xKywBpVtaNFC0rbQj12YLxzL/BOf6Q60quSYWiwXp4pC/0A2NjFTe9Bby7o
 nutFS8MabwTox6OJ+b76xLxzmyaD1PeBBPIoGgP5pBsG2cop
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_111728_889091_C3CB9321 
X-CRM114-Status: GOOD (  14.28  )
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

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5282dd765cc9478361a705dca85f615015b12e8e..82eeb08c183420b000b351da1e05f9a47baeda90 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -383,7 +383,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -405,17 +404,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 		return;
 	}
 
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	drm_edid_connector_update(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
-	if (!drm_edid)
+	if (status != connector_status_connected)
 		return;
 
-	drm_edid_free(drm_edid);
-
 	for (;;) {
 		ret = vc4_hdmi_reset_link(connector, ctx);
 		if (ret == -EDEADLK) {
@@ -549,6 +545,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5


