Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156FAD149D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D8BkQHxl/jl98jZceXhfQCyyW7/L0TBeWdJpzjggPMw=; b=KWJULfnkSQl2Yw
	KJjT2t9YDbOQxBAq9/6J7VU69BLOUijChI3EReWXBLKa0pd+sCexnFuFeopbu0Mcv5AjBpqtlrSxA
	ziBuS9YsaP/4bSQvrsY01Ng/tOeb+p0IQC+t+hYbO7Ap8Wi2sHSvP63tTR2lhyRVt3U6Wty/lF7g0
	CqnKyqvhoneCoL4o73oth4h6U0fLoaMINgMy392ayUicGxBbKvBi+KkQV5tGyO1KDZDHkFm5NOHLn
	63uwcbab4jpA8X2lLwrzBLVZd3W8MDP2gPG/eGq6psHz0fz+HJj8aDS8I5QJqxhoIpHgyMJgNQOVf
	k4uQuMj1YjSlzpvG/W8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nwp-00000004YfP-2NBK;
	Fri, 25 Oct 2024 17:18:03 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nus-00000004XkS-3wNo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d51055097so1492540f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876561; x=1730481361; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D8BkQHxl/jl98jZceXhfQCyyW7/L0TBeWdJpzjggPMw=;
        b=Vs+YA3NAdAOpGFZa5xkLlWYztqFCa7M8VaYtwiwZiUcIPm0O0X2gGfYS1TmGekyipJ
         ZHishK5pMpk8J1h296OGAFZYar1jyRBtvXrI/z9taVgH2iCiN0v+UUYIspTdluM2qDxP
         DRiQoOs9AsO8cEw4P90A1gNbg+uwlZfDfJkwXIfwi9tr2Nc0qZUNJGD5ylRy2GjkRGiY
         LxpuCZLvYSywCG7R2CDPqvEpb/0qjyqTLmFoXSXnpu7ez/5Q8d49fWyG4Cqx1KojJyWm
         xKRITds4iA0VFNSJOKwvWgt2L1gzjxWrPTAMa064bVJaJxrr2M9g9UlQlCJyahxCVMRS
         rEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876561; x=1730481361;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8BkQHxl/jl98jZceXhfQCyyW7/L0TBeWdJpzjggPMw=;
        b=pS79O0WEIEnANgs9MLatiJCqCL/opMSC2YziJkLULZ2T0nXePaHbrNw9hguuYlTW2a
         94BOYtab6FaLEDcBPe1y2WMg/59AxtQt3enoGRLRFp1aAg6CJYhMwwUqfSzEHh9U4M2x
         igsdUzCwjqUy64Zw9DB7WlkuM7FgC1hlpR0shjsAQIcjg1KLcAfluci77L5ojNY04UBk
         bxcSmT1ekSHMfQUEgQI/4/50WDe0WTMgZdVp5qIaiQ2QSswI3ZA1XkeRbuAgpDTdbaQf
         frXCTmlYvU5isnKS9ZqGanWiuwQSXQ93VPB4fMCbL8fAdWWhowYXY/YYhSyncrNibgk1
         x89Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPHAXbxB+u6enjHI04wzaXVAoljs6lqlE1qCX6KiChQylxBvtvl8O/pFEsrSip2pfY38Gi5p2kXLkw3/20vS4h@lists.infradead.org
X-Gm-Message-State: AOJu0YwhYt/BNPaqVogRaVQQ8wLQWrvTYp3W1iXTn8esJHOgKLGKb+E0
	qti+9CFsZCeOjx4tZItWq1yD1YMaRkp61aEV9mdHv9zp6ZaZ73h0a2e1zr3rvJE=
X-Google-Smtp-Source: AGHT+IFmFpJPOGOxqboe3FSCJG1p90kkm0iTmlWq/Ni/uCdlNc+9cgBNSEFM0DbQDQceCqmCnrSi6Q==
X-Received: by 2002:a05:6000:11cc:b0:37d:3650:fae5 with SMTP id ffacd0b85a97d-380611f5202mr113855f8f.52.1729876560748;
        Fri, 25 Oct 2024 10:16:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:00 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 00/36] drm/vc4: Add support for BCM2712 / Pi5 display
 hardware
Date: Fri, 25 Oct 2024 18:15:31 +0100
Message-Id: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTSG2cC/22NQQ6CMBBFr0Jm7Zh2ChJceQ/DorZFuoA2U2wkh
 LtbiUuX7yX//Q2SY+8SXKsN2GWffJgL0KkCM+r56dDbwkCCaikEoeUJs6mRWkmYXjEGXrDTVpG
 6OGX0AGUa2Q3+fWTvfeHRpyXwerxk+bW/IKn/wSxRoDSGbNN0dSfaG+sUH455jf5swgT9vu8fY
 xbB6b4AAAA=
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_101603_072410_6842C7C0 
X-CRM114-Status: GOOD (  18.34  )
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

This series adds the required DRM, clock, and DT changes
required to support the display hardware on Pi5.
There are a couple of minor fixes first before the main patches.

Many of the patches were authored by Maxime whilst working
for us, however there have been a number of fixes squashed
into his original patches as issues have been found. I also
reworked the way UBM allocations are done to avoid double
buffering of the handles as they are quite a limited resource.

There are 2 variants of the IP. Most Pi5's released to date
have used the C1 step of the SoC, whilst the 2GB Pi5 released
in August is using the D0 step, as will other boards in future.

Due to various reasons the register map got reworked between
the steps, so there is extra code to handle the differences.
Which step is in use is read out of the hardware, so they
share a compatible string.

Thanks!

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v2:
- Collected Acks and R-b tags
- Dropped patch 1 "drm/vc4: Limit max_bpc to 8 on Pi0-3". Already fixed as
  noted by Maxime.
- Fix unintialised var "mux" in vc6_hvs_pv_muxing_commit.
- Fixed uninitialised var "reg" in vc4_hvs_cob_init.
- Make bcm2712_mop_data and bcm2712_moplet_data static.
- Removed the "disable_turbo" line from the struct in
  raspberrypi_clock_property
- I'm confused by the CI error "performing pointer arithmetic on a null
  pointer has undefined behavior" for PCI_IOBASE as I'm not using it.
- Link to v1: https://lore.kernel.org/r/20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com

---
Dave Stevenson (11):
      drm/vc4: Use of_device_get_match_data to set generation
      drm/vc4: Fix reading of frame count on GEN5 / Pi4
      drm/vc4: drv: Add support for 2712 D-step
      drm/vc4: hvs: Add in support for 2712 D-step.
      drm/vc4: plane: Add support for 2712 D-step.
      drm/vc4: hdmi: Support 2712 D-step register map
      drm/vc4: Enable bg_fill if there are no planes enabled
      drm/vc4: Drop planes that are completely off-screen or 0 crtc size
      arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT
      arm64: dts: broadcom: Add display pipeline support to BCM2712
      arm64: dts: broadcom: Add DT for D-step version of BCM2712

Dom Cobley (3):
      clk: bcm: rpi: Add ISP to exported clocks
      clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
      clk: bcm: rpi: Enable minimize for all firmware clocks

Maxime Ripard (22):
      dt-bindings: display: Add BCM2712 HDMI bindings
      dt-bindings: display: Add BCM2712 HVS bindings
      dt-bindings: display: Add BCM2712 PixelValve bindings
      dt-bindings: display: Add BCM2712 MOP bindings
      dt-bindings: display: Add BCM2712 MOPLET bindings
      dt-bindings: display: Add BCM2712 KMS driver bindings
      drm/vc4: drv: Support BCM2712
      drm/vc4: hvs: Add support for BCM2712 HVS
      drm/vc4: crtc: Add support for BCM2712 PixelValves
      drm/vc4: hdmi: Add support for BCM2712 HDMI controllers
      drm/vc4: txp: Introduce structure to deal with revision differences
      drm/vc4: txp: Rename TXP data structure
      drm/vc4: txp: Add byte enable toggle bit
      drm/vc4: txp: Add horizontal and vertical size offset toggle bit
      drm/vc4: txp: Handle 40-bits DMA Addresses
      drm/vc4: txp: Move the encoder type in the variant structure
      drm/vc4: txp: Add a new TXP encoder type
      drm/vc4: txp: Add support for BCM2712 MOP
      drm/vc4: txp: Add BCM2712 MOPLET support
      drm/vc4: Add additional warn_on for incorrect revisions
      clk: bcm: rpi: Create helper to retrieve private data
      clk: bcm: rpi: Add disp clock

 .../bindings/display/brcm,bcm2711-hdmi.yaml        |   2 +
 .../bindings/display/brcm,bcm2835-hvs.yaml         |   5 +-
 .../bindings/display/brcm,bcm2835-pixelvalve0.yaml |   3 +
 .../bindings/display/brcm,bcm2835-txp.yaml         |   5 +-
 .../bindings/display/brcm,bcm2835-vc4.yaml         |   1 +
 arch/arm64/boot/dts/broadcom/Makefile              |   1 +
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |  37 +
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  42 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 188 +++++
 drivers/clk/bcm/clk-raspberrypi.c                  |  33 +-
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |   8 +-
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     | 106 +--
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  96 ++-
 drivers/gpu/drm/vc4/vc4_drv.c                      |  19 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |  54 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 107 ++-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   4 +
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 | 640 +++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                | 217 ++++++
 drivers/gpu/drm/vc4/vc4_hvs.c                      | 737 ++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_kms.c                      | 105 ++-
 drivers/gpu/drm/vc4/vc4_plane.c                    | 866 ++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_regs.h                     | 297 +++++++
 drivers/gpu/drm/vc4/vc4_txp.c                      |  91 ++-
 include/soc/bcm2835/raspberrypi-firmware.h         |   1 +
 25 files changed, 3461 insertions(+), 204 deletions(-)
---
base-commit: 3ae80b375739495e36fc6143ff27716fe390a13e
change-id: 20241002-drm-vc4-2712-support-9ad3236e3caf

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


