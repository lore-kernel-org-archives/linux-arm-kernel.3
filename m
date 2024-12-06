Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ED9E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 09:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGq6aED53P5HelbsA7MK6wW8IBVofd/BuTMfX8bnHpY=; b=VFgG5KSeLKPJgAJaM41cn2dhpG
	htrGDYaUhczLxsT0GAnsL4JiPZwcsL7YOIBrIOybVMo6zA1KWGpxXXaeqoTbip7DRrfridyJb6u9u
	Ai0TMnbbEOT4VN8VWxabN4wTW82Es5Qc0VizuJT7dzb3U1rrwAVVoC4HRkn+0pdwjJNiCzf8mBYyM
	WSruCB2zeffFvXWdxw5oy2sb7aJLCvo+XgfZk7yGs9uXWrp6c8XuoBL8Nd8xv+pVVpuebElX96ZQ5
	gfCNQpI4exEoAKOusEbgEXNeldikw+J4mZOwxi1dyzNQH/Jafy6aRLAtGVQ2scBol+eHusKG7SbLA
	1D91lJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUzj-000000019Ni-2xx3;
	Fri, 06 Dec 2024 09:51:31 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUry-000000017eS-1yeD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 09:43:31 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso22752441fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 01:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478208; x=1734083008; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGq6aED53P5HelbsA7MK6wW8IBVofd/BuTMfX8bnHpY=;
        b=zQalvKYA7ibmWk8VVbvTXqUSj2tzQSK53h4HvFjzzS5UrPmEEUmOv3Bz/N3P9D7B2X
         iT7soR565Fq7ye3kBISyDw4ErD7jfg+gVQtK5AQ+uaK3RiUTYFcJyMle5yP58gfRJdvl
         E2OWMH8tzUjKCc/vOgOcf5G6Q+UF09spzZ5Yu/JFMiv5JLNjxMFDd1g1Fi4S++8cKKTb
         MkqjK2OjiEWgIfwWvIfra1sYJ9279od4iV3CztZ7630/qCtHoppwb6eiW0b5BDYxGynQ
         5IFjJDm0UkxnEa4ffVbPBy0IiChV6psd/y36KI5C1/L9kh3OZ4bfhaflpgsskmprTik+
         4Snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478208; x=1734083008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGq6aED53P5HelbsA7MK6wW8IBVofd/BuTMfX8bnHpY=;
        b=Q1JXUKN+NoXzzCN/L99crlMRG62/NGyjUOLtE7yfdRS3UnKrndIythGJfdZ/IJ5icj
         NOqoPxL7sjtdiZB41HcOiuZA7SdrsQqI92POJPsCdqg2NBd1QNjqtE+0xxjq+j6BFizo
         d3sY4HKSL6Y4h6smcUBNVtQQD2jJ+lV9kCwCBMNFtXPAk8P+OQpRrJH6gcK0IY/Gy9sl
         DgdEWKYnZ7/4T9tN9TWn/GOAOZr8S4tMJsSRzxD8dUfc7KN3nPR6E/Ji5tvBy8DSKK7f
         PcaL2ku1HRjotuj4YKaaZDZ27lYqB0DRS4T+Xryw0FSgtZ3qq9zdSVGKiOMsbgNMkTEE
         0V1g==
X-Forwarded-Encrypted: i=1; AJvYcCX3v1Dq29CF7Z3Obe7xZQFR4W0JtHjrntzlW1KR0+Ce/jUU2AFQAwJdncjbW2CtBFbpSJWcBzezTqjoUoB4tJ5a@lists.infradead.org
X-Gm-Message-State: AOJu0YxA4aXOHW0OylQ5lusJ17HNUgIPtpeKWj8FWfGPCorxKPkstskV
	Ug5mnj1ko7cazipbYTasZ3i8WCbkTJpiMSImwn8EZM80wlVUNoHh6htNYG1h+wc=
X-Gm-Gg: ASbGncsplV1J8Wd0IQeXkK5Z8+zc2GZ5eOow+CrrlFI2HJ+NNqf4Emxw+kmRlpRGEjv
	p0392GQv3uL2vqqdA4I7SpwbQu0L82asJAp/kMtXm/GCpox1kOvfBWACNQOSS+hriRYNkLRlVj2
	EckIgSVPXTUf0L1vXH36jeEI2xB15YFouV+a+XMRcq1vXzeqg6rngo9OfAUXmYd3pmtO6q/xHgE
	9qUjt7LSM8F9YgCyEEdNPcDYxt68K86O1ukQLIGOA0y+iMXAqOEV7DSiw==
X-Google-Smtp-Source: AGHT+IE/NYxmjluRmONb1EoU7KbKKPH87buJ0IjBEcYtxmwcZQlKK0G0iiNZoTWvmIko49pJuOa6eQ==
X-Received: by 2002:a05:651c:b29:b0:2fb:5f9d:c284 with SMTP id 38308e7fff4ca-3002f8e7df4mr10594341fa.16.1733478208528;
        Fri, 06 Dec 2024 01:43:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:10 +0200
Subject: [PATCH v2 07/10] drm/msm/dp: use eld_mutex to protect access to
 connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-7-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=g8XDt4tMHXpR+O+C6P49zaXUZ1QAJx0+8PEn0RE7Eo4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscuHK4m+of5M0K58J1Ue7FnC+JgeJ7oM6NSu
 bFPedJdqXmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLgAKCRCLPIo+Aiko
 1bfrCACW5hMSxLBb5or6qGH5D5AVPGJIvY9BGjNY1WTyi2PUHO7TE/oo3Ggc7rv7l860G7eGzQ8
 uVT1bon1fazOdXW+lYbtHJWim9TYibboTYhb22pQ3YrpWEiuV1UbYdHBB8vzbzO9jXkq/bJmQ1m
 +E4FMSQ4cvduHdnEWi/8FNjp7zOIShlJYI1KIxungwjDjpEKEtea0kLBR1PRGwCG8/yZZUFfQxI
 QckeAW77aJDzAZbPOuHWb2f1rJKPg5flOLCaaqtxskOhiUml7r060zILPXNfrxMo4DMSMj+jYwz
 1HVsVa0f3CLU5a7ZBeGqVsa/7rnSuUMsfCkuJrb6r9MQM91w
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_014330_510911_3C185B39 
X-CRM114-Status: GOOD (  11.70  )
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
Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 74e01a5dd4195d5e0e04250663886f1116f25711..0fd5e0abaf07828157085bd680bfd3c7d32deb61 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -414,8 +414,10 @@ static int msm_dp_audio_get_eld(struct device *dev,
 		return -ENODEV;
 	}
 
+	mutex_lock(&msm_dp_display->connector->eld_mutex);
 	memcpy(buf, msm_dp_display->connector->eld,
 		min(sizeof(msm_dp_display->connector->eld), len));
+	mutex_unlock(&msm_dp_display->connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5


