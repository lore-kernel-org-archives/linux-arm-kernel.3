Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4523D735EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 01:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqzd45OJ/2bjI5cuXyLBaiv2D5kR3sXVh9d8XfqZ3RA=; b=e96vZB885ogYZfsf6MmtLZS3w7
	LOFkAs4GSwm2yzF5vV6W1r46aXKCBhoVeVDmHiB8owkhF3ARzW+OvC5z8svhZR+H8n68iSyev2R7f
	dDbkXAu+mpjY82Gza5j/CcWQuJMMiQZdKSKYen0GD2xO+dJnDTtEe4U/WDQghYeYeA+5lCtF6w8N/
	qo9TeWkuLBwAkG3WdtUKwETxNMKCFiGJZlO7oGNKnnqnNsx6BhI2mZPxdzgX3yxFFh7uV2Zx7P9EV
	QCU8Oj9MZwEqH203ofY4Sc7aRLw1XM/Uu1otSa4kvdZNmHbsGhdwznyN8B5nI1RduA7dTHgPEz/O1
	9WGMMY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHClh-00000001HjU-2YOk;
	Sat, 30 Nov 2024 01:59:33 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCfE-00000001GUw-2H3f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 01:52:53 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53df67d6659so3996534e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 17:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931571; x=1733536371; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqzd45OJ/2bjI5cuXyLBaiv2D5kR3sXVh9d8XfqZ3RA=;
        b=sAo50KPwrdamWaOQnZRB5GOrh0afqoxhcfbFibcLAdKGf4gt9MKVBBbLl++GW4+Y2j
         zw9oeQcinPtG2mUDBpDsBe5395qqTgWxDY9BB+eH7acolm0knzNt1cz8riyoTZsbE03r
         bBTSl9vcnZHAVwBX1AFbbYiBOgV0CvJvfdALaToANTdbGEC+MSUd3k+0GHfEx5zsiLcD
         lmM9WUu/tsu4ChslGT6vB1YcWUKcIyuplL7NXzUcJXwFFCHo9GDEAEg8w51wHNvYI41H
         my+dWEBvmrQDY8Cay6YboQcexI+koDshkZ74VApOoBT/WWGtX1jXaKeZfYGDvqVJTB44
         8AaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931571; x=1733536371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqzd45OJ/2bjI5cuXyLBaiv2D5kR3sXVh9d8XfqZ3RA=;
        b=hpQHIeY1V+TGC7JrsZUaAbtvrj5LkYGwg4/D1XhWmO0gfs8xObiBLVTc78nnmq96tZ
         UKaxHZpzKo0laHVHCS3hFms+h/uT8Dti9NdXP6l0YISF2UvjwJvdf1JlBzkYX9oSr336
         FnnBMKEr9Qac+NN5eJhnocGfXGISEWvp7zUQz8C1jsxrp/c/FjL8laC+SnEfcYXbXxYK
         UDQp0aFqfnNEHisxkiLxuf4sTXdV4tPslE9vVl+rBS6C0ZjYqdJRUcq4bKFHTGQSUl3f
         BG79EjBEmSX7nIVUZs3/N834YXVmzSVzxPMkxjb8tbaHiAYl8vuQH1JrGd5fKHN33GcW
         iI2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKqErmulZTbQ1RFjwn033K2kKqsn8JKwc0kTwAxNNDHKuaHfRN/okdOdwmJr0rIY4A/igC4LM5JhuDyAjqZPME@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsigix/GsgMRcAIr+BAt2zSaQ/d13QQ+NBiiwfmYCpgjCbqC3j
	UAjEMeQ0bwxaAqogzzBHGlqKwIMzVcmv+BEKqTF5U8gaS24gTzZLs/w0mAZYKW0=
X-Gm-Gg: ASbGncuMJVapl6I8viAIR0rJAKtc+WUhsHChMcKb//ta8XV48aGrQQ5Kdfz3XKdYxIQ
	UwH1yDFYaLXIvMapzNCFHn9+w+BOoYNyBEu8k48qBfgmoOeyDaNrlj7BDWMwUDswq823HF7hRJg
	WKfRYlzuySrh1gAyMK1EFsRawJhFopDXXxqfHuE3YmQO75MWdU+odc87oBecrSq44mvMhPH658l
	PL8bFaPLPe+TAxZ54CfzMYC4uUeWywPBAY2cbz4zwRklB2i1nY2VMQ6MA==
X-Google-Smtp-Source: AGHT+IEm8Yb0TxS+eVr/75rrNhY8EmahWTK3d4I/qjVsct4VbSz/US+qIlExC4PPMtJ+C61FxhlMpw==
X-Received: by 2002:a05:6512:124f:b0:53d:ede3:3e0 with SMTP id 2adb3069b0e04-53df00a924emr13257471e87.11.1732931570640;
        Fri, 29 Nov 2024 17:52:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:31 +0200
Subject: [PATCH v5 06/10] drm/vc4: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-6-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=At9SvTe5LA0QiGChV0O2Dfze46Fe9tZ8M4odvfGUE7I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/gUrzKupzPQSPNAvUfGl7XQ6IFP4Mjuc6k9
 OiwxKE8NgSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4AAKCRCLPIo+Aiko
 1UbOCACfmiglysJU/tIyjGlA11c+mgJ7cYK2eOEWh0ZSy72NW65KgY5a8FbZ9EVCQERqWc7dP90
 abFOIQdTPse1qE2HvCyMqVIHoKKywUEf4E5vhK1BOu4ArILzt6nstUi+E03GQUFjvM2cTgf7lZC
 edUwdUGA5Lm0pJq04VtA/+pg5wi6+qb33fd00ohAnTYmpBWYYRLGm6ytcdhJuewk6P3AOo7hT27
 VbGBcMiGZNp3E3P4Tvk6KoR0Nm7SOKWMpn6omYVsIhV19KKTtk2UPYZWDe45jm5te3OB0TScfc7
 HaKxP4L24nxyZtXeCB/cUIMb9RVM/dcHbcZ6lkb25qQPXzn4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_175252_581468_490278AB 
X-CRM114-Status: GOOD (  11.86  )
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

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b9fc4d981cf4d682bedd978795cf7284d2650e74..297afd89036ba8fba571379f5b6d63227eadb66e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -580,6 +580,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 	.detect_ctx = vc4_hdmi_connector_detect_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
 	.atomic_check = vc4_hdmi_connector_atomic_check,
+	.mode_valid = drm_hdmi_connector_mode_valid,
 };
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
@@ -1765,7 +1766,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -1773,8 +1773,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
+	return MODE_OK;
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {

-- 
2.39.5


