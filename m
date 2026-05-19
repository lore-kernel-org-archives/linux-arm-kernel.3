Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7E8CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 05:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=At2RDd/JrXkyJVQsow486779/5ZNt3HX5SfY5tKfcDY=; b=pn9Iqp08opCv+x4l64+Lhv1fVI
	uvwYsacEtlztVMdcqdNhWsZ9LryY/Du07RFDprTIBydVPTn4npcEK2MzopQAF1xMzFGcry/YC0Qb3
	QL3TQsRQZULZl/PIaWW4rm7R5uhf/ZRWz7Z6kYl2HH/PJyVfkRCVSo9ZLNX5pJvsIG8XfTXAHAB/o
	Y9qW29kVO8Cg412Z6Zv3GK3RFbYxBLgpod5AyiSXlqEM/GTmFPigImPvVEzABlcILplEAng86SCtK
	FB7KAc359RCWwtaGAHXVxJyWyipooBP7bJ/1hvfey3FNTYCtqXulzgh36cBW8I6FtnkvwLTygzVfw
	0RdWrdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDN3-00000000EzV-1VAW;
	Tue, 19 May 2026 05:52:01 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDN1-00000000Ez6-2UaP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 05:52:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so1211109b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 22:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169918; x=1779774718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=At2RDd/JrXkyJVQsow486779/5ZNt3HX5SfY5tKfcDY=;
        b=cXzjG/BRDurFFqUDUDOFc4KKTw8l4A0zTlk4g4Nlicsqm503BUQb94JaJcIRi6gqz1
         zJh2bOQI8igTgGG7/MloJm2S7TFWoPsOttXRx3qhAyfAq56aC5ypZ+va5b1pcNhf+2IP
         U51/sebpZDSGpCegQ8W/zrYPLQJKjsaYONKV+WKUF3t8PLEWnDri5ll+PS1MQm0yUoTQ
         moGFHAiWNDdbdUC0LXgkW+HpoS80B7k0Z6f3ezIzGaoaQPZjPGDJhq+OI2E1bodEEbun
         PqybB4E7KGlSN7iupy6YY10gavXyiJhg93IJwkEifypA9Yeeuz8KR5x3MXGGSPqJ+T/q
         mghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169918; x=1779774718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=At2RDd/JrXkyJVQsow486779/5ZNt3HX5SfY5tKfcDY=;
        b=Zbeqc9EDsqoAHYAi/YBvdkoUMM+oN1TOvG1hGWOlsToEgmIkzzr1VFRkUJLSh0yP0T
         9/8hMlYi8E8u129F2MlI1n6X1gl2WtbashyquYvdyPqOJrdKC3c7ztz9wqg3BMgiRvs5
         OEXpKwVv4P7ikKQ1+7RbnDCQ+fUn/LnA4YKB2pisyuBFp0KNNgZ2oYEhEMv1mlFZeU43
         SUZoUZmzJIXxjQGe+ILmsN5SZaA+rc+p2Aww+tls1BK/l4Lt9AaupKU2qgL0RM/59PoU
         O8jlfA8zHHT8Lrz8JC/JVyyYpQzp7WtqHyACKHuD/VhX+kDIOIDoEGy3V7UslSTpne4b
         d5CQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5OPeQn6jbSB+deiMRpd9NopjyhvNO6x2hIXZMiuZt0h+MViVUenUlmMIN1kxScqoouDxofJ9WAsLVy315YELE@lists.infradead.org
X-Gm-Message-State: AOJu0YzDGAadFyDDYkiu+TYuUX6nr0+gFEVDymEdyP3vnM0sAqqF8Vhd
	Bzps4ENPyS6UQIwE6M5MfzY8OsUYL0NO5ywAig8fUgLSXvKDEQfQdn4a
X-Gm-Gg: Acq92OGHA4ffoaso0fQDLFoC59Ud2EReVtMSUAdDnMQtrlWX6UHUDOs7mIdi15YBC41
	MogfJADx3dyNAYO49iGB+EBtEU7Wm86Lvroj4co98dgm3v6ZPuN+wHpUt+96Tr1H5fxrG//S1i3
	jIl1BJ00MXVBRKaCVshNCIaMu05VNLHbCL6fm5jCtgExZJ70D0IBZj4cS0+i78jz9u36QqPMauJ
	xz4cXMcm5X1eDgZw78L81RqRA4qIl4ht2UYRM3ulxPgu4lAKbcllPfkwnnVAlQxr3BzWLmq749T
	khqt5I4ilFwU0KcL8dj5qMFe/pDm5xTCag5AqNR5elujq4owRVWkcLyYCWXXPVc2ThPDOmWIYoB
	WaV3BpgIfUKVwMIpG3t8/t/0IEcSBsDIusqaHpSaOp5mnUqwe722+pFL04v3MzljiwUPwCKKh4h
	u3ocDkhPtBQVdVdXuOGPBiuCqYbzibJ/ANwDOQyRjOLC8XPt7Cq84IM8pWhAdSV3YGx5aerKO2l
	p24HQVuiWTL
X-Received: by 2002:a05:6a00:1f09:b0:835:41f3:f453 with SMTP id d2e1a72fcca58-83f33c45ccemr17469354b3a.17.1779169917992;
        Mon, 18 May 2026 22:51:57 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f8b9c2ea5sm2641252b3a.13.2026.05.18.22.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:51:57 -0700 (PDT)
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
Subject: [PATCH v2 0/4] drm/verisilicon: add Nuvoton MA35D1 DCU Lite support
Date: Tue, 19 May 2026 13:51:05 +0800
Message-ID: <20260519055114.1886525-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_225159_641660_18CD5F30 
X-CRM114-Status: GOOD (  19.86  )
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

This series adds support for the Verisilicon DCU Lite display controller
as integrated in the Nuvoton MA35D1 SoC.

The Verisilicon DC driver and its DT binding were originally written by
Icenowy Zheng <zhengxingda@iscas.ac.cn> for the T-Head TH1520 SoC, which
carries a DC8200 IP block.  The present series builds on that foundation
with gratitude to Icenowy for the original work.

The DCU Lite is a different variant in the DC IP family.  While the two
IPs share a broadly similar register layout, a number of differences
prevent the existing driver from working on the MA35D1 without
modification:

  - No CONFIG_EX commit path: the DC8200 staging registers
    (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT, FB_BLEND_CONFIG,
    PANEL_CONFIG_EX) are absent.  The DCU Lite uses enable (bit 0) and
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

  - Hardware-discoverable identity: the DCU Lite exposes chip identity
    registers whose model field reads 0x0 (revision 0x5560,
    customer_id 0x305), allowing the existing vs_fill_chip_identity()
    path to identify the variant purely through register reads.  No
    separate OF compatible string is introduced.

Patch 1 generalises the verisilicon,dc DT binding to accommodate
variants with flexible clock/reset counts and a single output, using
allOf/if-then-else to keep per-variant constraints in-schema.

Patches 2-4 introduce the driver changes in three logical steps:
register-level constants and the DCU Lite chip identity table entry;
the vs_dc_funcs hardware ops table with DC8200 ops extracted into
vs_dc8200.c; and finally the DCU Lite ops in vs_dcu_lite.c with the
necessary Kconfig and clock-optionality changes.

All patches have been tested on Nuvoton MA35D1 hardware.

Changes from v1:
  - Corrected "DC8000" to "DC8200" throughout (the existing supported
    IP is DC8200, not DC8000).
  - Dropped the separate nuvoton,ma35d1-dcu.yaml; variant constraints
    are now expressed inline in verisilicon,dc.yaml via allOf/if-then-else.
    The MA35D1 uses the generic "verisilicon,dc" compatible string.
  - Replaced the vs_dc_info platform-data flags approach with a
    vs_dc_funcs hardware ops table, giving cleaner per-variant dispatch
    without scattering if/else branches across multiple files.
  - DCU Lite variant is identified through hardware registers rather than
    the OF match table.
  - Series split from 2 patches to 4 for clearer logical progression.
  - Renamed plane ops in vs_dc_funcs: plane_enable/disable to
    plane_enable_ex/disable_ex, plane_update_ext to plane_update_ex.

Joey Lu (4):
  dt-bindings: display: verisilicon,dc: generalize for  single-output
    variants
  drm/verisilicon: add model ID constants and DCU Lite chip identity
  drm/verisilicon: introduce per-variant hardware ops table
  drm/verisilicon: add Nuvoton MA35D1 DCU Lite display controller
    support

 .../bindings/display/verisilicon,dc.yaml      | 135 ++++++++++++++----
 drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
 drivers/gpu/drm/verisilicon/Makefile          |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +--
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 ++++-
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |   1 +
 drivers/gpu/drm/verisilicon/vs_dc.c           |  13 +-
 drivers/gpu/drm/verisilicon/vs_dc.h           |  33 +++++
 drivers/gpu/drm/verisilicon/vs_dc8200.c       | 107 ++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dcu_lite.c     |  78 ++++++++++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |  16 ++-
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |   3 +
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +----
 .../drm/verisilicon/vs_primary_plane_regs.h   |   3 +
 14 files changed, 398 insertions(+), 85 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dcu_lite.c

-- 
2.43.0


