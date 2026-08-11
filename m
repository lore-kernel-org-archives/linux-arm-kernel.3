Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A030C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 23:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jc4GcdCP1Os25MddAindfddWw8xojw8xAWI6E2/PvDk=; b=LPZPPXlaZHAa9ZB6ZnbBWvITh3
	sLQFrtntmezPopd9javsYz6AS7iO9YIgM8JaRyCyXBmOmXERHWQq0gJYA3w0R7jXcBergWThWD9J8
	ECYVEW7yzX5hxCOCXUC+IbccZ8nyEdW/LRF3lEH0TYUIePenja9Ff6Bcc4Jpb/L1QCoDZHbKzoygL
	7+xydKKxeYqK4MSthGCQJjx2x6gZvm4qJNcjgiOPQ1NOxTknqnMtEKZEEcd21JYLEXWGBPedP7C0/
	oZQu5YdfzxBV8Cersa6KwDlsnskSECHPwD7qinlzR5jGdR7U7/+Fs6UOCkfXRTavglzkwe+HZj0Ta
	3iv60DWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwFk-0000000F6km-0aFY;
	Tue, 11 Aug 2026 23:51:28 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwFg-0000000F6hg-3Whs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 23:51:26 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so380727a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 16:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786492282; x=1787097082; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jc4GcdCP1Os25MddAindfddWw8xojw8xAWI6E2/PvDk=;
        b=ZbtBveDGsgynesQFgemCKznISSAprRQ6JuNKi+p1fJQ5PZAm0tLZ3cyv5R88BsQpqi
         kNprWUSHHHjnGn5nROCo6hSeJWsM7y+wHCPMKw4LjWtREyV6fTALYnD758c1tYA1fmXx
         9Hol0Kp+fMRdcHJy5FHFFYScwMX2syUP+0soHvCKazV1dU3Db8Ys6mS35eMAiRrZ4AnI
         23T7GSrgQepavM0Qz8UoiVJP3hXIG4/Hr3Fwv0o2asqyEf3NAJdw5W1mQYvFwSB6RJOx
         e9HZLYkUWVhEikqzriO7wc4I4BH60+TGMhTQIkKRPlE/orXqEPgjubQLHHivfUrdWtJU
         WW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786492282; x=1787097082;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jc4GcdCP1Os25MddAindfddWw8xojw8xAWI6E2/PvDk=;
        b=CI9BkZWQ2LvdKKBcV8CeCVvLHVnS0eQjKD1hOMOxEV0stxFWq+w0ZN1nuZ4xl82saY
         3qgliww8ukyGOZJCdNS/V1pusuXI5AVTBwZAxEOKxlZgK3EqJmL1ujb1g/xblz+7FrfO
         387rUOCHHntmLYdtPw4jlYxOP6Hq/hg+Lbr3Q8mW2RtKP86TFq5QqO26QKerrSV7Qm5j
         4ofGxAbMleyaa17035hSFQfz3FlQ6kTCna/1kb7WM2oKX8c7i7Srj7mxwaDuX+KWOYzK
         4TjFtmU50soVllzJH5AWmYajnF4/qRfT/4A8ZRj+jr+k79M0tVfDFPBDogm2rYOszBrS
         aY2A==
X-Gm-Message-State: AOJu0YzBkNQ5CZZ25DAH1ytkh9lSJkVeBkOWpfaQE99M/5CbjWkfAEbQ
	8aigBbEa5UJjQKhcNUCXbxAo1R2Ab1ea86ay9UCfyRrYRAOqgqGSXiMOt8Q3sJOk8IVEuHLsYvd
	qsVzDuzT8vg==
X-Received: from dlea6-n2.prod.google.com ([2002:a05:701b:4206:20b0:13c:d017:a244])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9182:b0:3c3:8c91:5da0
 with SMTP id adf61e73a8af0-3cc3f5f3eeamr780887637.15.1786492282195; Tue, 11
 Aug 2026 16:51:22 -0700 (PDT)
Date: Tue, 11 Aug 2026 16:51:12 -0700
In-Reply-To: <20260811235112.2267241-1-irogers@google.com>
Mime-Version: 1.0
References: <20260811083828.2057695-1-irogers@google.com> <20260811235112.2267241-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260811235112.2267241-3-irogers@google.com>
Subject: [PATCH v2 2/2] perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, will@kernel.org, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_165125_024224_41FD9F61 
X-CRM114-Status: GOOD (  18.37  )
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

Expand the Raspberry Pi AXI PMU driver to support Broadcom BCM2712
(Raspberry Pi 5) system monitors, PCIe RP1 Southbridge links, HEVC decoder,
and Cortex-A76 DSU L3 interconnects.

Assisted-by: Antigravity:gemini-3.6-flash
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/perf/Kconfig       |   4 +-
 drivers/perf/rpi_axi_pmu.c | 278 +++++++++++++++++++++++++++++++++++--
 2 files changed, 272 insertions(+), 10 deletions(-)

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 97c8bf34f463..b0c4eb0748dd 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -327,11 +327,11 @@ config NVIDIA_TEGRA410_C2C_PMU
 
 config RASPBERRYPI_AXI_PMU
 	tristate "Raspberry Pi AXI PMU support"
-	depends on ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST
+	depends on ARCH_BCM2835 || ARCH_BCM2712 || ARCH_BRCMSTB || COMPILE_TEST
 	select RASPBERRYPI_FIRMWARE if ARCH_BCM2835
 	help
 	  Support for the AXI Performance Monitoring Unit (PMU) found on Broadcom
-	  SoCs used in Raspberry Pi platforms (BCM2835, BCM2836, BCM2837, BCM2711).
+	  SoCs used in Raspberry Pi platforms (BCM2835, BCM2836, BCM2837, BCM2711, BCM2712).
 
 	  If compiled as a module, it will be called rpi_axi_pmu.
 
diff --git a/drivers/perf/rpi_axi_pmu.c b/drivers/perf/rpi_axi_pmu.c
index cdf7d9a74f13..b13632fa8f84 100644
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
  * 1. System Monitor (MON__SYSTEM = 0):
- *    Monitors system-level AXI traffic (ARM CPU L2/UC, DMA, V3D, ISP, HVS).
+ *    Monitors system-level AXI traffic (ARM CPU L2/UC, DMA, V3D, ISP, HVS, PCIe/RP1).
  *    Directly memory-mapped via ARM physical IO memory space (MMIO).
  *    Read latency: ~10-20 nanoseconds (fast, atomic-safe, non-blocking).
  *
@@ -19,6 +20,7 @@
  *    Monitors VideoCore VPU buses (VPU0/1 Data/Instruction L2/UC, SDRAM, etc.).
  *    Accessible through VideoCore firmware mailbox IPC (RPI_FIRMWARE_SET/GET_PERIPH_REG).
  *    Read latency: ~10-100 microseconds (IPC over VPU mailbox).
+ *    On BCM2712 (RPi 5), VPU Mailbox IPC is replaced by direct PCIe and MMIO mapping.
  *
  * Synchronization & Concurrency Model:
  * ------------------------------------
@@ -60,9 +62,11 @@
 /**
  * enum rpi_axi_chip - Supported Broadcom SoC generations
  * @CHIP_BCM2835: BCM2835 / BCM2836 / BCM2837 / BCM2711 (RPi 1-4, CM 1-4, Zero/W)
+ * @CHIP_BCM2712: BCM2712 (RPi 5, CM 5)
  */
 enum rpi_axi_chip {
 	CHIP_BCM2835 = 0,
+	CHIP_BCM2712,
 };
 
 enum monitor {
@@ -114,6 +118,44 @@ enum bcm2835_system_bus {
 	BCM2835_SB__MAX
 };
 
+/**
+ * enum bcm2712_system_bus - AXI buses monitored by System Monitor on BCM2712 (RPi 5)
+ * @BCM2712_SB__DMA_L2: DMA engine L2 cache interconnect bus
+ * @BCM2712_SB__TRANS: Transposer engine bus
+ * @BCM2712_SB__JPEG: Hardware JPEG codec acceleration bus
+ * @BCM2712_SB__SYSTEM_UC: System Uncached memory bus
+ * @BCM2712_SB__DMA_UC: DMA Uncached memory bus
+ * @BCM2712_SB__SYSTEM_L2: System main L2 cache bus
+ * @BCM2712_SB__PCIE_RP1: PCIe 2.0 x4 RP1 Southbridge link bus (USB 3.0, Ethernet, I/O)
+ * @BCM2712_SB__HEVC_DEC: HEVC (H.265) hardware video decoder bus
+ * @BCM2712_SB__A76_DSU_L3: Quad-core Arm Cortex-A76 DynamIQ Shared Unit (DSU) L3 bus
+ * @BCM2712_SB__HVS: Hardware Video Scaler (HVS) display composition engine bus
+ * @BCM2712_SB__V3D7: VideoCore VII 3D graphics hardware pipeline bus
+ * @BCM2712_SB__ISP: Image Sensor Processor (ISP) camera pipeline bus
+ * @BCM2712_SB__PERIPHERAL: System peripherals bus
+ * @BCM2712_SB__CPU_UC: CPU Uncached memory bus
+ * @BCM2712_SB__CPU_L2: CPU L2 cache bus
+ * @BCM2712_SB__MAX: Total count of monitored system buses on BCM2712
+ */
+enum bcm2712_system_bus {
+	BCM2712_SB__DMA_L2 = 0,
+	BCM2712_SB__TRANS,
+	BCM2712_SB__JPEG,
+	BCM2712_SB__SYSTEM_UC,
+	BCM2712_SB__DMA_UC,
+	BCM2712_SB__SYSTEM_L2,
+	BCM2712_SB__PCIE_RP1,
+	BCM2712_SB__HEVC_DEC,
+	BCM2712_SB__A76_DSU_L3,
+	BCM2712_SB__HVS,
+	BCM2712_SB__V3D7,
+	BCM2712_SB__ISP,
+	BCM2712_SB__PERIPHERAL,
+	BCM2712_SB__CPU_UC,
+	BCM2712_SB__CPU_L2,
+	BCM2712_SB__MAX
+};
+
 /**
  * enum vpu_bus - AXI buses monitored by VPU Monitor on BCM2835-BCM2711 (RPi 1-4)
  * @VPU__VPU1_D_L2: VideoCore VPU Core 1 Data L2 cache bus
@@ -246,6 +288,94 @@ enum bcm2835_filter {
 	BCM2835_FLT__MAX
 };
 
+/**
+ * enum bcm2712_filter - AXI master ID filter options for BCM2712 (RPi 5)
+ * @BCM2712_FLT__NONE: Disable master ID filtering (monitor all traffic on bus)
+ * @BCM2712_FLT__VPU_UC0: VPU Uncached 0 master ID
+ * @BCM2712_FLT__VPU_IC0: VPU I-Cache 0 master ID
+ * @BCM2712_FLT__VPU_DC0: VPU D-Cache 0 master ID
+ * @BCM2712_FLT__VPU_UC1: VPU Uncached 1 master ID
+ * @BCM2712_FLT__VPU_IC1: VPU I-Cache 1 master ID
+ * @BCM2712_FLT__VPU_DC1: VPU D-Cache 1 master ID
+ * @BCM2712_FLT__VPU_L2: VPU L2 Cache master ID
+ * @BCM2712_FLT__DMA2: DMA2 master ID
+ * @BCM2712_FLT__VPU_DEBUG: VPU Debug master ID
+ * @BCM2712_FLT__ARM: Arm Quad-Core CPU Cluster master ID
+ * @BCM2712_FLT__DMA0: DMA0 master ID
+ * @BCM2712_FLT__DMA1: DMA1 master ID
+ * @BCM2712_FLT__RAAGA: RAAGA Audio Engine master ID
+ * @BCM2712_FLT__BBSI: BBSI master ID
+ * @BCM2712_FLT__PCIE0: RP1 PCIe Southbridge 0 master ID
+ * @BCM2712_FLT__PCIE1: PCIe 1 master ID
+ * @BCM2712_FLT__PCIE2: PCIe 2 master ID
+ * @BCM2712_FLT__UMR: UMR master ID
+ * @BCM2712_FLT__SAGE: SAGE master ID
+ * @BCM2712_FLT__HVDP: HVDP master ID
+ * @BCM2712_FLT__BSP: BSP master ID
+ * @BCM2712_FLT__HVS: Hardware Video Scaler (HVS) display engine master ID
+ * @BCM2712_FLT__HVS_WMK: HVS Watermark master ID
+ * @BCM2712_FLT__MOP0: MOP0 master ID
+ * @BCM2712_FLT__MOP1: MOP1 master ID
+ * @BCM2712_FLT__MBVN: MBVN master ID
+ * @BCM2712_FLT__DSI: DSI Display Interface master ID
+ * @BCM2712_FLT__XPT: XPT master ID
+ * @BCM2712_FLT__EMMC0: SD/eMMC Controller 0 master ID
+ * @BCM2712_FLT__GENET: Gigabit Ethernet Controller master ID
+ * @BCM2712_FLT__USB: USB Controller master ID
+ * @BCM2712_FLT__MAX: Maximum filter ID count for BCM2712
+ */
+enum bcm2712_filter {
+	BCM2712_FLT__NONE = 0,
+	BCM2712_FLT__VPU_UC0 = 1,
+	BCM2712_FLT__VPU_IC0 = 2,
+	BCM2712_FLT__VPU_DC0 = 3,
+	BCM2712_FLT__VPU_UC1 = 4,
+	BCM2712_FLT__VPU_IC1 = 5,
+	BCM2712_FLT__VPU_DC1 = 6,
+	BCM2712_FLT__VPU_L2 = 7,
+	BCM2712_FLT__DMA2 = 8,
+	BCM2712_FLT__VPU_DEBUG = 9,
+	BCM2712_FLT__ARM = 10,
+	BCM2712_FLT__DMA0 = 11,
+	BCM2712_FLT__DMA1 = 12,
+	BCM2712_FLT__RAAGA = 13,
+	BCM2712_FLT__BBSI = 14,
+	BCM2712_FLT__PCIE0 = 15,
+	BCM2712_FLT__PCIE1 = 16,
+	BCM2712_FLT__PCIE2 = 17,
+	BCM2712_FLT__UMR = 18,
+	BCM2712_FLT__SAGE = 19,
+	BCM2712_FLT__HVDP = 20,
+	BCM2712_FLT__BSP = 21,
+	BCM2712_FLT__HVS = 22,
+	BCM2712_FLT__HVS_WMK = 23,
+	BCM2712_FLT__MOP0 = 24,
+	BCM2712_FLT__MOP1 = 25,
+	BCM2712_FLT__MBVN = 26,
+	BCM2712_FLT__DSI = 27,
+	BCM2712_FLT__XPT = 28,
+	BCM2712_FLT__EMMC0 = 29,
+	BCM2712_FLT__GENET = 30,
+	BCM2712_FLT__USB = 31,
+	BCM2712_FLT__MAX = 32
+};
+
+/* Compile-time static assertions verifying cross-generation enum equivalence */
+static_assert((int)BCM2835_FLT__NONE == (int)BCM2712_FLT__NONE,
+	      "Filter NONE enum value mismatch across BCM2835 and BCM2712");
+static_assert((int)BCM2835_SB__DMA_L2 == (int)BCM2712_SB__DMA_L2,
+	      "DMA_L2 bus enum value mismatch across BCM2835 and BCM2712");
+static_assert((int)BCM2835_SB__TRANS == (int)BCM2712_SB__TRANS,
+	      "TRANS bus enum value mismatch across BCM2835 and BCM2712");
+static_assert((int)BCM2835_SB__JPEG == (int)BCM2712_SB__JPEG,
+	      "JPEG bus enum value mismatch across BCM2835 and BCM2712");
+static_assert((int)BCM2835_SB__SYSTEM_UC == (int)BCM2712_SB__SYSTEM_UC,
+	      "SYSTEM_UC bus enum value mismatch across BCM2835 and BCM2712");
+static_assert((int)BCM2835_SB__DMA_UC == (int)BCM2712_SB__DMA_UC,
+	      "DMA_UC bus enum value mismatch across BCM2835 and BCM2712");
+static_assert((int)BCM2835_SB__SYSTEM_L2 == (int)BCM2712_SB__SYSTEM_L2,
+	      "SYSTEM_L2 bus enum value mismatch across BCM2835 and BCM2712");
+
 /* Hardware register offsets & control bitwise constants */
 #define GEN_CTRL			0x00
 #define GEN_CTL_ENABLE_BIT		BIT(0)
@@ -475,16 +605,24 @@ static bool config_is_valid(struct rpi_axi_pmu *pmu, __u64 config)
 	if (!pmu->monitor[mon].use_mailbox_interface && !pmu->monitor[mon].base_address)
 		return false;
 
-	if (mon == MON__SYSTEM) {
-		if (bus >= BCM2835_SB__MAX)
+	if (pmu->chip == CHIP_BCM2712) {
+		if (mon != MON__SYSTEM)
+			return false;
+		if (bus >= BCM2712_SB__MAX)
+			return false;
+		if (filter >= BCM2712_FLT__MAX)
 			return false;
 	} else {
-		if (bus >= VPU__MAX)
+		if (mon == MON__SYSTEM) {
+			if (bus >= BCM2835_SB__MAX)
+				return false;
+		} else {
+			if (bus >= VPU__MAX)
+				return false;
+		}
+		if (filter >= BCM2835_FLT__MAX)
 			return false;
 	}
-	if (filter >= BCM2835_FLT__MAX)
-		return false;
-
 	return counter < CNT__MAX;
 }
 
@@ -711,6 +849,44 @@ PMU_EVENT_ATTR_STRING(isp_system_l2_wtrans, rpi_axi_pmu_event_isp_system_l2_wtra
 PMU_EVENT_ATTR_STRING(usb_system_l2_rtrans, rpi_axi_pmu_event_usb_system_l2_rtrans, "monitor=0,bus=5,counter=4,filter=24");
 PMU_EVENT_ATTR_STRING(usb_system_l2_wtrans, rpi_axi_pmu_event_usb_system_l2_wtrans, "monitor=0,bus=5,counter=2,filter=24");
 
+/* --- RASPBERRY PI 5 (BCM2712) EXPANDED EVENT ALIASES ---------------------- */
+
+/* PCIe 2.0 x4 RP1 Southbridge Link Bus Events & Stall Wait Cycles (bus=6, BCM2712_SB__PCIE_RP1) */
+PMU_EVENT_ATTR_STRING(pcie_rp1_atrans,        rpi_axi_pmu_event_pcie_rp1_atrans,        "monitor=0,bus=6,counter=0");
+PMU_EVENT_ATTR_STRING(pcie_rp1_atwait,        rpi_axi_pmu_event_pcie_rp1_atwait,        "monitor=0,bus=6,counter=1");
+PMU_EVENT_ATTR_STRING(pcie_rp1_wtrans,        rpi_axi_pmu_event_pcie_rp1_wtrans,        "monitor=0,bus=6,counter=2");
+PMU_EVENT_ATTR_STRING(pcie_rp1_wtwait,        rpi_axi_pmu_event_pcie_rp1_wtwait,        "monitor=0,bus=6,counter=3");
+PMU_EVENT_ATTR_STRING(pcie_rp1_rtrans,        rpi_axi_pmu_event_pcie_rp1_rtrans,        "monitor=0,bus=6,counter=4");
+PMU_EVENT_ATTR_STRING(pcie_rp1_rtwait,        rpi_axi_pmu_event_pcie_rp1_rtwait,        "monitor=0,bus=6,counter=5");
+
+/* HEVC (H.265) Hardware Video Decoder Bus Events (bus=7, BCM2712_SB__HEVC_DEC) */
+PMU_EVENT_ATTR_STRING(hevc_dec_atrans,        rpi_axi_pmu_event_hevc_dec_atrans,        "monitor=0,bus=7,counter=0");
+PMU_EVENT_ATTR_STRING(hevc_dec_wtrans,        rpi_axi_pmu_event_hevc_dec_wtrans,        "monitor=0,bus=7,counter=2");
+PMU_EVENT_ATTR_STRING(hevc_dec_rtrans,        rpi_axi_pmu_event_hevc_dec_rtrans,        "monitor=0,bus=7,counter=4");
+
+/* Arm Cortex-A76 DSU L3 Interconnect Bus Events (bus=8, BCM2712_SB__A76_DSU_L3) */
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_atrans,      rpi_axi_pmu_event_a76_dsu_l3_atrans,      "monitor=0,bus=8,counter=0");
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_wtrans,      rpi_axi_pmu_event_a76_dsu_l3_wtrans,      "monitor=0,bus=8,counter=2");
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_rtrans,      rpi_axi_pmu_event_a76_dsu_l3_rtrans,      "monitor=0,bus=8,counter=4");
+
+/* VideoCore VII 3D Graphics Pipeline Bus Events (bus=10, BCM2712_SB__V3D7) */
+PMU_EVENT_ATTR_STRING(v3d7_atrans,            rpi_axi_pmu_event_v3d7_atrans,            "monitor=0,bus=10,counter=0");
+PMU_EVENT_ATTR_STRING(v3d7_wtrans,            rpi_axi_pmu_event_v3d7_wtrans,            "monitor=0,bus=10,counter=2");
+PMU_EVENT_ATTR_STRING(v3d7_rtrans,            rpi_axi_pmu_event_v3d7_rtrans,            "monitor=0,bus=10,counter=4");
+
+/*
+ * Quad-Core Arm Cortex-A76 Cores 0-3 I-Cache & D-Cache Filtered Events
+ * (bus=14, BCM2712_SB__CPU_L2)
+ */
+/* BCM2712 Master ID Filtered Events */
+PMU_EVENT_ATTR_STRING(arm_rtrans,              rpi_axi_pmu_event_arm_rtrans,              "monitor=0,bus=5,counter=4,filter=10");
+PMU_EVENT_ATTR_STRING(arm_wtrans,              rpi_axi_pmu_event_arm_wtrans,              "monitor=0,bus=5,counter=2,filter=10");
+PMU_EVENT_ATTR_STRING(pcie0_rtrans,            rpi_axi_pmu_event_pcie0_rtrans,            "monitor=0,bus=6,counter=4,filter=15");
+PMU_EVENT_ATTR_STRING(pcie0_wtrans,            rpi_axi_pmu_event_pcie0_wtrans,            "monitor=0,bus=6,counter=2,filter=15");
+PMU_EVENT_ATTR_STRING(hvs_filtered_rtrans,     rpi_axi_pmu_event_hvs_filtered_rtrans,     "monitor=0,bus=9,counter=4,filter=22");
+PMU_EVENT_ATTR_STRING(emmc0_rtrans,            rpi_axi_pmu_event_emmc0_rtrans,            "monitor=0,bus=5,counter=4,filter=29");
+PMU_EVENT_ATTR_STRING(emmc0_wtrans,            rpi_axi_pmu_event_emmc0_wtrans,            "monitor=0,bus=5,counter=2,filter=29");
+
 static struct attribute *rpi_axi_pmu_events_attrs[] = {
 	/* System Monitor events */
 	&rpi_axi_pmu_event_dma_l2_atrans.attr.attr,
@@ -867,12 +1043,94 @@ static struct attribute *rpi_axi_pmu_events_attrs[] = {
 	&rpi_axi_pmu_event_isp_system_l2_wtrans.attr.attr,
 	&rpi_axi_pmu_event_usb_system_l2_rtrans.attr.attr,
 	&rpi_axi_pmu_event_usb_system_l2_wtrans.attr.attr,
+
+	/* RPi 5 (BCM2712) Expanded Event Aliases */
+	&rpi_axi_pmu_event_pcie_rp1_atrans.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_atwait.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_wtrans.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_wtwait.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_rtrans.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_rtwait.attr.attr,
+
+	&rpi_axi_pmu_event_hevc_dec_atrans.attr.attr,
+	&rpi_axi_pmu_event_hevc_dec_wtrans.attr.attr,
+	&rpi_axi_pmu_event_hevc_dec_rtrans.attr.attr,
+
+	&rpi_axi_pmu_event_a76_dsu_l3_atrans.attr.attr,
+	&rpi_axi_pmu_event_a76_dsu_l3_wtrans.attr.attr,
+	&rpi_axi_pmu_event_a76_dsu_l3_rtrans.attr.attr,
+
+	&rpi_axi_pmu_event_v3d7_atrans.attr.attr,
+	&rpi_axi_pmu_event_v3d7_wtrans.attr.attr,
+	&rpi_axi_pmu_event_v3d7_rtrans.attr.attr,
+
+	&rpi_axi_pmu_event_arm_rtrans.attr.attr,
+	&rpi_axi_pmu_event_arm_wtrans.attr.attr,
+	&rpi_axi_pmu_event_pcie0_rtrans.attr.attr,
+	&rpi_axi_pmu_event_pcie0_wtrans.attr.attr,
+	&rpi_axi_pmu_event_hvs_filtered_rtrans.attr.attr,
+	&rpi_axi_pmu_event_emmc0_rtrans.attr.attr,
+	&rpi_axi_pmu_event_emmc0_wtrans.attr.attr,
 	NULL,
 };
 
+/**
+ * rpi_axi_pmu_events_is_visible() - Sysfs attribute visibility callback for event aliases
+ * @kobj: Pointer to sysfs kobject for events directory
+ * @attr: Pointer to sysfs attribute being queried
+ * @unused: Index (unused)
+ *
+ * Dynamically filters sysfs event aliases based on the detected Broadcom SoC generation:
+ * - On BCM2712 (RPi 5): Hides VideoCore VPU Mailbox IPC events (monitor=1).
+ * - On BCM2835-BCM2711 (RPi 1-4): Hides Cortex-A76 and RP1 PCIe specific events.
+ *
+ * Return: attr->mode (0444) if visible on current SoC, 0 to hide.
+ */
+static umode_t rpi_axi_pmu_events_is_visible(struct kobject *kobj,
+					      struct attribute *attr, int unused)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct rpi_axi_pmu *pmu = dev_get_drvdata(dev);
+	struct perf_pmu_events_attr *pmu_attr;
+
+	pmu_attr = container_of(attr, struct perf_pmu_events_attr, attr.attr);
+
+	if (pmu->chip == CHIP_BCM2712) {
+		/*
+		 * On RPi 5 (BCM2712), hide legacy VPU Mailbox IPC events (monitor=1)
+		 * and RPi 1-4 aliases
+		 */
+		if (strstr(pmu_attr->event_str, "monitor=1") ||
+		    strstr(attr->name, "cpu0_") ||
+		    strstr(attr->name, "cpu1_") ||
+		    strstr(attr->name, "dma0_") ||
+		    strstr(attr->name, "dma1_") ||
+		    strstr(attr->name, "v3d0_") ||
+		    strstr(attr->name, "v3d1_") ||
+		    strstr(attr->name, "hvs_system") ||
+		    strstr(attr->name, "isp_system") ||
+		    strstr(attr->name, "usb_system"))
+			return 0;
+	} else {
+		/* On RPi 1-4 (BCM2835-BCM2711), hide RPi 5 specific events */
+		if (strstr(attr->name, "pcie_rp1") ||
+		    strstr(attr->name, "a76_") ||
+		    strstr(attr->name, "v3d7_") ||
+		    strstr(attr->name, "hevc_dec") ||
+		    strstr(attr->name, "arm_") ||
+		    strstr(attr->name, "pcie0_") ||
+		    strstr(attr->name, "hvs_filtered") ||
+		    strstr(attr->name, "emmc0_"))
+			return 0;
+	}
+
+	return attr->mode;
+}
+
 static const struct attribute_group rpi_axi_pmu_events_group = {
 	.name = "events",
 	.attrs = rpi_axi_pmu_events_attrs,
+	.is_visible = rpi_axi_pmu_events_is_visible,
 };
 
 /**
@@ -1549,7 +1807,7 @@ static int rpi_axi_pmu__init(struct rpi_axi_pmu *pmu, struct platform_device *pd
 	spin_lock_init(&pmu->lock);
 	mutex_init(&pmu->vpu_mutex);
 
-	pmu->chip = CHIP_BCM2835;
+	pmu->chip = (enum rpi_axi_chip)(uintptr_t)of_device_get_match_data(dev);
 
 	pmu->pmu = (struct pmu) {
 		.module = THIS_MODULE,
@@ -1685,6 +1943,10 @@ static const struct of_device_id rpi_axi_pmu_match[] = {
 		.compatible = "brcm,bcm2711-axiperf",
 		.data = (void *)CHIP_BCM2835,
 	},
+	{
+		.compatible = "brcm,bcm2712-axiperf",
+		.data = (void *)CHIP_BCM2712,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpi_axi_pmu_match);
-- 
2.55.0.679.g6767b8d81c-goog


