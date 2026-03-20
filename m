Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B5B10987A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abtEgq1bev/Hlz/Qy0f5b59+nflkCECGExD8LmSAFqQ=; b=gDF8pSj3wX09mrn16f7YlOMbqA
	7qCqLf3CLQzAVIbxy970zkcT+A5PFgt8yN71MPVzW8+DpQ3XhUemBWYeaemF916m54jp9Je3nG7L3
	SqcGjlIYMRv2q85i1wzS2rEKhdwG2qO9lbVeYUJv6pFlUw03+a3dM7o/ieIvdkf2L9sSU+Ioq2CqW
	DnWWZAD0I7p8itKYs0r4xhUAxpzivby0TPM6xj13dTYdPT23h3jTMUUW2Dh+NKSJo8tZMe3XCpJeM
	Eo9gyrPcdwyCKxJiVSPo/8pknuhyPCtveBBnoBK+n1tDA6O1oPbcaNPryeOuL2b/rYpgY2IsRWMZN
	eiGnhuRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ciR-0000000D8lG-2Knn;
	Fri, 20 Mar 2026 16:28:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ci2-0000000D8O7-2lDs
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 16:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=abtEgq1bev/Hlz/Qy0f5b59+nflkCECGExD8LmSAFqQ=; b=X+P9zem5fFN6nEnpZSF2hJArhd
	N0T5gxposxKR8ftG1pUyhTykwU4gDYd65UsE4ivE7k3hDtFqB1hWRyV/qKt3NRk+ocykxGOMaBj2R
	eVmDcEqWU6PM16300mJhz8YHX5zQq75AZVa6In2WZbMvDsUKsZf3E5sIz+IK3C+xyrph8jemttx1P
	49WOU7cWBLYLCSN5TZbBuRL+RF86uM24EfzQp8Rzc/8bcH6R+toMWKLdwlE3ANZL7KD1QRomddWFP
	n/VIGdBjGtBKDD4Vtq2dZcnwDT1lBLMu3xKiG5Vp4+pB+T9goBqOZc5LbtEl2m3NG8kmwPX2C1dVn
	BK9Rk2Ug==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chy-0000000FxfR-35Vv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:28:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 745FC44327;
	Fri, 20 Mar 2026 16:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91BBC19425;
	Fri, 20 Mar 2026 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024098;
	bh=tuuR1AzJjOp1SuGTOCMRWi7kE/ZiZUxh7g3mvF/HamY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MCLKLO+5JRMtthUUxX+LLOSibil4YOX8Gv7lpNaLq4DgDaEygrusLceagJSD54nkN
	 g6zsCsJEZdP/5yddh/ZbI3dNeP45RlsEVSpX/+8JLECVHgjpL9L7vlW8g0dAUec1Tw
	 0jTF+FdKIBqbiS5be/IPiI+W8cYSf5b5hvnZ4zy8cWl5/xuo/k7GrHi3mmGD3C5RL3
	 9s/LXz5EnE3zarZ13/HdB9SaJ7Bt5hgZZEoLFtAFAbzrgsrd+s29boJr27A1OrhMGU
	 kNF9b56G5d/1rtEtWWdpmdMHBYLTHdDqq0+xdhfau6SyAdLdP11EZxmO73VXZl80Qm
	 vYcZ8kX/sQXPw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:25 +0100
Subject: [PATCH v2 18/20] drm/tidss: Drop call to drm_mode_config_reset at
 probe time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-18-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tuuR1AzJjOp1SuGTOCMRWi7kE/ZiZUxh7g3mvF/HamY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S7P/m860DJO9uoVtv7vhf7e+J62aT59vOy+Z+ONZ+
 Qarv3+2dkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ9Jgw1le7sQVl7Hsr9V5M
 aW1aWaHKuc3p21emz+nZ+2zbfFP9moiyBQnLF/ql6B79t8fTbYZtL2MNlwHruW/fUk/eiJDrLvj
 GkXdWRawpVuqDwDHmSEHTVXb/Gl5s82ibYK5otK21ZHnFri4A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_162823_224886_98F549F8 
X-CRM114-Status: GOOD (  11.32  )
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

Now that we have drm_mode_config_create_state() to create the initial
state called as part of drm_dev_register(), we don't need to call
drm_mode_config_reset() during the driver probe.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 2 --
 drivers/gpu/drm/tidss/tidss_kms.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 1c8cc18bc53c3ea3c50368b9f55ab02a0a02fc77..ddd9f428c2a96557ee02040320cbe5f6f0fd6052 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -169,12 +169,10 @@ static int tidss_probe(struct platform_device *pdev)
 		goto err_runtime_suspend;
 	}
 
 	drm_kms_helper_poll_init(ddev);
 
-	drm_mode_config_reset(ddev);
-
 	ret = drm_dev_register(ddev, 0);
 	if (ret) {
 		dev_err(dev, "failed to register DRM device\n");
 		goto err_irq_uninstall;
 	}
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 8bb93194e5ac686050c47f986b8cb6063eae22d3..b4779c09a1bfa5be7010bcd7d4f1379362996d2e 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -285,11 +285,9 @@ int tidss_modeset_init(struct tidss_device *tidss)
 
 	ret = drm_vblank_init(ddev, tidss->num_crtcs);
 	if (ret)
 		return ret;
 
-	drm_mode_config_reset(ddev);
-
 	dev_dbg(tidss->dev, "%s done\n", __func__);
 
 	return 0;
 }

-- 
2.53.0


