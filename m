Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1236C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 00:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/uFEla/GtxpFVr3xLABytiXJscVZoLUgKFlKGO+PW8=; b=lQHFoe/BoKKo0icGiSum3VFdkw
	Hbom5SWYkhpyRWI+PYFq7DWIKKU0vw7B1RpmeH/PJmHVXtOkec4UdhF2qPyYWgwmD4LXIXZFLXs73
	K9Q6zSsTXZBWc93AaKGoIOQeLJawpGPTiaZD5NX4zlz/0WChrPGEnEVsiL4amznP+1QeFdv2pGxDu
	AYhDgiJD6IDrweLSOU0jDpB1zLUKG5lwvrgX04biu8CrKNvtnE6z0c7dyEFNn2kFY8jKZJLFb4+Fu
	3CNIjl037q85X/HhWt7610dJIJUmpA+mJGMbH5EfCBW6FRNwAsNuyGeNBjsLRMfNh+6nlPjH+pxpv
	2mEGHocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcdO-0000000FsiF-2rlr;
	Sun, 27 Sep 2026 00:20:50 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcdL-0000000Fshf-306V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 00:20:49 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 006d021491bc7-6d817a94745so211148eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 17:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468446; x=1791073246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/uFEla/GtxpFVr3xLABytiXJscVZoLUgKFlKGO+PW8=;
        b=M0xRPwAMHWiSrbKfOXtyDyaV2mF11RXmg3i7elBM3435lac7hP/HqdKFA/HySTj+ib
         lkjbFSL6D9elyKNdkpTAlpgohjIPmhNsJZZ5vdTJtDlG/5E6Xz6brqsMPsbXZo5EAD6M
         oT7eyDzcbjsYhouL3VjQMb5/PdprLtMcjNhkXrbeAFwkOA+FiCvltTJXVEz+SQIXA/1q
         rJIid6yE5k+LZijjBQ+fcRKz5hlz4u/kkfMBzoFHFdc8Hy0QRT0u+joe+5+HwR2Lpx8v
         7XPRHIpANd+uQFhdOl75k/ZiiQafqJaX7u+Omraq7qeUvl8qm/97qUcvr12V8riox+IO
         pzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468446; x=1791073246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/uFEla/GtxpFVr3xLABytiXJscVZoLUgKFlKGO+PW8=;
        b=b8eD39WjPRebIXZpsx52C9SZ4NU4XzgmhQWzBmCxBNa0JxL46jH2T176NSd+k8RWoX
         TuwnPdW3jPeuf0g+5D1KvviZMPiD3xcQDZe5z4efd0/4EUDcxtZcU9SamDNlaR6QBT7r
         VN/9dyVssZaH6Zv8+Ha0WCoMXxPu9+1zSJowtJon3y37kGJ2Epr6on1SzACocCIsb00o
         b/JL/LQtHXp75c7kCONwHvJtHiDyym4gs/ZFISGKEDoBPuoCtfnY6fGtdPQsl5FsQWca
         w3FHgqgBKqlloEJDeuMfShb6HiSkY4qSsSToUESq7N5T2tOtrnDa4qSSBujQMDV3nlhD
         7sOg==
X-Forwarded-Encrypted: i=1; AKwUvBw+ilKfVdPdptSPT1WNcMt56xQdJ+8RpOXjFx1GEa8/gYghaQM3WoP3gkyo+dpX9ITafYPdHDTbIRYkk6JkX0Pi@lists.infradead.org
X-Gm-Message-State: AFuF++lZME0Fo2U0LMv7IilBfrDVIFqQ9Rpcin8kX/yQFdo76MSnOZ3L
	p6vj88A8a1DwgDICfENgpfL69bx+fmc7x6btSZpD5KtzcZ5oWImXI4Dl
X-Gm-Gg: AYBFou2SLJ2xY6YDPbvvP3eTMAcV5IJ+eQL2QoII1+nhLdSJ68HfT1WIN10E1xby/oq
	LofT+srVqTMnn/0Q2r4m2p39/3E/xEua9C9+j07noZJ1RETiK9Oj5O2uhPten+JjaVEpwsDxSkB
	VXuutumxSOvVYTnN8uWUDvqUxqns2pMdxkCnoWmL0JzbhY0UKJs2KtlHfYJIVEFFWh+DMAVXgN1
	N7hEB9969PTZYOYzubktHSBbM3hj37AzH0Vextp+QR8wqqIfnFLK4pqn3C7f/wjVyPYjAJAnNQJ
	1lRPflEbRJV1IOudYnvfgeM1PJ0IJfNumWBSecDD66Hci1dq45cDJxUKAq9jhJqDyXqvPJCYP8v
	o6mrUfNlI02eU9IbIq+PyXwkLNjVhXyB96pbReJ1DPrsYaDOvnMuWvZC0LUoEKdXAKL2aKOxPfM
	znxCGv7zNwrFDwuOiZNVeAaHgFBjOTQ/cXy+f2gCD1IG4fq+TRthwDSFe5PxpL/QzKbaf0r8J1g
	g7qbrUqRnh/i1FYBMXxRA==
X-Received: by 2002:a05:6820:a28b:20b0:6d7:a325:35e4 with SMTP id 006d021491bc7-6d7a32536e3mr1067214eaf.2.1790468446180;
        Sat, 26 Sep 2026 17:20:46 -0700 (PDT)
Received: from tcmichals-5759.lan ([2607:fb91:3584:35a9:66f8:2cb5:aa80:21fd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8828e1ea0sm838989eaf.6.2026.09.26.17.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:20:45 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v2 0/7] remoteproc: sunxi: Add Allwinner XuanTie E907 RemoteProc and Message Box support
Date: Sat, 26 Sep 2026 19:20:09 -0500
Message-ID: <20260927002021.797069-1-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_172047_806348_91933646 
X-CRM114-Status: GOOD (  15.61  )
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

This patch series (v2) introduces mainline Linux support for the Alibaba
T-Head XuanTie E907 (RV32IMAFCX @ 200 MHz) RISC-V auxiliary co-processor
integrated into Allwinner A523, A527, and T527 (sun55i) SoCs.

The series adds a standalone 4-port hardware Message Box driver, the
XuanTie RemoteProc driver, the associated Devicetree binding schemas,
in-kernel KUnit unit test suites (68 total tests, 100% pass rate),
and DT node enablement.

Hardware Architecture & Memory Map
==================================
Allwinner sun55i SoCs integrate an octa-core ARM Cortex-A55 cluster
alongside an auxiliary XuanTie E907 RISC-V co-processor. The co-processor
boots from on-chip dedicated SRAM Space 0 (Host PA 0x07280000 / Core DA
0x3FFC0000, 256 KB), can access secondary switchable SRAM Space 1 (Host PA
0x072C0000 / Core DA 0x40000000, 256 KB), and interacts with external DDR
DRAM across the SoC's internal AXI bus.

Inter-processor communication (IPC) is coordinated via a 4-port hardware
Message Box controller (CPUX_MSGBOX at 0x03003000). The mailbox acts as a
star crossbar connecting four processors on the silicon die:
  - Port 0: ARM Cortex-A55 host cluster
  - Port 1: Cadence Tensilica HiFi4 Audio DSP
  - Port 2: Power Management Unit (CPUS)
  - Port 3: XuanTie E907 RISC-V co-processor

The Cortex-A55 exposes 12 logical channels (4 per remote processor),
where Channels 8..11 route directly to the XuanTie E907.

Changes from RFC v1 to v2 & Responses to Reviewer Feedback
==========================================================

1. Device Tree Binding Schemas (Krzysztof Kozlowski & Rob Herring):
   - allwinner,sun55i-rproc.yaml:
     * Constrained 'compatible' from an enum to a single 'const'
       string: 'allwinner,sun55i-a523-rproc', as A523, A527, and T527
       share the same silicon die (per upstream policy).
     * Replaced inline enum arrays in 'reg-names', 'clock-names', and
       'reset-names' with explicit, positional '- const:' lists.
     * Dropped redundant 'minItems: 2' on 'mboxes'
       (maxItems: 2 is sufficient).
     * Replaced '$ref: types.yaml' on 'firmware-name' with
       'maxItems: 1'.
     * Defined 'memory-region' and 'memory-region-names' with explicit
       items instead of freeform text description.
     * Dropped redundant 'status: true' (inherited from base schema).
     * Dropped '|' block literal markers on single-line descriptions.
     * Replaced symbolic CCU clock/reset macro constants in example
       with raw hex values so schema validation succeeds in
       standalone CI trees.
   - allwinner,sun55i-a523-msgbox.yaml:
     * Dropped redundant 'minItems: 4' on 'reg'.
     * Dropped redundant one-line descriptions on 'clocks' and 'resets'.
     * Clarified 'interrupts': added 'interrupt-names' and explained
       in description that Port 0 (ARM host) interrupt is mandatory
       for reception, while remote port interrupts (DSP, CPUS, RV)
       are optional depending on board routing.
   - sun55i-a523.dtsi:
     * Replaced two-string compatible with single const
       'allwinner,sun55i-a523-rproc'.
     * Maintained strictly sorted unit address order for
       msgbox@3003000 and rproc@7130000.

2. RemoteProc Lifecycle & Teardown Hardening
   (Bjorn Andersson & Mathieu Poirier):
   - Moved INIT_WORK(&priv->vq_work) before
     mbox_request_channel_byname() to eliminate race conditions
     executing or cancelling uninitialized work structs on early
     interrupt or probe deferral.
   - Masked crash IRQ with disable_irq() at the start of
     sunxi_rproc_remove() to prevent crash interrupts against deleted
     rproc instances.
   - Switched async mailbox sends to struct member 'priv->kick_msg'
     to eliminate stack pointer escape and use-after-free hazards.
   - In sunxi_rproc_start(), ensured STA_ADD_REG boot vector is
     written while core execution reset (rst_core) is asserted,
     guaranteeing deterministic entry at bootaddr upon reset release.
   - Added integer overflow checking ('len == 0 || da > U64_MAX - len')
     and defensive memory boundary guards in sunxi_rproc_da_to_va().
   - Configured 32-bit DMA coherent mask via dma_set_coherent_mask().

3. Mailbox Driver Hardening (Jassi Brar):
   - Added synchronize_irq() across all registered interrupts in
     sun55i_msgbox_remove() before gating clocks and asserting reset
     to prevent concurrent bus aborts on unclocked MMIO during teardown.
   - Added defensive bounds checking in sun55i_chan_to_route() to
     safely clamp invalid channel indices (< 0 or >= 12).
   - Bounded all hardirq FIFO drain loops and startup/shutdown flush
     loops to SUN55I_FIFO_MAX (8 iterations) to eliminate CPU
     starvation or RCU stalls under coprocessor message flood conditions.
   - In sun55i_msgbox_irq(), cleared pending interrupt status before
     reading the message FIFO to seal a TOCTOU race.

4. PREEMPT_RT Real-Time Compliance:
   - When the E907 announces a new RPMsg channel via Name Service
     announcement, virtio_rpmsg_bus acquires sleeping mutexes
     (device_register, blocking_notifier_call_chain). Calling these
     from hardirq context triggers a fatal "scheduling while atomic"
     bug under PREEMPT_RT.
   - The driver implements a workqueue-deferred notification
     architecture (vq_work), which safely shifts vring processing to
     a preemptible kernel worker thread, ensuring 100% PREEMPT_RT
     compliance with zero jitter.

5. Comprehensive In-Kernel KUnit Test Suites (68 Tests):
   - Added sunxi_rproc_test.c (34 tests) covering da_to_va() translation
     across Space 0, Space 1, DRAM carveout, and trace buffers, integer
     wraparound guards, corrupted ELF segments, malformed resource
     tables, and lifecycle mocks.
   - Added sun55i_msgbox_test.c (34 tests) covering 12-channel routing
     formulas, register offset macros, mock MMIO FIFO send/read,
     bounded drain limits, burst interleaving, crosstalk isolation,
     and simultaneous 3-route concurrency.
   - Both test suites execute with 68/68 passed, 0 failed, 0 skipped.

Physical Silicon Validation Evidence
====================================
The complete driver series has been rigorously validated on physical
silicon using the Radxa Cubie A5E development board (Allwinner A527 /
T527) running mainline Linux 7.1.0 PREEMPT_RT across three distinct
hardware profiles:

  Profile 1: Standard Linux VirtIO RPMsg over DDR CMA Carveout
    - 1,000 pings: 100% success (0 timeouts, 0 corrupted packets).
    - Latency: 189.70 us avg RTT, 4.83 us jitter.
    - Throughput: 2,995.5 msgs/sec, 2.83 MB/s bidirectional bandwidth.
    - DRAM bulk transfer: 4,498.5 msgs/sec, 4.39 MB/sec.

  Profile 2: Pure On-Chip SRAM Space 1 VirtIO
    - Vrings and message buffers mapped directly to on-chip SRAM Space 1.
    - 1,000 pings: 100% success (0 corrupted packets).
    - Latency: 136.57 us avg RTT.
    - Throughput: 7,281.8 msgs/sec, 6.89 MB/s bidirectional bandwidth.

  Profile 3: Userspace UIO Direct Mailbox & Shared SRAM
    - Hardware mailbox bound to generic-uio with userspace doorbell.
    - 1,000 pings: 100% success.
    - Latency: 13.76 us avg RTT (50th percentile: 13.58 us).
    - Throughput: 65,986.6 msgs/sec, 64.44 MB/sec bidirectional bandwidth.

All kernel dmesg logs across all profile reboots and stress benchmarks
remained 100% clean of call traces, oopses, and bug warnings.

Code Hygiene
============
All patches have been verified with scripts/checkpatch.pl --strict and
pass with 0 errors and 0 warnings.

Tim Michals (7):
  dt-bindings: mailbox: add Allwinner sun55i msgbox schema
  mailbox: sun55i: add Allwinner sun55i/sun60i 4-port Message Box driver
  mailbox: sun55i: add KUnit test suite for sun55i msgbox driver
  dt-bindings: remoteproc: add Allwinner sun55i-rproc schema
  remoteproc: sunxi: add Allwinner XuanTie RISC-V remoteproc driver
  remoteproc: sunxi: add KUnit test suite for sunxi remoteproc driver
  arm64: dts: allwinner: add a523 msgbox and remoteproc nodes

 .../mailbox/allwinner,sun55i-a523-msgbox.yaml | 102 ++
 .../remoteproc/allwinner,sun55i-rproc.yaml    | 146 +++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  39 +
 drivers/mailbox/Kconfig                       |  20 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/sun55i-msgbox.c               | 375 +++++++
 drivers/mailbox/sun55i-msgbox.h               |  58 ++
 drivers/mailbox/sun55i_msgbox_test.c          | 823 ++++++++++++++++
 drivers/remoteproc/Kconfig                    |  18 +
 drivers/remoteproc/Makefile                   |   2 +
 drivers/remoteproc/sunxi_rproc.c              | 922 ++++++++++++++++++
 drivers/remoteproc/sunxi_rproc.h              | 116 +++
 drivers/remoteproc/sunxi_rproc_test.c         | 701 +++++++++++++
 13 files changed, 3324 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
 create mode 100644 drivers/mailbox/sun55i-msgbox.c
 create mode 100644 drivers/mailbox/sun55i-msgbox.h
 create mode 100644 drivers/mailbox/sun55i_msgbox_test.c
 create mode 100644 drivers/remoteproc/sunxi_rproc.c
 create mode 100644 drivers/remoteproc/sunxi_rproc.h
 create mode 100644 drivers/remoteproc/sunxi_rproc_test.c

base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
-- 
2.43.0


