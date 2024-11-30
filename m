Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6625D735E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 02:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=; b=deZjkiQB6XxWI0U5OTmJTg9YLt
	AI81XK3T/b7discEZ/ZTgZzuVNZqWaJnRXpiE8q3kbRq/7HCgifJKpIhQEIt40LBxzW6YFG+65MQa
	OexfeDCmoaJHE6bjt8q95IgydUe7S7fou7l0q325WFCVhGYQYP0K+gcQK7NvAlypoCHECqzAs0c/4
	10XjbNoZpSJFfRp1uZ6gZJ+b5reNLSwwT6c+iD2DRYz4k6w05u88zYNsZtaBWqaP+VlZrAwddJjeK
	Dig44APqi5+PcobyAhMxt31+1CD211IpJISiY3abcj1zYKmemPA4i9ShknBReQX/dy6R/lFlub5We
	7VAY+AYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCoY-00000001I2d-2wp4;
	Sat, 30 Nov 2024 02:02:30 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCfL-00000001GYl-14NV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 01:53:00 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53de771c5ebso2831951e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 17:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931578; x=1733536378; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
        b=CsBlJiNpH6T2HCmJdJWImxCJiHChHw4pnplGYw0sxfhmM5HdGk0aXNodUBBsgBIZZR
         pZ67Uoj9WFhnDxJ6GzrZ5YSLDXUWPt3yiDvzsUS9Jc5sz1zJdLB5VSKkv+k9jt86WQ6w
         Ws3gfnHTDf3iczVGB4vcKbWCgLvCuLZNsxQcWtDkvfNX4kaudCGB7WsrUyFP4NOeNORC
         qczy8DHmCAlxdgeWtZM013pn0YS5sDqSvhb9cbUaQQy8nuT2Hv+YJGSFr7bHkylif1dg
         fCmLlXc+nHjk00UUOxtTjnr/ZoDxsjJzSx/syKCoNvSS406jxwN/eZEch1rALRXch8lr
         h8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931578; x=1733536378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
        b=ES1ZakwDg/A2svpzixBpC/rQgRFV05O+xwkf2JR/M190F5tcbiPXfcbZOBPlOPH0fY
         Q+z2KLR6HeDU/az6T6+GyL/4hZ0uG4y9vJvdBHvDQW/aLYZQhA+MRdrRDBvznn+oTlUv
         q4eybI18tWbjwB535hMMyVjc0yN7TBnoBrT0Q69JUlyVgFq/O39nXVVYHRIziBQMcNLq
         VOKViXHpYENdmb/9uCQbxMpEIby6XwobtVLN7fBiF5j9j1+XX/PfZYYo8E+n11fjlF6K
         isuI6kEJCz4hM6kK/1p4mA0tlIt1VZj1B01yXCeUdW5O8ez7pOohIBI53dS/qYvwrQ66
         HrMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj/C6VH/JUG9x9p5KTitr050hc/q6hB43oK77zctZx1mAS9xkskv0JaHj6LLcxtyH5KAL6WsrY8DipBGKSgHol@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/RwN4u/Y5wZWIAXg8bIkbh6oGXPYLYoChnd0b0BieloSAkGpq
	qbA6bUwsa5KK7XYqC97MyN3N0q/qlND9YEhUNyEYOvxTY8CCP/UjmkVcR43FXt4=
X-Gm-Gg: ASbGncsKe7ENRYRD/lqf5TT1J3FoswNENwAf7rz1ctBUinQpSNXIUFxb3rxKpU1pCTT
	whUTraejOganx9xWLX0N2tenPxFgMybrdnkXXDZRsEJz56gsyUBA8Dq0mIW++2fJYUKm0YbITSZ
	JCdvsyGYaR4gX3VewT9wjjyrp3md6gmiQuAvF6rRRfoziSaCuVDF3YP2UkUah2cnY3Qjvg+uEWJ
	zXLZxS4vtk4punRhPOC1JROYAopJUI0mv/VcsiP/lL54t7UmlK2b3oGGQ==
X-Google-Smtp-Source: AGHT+IEPMkwzovF1BGtYWQPhSNDkhj65yoNCvxf3xV+YxR9n/u9tv7nbpK4B1sxwKYxaX0pKkPUYkw==
X-Received: by 2002:a05:6512:3c81:b0:53d:ea1d:50fc with SMTP id 2adb3069b0e04-53df0111f03mr8755501e87.48.1732931577781;
        Fri, 29 Nov 2024 17:52:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:34 +0200
Subject: [PATCH v5 09/10] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-9-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UjNMLqX51SwfyB+kbUbjnJt95fAbmRoKvLYOPQ8ek9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/hP4NTjv4z5OlKc/siHNPmPX53A9tMpMizW
 QagCkkZEseJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4QAKCRCLPIo+Aiko
 1YEYCACSjhD/Ij07xD1HSZ7Kb4z+Son1xvlSmJAJ4SpssXNb9iPUFIVI8goXplbGswSwyMT7gN/
 TJA4uoW5pm1VZfjXG6tfbVQkLp1egYiDvrum1DeygQ92wEt56uRPyVIx4IdIfPtB4T4NeaaxRHz
 LQnkHZDgA5FLhdyenT4uGiwtnYN42jAeIQOKN9kR+a3UWYD+yYdlR7SqZ/7LE57ljVXynJbKs6g
 U1MS/hQbvYoXlzbGG88vk9XYuwEsCee0SN0HMVpBvPgf+iAWlBzry2fAO18n4a3PcxUb5yoO8pZ
 BJV4wpwjoTw7LieiIOIG62SIWjAAknBD03dVAhxa/2O9Jx3N
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_175259_301997_ED70D344 
X-CRM114-Status: GOOD (  12.59  )
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

Replace .mode_valid() callback with .hdmi_tmds_char_rate_valid(). It is
more generic and is used in other mode validation paths. The rate
validation for .mode_valid() will be performed by the
drm_bridge_connector code.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 181c5164b23192f0b557624d73c6223032b90ec6..c686671e4850a1af75b82995185ffc3cbb22a447 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -442,16 +442,14 @@ dw_hdmi_qp_bridge_edid_read(struct drm_bridge *bridge,
 }
 
 static enum drm_mode_status
-dw_hdmi_qp_bridge_mode_valid(struct drm_bridge *bridge,
-			     const struct drm_display_info *info,
-			     const struct drm_display_mode *mode)
+dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       unsigned long long rate)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
-	unsigned long long rate;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
 	if (rate > HDMI14_MAX_TMDSCLK) {
-		dev_dbg(hdmi->dev, "Unsupported mode clock: %d\n", mode->clock);
+		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
 		return MODE_CLOCK_HIGH;
 	}
 
@@ -510,7 +508,7 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
 	.detect = dw_hdmi_qp_bridge_detect,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
-	.mode_valid = dw_hdmi_qp_bridge_mode_valid,
+	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = dw_hdmi_qp_bridge_clear_infoframe,
 	.hdmi_write_infoframe = dw_hdmi_qp_bridge_write_infoframe,
 };

-- 
2.39.5


