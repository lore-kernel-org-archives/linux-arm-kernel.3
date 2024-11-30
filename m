Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB0ED735E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 02:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=; b=TbAPUxNW4wLaghKsW9NWfczCuh
	g3/I62hnVmqo3mWrJnozMCHFxwefQI9s+IyxCmD0i3OoIy4TgDZELPn/EA+cUj/Kn7xjx8JOXNy/8
	oChTYEJZe7HhcU/EuaysvPgbTnvDWtemBgqgd/R2n0th+ci4QmLBeHItrxtNSCl9dJsJAAL/mPzj3
	9oMhh9pYCQnCh63MkpzPE5udd9C3Tpv+L5sLN8zK5KKsuaI8doWD+R59LUgRoeK3oxKyJqrQ1qre0
	xh0buCiuoZcxy8PAr8v5rL5d1rKo4vZ/dFt0/zDX+YS9TUusVul9Hfkirxy5Cz2E3QlsX80UEUNWa
	0EoKsRYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCnc-00000001Hvz-0OrQ;
	Sat, 30 Nov 2024 02:01:32 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCfJ-00000001GXd-0xGZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 01:52:58 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53de035ea13so2446680e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 17:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931575; x=1733536375; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=;
        b=vZVfJZkXN0ueZNrClIC1SCRdoh08Oo71gouW43dRyrvhpzoIlitjPyzAGOiZ/kueTk
         AWZxAyigIB8pGv7DUJiheb+UEpluSutOHH45pSXqzAmnyeS6RtXNGJOveTZzwEm3neyN
         1ZsVGnrxdoszO3JUhW5mlaGMb9RMN5Ajtu+WXYm8tY/IQuFSQOblEIzlW0a4BWHCzset
         RGV42rvYM5RCu9sfkIPXqGXseE0CHgA+NYq4cUp0nVZsS+fTqNqx2OlbG1IPtg0o35uF
         I3Fs0+ez0y5pFKO4i3NFDM1EVvbWiVwAUar+OYeQsPLttU4NdhFzxLVehuMUfIijTzQt
         WoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931575; x=1733536375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=;
        b=lxwbRtObBkxpi28ZCGbvoaML6jtXttA0cTGa0Po5k1THgdTFuQL0tJ27GVQnKJ1l4k
         oL/eOjZG9ILaFBNzg4QElf9YU5kgATX9ta/j2ULDE8pc6IWmZzBSneSrJlYrr6iiKQtc
         w73rB7vSq9Ml+98O2G8hnsz0GKmqAK5MVqgjTQJqKLgEUeTxGM5Dlg/Menpbd48acOs9
         SvDgQ8UAu1VZga0lyRf5rTyvy/crtlX0DTvR0xhwDxAP2yrBaIl5gJfcmUBUsUl//HGP
         H1xqnjeFr1oxkFPQQ72JY4UJ2BLb8ccluGrvQ2elwB8LTYk3vJ40mXBwf0dHtoUx20T/
         flCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjdVZdKBvDt83pIkEZStMr3tFCLk5GkAaCKcYhTBlvjq83g1YD2upffQFZStpGcdWkvt4kw0gftg2TWwtxurpy@lists.infradead.org
X-Gm-Message-State: AOJu0YzLXppDeyncpNgCjHAS9Sil9v6MvrlKCMyr0VkK9VOQo46X5JDX
	KoAqljO2PzyFpM2AVZpsxguTZeC0kMhs6ZC7Aq4dvwoBz+wLopF/fx9MuS8rsFY=
X-Gm-Gg: ASbGncsrJbn7cS4GNU0SMGLh4gRcnohb76KqqqSNK1RRTjljnJkWD74z/EqB+t643xn
	n7CIBwXgzQ8z/CQ4omJfkruEMhgnY6mPP/1lFAoyKhmVK3AT62JhSNMX2d8Q+b3TZH7mp12+XK8
	SMCyZLcLczjylj8IGWGwoQoV3AQ0GgCZKflpZJl2JeO3mjc2k67Vl73Spr0nFcKRSXcci94EQzd
	OWsIbXuTBntyCboVZKmDveytj77RDhqtPw31Pq7egjtyPlTSVw8Pk9Kcg==
X-Google-Smtp-Source: AGHT+IGpbKPr0jDpuxGiDeE7FvrQMAmAyXEng/ZnD9YgSk62wmodTKnHm1As1pVrSEzDd0Rvi+mmbQ==
X-Received: by 2002:a05:6512:3b25:b0:53d:ed08:5712 with SMTP id 2adb3069b0e04-53df00d3c8bmr8073919e87.23.1732931575393;
        Fri, 29 Nov 2024 17:52:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:33 +0200
Subject: [PATCH v5 08/10] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-8-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CHPPIcbOk/4oF+oFDkgVgA19LBW1SDNLoLgjIjG3wi4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/gZYVRxsPvBuVk2hROVkIaUSrjCIe8xd0oY
 EGWuQDCOl2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4AAKCRCLPIo+Aiko
 1TwnB/95gm5vag8iFN5M1sSaLORbtyefXMqgXK+UYyOyMGH3WsrGBMV3zrqFa3hOpYrpMOPCJ0p
 2qpzknExme8zQHyG/cCZzlAZZ0eO6hM0CQ4/s+rxguRsevb95fQ5hLPrn9R2wyESwkIQNRYRb3a
 2aXx6WQ49NUOzerBIcauDv7aYjXAkWdIRA7hLYiNDTUg5XaxsEmn/6wFvWpYIa8jK6QejHWd7y4
 sTqgUxNX89KPdleAyprS2KSf4PwrAVlhpqMiALo1t+TdddoHZRFuKOltrZOe72vM5ukHKooMl5i
 xPpLai8cV0tXWnmKjXAfd+Ca/6CUJ/aMT3RViERTh2qn2xln
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_175257_265004_FB2D9F08 
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

Drop manual check of the TMDS char rate in the mode_valid callback. This
check is now being performed by the core.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 8f25b338a8d8f95dc0691735ac6343675098f7f7..1ffbe473e4103dfc315a8cd3571e9407bf518797 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -757,7 +757,6 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_mode *mode)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	unsigned long long rate;
 
 	if (mode->hdisplay > 3840)
 		return MODE_BAD_HVALUE;
@@ -765,8 +764,7 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
 		return MODE_PANEL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
+	return MODE_OK;
 }
 
 static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,

-- 
2.39.5


