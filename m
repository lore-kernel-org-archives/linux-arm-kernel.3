Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825A6CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 06:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=su7U2CceZXD6mEz8ItmrZ6WCGP9Vn5IoVvW2JAEM0p0=; b=SX9mNhnCLoztDUYS/FdtoCu9pj
	Q68/5EMkQSSl091pISAMYjte130vvqm1VpJXNWB1y+DIMXk8rLY5rxxZ+O2aJ8kYtHHuvbIDoa5LH
	+lGD/HWhjZvPr1Kkf3uJHCelUsa+G/HgRQnbao153tcWJQ17+fGD7BsKEati7eFYIWxPeIGFix5w4
	k+O8gcgZgdPNyvwQozFbO5heTYAFLyJgavNxxLf0zxMtmvDf1mCUeo9NXpDejZk9xb3dMGzLkNkuA
	36PDxZFqf4ypxj3QwpwN5frakammn68yj2swoAizgIMSU0vskgWXDa098Xa8WYMw18XdKOd1LW97v
	QMz+Df0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ19C-0000000Dhyh-0n51;
	Mon, 15 Jun 2026 06:50:14 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ199-0000000DhyF-3BtR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 06:50:12 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-137eb0d76beso2643953c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 23:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781506211; x=1782111011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=su7U2CceZXD6mEz8ItmrZ6WCGP9Vn5IoVvW2JAEM0p0=;
        b=Zv/Nl+iqiwfvRddUinspnvPKhqijtydFJmrX8i8LC/sr68Ag4/Ii4JS6Z5Hb4XCGUS
         l4UyTdKk2NN2iy9QZb6Atc4FiQPDbCOG8Er6zTMRDmUCowEO1iUAAM2jTU/70C7DG6hR
         tGoOwH9wPBI4y6MXfk1YyuByyDwGj1qr+4P85mQS6yngc+YeJx2oFaHgJ7x3zDlKDSmh
         3HZy1kDs4j9LlEoQlfxYjZMNH3t2ZIefwpTQsuAr8VPah104JkDVR/aTPst/Jmg4zT67
         Rv9vLP4vGgAwkbxxbnDBZHbDhSUtfr8AbQJil8hrDByQjjy9oAqyoIxw3Gv/dgKfIGmW
         B75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506211; x=1782111011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su7U2CceZXD6mEz8ItmrZ6WCGP9Vn5IoVvW2JAEM0p0=;
        b=kbTjXOKis6okTTHxTSmLEVodKlQeIkeOx1GCKziW8f1PrT9oHpmVSKs/BUPiPMweVj
         BFMZgyB2c+188W22OIlZF4DIEvCr9Gxw5wr0lRi9J9IpQM+cNHXPzo/uWAnmMtIsUvOI
         9PiuPXn/Iu2B3MgxC7m5gqI/M0CTL+N1xEoIG1g+QBiYN4/gqcqnShiy04uFvGe0h8dT
         zZ1WmUGptFc1dtZEN75CGt49KlmaSn8uQDDc3KKbAhPs3cGfcGloo1iWpC6YpQu9rk5Z
         EGBqpaHGu/aXjYAssUXY7mTQhEUSfEgaIb4PIdsI1GNakoNvIbzvzQ0XrVE5pAnX1rYl
         3KGg==
X-Forwarded-Encrypted: i=1; AFNElJ/riYnEq0c6EiACDKSCWwKbWlipCDZGTtgbDhA9YjgpBhdjTx9gMbNugTpKAWUQyecPYF3VtD0eBmGM4/m6MZJX@lists.infradead.org
X-Gm-Message-State: AOJu0YxESbpvIU1/nUY+9E1YsKcNxCc9xwg6brIQVczv/zpAB0QPbSM6
	9Cnol5hzNOh2YoOTmAIwxNsMwl3AHM9koSQ+eqgeyeM6G8y66Jxw6MiU
X-Gm-Gg: Acq92OGa6gePC+yw+boCDBkC1Wd/9w+ErPsDTcRsW2hCA89xNI8A45pUbDlvCpJiFnP
	MOfxB8sX5pk4SBVWFUGTqyewVs977MIwpb/BZqSssxL+LL9O0tJAjEm/vzg3Qpa8dm1aW5QoBWl
	P15lEFzqoTlXaaHEZJgOu3IASrqir+2S1rMTcHyXUfGMR3alndT6x+ep/7Hm9/eJiKuXAG9lotB
	LGkjBLfA9gSaXKDTwrBsp0cDBoZt5vh5p9B/Bmx829yb6k6yC49YQW4btZ8+YrWvgLDBkNBlI12
	3MHSRYVTkHFGVFcgIRz/ETrUBLTfrzq9g3FpTPgf89BrBFtuixqrE5F1Jd0MbwaIstfnW8ew/HE
	MScCyBuItPxM6MP+Qm04lc125GY+4ow1O8OugV+o0A719x6YRdhTtxW3xQc0wVUlWYGG+mSwqsP
	DvCs3SvHddeTZ113WMLUNMHKO9mHcCXak6FjQezx/2xrAKu7oR27w0GfRX84bF8PwLJ2nnmI6Zh
	7yvrX9ncCs7
X-Received: by 2002:a05:7301:9f09:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30820c2d782mr6607439eec.6.1781506210508;
        Sun, 14 Jun 2026 23:50:10 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm13516812eec.30.2026.06.14.23.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:50:10 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v4 0/6] drm/verisilicon: add Nuvoton MA35D1 DCU Lite support
Date: Mon, 15 Jun 2026 14:49:57 +0800
Message-ID: <20260615065003.76661-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_235011_832715_DE538792 
X-CRM114-Status: GOOD (  19.88  )
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

This series adds support for the Verisilicon DCUltraLite display
controller as integrated in the Nuvoton MA35D1 SoC.

The Verisilicon DC driver and its DT binding were originally written by
Icenowy Zheng <zhengxingda@iscas.ac.cn> for the T-Head TH1520 SoC, which
carries a DC8200 IP block.  The present series builds on that foundation
with gratitude to Icenowy for the original work.

The DCUltraLite is a different variant in the DC IP family.  While the two
IPs share a broadly similar register layout, a number of differences
prevent the existing driver from working on the MA35D1 without
modification:

  - No CONFIG_EX commit path: the DC8200 staging registers
    (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT, FB_BLEND_CONFIG,
    PANEL_CONFIG_EX) are absent.  The DCUltraLite uses enable (bit 0) and
    reset (bit 4) bits in FB_CONFIG for direct framebuffer updates, and
    requires a per-frame VALID bit toggle (FB_CONFIG bit 3) to latch
    configuration changes.

  - No PANEL_START register: panel output begins when
    PANEL_CONFIG.RUNNING is set; the DC8200 multi-display sync start
    register at 0x1CCC does not exist.

  - Different IRQ registers: DISP_IRQ_STA at 0x147C / DISP_IRQ_EN at
    0x1480, versus the DC8200's TOP_IRQ_ACK at 0x0010 / TOP_IRQ_EN at
    0x0014.

  - Simpler clock topology: two clocks ("core" bus gate and "pix0" pixel
    divider); no axi or ahb clocks required.

  - Single display output: no per-output indexing beyond index 0 is
    needed.

  - Hardware-discoverable identity: the DCUltraLite exposes chip identity
    registers whose model field reads 0x0 (revision 0x5560,
    customer_id 0x305), allowing the existing vs_fill_chip_identity()
    path to identify the variant purely through register reads.

Patch 1 generalises the verisilicon,dc DT binding to accommodate the
Nuvoton MA35D1 SoC-specific compatible and the variant's two-clock,
one-reset, single-port topology.

Patch 2 adds the register-level macros needed by the DC8000 ops.

Patches 3-5 introduce the driver changes in three logical steps: the
vs_dc_funcs hardware ops vtable with DC8200 ops extracted into
vs_dc8200.c; the DC8000 ops in vs_dc8000.c with the necessary
clock-optionality changes; and finally the DCUltraLite HWDB entry that
gates hardware recognition once all support is in place.

Patch 6 adds the Kconfig dependency on ARCH_MA35, placed last because it
is only meaningful after the HWDB entry is added.

All patches have been tested on Nuvoton MA35D1 hardware.

Changes from v3:
  - [dt-bindings] Reverted extra space before inline '#' comment.
  - [dt-bindings] Moved clock/reset items descriptions from the top-level
    clocks:/resets: into the per-variant allOf/if blocks; kept only
    minItems/maxItems at the top level.
  - [dt-bindings] Restored full items lists for clock-names and reset-names
    at the top level with minItems so names are still validated.
  - [dt-bindings] Added minItems: 1 to resets: in the nuvoton block.
  - [dt-bindings] Added required: [resets, reset-names] inside the then:
    block for both thead,th1520-dc8200 and nuvoton,ma35d1-dcu.
  - [dt-bindings] Added minItems: 3 to reset-names in the thead block.
  - [dt-bindings] Added maxItems: 1 to reset-names in the nuvoton block.
  - [dt-bindings] Reverted unevaluatedProperties: false back to
    additionalProperties: false.
  - [dt-bindings] Removed the second DT example for nuvoton,ma35d1-dcu
    since a difference in clocks/resets does not need a new example.
  - [ops] Renamed bridge_enable/bridge_disable to panel_enable_ex/
    panel_disable_ex.
  - [ops] Renamed irq_handler to irq_ack.
  - [ops] Renamed plane_enable_ex/disable_ex/update_ex to
    primary_plane_enable_ex/disable_ex/update_ex.
  - [ops] Renamed vs_dcu_lite.c to vs_dc8000.c, all internal functions
    from vs_dcu_lite_* to vs_dc8000_*, exported symbol from
    vs_dcu_lite_funcs to vs_dc8000_funcs; updated Makefile.
  - [kconfig] Moved ARCH_MA35 Kconfig change to a separate final commit,
    placed after the HWDB entry.

Joey Lu (6):
  dt-bindings: display: verisilicon,dc: generalize for single-output
    variants
  drm/verisilicon: add register-level macros for DC8000
  drm/verisilicon: introduce per-variant hardware ops table
  drm/verisilicon: add DC8000 (DCUltraLite) display controller support
  drm/verisilicon: add DCUltraLite chip identity to HWDB
  drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms

 .../bindings/display/verisilicon,dc.yaml      |  80 +++++++++++--
 drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
 drivers/gpu/drm/verisilicon/Makefile          |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +---
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 ++++++-
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |   1 +
 drivers/gpu/drm/verisilicon/vs_dc.c           |  13 ++-
 drivers/gpu/drm/verisilicon/vs_dc.h           |  33 ++++++
 drivers/gpu/drm/verisilicon/vs_dc8000.c       |  78 +++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc8200.c       | 107 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |  14 +++
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +-----
 .../drm/verisilicon/vs_primary_plane_regs.h   |   3 +
 14 files changed, 368 insertions(+), 61 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c

-- 
2.43.0


