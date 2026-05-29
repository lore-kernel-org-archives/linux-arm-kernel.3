Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775E3CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pm1egj7rvNz6E3Ee54JdqUG6bAMQYsYWlFR8JwRKRcg=; b=i7+pJAJvmfB6Y+f7G7L0TAFuTu
	4Z934+rfYzglfHvGM2gNQJWKTO7e3OJ7odZ4JVS7K8xIaa5uFewmQoBqcTO4S7ivmWZkTmz1tPo3y
	3m7TnaiTNaBzJfe9V4sncJ1eDROTwWvR7t9W6KGF3dq6QBJR3od4cErPkok95KVETfXV7kbUG20/Q
	i9ssNkRHnaerXNr3mdtNt58TBs2I3CtPAqlEcLla0qlxNzYNxjfju8vWKtLsUSwqrn0TCKUkXgi/r
	jSqZRyHXFWD6Zglz0b34353lNh6kFKg/B3oicUWqxBRLyUMi0BUeqb4lE+poWx0gqLv9YM9bjVpK5
	mofdaiBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzYz-00000007low-3zn7;
	Fri, 29 May 2026 15:55:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzYw-00000007lnb-1oYy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:55:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso122170495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780070152; x=1780674952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pm1egj7rvNz6E3Ee54JdqUG6bAMQYsYWlFR8JwRKRcg=;
        b=kf3m8o4YdnS3MHpgm2Suvo9c1gOvrSmuasI38JUQfo6cpYu2mR/7Gv610RSWDDVzrL
         AUbIIHpTZHQIBp3QTMQUPKjRwX87sMiM6T/KrMZCC9FnyVj3zw2c1Dyn3Ik4kI0k6CB1
         PXKOfVcDSru0OanmMUBfzzMyQ0/bnVvacKWFHO6Vp8Uomc/9UzIwE8zGEnkCl/hFYFWz
         DmaCw+8Eo56FSs2WA2iwmLnTWtPJC5s/Vj1lMS/UkAWINwmsjomG1s9EfNfd1s7QRYEn
         kI8mXpONM+YSpZctf6f3iqbb7f1f1Ldnv9Brghwnd0Kr0zNYevmsONpn/zfwelpTzhHq
         6q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780070152; x=1780674952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pm1egj7rvNz6E3Ee54JdqUG6bAMQYsYWlFR8JwRKRcg=;
        b=rlNleMLbxCXKqcARUTMT6LhkWiD8LmsZR4blqtwRxwK0MySqRn+1UtVwp6VarSyrHw
         x+/4vPPuMYNQVxPfHpVzr8ZmdvaDaXyQPgb+Rw6Rhdxx9ufPjOUQ3CzZwAEWAylgCUdW
         5GOYCQb9SRta7dzsM+q+LW9FpW7y0iUaxNz/aTNakgdGhmhnH4lDroYhMysmTOnwAdxw
         WGviVZsj7CsANXB2SceCH6rVWMZYtPTgMoCMgxInh6gGL+2QesUS0YD62zLq6CCqflNr
         j5M1rgUjKaQZb8mLOOz7Fd5pEdQsS3X3MhzbWwqJyyJV/oAQx7JMdv5ftbBrQqn23BLE
         8njw==
X-Forwarded-Encrypted: i=1; AFNElJ+lXqZQCxoV8+fejBWW5E7YHWPgv012ZfG8pqzA/rm49ksbPKhKEyDEmxdJ3cHsIeImPbtfpY1/mMw+Dqv+qYF7@lists.infradead.org
X-Gm-Message-State: AOJu0YwE/RmV/TmJi4LQ2YIif6NTTAR3kfxrXw4/QvX3dFXyexV3qzwr
	RYl5/9NXfr40lGLvrdNWNXmG2QdUtvNnRhMjeGQOIhUfE3ZQG0quiyCG
X-Gm-Gg: Acq92OFfIBdpYisHyvVZhMQ/FlPosVP0as5Bn5DTR3wKG+pRt6gzfGS2umI/+MBEXU6
	PexflrbcxthJG9X7hnPbslRCpeJYXD8v+0l9S7S1lt4espc2gox2k1FcMjfkdItFrGK6H1OJzwk
	yASexvu0nMaqb7KNfvbpi/u6/NI3P/oBxjlfqt4ajmgFdZi4iM1eYcQuFeZBYel5Z9FI2TjQqZF
	qMKWLTfczXA1+JnNSbXcOQEZo/AF8k1VpRLp2XllGEpge/clmJ+toKSdZ30KbtS5ieU5faocDzs
	MfulRiBm9SjY226HmK69iZFUQE5/R9GIFvaDsPOsekTyyarT+ITIulWMINhg04D+llF6vaIxdhL
	B7lNpBrTRUYFCGGiOjZEBauLZEQygqN426qApa5MzglhWp3Da4qxSOg9rvOw9YF3bP1kn3dyJ0g
	Y6WWGde5SzMCGHZ/8LZA0iqcEKN7btL3aQtlXycsNLelYB1HkrTmEi3cTU6aL4KjyjErM/xOX0Z
	b8vs0OQEQLWoU60a4fovcHPxdsmLSifFHuMYvHX
X-Received: by 2002:a05:600c:5254:b0:490:9e5b:9e31 with SMTP id 5b1f17b1804b1-490a28c4156mr5150045e9.0.1780070151955;
        Fri, 29 May 2026 08:55:51 -0700 (PDT)
Received: from debian.tailb81abf.ts.net (2a01cb09e0354cc878d00097536575e1.ipv6.abo.wanadoo.fr. [2a01:cb09:e035:4cc8:78d0:97:5365:75e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cabfd6esm55150315e9.15.2026.05.29.08.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:55:51 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v2 0/4] accel: rocket: Add RK3568 NPU support
Date: Fri, 29 May 2026 17:58:20 +0200
Message-Id: <20260529155824.3099831-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_085554_510623_A5822C37 
X-CRM114-Status: GOOD (  23.53  )
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

From: Midgy BALON <midgy971@gmail.com>

This series adds Rockchip RK3568 support to the upstream Rocket accel
driver (drivers/accel/rocket/), tested on a Radxa ROCK 3B board running
Linux 6.19-rc5.

The RK3568 carries a single NVDLA-derived NPU core (0.8 TOPS), the same
IP family as the three-core RK3588 NPU already supported by the driver.
The hardware register layout (pc/cna/core regions, interrupt, IOMMU) is
identical; the differences are:

  - 32-bit DMA address limit (NPU AXI bus and IOMMU page walker are 32-bit)
  - Requires explicit PVTPLL initialisation via two TF-A SCMI calls before
    the NPU NOC bus can be de-idled
  - Requires explicit PMU writes to power on the NPU domain (because the
    RK3568 power domain RK3568_PD_NPU is always_on so the generic
    pm-domains callback is a no-op) and de-idle the NPU NOC bus

Patch 1 introduces a per-SoC rocket_soc_data abstraction (dma_bits and
optional noc_init callback) plumbed via of_device_get_match_data(), and
adds RK3568 SoC support on top of it.  The DMA mask for the parent
DRM facade device is chosen based on the narrowest core present
(32-bit if any RK3568 core is in the system).

Patch 2 documents the new rk3568-rknn-core compatible and the
rockchip,pmu phandle that RK3568 requires; the sram-supply property
becomes conditional (RK3588-only).

Patches 3-4 add the RK3568 NPU and IOMMU nodes to rk356x-base.dtsi and
enable them on the Radxa ROCK 3B.

Verified on Radxa ROCK 3B (RK3568, 8 GB RAM):
  - /dev/accel/accel0 created at boot
  - dmesg: "Rockchip NPU core 0 version: 0"
  - IOMMU domain attached per open()
  - Job submission path complete: regcmd reaches the NPU's program
    controller, PC processes all 135 regcmd entries, broadcasts to
    sub-units, and advances to BSP-equivalent completion state
    (PC_TASKST=0x11000)

Status of end-to-end inference: NOT YET WORKING.  After 12 days of
investigation comparing rocket's behaviour against the vendor BSP RKNPU
driver, the NPU's MMIO state at submission time matches BSP byte-for-byte
(CNA configs, sub-unit OP_ENABLE registers, CBUF_CON0, etc.) but no
sub-unit transitions to its EXECUTER state and the completion IRQ never
fires.  The kernel driver and DT infrastructure in this series stand on
their own — the driver loads, IOMMU domain is attached, regcmd reaches
the NPU, PC state machine matches BSP — but a mesa-side regcmd issue
(or another piece we have not yet found) blocks the final conv firing.

I am sending this series now because the kernel and DT pieces are
self-contained, verifiable, and ready for review.  A separate RFC on
mesa-dev will follow with the userspace findings.  Detailed investigation
notes are available on request; relevant highlights for the maintainer:

1. Mesa rocket userspace (src/gallium/drivers/rocket/) targets RK3588.
   For RK3568, several encoded values need adjustment.  Most notably,
   sub-unit OP_ENABLE register offset on RK3568 is 0x_00c, not 0x_008.
   Mesa emits writes at 0x1008/0x2008/0x3008/0x4008/0x5008 — BSP regcmd
   captures show no writes at these offsets across two distinct conv
   shapes (YOLOv5s 6x6/s2 and MobileNet 3x3/s2).  BSP writes OP_ENABLE
   at offset 0x_00c with multi-bit values (CMAC=0x1, ACCU=0x0, DPU=0x108,
   DPU_RDMA=0x13f), not bit-0 booleans.  This and a handful of other
   shape-independent value differences will be filed as a mesa RFC.

2. The vendor BSP RKNPU driver writes the userspace task_base_addr to
   PC_DMA_BASE_ADDR (PC offset 0x34); the rocket driver did not.  PC's
   TASK_DMA engine reads struct rknpu_task descriptors from there.  With
   task_pp_en=1 in TASK_CON and a kernel-allocated descriptor BO,
   PC's task counter state machine advances from "stuck at 0xf000" to
   the BSP completion state.  This is the most invasive piece of the
   investigation and is held back for a follow-on patch (not in this
   series); the current series gets the driver to a working /dev/accel/
   node and an attached IOMMU domain, which is the right shape for v2.

3. The NPU's master AXI port is 32-bit, but dma_alloc_coherent() through
   the dma-iommu framework silently ignores GFP_DMA32 even with a 32-bit
   dma_mask set on the device.  When BOs for the NPU are allocated kernel-
   side, __get_free_pages(GFP_DMA32 | __GFP_ZERO, order) + dma_map_single()
   is the working pattern.  Not in this series, but might be a useful
   documentation note for other 32-bit AXI accelerators using dma-iommu.

This series builds against current v6.19-rc5 with no checkpatch warnings,
the dtb builds, and dtbs_check passes.  The April v1 series included a
fifth patch ("Use of_find_matching_node() instead of for_each_of_allnodes")
which is no longer required — upstream rocket already uses
for_each_compatible_node() since v6.19-rc5.

Changes since v1 (April 2026, never sent on-list):
  - Rebased to v6.19-rc5
  - Patch 1 absorbed v1 patch 1 (obsolete) and now includes the
    rocket_soc_data abstraction needed to support both RK3568 and
    RK3588 cores in the same driver
  - Cover letter expanded with current investigation status

Assisted by Claude Sonnet/Opus 4.x throughout the investigation.  All
findings empirically verified via BSP register captures and side-by-side
rocket execution traces on the same board.

Midgy BALON (4):
  accel: rocket: Add support for Rockchip RK3568
  dt-bindings: npu: rockchip,rk3588-rknn-core: Add RK3568 support
  arm64: dts: rockchip: rk356x: Add NPU and its IOMMU
  arm64: dts: rockchip: rk3568-rock-3b: Enable NPU

 Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml | 18 ++++++++++++++--
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi                        | 31 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts                      |  9 ++++++++
 drivers/accel/rocket/rocket_core.c                                   | 21 +++++++++++++++++-
 drivers/accel/rocket/rocket_core.h                                   | 18 ++++++++++++++--
 drivers/accel/rocket/rocket_device.c                                 | 23 +++++++++++++++++--
 drivers/accel/rocket/rocket_drv.c                                    | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 7 files changed, 192 insertions(+), 7 deletions(-)


Midgy BALON (4):
  accel: rocket: Add support for Rockchip RK3568
  dt-bindings: npu: rockchip,rk3588-rknn-core: Add RK3568 support
  arm64: dts: rockchip: rk356x: Add NPU and its IOMMU
  arm64: dts: rockchip: rk3568-rock-3b: Enable NPU

 .../npu/rockchip,rk3588-rknn-core.yaml        | 18 ++++-
 .../boot/dts/rockchip/rk3568-rock-3b.dts      |  9 +++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 31 ++++++++
 drivers/accel/rocket/rocket_core.c            | 18 ++++-
 drivers/accel/rocket/rocket_core.h            | 16 +++++
 drivers/accel/rocket/rocket_device.c          | 25 ++++++-
 drivers/accel/rocket/rocket_drv.c             | 71 ++++++++++++++++++-
 7 files changed, 182 insertions(+), 6 deletions(-)

-- 
2.39.5


