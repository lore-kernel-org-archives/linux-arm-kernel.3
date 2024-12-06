Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53897E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DR5UNfjajRu4P0t/KAHkaq8u/GtT1QuQGweWq5XMJM8=; b=Ep0Z9AbFcA1Krvkl7OSQ3M0yDt
	EahXwNML/Dq8/dhTUmAl28Rr3QyR3Vff0iYePf+C5pde1MF/5+/IR4pSaOR/YTvNME8ERX1zfcSWd
	Eor4uBtcc4wb15PeHmPI+gKZyR7PbOUIl6Ibk8UMCHerSGxMZaCkYFEJvvn1oIYdRc+Tln1CpYNoZ
	L2U7v7g0GiqAMocSJrC3CxZQnizno2eNG4ktPdef16kVB6UqWDdlYdBfHc6tHLJSDR88A5R9YLIYB
	bj1ejx4TDUVvHrBos5ksO6PSnSfyM1Hv0oefPZMBi9CpIlchZPh31i+0zMdJNRj3827xOH2l+LQkj
	ClXQuqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUxl-0000000190b-1emA;
	Fri, 06 Dec 2024 09:49:29 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUrt-000000017Zi-265G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 09:43:26 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30037784fceso2191531fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 01:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478203; x=1734083003; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DR5UNfjajRu4P0t/KAHkaq8u/GtT1QuQGweWq5XMJM8=;
        b=VoFWAc0BaQdr7522+wuMYMHJxBcl5cSLGgy9cpDkbbmOgwx28IqBMfvwpk3F9qgscR
         j30nkD6qTAmfsffdnrwJbW2PvtqGIKFhLKQHxur7Xga95JCPYMf3ln/6eW0RppwNJU9K
         73d1UeFyGPsXn8kyyo/jZum3MisDefH3SXs8wReHez5JCn+RIRuPOcG425mqUfO6aWhT
         xQXB/ZpQEv9wI9+ceFkwXZAqR2HCLcfM3nGGciFlag03jjJrsafHdGXirFVRhzpP6539
         3ZFFagQdmIX8+QnwpNwV+RLQACHHQS9TkOeLmkMg3xZdLZ0G94TW8CmnOymSKV3FApMS
         37mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478203; x=1734083003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DR5UNfjajRu4P0t/KAHkaq8u/GtT1QuQGweWq5XMJM8=;
        b=Vz+D0oQ2tDOlRE2R5baV3mlTyLEzzFUATlNKM0Nr6MFIAbvbQNPyWFxheXssu3Niqq
         /KZr4PejdjF8EULhHfSUxN5UXjoKxF7DrNnG6jdd907LixmmWn2QSb+jcySfRWiim7/w
         xA0vkvBQWFIF+v+rIrIoJ/D6KC2MNiFIlmOxMMmUXo/MLqELlvRGVU9A9i/hkHQ3k6Y6
         C14vfhmH9Ibb5DffJnn7GqBv8hi/ECebbNx+swJepqN/BaVaP45UnRZMrYpwYUjWZG4R
         Sc3k5rCZSJ9ieSw1MC1sMYeot07wYNjnnWIeZ6ke3Ov9gXzA9oKdpQ60R+rY3HJ+W0ni
         RVEw==
X-Forwarded-Encrypted: i=1; AJvYcCXzzF5/nIpfa5kGl9hRcDhwA/JE9jHWTg0XFLC8UN2tSBGcMR+dw31OD9Rc/AhIoCxrXx6wY/B60EaQdg8qmP69@lists.infradead.org
X-Gm-Message-State: AOJu0YzeQ7sA94f5O+XzlCNbeqHN5xPhBpFE7OIfodnSEdEtpozfWqT6
	5uxheoPtSccQjslPwTXn9IBCzmYjeJ8yJl0RHMThpg2t8jQqqf9Ke0pJtIs+tic=
X-Gm-Gg: ASbGncvDE6yqpxPgq+oSqcXLn/M6EwGQGcS8ZbRKd7AdrPS+U9gjm3Z0V403/MABzNu
	nQrRxvg5MHzPPHX3+yCZqpEcQIx6bn296j3vAJsm2E1XyF7HOLvdRykyPVtMrWcpyYxXL20kmyz
	uyJV4vXJk/PAIiUmVUM5PIExi3ILT+QLruJ4j6u5LcssXSBvSW7L3d1s7meMAa6tJJZ89ErFqr9
	We1KE1oTAqr/f5w6Id04nW/P9FVATH/qfMnuzq36Z6AzvAbuw9hEbMC/w==
X-Google-Smtp-Source: AGHT+IGCjsHeF9S3xd5zx/P4eEcmZ95qD374mHfeNE0TcJsafXsKauKXde2wl439IjRQlzjjyxvauA==
X-Received: by 2002:a05:651c:19a5:b0:300:eb1:a4f3 with SMTP id 38308e7fff4ca-3002f8df262mr10870581fa.14.1733478203466;
        Fri, 06 Dec 2024 01:43:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:08 +0200
Subject: [PATCH v2 05/10] drm/exynos: hdmi: use eld_mutex to protect access
 to connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-5-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=I1wH9N5enlUiSVwdDRB0wmAdGhFse9ySIo7WNjanmNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscuTpR0+HiR38S1fTr4ertYoyhKL7gh5Neki
 QVFnX1dWgWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLgAKCRCLPIo+Aiko
 1cP5B/4t0Yy2pHo0bHZjNzf9FSu/qDR8IpkFFhM98PVBn8EV3bNlLhb3/FOwaAYFawC0R7RFsei
 6gC0/YzWxhmMGYPjsOa/37GrWtmPrdHhBZ+KBT63EfOBOW+V3p8zsoWg67YBwUdMuuGRt0u0auc
 DgeeGk8WkE3xEW+/kPD2P0j0s/FWIYP6HpthpzIzXnTLkTKofLtovXgVO4JA7XKTloel9mAL6hd
 YV3thOkL+KoTiLV5O4nnCwLlrkMriaWauaCc/+rcxPaFF/ZnLJwVFuHb04GMj7WXisEfuKJ47PX
 zmzNh+qUndFSRAODqbBfgIEe9P0WLax3l98lRYUC73tWfPVy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_014325_545235_05762E4E 
X-CRM114-Status: GOOD (  11.87  )
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


