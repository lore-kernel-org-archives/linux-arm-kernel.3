Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ED3C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 03:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bdKFcHr+t1P8kB1M0oZWW1CebC16dNbe38DihNTmLO8=; b=SkyIoTG67etWghYI3ph+yh63/G
	3rofMEdP6CHZNXCUAUh1YWcSrEOEgOfnmOqYnjCjYAU/V6r19uIGu+QHx53eb+LbsaEXbXN3YWvXS
	ZBjontv1LeG6faNTKI9IZRbZ/4stTmtfYYMNqc+qqW4I3Ano4wZBd60DwGUlTgvd63LvuLQnH0pJO
	oG++r/f4Vg53cGnMmi1UyVbFmr756tS+ajH8hlWf3gy29rD/UBgbYj6aQu34SBkAWEI4QGC/8rWcf
	9kJgJnFhFbFG22ByTSSzt5vG56ASUtfMGPyWuc+2VBDotQ+7nqVffXtvwCbVa6n2tuhCaZ7ToITxG
	DnFaEWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Or4-0000000DLye-1Knh;
	Fri, 18 Sep 2026 03:01:38 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Or1-0000000DLyC-2adU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 03:01:36 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d90ba1d807so2924295ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 20:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700494; x=1790305294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdKFcHr+t1P8kB1M0oZWW1CebC16dNbe38DihNTmLO8=;
        b=oda39kS3SQk6KHWYFbiyntAKML0M0bXS5s0207ffvYsxzIjV3RnR95nJ99BnGKUbja
         9F3LNxw+rNBy9wyO4RBOM2wscc4XC4zjsaoggAHUJ1Qdneu3teMZHFvOG3PjuFlr6u+g
         zrh2ZoHaKF82l2pUVs0b6S03cWJLdyqaT5u/XStYXDBjnH0UfNuQZuTlmlmJIbCq0KVD
         B/nxjUdUdseJvRSkWybPCot4iX9NBTrcDgYuqOcnoV4bsU1MTGUBJ1rHoJ7DS1TV/j0H
         fmK0Ie7d1qiZwzn/2xMJLJy/LXOy+lCxo7dSp9aXiZU1sV4GhNy/Hfr3Hiaxyztqj+Ej
         fyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700494; x=1790305294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdKFcHr+t1P8kB1M0oZWW1CebC16dNbe38DihNTmLO8=;
        b=AtwqNVSGYfTv69R2YN0jG5pv5R373XfPOJDjDuZhbPYWJPJGTm5LZVOYhUYSAEiAcn
         bQSo2UDTkb8BeNYQyGFwYDhP1D64LcNTk6TF4CFO6xxXB4On2NHOGO0pWueXjEZCUPrO
         6ZJMYtGWHgf9Wkl2lvTtkL5RdY5ncDXh0QrJJkF2HgVf2LB42HWnTtcv18erWVC3AJ7V
         GUhnuduapC7YPmSfaV4UqO2aj5iIuFevUIk33ED30B9h+zxBS5gqHnEKyz6SlNzi2NJF
         Yr7TDgyiL5IxXtP8ZGeStxo6il53Z+Ewg9ki4B9YXirGIof+BwdU3VhR1Sp2Ilx/qk8r
         Mlfg==
X-Forwarded-Encrypted: i=1; AKwUvByia+C8vwfMZeSFRNg6dIGWnBLgwS4yjkA9QF8q7ua5sDgBJYPyC0EaPemFqlx/4v1LVdNIYqGQ1PBK7U1ClrBV@lists.infradead.org
X-Gm-Message-State: AFuF++lNcYba96nuZHoiRAGBMo8emK92z5ij14LFCefeHrrqYTY3fY3Q
	GbiPKxWetkJdvpqxOIbJH3WLmUvLyPz/g9c3UNsL7AuEly9tOfpkW/PV
X-Gm-Gg: AYBFou2PzwzxdKiEFQ9alxnDt2hAx9Za3IR/XGfsboX4VqSCUsAbxGxKZgYeHw96HB3
	FE5XhRjbsnpVRmAtcbtjkJfA7+17Gcl9oZOKpFCRIxc1KacXctGZDnw3wJyuNAqYqhXaW78t0dq
	PG/73kuEofy12wW8T3yUHcM5/p+qLOhNtNJEohqGFgAlJj1GqtbxoxI+FsTREhstMNj+y8mZz5O
	Bk+61jqqIMTKTGVApRoEp6874fLuFRZ5cBRksxso84qL/3oMDdiVH5Eo2HtGv3NTUrqg9AxNY2l
	BAdRI7ZiqLezKYEe0tDCORuiND7ERVwAdVjflBNInlSC/SjbQXcEIlHnK1psDvh5xhpfaHnxNU7
	IGrcOISvbEff2R171J6Bw+gHOqDa3ml7z/m59em8pccaGL4zZhC4evsC1feBHH4+gkWC+/duD9H
	AmdvZK0/GPnEdsYKgMDN734M4GNe4RYId3BvegidNx9Rez9Jtl3UwgG8fsMRue+WV9figp/iK5/
	9gqLFheX43uVmF41WLOdLDjZ9H9AkcULtV1tS878YtotiAJlpuVtW6viYXSvfI=
X-Received: by 2002:a17:90b:4c50:b0:39e:4c7e:f03f with SMTP id 98e67ed59e1d1-39e54f6a423mr2356087a91.28.1789700494073;
        Thu, 17 Sep 2026 20:01:34 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:32 -0700 (PDT)
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
Subject: [PATCH v7 0/7] drm/verisilicon: add Nuvoton MA35D1 DCU Lite support
Date: Fri, 18 Sep 2026 11:01:18 +0800
Message-ID: <20260918030125.315978-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_200135_709665_5E3F42DE 
X-CRM114-Status: GOOD (  21.72  )
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

Patch 7 fixes a pre-existing DC8200 bug in the primary plane disable
path that Icenowy spotted while reviewing patch 3.

All patches have been tested on Nuvoton MA35D1 hardware.

Changes from v6:
  - [dt-bindings] Added a "port@1: false" / "required: port@0"
    restriction to the nuvoton,ma35d1-dcu allOf/if block, since the
    DCUltraLite only has a single output port.
  - [driver] Fixed 3 "alignment should match open parenthesis"
    checkpatch --strict issues introduced by patch 3:
    vs_crtc_atomic_begin() and vs_crtc_atomic_flush() continuation
    lines in vs_crtc.c, and vs_dc8200_primary_plane_update_ex()'s
    continuation line in vs_dc8200.c.
  - [driver] Added patch 7 to fix the pre-existing DC8200 FB_EN
    regmap_set_bits()/regmap_clear_bits() bug in
    vs_dc8200_primary_plane_disable_ex(), carried over unchanged since
    commit dbf21777caa8 ("drm: verisilicon: add a driver for
    Verisilicon display controllers").

Joey Lu (7):
  dt-bindings: display: verisilicon,dc: add support for
    nuvoton,ma35d1-dcu
  drm/verisilicon: add register-level macros for DC8000
  drm/verisilicon: introduce per-variant hardware ops table
  drm/verisilicon: add DC8000 (DCUltraLite) display controller support
  drm/verisilicon: add DCUltraLite chip identity to HWDB
  drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms
  drm/verisilicon: fix DC8200 primary plane disable clearing FB_EN

 .../bindings/display/verisilicon,dc.yaml      |  51 ++++++++
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
 16 files changed, 382 insertions(+), 55 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c

-- 
2.43.0


