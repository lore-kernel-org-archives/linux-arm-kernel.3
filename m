Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F05E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlZ85fU7bMEdCr3Ivk/JPNhlYCX1et1nGUUrgQd3Dz8=; b=JNcI3vN/Gzdd4ZOaUugk7yWG9K
	aEujkvPqWgbRIhnc+jLIyaRC/Ua9r1Mqtalm6utjeACyfoS6QKk4wV3EYejl5Y9QAJ8x4tdEzDE/q
	HuZGuMURVOutNQN7vynLV53XfSpUsvGSav+/rOc9BC8mLfOwbrku+/DRrOW1WRadzWGpL0pDPt37y
	xavVTktcDJLlhOcM/40u76z/Wb9jz5NExO9Q3y8ssFtO0XwWf6MnRTjuPysDqXzif/DtfNSE9EDeC
	VQlAPMgXFwTZRtmKxYt4V8+vsdudTYMVwRy65Yz+T4WG4AX2ZlDFOPrRQthPwlsW8ZFw2BV5NdAfu
	/kXV0ADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUwl-000000018oQ-2sBL;
	Fri, 06 Dec 2024 09:48:27 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUrr-000000017Y1-3IOG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 09:43:25 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30020d33d05so15706061fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 01:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478202; x=1734083002; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AlZ85fU7bMEdCr3Ivk/JPNhlYCX1et1nGUUrgQd3Dz8=;
        b=y7a2dQGKwCFRknorBocPKvxkjpgl9wau6fHT86gc1cZBjLnZjrLlMDH6aXMRnqJI9v
         ii3Jy/vW1hj8aTgWF1MvQqPCZWEaXfD7A0PfZb6BIFpjXJDZl6ZITl+XQDY+pnIJRU+2
         vlqdBChAC2KDNHt6E2PF3sAhlOi36OR2cqVIF1vbUI5M+irhYJ4zfiMG2jUhSKVfo5Y1
         sU+UU6uaOSCcfAwqlBz37g4o5f9t9tB7/R6yXwn77w6XdQ/Ht+It+dIKcEPyEVCvLrWY
         i0A60yECQHXtBdpU18TjKEVZIMwi5IzWHxvkLzlzHHxzfqq2NHj5wky6UNJEViOfWgef
         JD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478202; x=1734083002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlZ85fU7bMEdCr3Ivk/JPNhlYCX1et1nGUUrgQd3Dz8=;
        b=GXaGCePtsphB9IREyFVGv5X3bCv5vPCeBWQaVMPhEKOR4/lm5VGwzYLE1Dg141lcb6
         rVUMHUwr76lrEnQAfKkKkRjjASysV9SYPpyTVjUf2Ru3yKGmqBRlss9lxwFaAADuBLAX
         f2o/+RlW6eIWIvRSW2GsruFUxO0oolYnSxc1iqyq2Hi3JM/yfJ+xbLKMG0ouRo0ciXsd
         +E/3V0zxSxA1IK6MShJ5yN7QSgr6PxHaV+HYiDfASqcDQbb3meD57EQMWjuqEgNdvYQK
         ifXwDuNgh0obe5ZHWlaR/43vydWTR/jJ8Y7gIWRIF8ljQZsqXEXI7fESrbmL/PO7XCuT
         YcZw==
X-Forwarded-Encrypted: i=1; AJvYcCU9Du3H6/aiw6C2y6SBs5QxbTfsZJixDM05MLYflHIOe6dLaILBbeAYvLPdcFZEUcuBFpbse9fMhbuZg8rBLZzt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx58LeKlB9gJVtBGwOgiZFUaXJsStoCMKXWmy6oa87PonU5QWT3
	/jAoJRiiUNyJx4YzOUqrOBK6eB3zwGS6J44e3PEqaB6ZflOTtP0VsOSO4awNDNM=
X-Gm-Gg: ASbGncuISIciUWCehCaWc5FXM46YmgiboeJ43naPS1DWO19LtAZM60gsuOZyQ7TrQNu
	RzEFwPXA20h/u/HVmPeOdwOLZMC/bzqPuQAjoQQE67xZw/r4EUyuFpWJzo+AvZ74Fifq12XuWGh
	tLtUl1sxtJnfHnV0eD63ClUGzniqlQGxhbl18J2f3+YqbeHz7BVH8LspUEu7YSoyAvBqzDW4SU1
	hG+B1MoHfV6T6LnFieIf9S29j3Sj1YuOkTHBjp9RkL2Yt4UT81szfPogg==
X-Google-Smtp-Source: AGHT+IGE6b4F5G8fB5UzCy612X2zS/z9Gws1TIKohedsOmxkKxomXTuE6wjdB8eKM7SaKj4xHi2otw==
X-Received: by 2002:a2e:a9a6:0:b0:2ff:bf0a:2226 with SMTP id 38308e7fff4ca-3001eb8e67dmr19885601fa.17.1733478201781;
        Fri, 06 Dec 2024 01:43:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:07 +0200
Subject: [PATCH v2 04/10] drm/amd/display: use eld_mutex to protect access
 to connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xBnYTDnWSnfj2+gm2t5bxnQqQ5FnybkVoMOlzhUTQDQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscueDleWgUKJKAcLnM9AVfyZmdn0HpKF5uCT
 kBmRHGm9H6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLgAKCRCLPIo+Aiko
 1eleB/9rtsqyEXNmADXNUhLtuCtrT54s5AaOypZT19JWbxxkqIS98oj7wNLlcf7TA1rOQTNS5RC
 dvsjFVOL4cizIF20+Xp8TdJpnBVVRKORmoXxY/g+sGQsD+EyOh+b04CJUaXVrWxd8DJsAwzaO8w
 75HquG2asaq4K33OkBPkZ85wATKlXdb9yjA+34HEfbGr4Dd71VsgTtQ3Ozs0zJ7lDxU778quIl/
 b+/N+ADy5pyhsVGIAgmAr74L8TzRGdbpMnzmSPT2IwV7qsqdNr+KY8fyDGlhRaj2FA4wIhoLac1
 9tx5/gz16qNpAiJ9A8ijUf1L2Ck59EMtUlTVlC/at/0sY+sa
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_014323_829476_2CB9073C 
X-CRM114-Status: GOOD (  12.07  )
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

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 19a58630e774029767bf2a27eb4ddf17e3c21129..04c68c320252b5ce9647f0606fb86fe57f347639 100644
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


