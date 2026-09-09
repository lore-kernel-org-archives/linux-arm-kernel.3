Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F143C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 19:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g0uOGw37DdE82nU6QUlJPa/gKDAK3HdlyhewoX5a9k8=; b=Ka/FRPnZLPXlFb2MBsNm5zgO3Q
	9y5qa0k8fX68IixDX+U9AEtXY3b8t/Gd17Qhu01oOQlH92THLl10hNKLXjd7TUHYG9EAmp8bA9VH1
	byU5mFV+X9d+OCUfq+ezD/TpJH7hpjK4BDwhV1xSS+tjeY9gYMHrby3xk6ietw0eqgiivHUYmZ2MT
	vhVClkuw1ieEA54a+60GnFrZ4agz7LGaQN86UnkSpi9lbfVAJxas+2RwxkqXGzY67pTiud+2mQA3b
	eR3Jtgzhvv04bg4Muu0QmlSgrDNkzHkkbU1iJfqY1TZ+63qjRZN73urCEVBHeD9NxzgydyBclTdbg
	G0xG0rqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O6s-0000000Cj9a-48aB;
	Wed, 09 Sep 2026 19:37:30 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O6q-0000000Cj8n-2RQL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 19:37:30 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e2406so11191955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 12:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982646; x=1789587446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0uOGw37DdE82nU6QUlJPa/gKDAK3HdlyhewoX5a9k8=;
        b=H288xaugix0mUGbPIQhAkQ2vs6xZHNIXCP5kh6coqxvoZ7GinjbutG5Tdc2m0RU4X3
         KYtlewRMb0Mxh+LlMbKHptyQuFJbePHNQOwN3BriHYOsVWuIaqKPTUrwxisk3hUV9HqR
         sf8zjG934pCrRRNKRdkeT9FrfS6ISjHvJfHRWW3/BW4DK6nuY0zvapFkqNcqSzx3lCD+
         Lv6RSi+nzasIr1j7qOpEvJfSw6zELED5vdaF7utfki9cHFL0dsiX3+PTzjLKt0ueHbuv
         RuPv/AHbQjJoZL1LmmgsSL3x8NpO3tKYeuQ/rbNhCdq1VIGRExU5+ogduB1loS3Et8LN
         ZtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982646; x=1789587446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0uOGw37DdE82nU6QUlJPa/gKDAK3HdlyhewoX5a9k8=;
        b=SZZZ3uRszLypKAYP9ISIAcDeYXYprZ0dZCmdFRnQwdZPK4xN38dQEX9nn/gTfZfFQi
         SYLGFve/j14FXr3nC5M1Pangwpd6KUT62yUd4rKWKYml5jAfNG3xvg+Gsb10FiMtMu+I
         Y80oaCyHw6UJSzsMd1f43QYAZk/+kdPO4UHwRFZwlbUWG1x4LD7eFp5uvLBtF+UYerO/
         ZdeJyw3gCqBQCspaW1yQFHb+10rWGYn6RPvgGdO7XGg2ewWodKY9Vl+9JRaGOMOPbcrJ
         YblNBjaNYzIoGi0ok4ld9vk3tkEoDFErYZHxDwluTbH4HwAG27iqlxmMSuMy3mx9Ro/4
         qKZg==
X-Forwarded-Encrypted: i=1; AKwUvBzi6smKf+abdVOA5eV6UlqRM9p0p6VQz2Z/iZ04vIapGm4toKX8CN5R7wuQphX+RWS+p/T7jdaAPRo+I2nSz60l@lists.infradead.org
X-Gm-Message-State: AFuF++kYu55m9QNbPTH/QOZnmEI+8j6Yyedeam33dBC1uCWbjRWkz+Sz
	AY8KwbnNRcKnlgtjUZSMsCjxl3vpUaMTOeYTjGVisJj85Q0rG/oDH4r3
X-Gm-Gg: AYBFou3EinFuxeh50Uu2pQeRFstM8ieSktTDpKdzM5DLs/I/BNt73r0BhzyCil25iIF
	GX5l7fJLuqW9GA1EZx5pHD5GjU/hAIT9fD2QSTs65/3kAw9bMT1B5fDH+6S/IgRxT/y+tDaZzt8
	y3NKMcVRtK9GMRQOlwiBLdAUcYni2leX2l4sQV+plxoLxtoMe/tKS2OEGZJQemB9rguAIJTbFhA
	Yn8e5+Euy1ID+y6aE6BmCRi7AUwenIFF/7ltE2Rt7ATaTXYb7BkrXqesPNBvjYcpsFDlcCBO6Ry
	yvb5FsUX1I0vQUKn22N0iVZp695GD6z3vyj6bcZeMmAPgk82jT2N3WFatSzJgH9GJBDu8oLYWyi
	fTVphcm6cUZFHCKVg/JnIicMTTw3u1y+a8B8wJ+FwcV6/mwaClq+ZUWujVp4HELcS0G29uB6CsX
	CSoLz+pnmjnvDyvTxMVtu8uEHbekMeNaN2tdN2eiwC26sDdNEmVGPhaMogLqOsiERpnkE41O8Lf
	SVOaHrfpqmPxnmrR817WK13KdrAzze0xZqS/yOA3UyEdWlleVIrum+PL8HroknRegI1AEmwWiZo
	DQb7+UegtQ==
X-Received: by 2002:a05:600c:c4b8:b0:49c:f13e:e52 with SMTP id 5b1f17b1804b1-49d26dcbc5emr9770855e9.15.1788982645812;
        Wed, 09 Sep 2026 12:37:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:d357:e592:d56c:d3b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm13123995e9.6.2026.09.09.12.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 0/3] soc: renesas: Add address extension support for RZ/V2H
Date: Wed,  9 Sep 2026 20:36:36 +0100
Message-ID: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_123728_661537_67232396 
X-CRM114-Status: GOOD (  19.36  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the SYS_AOF (Address Offset Function)
address extension mechanism on RZ/V2H, and enables it for the SDHI
internal DMAC so SD/eMMC DMA buffers are no longer confined to the
low 4 GiB of physical memory.

Background
==========

RZ/V2H contains bus masters (SDHI, USB, GBETH, VCD, DSI, LCDC, ISP,
DMAC, ...) that can only generate a 32-bit address on their own
bus. The SYS controller's SYS_AOFn registers let bits [31:30] of the
address such a master issues select one of four independently
configurable 6-bit fields; the selected field supplies the
corresponding upper bits ([34:30] or [35:30]) actually driven onto
the AXI interconnect, with bits [29:0] passed straight through. This
splits each master's native 4 GiB space into four relocatable 1 GiB
windows, letting it reach a 35-bit (DDR0/DDR1) or 36-bit (+PCIe0/
PCIe1) physical address space. See RZ/V2H Group Hardware User's
Manual, Figure 1.7-2 and Sections 1.7.3.2 and 4.3.3.2.88-90,
reproduced here in text form:

                     +--------------------+
                     |       Master       |
                     |  32-bit address    |
                     |      [31:0]        |
                     +----------+---------+
                                |
              +-----------------+-------------------+
              | bits [31:30]                        | bits [29:0]
              | select field                        | passed through
              v                                     |
    +---------------------------------+             |
    |         SYS_AOFn register       |             |
    |  +------+------+------+------+  |             |
    |  | Reg3 | Reg2 | Reg1 | Reg0 |  |             |
    |  |  11  |  10  |  01  |  00  |  |             |
    |  +--+---+--+---+--+---+--+---+  |             |
    +-----|------|------|------|------+             |
          +------+------+------+ supplies           |
                     |    [35:30] or [34:30]        |
                     v                              v
              +-------------------------------------+
              |          AXI interconnect           |
              |        35- or 36-bit address        |
              +--------------------+----------------+
                                   |
                                   v
     +-----------------------------------------------------+
     |               Physical address space                |
     |  F_FFFF_FFFFh +-----------------------------------+ |
     |               |          PCIe1 - 23 GiB           | |
     |  A_4000_0000h +-----------------------------------+ |
     |               |          PCIe0 - 24 GiB           | |
     |  4_4000_0000h +-----------------------------------+ |
     |               |           DDR1 - 8 GiB            | |
     |  2_4000_0000h +-----------------------------------+ |
     |               |           DDR0 - 8 GiB            | |
     |  0_4000_0000h +-----------------------------------+ |
     |               |  SRAM, peripheral, xSPI - 1 GiB   | |
     |  0_0000_0000h +-----------------------------------+ |
     +-----------------------------------------------------+

     Four 1 GiB windows, each independently redirectable to
     any 1 GiB-aligned target above; 35-bit-limited masters
     must keep bit [5] of every field clear (1.7.3.2.1).

In case the image isnt formatted correctly please refer the link
https://raw.githubusercontent.com/prabhakarlad/img/refs/heads/main/Screenshot%202026-08-12%20162004.png

Without this, SDHI (and other masters in the same category) are
limited to buffers in the low 4 GiB.

Approach
========

Rather than hardcoding SYS_AOFn programming per board, this series
derives it from the devicetree dma-ranges property already used to
describe DMA address translation:

 - Patch 1 adds generic AOF parsing/programming infrastructure to
   the rz-sysc driver. Each SoC lists its AOF-capable masters as
   (MMIO base, SYS_AOFn index, address width) tuples; at probe time,
   the driver walks "simple-bus" wrapper nodes carrying a dma-ranges
   property, matches the wrapped device against that table by MMIO
   base, and programs the corresponding SYS_AOFn fields directly
   from the dma-ranges translation. Devices with status = "disabled"
   are skipped. Malformed or out-of-range entries (misaligned,
   exceeding the master's own 4 GiB space, or requiring bit [5] on a
   35-bit-limited master) are rejected.

 - Patch 2 moves the SDHI nodes in r9a09g057.dtsi into per-instance
   simple-bus wrapper nodes with a default, no-op (DDR0-targeting)
   dma-ranges -- no functional change for boards that don't further
   override it.

 - Patch 3 demonstrates a non-default window on the RZ/V2H EVK:
   SDHI1's dma-ranges is pointed at an 8-12 GiB DDR1 window, backed
   by a restricted-dma-pool reserved-memory region so buffers handed
   to SDHI1 are guaranteed to physically land inside the range the
   programmed SYS_AOF17 fields can actually reach.

Boards that do not override an SDHI instance's dma-ranges see no
functional change: the default wrapper mapping added in patch 3 is
an identity remap onto DDR0's native address.

Trade-offs
==========

- Attaching a restricted-dma-pool to a device makes every DMA transfer
for that device bounce unconditionally (is_swiotlb_force_bounce()),
regardless of whether the buffer's physical address would otherwise
have been directly usable.
- Each master will require a restricted-dma-pool.

Testing
=======

Tested on the RZ/V2H EVK (r9a09g057h44-rzv2h-evk) with SDHI1 remapped
to an 8-12 GiB DDR1 window, running repeated large-file dd read/write
and mmc_test against an SD card, with no functional errors observed.
While running mmc_test a loss of ~4% was seen for read/write tests as
the mmc_test module allocated the memory using GFP_DMA flag.

This series does not yet cover the remaining AOF-capable masters
(USB, GBETH, VCD/DSI/LCDC/ISP, DMAC channels).

Request for feedback
=====================
The ~4% loss above comes from restricted-dma-pool's unconditional
bounce policy (is_swiotlb_force_bounce()): every SDHI transfer is
copied through the pool, even when the source buffer's physical
address would already have been usable without any copy at all.
This is a direct consequence of using restricted-dma-pool as the
correctness mechanism for a device whose real addressing constraint
doesn't map onto the flat dma_mask/dma-ranges model the generic DMA
layer otherwise assumes.

Before optimizing this further, I'd like inputs on whether
restricted-dma-pool is the right tool here. Suggestions and pointers
to prior art for similar SoC address-extension/aperture hardware would
be very welcome.

Thanks for reviewing.

Cheers,
Prabhakar

Lad Prabhakar (3):
  soc: renesas: rz-sysc: Configure AOF registers from dma-ranges
  arm64: dts: renesas: r9a09g057: Move SDHI nodes into bus nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Move SDHI1 dma range from
    8-12 GiB

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 123 +++++++++++-------
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  16 +++
 drivers/soc/renesas/r9a09g057-sys.c           |   9 ++
 drivers/soc/renesas/rz-sysc.c                 | 118 +++++++++++++++++
 drivers/soc/renesas/rz-sysc.h                 |  22 ++++
 5 files changed, 240 insertions(+), 48 deletions(-)

-- 
2.55.0


