Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D1ECA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuOJRxzEd2+FACdWVRDk//utgfeiIB44ZaTLC0WonWg=; b=cfgDxTVspY+8LMUFL+1umJ3L+K
	kO5QFUYgVdLqL2ON1eIiq4G+nbOrK7ADb0FuRa3/33VXK8jmodJFyGN2JNoklwVfN/I5ijKlIvVJx
	lAkzVQtATMmGpq212GeyPuJPcElDd2ag+4t1tjdWHy/XGdHafa3dRwWAapk7BUG3qods2o6xX7pyi
	i/LR1YU9J4ys48Cq1R4kpuoBR5xoWU5lVW49S9TIvPl8nHOXjuuec1xvMFgoVzN1O70Eyphm6pxKs
	4I1Ntch8kG5QpSBsm0WAtWCq3Zx+2gC/PavQ6P1s0tci7CoD8uECP6t3mqwziyl1GhVbijqIbOfNM
	sCobe2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChWH-0000000CEKL-2Xxz;
	Fri, 02 Oct 2026 17:58:05 +0000
Received: from mail-dl1-x1248.google.com ([2607:f8b0:4864:20::1248])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChWC-0000000CEHC-41Lg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:58:04 +0000
Received: by mail-dl1-x1248.google.com with SMTP id a92af1059eb24-139b62317d0so8205898c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 10:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790963880; x=1791568680; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuOJRxzEd2+FACdWVRDk//utgfeiIB44ZaTLC0WonWg=;
        b=W5Xoz/jz9SHsXA2wL4qKQag3LUQ0boREw99A1t+wykA1ok7Iz4Gf9YQPnl008HEBf7
         SXgfBZVMNvhtBGxeJkMwmcmVCH6rVS32TErxitqT7WDmQ4btwVyK5/YXgvWo753delgm
         5EUvw4d25DZaZsHYHe/IbIxmE0eS7s1vWhAUTszopKAgN9VEpVMdhvqBkHdTadZTup1x
         EdN3abdTjJhFAbZ95XMoqty5YFVDbRjLTR4qKP5C1wdIpHMmuqdOcTJrSID086fIFcPb
         DsAkjE4FhNXDKPOViaWns0qRckJCCeGiqGwbnxc1d/Xw0lfVW6ynD2tm5Kbd4L+0eijB
         u0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963880; x=1791568680;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DuOJRxzEd2+FACdWVRDk//utgfeiIB44ZaTLC0WonWg=;
        b=Zjl4ahO0dPOINIb1+nVK/aqdavD38xLCNLr373mjAwevSD2C6anrwaUKjGbnWjJFDz
         QfMvo7de8anj0xctbCFyEhRpB6oucuJgQ4z/7sveUau8geuPhNmIjPDrWzONFLNVS8gC
         sW4CmBrVPyFfpif93pSJosJHpSyPOgum0HWXbT0zDAkZPTvGMN9FebwY2iAzAOW/zZvI
         a1zWnobrqGX78h7xXB0BuxPCZWnzmt0AO546BEOMlU6dxcQS7xxyNzlAxy422lzMlkwN
         sYgaXUQSf2Q9xiE6zgBwCL9DnlN3dKzAjvu8ALGnBDl20i3dJFqZQheiqp75gv+L6Vv/
         HPWA==
X-Forwarded-Encrypted: i=1; AKwUvBwCWbdNfyR3fpk1Oe8V3+ZTm5eadx+16o8WyZmIjDSNOwqEw5bxvFL5Ds81hPqZRHqPUG6Q+5wS2Abm5ZBbuM7j@lists.infradead.org
X-Gm-Message-State: AFuF++knjqXSCAhoTrIVr8+DSGS7dUnwTbCSgWUdVasy9FR2TWsOHvUr
	553NIm8TzXkN4IOU1WJ0/VPbm0q5Rc6vnJJuwYslPGzfOj6rriPp5wbrbidFJ0n+sM1TcDoT/wD
	jKcxu0GeB/w==
X-Received: from dlbti5.prod.google.com ([2002:a05:7022:1b05:b0:14d:d7f0:5394])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2906:b0:14d:c23e:c931
 with SMTP id a92af1059eb24-14f5b9fb5d0mr3499492c88.10.1790963878977; Fri, 02
 Oct 2026 10:57:58 -0700 (PDT)
Date: Fri,  2 Oct 2026 10:57:36 -0700
In-Reply-To: <20261002175738.3242646-1-irogers@google.com>
Mime-Version: 1.0
References: <20261002175738.3242646-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261002175738.3242646-4-irogers@google.com>
Subject: [PATCH v14 3/3] perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Kernel Maintenance <kernel-list@raspberrypi.com>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Peter Robinson <pbrobinson@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_105801_052893_7ED456BB 
X-CRM114-Status: GOOD (  19.78  )
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

Extend the Raspberry Pi AXI PMU driver to support the Broadcom BCM2712
architecture used in the Raspberry Pi 5.

The BCM2712 SoC drops the legacy VideoCore VPU monitor and exposes a
unified System monitor via MMIO mapping distinctly different hardware
pipelines (such as DISPLAY_TOP, ARGON_TOP, BSTM_TOP, PCIE_01, and XPT)
and expanded 6-bit AXI master ID filter tables.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/perf/Kconfig       |   2 +-
 drivers/perf/rpi_axi_pmu.c | 470 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 469 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 0ead13195a57..af1b2359d234 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -333,7 +333,7 @@ config RPI_AXI_PMU
 	help
 	  Enable support for the Raspberry Pi AXI Performance Monitor.
 	  This provides access to the System and VideoCore performance
-	  counters on Broadcom BCM2835 and BCM2711 platforms.
+	  counters on Broadcom BCM2835, BCM2711, and BCM2712 platforms.
 
 	  Expect 100ms ping latencies to the VideoCore firmware mailbox
 	  when reading counters on these platforms.
diff --git a/drivers/perf/rpi_axi_pmu.c b/drivers/perf/rpi_axi_pmu.c
index 3dc0131ab450..eecd3073c158 100644
--- a/drivers/perf/rpi_axi_pmu.c
+++ b/drivers/perf/rpi_axi_pmu.c
@@ -6,12 +6,13 @@
  * This driver exposes the performance monitoring hardware on Raspberry Pi
  * System-on-Chips to the Linux perf subsystem:
  * - Raspberry Pi 1, 2, 3, 4, Compute Modules 1-4, Zero, Zero W (SoCs BCM2835/2836/2837/2711).
+ * - Raspberry Pi 5, Compute Module 5 (SoC BCM2712).
  *
  * Architecture Overview:
  * ----------------------
  * The Broadcom AXI performance hardware provides up to two independent monitors:
  * 1. System Monitor (MON_SYSTEM = 0):
- *    Monitors system-level AXI traffic (ARM CPU L2/UC, DMA, V3D, ISP, HVS).
+ *    Monitors system-level AXI traffic (ARM CPU L2/UC, DMA, V3D, ISP, HVS, PCIe/RP1).
  *    Directly memory-mapped via ARM physical IO memory space (MMIO).
  *    Read latency: ~10-20 nanoseconds (fast, atomic-safe, non-blocking).
  *
@@ -19,6 +20,7 @@
  *    Monitors VideoCore VPU buses (VPU0/1 Data/Instruction L2/UC, SDRAM, etc.).
  *    Accessible through VideoCore firmware mailbox IPC (RPI_FIRMWARE_SET/GET_PERIPH_REG).
  *    Read latency: ~10-100 microseconds (IPC over VPU mailbox).
+ *    On BCM2712 (RPi 5), only the System Monitor is exposed via MMIO.
  *
  * Synchronization & Concurrency Model:
  * ------------------------------------
@@ -60,10 +62,12 @@
  * enum rpi_axi_chip - Supported Broadcom SoC generations
  * @CHIP_BCM2835: BCM2835 / BCM2836 / BCM2837 (RPi 1-3, CM 1-3, Zero/W)
  * @CHIP_BCM2711: BCM2711 (RPi 4, CM 4)
+ * @CHIP_BCM2712: BCM2712 (RPi 5, CM 5)
  */
 enum rpi_axi_chip {
 	CHIP_BCM2835 = 0,
 	CHIP_BCM2711,
+	CHIP_BCM2712,
 };
 
 /**
@@ -121,6 +125,40 @@ enum bcm2835_system_bus {
 	BCM2835_SB_MAX,
 };
 
+/**
+ * enum bcm2712_system_bus - AXI buses monitored by System Monitor on BCM2712 (RPi 5)
+ * @BCM2712_SB_VPU_UC: VPU Uncached memory bus
+ * @BCM2712_SB_DISPLAY_TOP: Display top-level engine bus
+ * @BCM2712_SB_V3D: VideoCore VII 3D graphics hardware pipeline bus
+ * @BCM2712_SB_ARM: ARM cores subsystem bus
+ * @BCM2712_SB_XPT: Cross-Point (XPT) fabric bus
+ * @BCM2712_SB_BSTM_TOP: BSTM Top bus
+ * @BCM2712_SB_PCIE_01: PCIe 0/1 bus
+ * @BCM2712_SB_ARGON_TOP: Argon Top bus
+ * @BCM2712_SB_ARB3: ARB3 bus
+ * @BCM2712_SB_SRC: SRC bus
+ * @BCM2712_SB_HVDP: HVDP bus
+ * @BCM2712_SB_PER: Peripheral bus
+ * @BCM2712_SB_SYSTEM_L2: System L2 Cache bus
+ * @BCM2712_SB_MAX: Total count of monitored system buses on BCM2712
+ */
+enum bcm2712_system_bus {
+	BCM2712_SB_VPU_UC = 0,
+	BCM2712_SB_DISPLAY_TOP = 1,
+	BCM2712_SB_V3D = 2,
+	BCM2712_SB_ARM = 3,
+	BCM2712_SB_XPT = 4,
+	BCM2712_SB_BSTM_TOP = 5,
+	BCM2712_SB_PCIE_01 = 6,
+	BCM2712_SB_ARGON_TOP = 7,
+	BCM2712_SB_ARB3 = 8,
+	BCM2712_SB_SRC = 9,
+	BCM2712_SB_HVDP = 10,
+	BCM2712_SB_PER = 11,
+	BCM2712_SB_SYSTEM_L2 = 12,
+	BCM2712_SB_MAX,
+};
+
 /**
  * enum bcm2835_vpu_bus - AXI buses monitored by VPU Monitor on BCM2835 (RPi 1-3)
  * @BCM2835_VB_VPU1_D_L2: VideoCore VPU Core 1 Data L2 cache bus
@@ -403,6 +441,116 @@ enum bcm2711_filter {
 	BCM2711_FLT_MAX,
 };
 
+/**
+ * enum bcm2712_filter - AXI master ID filter options for BCM2712 (RPi 5)
+ * @BCM2712_FLT_0: Disable master ID filtering (monitor all traffic on bus)
+ * @BCM2712_FLT_VPU_UC0: VPU Uncached 0 master ID
+ * @BCM2712_FLT_VPU_IC0: VPU I-Cache 0 master ID
+ * @BCM2712_FLT_VPU_DC0: VPU D-Cache 0 master ID
+ * @BCM2712_FLT_VPU_UC1: VPU Uncached 1 master ID
+ * @BCM2712_FLT_VPU_IC1: VPU I-Cache 1 master ID
+ * @BCM2712_FLT_VPU_DC1: VPU D-Cache 1 master ID
+ * @BCM2712_FLT_VPU_L2: VPU L2 Cache master ID
+ * @BCM2712_FLT_DMA2: DMA2 master ID
+ * @BCM2712_FLT_VPU_DEBUG: VPU Debug master ID
+ * @BCM2712_FLT_ARM: Arm Quad-Core CPU Cluster master ID
+ * @BCM2712_FLT_DMA0: DMA0 master ID
+ * @BCM2712_FLT_DMA1: DMA1 master ID
+ * @BCM2712_FLT_RAAGA: RAAGA Audio Engine master ID
+ * @BCM2712_FLT_BBSI: BBSI master ID
+ * @BCM2712_FLT_PCIE0: RP1 PCIe Southbridge 0 master ID
+ * @BCM2712_FLT_PCIE1: PCIe 1 master ID
+ * @BCM2712_FLT_PCIE2: PCIe 2 master ID
+ * @BCM2712_FLT_UMR: UMR master ID
+ * @BCM2712_FLT_SAGE: SAGE master ID
+ * @BCM2712_FLT_HVDP: HVDP master ID
+ * @BCM2712_FLT_BSP: BSP master ID
+ * @BCM2712_FLT_HVS: Hardware Video Scaler (HVS) display engine master ID
+ * @BCM2712_FLT_HVS_WMK: HVS Watermark master ID
+ * @BCM2712_FLT_MOP0: MOP0 master ID
+ * @BCM2712_FLT_MOP1: MOP1 master ID
+ * @BCM2712_FLT_MBVN: MBVN master ID
+ * @BCM2712_FLT_DSI: DSI Display Interface master ID
+ * @BCM2712_FLT_XPT: XPT master ID
+ * @BCM2712_FLT_EMMC0: SD/eMMC Controller 0 master ID
+ * @BCM2712_FLT_GENET: Gigabit Ethernet Controller master ID
+ * @BCM2712_FLT_USB: USB Controller master ID
+ * @BCM2712_FLT_ARGON: Argon master ID
+ * @BCM2712_FLT_UNICAM: Unicam master ID
+ * @BCM2712_FLT_PISP: ISP master ID
+ * @BCM2712_FLT_PISPFE: ISP Front End master ID
+ * @BCM2712_FLT_JPEG: JPEG decoder master ID
+ * @BCM2712_FLT_EMMC1: SD/eMMC 1 master ID
+ * @BCM2712_FLT_EMMC2: SD/eMMC 2 master ID
+ * @BCM2712_FLT_TRC: TRC master ID
+ * @BCM2712_FLT_BSTM0: BSTM0 master ID
+ * @BCM2712_FLT_BSTM1: BSTM1 master ID
+ * @BCM2712_FLT_BSTM0_SEC: BSTM0 Secure master ID
+ * @BCM2712_FLT_BSTM1_SEC: BSTM1 Secure master ID
+ * @BCM2712_FLT_AIO: AIO master ID
+ * @BCM2712_FLT_MAP: MAP master ID
+ * @BCM2712_FLT_SYS_DMA: System DMA master ID
+ * @BCM2712_FLT_MMUCACHE0: MMU Cache 0 master ID
+ * @BCM2712_FLT_MMUCACHE1: MMU Cache 1 master ID
+ * @BCM2712_FLT_MPUCACHE0: MPU Cache 0 master ID
+ * @BCM2712_FLT_MPUCACHE1: MPU Cache 1 master ID
+ * @BCM2712_FLT_MAX: Maximum filter ID count for BCM2712
+ */
+enum bcm2712_filter {
+	BCM2712_FLT_0 = 0,
+	BCM2712_FLT_VPU_UC0 = 1,
+	BCM2712_FLT_VPU_IC0 = 2,
+	BCM2712_FLT_VPU_DC0 = 3,
+	BCM2712_FLT_VPU_UC1 = 4,
+	BCM2712_FLT_VPU_IC1 = 5,
+	BCM2712_FLT_VPU_DC1 = 6,
+	BCM2712_FLT_VPU_L2 = 7,
+	BCM2712_FLT_DMA2 = 8,
+	BCM2712_FLT_VPU_DEBUG = 9,
+	BCM2712_FLT_ARM = 10,
+	BCM2712_FLT_DMA0 = 11,
+	BCM2712_FLT_DMA1 = 12,
+	BCM2712_FLT_RAAGA = 13,
+	BCM2712_FLT_BBSI = 14,
+	BCM2712_FLT_PCIE0 = 15,
+	BCM2712_FLT_PCIE1 = 16,
+	BCM2712_FLT_PCIE2 = 17,
+	BCM2712_FLT_UMR = 18,
+	BCM2712_FLT_SAGE = 19,
+	BCM2712_FLT_HVDP = 20,
+	BCM2712_FLT_BSP = 21,
+	BCM2712_FLT_HVS = 22,
+	BCM2712_FLT_HVS_WMK = 23,
+	BCM2712_FLT_MOP0 = 24,
+	BCM2712_FLT_MOP1 = 25,
+	BCM2712_FLT_MBVN = 26,
+	BCM2712_FLT_DSI = 27,
+	BCM2712_FLT_XPT = 28,
+	BCM2712_FLT_EMMC0 = 29,
+	BCM2712_FLT_GENET = 30,
+	BCM2712_FLT_USB = 31,
+	BCM2712_FLT_ARGON = 32,
+	BCM2712_FLT_UNICAM = 33,
+	BCM2712_FLT_PISP = 34,
+	BCM2712_FLT_PISPFE = 35,
+	BCM2712_FLT_JPEG = 36,
+	BCM2712_FLT_EMMC1 = 37,
+	BCM2712_FLT_EMMC2 = 38,
+	BCM2712_FLT_TRC = 39,
+	BCM2712_FLT_BSTM0 = 40,
+	BCM2712_FLT_BSTM1 = 41,
+	BCM2712_FLT_BSTM0_SEC = 42,
+	BCM2712_FLT_BSTM1_SEC = 43,
+	BCM2712_FLT_AIO = 44,
+	BCM2712_FLT_MAP = 45,
+	BCM2712_FLT_SYS_DMA = 46,
+	BCM2712_FLT_MMUCACHE0 = 47,
+	BCM2712_FLT_MMUCACHE1 = 48,
+	BCM2712_FLT_MPUCACHE0 = 49,
+	BCM2712_FLT_MPUCACHE1 = 50,
+	BCM2712_FLT_MAX,
+};
+
 /* Hardware register offsets & control bitwise constants */
 #define GEN_CTRL			0x00
 #define GEN_CTL_ENABLE_BIT		BIT(0)
@@ -684,6 +832,14 @@ static bool config_is_valid(struct rpi_axi_pmu *pmu, __u64 config)
 		if (filter >= BCM2711_FLT_MAX)
 			return false;
 		break;
+	case CHIP_BCM2712:
+		if (mon == MON_SYSTEM && bus >= BCM2712_SB_MAX)
+			return false;
+		if (mon == MON_VPU)
+			return false;
+		if (filter >= BCM2712_FLT_MAX)
+			return false;
+		break;
 	}
 
 	return counter < CNT_MAX;
@@ -2020,6 +2176,301 @@ static const struct attribute_group rpi_axi_pmu_bcm2711_events_group = {
 	.attrs = bcm2711_events,
 };
 
+PMU_EVENT_ATTR_STRING(vpu_uc_atwait, bcm2712_vpu_uc_atwait, "monitor=0,bus=0,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_uc_atrans, bcm2712_vpu_uc_atrans, "monitor=0,bus=0,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_uc_amax, bcm2712_vpu_uc_amax, "monitor=0,bus=0,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_uc_wwait, bcm2712_vpu_uc_wwait, "monitor=0,bus=0,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_uc_wtrans, bcm2712_vpu_uc_wtrans, "monitor=0,bus=0,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_uc_wmax, bcm2712_vpu_uc_wmax, "monitor=0,bus=0,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_uc_rwait, bcm2712_vpu_uc_rwait, "monitor=0,bus=0,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_uc_rtrans, bcm2712_vpu_uc_rtrans, "monitor=0,bus=0,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_uc_rmax, bcm2712_vpu_uc_rmax, "monitor=0,bus=0,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_uc_rpend, bcm2712_vpu_uc_rpend, "monitor=0,bus=0,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_uc_ratrans, bcm2712_vpu_uc_ratrans, "monitor=0,bus=0,counter=10");
+PMU_EVENT_ATTR_STRING(display_top_atwait, bcm2712_display_top_atwait, "monitor=0,bus=1,counter=0");
+PMU_EVENT_ATTR_STRING(display_top_atrans, bcm2712_display_top_atrans, "monitor=0,bus=1,counter=1");
+PMU_EVENT_ATTR_STRING(display_top_amax, bcm2712_display_top_amax, "monitor=0,bus=1,counter=2");
+PMU_EVENT_ATTR_STRING(display_top_wwait, bcm2712_display_top_wwait, "monitor=0,bus=1,counter=3");
+PMU_EVENT_ATTR_STRING(display_top_wtrans, bcm2712_display_top_wtrans, "monitor=0,bus=1,counter=4");
+PMU_EVENT_ATTR_STRING(display_top_wmax, bcm2712_display_top_wmax, "monitor=0,bus=1,counter=5");
+PMU_EVENT_ATTR_STRING(display_top_rwait, bcm2712_display_top_rwait, "monitor=0,bus=1,counter=6");
+PMU_EVENT_ATTR_STRING(display_top_rtrans, bcm2712_display_top_rtrans, "monitor=0,bus=1,counter=7");
+PMU_EVENT_ATTR_STRING(display_top_rmax, bcm2712_display_top_rmax, "monitor=0,bus=1,counter=8");
+PMU_EVENT_ATTR_STRING(display_top_rpend, bcm2712_display_top_rpend, "monitor=0,bus=1,counter=9");
+PMU_EVENT_ATTR_STRING(display_top_ratrans, bcm2712_display_top_ratrans, "monitor=0,bus=1,counter=10");
+PMU_EVENT_ATTR_STRING(v3d_atwait, bcm2712_v3d_atwait, "monitor=0,bus=2,counter=0");
+PMU_EVENT_ATTR_STRING(v3d_atrans, bcm2712_v3d_atrans, "monitor=0,bus=2,counter=1");
+PMU_EVENT_ATTR_STRING(v3d_amax, bcm2712_v3d_amax, "monitor=0,bus=2,counter=2");
+PMU_EVENT_ATTR_STRING(v3d_wwait, bcm2712_v3d_wwait, "monitor=0,bus=2,counter=3");
+PMU_EVENT_ATTR_STRING(v3d_wtrans, bcm2712_v3d_wtrans, "monitor=0,bus=2,counter=4");
+PMU_EVENT_ATTR_STRING(v3d_wmax, bcm2712_v3d_wmax, "monitor=0,bus=2,counter=5");
+PMU_EVENT_ATTR_STRING(v3d_rwait, bcm2712_v3d_rwait, "monitor=0,bus=2,counter=6");
+PMU_EVENT_ATTR_STRING(v3d_rtrans, bcm2712_v3d_rtrans, "monitor=0,bus=2,counter=7");
+PMU_EVENT_ATTR_STRING(v3d_rmax, bcm2712_v3d_rmax, "monitor=0,bus=2,counter=8");
+PMU_EVENT_ATTR_STRING(v3d_rpend, bcm2712_v3d_rpend, "monitor=0,bus=2,counter=9");
+PMU_EVENT_ATTR_STRING(v3d_ratrans, bcm2712_v3d_ratrans, "monitor=0,bus=2,counter=10");
+PMU_EVENT_ATTR_STRING(arm_atwait, bcm2712_arm_atwait, "monitor=0,bus=3,counter=0");
+PMU_EVENT_ATTR_STRING(arm_atrans, bcm2712_arm_atrans, "monitor=0,bus=3,counter=1");
+PMU_EVENT_ATTR_STRING(arm_amax, bcm2712_arm_amax, "monitor=0,bus=3,counter=2");
+PMU_EVENT_ATTR_STRING(arm_wwait, bcm2712_arm_wwait, "monitor=0,bus=3,counter=3");
+PMU_EVENT_ATTR_STRING(arm_wtrans, bcm2712_arm_wtrans, "monitor=0,bus=3,counter=4");
+PMU_EVENT_ATTR_STRING(arm_wmax, bcm2712_arm_wmax, "monitor=0,bus=3,counter=5");
+PMU_EVENT_ATTR_STRING(arm_rwait, bcm2712_arm_rwait, "monitor=0,bus=3,counter=6");
+PMU_EVENT_ATTR_STRING(arm_rtrans, bcm2712_arm_rtrans, "monitor=0,bus=3,counter=7");
+PMU_EVENT_ATTR_STRING(arm_rmax, bcm2712_arm_rmax, "monitor=0,bus=3,counter=8");
+PMU_EVENT_ATTR_STRING(arm_rpend, bcm2712_arm_rpend, "monitor=0,bus=3,counter=9");
+PMU_EVENT_ATTR_STRING(arm_ratrans, bcm2712_arm_ratrans, "monitor=0,bus=3,counter=10");
+PMU_EVENT_ATTR_STRING(xpt_atwait, bcm2712_xpt_atwait, "monitor=0,bus=4,counter=0");
+PMU_EVENT_ATTR_STRING(xpt_atrans, bcm2712_xpt_atrans, "monitor=0,bus=4,counter=1");
+PMU_EVENT_ATTR_STRING(xpt_amax, bcm2712_xpt_amax, "monitor=0,bus=4,counter=2");
+PMU_EVENT_ATTR_STRING(xpt_wwait, bcm2712_xpt_wwait, "monitor=0,bus=4,counter=3");
+PMU_EVENT_ATTR_STRING(xpt_wtrans, bcm2712_xpt_wtrans, "monitor=0,bus=4,counter=4");
+PMU_EVENT_ATTR_STRING(xpt_wmax, bcm2712_xpt_wmax, "monitor=0,bus=4,counter=5");
+PMU_EVENT_ATTR_STRING(xpt_rwait, bcm2712_xpt_rwait, "monitor=0,bus=4,counter=6");
+PMU_EVENT_ATTR_STRING(xpt_rtrans, bcm2712_xpt_rtrans, "monitor=0,bus=4,counter=7");
+PMU_EVENT_ATTR_STRING(xpt_rmax, bcm2712_xpt_rmax, "monitor=0,bus=4,counter=8");
+PMU_EVENT_ATTR_STRING(xpt_rpend, bcm2712_xpt_rpend, "monitor=0,bus=4,counter=9");
+PMU_EVENT_ATTR_STRING(xpt_ratrans, bcm2712_xpt_ratrans, "monitor=0,bus=4,counter=10");
+PMU_EVENT_ATTR_STRING(bstm_top_atwait, bcm2712_bstm_top_atwait, "monitor=0,bus=5,counter=0");
+PMU_EVENT_ATTR_STRING(bstm_top_atrans, bcm2712_bstm_top_atrans, "monitor=0,bus=5,counter=1");
+PMU_EVENT_ATTR_STRING(bstm_top_amax, bcm2712_bstm_top_amax, "monitor=0,bus=5,counter=2");
+PMU_EVENT_ATTR_STRING(bstm_top_wwait, bcm2712_bstm_top_wwait, "monitor=0,bus=5,counter=3");
+PMU_EVENT_ATTR_STRING(bstm_top_wtrans, bcm2712_bstm_top_wtrans, "monitor=0,bus=5,counter=4");
+PMU_EVENT_ATTR_STRING(bstm_top_wmax, bcm2712_bstm_top_wmax, "monitor=0,bus=5,counter=5");
+PMU_EVENT_ATTR_STRING(bstm_top_rwait, bcm2712_bstm_top_rwait, "monitor=0,bus=5,counter=6");
+PMU_EVENT_ATTR_STRING(bstm_top_rtrans, bcm2712_bstm_top_rtrans, "monitor=0,bus=5,counter=7");
+PMU_EVENT_ATTR_STRING(bstm_top_rmax, bcm2712_bstm_top_rmax, "monitor=0,bus=5,counter=8");
+PMU_EVENT_ATTR_STRING(bstm_top_rpend, bcm2712_bstm_top_rpend, "monitor=0,bus=5,counter=9");
+PMU_EVENT_ATTR_STRING(bstm_top_ratrans, bcm2712_bstm_top_ratrans, "monitor=0,bus=5,counter=10");
+PMU_EVENT_ATTR_STRING(pcie_01_atwait, bcm2712_pcie_01_atwait, "monitor=0,bus=6,counter=0");
+PMU_EVENT_ATTR_STRING(pcie_01_atrans, bcm2712_pcie_01_atrans, "monitor=0,bus=6,counter=1");
+PMU_EVENT_ATTR_STRING(pcie_01_amax, bcm2712_pcie_01_amax, "monitor=0,bus=6,counter=2");
+PMU_EVENT_ATTR_STRING(pcie_01_wwait, bcm2712_pcie_01_wwait, "monitor=0,bus=6,counter=3");
+PMU_EVENT_ATTR_STRING(pcie_01_wtrans, bcm2712_pcie_01_wtrans, "monitor=0,bus=6,counter=4");
+PMU_EVENT_ATTR_STRING(pcie_01_wmax, bcm2712_pcie_01_wmax, "monitor=0,bus=6,counter=5");
+PMU_EVENT_ATTR_STRING(pcie_01_rwait, bcm2712_pcie_01_rwait, "monitor=0,bus=6,counter=6");
+PMU_EVENT_ATTR_STRING(pcie_01_rtrans, bcm2712_pcie_01_rtrans, "monitor=0,bus=6,counter=7");
+PMU_EVENT_ATTR_STRING(pcie_01_rmax, bcm2712_pcie_01_rmax, "monitor=0,bus=6,counter=8");
+PMU_EVENT_ATTR_STRING(pcie_01_rpend, bcm2712_pcie_01_rpend, "monitor=0,bus=6,counter=9");
+PMU_EVENT_ATTR_STRING(pcie_01_ratrans, bcm2712_pcie_01_ratrans, "monitor=0,bus=6,counter=10");
+PMU_EVENT_ATTR_STRING(argon_top_atwait, bcm2712_argon_top_atwait, "monitor=0,bus=7,counter=0");
+PMU_EVENT_ATTR_STRING(argon_top_atrans, bcm2712_argon_top_atrans, "monitor=0,bus=7,counter=1");
+PMU_EVENT_ATTR_STRING(argon_top_amax, bcm2712_argon_top_amax, "monitor=0,bus=7,counter=2");
+PMU_EVENT_ATTR_STRING(argon_top_wwait, bcm2712_argon_top_wwait, "monitor=0,bus=7,counter=3");
+PMU_EVENT_ATTR_STRING(argon_top_wtrans, bcm2712_argon_top_wtrans, "monitor=0,bus=7,counter=4");
+PMU_EVENT_ATTR_STRING(argon_top_wmax, bcm2712_argon_top_wmax, "monitor=0,bus=7,counter=5");
+PMU_EVENT_ATTR_STRING(argon_top_rwait, bcm2712_argon_top_rwait, "monitor=0,bus=7,counter=6");
+PMU_EVENT_ATTR_STRING(argon_top_rtrans, bcm2712_argon_top_rtrans, "monitor=0,bus=7,counter=7");
+PMU_EVENT_ATTR_STRING(argon_top_rmax, bcm2712_argon_top_rmax, "monitor=0,bus=7,counter=8");
+PMU_EVENT_ATTR_STRING(argon_top_rpend, bcm2712_argon_top_rpend, "monitor=0,bus=7,counter=9");
+PMU_EVENT_ATTR_STRING(argon_top_ratrans, bcm2712_argon_top_ratrans, "monitor=0,bus=7,counter=10");
+PMU_EVENT_ATTR_STRING(arb3_atwait, bcm2712_arb3_atwait, "monitor=0,bus=8,counter=0");
+PMU_EVENT_ATTR_STRING(arb3_atrans, bcm2712_arb3_atrans, "monitor=0,bus=8,counter=1");
+PMU_EVENT_ATTR_STRING(arb3_amax, bcm2712_arb3_amax, "monitor=0,bus=8,counter=2");
+PMU_EVENT_ATTR_STRING(arb3_wwait, bcm2712_arb3_wwait, "monitor=0,bus=8,counter=3");
+PMU_EVENT_ATTR_STRING(arb3_wtrans, bcm2712_arb3_wtrans, "monitor=0,bus=8,counter=4");
+PMU_EVENT_ATTR_STRING(arb3_wmax, bcm2712_arb3_wmax, "monitor=0,bus=8,counter=5");
+PMU_EVENT_ATTR_STRING(arb3_rwait, bcm2712_arb3_rwait, "monitor=0,bus=8,counter=6");
+PMU_EVENT_ATTR_STRING(arb3_rtrans, bcm2712_arb3_rtrans, "monitor=0,bus=8,counter=7");
+PMU_EVENT_ATTR_STRING(arb3_rmax, bcm2712_arb3_rmax, "monitor=0,bus=8,counter=8");
+PMU_EVENT_ATTR_STRING(arb3_rpend, bcm2712_arb3_rpend, "monitor=0,bus=8,counter=9");
+PMU_EVENT_ATTR_STRING(arb3_ratrans, bcm2712_arb3_ratrans, "monitor=0,bus=8,counter=10");
+PMU_EVENT_ATTR_STRING(src_atwait, bcm2712_src_atwait, "monitor=0,bus=9,counter=0");
+PMU_EVENT_ATTR_STRING(src_atrans, bcm2712_src_atrans, "monitor=0,bus=9,counter=1");
+PMU_EVENT_ATTR_STRING(src_amax, bcm2712_src_amax, "monitor=0,bus=9,counter=2");
+PMU_EVENT_ATTR_STRING(src_wwait, bcm2712_src_wwait, "monitor=0,bus=9,counter=3");
+PMU_EVENT_ATTR_STRING(src_wtrans, bcm2712_src_wtrans, "monitor=0,bus=9,counter=4");
+PMU_EVENT_ATTR_STRING(src_wmax, bcm2712_src_wmax, "monitor=0,bus=9,counter=5");
+PMU_EVENT_ATTR_STRING(src_rwait, bcm2712_src_rwait, "monitor=0,bus=9,counter=6");
+PMU_EVENT_ATTR_STRING(src_rtrans, bcm2712_src_rtrans, "monitor=0,bus=9,counter=7");
+PMU_EVENT_ATTR_STRING(src_rmax, bcm2712_src_rmax, "monitor=0,bus=9,counter=8");
+PMU_EVENT_ATTR_STRING(src_rpend, bcm2712_src_rpend, "monitor=0,bus=9,counter=9");
+PMU_EVENT_ATTR_STRING(src_ratrans, bcm2712_src_ratrans, "monitor=0,bus=9,counter=10");
+PMU_EVENT_ATTR_STRING(hvdp_atwait, bcm2712_hvdp_atwait, "monitor=0,bus=10,counter=0");
+PMU_EVENT_ATTR_STRING(hvdp_atrans, bcm2712_hvdp_atrans, "monitor=0,bus=10,counter=1");
+PMU_EVENT_ATTR_STRING(hvdp_amax, bcm2712_hvdp_amax, "monitor=0,bus=10,counter=2");
+PMU_EVENT_ATTR_STRING(hvdp_wwait, bcm2712_hvdp_wwait, "monitor=0,bus=10,counter=3");
+PMU_EVENT_ATTR_STRING(hvdp_wtrans, bcm2712_hvdp_wtrans, "monitor=0,bus=10,counter=4");
+PMU_EVENT_ATTR_STRING(hvdp_wmax, bcm2712_hvdp_wmax, "monitor=0,bus=10,counter=5");
+PMU_EVENT_ATTR_STRING(hvdp_rwait, bcm2712_hvdp_rwait, "monitor=0,bus=10,counter=6");
+PMU_EVENT_ATTR_STRING(hvdp_rtrans, bcm2712_hvdp_rtrans, "monitor=0,bus=10,counter=7");
+PMU_EVENT_ATTR_STRING(hvdp_rmax, bcm2712_hvdp_rmax, "monitor=0,bus=10,counter=8");
+PMU_EVENT_ATTR_STRING(hvdp_rpend, bcm2712_hvdp_rpend, "monitor=0,bus=10,counter=9");
+PMU_EVENT_ATTR_STRING(hvdp_ratrans, bcm2712_hvdp_ratrans, "monitor=0,bus=10,counter=10");
+PMU_EVENT_ATTR_STRING(per_atwait, bcm2712_per_atwait, "monitor=0,bus=11,counter=0");
+PMU_EVENT_ATTR_STRING(per_atrans, bcm2712_per_atrans, "monitor=0,bus=11,counter=1");
+PMU_EVENT_ATTR_STRING(per_amax, bcm2712_per_amax, "monitor=0,bus=11,counter=2");
+PMU_EVENT_ATTR_STRING(per_wwait, bcm2712_per_wwait, "monitor=0,bus=11,counter=3");
+PMU_EVENT_ATTR_STRING(per_wtrans, bcm2712_per_wtrans, "monitor=0,bus=11,counter=4");
+PMU_EVENT_ATTR_STRING(per_wmax, bcm2712_per_wmax, "monitor=0,bus=11,counter=5");
+PMU_EVENT_ATTR_STRING(per_rwait, bcm2712_per_rwait, "monitor=0,bus=11,counter=6");
+PMU_EVENT_ATTR_STRING(per_rtrans, bcm2712_per_rtrans, "monitor=0,bus=11,counter=7");
+PMU_EVENT_ATTR_STRING(per_rmax, bcm2712_per_rmax, "monitor=0,bus=11,counter=8");
+PMU_EVENT_ATTR_STRING(per_rpend, bcm2712_per_rpend, "monitor=0,bus=11,counter=9");
+PMU_EVENT_ATTR_STRING(per_ratrans, bcm2712_per_ratrans, "monitor=0,bus=11,counter=10");
+PMU_EVENT_ATTR_STRING(system_l2_atwait, bcm2712_system_l2_atwait, "monitor=0,bus=12,counter=0");
+PMU_EVENT_ATTR_STRING(system_l2_atrans, bcm2712_system_l2_atrans, "monitor=0,bus=12,counter=1");
+PMU_EVENT_ATTR_STRING(system_l2_amax, bcm2712_system_l2_amax, "monitor=0,bus=12,counter=2");
+PMU_EVENT_ATTR_STRING(system_l2_wwait, bcm2712_system_l2_wwait, "monitor=0,bus=12,counter=3");
+PMU_EVENT_ATTR_STRING(system_l2_wtrans, bcm2712_system_l2_wtrans, "monitor=0,bus=12,counter=4");
+PMU_EVENT_ATTR_STRING(system_l2_wmax, bcm2712_system_l2_wmax, "monitor=0,bus=12,counter=5");
+PMU_EVENT_ATTR_STRING(system_l2_rwait, bcm2712_system_l2_rwait, "monitor=0,bus=12,counter=6");
+PMU_EVENT_ATTR_STRING(system_l2_rtrans, bcm2712_system_l2_rtrans, "monitor=0,bus=12,counter=7");
+PMU_EVENT_ATTR_STRING(system_l2_rmax, bcm2712_system_l2_rmax, "monitor=0,bus=12,counter=8");
+PMU_EVENT_ATTR_STRING(system_l2_rpend, bcm2712_system_l2_rpend, "monitor=0,bus=12,counter=9");
+PMU_EVENT_ATTR_STRING(system_l2_ratrans, bcm2712_system_l2_ratrans, "monitor=0,bus=12,counter=10");
+static struct attribute *bcm2712_events[] = {
+	&bcm2712_vpu_uc_atwait.attr.attr,
+	&bcm2712_vpu_uc_atrans.attr.attr,
+	&bcm2712_vpu_uc_amax.attr.attr,
+	&bcm2712_vpu_uc_wwait.attr.attr,
+	&bcm2712_vpu_uc_wtrans.attr.attr,
+	&bcm2712_vpu_uc_wmax.attr.attr,
+	&bcm2712_vpu_uc_rwait.attr.attr,
+	&bcm2712_vpu_uc_rtrans.attr.attr,
+	&bcm2712_vpu_uc_rmax.attr.attr,
+	&bcm2712_vpu_uc_rpend.attr.attr,
+	&bcm2712_vpu_uc_ratrans.attr.attr,
+	&bcm2712_display_top_atwait.attr.attr,
+	&bcm2712_display_top_atrans.attr.attr,
+	&bcm2712_display_top_amax.attr.attr,
+	&bcm2712_display_top_wwait.attr.attr,
+	&bcm2712_display_top_wtrans.attr.attr,
+	&bcm2712_display_top_wmax.attr.attr,
+	&bcm2712_display_top_rwait.attr.attr,
+	&bcm2712_display_top_rtrans.attr.attr,
+	&bcm2712_display_top_rmax.attr.attr,
+	&bcm2712_display_top_rpend.attr.attr,
+	&bcm2712_display_top_ratrans.attr.attr,
+	&bcm2712_v3d_atwait.attr.attr,
+	&bcm2712_v3d_atrans.attr.attr,
+	&bcm2712_v3d_amax.attr.attr,
+	&bcm2712_v3d_wwait.attr.attr,
+	&bcm2712_v3d_wtrans.attr.attr,
+	&bcm2712_v3d_wmax.attr.attr,
+	&bcm2712_v3d_rwait.attr.attr,
+	&bcm2712_v3d_rtrans.attr.attr,
+	&bcm2712_v3d_rmax.attr.attr,
+	&bcm2712_v3d_rpend.attr.attr,
+	&bcm2712_v3d_ratrans.attr.attr,
+	&bcm2712_arm_atwait.attr.attr,
+	&bcm2712_arm_atrans.attr.attr,
+	&bcm2712_arm_amax.attr.attr,
+	&bcm2712_arm_wwait.attr.attr,
+	&bcm2712_arm_wtrans.attr.attr,
+	&bcm2712_arm_wmax.attr.attr,
+	&bcm2712_arm_rwait.attr.attr,
+	&bcm2712_arm_rtrans.attr.attr,
+	&bcm2712_arm_rmax.attr.attr,
+	&bcm2712_arm_rpend.attr.attr,
+	&bcm2712_arm_ratrans.attr.attr,
+	&bcm2712_xpt_atwait.attr.attr,
+	&bcm2712_xpt_atrans.attr.attr,
+	&bcm2712_xpt_amax.attr.attr,
+	&bcm2712_xpt_wwait.attr.attr,
+	&bcm2712_xpt_wtrans.attr.attr,
+	&bcm2712_xpt_wmax.attr.attr,
+	&bcm2712_xpt_rwait.attr.attr,
+	&bcm2712_xpt_rtrans.attr.attr,
+	&bcm2712_xpt_rmax.attr.attr,
+	&bcm2712_xpt_rpend.attr.attr,
+	&bcm2712_xpt_ratrans.attr.attr,
+	&bcm2712_bstm_top_atwait.attr.attr,
+	&bcm2712_bstm_top_atrans.attr.attr,
+	&bcm2712_bstm_top_amax.attr.attr,
+	&bcm2712_bstm_top_wwait.attr.attr,
+	&bcm2712_bstm_top_wtrans.attr.attr,
+	&bcm2712_bstm_top_wmax.attr.attr,
+	&bcm2712_bstm_top_rwait.attr.attr,
+	&bcm2712_bstm_top_rtrans.attr.attr,
+	&bcm2712_bstm_top_rmax.attr.attr,
+	&bcm2712_bstm_top_rpend.attr.attr,
+	&bcm2712_bstm_top_ratrans.attr.attr,
+	&bcm2712_pcie_01_atwait.attr.attr,
+	&bcm2712_pcie_01_atrans.attr.attr,
+	&bcm2712_pcie_01_amax.attr.attr,
+	&bcm2712_pcie_01_wwait.attr.attr,
+	&bcm2712_pcie_01_wtrans.attr.attr,
+	&bcm2712_pcie_01_wmax.attr.attr,
+	&bcm2712_pcie_01_rwait.attr.attr,
+	&bcm2712_pcie_01_rtrans.attr.attr,
+	&bcm2712_pcie_01_rmax.attr.attr,
+	&bcm2712_pcie_01_rpend.attr.attr,
+	&bcm2712_pcie_01_ratrans.attr.attr,
+	&bcm2712_argon_top_atwait.attr.attr,
+	&bcm2712_argon_top_atrans.attr.attr,
+	&bcm2712_argon_top_amax.attr.attr,
+	&bcm2712_argon_top_wwait.attr.attr,
+	&bcm2712_argon_top_wtrans.attr.attr,
+	&bcm2712_argon_top_wmax.attr.attr,
+	&bcm2712_argon_top_rwait.attr.attr,
+	&bcm2712_argon_top_rtrans.attr.attr,
+	&bcm2712_argon_top_rmax.attr.attr,
+	&bcm2712_argon_top_rpend.attr.attr,
+	&bcm2712_argon_top_ratrans.attr.attr,
+	&bcm2712_arb3_atwait.attr.attr,
+	&bcm2712_arb3_atrans.attr.attr,
+	&bcm2712_arb3_amax.attr.attr,
+	&bcm2712_arb3_wwait.attr.attr,
+	&bcm2712_arb3_wtrans.attr.attr,
+	&bcm2712_arb3_wmax.attr.attr,
+	&bcm2712_arb3_rwait.attr.attr,
+	&bcm2712_arb3_rtrans.attr.attr,
+	&bcm2712_arb3_rmax.attr.attr,
+	&bcm2712_arb3_rpend.attr.attr,
+	&bcm2712_arb3_ratrans.attr.attr,
+	&bcm2712_src_atwait.attr.attr,
+	&bcm2712_src_atrans.attr.attr,
+	&bcm2712_src_amax.attr.attr,
+	&bcm2712_src_wwait.attr.attr,
+	&bcm2712_src_wtrans.attr.attr,
+	&bcm2712_src_wmax.attr.attr,
+	&bcm2712_src_rwait.attr.attr,
+	&bcm2712_src_rtrans.attr.attr,
+	&bcm2712_src_rmax.attr.attr,
+	&bcm2712_src_rpend.attr.attr,
+	&bcm2712_src_ratrans.attr.attr,
+	&bcm2712_hvdp_atwait.attr.attr,
+	&bcm2712_hvdp_atrans.attr.attr,
+	&bcm2712_hvdp_amax.attr.attr,
+	&bcm2712_hvdp_wwait.attr.attr,
+	&bcm2712_hvdp_wtrans.attr.attr,
+	&bcm2712_hvdp_wmax.attr.attr,
+	&bcm2712_hvdp_rwait.attr.attr,
+	&bcm2712_hvdp_rtrans.attr.attr,
+	&bcm2712_hvdp_rmax.attr.attr,
+	&bcm2712_hvdp_rpend.attr.attr,
+	&bcm2712_hvdp_ratrans.attr.attr,
+	&bcm2712_per_atwait.attr.attr,
+	&bcm2712_per_atrans.attr.attr,
+	&bcm2712_per_amax.attr.attr,
+	&bcm2712_per_wwait.attr.attr,
+	&bcm2712_per_wtrans.attr.attr,
+	&bcm2712_per_wmax.attr.attr,
+	&bcm2712_per_rwait.attr.attr,
+	&bcm2712_per_rtrans.attr.attr,
+	&bcm2712_per_rmax.attr.attr,
+	&bcm2712_per_rpend.attr.attr,
+	&bcm2712_per_ratrans.attr.attr,
+	&bcm2712_system_l2_atwait.attr.attr,
+	&bcm2712_system_l2_atrans.attr.attr,
+	&bcm2712_system_l2_amax.attr.attr,
+	&bcm2712_system_l2_wwait.attr.attr,
+	&bcm2712_system_l2_wtrans.attr.attr,
+	&bcm2712_system_l2_wmax.attr.attr,
+	&bcm2712_system_l2_rwait.attr.attr,
+	&bcm2712_system_l2_rtrans.attr.attr,
+	&bcm2712_system_l2_rmax.attr.attr,
+	&bcm2712_system_l2_rpend.attr.attr,
+	&bcm2712_system_l2_ratrans.attr.attr,
+	NULL,
+};
+
+static const struct attribute_group rpi_axi_pmu_bcm2712_events_group = {
+	.name = "events",
+	.attrs = bcm2712_events,
+};
+
 static const struct attribute_group *rpi_axi_pmu_bcm2835_attr_groups[] = {
 	&rpi_axi_pmu_format_group,
 	&rpi_axi_pmu_bcm2835_events_group,
@@ -2034,6 +2485,13 @@ static const struct attribute_group *rpi_axi_pmu_bcm2711_attr_groups[] = {
 	NULL,
 };
 
+static const struct attribute_group *rpi_axi_pmu_bcm2712_attr_groups[] = {
+	&rpi_axi_pmu_format_group,
+	&rpi_axi_pmu_bcm2712_events_group,
+	&rpi_axi_pmu_cpumask_group,
+	NULL,
+};
+
 /**
  * rpi_axi_pmu__validate_event() - Validates single event resource capability
  * @pmu: Pointer to core PMU struct
@@ -2760,6 +3218,8 @@ static int rpi_axi_pmu__init(struct rpi_axi_pmu *pmu, struct platform_device *pd
 
 	for (int i = 0; i < MON_MAX; i++) {
 		rpi_axi_hw_events__init(&pmu->monitor[i].hw_events);
+		if (pmu->chip == CHIP_BCM2712 && i == MON_VPU)
+			continue;
 		if (pmu->monitor[i].use_mailbox_interface) {
 			int addr_cells = of_n_addr_cells(dev->of_node);
 			int size_cells = of_n_size_cells(dev->of_node);
@@ -2792,7 +3252,9 @@ static int rpi_axi_pmu__init(struct rpi_axi_pmu *pmu, struct platform_device *pd
 		goto err_teardown;
 	}
 
-	if (pmu->chip == CHIP_BCM2711)
+	if (pmu->chip == CHIP_BCM2712)
+		pmu->pmu.attr_groups = (const struct attribute_group **)rpi_axi_pmu_bcm2712_attr_groups;
+	else if (pmu->chip == CHIP_BCM2711)
 		pmu->pmu.attr_groups = (const struct attribute_group **)rpi_axi_pmu_bcm2711_attr_groups;
 	else
 		pmu->pmu.attr_groups = (const struct attribute_group **)rpi_axi_pmu_bcm2835_attr_groups;
@@ -2878,6 +3340,10 @@ static const struct of_device_id rpi_axi_pmu_match[] = {
 		.compatible = "brcm,bcm2711-axiperf",
 		.data = (void *)CHIP_BCM2711,
 	},
+	{
+		.compatible = "brcm,bcm2712-axiperf",
+		.data = (void *)CHIP_BCM2712,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpi_axi_pmu_match);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


