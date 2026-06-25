Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10524CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q7LZb4Oyp6MyCiFD5fuuqoWQdDcqkeN2EAojsuCFuQk=; b=mRKMm/VUlEZ1V+KeOMa/5RPwte
	iG+Q7pMe3jBlgL+mcxnrFTzpi1ttto/CNyw7bcihmaOInZE07NzQA+B9xI9oNUbwldWjWHcibCLOi
	tZLQxNXWODjPil0AsoybE5NUj1AGR9eSr87bV52hIQT4rFNEQiP4lvezsefr2ryG2Sr6xZ6+Qssss
	VKfDyPuXnKbZLiTrEOrm7O1qjmN69YcqkKuX9jwAQlmHTgzoE9KLaYEqs0cnuc5TyeaJk+O1Mvbao
	hsI6UHzvaCzC5ahyB3DamjZJpPX22nYJMoOqvUPLeY8oIe9IGaxK6A6FgJMuwwC/M20BV9A1uV8fX
	iCADxnnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgdo-00000008viQ-2lPH;
	Thu, 25 Jun 2026 09:45:00 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgdl-00000008vho-3OhM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:44:59 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c6be9cd89bso8312425ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 02:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380697; x=1782985497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7LZb4Oyp6MyCiFD5fuuqoWQdDcqkeN2EAojsuCFuQk=;
        b=Mzwf21biKdjsskocXuwCZT7vMnJ1uNSVDCXcz3Ct7ZW55L9eIEqH0Q19JYseDDHI6T
         zb7rFdBcWkzk0BnMzo66PWYye3iC2FvYDOvCP0gQPKH9GOodVdKyNZOE+hzS7SJXvPAb
         fqW3AZUv71JxSaRm2E4beF3uEtXgs/SEdgd9NeaZjRMQRKbU86G5K5jYjwcSlHEQaCRg
         tGymPzOI/KjuP5WoFwH23jql4XODiFXaKBwjdcJwrY+LES1nEWvlHFoCxNeAFNbpaZAY
         ffS6glatIWnjUWdyJI5OLhSTm6MT4rZsyYngNzvXtiTYzzSqzhhJFT/1f3Pk9hUFmyZq
         Eeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380697; x=1782985497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7LZb4Oyp6MyCiFD5fuuqoWQdDcqkeN2EAojsuCFuQk=;
        b=ojUIDPchMxp9wNUIRUkrWd4MguwEl5ErB7gV3nE6zTWDEORftGpERW879u8cGgoiU9
         FMfE4Sei/zoQGVP9KKpwe5h9A/QBaxi22giFP4J28OAs1I1MLYKUEpQ+H+sKDMLYyPsW
         uX0YBMfdBZUWr3dtYOtz+jvkaNECozfWqVHDQs1J7TvBVFA1cjLh6fT0+vP9MyFeRqmV
         AlgwaF2Q+iNNWep1gy0rS5K8gMfAVhjC9FcGbgAOxyIUykDaWhFN0cRm5OHVlonlyY0S
         Z0rH9lBAzLWOOGAPOsxZ37ScqKEb7V/fgwVZ/gVxRZuZ3RXu80WV257DRhEMTBh47D5d
         mIhg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2rIuTcW7f2VsfLMdeVZZE4+YYVHahfriaSn/ZiwxNjxDpjZdGUruA+KlChqBg62SqusvS9zQKgQswGLl+Fugk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz76OFEJMyU1tWB+MlD0uSAiC8YaKphyBLG1uxxgmgiXQHlCaDI
	oH5YY+2DET/tDAWP2wT7ns+zA0YlNJIzebWDyiynzJsi4tOhs9ri95yOyeLdJg==
X-Gm-Gg: AfdE7cmcr+99UD822b+CxwoAGzRthPkYMlTx4GGlBaxvR+FgMfTyrwlU50Dq8AGtPcn
	TrXFojIwgY9ckaxod97c2+6zmhPU3OBBcdec2bjwl1YXe9J6s2vUl6fV619n/7kEqXp9Cy7mqvB
	/pgYzrT2N7FYVUa3pGzxZDLV9eG1nd+9NUuryB6eoSE5Tz4NoYyMdnKVUXDAWYal2opvCWrkbl/
	awttVsxzlQmyhTrxTSuB2uzj0Nmi+dpzz8+Ic0510EekSBZtQ8CCNAY1/ewRhuWoXiGnjB+RSqs
	l4fubWRX9sIHLQugSxL/CoJ1RCYRoZPL+rZl4mKv4pdHLE/QQi871rEeaIiWA2O/KahN8isDJLu
	YHrndWRMjPMxueUvGBVx05M8TAjcY6qCdNTjaWow54UtTRWIPA9zyfQLqdUn/i3frcRCjm3/RDW
	bW5TgT5yi91Pik9xlNoQ8iJlOlajILN8BzLEBMuf5W70wHKS4MRxnGk0r67YU32JoCiNnFT0VDk
	Vnx75fuDT3L
X-Received: by 2002:a17:902:e843:b0:2c1:a19:8396 with SMTP id d9443c01a7336-2c7fca3eeb3mr18687905ad.31.1782380696777;
        Thu, 25 Jun 2026 02:44:56 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm16614995ad.1.2026.06.25.02.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:44:56 -0700 (PDT)
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
Subject: [PATCH v5 0/7] drm/verisilicon: add Nuvoton MA35D1 DCU Lite support
Date: Thu, 25 Jun 2026 17:44:42 +0800
Message-ID: <20260625094449.708386-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_024457_877358_400BB4EA 
X-CRM114-Status: GOOD (  20.37  )
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
vs_dc8200.c; making axi/ahb clocks optional as a separate atomic change;
and the DC8000 ops in vs_dc8000.c.  Patch 6 adds the DCUltraLite HWDB
entry that gates hardware recognition once all support is in place.

Patch 7 adds the Kconfig dependency on ARCH_MA35, placed last because it
is only meaningful after the HWDB entry is added.

All patches have been tested on Nuvoton MA35D1 hardware.

Changes from v4:
  - [dt-bindings] Kept clock and reset item descriptions in the global
    clocks:/resets: properties; per-compatible sections only constrain
    minItems/maxItems and override clock-names items for nuvoton,ma35d1-dcu.
  - [dt-bindings] Dropped redundant global minItems/maxItems on clocks:
    and clock-names:.
  - [dt-bindings] Dropped the extra-space typo fix in port@0 description
    to keep the patch atomic; left for a separate patch later.
  - [ops] Renamed crtc_enable/crtc_disable hooks to crtc_enable_ex/
    crtc_disable_ex.
  - [ops] Added unified IRQ bit definitions; each irq_ack() implementation
    now translates hardware-specific bits before returning.
  - [clocks] Split the axi/ahb optional-clock change into its own patch
    for atomicity.
  - [hwdb] Simplified the commit message for patch 6.
  - [kconfig] Simplified the commit message for patch 7.

Joey Lu (7):
  dt-bindings: display: verisilicon,dc: generalize for single-output
    variants
  drm/verisilicon: add register-level macros for DC8000
  drm/verisilicon: introduce per-variant hardware ops table
  drm/verisilicon: make axi and ahb clocks optional
  drm/verisilicon: add DC8000 (DCUltraLite) display controller support
  drm/verisilicon: add DCUltraLite chip identity to HWDB
  drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms

 .../bindings/display/verisilicon,dc.yaml      |  57 +++++++++
 drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
 drivers/gpu/drm/verisilicon/Makefile          |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +--
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 +++++-
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |   1 +
 drivers/gpu/drm/verisilicon/vs_dc.c           |  13 +-
 drivers/gpu/drm/verisilicon/vs_dc.h           |  33 +++++
 drivers/gpu/drm/verisilicon/vs_dc8000.c       |  86 +++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc8200.c       | 115 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_drm.c          |   5 +-
 drivers/gpu/drm/verisilicon/vs_drm.h          |   8 ++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |  14 +++
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +----
 .../drm/verisilicon/vs_primary_plane_regs.h   |   3 +
 16 files changed, 378 insertions(+), 57 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c

-- 
2.43.0


