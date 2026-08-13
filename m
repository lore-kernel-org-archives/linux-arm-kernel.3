Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DC3C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUNRVIRhlRFw76F968v4yqemIhFtdDrnNXbSqEHrcys=; b=IjU6IWY/aDDORIazEl8HzEWKBD
	Lp+9jOyQHXQ7SXwFDLX60dhUZQqzGNzD953ZcJNUIJj5wCZiAkzTOmro71X5muA3a1UL/euK/Juzl
	SmCQjLuaLBPu7KuqNkG9cd/bkCbhyEIzVoFjlmFwbMWMUs46sItwC1FGvz6bS4M/J9D9hWj/wHZeM
	OTF9wBbKeK/e4+lZNzxiLHvkQMbcR7xiGQfVaf3mlavVzp2kKqKQOLOC9xmUHndpHZse6sCsp6BdK
	cdYD7glK2iGBA4NLf6gomAVmaEMa9tZVwhB/mBW1ObrgIUAbMDLo0/YxehGi4WREoBQkMHu6+qYSg
	2maxh9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQPM-0000000051A-0Cx6;
	Thu, 13 Aug 2026 08:03:24 +0000
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQPH-000000004xK-0JfV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:03:22 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so2938354a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786608198; x=1787212998; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUNRVIRhlRFw76F968v4yqemIhFtdDrnNXbSqEHrcys=;
        b=T35OEsrbgAHyAJYa0uIdELRnejxWEfZT4sRdy/yrcTc4LUk302+UvOP6UfX/tazfmd
         rJHoSI8InTyJh3znXQQVWAMjmfVQi6UjVzc7jz09wTcIb257eVmYvP2iwtMVkxsM7x3+
         wgex9VGwKiAoOMW1X41oVDLkKnCwHZVdi1Rm8zENJ9ObwH+BoNlu4Zvq1CiR9Hn4isKI
         On0jJ5H2Fspc2Spvkl1qcJHURLfTneHdLiA5QDkvuwqh3RIdYjEK/T1IpJ+wC1vI+76T
         xqUA4SKsidbDLtkAblcTAT7dqBIq4KMrA72LVbSpYemuGGGIsUEwtdKabg8OU3cAZRwg
         VLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786608198; x=1787212998;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUNRVIRhlRFw76F968v4yqemIhFtdDrnNXbSqEHrcys=;
        b=ioZMfh95ygYvh7jdMG6myB1D1Y0FzTFQsXmPptLgug6739UMyIS6U6WP5gV1thcyH9
         ukRsSiZig7aXn7zQPlyA2skZ0RHbjmdTXh/j+ujZyVgFFeJ4tx/Hk4v5zL4WFgYhUMI3
         yWE+gkCLeZXucZJ1JaKOVuBZTZvwvX1VbV6PspBDzDagEDufF+DhtZNonigjFcrQBYZY
         AinVcuuaKTLA7RAJ990kg/4z6BgW7V2hC+T8Q/pFb5YgW+IUHO0ed5VFBTu17EJjeCWs
         W1+SIRA7YOot45z+pu7af0DuED5wi3DAhSeIPyWylOytxjnHvfK6lU6OElwFk7iujj6I
         ocOQ==
X-Gm-Message-State: AOJu0YwIpH6geFdwe9d2PK/Ahc/BYz083oRF/RCxSBrp/0PvSetZ8cty
	i4f0gMwdJvJAy/V8LVwDmIWFkDCXjVb7TFQfStm50EpXcgxLFEjD1LUCJvE+62PX83O5Cr+QLfu
	icKer3rtBKg==
X-Received: from dlc8.prod.google.com ([2002:a05:7022:388:b0:13e:6c87:9564])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3843:b0:38e:1497:af5b
 with SMTP id 98e67ed59e1d1-3931dffc226mr4525151a91.1.1786608197566; Thu, 13
 Aug 2026 01:03:17 -0700 (PDT)
Date: Thu, 13 Aug 2026 01:03:09 -0700
In-Reply-To: <cover.1691900000.git.irogers@google.com>
Mime-Version: 1.0
References: <cover.1691900000.git.irogers@google.com> <cover.1691900000.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260813080314.2836027-2-irogers@google.com>
Subject: perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_010319_154522_F74E2B5C 
X-CRM114-Status: GOOD (  17.18  )
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

This patch introduces AXI PMU support for the Broadcom BCM2712 SoC used
in the Raspberry Pi 5. It expands the driver with BCM2712-specific
buses, hardware filters, and sysfs events, while ensuring compatibility
with prior generations.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/perf/rpi_axi_pmu.c | 429 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 421 insertions(+), 8 deletions(-)

diff --git a/drivers/perf/rpi_axi_pmu.c b/drivers/perf/rpi_axi_pmu.c
index 676e8f873163..f6c5c6788a08 100644
--- a/drivers/perf/rpi_axi_pmu.c
+++ b/drivers/perf/rpi_axi_pmu.c
@@ -6,6 +6,7 @@
  * This driver exposes the performance monitoring hardware on Raspberry Pi
  * System-on-Chips to the Linux perf subsystem:
  * - Raspberry Pi 1, 2, 3, 4, Compute Modules 1-4, Zero, Zero W (SoCs BCM2835/2836/2837/2711).
+ * - Raspberry Pi 5, Compute Module 5 (SoC BCM2712).
  *
  * Architecture Overview:
  * ----------------------
@@ -19,6 +20,7 @@
  *    Monitors VideoCore VPU buses (VPU0/1 Data/Instruction L2/UC, SDRAM, etc.).
  *    Accessible through VideoCore firmware mailbox IPC (RPI_FIRMWARE_SET/GET_PERIPH_REG).
  *    Read latency: ~10-100 microseconds (IPC over VPU mailbox).
+ *    On BCM2712 (RPi 5), VPU Mailbox IPC is replaced by direct PCIe and MMIO mapping.
  *
  * Synchronization & Concurrency Model:
  * ------------------------------------
@@ -72,9 +74,11 @@ static inline void rpi_hrtimer_setup(struct hrtimer *timer,
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
@@ -126,6 +130,43 @@ enum bcm2835_system_bus {
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
 
 /**
  * enum vpu_bus - AXI buses monitored by VPU Monitor on BCM2835-BCM2711 (RPi 1-4)
@@ -259,6 +300,93 @@ enum bcm2835_filter {
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
 
 /* Hardware register offsets & control bitwise constants */
 #define GEN_CTRL			0x00
@@ -445,7 +573,7 @@ static int rpi_axi_hw_events__get_alloc_event_idx(struct rpi_axi_hw_events *hw_e
  * struct rpi_axi_pmu - Root PMU driver context
  * @pmu: Core Linux perf PMU structure
  * @pdev: Owning platform_device pointer
- * @chip: Detected Broadcom SoC generation
+ * @chip: Detected Broadcom SoC generation (CHIP_BCM2835 or CHIP_BCM2712)
  * @firmware: Raspberry Pi firmware handle for VideoCore mailbox calls (BCM2835-BCM2711)
  * @cpu: CPU core assigned to process uncore PMU events
  * @cpuhp_node: Dynamic CPU hotplug instance node
@@ -507,15 +635,24 @@ static bool config_is_valid(struct rpi_axi_pmu *pmu, __u64 config)
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
 	return counter < CNT__MAX;
 }
 
@@ -541,7 +678,7 @@ static const struct attribute_group rpi_axi_pmu_format_group = {
  * Event Attribute Scaling & Unit Definitions:
  *
  * Uncore AXI bus transaction events (_rtrans, _wtrans, _atrans) report hardware
- * transaction beats. On Broadcom BCM2835 AXI interconnects, single-beat
+ * transaction beats. On Broadcom BCM2835-BCM2712 AXI interconnects, single-beat
  * transactions transfer 32 bytes per beat, while contiguous DMA page bursts may
  * use 64-byte double-beats. Setting .scale="32" and .unit="Bytes" provides a
  * close (~95%) byte throughput approximation in perf stat output (accounting for
@@ -1175,6 +1312,171 @@ PMU_EVENT_ATTR_STRING(usb_system_l2_wtrans.scale, rpi_axi_pmu_event_usb_system_l
 PMU_EVENT_ATTR_STRING(usb_system_l2_wtrans.unit, rpi_axi_pmu_event_usb_system_l2_wtrans_unit,
 		      "Bytes");
 
+/* --- RASPBERRY PI 5 (BCM2712) EXPANDED EVENT ALIASES ---------------------- */
+
+/* PCIe 2.0 x4 RP1 Southbridge Link Bus Events & Stall Wait Cycles (bus=6, BCM2712_SB__PCIE_RP1) */
+PMU_EVENT_ATTR_STRING(pcie_rp1_atrans, rpi_axi_pmu_event_pcie_rp1_atrans,
+		      "monitor=0,bus=6,counter=0");
+PMU_EVENT_ATTR_STRING(pcie_rp1_atrans.scale, rpi_axi_pmu_event_pcie_rp1_atrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(pcie_rp1_atrans.unit, rpi_axi_pmu_event_pcie_rp1_atrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(pcie_rp1_atwait, rpi_axi_pmu_event_pcie_rp1_atwait,
+		      "monitor=0,bus=6,counter=1");
+PMU_EVENT_ATTR_STRING(pcie_rp1_wtrans, rpi_axi_pmu_event_pcie_rp1_wtrans,
+		      "monitor=0,bus=6,counter=2");
+PMU_EVENT_ATTR_STRING(pcie_rp1_wtrans.scale, rpi_axi_pmu_event_pcie_rp1_wtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(pcie_rp1_wtrans.unit, rpi_axi_pmu_event_pcie_rp1_wtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(pcie_rp1_wtwait, rpi_axi_pmu_event_pcie_rp1_wtwait,
+		      "monitor=0,bus=6,counter=3");
+PMU_EVENT_ATTR_STRING(pcie_rp1_rtrans, rpi_axi_pmu_event_pcie_rp1_rtrans,
+		      "monitor=0,bus=6,counter=4");
+PMU_EVENT_ATTR_STRING(pcie_rp1_rtrans.scale, rpi_axi_pmu_event_pcie_rp1_rtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(pcie_rp1_rtrans.unit, rpi_axi_pmu_event_pcie_rp1_rtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(pcie_rp1_rtwait, rpi_axi_pmu_event_pcie_rp1_rtwait,
+		      "monitor=0,bus=6,counter=5");
+
+/* HEVC (H.265) Hardware Video Decoder Bus Events (bus=7, BCM2712_SB__HEVC_DEC) */
+PMU_EVENT_ATTR_STRING(hevc_dec_atrans, rpi_axi_pmu_event_hevc_dec_atrans,
+		      "monitor=0,bus=7,counter=0");
+PMU_EVENT_ATTR_STRING(hevc_dec_atrans.scale, rpi_axi_pmu_event_hevc_dec_atrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(hevc_dec_atrans.unit, rpi_axi_pmu_event_hevc_dec_atrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(hevc_dec_wtrans, rpi_axi_pmu_event_hevc_dec_wtrans,
+		      "monitor=0,bus=7,counter=2");
+PMU_EVENT_ATTR_STRING(hevc_dec_wtrans.scale, rpi_axi_pmu_event_hevc_dec_wtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(hevc_dec_wtrans.unit, rpi_axi_pmu_event_hevc_dec_wtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(hevc_dec_rtrans, rpi_axi_pmu_event_hevc_dec_rtrans,
+		      "monitor=0,bus=7,counter=4");
+PMU_EVENT_ATTR_STRING(hevc_dec_rtrans.scale, rpi_axi_pmu_event_hevc_dec_rtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(hevc_dec_rtrans.unit, rpi_axi_pmu_event_hevc_dec_rtrans_unit,
+		      "Bytes");
+
+/* Arm Cortex-A76 DSU L3 Interconnect Bus Events (bus=8, BCM2712_SB__A76_DSU_L3) */
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_atrans, rpi_axi_pmu_event_a76_dsu_l3_atrans,
+		      "monitor=0,bus=8,counter=0");
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_atrans.scale, rpi_axi_pmu_event_a76_dsu_l3_atrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_atrans.unit, rpi_axi_pmu_event_a76_dsu_l3_atrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_wtrans, rpi_axi_pmu_event_a76_dsu_l3_wtrans,
+		      "monitor=0,bus=8,counter=2");
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_wtrans.scale, rpi_axi_pmu_event_a76_dsu_l3_wtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_wtrans.unit, rpi_axi_pmu_event_a76_dsu_l3_wtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_rtrans, rpi_axi_pmu_event_a76_dsu_l3_rtrans,
+		      "monitor=0,bus=8,counter=4");
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_rtrans.scale, rpi_axi_pmu_event_a76_dsu_l3_rtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_rtrans.unit, rpi_axi_pmu_event_a76_dsu_l3_rtrans_unit,
+		      "Bytes");
+
+/* VideoCore VII 3D Graphics Pipeline Bus Events (bus=10, BCM2712_SB__V3D7) */
+PMU_EVENT_ATTR_STRING(v3d7_atrans, rpi_axi_pmu_event_v3d7_atrans,
+		      "monitor=0,bus=10,counter=0");
+PMU_EVENT_ATTR_STRING(v3d7_atrans.scale, rpi_axi_pmu_event_v3d7_atrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(v3d7_atrans.unit, rpi_axi_pmu_event_v3d7_atrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(v3d7_wtrans, rpi_axi_pmu_event_v3d7_wtrans,
+		      "monitor=0,bus=10,counter=2");
+PMU_EVENT_ATTR_STRING(v3d7_wtrans.scale, rpi_axi_pmu_event_v3d7_wtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(v3d7_wtrans.unit, rpi_axi_pmu_event_v3d7_wtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(v3d7_rtrans, rpi_axi_pmu_event_v3d7_rtrans,
+		      "monitor=0,bus=10,counter=4");
+PMU_EVENT_ATTR_STRING(v3d7_rtrans.scale, rpi_axi_pmu_event_v3d7_rtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(v3d7_rtrans.unit, rpi_axi_pmu_event_v3d7_rtrans_unit,
+		      "Bytes");
+
+/*
+ * Quad-Core Arm Cortex-A76 Cores 0-3 I-Cache & D-Cache Filtered Events
+ * (bus=14, BCM2712_SB__CPU_L2)
+ */
+PMU_EVENT_ATTR_STRING(bcm2712_peripheral_rtrans, rpi_axi_pmu_event_bcm2712_peripheral_rtrans,
+		      "monitor=0,bus=12,counter=4");
+PMU_EVENT_ATTR_STRING(bcm2712_peripheral_rtrans.scale,
+		      rpi_axi_pmu_event_bcm2712_peripheral_rtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(bcm2712_peripheral_rtrans.unit,
+		      rpi_axi_pmu_event_bcm2712_peripheral_rtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(bcm2712_peripheral_wtrans, rpi_axi_pmu_event_bcm2712_peripheral_wtrans,
+		      "monitor=0,bus=12,counter=2");
+PMU_EVENT_ATTR_STRING(bcm2712_peripheral_wtrans.scale,
+		      rpi_axi_pmu_event_bcm2712_peripheral_wtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(bcm2712_peripheral_wtrans.unit,
+		      rpi_axi_pmu_event_bcm2712_peripheral_wtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(bcm2712_cpu_uc_rtrans, rpi_axi_pmu_event_bcm2712_cpu_uc_rtrans,
+		      "monitor=0,bus=13,counter=4");
+PMU_EVENT_ATTR_STRING(bcm2712_cpu_uc_rtrans.scale, rpi_axi_pmu_event_bcm2712_cpu_uc_rtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(bcm2712_cpu_uc_rtrans.unit, rpi_axi_pmu_event_bcm2712_cpu_uc_rtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(bcm2712_cpu_uc_wtrans, rpi_axi_pmu_event_bcm2712_cpu_uc_wtrans,
+		      "monitor=0,bus=13,counter=2");
+PMU_EVENT_ATTR_STRING(bcm2712_cpu_uc_wtrans.scale, rpi_axi_pmu_event_bcm2712_cpu_uc_wtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(bcm2712_cpu_uc_wtrans.unit, rpi_axi_pmu_event_bcm2712_cpu_uc_wtrans_unit,
+		      "Bytes");
+
+/* BCM2712 Master ID Filtered Events */
+PMU_EVENT_ATTR_STRING(arm_rtrans, rpi_axi_pmu_event_arm_rtrans,
+		      "monitor=0,bus=14,counter=4,filter=10");
+PMU_EVENT_ATTR_STRING(arm_rtrans.scale, rpi_axi_pmu_event_arm_rtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(arm_rtrans.unit, rpi_axi_pmu_event_arm_rtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(arm_wtrans, rpi_axi_pmu_event_arm_wtrans,
+		      "monitor=0,bus=14,counter=2,filter=10");
+PMU_EVENT_ATTR_STRING(arm_wtrans.scale, rpi_axi_pmu_event_arm_wtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(arm_wtrans.unit, rpi_axi_pmu_event_arm_wtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(pcie0_rtrans, rpi_axi_pmu_event_pcie0_rtrans,
+		      "monitor=0,bus=6,counter=4,filter=15");
+PMU_EVENT_ATTR_STRING(pcie0_rtrans.scale, rpi_axi_pmu_event_pcie0_rtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(pcie0_rtrans.unit, rpi_axi_pmu_event_pcie0_rtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(pcie0_wtrans, rpi_axi_pmu_event_pcie0_wtrans,
+		      "monitor=0,bus=6,counter=2,filter=15");
+PMU_EVENT_ATTR_STRING(pcie0_wtrans.scale, rpi_axi_pmu_event_pcie0_wtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(pcie0_wtrans.unit, rpi_axi_pmu_event_pcie0_wtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(hvs_filtered_rtrans, rpi_axi_pmu_event_hvs_filtered_rtrans,
+		      "monitor=0,bus=9,counter=4,filter=22");
+PMU_EVENT_ATTR_STRING(hvs_filtered_rtrans.scale, rpi_axi_pmu_event_hvs_filtered_rtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(hvs_filtered_rtrans.unit, rpi_axi_pmu_event_hvs_filtered_rtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(emmc0_rtrans, rpi_axi_pmu_event_emmc0_rtrans,
+		      "monitor=0,bus=5,counter=4,filter=29");
+PMU_EVENT_ATTR_STRING(emmc0_rtrans.scale, rpi_axi_pmu_event_emmc0_rtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(emmc0_rtrans.unit, rpi_axi_pmu_event_emmc0_rtrans_unit,
+		      "Bytes");
+PMU_EVENT_ATTR_STRING(emmc0_wtrans, rpi_axi_pmu_event_emmc0_wtrans,
+		      "monitor=0,bus=5,counter=2,filter=29");
+PMU_EVENT_ATTR_STRING(emmc0_wtrans.scale, rpi_axi_pmu_event_emmc0_wtrans_scale,
+		      "32");
+PMU_EVENT_ATTR_STRING(emmc0_wtrans.unit, rpi_axi_pmu_event_emmc0_wtrans_unit,
+		      "Bytes");
+
 static struct attribute *rpi_axi_pmu_events_attrs[] = {
 	/* System Monitor events */
 	&rpi_axi_pmu_event_dma_l2_atrans.attr.attr,
@@ -1480,6 +1782,84 @@ static struct attribute *rpi_axi_pmu_events_attrs[] = {
 	&rpi_axi_pmu_event_usb_system_l2_wtrans_scale.attr.attr,
 	&rpi_axi_pmu_event_usb_system_l2_wtrans_unit.attr.attr,
 
+	/* RPi 5 (BCM2712) Expanded Event Aliases */
+	&rpi_axi_pmu_event_pcie_rp1_atrans.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_atrans_scale.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_atrans_unit.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_atwait.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_wtrans.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_wtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_wtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_wtwait.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_rtrans.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_rtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_rtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_rtwait.attr.attr,
+
+	&rpi_axi_pmu_event_hevc_dec_atrans.attr.attr,
+	&rpi_axi_pmu_event_hevc_dec_atrans_scale.attr.attr,
+	&rpi_axi_pmu_event_hevc_dec_atrans_unit.attr.attr,
+	&rpi_axi_pmu_event_hevc_dec_wtrans.attr.attr,
+	&rpi_axi_pmu_event_hevc_dec_wtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_hevc_dec_wtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_hevc_dec_rtrans.attr.attr,
+	&rpi_axi_pmu_event_hevc_dec_rtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_hevc_dec_rtrans_unit.attr.attr,
+
+	&rpi_axi_pmu_event_a76_dsu_l3_atrans.attr.attr,
+	&rpi_axi_pmu_event_a76_dsu_l3_atrans_scale.attr.attr,
+	&rpi_axi_pmu_event_a76_dsu_l3_atrans_unit.attr.attr,
+	&rpi_axi_pmu_event_a76_dsu_l3_wtrans.attr.attr,
+	&rpi_axi_pmu_event_a76_dsu_l3_wtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_a76_dsu_l3_wtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_a76_dsu_l3_rtrans.attr.attr,
+	&rpi_axi_pmu_event_a76_dsu_l3_rtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_a76_dsu_l3_rtrans_unit.attr.attr,
+
+	&rpi_axi_pmu_event_v3d7_atrans.attr.attr,
+	&rpi_axi_pmu_event_v3d7_atrans_scale.attr.attr,
+	&rpi_axi_pmu_event_v3d7_atrans_unit.attr.attr,
+	&rpi_axi_pmu_event_v3d7_wtrans.attr.attr,
+	&rpi_axi_pmu_event_v3d7_wtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_v3d7_wtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_v3d7_rtrans.attr.attr,
+	&rpi_axi_pmu_event_v3d7_rtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_v3d7_rtrans_unit.attr.attr,
+
+	&rpi_axi_pmu_event_bcm2712_peripheral_rtrans.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_peripheral_rtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_peripheral_rtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_peripheral_wtrans.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_peripheral_wtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_peripheral_wtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_cpu_uc_rtrans.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_cpu_uc_rtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_cpu_uc_rtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_cpu_uc_wtrans.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_cpu_uc_wtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_cpu_uc_wtrans_unit.attr.attr,
+
+	&rpi_axi_pmu_event_arm_rtrans.attr.attr,
+	&rpi_axi_pmu_event_arm_rtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_arm_rtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_arm_wtrans.attr.attr,
+	&rpi_axi_pmu_event_arm_wtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_arm_wtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_pcie0_rtrans.attr.attr,
+	&rpi_axi_pmu_event_pcie0_rtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_pcie0_rtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_pcie0_wtrans.attr.attr,
+	&rpi_axi_pmu_event_pcie0_wtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_pcie0_wtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_hvs_filtered_rtrans.attr.attr,
+	&rpi_axi_pmu_event_hvs_filtered_rtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_hvs_filtered_rtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_emmc0_rtrans.attr.attr,
+	&rpi_axi_pmu_event_emmc0_rtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_emmc0_rtrans_unit.attr.attr,
+	&rpi_axi_pmu_event_emmc0_wtrans.attr.attr,
+	&rpi_axi_pmu_event_emmc0_wtrans_scale.attr.attr,
+	&rpi_axi_pmu_event_emmc0_wtrans_unit.attr.attr,
 	NULL,
 };
 
@@ -1490,12 +1870,41 @@ static struct attribute *rpi_axi_pmu_events_attrs[] = {
  * @unused: Index (unused)
  *
  * Dynamically filters sysfs event aliases based on the detected Broadcom SoC generation:
+ * - On BCM2712 (RPi 5): Hides VideoCore VPU Mailbox IPC events (monitor=1).
+ * - On BCM2835-BCM2711 (RPi 1-4): Hides Cortex-A76 and RP1 PCIe specific events.
  *
  * Return: attr->mode (0444) if visible on current SoC, 0 to hide.
  */
 static umode_t rpi_axi_pmu_events_is_visible(struct kobject *kobj,
 					      struct attribute *attr, int unused)
 {
+	struct device *dev = kobj_to_dev(kobj);
+	struct pmu *pmu = dev_get_drvdata(dev);
+	struct rpi_axi_pmu *rpi_pmu = pmu_to_rpi_axi_pmu(pmu);
+
+
+	if (rpi_pmu->chip == CHIP_BCM2712) {
+		/*
+		 * On RPi 5 (BCM2712), aggressively filter out any legacy events,
+		 * including ghost scaling parameters by exclusively matching the
+		 * bcm2712 prefix.
+		 */
+		if (!strstr(attr->name, "bcm2712_"))
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
+		    strstr(attr->name, "emmc0_") ||
+		    strstr(attr->name, "bcm2712_"))
+			return 0;
+	}
+
 	return attr->mode;
 }
 
@@ -1826,7 +2235,7 @@ static void rpi_axi_pmu_read(struct perf_event *event)
 	u32 delta;
 
 	/* Mailbox VPU counters are polled asynchronously in background vpu_work.
-	 * MMIO monitors (System) are read synchronously.
+	 * MMIO monitors (System and BCM2712 VPU) are read synchronously.
 	 */
 	if (event->hw.idx < 0)
 		return;
@@ -2395,6 +2804,10 @@ static const struct of_device_id rpi_axi_pmu_match[] = {
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
2.55.0.691.gc56d675ccc-goog


