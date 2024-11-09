Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129B7D5E368
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 12:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7v2ALFBdYjyZ6sFyb9Y/ee0T/VtMhjtKVZbW5icBGMM=; b=H23QexAWt2H5bs
	BBGpioeaDr6/O+bV7ZqUTFGpZccy+xDhYSBNVCDOejiFyE9HDNUvNcXS1K19dhuOteeAATsYOpnca
	OKo8MWPBlW3g4Nw/kQC6emgj32+AdkWyzRR6zfyswnuZRRkwM7W8mbOq3Cqg2s6kQISi6RVYMwY+r
	b6Qdy7IpM/D6n0Cj8G4iTjAlbD2+zs0v0jaTf3uHTsEO6/2r7DuFU/64voJs98dOEDcWeXQGJrbiW
	sR5b4fTTKuIAxQl5gt7ZDozz6xv8OZP7o2lhLzSnqGm0Xs4K0gdxcs03R8f/locPh2XoE/J+rUfQq
	1cEAhQ8yj0PVqMpn9JWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kiF-0000000DJYb-2mDS;
	Sat, 09 Nov 2024 12:37:11 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kgO-0000000DJ1t-34y5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:35:18 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539f72c913aso5337309e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731155714; x=1731760514; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7v2ALFBdYjyZ6sFyb9Y/ee0T/VtMhjtKVZbW5icBGMM=;
        b=YgiSaCrMSTZZ2CljyGzpAwCKqTBeKtytVecfYHOmIu5/4Fw64hq0Q81n0LzEcxe76e
         SDPPM1UHqxncbfG7xElHn0EdD6cuZstvwwbl7w8ZxQCzkBtYK84s3P2bUG27QwLIsEww
         aiVVZTqxjWtipJsz839nF2g11StXMwOkRvlBXcQEoOwUo/xjQX98M+zkIh5akdga5srp
         cewe4uF76GAEbmwebiVzALqMbzmKT/Wd35DPuUtsjTIO2EKCDKMHvOgj91mG3H0dl3HE
         E+iEF+5FfLqLE0Z6wFcD5Ho6TB42AAmGt73p1B9234qo9cB4pQhdyGmylYHamdYisQqh
         ECCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731155714; x=1731760514;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7v2ALFBdYjyZ6sFyb9Y/ee0T/VtMhjtKVZbW5icBGMM=;
        b=dlf97fuNcp/vP3jGLPw0Y3jKWJNjgw39H3lxJuVjn8DJHP02s3dRAtgO1gHM2zngTD
         53bLWG4/sXVgOJloOEohVRhNC9cXX9QA/pjTFto1shGZphpkdY7kZpRTGiiGTUGdevYR
         hlPTwxBUC8Cm5QFfymUHIP9+j0JbhFXC5GGQTqKQC828HjHseiLZFsKbiI2HbmBYZMc9
         T49aZwDzJ3+bfvu80pDVTfIsVeKCys6qsVUYhos94ckS+a7zSRb29LO78tA52Rw9rEtl
         eeTa5hRQz+VdGsb3cHUnDzX7XJROfUGjx6nSbB9reb/iKIIqncRiGe5IsyU1Oq2cQT7Q
         vTTw==
X-Forwarded-Encrypted: i=1; AJvYcCWBfBdbabVt5/k4iIqr07GABI128OlPhYxbPQwMqEV+XkESjYZJyaI3ZHVF0/h2F1lLAXgUNd6wAgc1hCdnMD9O@lists.infradead.org
X-Gm-Message-State: AOJu0YyUEidCpHlUqZbfCYat7ewsq6BRXJsE/46O1uRQGW1TMVnjMxMW
	l8NVAeOHc/dfQXIlyTY5GcEasqaC9r4AbUHZ5BTaKkLJ3qpPzBFdhrUh2veIm+o=
X-Google-Smtp-Source: AGHT+IFSDYeqaLjyC9aeiFIrpSqYeLJzWS5ech99oMz9O52R0aPaOJVtYR5urSo+K9hUQ7SDK0W5Xg==
X-Received: by 2002:a05:6512:3e01:b0:539:eb82:d45b with SMTP id 2adb3069b0e04-53d862f817cmr2360079e87.56.1731155714283;
        Sat, 09 Nov 2024 04:35:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:35:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/7] drm/display: hdmi: add
 drm_hdmi_connector_mode_valid()
Date: Sat, 09 Nov 2024 14:35:04 +0200
Message-Id: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPhWL2cC/3XNQQrCMBCF4auUWRtJYmyjK+8hLoZm0g60jSQSl
 NK7m3YjIi7/B/PNDIkiU4JzNUOkzInDVOKwq6DtcepIsCsNWmqjpLKidyOLMTgSGQd2ApFaY7Q
 9StVCubpH8vzcxOutdM/pEeJre5DVuv63shJS1GROSMZK5ZvLwBPGsA+xgxXL+gMU4RfQBcDaN
 NY7LT3WX8CyLG+YQFG18AAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2383;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2fV2XD25ut5vTGewFjeEo8rNWtU13M/szPG8t2HvEoA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7p+2L/f+UEK3NVbN5T87r6we4/e+47HjzdUh8R2Rpl41
 ljN4GDpZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEdvey/6/rZXqxJ3yT/vWl
 Sal9CQ/l8xMDBRcJZ5ncmPFSXl466RQ7E+uc5Su+3jC8paB2oMG53dq2ZHosq1ZdfGqNw4Td+k+
 bNzz1LtvQmHu23k3xn9mEIwcPa7K1c9427l1rm6Cxt6NZTvi8s9eEWhfFtqjtbRYXhTIu8SjpVt
 X831v+8Wx7hHTM4Q07L7h/Snf4fO7197Y7+mdstb2vq27hCvZV2ePNt+F/2qInFieUeXf1shzp8
 0+3ilfZ+ND/Uuk82+PTt4QVaHtJKkrcLDdMWl7AsmhRLutHLpbpJt/ZFx9w+5C8yNs44MwXnomv
 FDYovd7jWd4Sa7WvkZlnoa99vvoFtgqbn5YKyQ8TQzgB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_043516_822423_7BAB133A 
X-CRM114-Status: GOOD (  11.12  )
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
Dmitry Baryshkov (7):
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
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  21 +++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  32 +---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 181 ++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   4 +-
 include/drm/display/drm_hdmi_state_helper.h        |   4 +
 8 files changed, 228 insertions(+), 46 deletions(-)
---
base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
change-id: 20241018-hdmi-mode-valid-aaec4428501c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


