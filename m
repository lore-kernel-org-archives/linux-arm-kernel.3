Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2891AC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=doj4VgkcPMuCm07rkZxbId/BUVze9/Fe8T+2B7NuuHU=; b=viI966FCFxB6EdU5x7trPUN8uP
	18RuDJNwSw9XOfHJk7JVx8CKDR4Z+/ufd0TdkHi5FI3hi1SbD48vJXRJPy2Ft8sv0VVq2LlV+XwAf
	5kOwfJPZumYx9t4YqiPYOOF/BomBxkuCvxrbKdWNMSq2/w8kNK7qA/QELuLFPcSJjsyOMAekpyF0V
	K3Pa8A/kDgou3382o6f+cyFEXBWGLfKNTbTBz1BXUnCMKmUAKqM9tj+UidK9g+B5t5O2fLAubS8ec
	r0QbUQgja1FpmO1dBHaEiwZBN5oAvN6m7gxHIDbv8Y3pmmUVOUgG+zM4LVhmoJWRK4i/Dz3LQw4gk
	fsNDGXQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrH-00000007qxI-430v;
	Thu, 24 Jul 2025 15:27:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewQo-00000007egV-1t5N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-451d6ade159so6661485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365380; x=1753970180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=doj4VgkcPMuCm07rkZxbId/BUVze9/Fe8T+2B7NuuHU=;
        b=AgI38W2OA+GEWx3836IApV08678FMoaUfE6INO0sIKy75+G7vb1gBaFfjvvSf7qcHZ
         FIiw9CkoxRsA/7Q8UIa7Qg3bBTz6nc3GYMBf1b+87RwrYfWe7MM+2W7SXjXxFikGJHcX
         jkq8PzsL+Kx/wcaSvdjJI9w6vLf7Beei5mpp++w7q7sWLA1FKxtERT5/cxryHdsv6e4m
         9GYa7CqIMeSSlSqr0HM25SHBQ2Dgdt0L1jp9v/Wb7PSEveoJ/2mHBDh3Qm7CO9qk7mDo
         e6GdxnQ1Oe5MIGkXAzKadSaJIRxQrfOtq3r04VedMQaXmprJaHHzo6iIiaoIeLrMn2/O
         Q3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365380; x=1753970180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=doj4VgkcPMuCm07rkZxbId/BUVze9/Fe8T+2B7NuuHU=;
        b=RtiJPixyO1ANA6rFxyBxuf1rJLvKqoPddsS3M2YH7ncr8foVsC0XgkH0PAwx4YM3cS
         mQiNzS3VEaZIkyMwIBKXjkEQR5prnYCuJBQbdUkQQ2P8fzKnn3sCwlGMc4bl8GIzmBUC
         A7+lTBpc7EDtOCbY7d172QBGmj9r9Q1w6JItb2co6xySuhqA2aeghEJ7EsqrusZ2Ji76
         FkwH1WEcM3PDz/KnjSIZhkno9xptIxB2q3Z3KEtGKYNCf88jI64UUEGyr8rz9yveCKIi
         6IIHrw5kx+iDCi/el3vlQCMz5qKGBRZj9hIGs6xPY0zZjPFjdvxM8Kyx1mPQjrERWgVx
         MHtA==
X-Gm-Message-State: AOJu0YwDgfKG+YNADQnWTqfZ6aC6avEYaJQBbilCGzhIRpQ/c6sDN0Gx
	CAlikPjwb9B3SVYLhz0Dd5JPUMDN2mGrp6Wb3etcjr13UN+JEdApLqfPEJ6C7j+rWjg=
X-Gm-Gg: ASbGncsAbcptikAS8kJMcG5uW95bf7hnlYvI9EbWtudgn9nYLi6+4OQ7b1WMw1SQ6S2
	4DB+zHERkxnoYVu0Z90GJVkBscfHg5imnpTxKKproRKI9q8WB088acBkheJ85OVzIrK4kEGQ9JS
	zuSzJ6t8Qgmmwullx0N/VDvTLY1rPCWklGHKk+Qp05bJq4BNGq1K4UcT665neIaGJcG7W619kfa
	HIqeIioJYlfyIroA7PEaOQG60NOYmdRFqJABOJgdpNPYutaAotgId2qj38Q3VSg/zb2X6IrgDGF
	54txSHKgwpk8wB3ZcNsDvAb9IM4cNe+td7IdUd628D7OTawbr4EcZQsV6gPNKkFRVmmkDKPy4ri
	PBcKl9THJ3wFIcHnW3wQ0U/E1SWzGOJYeUKf15BDxkviezuXaKChufAS+Izsoe7ZQiZT2cBeciD
	fijd0oMmheU2TP
X-Google-Smtp-Source: AGHT+IEgB2qGK5rHK/xrXroIqjpgxM1xiUoTO/MHHfQIsCwn5d+nXDbe5Qo7CYSHLXnX07gaTNJQKQ==
X-Received: by 2002:a05:6000:4026:b0:3a6:d26a:f0f5 with SMTP id ffacd0b85a97d-3b768ea0591mr7040730f8f.21.1753365380179;
        Thu, 24 Jul 2025 06:56:20 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:19 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 00/29] introduce kmemdump
Date: Thu, 24 Jul 2025 16:54:43 +0300
Message-ID: <20250724135512.518487-1-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065622_506361_6822BB2A 
X-CRM114-Status: GOOD (  32.39  )
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

kmemdump is a mechanism which allows the kernel to mark specific memory
areas for dumping or specific backend usage.
Once regions are marked, kmemdump keeps an internal list with the regions
and registers them in the backend.
Further, depending on the backend driver, these regions can be dumped using
firmware or different hardware block.
Regions being marked beforehand, when the system is up and running, there
is no need nor dependency on a panic handler, or a working kernel that can
dump the debug information.
The kmemdump approach works when pstore, kdump, or another mechanism do not.
Pstore relies on persistent storage, a dedicated RAM area or flash, which
has the disadvantage of having the memory reserved all the time, or another
specific non volatile memory. Some devices cannot keep the RAM contents on
reboot so ramoops does not work. Some devices do not allow kexec to run
another kernel to debug the crashed one.
For such devices, that have another mechanism to help debugging, like
firmware, kmemdump is a viable solution.

kmemdump can create a core image, similar with /proc/vmcore, with only
the registered regions included. This can be loaded into crash tool/gdb and
analyzed.
To have this working, specific information from the kernel is registered,
and this is done at kmemdump init time, no need for the kmemdump user to
do anything.

This version of the kmemdump patch series includes two backend drivers:
one is the Qualcomm Minidump backend, and the other one is the Debug Kinfo
backend for Android devices, reworked from this source here:
https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/android/debug_kinfo.c
written originally by Jone Chou <jonechou@google.com>

Initial version of kmemdump and discussion is available here:
https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/

Kmemdump has been presented and discussed at Linaro Connect 2025,
including motivation, scope, usability and feasability.
Video of the recording is available here for anyone interested:
https://www.youtube.com/watch?v=r4gII7MX9zQ&list=PLKZSArYQptsODycGiE0XZdVovzAwYNwtK&index=14

The implementation is based on the initial Pstore/directly mapped zones
published as an RFC here:
https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/

The back-end implementation for qcom_minidump is based on the minidump
patch series and driver written by Mukesh Ojha, thanks:
https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/

*** How to use kmemdump with minidump backend on Qualcomm platform guide ***

Prerequisites:
Crash tool with target=ARM64 and minor changes required for usual crash mode
(minimal mode works without the patch)
A patch can be applied from here https://p.calebs.dev/49a048
This patch will be eventually sent in a reworked way to crash tool.

Target kernel must be built with :
CONFIG_DEBUG_INFO_REDUCED=n ; this will have vmlinux include all the debugging
information needed for crash tool.

Otherwise, the kernel requires these as well:
CONFIG_KMEMDUMP, CONFIG_KMEMDUMP_COREIMAGE, and the backend
CONFIG_KMEMDUMP_QCOM_MINIDUMP_BACKEND

Kernel arguments:
Kernel firmware must be set to mode 'mini' by kernel module parameter
like this : qcom_scm.download_mode=mini

After the kernel boots, and qcom_minidump module is loaded, everything is ready for
a possible crash.

Once the crash happens, the firmware will kick in and you will see on
the console the message saying Sahara init, etc, that the firmware is
waiting in download mode. (this is subject to firmware supporting this
mode, I am using sa8775p-ride board)

Example of log on the console:
"
[...]
B -   1096414 - usb: init start
B -   1100287 - usb: qusb_dci_platform , 0x19
B -   1105686 - usb: usb3phy: PRIM success: lane_A , 0x60
B -   1107455 - usb: usb2phy: PRIM success , 0x4
B -   1112670 - usb: dci, chgr_type_det_err
B -   1117154 - usb: ID:0x260, value: 0x4
B -   1121942 - usb: ID:0x108, value: 0x1d90
B -   1124992 - usb: timer_start , 0x4c4b40
B -   1129140 - usb: vbus_det_pm_unavail
B -   1133136 - usb: ID:0x252, value: 0x4
B -   1148874 - usb: SUPER , 0x900e
B -   1275510 - usb: SUPER , 0x900e
B -   1388970 - usb: ID:0x20d, value: 0x0
B -   1411113 - usb: ENUM success
B -   1411113 - Sahara Init
B -   1414285 - Sahara Open
"

Once the board is in download mode, you can use the qdl tool (I
personally use edl , have not tried qdl yet), to get all the regions as
separate files.
The tool from the host computer will list the regions in the order they
were downloaded.

Once you have all the files simply use `cat` to put them all together,
in the order of the indexes.
For my kernel config and setup, here is my cat command : (you can use a script
or something, I haven't done that so far):

`cat memory/md_KELF1.BIN memory/md_Kvmcorein2.BIN memory/md_Kconfig3.BIN \
memory/md_Kmemsect4.BIN memory/md_Ktotalram5.BIN memory/md_Kcpu_poss6.BIN \
memory/md_Kcpu_pres7.BIN memory/md_Kcpu_onli8.BIN memory/md_Kcpu_acti9.BIN \
memory/md_Kjiffies10.BIN memory/md_Klinux_ba11.BIN memory/md_Knr_threa12.BIN \
 memory/md_Knr_irqs13.BIN memory/md_Ktainted_14.BIN memory/md_Ktaint_fl15.BIN \
memory/md_Kmem_sect16.BIN memory/md_Knode_dat17.BIN memory/md_Knode_sta18.BIN \
memory/md_K__per_cp19.BIN memory/md_Knr_swapf20.BIN memory/md_Kinit_uts21.BIN \
memory/md_Kprintk_r22.BIN memory/md_Kprintk_r23.BIN memory/md_Kprb24.BIN \
memory/md_Kprb_desc25.BIN memory/md_Kprb_info26.BIN memory/md_Kprb_data27.BIN \
memory/md_Krunqueue28.BIN memory/md_Khigh_mem29.BIN memory/md_Kinit_mm30.BIN \
memory/md_Kinit_mm_31.BIN memory/md_Kunknown32.BIN memory/md_Kunknown33.BIN \
memory/md_Kunknown34.BIN  memory/md_Kunknown35.BIN memory/md_Kunknown36.BIN \
memory/md_Kunknown37.BIN memory/md_Kunknown38.BIN memory/md_Kunknown39.BIN \
memory/md_Kunknown40.BIN memory/md_Kunknown41.BIN memory/md_Kunknown42.BIN \
memory/md_Kunknown43.BIN memory/md_Kunknown44.BIN memory/md_Kunknown45.BIN \
memory/md_Kunknown46.BIN memory/md_Kunknown47.BIN  memory/md_Kunknown50.BIN \
memory/md_Kunknown51.BIN memory/md_Kunknown52.BIN \
memory/md_Kunknown53.BIN > ~/minidump_image`

Once you have the resulted file, use `crash` tool to load it, like this:
`./crash --no_modules --no_panic --no_kmem_cache --zero_excluded vmlinux minidump_image`

There is also a --minimal mode for ./crash that would work without any patch applied
to crash tool, but you can't inspect symbols, etc.

Once you load crash you will see something like this :

   KERNEL: /home/eugen/linux-minidump/vmlinux  [TAINTED]
    DUMPFILE: /home/eugen/new
        CPUS: 8 [OFFLINE: 7]
        DATE: Thu Jan  1 02:00:00 EET 1970
      UPTIME: 00:00:29
       TASKS: 0
    NODENAME: qemuarm64
     RELEASE: 6.16.0-rc7-next-20250721-00029-gf8cffdbf0479-dirty
     VERSION: #5 SMP PREEMPT Tue Jul 22 18:44:57 EEST 2025
     MACHINE: aarch64  (unknown Mhz)
      MEMORY: 34.2 GB
       PANIC: ""
crash> log
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd4b2]
[    0.000000] Linux version 6.16.0-rc7-next-20250721-00029-gf8cffdbf0479-dirty (eugen@eugen-station) (aarch64-none-linux-gnu-gcc (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 13.3.1 20240614, GNU ld (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 2.42.0.20240614) #5 SMP PREEMPT Tue Jul 22 18:44:57 EEST 2025


*** Debug Kinfo backend driver ***
I don't have any device to actually test this. So I have not.
I hacked the driver to just use a kmalloc'ed area to save things instead
of the shared memory, and dumped everything there and checked whether it looks
sane. If someone is willing to try it out, thanks ! and let me know.
I know there is no binding documentation for the compatible either.

Thanks for everyone reviewing and bringing ideas into the discussion.

Eugen

Changelog since the v1 of the RFC:
- Reworked the whole minidump implementation based on suggestions from Thomas Gleixner.
This means new API, macros, new way to store the regions inside kmemdump
(ditched the IDR, moved to static allocation, have a static default backend, etc)
- Reworked qcom_minidump driver based on review from Bjorn Andersson
- Reworked printk log buffer registration based on review from Petr Mladek

I appologize if I missed any review comments. I know there is still lots of work
on this series and hope I will improve it more and more.
Patches are sent on top of next-20250721

Eugen Hristev (29):
  kmemdump: introduce kmemdump
  Documentation: add kmemdump
  kmemdump: add coreimage ELF layer
  Documentation: kmemdump: add section for coreimage ELF
  kmemdump: introduce qcom-minidump backend driver
  soc: qcom: smem: add minidump device
  init/version: Annotate static information into Kmemdump
  cpu: Annotate static information into Kmemdump
  genirq/irqdesc: Annotate static information into Kmemdump
  panic: Annotate static information into Kmemdump
  sched/core: Annotate static information into Kmemdump
  timers: Annotate static information into Kmemdump
  kernel/fork: Annotate static information into Kmemdump
  mm/page_alloc: Annotate static information into Kmemdump
  mm/init-mm: Annotate static information into Kmemdump
  mm/show_mem: Annotate static information into Kmemdump
  mm/swapfile: Annotate static information into Kmemdump
  mm/percpu: Annotate static information into Kmemdump
  mm/mm_init: Annotate static information into Kmemdump
  printk: Register information into Kmemdump
  kernel/configs: Register dynamic information into Kmemdump
  mm/numa: Register information into Kmemdump
  mm/sparse: Register information into Kmemdump
  kernel/vmcore_info: Register dynamic information into Kmemdump
  kmemdump: Add additional symbols to the coreimage
  init/version: Annotate init uts name separately into Kmemdump
  kallsyms: Annotate static information into Kmemdump
  mm/init-mm: Annotate additional information into Kmemdump
  kmemdump: Add Kinfo backend driver

 Documentation/debug/index.rst      |  17 ++
 Documentation/debug/kmemdump.rst   | 104 +++++++++
 MAINTAINERS                        |  18 ++
 drivers/Kconfig                    |   4 +
 drivers/Makefile                   |   2 +
 drivers/debug/Kconfig              |  55 +++++
 drivers/debug/Makefile             |   6 +
 drivers/debug/kinfo.c              | 304 +++++++++++++++++++++++++
 drivers/debug/kmemdump.c           | 239 +++++++++++++++++++
 drivers/debug/kmemdump_coreimage.c | 223 ++++++++++++++++++
 drivers/debug/qcom_minidump.c      | 353 +++++++++++++++++++++++++++++
 drivers/soc/qcom/smem.c            |  10 +
 include/asm-generic/vmlinux.lds.h  |  13 ++
 include/linux/kmemdump.h           | 219 ++++++++++++++++++
 init/version.c                     |   6 +
 kernel/configs.c                   |   6 +
 kernel/cpu.c                       |   5 +
 kernel/fork.c                      |   2 +
 kernel/irq/irqdesc.c               |   2 +
 kernel/kallsyms.c                  |  10 +
 kernel/panic.c                     |   4 +
 kernel/printk/printk.c             |  28 ++-
 kernel/sched/core.c                |   2 +
 kernel/time/timer.c                |   3 +-
 kernel/vmcore_info.c               |   3 +
 mm/init-mm.c                       |  12 +
 mm/mm_init.c                       |   2 +
 mm/numa.c                          |   5 +-
 mm/page_alloc.c                    |   2 +
 mm/percpu.c                        |   3 +
 mm/show_mem.c                      |   2 +
 mm/sparse.c                        |  16 +-
 mm/swapfile.c                      |   2 +
 33 files changed, 1670 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/debug/index.rst
 create mode 100644 Documentation/debug/kmemdump.rst
 create mode 100644 drivers/debug/Kconfig
 create mode 100644 drivers/debug/Makefile
 create mode 100644 drivers/debug/kinfo.c
 create mode 100644 drivers/debug/kmemdump.c
 create mode 100644 drivers/debug/kmemdump_coreimage.c
 create mode 100644 drivers/debug/qcom_minidump.c
 create mode 100644 include/linux/kmemdump.h

-- 
2.43.0


