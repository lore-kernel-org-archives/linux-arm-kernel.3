Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93900C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1cMT7fKgP+zuYY8ESvwdYk2VGfHp7bRIw/gwcfnHbX4=; b=Wt8URKt3NhQJ7q55/4MQhZHsC2
	P2xoakMKNdFsMKKmLz0debFxK9RGcaWfiT8IJnOnPZVGlKBRrENGV/+iR+I2FvoB8wx5oan7cM59v
	P0rGZSYf+uvFX/juugdz9mU7K8ZgDaen7pwItcMSCSkn+oyE5tgZn2e6P/xzaoG0sePaLPjvsoOOW
	pLZeMs4L4JDKxfaAHKuFCIuBQECR36jJ2gTfhcQ7fV/NMJgxard3SDB6wOT7QZ3PC0eMrPqufN/ZO
	Za13N7WGbj4fd9903w9syBXAb877S77QrF/Xi8eYlsXFBYnjsDrCIsC0NEe880Je9scUiMCufHMuZ
	OaDmVIgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s8J-00000008ZT0-1ZLT;
	Tue, 08 Sep 2026 09:28:51 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s8H-00000008ZSH-0t4h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:28:50 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-398e9698a70so3832755a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859728; x=1789464528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1cMT7fKgP+zuYY8ESvwdYk2VGfHp7bRIw/gwcfnHbX4=;
        b=U9CUxvvBg4QUR0PLBibFvAmc7RPGLl4qFzTPJH4EBAgQG7xJFmCwfhv9vcxCr5urWW
         B6A8vcPGkjYVdfSGo+C8IL3dJiTuaX61RqgseOBaFU+PdZ/gDYcyjye1cDevy44Y4lfP
         DlDCe/vqUhUQD5d5R5gKWzaNaB4L2tEXB32QqWp319IEO5F/tpmTKfKqcqVMy1SwZNUm
         JFhEGaDBlxBAqgEtRnpVEoJc8BeTBdntfKx0S8x6kQJXghclr71LYdVzeQzbisCGOpJA
         g2TmE73rbdK4kO/doOJ5G6BzraOroXKGxtwByqvGUcC6gduCNL27j2/D0I+unehedTN4
         2Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859728; x=1789464528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cMT7fKgP+zuYY8ESvwdYk2VGfHp7bRIw/gwcfnHbX4=;
        b=DNPEGQ720ZmjDFMyzTfw99Wg6o1H0ekMdlQ8Ufpq40Eo/IGP21B/mm1CLLHkVgdIR+
         qdy3OtlW0nPeuarIjJimJGyVO+fq7evzvRGmLGaALEAxHeZWajAJgjS6erUJZ6RUDeBm
         m2EBFYEgmTiwTXXhmEH1Tm5kCA9Th+d9TdgZ6wSLC7u1sKtcFC28jcgsqrqLrOHq79G1
         Xf3N+MQVnePO/XJMhCsFZDNW3hRwUgcvyV4gQwveE+6c11jpUCkwgicCwzpEExj1gEyZ
         OmytVaRpTIimV30pajVcnQrP9xyeCHh9tF3oT/HoThYMkOUuhi701/ODX930sT0xwKPL
         dpPg==
X-Forwarded-Encrypted: i=1; AKwUvBzIvGEAjC4Ndkv2/y04Nls2N59e4Ds8U4LEm11d0Ssej+1NUIiBxnfmAT7r+H+bqEgPo99pMNNSfvbOiqhAxHyO@lists.infradead.org
X-Gm-Message-State: AFuF++n9RFLXqhF565XFg2Kw7jS7rT/t5do4n2opRs1iF98wEnwi8SrU
	d6YeM+OPKZQCpJG/Pb2dDv/p+6rBObtQk+GVwmN7tTJEGbhs4sbQbvFv
X-Gm-Gg: AYBFou3PmjbT7oEVx8Chf4A56kkNFXEVPgTZYIHF0UmkACCaK8atIdzP423HWc161vz
	lQafQYT0dV4WKK2EME47lyV0KhDaeCO9H0GR5iFgGRUBPr0iGxQ2S3wROqdaPL+EhkNr2lMcalK
	tUKx2yfIZjliMudFJ7INBYL0bZedky4YPzeZAetPmkr+IkGIXK84rrOn7R0qWWU97peQd354RTA
	nLJvcC6kbGcQxpcpNBgLhZqxeST4d0hzmWOWY/tC+6iN0wrH88GGuVw7R6eD2Nt+VjOA+wCwdV2
	3YyOXDtjpTaaqgjn6HGKx8w92miA8lecJcKOIgjPiNW4FCR+JmXPahd+NnpnlV96Rkeq7VcDEkB
	5zWEderREFDXy72rRvVYba6ONs+Qienga8/iMHA52+2Fu+i3fFHT4frNgBsnGqkzjKfIf9tl3F6
	LLAkYMxr7w4efycLLJgDSdVM5s9u4fyKmzCceaxeaJP/oCXs8agc4gdLmAx0fOVm+V/garCfzbL
	Dvc/l9kZWg34o4SEzj5olbisDQ/KLPjgpU8hRB1BBrZ1MtgFHxfm4UmOSkcegk=
X-Received: by 2002:a17:90b:394e:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-39b26272d76mr43048844a91.12.1788859727665;
        Tue, 08 Sep 2026 02:28:47 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:28:47 -0700 (PDT)
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
Subject: [PATCH v6 0/6] drm/verisilicon: add Nuvoton MA35D1 DCU Lite support
Date: Tue,  8 Sep 2026 17:28:34 +0800
Message-ID: <20260908092840.225220-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_022849_257990_9BCAB3CF 
X-CRM114-Status: GOOD (  22.55  )
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

  - Simpler clock topology: the MA35D1 clock controller gates the core,
    AXI and AHB clocks with a single bit, so the devicetree supplies the
    same clock phandle for all three; only the pixel clock is distinct.
    No second output port is present, so no pix1 clock is needed either.

  - Single display output: no per-output indexing beyond index 0 is
    needed.

  - Hardware-discoverable identity: the DCUltraLite exposes chip identity
    registers whose model field reads 0x0 (revision 0x5560,
    customer_id 0x305), allowing the existing vs_fill_chip_identity()
    path to identify the variant purely through register reads.

Patch 1 adds the nuvoton,ma35d1-dcu compatible to the verisilicon,dc DT
binding and relaxes the top-level clock/reset item counts so per-variant
allOf/if blocks can constrain each compatible's actual topology.

Patch 2 adds the register-level macros needed by the DC8000 ops.

Patches 3-4 introduce the driver changes in two logical steps: the
vs_dc_funcs hardware ops vtable with DC8200 ops extracted into
vs_dc8200.c, and the DC8000 ops in vs_dc8000.c.  Patch 5 adds the
DCUltraLite HWDB entry that gates hardware recognition once all support
is in place.

Patch 6 adds the Kconfig dependency on ARCH_MA35, placed last because it
is only meaningful after the HWDB entry is added.

All patches have been tested on Nuvoton MA35D1 hardware.

Changes from v5:
  - [dt-bindings] Renamed the patch from "generalize for single-output
    variants" to "add support for nuvoton,ma35d1-dcu", since the binding
    topology itself isn't being generalised, only a new compatible is
    being added.
  - [dt-bindings] Moved clocks/clock-names minItems to 4 and
    resets/reset-names minItems to 1 at the top level (the lowest count
    any variant needs), instead of overriding both minItems and maxItems
    redundantly inside each allOf/if block.
  - [dt-bindings] Kept the thead,th1520-dc8200 allOf/if block, tightening
    it back up to minItems: 5 (clocks) / minItems: 3 (resets), since the
    outer constraint is now looser than what that compatible requires.
  - [dt-bindings] Dropped the nuvoton,ma35d1-dcu clock-names/reset-names
    item overrides entirely: the devicetree will supply all four clocks
    (core, axi, ahb, pix0) and the one core reset in the same order the
    top-level schema already expects, so only maxItems: 4 / maxItems: 1
    are needed to cap the count.
  - [dt-bindings] Dropped the redundant "required: resets/reset-names"
    sub-blocks, now that resets/reset-names are unconditionally required
    at the top level (landed separately by Icenowy Zheng).
  - [driver] Dropped "make axi and ahb clocks optional" entirely: since
    the devicetree will always supply distinct axi/ahb clock properties
    (sharing the core clock's phandle), vs_dc_probe() keeps treating them
    as mandatory via devm_clk_get_enabled(), same as core and pix0.
  - [driver] Added drm_WARN_ONCE() in both vs_dc8200_irq_ack() and
    vs_dc8000_irq_ack() to flag any hardware IRQ bit that doesn't
    translate to a known VSDC_IRQ_* definition.

Joey Lu (6):
  dt-bindings: display: verisilicon,dc: add support for
    nuvoton,ma35d1-dcu
  drm/verisilicon: add register-level macros for DC8000
  drm/verisilicon: introduce per-variant hardware ops table
  drm/verisilicon: add DC8000 (DCUltraLite) display controller support
  drm/verisilicon: add DCUltraLite chip identity to HWDB
  drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms

 .../bindings/display/verisilicon,dc.yaml      |  44 +++++++
 drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
 drivers/gpu/drm/verisilicon/Makefile          |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +--
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 +++++-
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |   1 +
 drivers/gpu/drm/verisilicon/vs_dc.c           |   9 +-
 drivers/gpu/drm/verisilicon/vs_dc.h           |  33 +++++
 drivers/gpu/drm/verisilicon/vs_dc8000.c       |  92 +++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc8200.c       | 121 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_drm.c          |   5 +-
 drivers/gpu/drm/verisilicon/vs_drm.h          |   8 ++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |  14 ++
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +----
 .../drm/verisilicon/vs_primary_plane_regs.h   |   3 +
 16 files changed, 375 insertions(+), 55 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c

-- 
2.43.0


