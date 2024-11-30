Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2590D7361B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 00:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cxY+K4yZx53tAspmDt/c32sXFm2om2yzHiockIbOqk=; b=NpFRJ4/HXvjIjLp9XhukhZQEuZ
	mQS1eBGUn1fw5Kuv5gBsHV/IYs6b82LzM0tqjERTbnymKY2NAe3aeTmLXtbP8QCASLp6sR5Tko7wP
	d/2nYuHPDCcjqgVF0SOkCG4pdWlG0ee5/TI0mcwtErMnLvctBjYV2U5aCA2hcwAu8P8Y0y2kIzLWB
	1uWkM8FWM9Gtl27d8RDite2Zrv3DqxLD0blTwERRDroTOMU/5lngZeCJRS/+kD2YwmTsUWjX87xLc
	zXKarnbK5fbbxB64QEpsrB3ciT/5z/L1k5w4Y6L+2XS20EIwIQOtYd/79Tx+jN86/PVW4QzbQ2rZJ
	6iB07FFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXO2-00000002lwd-20TM;
	Sun, 01 Dec 2024 00:00:30 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXJN-00000002kqC-1iKl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 23:55:42 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53de5ec22adso3662451e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 15:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010939; x=1733615739; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cxY+K4yZx53tAspmDt/c32sXFm2om2yzHiockIbOqk=;
        b=Hais+ZC6lP7Y3Iu/gMrp9fB0OK+ODJZDz0JDkUs3mq//ZGLBrMSHJMvV0ry/CHuHcd
         +9a9owqiBkm14q5PhvRbGdWlfiqrno8FRdhaUqNigESYdn2zrWxwkRsgGU3B7BxYMfqQ
         2rIQox19S0bXYuopt6QMPxRTMCaCNecSE/wsp0jVBN19YomDy9aHxRM8tUubkSGDAVSv
         QSJMmqZvvR1OPjTO4ibRFbvcAow+CxA7zX3c+1oJDzg9uSJE+gdKiSLFd+Mp0AxWJ9oM
         SkfmE1g9E0wkuvJ+uImQgR7i495lNAqZREFZz7cXgfBQZndVGN9w2f2fMCSavb2KRuw0
         C6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010939; x=1733615739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cxY+K4yZx53tAspmDt/c32sXFm2om2yzHiockIbOqk=;
        b=tv2cKcMdSQcEahBVYbCsixsdKUAnO+6CTe7cfb/WFmpxwOM7KjBoas8C2l35ojCMTl
         H4q6zjPjkRveXRco71eGWevmmcP2YcMT3O6OKkz48rmaGwQXi5gG/XhXurgMNYzQXZg7
         TVWwAWT07y5toMazt9UXyc59jyRRvLcB2dz5zRcvpVZtOziJZy5cQrvgG8pkaqEMtWuN
         gJfxmOoiEeuYh3wKia6y9Izwies0Psgyw3FxLnpmgt9FF+TWQQFmj7s5/sGzdG+AKt1C
         YPXuClLxezckCrZ+uvzvY/jEc5zQWEmION+hPGfTcSXzY5IasyJS+x2D0kfzEZg4xDaT
         hoJA==
X-Forwarded-Encrypted: i=1; AJvYcCW8tEld0fgetuL16eB/o31CFDRblK5gn0G1oRaw12QCr/zlSPHja2+FQg81BmUiwpyVk814DAtd42Br4FbL9SNe@lists.infradead.org
X-Gm-Message-State: AOJu0YzRje45/1NX15szQs9TIohg0j7VZxC0xK/rSCUDORU2cn5w7Y7C
	B21YBPU7QW3XqLwG8Vu3Z8p0gFQaYD72tAHftAR4VmYZitHi55kfSqajHlgMZlo=
X-Gm-Gg: ASbGncthrdWfRLbmrpuRFpItREqDrs/CwW7GlbvBc7ed2riIEEONBeXrJJcWLxwa6cz
	N9v2gE11yOi3Lx2Xj20AavrZpB1urqd0OLsPDGLz0HSprXj3ZNs3yL6Pa/tw2+WsdDhs7iuNbNi
	eZTqN1NPNeunI6cKZKUfMIwuANPKs4GzkjIhXn52lKEDajz4oj1fMdhjekv1EGJdIDTAutFWbUQ
	8fgYNGFA5YRCRnKVOowmI+z7y6R0E+fN8trmlu3Aieib+3a0nI8/LRrfA==
X-Google-Smtp-Source: AGHT+IEqhH9kCuwXPt69aMI3EvWDASBu5c9Vx1nORTc0e8euAsFhVw9NvHYYoIvx2navJeV6UfeSbQ==
X-Received: by 2002:a05:6512:3d89:b0:539:f9b9:e6d2 with SMTP id 2adb3069b0e04-53df00ff7c6mr10203616e87.35.1733010939471;
        Sat, 30 Nov 2024 15:55:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:21 +0200
Subject: [PATCH 04/10] drm/amd/display: use eld_mutex to protect access to
 connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-4-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tW4andf3hq3R7WEIVc+7/mi1YkJBAZuwRdePwQe7SPw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6XtKnM5W7YbjO8PfgAgXIKJMU347EHoG7pN6
 bC7slgMtUeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1UpAB/98T+k5U79sPWHDEfdVoK/uxOqdWekFRUGXmaXz8lVAUaoc1w3Ob2vgVsHEmXEpRZcEqWq
 bqDqWhVxSkMp+nC/KP4LYMkzeAhQdwu6z7o3M+cI/LhyEPck5mRwoKlsIKia5ENA0q+YRaJX8R8
 D/MbaqjEkVX7h5ODRsXt0b8del0LoST99BcdJPq6yynl2AInKf1mwGTeXOm09nkJ7B6JX9D3N0r
 XnUieG4H8ZtcZAOSBh2bHBQePXm7XUKBlvFoHDklRqI/YU7jyKDWow4es6KEqLKgoa9z5zUayj2
 4MDN8Hi3OJ8XFsnfXmBTUuMae75l5OufjL1fj5yqKjhqazvg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_155541_448596_F23E6301 
X-CRM114-Status: GOOD (  12.39  )
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a0bcc62f280f8e80f5d174cd2f567a8ec616e54f..2843283375551b0b85f5f897acdb2aeab652892c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_eld(struct device *kdev, int port,
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


