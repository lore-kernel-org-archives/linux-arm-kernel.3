Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC4DD735E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 01:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0idVwC/Y8BowBuwoiQH15R6OW71zBvrSnYfglmGNHWM=; b=Piq1pSgtd28p3R
	E8Hx3RdImUi+uxz9bJ7hOfJOQj4DJIQCpi9/zJIE26KepeihZChEFvoV0Np5bfe1eIBLkvghy4sj/
	KRrapvIcwLJQv3+Qcp78mqSv+H2RinmpKyhJdebmw5/NspHpVF+nsk5dak3qNhLcWOfvmGUN4q6DB
	gO9Iw2jrdDrTuL9yMoqsV/7QO+wYOOyIWfaPdvdWDBi8firfTDUdB2HHCie5i6i3VFORsqvzM9ct0
	SRtGQtDRc2aO+FwXqUmU8mUHi2wlizWIUKAHn4mhVBM7GCEOHyhuEofMnGxjTBoWW9Q0L2NxVvhuJ
	qKHefIS/1qqbStyxkwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCfz-00000001Glk-2i6r;
	Sat, 30 Nov 2024 01:53:39 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCez-00000001GOn-3Vii
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 01:52:39 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53de6b7da14so2475594e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 17:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931556; x=1733536356; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0idVwC/Y8BowBuwoiQH15R6OW71zBvrSnYfglmGNHWM=;
        b=PhX9rCQ9Lsk2SDOwAQJZLdWzR4jogpKbJRKzEu6xsULKqjDvUrxCnZaE+KdCUCQF9Q
         WgHuGjF8Fpgu5kxnMOJqdBVCz/dmCPF7j3uVhNNDh0ocufjUTFvA/HIEE6PJFthVWxPi
         mZzufFEjLbW/3/L3yJmlAx2SJbxJ6GUGENtOGXKclHkQJ0IpH9kws1E0ClEhMfGY8WH6
         CxTKBqxgvz1vP66HBEGy20mD5kE38n13xl/ArfrlTTjt2FNm//ENS2oCKB5zQAFhDBl5
         4FefbSQ0fq8TpO+ntCKynq5fB4usfW1+lc9lQB/qpKPFbMOegBpRkpEBZIzZD/Jw5YjL
         uqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931556; x=1733536356;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0idVwC/Y8BowBuwoiQH15R6OW71zBvrSnYfglmGNHWM=;
        b=vm+GrZjQTnAjx8Xe8++Pp4EeIkHezCncTVIs7gKPFI1soMIY3VKlMNOTLlxWSuVeA6
         E3cyh1WwJogxtdE9/PYBQXCvKLe+IB7PmShnooK3YHxrz8cpD0RCqi/u1xq2BtWWNNja
         uq7ZCKea3aGLO8pTNH0VaGzBDNIDgWCaKgx2sKjnmRo57kwZeAANHZKU3PokVD6lq+SG
         G0NW0994Xa3/2q0P9e+H/uGXx6shi2/JCLPETq94ncvUt/JyS/AkDopFidVHzZILoEUC
         NwHSYMMDTrYrHj83J+hxq3BTspCvlbGjx8QFwqIdko9VevNghK6sJYJrNboFNgdhtHNn
         1LrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVvhdxay0eXGDE8ZDi2Q4qX116RZi9w8e27iWut1+V7lW4sv3uVcVXFYhW22PR2jvpvlMvqlH1AT6/4sO3jWK5@lists.infradead.org
X-Gm-Message-State: AOJu0YxunZzN6TjFx8aOA/dsPPOKtESds8sXifmAnMPGkxuCii/tmjLp
	5KMOXtZ8vrD3yGx5YGeCN29+++1Og5GDITYMueZLgI7nzI7bQjNhGPToXkPDKuk=
X-Gm-Gg: ASbGncuS4VENz513BR8NcAnXEzSMJ2crm63WkCGRKDo0R6ViLLNvP468UPmPRto830Y
	0scNteyYYYfd0NTVD3I+cEwxsiq/BQ8mo/geKTzuSmrNfkbEVQbTqbHEB/7zmwSfCigZB7LdDt9
	3MZ8kkzcJ+i56fZH0OeN+qYfbX1l3TmrFK2HPl1oNnfTP27TDH9aTFjlyLa0kM1MLq21sZMJYm5
	jNbZcFypfT5Z4wfQDc6rEFZ4fl8JDX6u9FdhMlIqKPA9+Jobr81V9FZig==
X-Google-Smtp-Source: AGHT+IEOzhXxDvsEIpRrEowV0sChYjq+QMeob7GWZCSiPE7ZrboRJzT4FPXckQ+mbro5wEegC/OfhQ==
X-Received: by 2002:a05:6512:3983:b0:53d:ed98:4a02 with SMTP id 2adb3069b0e04-53df0104907mr5269165e87.43.1732931555747;
        Fri, 29 Nov 2024 17:52:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 00/10] drm/display: hdmi: add
 drm_hdmi_connector_mode_valid()
Date: Sat, 30 Nov 2024 03:52:25 +0200
Message-Id: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANlvSmcC/3XNwWrDMAzG8VcpPs/FlpXE6anvMXbQYrkRtHFxh
 tkoefe5vazF7Pj/QD/d1MpZeFWH3U1lLrJKWmp0bzs1zbScWEuorcAAWmO9nsNF9CUF1oXOEjQ
 RT4jgO2MnVa+umaN8P8T3j9qzrF8p/zweFHtf/7eK1Ub3jCMxemPjcDzLQjntUz6pO1bgD6hCC
 0AFqMfBxwAmUt8A7hkYW8BVoHPoJ3C9N0ML4BMA0AJYAYjMSN7R5zC+ANu2/QImxQRYcgEAAA=
 =
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3211;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3VcAga3hvcMUfVcAzQwDqmHLVIM+9BjN897sk6QijEc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/fvjfE0CWcAXr9KSR9cTNBZ3DlIiCtoE4lG
 DpPQzmfhVaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv3wAKCRCLPIo+Aiko
 1RzUB/wKuFVuYYbaERg38SyUJLRDaSgm+9ilE3D1p5SZHbKeahca1eECRZpBzpaniztBSnOap7S
 MSK0Yi378KQfEPC9z94rCyPKien7YuxYQ5+z2YYUWpX9wt4Pa1pXVZw3T/2XBgzaLNEUln7VNba
 1i9PjTN+TqokVzguj2GlwmOZxc5nMYOR+VwTgwFPXq7Dwa76BvNgVBCIoU90ILFZLCHUbNhorYG
 f1v+uf60UGNOyqr2e/hTRVdZc8hXIVIvyYRpIMHshnVlN2grD9j3as8+mvJBxqPnhFyNOsmW9TH
 Cl4Af68b7Tlg7FUAswAYyfTd4Q7yG97X9zjgYQ7nzcl9Vj37
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_175237_891743_0A257B18 
X-CRM114-Status: GOOD (  13.05  )
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
Changes in v5:
- Fixed alignment after renaming the connector creation funciton
  (Maxime)
- Link to v4: https://lore.kernel.org/r/20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org

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
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  32 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 409 +++++++++++++++------
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 102 +++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   5 +-
 include/drm/display/drm_hdmi_state_helper.h        |   4 +
 9 files changed, 441 insertions(+), 164 deletions(-)
---
base-commit: 44cff6c5b0b17a78bc0b30372bcd816cf6dd282a
change-id: 20241018-hdmi-mode-valid-aaec4428501c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


