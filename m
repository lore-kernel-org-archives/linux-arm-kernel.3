Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D82E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkigUKob5Mc9L+QSG9Cb+AQa6odUVvq9Ya0HTSeW6cY=; b=qkKEiK4GlHL4/IgeS2F1GsNEhI
	esAnEAF6isBQjm7f1ypRgGJt51fDQcerP8s8UF17JLH48NbBtfShwQnLukqeFxMfv6O3aLj/iU4Ue
	tM1n5FATkN2xyugBy+RtGCvlllmRZkiTMgXuF5BZPrdpTvY3BEWYj38aYk0d5ybxDvvLrThpR9X/J
	duWCDAO0Jfk36jwB3AfitoE/mWeslG5B2QUZLzUVJ3IgbwCtQhF9N+mwYHlUXGzbQEZugrbrjZMHH
	9CqIzGI5le5KsCWpty8qaEeV+1kk8p0ciGOmD983QNdkrSD3HOh2dnzT5ri41mK/VDVs1PhIZqlER
	483saQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJV1j-000000019hT-2bbW;
	Fri, 06 Dec 2024 09:53:35 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUs2-000000017ii-1CuW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 09:43:35 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso19396111fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 01:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478213; x=1734083013; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkigUKob5Mc9L+QSG9Cb+AQa6odUVvq9Ya0HTSeW6cY=;
        b=uaF3iskQr5c6LpY4d4n3W3hhHFqbTw+GjAsAbXGE2ptGHfmRG9LPDUgeFz4XXgKP29
         ex7VfB1QZyW/6GJ2DbxZouTgQN1QhoZlfCVTPB0zSofsiuGj+w9YpqXKuXp85s6CsgQ8
         EYdauKoe0ZNl9c3fKsdDhD1i8s/Dxxv1Kcg+yYCUiF4tLFi5osm9hePhm+J+oK7Vy196
         crT3Bg2EOU3C3Q2//7E1yorzf0XNY3XdfuicNptpoG5yOIIMEwR2khquS6pASOsphnlP
         00mPRGu0dbqvajRakc6ArsuOc8Pauu/yje7qnb/VDRF0LXravHn6UFbBU91d10vS41nk
         H+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478213; x=1734083013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkigUKob5Mc9L+QSG9Cb+AQa6odUVvq9Ya0HTSeW6cY=;
        b=RPgKvP4YVeoCkq/BUx8TXYHDR65XLNe2Vlo9S89954I6vpBwCyEiRFpZ06DZrF9Rli
         SBuCjKK3xHzTk+TGFvKvYt6Jtu98e8HvkV4j+67scTkWY5FKBdrerx49wfTB9a2QjuG5
         5HS9c3O09kkC+GPVo7/wKwT+GOz8PYT1F9N/fBt9ggWzl7U6WgFM1lSRczHvvagTbxq+
         6WNxYLsE+bYWrv77iG+kWn2aMR0PxacWd2t0+exK4rfQXNxPDOZauJrRwwNb+SFn01Q+
         kDZXb+zxu0cMdqgzO0VjuflO43kQunOuEIJQDf2w5AI3JFrVSyGh4UqJj5eVp8mKmCwf
         sGpg==
X-Forwarded-Encrypted: i=1; AJvYcCWr60Dk6RHK8v/QvC6pRpBT9poTBFma8tx5Zs4LOkjFQaELF8t/EqUijbMkHTpfcLnqNmiWEb5KhI9gGmEBGcKA@lists.infradead.org
X-Gm-Message-State: AOJu0YxTb9bgV62uSmTDSDC/ckbuz1/k4ARgnLJT7oSVulyAan4yUdz6
	f4tI6ceb6wqcPCvI9uZaQoCeEkwVJZl6y3HnyES4BUwVoU2hUwUh+jDmEmNfBe0=
X-Gm-Gg: ASbGncsdIrU1OoYjF1iWbA7aH28CNE146YtITuiVi6WX7ZTFqEx03u/NslL/5tUnHMX
	rxHXvWNhxqkFfcfOTgrZ35TRhV8+FgxMyjBgDfygFaaCACLWRV/7u2VbnkJic3epNkOxPekjLfm
	hsvYWwJpc/PSzoM+N5bb9J9US+Fud0YHq3ZXP0IShhS36pDw5z4sjDBFoeHFVDzWE8Bx7R3DobM
	8sKGBRGnp/Vzit5/fkyCWJUf3VjL23g7vO39Q8GjGa0pXor3ohx4taapQ==
X-Google-Smtp-Source: AGHT+IFnWgDd0LQiOOyqxao9HQ2SRRt2EDypVuazWQgG9g3xYWmvYLAFADof0/JzzA41KcgjmV4COA==
X-Received: by 2002:a2e:bc12:0:b0:2ff:d81f:2d34 with SMTP id 38308e7fff4ca-3002f89e73amr8312691fa.8.1733478212768;
        Fri, 06 Dec 2024 01:43:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:12 +0200
Subject: [PATCH v2 09/10] drm/sti: hdmi: use eld_mutex to protect access to
 connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-9-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=T6JPeyhrynxKGaIZwOdTxaj7xNpnpZ0LTNopG/6n9Zs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rQcX25kP/6099+Y3hx23Dzne8aLO9XzJFZb9z4/HOYm
 bH+tPU/OxmNWRgYuRhkxRRZfApapsZsSg77sGNqPcwgViaQKQxcnAIwkYJV7P8sEtsYGnS1fHZY
 N6v4y56cu637YlyXwKadV03zMlc4ttxq3Crwz6qYV7CtsrDo9MHlXvvuuuT7v7hov3+iOGuw84P
 eOuPsuE9iV7LLFxUsPR5gYsiefjVFO1nyt2usyI6ibhPhj7UMf39E749suNgw22P/LxFtziC+Tn
 WRtWELrrEc5tq9toNNREI5uXeBpOlzlubMi7bXX1sfPDcrdsf/x9liHJvac29p84ZL8z2dq1QgM
 7WlwLDhy4Qy7cfXWq0FX/w0s3kRpWmncvTdkXlJk4OKo1obHuSqT/3/T0mjdGMFO+vbmWI5eW1f
 jWc/nph+IGb3ku4TXWv7Lms/8ba/PcPz0OyqzlDRlRoPAQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_014334_327153_ED200D8F 
X-CRM114-Status: GOOD (  11.83  )
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
Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 847470f747c0efad61c2ebdc3fb3746a7a13a863..3c8f3532c79723e7b1a720c855c90e40584cc6ca 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1225,7 +1225,9 @@ static int hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf, size
 	struct drm_connector *connector = hdmi->drm_connector;
 
 	DRM_DEBUG_DRIVER("\n");
+	mutex_lock(&connector->eld_mutex);
 	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	mutex_unlock(&connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5


