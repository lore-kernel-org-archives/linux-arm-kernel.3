Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89D1CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7J9gAExUq+Oz4yzs8pY69VKrstKlhFOaCqrIXbzFC7U=; b=F3z3wABu2zPo5+aWHafsivpbKX
	cC4AWCwNiQHyO9lhsy8soQvzqdUCxggG+OSSxHGIg1CXK0OxEVLRRFcdHuazdURWAbdT8t4RyAfGL
	DFKEAEc3XA4Ici99hWmEuPogLigyMLr7nUFduMuJeWMtQt1YLxzpFMFj0nel7qsImjKd5e2oD8Jvc
	WAKELkDzIIMNAn+Zdc6sa8aQAhTIUc0zWl3w72SDFV9II4ZaZhAWXUXq7+aqZ2/G4aGnLTruKFJ3D
	xW1M5l4er8JheMWsTvmqV5/LhmsSc/vcDhSPFK8HNr4AHImXau48e99N9sZA0edOYgZsNWeoGkdPz
	R5gpHwfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fV-0000000BfWo-2Kbb;
	Sun, 12 Oct 2025 19:23:45 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fS-0000000BfVK-0nUY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:43 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so668374466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297020; x=1760901820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7J9gAExUq+Oz4yzs8pY69VKrstKlhFOaCqrIXbzFC7U=;
        b=SuN5zO1pljtA2UdUXLvJSFbS/DDgjQAr6VDPgg1vaeLsG3xD24SldqGV3HzD+oPyuQ
         YT12JYP+fKZ9cjayHGg0YaGASNE9QiGa7RwPngJGARTI7GQ8/8xL82Ah1MdBhqMdSybB
         q8EUVs027jhUGnGEjIyry/z9tf7GjbPR1iwkULv8IsojtkPzW4eRwkYx2qfO33f5x2UX
         3GMda2DNNUdiI02N4Th2h3IOJrFH0H0pH5qkGmdZf0WPywccF5TPi36U6tKLXTrulsAk
         jwOgz/TryY0Z1Yf+jWYQ5+nNAjj0W9RNUOvxFWjJdwjVDJzvNKiquehxwSAzeXVwMo8V
         pffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297020; x=1760901820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7J9gAExUq+Oz4yzs8pY69VKrstKlhFOaCqrIXbzFC7U=;
        b=mPwzMf6Kv9gtFC31TTD5vfbyt6yruiFUpmql5r70EbV5ox2k4BC/gjZxahXlFXLxM1
         482LX58wvhqPwbbu9n9M9KUR/bSUhMg7FWnRq/DQwXZI6wNMrXL0Oz7LCCd+UvAVKRfg
         u1hZ5E4Q3WArDkJ9EBvH8XMMSc7VTO85wZCD5MQ4aItlc+RM4l7NH7NsASKVlpaVdPUd
         OQ+hcqWfHeB5qMTwRdHMMkY/Jro9Sqh+ZOcezK6yyRT/fd5MIDAodn1zubfvHOCxVFzR
         YS/iTLMpvbYhWFsD2dR5dA4XVVuSOasMphflQRqun0F73myL+fknMWHkB4sJgfAwYuQT
         LE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMdl8pVDBSjfyJplPifiiztc3pjsg9JL4/UKdHXyfuyz4rY44l5lOV62V04F4Dkbt7SeYkfj3xi32/bx1bWOj2@lists.infradead.org
X-Gm-Message-State: AOJu0YyUpAxdVdIQVXOkBa0nBpDb8sdw0JzOGfe0eXQexItykpd0xrhy
	vwGD2na14auObfokrSUgdfyDE9TehBEXcnpPUHJQC4y/1bSVPMckcO6L
X-Gm-Gg: ASbGncvo9IPU4l9lyRdVzzu9i6KLuadFKmef4UNdVpDo/4LMxlShiKmlad1AMXhN1xn
	nv7NuYhZXMJ7QYEmibeSED0zxTHjLDM+xeFnLFHbrZ/Cjq3709Rhy0sZTLhMMWQ2ANj2HyS7UfL
	atFIilKfd04jdP4O8PURwozYZvnFnH6ygEMZf/zWUuVx0eb3aawvIwzxuBasfvkiPPK4HLgnB1f
	Y07oca6JCcqzPiWwWkVPGTysRmAJq9fse9Cw1pwrH52SnT2ky++dZvTKwTGmC4tNyMKMJiatOTU
	BAgjzsX/iQ4s47ipl32kW6rXEjGwRh+6J1V8v/tIHMQALVmD5nnvMIPWGcQcVmKq9HWEjyEC5U+
	PzAstuTGNjrCtbCHKMsjQtw9lzKl9C09/MrxPBWBYuMi85UDiaczC8GtYtSilYNTV3A6lNSfwNc
	CYl548EmMymRK9s/Av4e0Te1o51W5968A=
X-Google-Smtp-Source: AGHT+IF/Uy/U1nByaSaW88fFTBwL3trPURZFYBw8aStQyXQaj4POBOaMIpn0nvPCtXBb63j96D2NZg==
X-Received: by 2002:a17:906:c1d1:b0:b50:b508:d0e9 with SMTP id a640c23a62f3a-b50b508d6d1mr1500404166b.46.1760297019654;
        Sun, 12 Oct 2025 12:23:39 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:39 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 00/30] drm/sun4i: Refactor layer code for proper DE33 support
Date: Sun, 12 Oct 2025 21:23:00 +0200
Message-ID: <20251012192330.6903-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122342_321037_D865857A 
X-CRM114-Status: GOOD (  15.30  )
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

Current DE33 support in sun4i-drm driver is based on my PoC code. It was
written with *a lot* of hacks, because it was never meant to be upstreamed.
Fortunately, DT parts were never merged which give us a chance to do it
right.

This is first of three series with proper DE33 support for H616 SoC. It's
the longest, since it prepares terrain for new drivers in remaining series.
Point of this work is to completely decouple mixer and layer code. Till
DE3, mixer and layers were intimately connected. However, from DE33
onwards, this is no longer the case. DE33 and upcoming DE35 planes are
shared comodity between all mixers and can be assigned in any way driver
(or user) prefers. This requires planes code to be completely independent
from mixer. The only exception is mixer clock frequency which is used in
VI scaler, but in that case mixer pointer is obtained through currently
assigned CRTC.

Second series will introduce separate driver for DE33 planes and adjust
mixer code to new DT bindings. Third series will introduce TCON(-TOP)
adjustments, HDMI PHY and finally, DT updates for several boards.

Current WIP code for remaining two series can be found at [1]. Code has
been tested on Tanix TX6, which has DE3, for any regressions and on Myir
MYD-YT507H board [2], which has DE33, with HDMI and LVDS panel outputs
running simultaneously and independently. This confirms that plane code
is properly decoupled.

Please review.

Best regards,
Jernej

[1] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/
[2] https://github.com/jernejsk/linux-1/commits/okt507c-v3

Jernej Skrabec (30):
  drm/sun4i: mixer: Fix up DE33 channel macros
  drm/sun4i: mixer: Remove ccsc cfg for >= DE3
  drm/sun4i: de2: Initialize layer fields earlier
  drm/sun4i: ui_layer: Move check from update to check callback
  drm/sun4i: vi_layer: Move check from update to check callback
  drm/sun4i: layers: Make atomic commit functions void
  drm/sun4i: Move blender config from layers to mixer
  drm/sun4i: ui layer: Write attributes in one go
  drm/sun4i: vi layer: Write attributes in one go
  drm/sun4i: mixer: Remove setting layer enable bit
  drm/sun4i: de2/de3: Simplify CSC config interface
  drm/sun4i: csc: Simplify arguments with taking plane state
  drm/sun4i: de2/de3: Move plane type determination to mixer
  drm/sun4i: ui_layer: Change index meaning
  drm/sun4i: layer: move num of planes calc out of layer code
  drm/sun4i: ui_layer: use layer struct instead of multiple args
  drm/sun4i: vi_layer: use layer struct instead of multiple args
  drm/sun4i: ui_scaler: use layer instead of mixer for args
  drm/sun4i: vi_scaler: use layer instead of mixer for args
  drm/sun4i: layers: Make regmap for layers configurable
  drm/sun4i: csc: use layer arg instead of mixer
  drm/sun4i: layers: add physical index arg
  drm/sun4i: vi_scaler: Update DE33 base calculation
  drm/sun4i: mixer: Convert heuristics to quirk
  drm/sun4i: ui_scaler: drop sanity checks
  drm/sun4i: mixer: Add quirk for number of VI scalers
  drm/sun4i: mixer: split out layer config
  drm/sun4i: layer: replace mixer with layer struct
  drm/sun4i: vi_scaler: Find mixer from crtc
  drm/sun4i: Nuke mixer pointer from layer code

 drivers/gpu/drm/sun4i/sun8i_csc.c       | 113 ++++++-----
 drivers/gpu/drm/sun4i/sun8i_csc.h       |  16 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 217 +++++++++++++--------
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  64 ++++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 183 +++++++-----------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h  |   7 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |  44 ++---
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.h |   4 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  | 244 +++++++++---------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h  |   7 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  51 ++---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |   6 +-
 12 files changed, 474 insertions(+), 482 deletions(-)

-- 
2.51.0


