Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88588E67490
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 00:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LPWl0EhL6KI0Pyg9VIPJdMDq/EwgacWWrQ4ao+PcFsU=; b=TwKHrS7Abf1Z+A
	U8pHxr2waEXf/CVfIa0uVj+ut4fHLqOc6TaFxIhS7dYsBnD9zJ4Jn+tdQj+eqxQytT1MbHjjZ6hH8
	wJTW1Ai8FG/trabYur3tvCd0c159u/yeiTcpZ0IJdMby42EHGXbaGh6v/QYJJXebkDV3iy7hySQlN
	zOtXTEgEJmqdAw22sTouKyEV3NAesv9QrRC/xgRKk70pyTJ1fqqC0xpDmK0Tf38kPOI8LAisO6Wfs
	w8+rfZ2ffCY5zMEOzVxtR1BYg2/2/0BPfV0z0HHDk6dqZcOVL9SHxuHT4M7X6veJT8WPMmgrTnx+f
	YA71mPT40dkDvjinGHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fWb-00000005Ic7-1in6;
	Fri, 01 Nov 2024 00:28:25 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fTS-00000005Ho6-1czW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 00:25:11 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539f7606199so1582263e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 17:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730420708; x=1731025508; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPWl0EhL6KI0Pyg9VIPJdMDq/EwgacWWrQ4ao+PcFsU=;
        b=wxgl4oOxgSOhX3DUlQdLorxltukkUJ4ollCfJlRiAaf4ITBrpZWfTH0Q9UjCox4ce3
         zM7ju18HypWlBwfu1uX/c0IlZWKHQbi/sKI6g4iFpoEU23OSNGvPUsd2xExbjfvT0Xao
         3aao1fK2FMaQT9cE/mjHaMY/y1Qie2o9hYPeILP63kltD5Pwa1b8hIF+WWNcjGJdhIDl
         2ce7A3k3t/4rMKf/Hazwidpbw+vUFgIM8D2sUZgQ6FtjGGQB7n/h2Jyq4/EREZ/gvuJL
         lkQDSW6Ijn5OVR84/Km9qZlW5FDr7r6Mxwv5/JptzrTAn5S86S7yctmui91HOx87wLAB
         FQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730420708; x=1731025508;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPWl0EhL6KI0Pyg9VIPJdMDq/EwgacWWrQ4ao+PcFsU=;
        b=fTjnK2o16inebHMcucyZW24nBxBhtYZn41r4E9tQOmj9Qw+OaLH20yeivWn3v8F4Sr
         ukDuF1qOPPipTwAbnPTFOb/lw1kgAUSr8+lUdmFZRiUahLRXYaNKi0c8hYC6zTtAmvQb
         bJqRopdgR2I9n0C+F9Jfa1MJx8+jqYGu9BUm6WyRVVvaKmRyp/hJ5ZVpO27X4Dmc6tvA
         0O8q5K1cQe6FZU011ljuHCO3EqKMUsYR2MWbOgngu3blVjnk7aQRGDKNfUBPWNWSWHuN
         CCklJoNyvlXXE5lK2LnqBxmgD7RViHa3OzCjrXLP46vpCB/BfblQzIMg72Q5a1MG1z9U
         /XUg==
X-Forwarded-Encrypted: i=1; AJvYcCWRybcD8z8RY9II5aG3YbF1SJueSAgc3ygdVKD3NYF4/IPrebLDoTDdEuW4Padl0D1tp2Bf5Fy/hthvETTdudvG@lists.infradead.org
X-Gm-Message-State: AOJu0YzbAPRsBbEBYwCiawICJMKVFkrxJrZuTeMdCtFPiACIi5EVaoKi
	/qHbXGwe5Mg0xYD4gySZZ+UPvT1cnNgIJ4zJF+mhl/fTvmWvo09Oh8JA+Ny0/dQ=
X-Google-Smtp-Source: AGHT+IGzQdvR9n9N5nsIKtK9Qhx1FHQRUlJs7sw78abE6mZx2jxTi9cQ9DuYKZQZysqMNCy1gebATA==
X-Received: by 2002:a05:6512:130f:b0:539:fbf7:38d1 with SMTP id 2adb3069b0e04-53b7ecd5970mr5312335e87.2.1730420708098;
        Thu, 31 Oct 2024 17:25:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:25:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/6] drm/display: hdmi: add
 drm_hdmi_connector_mode_valid()
Date: Fri, 01 Nov 2024 02:25:03 +0200
Message-Id: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8fJGcC/3WNQQ7CIBBFr9LM2jFAUNGV9zBdEJiWSVowYIim4
 e5i9y7fS/77GxTKTAVuwwaZKhdOsYM6DOCCjTMh+86ghNJSSIPBr4xr8oTVLuzRWnJaK3MS0kF
 fPTNN/N6Lj7Fz4PJK+bMfVPmz/1tVosAz6aslbYScLveFo83pmPIMY2vtCz+UD4OvAAAA
X-Change-ID: 20241018-hdmi-mode-valid-aaec4428501c
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2jBD0sl9KT2Qp/EDHaop9tjjGL1eeuSLdTvEobSlC2o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/hvEH2fbu10syN0kMJjljMx5W/ESzQUVOsw
 TIFkNSzP9aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1aH1B/wOZhTNhYOTk6Qqu7BncZn5jLCtS2Yc3ZKRtmLY2SPPxUlQSH3BJufcG08aT9tcaRJtvzH
 dLiSvu7kKRrptx8XXTTAowIe+PjKHNcvJt6f/DS+Xq09ujGERYNsYJKUmENNauW7tCtInm5iWTi
 FP0Pg2y/9Ekcqir7E+h+S+AvNfXY2PP8cS9krf3a7/mfkI9ZQ08L+YSu7emXZzSvoK8lFP2Xb8q
 zKLnQq9TISsrTJHx/nO3Ex/qPCXDdG0yzSTjb/7JmE5it/eN5z2GMuhJxiw7KOzsWYVeKpTf13D
 dJTT2kruCf1H+YrwsP3YdsqRpFJvq9psMttgI+8Wl1fHfwEO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_172510_478639_00E86C9A 
X-CRM114-Status: GOOD (  10.35  )
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

Several HDMI drivers have common code pice in the .mode_valid function
that validates RGB / 8bpc rate using the TMDS char rate callbacks.

Move this code piece to the common helper and remove the need to perform
this check manually. In case of DRM_BRIDGE_OP_HDMI bridges, they can
skip the check in favour of performing it in drm_bridge_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Switched drm_hdmi_connector_mode_valid() to use common helper
  (ex-hdmi_clock_valid()) (Maxime)
- Added simple unit tests for drm_hdmi_connector_mode_valid().
- Link to v1: https://lore.kernel.org/r/20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org

---
Dmitry Baryshkov (6):
      drm/display: hdmi: add generic mode_valid helper
      drm/sun4i: use drm_hdmi_connector_mode_valid()
      drm/vc4: use drm_hdmi_connector_mode_valid()
      drm/display: bridge_connector: use drm_bridge_connector_mode_valid()
      drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
      drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate

 drivers/gpu/drm/bridge/lontium-lt9611.c            |   4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  12 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |  16 +-
 drivers/gpu/drm/display/drm_hdmi_helper.c          |  45 ++++++
 drivers/gpu/drm/display/drm_hdmi_helper_internal.h |  11 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  26 +---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  12 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 168 ++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   4 +-
 include/drm/display/drm_hdmi_helper.h              |   4 +
 10 files changed, 252 insertions(+), 50 deletions(-)
---
base-commit: 623b1e4d2eace0958996995f9f88cb659a6f69dd
change-id: 20241018-hdmi-mode-valid-aaec4428501c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


