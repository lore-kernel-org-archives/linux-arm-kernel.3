Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F95E65D35
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yPJBOfYSV90IcFVSxfOZG/ZLElTJvS62cOj1dS8TNSc=; b=V3DcOEY36mzWsu
	CWFfBuPhICzov/6XWr7NFQi0Y5gd7abxfULX4ml4cjTolseBqEji+ppdusk/468u2N4JC9+x8eKb6
	8mt4MK3rORs/PekSxAjuaGYSjYDM1hY5dkSVRjzP1eE5oYs6JExzrnfQHdcb10Q2v06qhFSpFw75f
	p1ly047o51pyi9mT+RNdQF9cxpqPzL4NLfWjP0v9hfZEUMX4djLp0qYvLloRXzdgqRl0mjck6VHd8
	qIMUWcsbsvI5TUMKF73g3Mx7qvASvlo4W3kL+S1uZSp2RD6dt/5OdQfFYD+KETba/fXTIpg80Mrpj
	Ywto1FKZKWNscuXCxfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPjv-00000002214-239A;
	Fri, 22 Nov 2024 09:14:11 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPix-000000021dH-1n4R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:13:12 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53d9ff92ee9so2108838e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266789; x=1732871589; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yPJBOfYSV90IcFVSxfOZG/ZLElTJvS62cOj1dS8TNSc=;
        b=U4EkLplS/8VaYrOAa/C+2n5v0SlaesuYEwJQfE4mXMwpAXhso/431BhHTUEeBLrIZC
         65ESl0wvjrH6+lsQKvZTM4FQ2osQ7mXZurWs+ER7yRh+zXEtzZVmQ+jA1DhjiYQtE+87
         vLl56DY/s2l+1F7MDhC+pGAetfeVZCpSLHeqMNGL/d1AwrGuthp24SUha1bzzQNbRSzL
         wmEKRFE1apgusLru71Z4VLKSYNwxwLaIWO/bH78ciuCcw+fKRZweMZGhkWMdwVICmJfz
         x53L3DNWWKVUOGoHjlx8wxaCM/C3XfsC1g1eq1hkb6SsHfn4fysl8EocgpAuEi8JBR99
         Leug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266789; x=1732871589;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPJBOfYSV90IcFVSxfOZG/ZLElTJvS62cOj1dS8TNSc=;
        b=E8Ahi9AlErlf4TwiUAOyp7FdRaby5c3218CSNhc62pwS1xg8/qhMtlwXnpAuBqCK/K
         hwkexCAcGRxLLLDWd7mabnZRUNvy6DpwgPHIDpT8dMLEfBMDraHRXvX0moYBXQOnwrOH
         pgISnFAwJAuzTjm5xGvUcY+ykOTIPMBQ63aglwIZQIxA3dyJNFc/94e9r1hBW5pmbGnO
         iqYST5i3lJQpyqR8je/mqdQOr9affdPyzhon+m8XGdeSQ802nE4JxOkyuBPg2pQ674Vj
         4ZXevTFm9wFwCIPjmS4L4aHFOmd0jFN3vkFM12ccKqXO9PECwpkuR5D1FILCCuNO1nGR
         AgjA==
X-Forwarded-Encrypted: i=1; AJvYcCU6EaooVM5JXJGWyAt+gXF+SKqa3x948DFls7LIyauHAl5Pwyb7KUj/t4rjMCzsOqQ4bCUCQuPUgIjFakSX5W/T@lists.infradead.org
X-Gm-Message-State: AOJu0YygsfhWe4BXQMg47glB7lCJVyppJo1A+9UIhtmVhd8UBvsk+Pc/
	n+ymK8hwcqDmO7dEBpQrYvefipMgwocu5lt32VzYEFqXmi6+fuWP5AIU3ikqeW4=
X-Gm-Gg: ASbGncvlq3jZBgKXTgObPUyBujYWec0av7iJk+GWnJo5HQCh1g7C4yTGBybOXEt3dzy
	LgbXOYM/ZDWG+EeROtJGSkYpIiv26IRs5VMPSNNe61NF4/+q2so+dPLRSXajcxDjcK4rlTXdEqU
	LQXGco9jDylFNfwW4ZnNafNjg9MO4oz3Fu2frW4CsRnrtIFloiuUE4OZFexAv5QItrHxMJddigb
	cwdVMxzkEPtNEPBPOvgCZQjKUk7ey3iZ7wO6ddj8Amb2t5oEFYjE+vayw==
X-Google-Smtp-Source: AGHT+IGEb5tRInMFtVE9GZficnUTiVO1xCATodroM7GK3ZevvdEIuIB/MI+jMs/pCyFMTD+eeIO8JQ==
X-Received: by 2002:a05:6512:10ca:b0:53d:a9b9:fdc0 with SMTP id 2adb3069b0e04-53dd389d8a1mr1112818e87.31.1732266789361;
        Fri, 22 Nov 2024 01:13:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 00/10] drm/display: hdmi: add
 drm_hdmi_connector_mode_valid()
Date: Fri, 22 Nov 2024 11:12:56 +0200
Message-Id: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABhLQGcC/3XNTQrCMBCG4auUrI3kr2l05T3ERUim7UDbSCJBK
 b27aTcqxeX7wTwzkwQRIZFzNZMIGROGqYQ6VMT1duqAoi9NBBOKM25o70ekY/BAsx3QU2vBKSV
 Mzbgj5eoeocXnJl5vpXtMjxBf24PM1/W/lTllVIM6WVCG8ba5DDjZGI4hdmTFsvgARdgDogBWq
 8a0XrDW6h0gv4HTHpAFqKUyTkhtWPMLLMvyBlx47n8xAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3023;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dAGoBfBZPrQ28ollGsFDqICLzpx3eGynrKY+liYfcfc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsh97cY2ewxrd1QdOkVWNxJCVibvExTdRJp9
 9bHLnJ6vOeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIQAKCRCLPIo+Aiko
 1aIBB/9UOalIiiDyCESbhN5VK1zX78Q2v5Cu6GR9StRIoyHvHhPD2SZblaTT0rK2OUduQIaCzil
 e43PDFRCRm4oTpATivZAvHM+yi203AUBJiwIOMAe3JA+lhIvMk3+ifawcrw9Cl72SEbVds3dBNt
 BIFRNdKbfHdX7wqjMVc2sNYXaGiXlxNEvRrur+Q56Z5uoO+XYx/CdGPi1clyXilpj3fMjPiIs5o
 dtyVnROt60CnOjUDof0ueLHTqnMk2Ydx3ZhtWbgLtC5avyxhU0xLPgjLAqQDjkW3BXf65sD++Ux
 wdtO/dYUJ6BFYYLwt4PattfJC/Uz53ohOyAbm08X1xxiSoWn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_011311_528437_09298F0A 
X-CRM114-Status: GOOD (  12.64  )
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
Changes in v4:
- Fixed build warning in VC4 driver by adding .mode_valid to
  vc4_hdmi_connector_helper_funcs (LKP)
- Reworked HDMI test helpers (Maxime)
- Expanded test descriptions and comments (Maxime)
- Added new EDID to test info.max_tmds_clock filtering (Maxime)
- Link to v3: https://lore.kernel.org/r/20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org

Changes in v3:
- Moved drm_hdmi_connector_mode_valid() to drm_hdmi_state_helper.c
  (Maxime)
- Added commnt next to the preferred = list_first_entry() assignment
  (Maxime)
- Added comments to new tests, describing what is being tested (Maxime)
- Replaced sun4i_hdmi_connector_atomic_check() with
  drm_atomic_helper_connector_hdmi_check() (Maxime)
- Link to v2: https://lore.kernel.org/r/20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org

Changes in v2:
- Switched drm_hdmi_connector_mode_valid() to use common helper
  (ex-hdmi_clock_valid()) (Maxime)
- Added simple unit tests for drm_hdmi_connector_mode_valid().
- Link to v1: https://lore.kernel.org/r/20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org

---
Dmitry Baryshkov (10):
      drm/tests: hdmi: handle empty modes in find_preferred_mode()
      drm/tests: hdmi: rename connector creation function
      drm/tests: hdmi: return meaningful value from set_connector_edid()
      drm/display: hdmi: add generic mode_valid helper
      drm/sun4i: use drm_hdmi_connector_mode_valid()
      drm/vc4: use drm_hdmi_connector_mode_valid()
      drm/display: bridge_connector: use drm_bridge_connector_mode_valid()
      drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
      drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate
      drm/sun4i: use drm_atomic_helper_connector_hdmi_check()

 drivers/gpu/drm/bridge/lontium-lt9611.c            |   4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  12 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |  16 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  21 ++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  32 +--
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 269 +++++++++++++++++----
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 102 ++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   5 +-
 include/drm/display/drm_hdmi_state_helper.h        |   4 +
 9 files changed, 371 insertions(+), 94 deletions(-)
---
base-commit: d80b5c5b9be6b2e1cdeaaeaa8259523b63cae292
change-id: 20241018-hdmi-mode-valid-aaec4428501c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


