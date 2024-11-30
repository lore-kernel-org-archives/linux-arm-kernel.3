Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14EBD7361B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 00:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xien0N58sB4iffC9+suYdwxKcgrPQSZoNIx9TfZkSKE=; b=OGVLWu7jmLvhj2DGUx42SgQ1cj
	l3ew/w9/DV0k20N2Hmj0c0onntHlDIs3jiWSOFANJOm8tSBixBty0sttzyFjA9x7gM/srrVVLACzp
	YtEZPluO2FMHY9vuHrQ8/YtBKZWARM5q3yy8QwLcs5b51I89Ovy3KoP5/g75oBPyhXmgUuAQal6Av
	Ns+I1PKtb86P3lj+taiwKJ0H7Q1UMgf0GB5P4rCn57sj23MQIJUnnwjI/yxIADcZXqEgrG/rTWT4z
	hnutHPxTvlqiZsZAHLRr+K6BE+zYsTCi2eQ3gLI2C1k3td8605ZtXcuix1qYrVCQNUFbTV0X5cBIF
	F1tRfU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXOz-00000002m3o-0kD0;
	Sun, 01 Dec 2024 00:01:29 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXJP-00000002ksS-3fxZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 23:55:45 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53df6322ea7so5143205e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 15:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010942; x=1733615742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xien0N58sB4iffC9+suYdwxKcgrPQSZoNIx9TfZkSKE=;
        b=rRjw5/zGjhye5+8gUqxNKqSFY8BeXmsvsiSaKcdHVSaeMnGJgkpeG2kx7Iv0kef7r1
         kcERTYmG/qKfGPaoB67/nGER6/gSoH3NWWiCd4/3iZQ8ZlGp5AGGd+pOe16dXqGMaWEk
         8vQF4J3wLwf/laVLeRpNgFOJP/yrqEBBavGLfrVrRxF7aRTSy+7T74HYIkczSMasbAig
         2s3F5OhinBubRaQvUJoGv2Hffe4xSwecQhWkZTKaGm2bFjlBczwL/BaiN/vdnCVCamx0
         FEwmGBDpNP16nlzj5ZvVyOiJ8psOLwKbnGaab0tHF8JyFwJ3wfR4EnClEvbCKvWtWP37
         W+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010942; x=1733615742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xien0N58sB4iffC9+suYdwxKcgrPQSZoNIx9TfZkSKE=;
        b=kJsgzMIXq7b6JKJYOSa2YYlXgBFhfLi38kg6Q7vaQQTT35gD7kFUPqaHF695jfu0Xe
         l2RKRY/4rpwZ7UDq027AgTZUq49MJZQ1r9a8KAyHnUQJ2kePxvR/c+BuKgZGBqtLpqdn
         LY4JJdRjKFVbWtvie+vpGGYQuVLQ3lvjsowDj2aCzWULeUYVfAcV59BCyN8dDQpf7/J8
         +FDsg3WEjgE1ZaLPca7ErQx45L5LkK4LRme9FLpC7sLHdvTW38SJOwo31Vvm4fQ/uFea
         p+bY1x9nm1DfGTd+5mPlpRTCJMn7iNCNgbCQ0abmm5aLftGhU8Ivzrn9fgXSW5Cr0sLl
         7uIw==
X-Forwarded-Encrypted: i=1; AJvYcCVr5rbagQ08yNWk87kFRbhwBI1a2shVI4uIR87a7aTzJK+Yb0zHOSdARlaNygyMrdtj1gqRncUHBR1L4DwSODJ5@lists.infradead.org
X-Gm-Message-State: AOJu0YzsbGHnoxTmgAbkiAS5OYQQR5gzdL4HL1mOfuFhYLLy3Aa0q+xJ
	UJHE/rs3rMLhMUu0vPNfAwQz/fUbV7JX3YzxKUtmnulmJBZZrFolVpzsGuFozQ0=
X-Gm-Gg: ASbGncuVslnPB0tZ7tEL9r4eSu794ClSOmQuhcEu2OpNbYu5wSxu0CqDYrBvPAvPSAb
	wCbInVHdbS0ZzuP7nxncs++spF571Z8FdIYW7Rne7JUiXNc4MV/7bonANJDcHCFDVUC7pVyqqVr
	1H47DgVSp7d7o8vo5Oq/W6DfOCmATYpY2E5imCWjpG4LzueHlUKCpU1QXP3DkrQ38AJotVsYwTD
	uxhhw9MRuI79hipOSXlrNwqMYanNhBgGFcF3ZIG6Ca/jRHIYCYOBiy3qw==
X-Google-Smtp-Source: AGHT+IEoIeugoET5BqjT6NRzZzzy0ZjjP0TBRwdTQ5WPutajVCKBkgCZ3DW7I0WGOJti6hbbaxziUA==
X-Received: by 2002:a05:6512:3d86:b0:53d:a3a7:fe84 with SMTP id 2adb3069b0e04-53df00a96e8mr14561366e87.8.1733010941990;
        Sat, 30 Nov 2024 15:55:41 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:22 +0200
Subject: [PATCH 05/10] drm/exynos: hdmi: use eld_mutex to protect access to
 connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-5-ba56a6545c03@linaro.org>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=IlBBKvhDiY+cvMucjbk73vB6IzNnRZ3+VuxCS/o7lvk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6XtFcmUlMe9gPJdYbealc8FI/qrUiornp5Sz
 cmdQjBUbCqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1ZUyB/467hRM5fIPQYymRfBPSsYEC5gNFcEsRNSKClp6yBUjqbuT5K54U8veccTLagqpg6mrQHB
 sJYGNPnkUEjnK/JULDL886lHb/pd7SixyezCY9k1Mvf+/vpb3UQCr09dSOMw30NiV6NkWvyKje3
 BIlrF/FZ/tS1DHxqV582BXI4mw5v2jinlQQFFXaTrs/2hLdXOEQ4QHa+nzNK2KyOa5RBmbNeNVm
 uQ+khov3pAbgUTXsoLh/W7vnwwJOU8GBcFGjx4o9CWpP8W8q76JzryVKmf3dp+2WCcFdRfvArJ2
 8NknAwK5Hx6FXILV/EdSpHepfGGp/Zv/ytvXybjv5g6YrJ17
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_155544_010038_6681E486 
X-CRM114-Status: GOOD (  12.37  )
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

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index c9d4b9146df95bb46cb6bea4849c331616c2b463..6fc537c9048f5c8e57e30f083121c9aea6b99a5f 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1648,7 +1648,9 @@ static int hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 	struct hdmi_context *hdata = dev_get_drvdata(dev);
 	struct drm_connector *connector = &hdata->connector;
 
+	mutex_lock(&connector->eld_mutex);
 	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	mutex_unlock(&connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5


