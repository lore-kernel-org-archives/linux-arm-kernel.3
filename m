Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC4FD7361B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 23:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsbxRwNfx7fnCx+o56uBYxIXkBxgdk/p+7MwRahv2so=; b=xMG9MoEToHAWVWqsK8VfrEbuF0
	bYpNkT30hmtwPtMOL4hy21VUh5zhgZk7Sj5Ex7Zjsawfh3Ynrl8Sf8FIuiGXGPoYpcV6cp5XPw9EW
	mUDKYJDtTPBeo18C/kx+k8Y9qPC56QyhXiJliVhzx69IMVJXsMLSUJG1drj3SdvRq0UHG2I/5dS85
	+TWeEfFDvyi244t133SW8UhP4aXJDJOv1IK9e8Vmtbj//ITrC4iih3J232g2/3rEeUmh7Wq9f1iq5
	xomB349rXz+aDTwImoXlPjIqclSTJxxBz5sUkAV+8o5I7tPa3sKrRuhotixdCfjZ9Tg1p8Yum+8Pa
	38aFG5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXN5-00000002loK-33XJ;
	Sat, 30 Nov 2024 23:59:31 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXJK-00000002koP-3m5L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 23:55:40 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ffa12ad18cso32370201fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 15:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010937; x=1733615737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsbxRwNfx7fnCx+o56uBYxIXkBxgdk/p+7MwRahv2so=;
        b=JQCkjjSWi64I5c2LYS9KmM1n+PfIPinJkgLUrxbyuPAmUQqQOo0RJnT1r6k080lvB/
         fTu2boDtVDAZngUS+5t3/HzO92SQ2u0i3WhigEFLMbUP24tQVa4a1IGZYLK95m4IRxEW
         v8UUOuCVzfoRiXo1tQU5C5THxcyxTIpj2R3cPwwgo3ej+vgeiz6u+HhRFHPoVsaFbXEf
         Tu27oZ87aoCA4J5PyyAOn2WkpXKcCjvRRAmvYULuyk8PObslYqvhba1ty3iriTQBKVMu
         L85wc1rpfTJkcOmdDdHQyfIBsbi+CiLy5h1pgxZqTD/Jt3NXDdS1TArO7/nODTHTfpWH
         dM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010937; x=1733615737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsbxRwNfx7fnCx+o56uBYxIXkBxgdk/p+7MwRahv2so=;
        b=IzZ+c00A8BVhL0PDE6sC6v0c2g5WaccoCy9/ZtLa9PKtwioLvNedO1uFk38xLwC30m
         ngd2RKJ7BQ8jK3sN0wx2uZ67J0eTLFMEPS0e6yG8ktf94JAdi5FBPps95wBpnEeYr7le
         FQgVn7lPP6uYBTVbrQAAFI90Cb2lWTh5G0bIwyz0uSIqY05ZfynoJ3pqpXZH+ZrRuwFU
         rqBTP08lqeYrCL5ladJi2fb9nv8aoMapxhirZgBzlD7cysQfpUcn2twcFtHj1YYVxmbn
         hxtiv4f+tFlitGAo6OV9gyobmex6aSo3UYPXeqBaA9qHxet6hMUw74d1CqsuE6oPXqLR
         7SPg==
X-Forwarded-Encrypted: i=1; AJvYcCWenR4RmJVuWHGA9rTcFt0+t7vc9R+aEJUnM5vtAW9Fzhlz0BM8druwfnPoBWTYGGldDPXJoKD3WL4LrpMhc2Ej@lists.infradead.org
X-Gm-Message-State: AOJu0YzUQ9xeDcqfOPfk6Mfwwye4UBOnfK3dxLQN3/WgawoVuaTPEqqQ
	DeojqjfxAecRRpDZ3LvWs1eGJ9JQpNzTGjs85RXX9wOI3MJx1unAj3baMq8ULOM=
X-Gm-Gg: ASbGnctjWILRlICwObdNpaK+Of8zYFkUTpCavPHS1dnPlGHRTfiKLThbRThV2Z6YFe/
	vjoWfPwNf1XP9pBCzUixhk6QBNRKWnxLkA5ENxht95il3kCFWvDJSBdmF/hywR0bDrRB/NCD+F+
	gk3lfHkAGJgQm3oaIpvekZ4aZ+PgTNyCggpuQe7lAjEwFbExJeIH+u7AjYbZzsw5QbbsNkeDLSm
	HtYyq4dvtb5O/YjYdFj/FKf91WAiiMZRhtT23UorHSn7DgGsR1d+XEp4g==
X-Google-Smtp-Source: AGHT+IGcKx3qxr+rKjFg6uN+w/t1xLv8z34zeudztpmb02c9r0uba4ZBSNTSBCZfWNmdHrXgT/XSFQ==
X-Received: by 2002:a05:6512:3e2a:b0:53d:d431:7f3a with SMTP id 2adb3069b0e04-53df0108f71mr9006077e87.44.1733010936909;
        Sat, 30 Nov 2024 15:55:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:20 +0200
Subject: [PATCH 03/10] drm/bridge: ite-it66121: use eld_mutex to protect
 access to connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-3-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ze1FOtye6ODMMZl22hb9QRrfAdzUkHN5Ex5hTjwt+GA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xt8KExBULQDlnc0kG9cX6l7/Qf0gOZJfErh
 qwvys0sxCOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1X53B/9fdxZ832w1hRpbTcoyQFQHmA0ikcvv4VCzfB6ZaFGrG9T+SoyXM0lcIGKSaZczbYgwyYG
 VSyLd0BAxUhrC8MwHfMgp8Y4wCleisRxlVFA1vUdBWDg5Ra1tMCGv5yeTI8xG89vZvV7H1L56LH
 NJTuXCDHoAtdxiJGvpFCcxy/iyg5+gZ/1OqAZ21gCgzFdy4w/2V+gH4ahWa0JjEUHnsqPrt4sw9
 GAq6r6bDqlUd/3uTwG/u/zV5dSLxpZwsGi5tupF0T0d+UKSbAj73ZOj0Mc5cIt2otyZ3ATuZeIK
 E5n0SMo3O3r0wqRpMmCiTAGk3no1OeU6uM+duf39jYehwa8p
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_155538_956983_CAF70C09 
X-CRM114-Status: GOOD (  12.10  )
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


