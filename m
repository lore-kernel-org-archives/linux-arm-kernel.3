Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B12ECD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 07:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8qQ0ZL0QLxICeDqID+huefvNgUTc9prsoWIoKknFrC8=; b=UMZLmvwNkQ03G0Q/JhuxbID5WN
	7jKEF9HWlGg+xIdoKnT+c0HMi6v3DzqNyvK3/GujYzQVlQJjwjXLvnSdoSbRO1t3hKg3HZ4g4UV1o
	WpdqUTYkwF5QNhrjUJ4A8UIlbQ+Rs+bmVbp0NFnQcp3ojxnESRow7vDmU/er9RrpNWJMndahuuFr9
	rWTgSNDfHp54EoYcnEv3nO9dqNbga/lEtBD3W76awz6/u7Bu4B5i0FMbXwP3ns8RzJSBUtfZnqWt4
	btwsJzY1SnMN2U2WPDkthGRg/y+CxyVATdt/4zoqSurCAOCvUxtX5ddUus2bNjLLuf1RBm3hhUynG
	XdQjBeiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLQg-0000000CevL-2BBw;
	Mon, 11 May 2026 07:51:54 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLQd-0000000Ceu3-1HUY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 07:51:52 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-82faf871346so2858055b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 00:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485910; x=1779090710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qQ0ZL0QLxICeDqID+huefvNgUTc9prsoWIoKknFrC8=;
        b=LmZSrmFc3rH26xVUgVvZ4HC/J+KM5Lba510t81o3Lr+wOHOr/fGlK905vqgmSqC/0g
         77AyF3f3VFWfS0M/5sDmFmAP5SL0Gpby8p7PvGuBm5TmAeYBYsLKWvGHQLhLnsxbw2ih
         +RpVHIBsPERfHwSXWVKzMhiequ35/+VMsqGnQTp1jt+HFb3oRn4J/rJw5iDzh/9WgNcA
         flzzryLq6QEcJCDukgH1s8KdkmTPJH8IoK7FhAG/SMj2MWwNMFSd2Oc2Z0WWE0ke/W9z
         +gvEGBEltM6lNmCWV0otCeJCTxOnkGk+zEm639cwR1buEWWjeGUzVM/c671M9kv17ATE
         Dm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485910; x=1779090710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qQ0ZL0QLxICeDqID+huefvNgUTc9prsoWIoKknFrC8=;
        b=a9Y3g1VnDO0mcPLVoLcIIdqJz68c9sAiXHjnfy2iCNc8phwUhwqjmcR/eLerD0PvUK
         A9fEdt1oAqisQcXvVoxfBCpP9ciqZzyW27T85xIy9C8N/xKVq5UxBZiRqrtjryMU4jpe
         6OpOGaGvsR4DljIArM2MKal+FkXfLI2XGp9AVjBlVoZQNtVb9RM7Y91Dr3/f4BpN+rxn
         Jq0uEcP14PlKP4hmEs9Egc36L+mfNQC/PrP9VjUEQ2l1fNEXvr/uBXH39yO95UDFKvMa
         6udC33WM6KamYEx4G/RWlnQYkPIRqFi+WLkt9XNH7xerWNDaqJywX20ubUm8Ji8WquWo
         iEgw==
X-Forwarded-Encrypted: i=1; AFNElJ9Pwdh8z0MVSW5S+NVeZHKExokrX5wrrmgH/eoks9ioylAxUbWXuY3+fTppu2kxNHKZxNsv533aaIa0o4rxB+1J@lists.infradead.org
X-Gm-Message-State: AOJu0YzMSfIYxanenukZDc7aU9yRyW1ZTtslUIv3WefnTb4XLBfSNFbO
	UDmKnVDqSPioAZMclAxHZJcs1E+U2dR3/5URnfW1dkWW13j2gc1lnUlN
X-Gm-Gg: Acq92OEgzps1AXkRk0FGl+yrotiV4inECJAKvq6GGvoMaLM4uJG2+2j3YT4qmG7Yfs6
	x9z+G5or4qlEfENPP4sJMMwWfgjhlJw1aPNAUiFlGZOmGy65LM902qp9e0+suV8YMlxEEJEm0do
	haY2OX/dXl7aXQYOtBDPKIfweQK02g2Q/XIRRX4qoUJBxdhnvaH0dkL+RxjKQKsXu7ZaWYg16xt
	t/m/UlWrJsBk44ZCCmpPb1pQLnxeS6u9n6ye+gtPeIbSXMPYnOHfQMJYRxPACwms5WW+yO9AKKQ
	47AWxiQPCSajvSOd+i0/qTEHSp2ri8W9hCZ23VDifwvQ8teM4Kdrm0GiU2NPEA6Z0hDuy+IR+/1
	iv6SMIbtjrF9LAtNelZugZD/+UHluB4kk43Md1qE1HlaT++Z96zKMf7BuKF8TFZZcQ2RYrFtCZ1
	mTtB/lXgnQK/TZw+vMxLWx+ehmgvarNOeHY2pYrrHPVDFak+ImCIBgsdDJLS45nMxZ5qIcJe8UA
	uXFcT6hgNt/
X-Received: by 2002:a05:6a00:3016:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-83a5c2be01cmr21310489b3a.14.1778485909975;
        Mon, 11 May 2026 00:51:49 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36a12sm17694642b3a.27.2026.05.11.00.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:51:49 -0700 (PDT)
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
Subject: [PATCH 0/2] drm/verisilicon: add Nuvoton MA35D1 DCUltra Lite support
Date: Mon, 11 May 2026 15:51:40 +0800
Message-ID: <20260511075142.54752-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_005151_349764_5D6B6129 
X-CRM114-Status: GOOD (  16.05  )
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

This series adds support for the Verisilicon DCUltra Lite display
controller as integrated in the Nuvoton MA35D1 SoC.

The Verisilicon DC driver and its DT binding were originally written by
Icenowy Zheng <zhengxingda@iscas.ac.cn> for the TH1520 SoC, which
carries a DC8000 IP block.  The present series builds on that foundation
with gratitude to Icenowy for the original work.

The DCUltra Lite is a previous generation of the DC8000 series.  While
the two IPs share a broadly similar register layout, a number of
differences prevent the existing driver from working on the MA35D1
without modification:

  - No chip identity registers: the DCUltra Lite does not expose
    model/revision/customer_id hardware registers, so variant detection
    must come from platform data rather than register reads.

  - No CONFIG_EX commit path: the DC8000 staging registers
    (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT, FB_BLEND_CONFIG,
    PANEL_CONFIG_EX) are absent; the DCUltra Lite uses enable and reset
    bits in FB_CONFIG (bit 0 / bit 4) for direct framebuffer updates.

  - No PANEL_START register: panel output begins when
    PANEL_CONFIG.RUNNING is set; the DC8000 multi-display sync start
    register at 0x1CCC does not exist.

  - Different IRQ registers: IRQ_STA at 0x147C / IRQ_EN at 0x1480,
    versus the DC8000's IRQ_ACK at 0x0010 / IRQ_EN at 0x0014.

  - Simpler clock/reset topology: two clocks ("core" bus gate and "pix0"
    pixel divider), no driver-managed resets.  The DC8000 requires
    core/axi/ahb clocks and three reset lines.

  - Single display output: no per-output indexing is needed.

  - Smaller register space: max_register 0x2000 vs. DC8000's 0x2544.

Patch 1 extends the verisilicon,dc DT binding to accommodate variants
with flexible clock/reset counts and adds a new sub-schema for
nuvoton,ma35d1-dcu.

Patch 2 introduces the vs_dc_info platform data structure, selects the
correct code paths based on the detected IP family, extends Kconfig for
ARCH_MA35, and wires up the "nuvoton,ma35d1-dcu" OF compatible string.

Both patches have been tested on Nuvoton MA35D1 hardware and are
functioning correctly.

Joey Lu (2):
  dt-bindings: display: verisilicon,dc: generalize for DCUltra Lite
    variant
  drm/verisilicon: add support for Nuvoton MA35D1 DCUltra Lite display
    controller

 .../bindings/display/nuvoton,ma35d1-dcu.yaml  |  94 +++++++++++++
 .../bindings/display/verisilicon,dc.yaml      |  64 +++++----
 drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  28 ++--
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  13 +-
 drivers/gpu/drm/verisilicon/vs_dc.c           | 129 ++++++++++++------
 drivers/gpu/drm/verisilicon/vs_dc.h           |   1 +
 drivers/gpu/drm/verisilicon/vs_drm.c          |  16 ++-
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |   2 +-
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |  25 ++++
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  43 +++---
 .../drm/verisilicon/vs_primary_plane_regs.h   |   2 +
 12 files changed, 318 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml

-- 
2.43.0


