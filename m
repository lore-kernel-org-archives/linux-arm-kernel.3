Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54740CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ciXEF3yj4Lhs1v5bdpaxN7WP4kdTK7y/5arAKjXtWCw=; b=K5ItcGqYMSX0yVM0i89q2yvDiR
	Gx03wqiEyTSwo+LYmjyZmMZigqMkTavaX5mnK7GtmL8dfXEl2Jv1bRzamymdeZ64zvBfpezzlsGWd
	bgDqBSLpJd9t2SteYqoL453X+J1gb/rnRGOB82eDqTH2blmbv3u4PFgWvZrxlOXxIY5GRVYDS7NCx
	E4od/lpuRJyYGF2z9MmxBQRiI7BqPANUR4ha9crg+YwQ5BtCWBIslOIlbqrTdFpwH9ZM8SanSBfJJ
	f5rDqRtFmCe+l7rLl3/NocqJ0ALY3GWyI1lC4D1/bEs4XHyWFsqWZ+JfJmI4WXccJ8fI13Z4S+H3l
	WPc/MFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5PM-0000000A7hX-4BJv;
	Fri, 12 Sep 2025 15:09:53 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5PK-0000000A7fY-0L0i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:09:51 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-71d603b60cbso18626307b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689788; x=1758294588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ciXEF3yj4Lhs1v5bdpaxN7WP4kdTK7y/5arAKjXtWCw=;
        b=VSImwDJjwpcuOpxeVVt2OfMCaEZ5AvwkOqa3BvybAGNmh1U3WioMstckw66jQMbKhV
         nCugK1CkmqPWhqLTgCDk05h6PsEcTIxFK2+0SfSe5x2i/CXpAmLeTfVapXFHvCuwBmoJ
         hPAfzRQL/FtNp4/VybUaLUtC9bEGyvKbrmZeH3jC7TWU4eQ3o7nk578UmrE2lQuGilGi
         YXGIhUuxYv5r7DNVaNHRB9LknojJMquciPwhI3YGoDTjUyl49+x6WZWhGPS9nsEysAod
         3IQysvvozV95evz/RP6F422axASCGQMaSUWQLatLYyRJyrXk1AbqxRrVhPRKhZtl0jw3
         OFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689788; x=1758294588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ciXEF3yj4Lhs1v5bdpaxN7WP4kdTK7y/5arAKjXtWCw=;
        b=X3VP6iAkDcus8VWXKhdgdvX3KRBlzsOzI+pzkL90vSVALM0lcmmCNPyUvHsw7hkui0
         t4TGA50eSlSmWNKuV6AQrY7UBPKTrFPtIwZUl/P4TC2qWaHJbI3bvZzzzti+8Fo3G3NO
         kB4ZAyaSGFGyZy/nz5w6o/jpdVYpTW+P8KUgx8FRYv67S3jtJNX2dgXdtZsGWtTqLBEU
         pSdx0pkhHMnjtvrUQiK+E8QXTW/w4/O2eT5f7Te7SstAufn5nqZLQV0r8G8QFO1AfCnM
         fEpeWA+hoD8juXOSUNlFzGkAkBEBpeVQ/cibMz+BcgorOoeEmG6hRBj3LsQqFPhaITfI
         gBKA==
X-Forwarded-Encrypted: i=1; AJvYcCVARh2Y8ZPRz9WiYnLltr1JHNGAK7cyFlI5lIjpCKSI3Zr3YBhY2kGLHSqhlGcxv2Dz9m+lqcMi9sOxb+QwDJCj@lists.infradead.org
X-Gm-Message-State: AOJu0YwjjOW3BLb92iPTuvft/V3hMIdTcVjsij72JxCZSFhdvxZ7xvPe
	aNcZqVxnvCLFDHOOD3kkaK5re4XNsiVU+x53gNLXDcd9zeE6VMNpPU2hk1n7FFiv9CM=
X-Gm-Gg: ASbGncsLF5iVb4+enzPORmm9h4OzeXirYe7ZhOsaBBCg2osN4cRIC62jfOmwNtQXowd
	VPx2yOi0mBhXS/BscZvLbzXTOuVUOYuJUIlXDGcWk4u0VeXtBLVKmoPvuwTatGAPGhIP1cN8Vpw
	pa6qwi1IChy/Sa4R98kftRKuRIS7P3FYFH7TZEInC1XyG6NX9zKZ7OXh71bxHEdkDCstcB7LnJE
	hCJ+Sa1GqQCviPsAXkURiUKAberpA+Rm9y9vfP1TOBCSuz123aVqt6zfVJQLnSO1HClLL7zSTWN
	V9HAXUS18c9sxqRy8kEaWpu2NBS23truXzBKnXvwkFvPSiyeXDruKoI7/5I/kmzSYBOqR3RcjN+
	DmlxnjHR/RkN/uXQkCVSgdjKxLNN2n4FNjg==
X-Google-Smtp-Source: AGHT+IGbJnDOS2zesllhdbgpyWZwl3dW85Jzp55IkVX5D1wGuLzxnbfwHrDY3M5ahozd5m3Z5Y7A5g==
X-Received: by 2002:a05:690c:f04:b0:728:c4d2:87f with SMTP id 00721157ae682-730659bd0bdmr29325817b3.38.1757689788280;
        Fri, 12 Sep 2025 08:09:48 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:09:47 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 00/16] Introduce kmemdump
Date: Fri, 12 Sep 2025 18:08:39 +0300
Message-ID: <20250912150855.2901211-1-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_080950_147636_4CCE9B77 
X-CRM114-Status: GOOD (  35.72  )
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

*** History, motivation and available online resources ***

Initial version of kmemdump and discussion is available here:
https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/

Kmemdump has been presented and discussed at Linaro Connect 2025,
including motivation, scope, usability and feasability.
Video of the recording is available here for anyone interested:
https://www.youtube.com/watch?v=r4gII7MX9zQ&list=PLKZSArYQptsODycGiE0XZdVovzAwYNwtK&index=14

Linaro blog on kmemdump can be found here:
https://www.linaro.org/blog/introduction-to-kmemdump/

The implementation is based on the initial Pstore/directly mapped zones
published as an RFC here:
https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/

The back-end implementation for qcom_minidump is based on the minidump
patch series and driver written by Mukesh Ojha, thanks:
https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/

The RFC v2 version with .section creation and macro annotation kmemdump
is available here:
https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/

*** How to use kmemdump with minidump backend on Qualcomm platform guide ***

Prerequisites:
Crash tool compiled with target=ARM64 and minor changes required for usual crash
mode (minimal mode works without the patch)
A patch can be applied from here https://p.calebs.dev/49a048
This patch will be eventually sent in a reworked way to crash tool.

Target kernel must be built with :
CONFIG_DEBUG_INFO_REDUCED=n ; this will have vmlinux include all the debugging
information needed for crash tool.

Also, the kernel requires these as well:
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
memory/md_Kunknown46.BIN memory/md_Kunknown49.BIN  memory/md_Kunknown50.BIN \
memory/md_Kunknown51.BIN > ~/minidump_image`

Once you have the resulted file, use `crash` tool to load it, like this:
`./crash --no_modules --no_panic --no_kmem_cache --zero_excluded vmlinux minidump_image`

There is also a --minimal mode for ./crash that would work without any patch applied
to crash tool, but you can't inspect symbols, etc.

Once you load crash you will see something like this :

      KERNEL: /home/eugen/linux-minidump/vmlinux  [TAINTED]
    DUMPFILE: /home/eugen/new
        CPUS: 8 [OFFLINE: 5]
        DATE: Thu Jan  1 02:00:00 EET 1970
      UPTIME: 00:00:22
       TASKS: 0
    NODENAME: qemuarm64
     RELEASE: 6.17.0-rc5-next-20250910-00020-g7dfa02aeae7e
     VERSION: #116 SMP PREEMPT Thu Sep 11 18:28:06 EEST 2025
     MACHINE: aarch64  (unknown Mhz)
      MEMORY: 34.2 GB
       PANIC: ""
crash> log
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd4b2]
[    0.000000] Linux version 6.17.0-rc5-next-20250910-00020-g7dfa02aeae7e (eugen@eugen-station) (aarch64-none-linux-gnu-gcc (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 13.3.1 20240614, GNU ld (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 2.42.0.20240614) #116 SMP PREEMPT Thu Sep 11 18:28:06 EEST 2025


*** Debug Kinfo backend driver ***
I don't have any device to actually test this. So I have not.
I hacked the driver to just use a kmalloc'ed area to save things instead
of the shared memory, and dumped everything there and checked whether it is identical
with what the downstream driver would have saved.
So this synthetic test passed and memories are identical.
Anyone who actually wants to test this, feel free to reply to the patch.
I have also written a simple DT binding for the driver.

Thanks for everyone reviewing and bringing ideas into the discussion.

Eugen

Changelog since the v2 of the RFC:
- V2 available here : https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
- Removed the .section as requested by David Hildenbrand.
- Moved all kmemdump registration(when possible) to vmcoreinfo.
- Because of this, some of the variables that I was registering had to be non-static
so I had to modify this as per David Hildenbrand suggestion.
- Fixed minor things in the Kinfo driver: one field was broken, fixed some
compiler warnings, fixed the copyright and remove some useless includes.
- Moved the whole kmemdump from drivers/debug into mm/ and Kconfigs into mm/Kconfig.debug
and it's now available in kernel hacking, as per Randy Dunlap review
- Reworked some of the Documentation as per review from Jon Corbet


Changelog since the v1 of the RFC:
- V1 available here: https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/
- Reworked the whole minidump implementation based on suggestions from Thomas Gleixner.
This means new API, macros, new way to store the regions inside kmemdump
(ditched the IDR, moved to static allocation, have a static default backend, etc)
- Reworked qcom_minidump driver based on review from Bjorn Andersson
- Reworked printk log buffer registration based on review from Petr Mladek

I appologize if I missed any review comments. I know there is still lots of work
on this series and hope I will improve it more and more.
Patches are sent on top of next-20250910

Eugen Hristev (16):
  kmemdump: Introduce kmemdump
  Documentation: Add kmemdump
  kmemdump: Add coreimage ELF layer
  Documentation: kmemdump: Add section for coreimage ELF
  kernel/vmcore_info: Register dynamic information into Kmemdump
  kmemdump: Introduce qcom-minidump backend driver
  soc: qcom: smem: Add minidump device
  init/version: Add banner_len to save banner length
  genirq/irqdesc: Have nr_irqs as non-static
  panic: Have tainted_mask as non-static
  mm/swapfile: Have nr_swapfiles as non-static
  printk: Register information into Kmemdump
  sched: Add sched_get_runqueues_area
  kernel/vmcoreinfo: Register kmemdump core image information
  kmemdump: Add Kinfo backend driver
  dt-bindings: Add Google Kinfo

 Documentation/dev-tools/index.rst             |   1 +
 Documentation/dev-tools/kmemdump.rst          | 139 +++++++
 .../bindings/misc/google,kinfo.yaml           |  36 ++
 MAINTAINERS                                   |  19 +
 drivers/soc/qcom/smem.c                       |  10 +
 include/linux/kmemdump.h                      | 130 +++++++
 include/linux/printk.h                        |   1 +
 init/version-timestamp.c                      |   1 +
 init/version.c                                |   1 +
 kernel/irq/irqdesc.c                          |   2 +-
 kernel/panic.c                                |   2 +-
 kernel/printk/printk.c                        |  47 +++
 kernel/sched/core.c                           |  15 +
 kernel/sched/sched.h                          |   2 +
 kernel/vmcore_info.c                          | 149 ++++++++
 mm/Kconfig.debug                              |   2 +
 mm/Makefile                                   |   1 +
 mm/kmemdump/Kconfig.debug                     |  53 +++
 mm/kmemdump/Makefile                          |   6 +
 mm/kmemdump/kinfo.c                           | 293 +++++++++++++++
 mm/kmemdump/kmemdump.c                        | 234 ++++++++++++
 mm/kmemdump/kmemdump_coreimage.c              | 222 +++++++++++
 mm/kmemdump/qcom_minidump.c                   | 353 ++++++++++++++++++
 mm/swapfile.c                                 |   2 +-
 24 files changed, 1718 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/dev-tools/kmemdump.rst
 create mode 100644 Documentation/devicetree/bindings/misc/google,kinfo.yaml
 create mode 100644 include/linux/kmemdump.h
 create mode 100644 mm/kmemdump/Kconfig.debug
 create mode 100644 mm/kmemdump/Makefile
 create mode 100644 mm/kmemdump/kinfo.c
 create mode 100644 mm/kmemdump/kmemdump.c
 create mode 100644 mm/kmemdump/kmemdump_coreimage.c
 create mode 100644 mm/kmemdump/qcom_minidump.c

-- 
2.43.0


