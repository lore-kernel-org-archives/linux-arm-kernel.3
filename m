Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7D2E65D17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=; b=tv1ryKEMh3O3C/iN/BkV1EDV63
	E2Nobq5mKpHpNsc41TnrGcOeJc+WbWrc+W8i3BAcaNjJgid7L9P1POkfCuSy9Lk7PZugxbgKKOB6i
	6Z239rL42ds4TDM9joGR2QdeH0bUgxxjQ2uOm8sSJ9mK+xaRni/PJya/jjtd92e9Ea+s6orRSlpsW
	8ESQKkG8rMXRT+jo1BR0MPqFHoNDEeJagEpO3UkoFfMz+kD8lWSsrEW0J3ruHIY4bhSQct58du+pZ
	N/u9a3T61T1X8+eMsd1d7htF95BLnssL5s7XkC4mm3XtH4RmhYopqLo4tUpLqSYuAbMiQGKl+/4C/
	UQI6u9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPqQ-000000024cU-0UyF;
	Fri, 22 Nov 2024 09:20:54 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPjE-000000021jr-2D7h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:13:29 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53dd9246d21so113926e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266807; x=1732871607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
        b=mTgg9anKNQ9oPCYaJA9wa/DgrhF/U/6L+YYscoWw9h3SLbKTk7fKo+w3vtTASKu6aB
         kcjqGu9Xt6Chzx5rBtgcxx8UOgR3oavX1THZ+oQczCgsryF+U4nuVUFek+TXFsfwzTwQ
         rSdfmGAiyCSmeDy0O+FH+DRsYdLw5mdCHjKDIq5zIGP8sUJQWZOXQE2Ge8p8OGfhDSXi
         CBM0k3Z6R0XXU4rvNdNXMn3JP33w45hz6M6WlKVQf5y1b+OmCwV/SL7Cx3syDUMx1rqM
         hn62KM6YPAycUztvIb68hbZTbFQ+J+1xHNEE9yK4AcsJQPO/f5m+u1rKO8n8aQ7TG4jW
         7e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266807; x=1732871607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
        b=XRynuTnYtLwL26Pk+ZJPuK1WyVZUOqBRpT2Ynb+nMjIMBBJl/1rNyqErxl/xZ29x/D
         KrHhveIUB9+i7LpN2XvJgkfbUFtqcLxUIV7bfUjAwvCD6XbgjEmomiwBmPCoW3JlWr+n
         Doi5zJ4j60Kx3hcNMI4A91TB9acpNNsN02PiipjQSMbm2Gt5FZJWDhoXY/uI3YU5pYMD
         DzcgZj4WmnvVmXzChoG+6ftEFXi8rxTuO0taB0k+lRo0OhImWidaStDxkd45sNV3lWgg
         EuJh7ecOcDTZYUFm4oN0lNTSqZx5UxdfZETQhzUunX4nqRtTpy6JYQw1cQer73IK5mRq
         uWxw==
X-Forwarded-Encrypted: i=1; AJvYcCW+idQjMogMUdQojay1q9Pid4FuSJrb8mN+b/PSy4fPqezN/otTwjizVeUxI99bB1ftrLxXydlgslGwev3zILWw@lists.infradead.org
X-Gm-Message-State: AOJu0YxQVZ9QJ1I3I7l/lEE30v6XDpfNhRidOk+oBmpPftP60D/6Iw3U
	E5oFRk753/IYdshG6rQIk47eua4Iau7h7jF9Fl6vmo+BeFiYqyXbZIJT+h4a8ms=
X-Gm-Gg: ASbGncvpZWGefTsVnZ6/1hpceH7Yodg9hFwcw7r/KDKu4cbWkC6LP5SgDhS49JzHikf
	LoNwgYXSrK5cwBtIoSWDr4CTRUwxMlki9njBu0eWMIM9r9ewnSUpEPqKEKJYs6un62ajEcr2f1g
	sqHffr/c5MWK/hFBqyasJ/BqtLp8vLc0ghmnpHyfsKinXKBTFZjqCRfOFB/K56Lp/62t617spN4
	S9QE84CALTv6/aq/ri5u5MznHkcw2aQgKxs3kzH0CWaAgP8bdXTeHhnYw==
X-Google-Smtp-Source: AGHT+IGP0twniqH2U7ywDpdM5USOAfTTfwclZMuf64h3sSsbdQOKH5VgJsG4NoD2/EPGUBvock6QuA==
X-Received: by 2002:a05:6512:3c96:b0:53d:a27a:2106 with SMTP id 2adb3069b0e04-53dd3ab0eebmr902104e87.55.1732266806968;
        Fri, 22 Nov 2024 01:13:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:03 +0200
Subject: [PATCH v4 07/10] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-7-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
In-Reply-To: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1872;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V6uHu+T4+xW+xwMuVx/apScXj6PwN9KdCvTiBY/zzqA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsipUZxr2L4H1CSYJPqrSWitJVJYT8cvGGNx
 VzJVBpVLQiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIgAKCRCLPIo+Aiko
 1Wg8CACUh+Qp1wI3QCkqrRc4xvtyhadjSchb8neePNvcL0EeS3MTH3BWZCvgSLpKslneK9k6yVL
 9DTKhgzCmZL0UPCkBx9as8mvdKQBUN1m/r3gplfEUsQe2bFoVBzI24JWS3ZAVJbe0RlQe5A+N4X
 EOOFCw+LkSv89UJBKWSvUvCm4ez0JYCuuQEDWX2MivOuHLjIzOHKXnubiYcFK9u3+KsRADnp1mi
 RBNUHr/fnJw+uvGlqRKuh3Z3pa9ig+V2gAlc7T2X4/0rhodFgbNr3XmxnOOKnL3E4DJ7eP9ejOS
 8KSZ5CU2TIorVoGQxGUAz2vtTDQ5bGJWekzxiEE6bqzE6v0O
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_011328_566193_67D45553 
X-CRM114-Status: GOOD (  13.92  )
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

Use new drm_bridge_connector_mode_valid() helper if there is a HDMI
bridge in the bridge chain. This removes the need to perform TMDS char
rate check manually in the bridge driver.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 320c297008aaa8b6ef5b1f4c71928849b202e8ac..512ced87ea18c74e182a558a686ddd83de891814 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -18,6 +18,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 /**
@@ -299,9 +300,22 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
+static enum drm_mode_status
+drm_bridge_connector_mode_valid(struct drm_connector *connector,
+				struct drm_display_mode *mode)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	if (bridge_connector->bridge_hdmi)
+		return drm_hdmi_connector_mode_valid(connector, mode);
+
+	return MODE_OK;
+}
+
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
-	/* No need for .mode_valid(), the bridges are checked by the core. */
+	.mode_valid = drm_bridge_connector_mode_valid,
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,
 };

-- 
2.39.5


