Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D06CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wj/zEFZh6Rrd2hodv6ZgY9rOG0aUybzzPtp3MSsbQW0=; b=MZ9u0npPIVfeEe4U+ehYcTYNLW
	9rBdgmgMLExiZj+n2np3o1lX+kLeacLEE41GEqiDKWHb8rI9BnFw78Kyc3xgpHcWWlXgxGcePfzag
	5YeBgVyhrKYpa9/MkOeAl01N0uIg6J3qfRQi2BFFnchD+e0ZMKuZfESIqcRHMm7yAlzzYOQwh5Ojx
	yJAMlshry52L1JcIiIb9kW8N6CT0hxBXImpi42CAHYWcDfuOvAhwDH1M3UTtJkkdgfLk/eDs5kOEW
	7fJ7m9jqw517YSCk2kf+5uRcC35GX0rQj8Cb5d9cFCEzN0Izr4YofUgUW86HVfTrcVzGGmQI/iJpg
	pntu/DWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChWA-0000000CEGR-2l7y;
	Fri, 02 Oct 2026 17:57:58 +0000
Received: from mail-dl1-x1247.google.com ([2607:f8b0:4864:20::1247])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChW7-0000000CEEJ-0gLN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:57:56 +0000
Received: by mail-dl1-x1247.google.com with SMTP id a92af1059eb24-1438492fb40so6060895c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 10:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790963873; x=1791568673; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wj/zEFZh6Rrd2hodv6ZgY9rOG0aUybzzPtp3MSsbQW0=;
        b=MOeEXW4OQqEH/bqXFZzz/xb77wB2GFgqOZcbJaGbEka0A285l+1/1A1yiJMeiYMm3q
         FYNQZ72KI7mDZSSsNE96gLB2TmZRMkQy1uujsmLxfdltGaeoMNPC4YpIWF/BRR4L8kbk
         b2mZ7Sm+yqZNXnB7kXR1ojN16LOyrvgd5udPj3V/sVSlqmNptYXqZgFfeyam2nhbNbzh
         dclhvPdbd7y6u1fYVQpg84E3iFGW1xoMeuhnoelDDHXrgn+iAs5i6Gv296TN6GjunUYS
         z9yP6AYS2Q0qciWAf4vO/QjbmMZqfW9/UsnclMfBJaND1MzfcjKH/tmvk/945cXS4wwH
         n9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963873; x=1791568673;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wj/zEFZh6Rrd2hodv6ZgY9rOG0aUybzzPtp3MSsbQW0=;
        b=gMJEGCZ8BynaErvPI+yCiyFXQaRyBwqfz7GCfS2UbpRO59f0NcmLP640hcHE2L3mji
         KpHfXu4s50ChLO5aFGroxukZEIr8ZBRrlp4LNHZgraB6Ef+e3UYMnEv/GdbAon1r56eG
         Uqkh6pir+hmmae5kZCVdnbLvB/qxeSLazUO3mG6BYtR97COUy6C/xEx5IruPI5YrDOvo
         bTfGqcapeTTqMPFjeHwBbljTFZxazQ1sdw5zOEYdqp+UHiSxGPQfreXJuki+WPkNF8ML
         ZOM/LjLVwqoKjR+/bHRWsdV3a+98ljnZAJW+jKrsmkMB/3SPErtLaxS1ayPrtWlUuu/S
         swXw==
X-Forwarded-Encrypted: i=1; AKwUvBwOz/Gz4AVahHnKlgWMUM+DEN9v2yf/hBZd8PpV0PSBfsZjnWoLiY4VZAudNJn/qsXZdQHSg5Zv8zZelXR/x4yg@lists.infradead.org
X-Gm-Message-State: AFuF++m+ZbP9cBRiGrpYNWCf9A2No8w0Qz2Y9ygEj4w6iYAg+ZD6/bBf
	qI0/LQSMzLbi5lAAs0FKKivONceLNe7a2UpoC5NBn4mV/wFpV8zQcImGD0Gh3iyztSqoPMizvE3
	ROX1hJfFdTQ==
X-Received: from dlbqs3.prod.google.com ([2002:a05:7023:d03:b0:14f:14f5:d3a1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:238f:b0:14c:96a4:b631
 with SMTP id a92af1059eb24-14f5cbd53b1mr4523116c88.30.1790963872116; Fri, 02
 Oct 2026 10:57:52 -0700 (PDT)
Date: Fri,  2 Oct 2026 10:57:33 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261002175738.3242646-1-irogers@google.com>
Subject: [PATCH v14 0/3] perf: Add Raspberry Pi AXI PMU driver
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_105755_201431_FBCD3424 
X-CRM114-Status: GOOD (  14.86  )
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

Motivation & Background
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Currently, Linux lacks a standard perf-API compatible driver for the
Broadcom AXI performance counter blocks on Raspberry Pi platforms. Prior
out-of-tree vendor solutions relied on custom debugfs nodes and ad-hoc
kthreads, preventing integration with standard Linux perf tooling (`perf st=
at`,
`perf list`, etc.).

This driver implements standard `struct pmu` hardware uncore callbacks
under `drivers/perf/`, exposing human-readable sysfs event aliases for all
11 hardware metrics per bus (`atwait`, `atrans`, `amax`, `wwait`, `wtrans`,
`wmax`, `rwait`, `rtrans`, `rmax`, `rpend`, `ratrans`) and 6-bit AXI master
ID filtering (`filter=3D0..50`) directly to user space.

Key Architectural Improvements & Features
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
1. Standard Linux Perf Integration:
   - Exposes uncore AXI interconnect events via
     `/sys/bus/event_source/devices/rpi_axi_pmu/`.
   - Supports up to 3 concurrently monitored buses per monitor
     (`NUM_BUS_WATCHER_RESULTS =3D 3`), with bus-watcher reference counting
     so all 11 counter metrics on the same `(monitor, bus, filter)` tuple
     share a single hardware watcher without multiplexing.
   - Enforces atomic group validation (`rpi_axi_pmu__validate_group`) to
     reject event groups requiring more than 3 watchers per monitor at
     `perf_event_open()` time, while supporting time-multiplexing across
     more than 3 ungrouped buses.
   - Supports hardware counter accumulation (`local64_add`) using full
     32-bit unsigned counter reads (`u32`) and periodic hrtimer polling
     (`POLL_INTERVAL_MS =3D 100`) to prevent counter saturation.

2. CPU Hotplug Support (`cpuhp`):
   - Registers dynamic CPU hotplug callbacks (`CPUHP_AP_ONLINE_DYN` via
     `cpuhp_state_add_instance()`).
   - Automatically migrates PMU context (`perf_pmu_migrate_context`) to an
     online CPU core when the designated CPU goes offline.

3. Hybrid Memory-Mapped & Mailbox Work Queue Architecture:
   - System Monitor (MMIO): Performs fast atomic-safe memory reads directly
     mapped over ARM physical memory space (`MON__SYSTEM`).
   - VPU Monitor (Mailbox IPC): For Broadcom BCM2835-BCM2711 platforms
     (RPi 1-4) when configured via `system-only`, VideoCore VPU monitor
     (`MON__VPU`) mailbox IPC calls are offloaded to process context via
     `schedule_work(&pmu->mailbox_work)` and serialized with an atomic
     snapshot cache (`cached_values`), avoiding sleeping in atomic/hrtimer
     context. The firmware node is discovered via
     `of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware")`
     and untranslated VideoCore bus addresses are read from the `reg`
     property via `of_property_read_u32_index()`.

4. Per-SoC Generation Support:
   - Patch 1 documents the Device Tree bindings (`brcm,bcm2835-axiperf`,
     `brcm,bcm2711-axiperf`, `brcm,bcm2712-axiperf`).
   - Patch 2 adds core driver support for Broadcom BCM2835 and BCM2711 with
     distinct per-SoC bus and AXI master ID filter tables matching the
     hardware topology of each generation.
   - Patch 3 expands support for Broadcom BCM2712 (Raspberry Pi 5), adding
     the BCM2712 System monitor pipelines (`DISPLAY_TOP`, `ARGON_TOP`,
     `BSTM_TOP`, `PCIE_01`, `XPT`, `ARM`, `SYSTEM_L2`, etc.) and 6-bit AXI
     master ID filter tables (51 filter IDs, `GENMASK(13, 8)`).

Hardware Validation
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
The driver has been validated on Raspberry Pi 400 (BCM2711) and Raspberry
Pi 5 (BCM2712). Example on Raspberry Pi 5 monitoring 17 events across 3
buses (`bstm_top`, `arm`, `system_l2`) simultaneously without multiplexing:

  $ sudo perf stat -a \
      -e rpi_axi_pmu/bstm_top_atwait/,rpi_axi_pmu/bstm_top_atrans/,rpi_axi_=
pmu/bstm_top_amax/ \
      -e rpi_axi_pmu/bstm_top_wwait/,rpi_axi_pmu/bstm_top_wtrans/,rpi_axi_p=
mu/bstm_top_wmax/ \
      -e rpi_axi_pmu/bstm_top_rwait/,rpi_axi_pmu/bstm_top_rtrans/,rpi_axi_p=
mu/bstm_top_rmax/ \
      -e rpi_axi_pmu/bstm_top_rpend/,rpi_axi_pmu/bstm_top_ratrans/ \
      -e rpi_axi_pmu/arm_rtrans/,rpi_axi_pmu/arm_wtrans/,rpi_axi_pmu/arm_rm=
ax/,rpi_axi_pmu/arm_wmax/ \
      -e rpi_axi_pmu/system_l2_rtrans/,rpi_axi_pmu/system_l2_wtrans/ \
      -- python3 -c 'a =3D bytearray(256 * 1024 * 1024); b =3D bytearray(a)=
'

   Performance counter stats for 'system wide':

                   0      rpi_axi_pmu/bstm_top_atwait/
                  64      rpi_axi_pmu/bstm_top_atrans/
                   0      rpi_axi_pmu/bstm_top_amax/
                   0      rpi_axi_pmu/bstm_top_wwait/
                   0      rpi_axi_pmu/bstm_top_wtrans/
                   0      rpi_axi_pmu/bstm_top_wmax/
                   0      rpi_axi_pmu/bstm_top_rwait/
                 256      rpi_axi_pmu/bstm_top_rtrans/
                   0      rpi_axi_pmu/bstm_top_rmax/
                 190      rpi_axi_pmu/bstm_top_rpend/
                  64      rpi_axi_pmu/bstm_top_ratrans/
          10,987,780      rpi_axi_pmu/arm_rtrans/
          17,265,030      rpi_axi_pmu/arm_wtrans/
               2,519      rpi_axi_pmu/arm_rmax/
               1,093      rpi_axi_pmu/arm_wmax/
                   0      rpi_axi_pmu/system_l2_rtrans/
                   0      rpi_axi_pmu/system_l2_wtrans/

         0.165352897 seconds time elapsed

Additionally verified on Raspberry Pi 5:
- 6-bit AXI master ID filtering (`filter=3D0..50` accepted, with active
  traffic on `filter=3D16..23` and `filter=3D32..43` confirming bit 5 is
  decoded in BCM2712 hardware, and `filter=3D51` rejected with `-EINVAL`).
- Time-multiplexing across all 13 BCM2712 buses and atomic group rejection
  (`-EINVAL`) when grouping 4 distinct buses.
- Live CPU hotplug context migration when offlining `CPU0`.

Changes since v13
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Addresses feedback from the upstream v13 review as well as downstream
review on https://github.com/raspberrypi/linux/pull/7571 (with the
corresponding updates tracked in
https://github.com/raspberrypi/linux/pull/7671):

- Device Tree Bindings (Patch 1):
  - Removed the `firmware` phandle property and `allOf` conditional from
    `brcm,bcm2835-axiperf.yaml` per Krzysztof Kozlowski's review; the
    driver now locates `raspberrypi,bcm2835-firmware` via
    `of_find_compatible_node()`.
  - Set `reg` `minItems: 2` (`MON_SYSTEM` and `MON_VPU`) and updated the
    example to use the BCM2712 address map (`0x7c012800` / `0x7e000000`).
- Core Driver & SoC Support (Patches 2 & 3):
  - Removed all `LINUX_VERSION_CODE` conditional checks per Uwe
    Kleine-K=C3=B6nig and Florian Fainelli.
  - Separated BCM2835, BCM2711, and BCM2712 bus and AXI master ID filter
    tables (`CHIP_BCM2835`, `CHIP_BCM2711`, `CHIP_BCM2712`) to match the
    hardware definitions per https://github.com/raspberrypi/linux/pull/7571=
.
  - Fixed VPU mailbox base address lookup to read untranslated 32-bit
    VideoCore peripheral addresses via `of_property_read_u32_index()`
    instead of CPU-translated `platform_get_resource()` addresses, and
    skipped mapping `MON_VPU` on BCM2712 (`CHIP_BCM2712`).
  - Widened the AXI master ID filter field from 5 bits to 6 bits
    (`GENMASK(13, 8)` in hardware, `config:10-15` in perf attr) to support
    all 51 BCM2712 filter IDs without truncation.
  - Replaced 31-bit counter masking (`& 0x7FFFFFFF`) with full 32-bit
    unsigned reads (`u32`) and removed speculative `scale=3D"32"` /
    `unit=3D"Bytes"` sysfs attributes so raw transaction, cycle, and latenc=
y
    counts are reported accurately.
  - Added bus-watcher reference counting and
    `rpi_axi_pmu__validate_group()` so multiple metrics on the same
    `(monitor, bus, filter)` share a single hardware watcher and
    unschedulable event groups fail at `perf_event_open()` with `-EINVAL`.
  - Switched CPU hotplug registration to exported
    `cpuhp_state_add_instance()` with an online callback
    (`rpi_axi_pmu_online_cpu`) and updated `cpumask_show()` to use
    `sysfs_emit()`.
  - Fixed `Kconfig` dependencies (`ARCH_BCM2835`, `RASPBERRYPI_FIRMWARE`,
    and `!RPI_AXIPERF`).

Ian Rogers (3):
  dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
  perf: Add Raspberry Pi BCM2835 AXI PMU driver
  perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support

 .../bindings/perf/brcm,bcm2835-axiperf.yaml   |   71 +
 drivers/perf/Kconfig                          |   13 +
 drivers/perf/Makefile                         |    1 +
 drivers/perf/rpi_axi_pmu.c                    | 3397 +++++++++++++++++
 4 files changed, 3482 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axi=
perf.yaml
 create mode 100644 drivers/perf/rpi_axi_pmu.c

--=20
2.56.0.rc1.315.gc6ed9934b7-goog


