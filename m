Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6D8D7361B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 23:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=igdGJ+6WFp5yYbSTVfMkHAFbN2LBIGOZkBsdW6CIVmA=; b=YaY424kSiEbI5x
	Jf/wp4nFaPHh/9Wrfhbx573Rpe5ZHXWwfSmK8mwJ5ASU8+32VbhqCqWUsdTa9+OwzSCrLmgMMyH6G
	V9bNXQVD9T+bsKaOb9aq4/1OQvb/JOjFZXu1QnnX6Gcf+JmY0L11he/rU4ZLD8aEYyqI4INBSFArW
	km8YHqtmBgZSiG1Cbot4n00Q0+pFzQWmEVPzW1a4g6tc4kNoczh018p3Bzypn6cfQ7NP/8z7qIkFM
	jWydK2vJi9lJ/gogX/Ewz5Sa4H5Zwe8LucnJBP+nTB5y7EE+z/lDzBOCgfCMHOuIZ18F/57G72UMZ
	lWY0KxhLTrrlI5T0yk9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXKD-00000002lGL-3Aqc;
	Sat, 30 Nov 2024 23:56:33 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXJD-00000002kli-1L1P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 23:55:32 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ffc7a2c5d5so31019211fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 15:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010929; x=1733615729; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=igdGJ+6WFp5yYbSTVfMkHAFbN2LBIGOZkBsdW6CIVmA=;
        b=cu/I8cpAkfNaQnReeQOfDHoQVk1Vs5nHwli03BLfvd09rcvoIt1N8cFK2j/lZ61J6R
         R9v32z7WYAUR4WTh0HwZ/23OBllIoAjNtQvNk9VVurFSxkZpCHfLMta2p6Ek8U8SVBWN
         IbxjAOwuFFX8RKanYzYERoLCTmSeTQNSp1wjo74Gx29dmWXf3l0MPNUPZnDvykDjYKPD
         3KyPncyQr+F5mHftJ7KtGz2epJaJ/RVeH0czwhM28VuaE2wAO3Xu6y0H9qaw5bslyNhb
         F8roly9uj38bt5kLwApEh/bN0J07dkKMHV3LlzHBG1Hca9p8sxu6lUzqc1olVd3wMJHh
         wN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010929; x=1733615729;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igdGJ+6WFp5yYbSTVfMkHAFbN2LBIGOZkBsdW6CIVmA=;
        b=ZhfjDLilpnDUyER3HbCIuYnzwo78Hh5b7JvpGokB+uWFmZiDlUFBShP/lUULItEfad
         A+H1EvDSmffDJ+Nhv6mACQIzWTbzh/5qx5NMlPhxiDfr/tza0NefZdgeF895VC8x6EMY
         Q08Xi+6FAbod5Vd0voFUjf7AToTYlXCIuCd2xSCStYxm2OSvRKi8idUeseGEF6PkOFcx
         aMUNl4DcPG5wlf0srazewDEXLVmRWyBgU+SfkGi2LyBMaas5hVG5xipXhg2dWUylhfru
         kpzt6cvY6Wqkz6CRXf1av1/tx4ua0JAXRDPQYnx3Kbt2GZemBmOdZQp6qyHw+eacxqIY
         c4+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5LaTKp30vDs63pynjGE4UFx3KJ3u6UHUwdANZ4Ssl7ySpJM0ND3nGpWwPqTI5PPMIjMiS/QOtXi7AvZts5TKW@lists.infradead.org
X-Gm-Message-State: AOJu0YzXBLbXU3F9RHTYukRNE/1aCSN6xIlYcjglnhGIrcRJT+8ESO7m
	t9nKm5xAjmUNNru31fZNb6lKYEWkRYggMX6BiKU2XtxBzBKAR0MZ/1znOimYeAk=
X-Gm-Gg: ASbGncusIoe53XwqG1JCZCmpQ2toIwau5yzsGytmbdRvtfqr+WdlgEYvntW3VA0jNVp
	znhv7IBCMVrz+8UxNjLivEnQ2eyMGV3bY1jic5kTKVSstiYLbTWG+lE7aiDjMknfs5z2E4wJ+81
	F9K3CiqMi8s+OBq/cy2Ov2eoY5iU4NrX0K/E/bRWNTh0hKzunM9nQST4hQC2SVlyzmug39FkU+U
	AYaw9phYmQIMwmtqtR5ykCUApFW4tQU836TCbaY60KvlRP0giv0uNuRIw==
X-Google-Smtp-Source: AGHT+IH/lMi82z0v/iMa3bnH3O48sOuTvGtLHugaIGP26xUYLLpIeMPo9osg0TDFc6RKyN8BchLK9A==
X-Received: by 2002:a05:6512:124f:b0:53d:de48:7409 with SMTP id 2adb3069b0e04-53df001cb8amr5926461e87.0.1733010929250;
        Sat, 30 Nov 2024 15:55:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Date: Sun, 01 Dec 2024 01:55:17 +0200
Message-Id: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOWlS2cC/x2MwQqDMBAFf0X23AUTFWx/RXoIyVMXNJGNLYL47
 wYvA3OYOSlDBZk+1UmKv2RJsYh5VeRnFyewhOJka9saWxsOurJPMcLvSRlL4PW34+DeNW/XdCj
 oqdSbYpTjOQ/f67oB3wr3/2kAAAA=
X-Change-ID: 20241201-drm-connector-eld-mutex-8a39a35e9a38
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h9SpCjrnoVeyG6yy+hC7dnaQqGomdEDru9YX9FtBpig=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6XsZ1/pqxgC30AKzvdNBVrv5HQb2dJZaZ5zn
 VEhrpDwtKOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7AAKCRCLPIo+Aiko
 1ew4CACbQcTx0V9Sgmz8qhhsUnlM0Vh+dbbDTDz41dhDdcEgbBBokvib8Go3fPRoR2hiD5m4p3q
 Inrqmtu6WxnuFTZ0QoZhHX0EdGBd/UJUWQcfS5pdXJ3Xg23dIDNSEqxBkJVEmRicpeJ9ZaUAQMi
 YdIJpl1FT2/ANTrI2tncuw5hhWL1lQ7u+U8y6VrDr5QZjFXAAeZ0Zu3y8lTuITAxcxTLjSfCapq
 SK73gIYvnestQ4yiI9RsX3EIyujQ6z18dGKF1awnRjx9cXrXrBMiBVD5XtL8+PtSrfWgAuHy9qW
 g8v2j0eW+fy5k2eNqU4JbP7IJfm7WWm2CTjtdsikNnIqWkIv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_155531_379822_A4170E6B 
X-CRM114-Status: GOOD (  12.43  )
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

The connector->eld is accessed by the .get_eld() callback. This access
can collide with the drm_edid_to_eld() updating the data at the same
time. Add drm_connector.eld_mutex to protect the data from concurrenct
access.

The individual drivers were just compile tested. I propose to merge the
drm_connector and bridge drivers through drm-misc, allowing other
maintainers either to ack merging through drm-misc or merging the
drm-misc into their tree and then picking up correcponding patch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (10):
      drm/connector: add mutex to protect ELD from concurrent access
      drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
      drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
      drm/amd/display: use eld_mutex to protect access to connector->eld
      drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
      drm/i915/audio: use eld_mutex to protect access to connector->eld
      drm/msm/dp: use eld_mutex to protect access to connector->eld
      drm/radeon: use eld_mutex to protect access to connector->eld
      drm/sti: hdmi: use eld_mutex to protect access to connector->eld
      drm/vc4: hdmi: use eld_mutex to protect access to connector->eld

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 drivers/gpu/drm/bridge/analogix/anx7625.c         | 2 ++
 drivers/gpu/drm/bridge/ite-it66121.c              | 2 ++
 drivers/gpu/drm/drm_connector.c                   | 1 +
 drivers/gpu/drm/drm_edid.c                        | 4 ++++
 drivers/gpu/drm/exynos/exynos_hdmi.c              | 2 ++
 drivers/gpu/drm/i915/display/intel_audio.c        | 3 +++
 drivers/gpu/drm/msm/dp/dp_audio.c                 | 2 ++
 drivers/gpu/drm/radeon/radeon_audio.c             | 2 ++
 drivers/gpu/drm/sti/sti_hdmi.c                    | 2 ++
 drivers/gpu/drm/vc4/vc4_hdmi.c                    | 4 ++--
 include/drm/drm_connector.h                       | 5 ++++-
 12 files changed, 28 insertions(+), 3 deletions(-)
---
base-commit: 44cff6c5b0b17a78bc0b30372bcd816cf6dd282a
change-id: 20241201-drm-connector-eld-mutex-8a39a35e9a38

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


