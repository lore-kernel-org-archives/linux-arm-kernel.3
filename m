Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF21C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 22:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3NPai227aDJvUuV8kWoPsqKGMzOpGvfzdkovhg7o0R8=; b=FOljjTkpoPj/zrb1vTPrkc9qdc
	Sn5swSGFPiUU1L94AjPHnn6YzZHgNzfq+516x6WHxi2sjFMZ8CNteOqMMtWIbtwPklVnS8FYw7qmO
	FRNePN36JDzZR/1tBm98htJKh0sFokP6mZnfxs7aROSiqIch8OBHcVFh2MwCAuVIK/jlXNyM4c8mo
	gl8YuK2KBHKmy/ZYtOYou/pAezkhXW8CRoQEVECDhP5mCZASyP4vN1Ndx438GW6tR0alWlIzmJPbh
	N6CfsJbF6XZmE0z/JHQgp2CJWbYcR2FPGzXcQNEwHqdZQeQ1UnLeZU/s42HuPs0KjX8i1ET1DBIpZ
	72pyQiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dUT-00000008f6T-1A7N;
	Wed, 09 Apr 2025 22:01:49 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dE9-00000008cLy-0OUr;
	Wed, 09 Apr 2025 21:44:58 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac289147833so28674166b.2;
        Wed, 09 Apr 2025 14:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1744235095; x=1744839895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3NPai227aDJvUuV8kWoPsqKGMzOpGvfzdkovhg7o0R8=;
        b=KJqxhRLWhE8IOfm/FnAJpu3ULyf61JpXOwljyd7RJnx2FEyPLAGf4emWKgDUx1pY+s
         6AiAkEBu86nwhaLIeHDim6VoD+fuEFxUaahSNA8EheHRK1eAmPj0FmT/EUEiConAfHqv
         74XJwI6QkyAloAhgUI+pDb3RFV1YzVEFMDAGHq25+u0O9NOaaToMesI6h/yHier9aHVb
         BQshrN84vFf6Lcp+FxNJkHW4xrA6eg++2vWGGN/lFCUeGGruMiZjiNSiqzpoK85BU9eg
         +DrSiigst4/pezgOCfDnySv7lusxIvM0yFiJ1u/IWVsMJYcOvvyTKRQHPKupD2Q0N+WS
         DWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744235095; x=1744839895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NPai227aDJvUuV8kWoPsqKGMzOpGvfzdkovhg7o0R8=;
        b=ZS46zyNCdUXGxTAQv1D6f4QPu6cvq/tE0d/gDRBAitM+1y6HhYu3UyCVF4O0rL/YZu
         4ClyrINvuZart69OmPw4LFc5zJYuCu/+eXf7rf0QhLajx1p3F2qeAwiZDSwhYAhrjRBq
         Syg+YbbPpW2Uqk0fUirc5nbieNQVF5PUhlDgzEp28+b/PgoVRR3lpmZ2FfnvMoayOMWR
         15nhoagjmnYJqFdS9/HSqjTm+ST5uUwg50yQjtgIa+2CXmgsR2lYixHYVA4mDyJXtQo1
         qPOcSGzuW2ykb3NKyJ+y/1Hhw2UonBARBXN1PjwD1XFYV0Mks4E9ZUc4RnU+hO8lAHgL
         8D2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvuzcx6yEgNev7bUxl4o7158IYYxMvZL+hcMePEXr4jZdlHQHyc20kLsymcxNP6U+m39B//2cbPPwHrkZCnzXa@lists.infradead.org
X-Gm-Message-State: AOJu0YxsHdbWcKuINCmFObssNV4M4IU2Cabmlc0FGFly0+5fA+TtXWuv
	pnIrvykT36lEs1mnBicxSsc0pYWd1X0BrnyiByH03XmNjpzo/pTusKMyNA==
X-Gm-Gg: ASbGnctywfXFtctPwwjBZFWivS7UVWzVSIsjp0CwmhR+UeFNRYbRY7iz5kEL4eTH2IC
	b1ErNtbEaouJ3o7+aJbcP89WWCN8tSHECG020L7ccdVJL6WyhawpHypDpdIBrl7z3A0mSqsRcyb
	/MtbyiUE3aXFISUnkG2ObUhLAsqUsOeg/AwH2tr1V/r/hANk3OcCle8TDEqYcoHtUxzwoTTK+dX
	oj8CpROjdtAyZowkwIE8kmyx+fB+WzfFMlmh4Bd1hbxM4yHJvtddP7wQseuaXbIGpu+nnkTKfVC
	F6vriSukitTKR1bzJHDq5ByF9UyI7ZisHHGsZt6v683iRp0XeHbOYMAwHWvMrz3WRLJe+3ZUP+0
	hkdUBBYy3W7efHxfXTULEPLNswUZZD3sr3RbA0FEceSyO2xjkbc73qWQ/M1VG9u+CYQ==
X-Google-Smtp-Source: AGHT+IGgAEroUeLQh0oYmzC+aJfi7NMR07UxELr9MmrtZo+ueWdUduUVZpBbInA6JPzZpHd/qY/X8w==
X-Received: by 2002:a17:907:868c:b0:ac3:3f11:b49d with SMTP id a640c23a62f3a-acabcb2f4b5mr27658666b.0.1744235094553;
        Wed, 09 Apr 2025 14:44:54 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3fc-b700-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:b3fc:b700::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acaa1be9152sm153577866b.42.2025.04.09.14.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:44:53 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Furkan Kardame <f.kardame@manjaro.org>
Subject: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master() on error
Date: Wed,  9 Apr 2025 23:44:22 +0200
Message-ID: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_144457_134361_8C7CF85F 
X-CRM114-Status: GOOD (  14.42  )
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

meson_drv_bind_master() does not free resources in the order they are
allocated. This can lead to crashes such as:
    Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c8
    [...]
    Hardware name: Beelink GT-King Pro (DT)
    pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
    lr : component_unbind+0x38/0x60
    [...]
    Call trace:
     meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
     component_unbind+0x38/0x60
     component_unbind_all+0xb8/0xc4
     meson_drv_bind_master+0x1ec/0x514 [meson_drm]
     meson_drv_bind+0x14/0x20 [meson_drm]
     try_to_bring_up_aggregate_device+0xa8/0x160
     __component_add+0xb8/0x1a8
     component_add+0x14/0x20
     meson_dw_hdmi_probe+0x1c/0x28 [meson_dw_hdmi]
     platform_probe+0x68/0xdc
     really_probe+0xc0/0x39c
     __driver_probe_device+0x7c/0x14c
     driver_probe_device+0x3c/0x120
     __driver_attach+0xc4/0x200
     bus_for_each_dev+0x78/0xd8
     driver_attach+0x24/0x30
     bus_add_driver+0x110/0x240
     driver_register+0x68/0x124
     __platform_driver_register+0x24/0x30
     meson_dw_hdmi_platform_driver_init+0x20/0x1000 [meson_dw_hdmi]
     do_one_initcall+0x50/0x1bc
     do_init_module+0x54/0x1fc
     load_module+0x788/0x884
     init_module_from_file+0x88/0xd4
     __arm64_sys_finit_module+0x248/0x340
     invoke_syscall+0x48/0x104
     el0_svc_common.constprop.0+0x40/0xe0
     do_el0_svc+0x1c/0x28
     el0_svc+0x30/0xcc
     el0t_64_sync_handler+0x120/0x12c
     el0t_64_sync+0x190/0x194

Clean up resources in the error path in the same order and under the
same conditions as they were allocated to fix this.

Reported-by: Furkan Kardame <f.kardame@manjaro.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
This issue was reported off-list so I'm unable to provide a link to the
report.

I'm not sure which Fixes tag fits best. My preference so far is
Fixes: 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
but I'll happily take other suggestions as well.


 drivers/gpu/drm/meson/meson_drv.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 81d2ee37e773..031686fd4104 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -314,35 +314,35 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 			dev_err(drm->dev, "Couldn't bind all components\n");
 			/* Do not try to unbind */
 			has_components = false;
-			goto exit_afbcd;
+			goto cvbs_encoder_remove;
 		}
 	}
 
 	ret = meson_encoder_hdmi_probe(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto unbind_components;
 
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		ret = meson_encoder_dsi_probe(priv);
 		if (ret)
-			goto exit_afbcd;
+			goto hdmi_encoder_remove;
 	}
 
 	ret = meson_plane_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto dsi_encoder_remove;
 
 	ret = meson_overlay_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto dsi_encoder_remove;
 
 	ret = meson_crtc_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto dsi_encoder_remove;
 
 	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
 	if (ret)
-		goto exit_afbcd;
+		goto dsi_encoder_remove;
 
 	drm_mode_config_reset(drm);
 
@@ -360,6 +360,16 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 uninstall_irq:
 	free_irq(priv->vsync_irq, drm);
+dsi_encoder_remove:
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
+		meson_encoder_dsi_remove(priv);
+hdmi_encoder_remove:
+	meson_encoder_hdmi_remove(priv);
+unbind_components:
+	if (has_components)
+		component_unbind_all(dev, drm);
+cvbs_encoder_remove:
+	meson_encoder_cvbs_remove(priv);
 exit_afbcd:
 	if (priv->afbcd.ops)
 		priv->afbcd.ops->exit(priv);
@@ -374,13 +384,6 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 free_drm:
 	drm_dev_put(drm);
 
-	meson_encoder_dsi_remove(priv);
-	meson_encoder_hdmi_remove(priv);
-	meson_encoder_cvbs_remove(priv);
-
-	if (has_components)
-		component_unbind_all(dev, drm);
-
 	return ret;
 }
 
-- 
2.49.0


