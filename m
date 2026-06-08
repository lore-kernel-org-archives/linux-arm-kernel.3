Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AF6CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 02:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QgcMG5nFEAs89H2OIuVhEyONVcKyhkh1xoo32LhXMAQ=; b=UimXf8gxya2+dbA0KdgURvw9fF
	IIc5fEGlUDbj1C6ZpeeQHHAKOHdQFJvwjkSeky4TBkFhOCcVLB465KkNVRzS3KUUMoHrjw3R1iPDH
	AAFX9kIWW5K4nhFqO2luUuhVsDk5YqqDvdIOJVDDQznLoGA6UxoNsCfqLpRJff07ei/zw8/Ip3Jfv
	uSy8eAIx2C8A/6DC9vjK/Z+vNwt6UfVEDMZqL2q/XBLrxVvI3yj530EcS9ag4YsazOn8E8SZNm7R5
	AHOvXwlP3vacAjvbLynXNQBQcHLzMoYcpcRTbE2kOxQqMEry0E67ZZfh6HOgMrBCooK5igF+B8xf+
	Npf4oj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPnE-00000002j15-0Z61;
	Mon, 08 Jun 2026 02:32:48 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPnB-00000002j0g-1dxZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 02:32:46 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c0c35980fdso38385895ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 19:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780885964; x=1781490764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QgcMG5nFEAs89H2OIuVhEyONVcKyhkh1xoo32LhXMAQ=;
        b=bXwcnSP6QPUOXoLdZUroXBzhpYLgSZtc0ednSJ0sQOU8RLuTLK/WntDcnYVLb74HW6
         fCYlBG6yS61Bo4IRWv82BI20indeHyWRaUp4jSj4LJ4b9lxsDKSNscaAKkPCacgcqU4t
         9xzQbeUBOO0JJzsXAgGOL8L4xOWba/abRcyfTxTq/pOCehNca9Oh6hrV9gjrATeVCdmg
         Rb3KL4wPLK4gQ5G4iWg7gjys0ZSHWKaZV0C2TnEL+cRUvJEFIrgRQztZxPe21v/iSNNE
         WQ2dLXGjmqOwHCLaxHp5W45KX0HpbJmO+nMVBnj6XWa0dCir7aUpEGuJ64ovEqB5GiJ7
         tdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885964; x=1781490764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgcMG5nFEAs89H2OIuVhEyONVcKyhkh1xoo32LhXMAQ=;
        b=CVJX621ErbtqwH3Eei5DkLHyVPGv9vdaeHpzhVydQOUdjLOeQ5bIujXHIpBG7l2wBn
         n+tWoSyCOY3yryWzaTxgC5WSytdQAgJ3LMaVGPhwTwbEjDo9Kn6MvE4iz+SM8NHBeWQU
         xsD2f4YEN5fmb/AKgp7mNnVtBhtnmkyEmQFGCRlAL6++u3/AQeJigQfO2xCp/LaijzTt
         qo+3hG4QRDvq6zTcdLyoS44/hTXQWBca5E6EakpVPBwokbYdPRuyZvizvyml0Tq55NWB
         a5kZuhDIiBNWz8gtKI+a9OljQLSg6BKSaud3kaLbNyjKmo4KBUP0tANXuZWxqCOJ42AE
         t8Uw==
X-Forwarded-Encrypted: i=1; AFNElJ+G/XoPK8xgjwT1PhO9bWnePHM3AsDOAgrQBbBa1uoTNKiI/JBBcSBTJ1uT7+KtxUr0koXEZ/gIa/muncuwkXKS@lists.infradead.org
X-Gm-Message-State: AOJu0YzuAEXVqJeyWid4w470v7/1s+6NSdWybiI4lQP5iNMkeaiHtX70
	cSRclM0UbSzcmV1a+DxNPacCM1xvO2UX0Thg/SgP6tTvH4bpTeU/c6OW
X-Gm-Gg: Acq92OEpLJTpGrN3Pyzg7u8OunvPxdWF1qegm2yG5Dllojc22IaX2AEu0dSOAxlzUes
	H+wSbyTzJ8IYJguibwxYM8aMpx7b8oXk+w8fkrsYmN5/uIt0qLR+r72W5xK/EsYJUGIvGGlNIbG
	sbAiyxPxqtF2I2UabiHZ0fyk/ufFMuzl1DizJuwyXS3ahwtvGPGKygJRttqtqDVVyAp4mUNXOzp
	0dGF36qF7eJgqiiuwY8PYdS4sO5DbAnsH3JtXBAtboR2EnM7IOwOzAGmUbD8oqv/zbEqGtwHyt7
	GeUMSg2VfKU1L2+sWNy7RtkW3g2mjMMvGksBFoRqnrG9WU9CRaTZaSIi2qGKDbzXSiXQ1YEluZL
	SrpnnB5Ti9shIutqlCWV/xo9C9/hfpSrJujYmy4Du+I7jUBh8umfRHkVn68zRM3n4Fcvp12DxsB
	6r56ROlv2mVGC4sUluOgH+o0gy1IV/r9ZafDsq5Tk6WRYUtwEDOFx+qZylz5fCPFSl/KNQyo/fs
	x/Asi2JaD18S7aQ4LgjH2M=
X-Received: by 2002:a17:902:ea0a:b0:2c1:564b:4f47 with SMTP id d9443c01a7336-2c1e8495453mr161310405ad.26.1780885963925;
        Sun, 07 Jun 2026 19:32:43 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c245dd3b5dsm38143485ad.81.2026.06.07.19.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:32:43 -0700 (PDT)
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
Subject: [PATCH v3 0/5] drm/verisilicon: add Nuvoton MA35D1 DCU Lite support
Date: Mon,  8 Jun 2026 10:32:32 +0800
Message-ID: <20260608023237.305036-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_193245_443946_8224274D 
X-CRM114-Status: GOOD (  19.17  )
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

Patch 2 adds the register-level macros needed by the DCUltraLite ops.

Patches 3-5 introduce the driver changes in three logical steps: the
vs_dc_funcs hardware ops vtable with DC8200 ops extracted into
vs_dc8200.c; the DCUltraLite ops in vs_dcu_lite.c with the necessary
Kconfig and clock-optionality changes; and finally the DCUltraLite HWDB
entry that gates hardware recognition once all support is in place.

All patches have been tested on Nuvoton MA35D1 hardware.

Changes from v2:
  - [dt-bindings] Replaced standalone verisilicon,dc compatible with the
    SoC-specific nuvoton,ma35d1-dcu added to the existing enum list,
    paired with verisilicon,dc as the generic fallback; this matches the
    thead,th1520-dc8200 pattern and was explicitly requested by the
    reviewer.
  - [dt-bindings] Removed standalone 'port' property; kept 'ports' in the
    global required list; MA35D1 example now uses ports/port@0 structure,
    following reviewer feedback that a 'port' alias should not be added
    since DC8000 (single-port) also supports DP output.
  - [dt-bindings] Replaced additionalProperties with unevaluatedProperties
    to allow per-variant if/then clauses to add constraints cleanly.
  - [dt-bindings] Added separate allOf/if block for nuvoton,ma35d1-dcu
    constraining clock-names to [core, pix0] and reset-names to [core];
    the if/else structure from v2 is replaced by two independent if blocks.
  - [dt-bindings] Removed all description strings from if/then branches per
    reviewer request; descriptions remain only in the top-level properties.
  - [hwdb] Removed VSDC_MODEL_DC8200 and VSDC_MODEL_DCU_LITE macros; HWDB
    entries use literal values (0x8200, 0x0) with inline comments.
  - [hwdb] Added enum vs_dc_generation (VSDC_GEN_DC8000 / VSDC_GEN_DC8200)
    and a generation field to vs_chip_identity; funcs dispatch now uses
    generation instead of the model register value, per reviewer suggestion
    (DC8000 has model 0x8000 yet behaves like DCUltraLite with model 0x0).
  - [hwdb] Moved the DCUltraLite HWDB entry to the final patch in the
    series per reviewer request, making it a gate that is opened only
    after all supporting code is in place.
  - [ops] Split v2 patch 2 into two patches: register macros first, then
    the per-variant ops table, per reviewer suggestion.
  - [ops] Extracted DC8200-specific ops into vs_dc8200.c; DCUltraLite ops
    are in vs_dcu_lite.c; dispatch in vs_dc_probe uses generation field.

Joey Lu (5):
  dt-bindings: display: verisilicon,dc: generalize for single-output
    variants
  drm/verisilicon: add register-level macros for DCU Lite
  drm/verisilicon: introduce per-variant hardware ops table
  drm/verisilicon: add Nuvoton MA35D1 DCU Lite display controller
    support
  drm/verisilicon: add DCUltraLite chip identity to HWDB

 .../bindings/display/verisilicon,dc.yaml      | 103 ++++++++++++++---
 drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
 drivers/gpu/drm/verisilicon/Makefile          |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +---
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 ++++++-
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |   1 +
 drivers/gpu/drm/verisilicon/vs_dc.c           |  13 ++-
 drivers/gpu/drm/verisilicon/vs_dc.h           |  33 ++++++
 drivers/gpu/drm/verisilicon/vs_dc8200.c       | 107 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dcu_lite.c     |  78 +++++++++++++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |  14 +++
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +-----
 .../drm/verisilicon/vs_primary_plane_regs.h   |   3 +
 14 files changed, 385 insertions(+), 67 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dcu_lite.c

-- 
2.43.0


