Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF06AD73619
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 00:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8B/E5apatQK8hIbe5eE+ik8zb/UqM9JhfpXKxSqUpBI=; b=ykKP6dq1LufX0AjAwB6zv5eWRh
	4S6QiBcMuORNpeemux8Pyqs8aSC/N5TYHnLr8gRKvos2Z0R90wb4hciKQjSC8Qd7Bgr6cGz3hK16V
	tgyRHs68RaHWH9qHGK8kol2hMVHRyYUZ5zSwkWlO7xXHmMs4FYsfGBwE35hpSspWYpyK4kJQkyAW+
	B4SiSXcynuQCkxmL5ZIIOHffzyL/uLVCGTS+7Vjj8hflhzf8VSsCXiX8zg264UZk6ZVDR0jOJoXKr
	/nygcewbLZWQ/VbNAeulU9xnE5oS7MU+3TdULXY3oypP4qHLEEdlFEIXRjCNTgA9bip1jCrT38JOx
	wJ2RdqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXRq-00000002mLx-2VRA;
	Sun, 01 Dec 2024 00:04:26 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXJX-00000002l0a-0nWe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 23:55:52 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53df1e0641fso3397188e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 15:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010950; x=1733615750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8B/E5apatQK8hIbe5eE+ik8zb/UqM9JhfpXKxSqUpBI=;
        b=jiCweXsbiic3N9ZcTk/BL4aTWmvtl3gzkBs9aJ3tIYBYG8VsVmH1J6DR4XK043ttcZ
         90eF/4uGBMoYFwNsyZ6BzMRhyHftbibLlAH2VflsBnNhEHzx/9LrWpdRHkxdnfjmRXPe
         bYLKdwrT1Prnx2gQEOSQBfqR48FRkceb8J8Z8fBiXNIk48ww4V3KEoOuRhs9+ucAcqEF
         Zepd6djT60o3aHjkSRrDn5FAYuguQ1IshrcBNVvGuU6HfiEaSln/y+jT4mxJ7unStQBX
         LXoeH/i/1jBtlQqFfoO5l9VaQyEpF/z+hFYi+u5l+V9pnA7r42iJwUw9xDfqxk8CM4Bb
         9XeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010950; x=1733615750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8B/E5apatQK8hIbe5eE+ik8zb/UqM9JhfpXKxSqUpBI=;
        b=Xfwc70Z+inBW1MgTkqDofeZ53UcdZ0LYOFBdnmLWXKo/WljMXSlxia/4qDPGP3vQ5m
         hfWSSQp0qrrSoKkzRMtqq8vWxct9NlR2we4zelyf3gzScIKn8SKQtq6rt5rPsAqaguPl
         rt6GXZiCFoSdYc501KitsHhgeWPViKu4aoXRTD7HHzBtP7HfxXzreAt2XIB8bV6i8zjI
         tC/uD93wWrsbvLUdvdRP41VSnSAi2cB4J4nwr+7ebAU+75sEJgbmqFK7u61i9RJ2Ghe9
         598X49uTlPM6u2YgVvODh2ClT8odhjYr08qiQcGLAHsAwkmmcVuVCIDfwTkKppaY9UXh
         JVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnwfKJKjvD9rnLtzuIr85p0ZFB2QYGBi9ElPx39F/OobfMlOImS9NVkJxP5drWe+uSzKIs9RlRG5nZWDzrkRHH@lists.infradead.org
X-Gm-Message-State: AOJu0YxoLqdrbrCEixBj3k52kjCV8hvNwjCw6NI1z12HgMcrVUgE44Pw
	REpFLAYoGT+C3s5rdPpL/8vNX0JE6PoNNzURUuyYApPWVxKfECcgydfK4jQehkE=
X-Gm-Gg: ASbGnctVxkpICg4K77rIzEMODahPAUbTcVlJ3SMxtLRHbsoz+yzfZDHPtTxfPFzhEe9
	P9JDmrnbsklttAjiUhWekdnqaCZeycI6pUgAErbYxsHpAQQbMxEStB2+n1PwyUBetnabccd+op3
	/mY7tmWhv3jwKZC2XCkzSCRybMhABE0UlKhVvROS3s5MR5N+qvGTEq3T8gCamQXICmSlN1K0hQ4
	9dWukkCXmI93dukVfDyPprG1FHvOAioo0i3QiKLeuHS3HhMA/iaITlkjg==
X-Google-Smtp-Source: AGHT+IEIp+dlWZhe+G8N9bEIs+K1C7FxJxPBY+37wRt4+mS0XWsu4Pb8i2syhEp1VwHJei72BT+biw==
X-Received: by 2002:a05:6512:2391:b0:53d:eec6:4622 with SMTP id 2adb3069b0e04-53df0112169mr10013326e87.48.1733010949652;
        Sat, 30 Nov 2024 15:55:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:25 +0200
Subject: [PATCH 08/10] drm/radeon: use eld_mutex to protect access to
 connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-8-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nLL+m/6tlRaIYoSYEq8RR3ocF0ESeJZGxjq7LmbbmlA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xu1LiAN0LkPKwIvEI7W7y3lCM2SxWMHTvbj
 OKqmG8qGtSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7gAKCRCLPIo+Aiko
 1U5zB/41XZZbXAdwu3uOSstE5ZQzDb/qDMfKvZlQ+OJnYtFRVRPjLns5mTLy8yXWP7axSZix0qW
 b7qL5zI7wvpO2vQvcGIlHhF/PbdVB95v/KMBMYnMbeU6gtmPf5jcjRy0jGVt10nRTw+BH1a7LiY
 s+eAItvf/SJKs3/lGEVhzQQaHbCps1ve7fnPjmWIfbHbFVndrKRvIwzNmZOCN46ii2MW1Zygzk9
 BmcKvVQ0F1Xhlx8whhYB0/xD2Yk4tKPh56VWVlvcQRz3jc0BKV4UczX+YsA3+dmiQSZfSXRoEaZ
 S/wTkEVIXnpQxr5tpjXD/AFl1W8QgGZ//FF443/owvvry4TL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_155551_269735_D1EB4023 
X-CRM114-Status: GOOD (  12.35  )
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
 drivers/gpu/drm/radeon/radeon_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 47aa06a9a94221555a4828f41a57cbe03d637ee1..547d8f420669cdb949ffebd0677ddb8cc3c25812 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -771,8 +771,10 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
 		if (!connector)
 			continue;
 		*enabled = true;
+		mutex_lock(&connector->eld_mutex);
 		ret = drm_eld_size(connector->eld);
 		memcpy(buf, connector->eld, min(max_bytes, ret));
+		mutex_unlock(&connector->eld_mutex);
 		break;
 	}
 

-- 
2.39.5


