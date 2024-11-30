Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDB4D73619
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 00:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IU6Gl7Dl4dmhuEZdQnvRmTEGRcXAkcJN0vDa70RMZrc=; b=WmNITNNnSW0CGcoGV1KbXVN0yA
	TFk+BW8Cr8Ws4Pt43gxLV0ZOhMDTxiK7PKSrH790nwHeOtk76hfJIdElNkDN1Z7+7bP5Mpr2If5rD
	pNYWAjIxWnpvQrLd1py/Sjgb1i9t5073Z6VMOqVLSUvJaecxdQc/tRrEl6NDTztFyza4LEO9n5A6T
	mVLYcMe9RIM8UFbU0ES/o/AOEcb0eCw38AANd6jd5Z0jKbatPXtGv3pfYh3mszqiNwqmh/IGdWkgA
	hVyWg4nm09fHOU+DTlGDu804BmUS+Yeb1/iGe2/DtxPyYt7bAM7oTYKx085HFv4vvnBcpoftkKLqv
	e+2fu4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXSn-00000002mUg-1Kl6;
	Sun, 01 Dec 2024 00:05:25 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXJa-00000002l3Z-0cwk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 23:55:55 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53dde5262fdso3328435e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 15:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010952; x=1733615752; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IU6Gl7Dl4dmhuEZdQnvRmTEGRcXAkcJN0vDa70RMZrc=;
        b=r8ID9cb8CdqzPoCRL80ZKkOsPA3bRPcNDMVZ4sLGg9C/r9XSt7lfxp3MVJ7Iuaojvx
         HtwZbL/fdKQfJB8aSPjUqcSvz4fDgGlLQAwT0Lya5an9/khkKZuHs91wB5900W4tT4PS
         x/7NwaMuAwegslWiQW8F5ixtHasuIcI8kyMj7BnpyvdCuXMnS0uTkGieS2dji37PIyzh
         KU63tRbEmMRVzAYw011ffudlKOOOwJt6fmEKcoxEjsFnh7ZkNAIKYE00kuyiUqaTMClG
         sp0AuczHdJ8n+LWhToNaElscaeUQhUSMzJBx1oyxkzVgvvgsDQrecHVduy4ZcsTvE6Lz
         xjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010952; x=1733615752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IU6Gl7Dl4dmhuEZdQnvRmTEGRcXAkcJN0vDa70RMZrc=;
        b=DhamPWP7eCqCKrzCS3iQS+gDWXg3dVDyGWHuaFreAFZ8p+yQlvr1ZSoUSyC6zEAHHK
         Gije2MpXN4NVSw44RsId3SKbxWDE2I5ZD7Nem6t1AeJjw9KPUg3EWsZ/jtURvGH86ENO
         lCo39N9VsxwFWTLaqrbEcHFi3TiW5xI/VBb0RJtko3HjTr9V5w7C8HPKCZS8RfZvB4dC
         Aa16OAwcPrccBeqHjicbHA93hIAa/Omvut9g0xFiWPOnBDnuEZk63lgDA/maZWy4E8aV
         dyKGY/6/LhqylYgoH1702fmuf3Bz1EjGxUpBb4dcKJOd8lD1esXzTRwhw6bOhKsqeVSO
         UPKA==
X-Forwarded-Encrypted: i=1; AJvYcCXoRddaDPQMLKFp9XHXTqlKPJN0Pb6umxl2gb28mt9VCngujzqSaipP3JeirEZMk3mXKnMhb3ZJATmqKAI3UCSh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2kZ1DLq0CxwJIluicn3bymf4MipQyJf069t6TkBCyI4O+yVra
	/Ay6ZPj+jFmOOBhyR7UFvi9Pn6kkwCDNBe3kPE3KeI4d1NfEfAQGlcUXZM3cgpM=
X-Gm-Gg: ASbGncvYay8ZpIdziwQsvCnSHmfKE53AzaVlvcCwh/Cinv6zfA5862Mdz2mv7HDLBkF
	/yPMxLQxEq6yYzAseUyektmAjC4Ak6xiMj+XezKPq6zJ8oLtOGyznL1BXFOR02i5+/pDqXDaDOi
	zB/TW8f4t+1zGB+Et/IkZispY05pagYc282T7YnXWmOLDw865+8zYImvaBkn9J8mDejKrMlGOiP
	RWdpfS1twqsNewE//Edc2alN0w5a9eZrClfxmpLHcC5DHszA39ifzImbA==
X-Google-Smtp-Source: AGHT+IF0apDYRdHR7KZD93hjbqsmabdU0vO1rz/bbiVNjvW03bvvtexlWq6c4CLLSgjKkBK26w1wwQ==
X-Received: by 2002:a05:6512:2210:b0:53d:ed6c:26ea with SMTP id 2adb3069b0e04-53df00c79a2mr8823937e87.8.1733010952229;
        Sat, 30 Nov 2024 15:55:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:26 +0200
Subject: [PATCH 09/10] drm/sti: hdmi: use eld_mutex to protect access to
 connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-9-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=d3Sl+FXytgREFItAwcczh3Q1vneGssZw9wmeXf8zqcs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xuuw73RrqNIAMj0Vd/VMNJk3KOMIlLIxeOc
 0MnV4M5vNuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7gAKCRCLPIo+Aiko
 1Qv/B/4/5rLxZCjkqK+Zdlhp2+yqWP4ISG1uXt/zd2hXrjtxgOkih9U6WKdNa6Xoz/QuAEp+lKl
 oVznmDwzY+sTM1b4PwOdG5DBpKIgyXf5k7n1y/cyABsH0BdP5Tzn74sUaSZBQgnUGSYhGgKdDc/
 YAAgPkbRyOmTtniJolkAmqMYl0NihkgeU26RZ+pfNtFLhks7GHDURf3XLOq7x45EuwGaROru3jt
 SmIhwz9wcEA5r2kDJq5DDr04T/9Y0XgMWhQKi1kbsG7wK9OJlgiYKe7dSOEQ94g/A4Aet9kG185
 zd4yXm2idTSpwhIe2gyR7gCJgHyrA/FNOXXul+pcZq+liRGD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_155554_215774_059B4E34 
X-CRM114-Status: GOOD (  11.76  )
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


