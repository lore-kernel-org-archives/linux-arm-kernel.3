Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF4FD735EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 01:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rL+Q+A1E5WdeyWGlnmxBrdioN3F1q14QakvZcTSmWyI=; b=0jkdlLyhM48NhVvV+IwrP1OuVG
	NhRINH13gT47WIhmrV38PiL4ueNjebr5/N+SmJ79/uWJK4diqeyVczX1hhae4jqjkbdwUU2c+NXEe
	wNeuEH8IUaGInnZfpuu6UY69+v3MHifmPOwD4Lnpov1o55Sve3v5Siq40HQXVqxg9QxY1jGJ5bpm3
	jhJ2AMvh5qQzIUkuHXEu4bPltU5F1kI8TXEciFEawkYSSSsumnoUUgrTS+Nae8hmDditFgdA7Gkbp
	US/THpsMVbqDIwFrX3yEjeVs9mqJwyJwXjXUePXPHsGBslC8mW69VWfrFLI5AeTcZQy7f5ld85mdX
	ESxdG/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCgx-00000001H0W-13C0;
	Sat, 30 Nov 2024 01:54:39 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCf2-00000001GP8-0XDi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 01:52:41 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53df1e063d8so3074807e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 17:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931558; x=1733536358; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rL+Q+A1E5WdeyWGlnmxBrdioN3F1q14QakvZcTSmWyI=;
        b=gNNs8hgqa/BeR3GfSO9W49P1QEq9j+6YugG7DOhkH84dqE1KmzmnPAWd2tdzXZEHgD
         bLEhU6BmOUCP9J5QvJiiLnRgnItOjrr0ihwOMmRj2HEwq+/doOEKPoQ5No3QLL5vHoWm
         amWD5PWwjjeD/nnZ4EuAgNTqqeiSt5lRnO5AkG6A6018xKNhDZ+IdhRsJNXMK9intFOE
         Q5kwtTHlBfI/BrcVQqpjeAwmjgN3HCwBe2RV2LRuRitfgXgq+H9isZFw2BIaVX4ZDPrE
         Be5PvqCSTzRfVefLWaQxtNYxVlZvYQUseaUj3wCG42RlmffTKZV1j0Mk4u6B7D6GUCMf
         W9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931558; x=1733536358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rL+Q+A1E5WdeyWGlnmxBrdioN3F1q14QakvZcTSmWyI=;
        b=llnpBfqJYAf7071We3f8ZlB0XQlte7gHPc5p2ejW3fYCuC0AHUufK0LUHaS6pRQKVh
         A+0MJe54ao7owE7q0iUqZAAAm4ET8xgsbyx37j3Jq5Es0hWlP64eDk7CB50dc13/19DW
         FgIsa+VJsve2gdAIB8mgYJlt1V5sEjgJXVRlvJxZXR9ha4U6N1xeeEp/20Fn+oMffs7Y
         sWAuSm8ZQOwnLqXEM0Tjzi0iJne1n8MrSzHStA8loHxTm+tA5jWDSJOAbMHksOgUAFzR
         x3ehkQBQK8RpyO2bJg1msJvM79SlEdoMbpge+ja23tLLoywak8xfJonjdlFfnjGQgK/Q
         wlIA==
X-Forwarded-Encrypted: i=1; AJvYcCW9h6vWQrEQLus/0cz5DYnCEaoaeFHQWAp2edJ6qF38CzlbSVK/1TWVSilo1CyTNPcvOo4bjD/CMIbXcRW0ZTDw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx54BYfg95pVxtPipmEljmnJpxeJilmxITzBZJb/W7m+TPhFuI8
	gxgbiOzI0mTGr6wmuqO7EK2zwpufMTW26nFFVONPSlxEarS77ad90cuVmPeXacI=
X-Gm-Gg: ASbGnct3T9zaNCxiYy5u9A8RcrfCrcceG8VY6IPGOTP6r7FMXn+ZSAQ+oT9CfbzSOwd
	r1ilR/95l9EhIoqMd+kgfX4t/EBa+hkHKPeoby9hVVT1shnJAxqvZrGmc2G0OfdbKW3j5CdnD5B
	3ZmF6sECqDsFoXoy4mo2EjXNeLHxTg0BPEoMN5Nrs+IZudRjyq6MixEBpSdOCWTyfWLT7TtlsBh
	eJ2duiVvZwdkmRJEoaX9Q73mF5jnHXANTThSzlDrv2vm5YIeDxwZVI1hA==
X-Google-Smtp-Source: AGHT+IGVvdf1lO5fwuFWw9xeRiergMVxDBWPVsqq8kgBU3WEnEIe51FT1/PQjZaCSi/PMkMqSKbTIQ==
X-Received: by 2002:a05:6512:2822:b0:539:da76:c77e with SMTP id 2adb3069b0e04-53df00aa234mr9021742e87.5.1732931558219;
        Fri, 29 Nov 2024 17:52:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:26 +0200
Subject: [PATCH v5 01/10] drm/tests: hdmi: handle empty modes in
 find_preferred_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-1-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rXzXs1LIiHZL8UtREKepdy9gjR2Nvrl9SsrJH4c2YZQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/fBLnvkUW9qRbw575QavDrP72LTHBm1NxMz
 85M4Ziti7uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv3wAKCRCLPIo+Aiko
 1dv7CACoQI2bC+09l2FHVrI7eITxhbdZjhlH6ypKucApGgA2wGe3crPMsMfJbwgJSJY1noUUULK
 YusunI4AlPgsBei8HxSGMe41Mk0z8AcWabq+XcdFbHG9aaY7Q+myFSq3c3F2ErXzjv0yWu8DFBA
 8oR967KFGvjLLSa7noPp/Moe5zrDoJaVD7HriBced36KzyqZLROp652AKv+6CpC+rsOt/T1NK4L
 CNXvVqRyV1Adpa4JZASWt/Yj/xDR+/FMfqRCCdFJLQPyN9uG1m4rChL+TjewMB99voI2nIaImHt
 /oXkkNBHtWoZFXDTAnJws5tJU/s1zd70ka0C29pX++CTpwbp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_175240_168779_790D4960 
X-CRM114-Status: GOOD (  12.35  )
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

If the connector->modes list is empty, then list_first_entry() returns a
bogus entry. Change that to use list_first_entry_or_null().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 294773342e710dc56772f839c2db9c2e487bbc1e..1e77689af6549f162eb3026c7bd2bbd59516ed98 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -46,7 +46,7 @@ static struct drm_display_mode *find_preferred_mode(struct drm_connector *connec
 	struct drm_display_mode *mode, *preferred;
 
 	mutex_lock(&drm->mode_config.mutex);
-	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+	preferred = list_first_entry_or_null(&connector->modes, struct drm_display_mode, head);
 	list_for_each_entry(mode, &connector->modes, head)
 		if (mode->type & DRM_MODE_TYPE_PREFERRED)
 			preferred = mode;

-- 
2.39.5


