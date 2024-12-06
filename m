Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405CAE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wh7X6NiXjO0ZK0icbu5RRSIlyMlU/s3VBkgppSRGnTc=; b=hDU6308YMQRsK8Lp7OrgDL8p2L
	KCBKhTaVt80KesOxHITgOCjTo4c55NAPFYlkPmFX6zX6fEWTC3UOU/+0ruLn/UmrGPiNfms561c7n
	TqWVh27HtIC8A0Beu6ufKvzBcBNmFAjuqCFaMr/KllTaXwJ42Z2JsGamL8sjnlp2q48Ev8aIWlW7K
	sUxZEZWdOoRo0FxNUKQWvznp4PNj2tkBhadbzFrKM7gel+WzJ8hxhknEjnu5k7dLWELo8aDas+WC3
	4eIWOKpLrDNOtfb2uCeg+wN4t313KNhOWSa4M/yym+EteOBWO+12UIsv53u8oIKeDC6e89vh/Z4cD
	ldhY29sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUvl-000000018dZ-3ReH;
	Fri, 06 Dec 2024 09:47:25 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUrp-000000017X0-34AA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 09:43:22 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30037784fceso2190851fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 01:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478200; x=1734083000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wh7X6NiXjO0ZK0icbu5RRSIlyMlU/s3VBkgppSRGnTc=;
        b=g/kPGEwbRmvoyHIzU0z62li8f5CEikIw/pHewRoUWEkddbtstbMZLIKLea8acmP/oo
         Aaiu3Ug7B8kitP5sN6olURdTPLVe1e/R6G+CS8flGMdlBXGh6o0eAOfEiOwfk6t4Gbd3
         Yszis4uwMLHOjozGXpSRduqHgMLErD47mNIcAY2qJ75Aj8dUntQLqHFqoTuUxcwkVfr0
         eaVXxYNP0fdYGHLyecxxy2reGKI8TbmmzteTWXdY5LLgVXxJ+AxyrSRDIXQQUv+fSJjU
         05MuX6so9gHokBlbGnDa5+sHnHs7x9nn4gnbFnHcy+Q3xb7R0RqIt7/UMgOpWtI1Vn27
         ohVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478200; x=1734083000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wh7X6NiXjO0ZK0icbu5RRSIlyMlU/s3VBkgppSRGnTc=;
        b=wWCGiMYIsqh/Wbn6H9l+kXcjyj+sp+5ApbbU/NVpVUQhv8PYxZr1rtYaQW6GxuIVie
         ipwlU0G0PKdM/PrDrf/WNXA2wjyvVS98lmnp1wmyI4Cc8hS8FoWqaaZPVooS1jEUb8tm
         eACwnl2ugwH0bSb84VHXOeLPfzSVqldyIEGxGLNzHTILQ3CEU5FktmewT56ksBWBbceX
         T8Cwm7tFmT6/BFdJXfK18CyvYmJbcTMNiiilD/sYZ5ifgOPAod4NVdMm8Km+NbGnUS6h
         ncGP+HxI386SEM78P98yFTQ2o+hrQlYTkbSTHesaZtY6MDM8zU3y6gdbh5IJYPI4dx5H
         F46A==
X-Forwarded-Encrypted: i=1; AJvYcCVEY7m9UbmRV6j4Xa4PJncfF2M3JjOk1Gz6+bqw6u9C1NwAfbYdtTnA1pCeb0vFwQFyawuN0vo8WVGGNVGVuiU4@lists.infradead.org
X-Gm-Message-State: AOJu0YxP+npQwW0DsO5GnsVBsreA36LD4YX57/U63+PuH1uHb8/jV1/1
	2wcfSSdT3LL/xNYXCdz8xEAkoZTGSCnHvSKS646P6uL/bdY/2Xe2IpAIzUv2E9c=
X-Gm-Gg: ASbGncv4qL1XZoiklry0B/OLbJ6eeXgL1jfiV2tYUF+wqdQnex0+BQFMWi8gwS267lN
	bASaK8FWq/ACjVMgTbFiAxpaoieEfRkl8d9wngpp7ZqyrenkKQJp0bKDdUqDuzCR/OcF6tFkpri
	tDxlup08cW8YRPPzrjNst+Wzmx+W+no0Tq4YWUf1t9ddYZTw5nMzi1g7dsZT0b5iMkKyda/xdqj
	E4So3s8uP/6I9RGFgLPFms20COurpagPCTqMSUgR8mGYUBzMlavu/90Eg==
X-Google-Smtp-Source: AGHT+IFBxT03pxchsuAow8zXPe44X5vXMeN6+pzw5XgO7yRZwFTl4DSSqXqmQN/nIOwdAf9XNhMk0g==
X-Received: by 2002:a2e:a90f:0:b0:2fa:cc86:f217 with SMTP id 38308e7fff4ca-3002fcc6314mr10909661fa.35.1733478199996;
        Fri, 06 Dec 2024 01:43:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:06 +0200
Subject: [PATCH v2 03/10] drm/bridge: ite-it66121: use eld_mutex to protect
 access to connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-3-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=S2LNy/QG/Pvu7jaLQRzV8x9aVeJiuTJJixaJAknwzOI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rQcT0D+fWrdf7eTuO7miErYRRq/uGdQ1bilxVd2j16Z
 z/vrJ/SyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJpAtzMKxmXrAmIf3sx79J
 n5x5p8lbc0yOj9hTUFTN17jvemrJ5y/aGWJsN90qs3j2HCpJO3d947HLoiufHO66EK487WcPu11
 nm12ex98Nfkt75Zb+CJdfGT4lNHqmtrDVbxVb710nCjUmbrr9djMbP9vtiRfb/tVodHA/9zbjTp
 F0UW+v3VO2sZRl3zl7tlRnDkUX0/ud0U8Cn1rduKSQ9zDX7POhM+sniP9cXR1c0TOtPPZAG7NQc
 23p9xmHks64efKmbr0dkTlrP/cz+ZmZz6Y5SZ2ZxRdyk8vljuq/sP1L23tFZb+4PNSt8KvLEfbi
 rq6MWdlq8X/xgh4O6wU1LBPiahwNfFNvHJtbsfeP697ZAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_014321_773217_8ED941C6 
X-CRM114-Status: GOOD (  11.61  )
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
 drivers/gpu/drm/bridge/ite-it66121.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 35ae3f0e8f51f768229e055a086b53a419ffcd9f..940083e5d2ddbfc56f14e2bdc6ddd0b9dd50b1f8 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1450,8 +1450,10 @@ static int it66121_audio_get_eld(struct device *dev, void *data,
 		dev_dbg(dev, "No connector present, passing empty EDID data");
 		memset(buf, 0, len);
 	} else {
+		mutex_lock(&ctx->connector->eld_mutex);
 		memcpy(buf, ctx->connector->eld,
 		       min(sizeof(ctx->connector->eld), len));
+		mutex_unlock(&ctx->connector->eld_mutex);
 	}
 	mutex_unlock(&ctx->lock);
 

-- 
2.39.5


