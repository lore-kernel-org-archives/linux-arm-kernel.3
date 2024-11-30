Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B48D7361B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 23:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgyD7a8KnGJ66sjxEdDPFFI8o7yH9d7qAC7Fc+pHT8w=; b=c8gt4h6gIBBnpKuYVdYu0RGIlx
	4bGh4E9i6j+ZjTGq6DK0XU28foGANntXMemDkMvmdNYGKjB1onLwlvv0+w+n0G/bNc0EueTNuwL+3
	sEUjTMimMiDqkYrnP97TblbL6n4t+nHldQZTHaip6ZU1roNBQrjrwVxbVjiax954UgNQ9mS7MHPOf
	WFxuT9Ddp/jUQV2lXzXUbHDSCGFySfdX1vC4Gu8fS2JP2JywIfYvHsLg1V3fSCG6T0dnIXWdCiMWp
	jEwVL5cTkr0jkSSe2EU249H2UTM026IWU2dZVMwsErakvLhrsIwDhGjK+CDRIgGkidgFeviIGRnN1
	UXg3s+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXM8-00000002lie-04gL;
	Sat, 30 Nov 2024 23:58:32 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXJI-00000002kml-11z0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 23:55:37 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53dd57589c8so4272085e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 15:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010934; x=1733615734; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgyD7a8KnGJ66sjxEdDPFFI8o7yH9d7qAC7Fc+pHT8w=;
        b=mSUeRYBoSSfkO7NtBl49rHkPUJi/Ycyne7zn9AqPdj8WqjghgvlTakGpOhiJlqTBQF
         52/9dt7k3KfIKIR7oMwMdTboHJ58kv34GsRP/b5vzRyvFRsTHASAXEco8d3of+39462r
         ZVAv47Tq52Raismi9BB3/sJacw5SOPzjTBhXr/kdvKs05RSv/5BmxuNUMPZbZzK2cBNN
         vY2oeSUJENmQEcW7CIAhiDb0eIh69hvLpsImXcLpoKnXRR+7Yd6Z8wC4fessBjyrtLj/
         LFoq4onddJrcQGbZd0pBtjOv1O9qwXpCD3Gn5BP/Q4xJhp+Yh5zivqqvWwWKvXiCc9DM
         /oPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010934; x=1733615734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgyD7a8KnGJ66sjxEdDPFFI8o7yH9d7qAC7Fc+pHT8w=;
        b=h/1Ehg+sirPUZEV9ZDQXdiplreNu+632gXFsp/R50P23i5t+z/19NGHPnBy8VMsXHj
         rannZdbzGecQwldg6qGPrV5PzLK8Um92BhtiFQ8rDbjqnX+S78ZDikpphjBLt8Pb9v50
         +uwrn3+K4T0zX1D8Wzu/XVIu0ao1jTdmy1lUpzWREth9M1g1yG3Wx5pRjfp22yRIhCjm
         qFXyiosgEDazdkYu3Ys/amy2xiayOTZwi9o7UFjncEgbvphA/7lc6MKjNxNb2T1+zTjA
         Slj+hiXyDo/0fRaZ/GGQ0PkFxeWwCVt6UmCA8RDsGz7MPezO9Z2lXfCM7nD3ONh/KUl/
         Q2qg==
X-Forwarded-Encrypted: i=1; AJvYcCUfVUUuxqy4Yd1MauRt2fieLUovOLPjZ7/Qo3v7K+CSsRllzJmSMJfyuKxeFk+YPNmeJJ/6HT5L6xjkNcsqlAuP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4oKz60PiHZbZO5eU7Jrhs1/AxtyrJ7/4Ts7yJG5/WQsBCpEKD
	jvvHOnBDxmDr7UeKhBbrn2LtcFVraKyg3ZVCumEGmC5ZIlhNVV/Iezq/J0fhppU=
X-Gm-Gg: ASbGncvMJLvnkfHo/Bn0C/hLVDT2JPJCclNxljSbEuk21IhYT+cV+4rZGEQFevnk3MV
	2KqWxMRVKoTiFWBX4+cBG8W8jDxZLysc8RQU49jSYicGj8Zp+XaiZPfdS5S6eOILT7RDU91FI9R
	lQhsXU1QXWcXbp2PJTxQAZ9zai9DkxJKGcZrXZ3KDrGtW9fpl76N8gEa6dl1dR8KCyBu2B4CwSD
	BCK4/R518gzU26sqNdpWllj1uwzAJNbVfq3JEv0t05eXbAdIpn/sbBtNA==
X-Google-Smtp-Source: AGHT+IFfhVER9h/x9rK2y02O8ScgxqBwF/5PNitw9Xk11JpSQfAwSB2naROC3kIrCP+2Ei8nyJ5Kkg==
X-Received: by 2002:a05:6512:3f7:b0:53d:f583:81df with SMTP id 2adb3069b0e04-53df5838209mr3265430e87.28.1733010934296;
        Sat, 30 Nov 2024 15:55:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:19 +0200
Subject: [PATCH 02/10] drm/bridge: anx7625: use eld_mutex to protect access
 to connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-2-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jvlD3JuIycYlsUfGVML+3UeoaevWmHaaQytOdr+mxNU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xt/7pykgJj245vtdzYWdYBTAMnwoeiEVz0V
 cHOwIg5ZZOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1Uh9CACs2EKgY3agKG4T+t0CkgNiBGM+05Aomb7V037y3ZsVMyGBgsnshcMdjjksyQHwWAR9UO4
 phcMcAP56G/wnh2roZkGyvmlMsXgcYwC/JcmmAmqRpZ3BOU41lxrAgavIrurye9kHFCYMSeIXMC
 ZL/VeuwljGdXtKvbiNuFpq85TOh36Cs5evtJpDjaTBBuRCU3eJzaHjovDNB31z0KSlAG44ZpfKW
 /bdsJLcjoLwHRdTtVG4mRghPrGrLzz35ix7Igay76WHZuOI3nL19Gs+e3V6XTkA8m2kprqqo7x9
 ff5KN4kX/nqX3Z+YcrmBBsD2/q8MSlB3PQI3Q2xKw0EPGz1c
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_155536_285837_2622D50C 
X-CRM114-Status: GOOD (  12.23  )
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
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a2675b121fe44b96945f34215fd900f35bfde43a..c036bbc92ba96ec4663c55cca091cd5da9f6d271 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2002,8 +2002,10 @@ static int anx7625_audio_get_eld(struct device *dev, void *data,
 		memset(buf, 0, len);
 	} else {
 		dev_dbg(dev, "audio copy eld\n");
+		mutex_lock(&ctx->connector->eld_mutex);
 		memcpy(buf, ctx->connector->eld,
 		       min(sizeof(ctx->connector->eld), len));
+		mutex_unlock(&ctx->connector->eld_mutex);
 	}
 
 	return 0;

-- 
2.39.5


