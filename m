Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6348ACF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2CoM/ens8WWqPExecvbO2G6eVyAKF5jUf51yI4balEI=; b=fsvx2eJENgofbTcekCE1OdfbUd
	NKElsnxleyQl0rnORFtkhqoR6vK1BbBaICTmpIj5JarJljR8Za+M2JQ+q08A7qJQIhc/UucLE75Xn
	6luZbY8c1l/BB+T6dOCZBk+mfaISXEXtcKExxUQou3dQ7jvIjYfRGo771EsbF+h2wlB57Q21g7jpj
	ReVB78NjaodpaEwwvzPoqHPX+cicgoATPyI66hINISwkFbafJN5u5T2v8ufBSjd07bSr3KtohUswN
	vRaHrFaYysHWhql7Q2QijTkxKbe+/QK+7uoS2kPPXVfVf4orEMtBO2/4kCnaxMJvC3KjVahU5fYps
	nhDfgbSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkMz-00000003Vx1-1QXS;
	Wed, 19 Nov 2025 15:45:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkMw-00000003VvC-1P2t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso18018855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567116; x=1764171916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2CoM/ens8WWqPExecvbO2G6eVyAKF5jUf51yI4balEI=;
        b=FRV4SUQ4Csuylv/hZL514LUriJOimWayUa4Bc43y7eCOEF/vAkPclIMVGxcPmoXD72
         nRHXJ4gH9e/BL6RIKCBOnfA9xYj1TzVOq0o/gmlrsRAtLk2iO6R2yaxxB7Oaq9yGM5vD
         RH9wXpcChDSjjyLiLFSDqXppurOQbKdb4JQHtkA6U2W6CqT/e+Fyf/4ROzVI267MAjgQ
         u9Z6reYrLtc0/uA7eOPXOl8a8kEH4QHOGqI7UDi2v7666EMYT6NyrPq/rNmPry+X69WO
         xpUzvdwcUbG+4KgWPp8GaBIDonQBJp36+uodUrc0NKb+t+Pu9qtYiQeksJsdhsd+znF2
         9fTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567116; x=1764171916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CoM/ens8WWqPExecvbO2G6eVyAKF5jUf51yI4balEI=;
        b=DdfO3q3Ddn7yIQza2prviTh6Lsxomd/fXfgD8L2SeehVeSJQ72gr7o6wDy7EkX77v7
         uQjrogqVxGCI2lDsLldZS/tAFOttTCDuJ/QEijLSOXhFaoEBXIlKdS8hMeSUTrrT3gYG
         H63e/+3fH/NZVrtlSpItxokQ8D5Ro4ImZlKp5AoCDgg8drD/MhFBV3nEKlmglfzuFpXL
         aoa+6grhiILKbDGt47fhTSBUuBdqC2fjv/n2nrjgEMjtGGu3TELOFkxxOyuOpH+tBfeK
         F+3/MabbTA0MgPPi94r3PBMUXKQ0IXzoOAVNn3rLoF72xFGEzdKfGxYyVlNETTiJaRsz
         yHhw==
X-Forwarded-Encrypted: i=1; AJvYcCUp55kLAaYzTTkhHQBmCNUhPcLWzpBLObyjy0UOKDZ66DVJxvjZGOT/MP7ncibdhlcieCOm5eagiCwHjX6bBKXl@lists.infradead.org
X-Gm-Message-State: AOJu0YzqLNXV8hSe5Vkz3pfi9qC75nKpVsIL+SRBlBBI9R+0VoVl2rxT
	b4u/nSMOv19jEeyeh8bkcXUUPhsRZOGVvplOmSG24iPQv2IrBJlmXzLxvYwXeYSljTc=
X-Gm-Gg: ASbGncuf/1GXr8aY03M+675XqD5j6XcwafyMPKf9qqTYnvnK9aNoCuGyxqKO6r3Hpcp
	yqVGziWnXATVWj4y5a4oXdxdhV46HBOyLQDNRPSfBUBz0HJGwHtKiEky0q7DKWDe3HYcY7oJwkr
	suf1MyIr0qggOM1Mw8V8DQYy8g3kiugUEQJhf/SQZafpaYaTd9UCAyRbWxQuczbKMLjjnOG+IcM
	RbFYqBOvovK4+aWj6gvPfyUZRY+4DMSD7rIp+nW0j6YOfDKgQT9A6DLakOHcrVbT4fN8Qks5qly
	rEigNrRcAs9z+ynrp+8+NNYgrOU5xmjDAbj2T+moKaH8FNy3PATsE+syXiI1GBJjTDqbvKmAWzn
	H9soVmdOBjY/hBdtRMBQF0WbVdS/w8dWthuv2SNE+xq3g2LpgfG0z+slcoh5Muo3xqjeVZLPloM
	FMK2PUJDHhLt0K8CNn+xyMzI+ER5lRvI9eRKoUt8Rd
X-Google-Smtp-Source: AGHT+IFhpUd90PtBYipaTNuAgtosZy/Rxs0TcU1PR7yeoivrzB2NBo62Iu8MK8pJ9S+Pf5MRkbeoFA==
X-Received: by 2002:a05:600c:1c1e:b0:477:aed0:f401 with SMTP id 5b1f17b1804b1-477aed0fb7emr55369745e9.23.1763567115726;
        Wed, 19 Nov 2025 07:45:15 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:15 -0800 (PST)
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
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 00/26] Introduce meminspect
Date: Wed, 19 Nov 2025 17:44:01 +0200
Message-ID: <20251119154427.1033475-1-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074518_533494_76ED7537 
X-CRM114-Status: GOOD (  35.29  )
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

meminspect is a mechanism which allows the kernel to mark specific memory
areas for memory dumping or specific inspection, statistics, usage.
Once regions are marked, meminspect keeps an internal list with the regions
in a dedicated table.
Further, these regions can be accessed using specific API by any interested driver.
Regions being marked beforehand, when the system is up and running, there
is no need nor dependency on a panic handler, or a working kernel that can
dump the debug information.
meminspect can be primarily used for debugging. The approach is feasible to work
when pstore, kdump, or another mechanism do not.
Pstore relies on persistent storage, a dedicated RAM area or flash, which
has the disadvantage of having the memory reserved all the time, or another
specific non volatile memory. Some devices cannot keep the RAM contents on
reboot so ramoops does not work. Some devices do not allow kexec to run
another kernel to debug the crashed one.
For such devices, that have another mechanism to help debugging, like
firmware, kmemdump is a viable solution.

meminspect can create a core image, similar with /proc/vmcore, with only
the registered regions included. This can be loaded into crash tool/gdb and
analyzed. This happens if CRASH_DUMP=y.
To have this working, specific information from the kernel is registered,
and this is done at meminspect init time, no need for the meminspect users to
do anything.

This version of the meminspect patch series includes two drivers that make use of it:
one is the Qualcomm Minidump, and the other one is the Debug Kinfo
backend for Android devices, reworked from this source here:
https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/android/debug_kinfo.c
written originally by Jone Chou <jonechou@google.com>

*** History, motivation and available online resources ***

The patch series is based on both minidump and kmemdump previous implementations.

After the three RFC kmemdump versions, considering the ML discussions, I decided to
move this into kernel/ directory and rework it into naming it meminspect, as Thomas Gleixner
suggested.
I will present this version at Plumbers conference in Tokyo on December 13th:
https://lpc.events/event/19/contributions/2080/
I am eager to discuss it there face to face.

Initial version of kmemdump and discussion is available here:
https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/

Kmemdump has been presented and discussed at Linaro Connect 2025,
including motivation, scope, usability and feasability.
Video of the recording is available here for anyone interested:
https://www.youtube.com/watch?v=r4gII7MX9zQ&list=PLKZSArYQptsODycGiE0XZdVovzAwYNwtK&index=14

Linaro blog on kmemdump can be found here:
https://www.linaro.org/blog/introduction-to-kmemdump/

Linaro blog on kmemdump step by stem using minidump backend is available here:
https://www.linaro.org/blog/kmemdump-step-by-step-on-qualcomm-automotive-platform/

The implementation is based on the initial Pstore/directly mapped zones
published as an RFC here:
https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/

The back-end implementation for qcom_minidump is based on the minidump
patch series and driver written by Mukesh Ojha, thanks:
https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/

The RFC v2 version with .section creation and macro annotation kmemdump
is available here:
https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/

The RFC v3 version with making everything static, which was pretty much rejected due to
all reasons discussed on the public ML:
https://lore.kernel.org/all/20250912150855.2901211-1-eugen.hristev@linaro.org/

*** How to use meminspect with minidump backend on Qualcomm platform guide ***

Prerequisites:
Crash tool compiled with target=ARM64 and minor changes required for usual crash
mode (minimal mode works without the patch)
**A patch can be applied from here https://p.calebs.dev/1687bc **
This patch will be eventually sent in a reworked way to crash tool.

Target kernel must be built with :
CONFIG_DEBUG_INFO_REDUCED=n ; this will have vmlinux include all the debugging
information needed for crash tool.

Also, the kernel requires these as well:
CONFIG_MEMINSPECT,  CONFIG_CRASH_DUMP and the driver CONFIG_QCOM_MINIDUMP

Kernel arguments:
Kernel firmware must be set to mode 'mini' by kernel module parameter
like this : qcom_scm.download_mode=mini

After the kernel boots, and minidump module is loaded, everything is ready for
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
memory/md_Ktotalram4.BIN memory/md_Kcpu_poss5.BIN memory/md_Kcpu_pres6.BIN \
memory/md_Kcpu_onli7.BIN memory/md_Kcpu_acti8.BIN memory/md_Kmem_sect9.BIN \
memory/md_Kjiffies10.BIN memory/md_Klinux_ba11.BIN memory/md_Knr_threa12.BIN \
memory/md_Knr_irqs13.BIN memory/md_Ktainted_14.BIN memory/md_Ktaint_fl15.BIN \
memory/md_Knode_sta16.BIN memory/md_K__per_cp17.BIN memory/md_Knr_swapf18.BIN \
memory/md_Kinit_uts19.BIN memory/md_Kprintk_r20.BIN memory/md_Kprintk_r21.BIN \
memory/md_Kprb22.BIN memory/md_Kprb_desc23.BIN memory/md_Kprb_info24.BIN \
memory/md_Kprb_data25.BIN  memory/md_Khigh_mem26.BIN memory/md_Kinit_mm27.BIN \
memory/md_Kunknown29.BIN memory/md_Kunknown30.BIN memory/md_Kunknown31.BIN \
memory/md_Kunknown32.BIN memory/md_Kunknown33.BIN memory/md_Kunknown34.BIN \
memory/md_Kunknown35.BIN memory/md_Kunknown36.BIN memory/md_Kunknown37.BIN \
memory/md_Kunknown38.BIN memory/md_Kunknown39.BIN memory/md_Kunknown40.BIN \
memory/md_Kunknown41.BIN memory/md_Kunknown42.BIN memory/md_Kunknown43.BIN \
memory/md_Kunknown44.BIN memory/md_Kunknown45.BIN  memory/md_Kunknown46.BIN \
memory/md_Kunknown47.BIN memory/md_Kunknown48.BIN memory/md_Kunknown49.BIN \
memory/md_Kunknown50.BIN memory/md_Kunknown51.BIN memory/md_Kunknown52.BIN \
memory/md_Kunknown53.BIN memory/md_Kunknown54.BIN memory/md_Kunknown55.BIN \
memory/md_Kunknown56.BIN memory/md_Kunknown57.BIN > ~/minidump_image`

Once you have the resulted file, use `crash` tool to load it, like this:
`./crash --no_modules --no_panic --no_kmem_cache --zero_excluded vmlinux minidump_image`

There is also a --minimal mode for ./crash that would work without any patch applied
to crash tool, but you can't inspect symbols, etc.

Once you load crash you will see something like this :
      KERNEL: /home/eugen/linux-minidump/vmlinux  [TAINTED]
    DUMPFILE: /home/eugen/a
        CPUS: 8 [OFFLINE: 6]
        DATE: Thu Jan  1 02:00:00 EET 1970
      UPTIME: 00:00:25
       TASKS: 0
    NODENAME: qemuarm64
     RELEASE: 6.18.0-rc2-00030-g65df2b8a0dde
     VERSION: #33 SMP PREEMPT Mon Nov 17 13:30:54 EET 2025
     MACHINE: aarch64  (unknown Mhz)
      MEMORY: 0
       PANIC: ""
crash> log
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd4b2]
[    0.000000] Linux version 6.18.0-rc2-00030-g65df2b8a0dde

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

Changelog for meminspect v1:
- rename to meminspect
- start on top of v2 actually, with the section and all.
- remove the backend thing, change the API to access the table
- move everything to kernel/
- add dependency to CRASH_DUMP instead of a separate knob
- move the minidump driver to soc/qcom
- integrate the meminspect better into memblock by using a new memblock flag
- minor fixes : use dev_err_probe everywhere, rearrange variable declarations,
remove some useless code, etc.

Changelog for RFC v3:
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


Changelog for RFC v2:
- V1 available here: https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/
- Reworked the whole minidump implementation based on suggestions from Thomas Gleixner.
This means new API, macros, new way to store the regions inside kmemdump
(ditched the IDR, moved to static allocation, have a static default backend, etc)
- Reworked qcom_minidump driver based on review from Bjorn Andersson
- Reworked printk log buffer registration based on review from Petr Mladek

I appologize if I missed any review comments.
Patches are sent on top on 6.18-rc2

Eugen Hristev (26):
  kernel: Introduce meminspect
  init/version: Annotate static information into meminspect
  mm/percpu: Annotate static information into meminspect
  cpu: Annotate static information into meminspect
  genirq/irqdesc: Annotate static information into meminspect
  timers: Annotate static information into meminspect
  kernel/fork: Annotate static information into meminspect
  mm/page_alloc: Annotate static information into meminspect
  mm/show_mem: Annotate static information into meminspect
  mm/swapfile: Annotate static information into meminspect
  kernel/vmcore_info: Register dynamic information into meminspect
  kernel/configs: Register dynamic information into meminspect
  mm/init-mm: Annotate static information into meminspect
  panic: Annotate static information into meminspect
  kallsyms: Annotate static information into meminspect
  mm/mm_init: Annotate static information into meminspect
  sched/core: Annotate runqueues into meminspect
  mm/memblock: Add MEMBLOCK_INSPECT flag
  mm/numa: Register information into meminspect
  mm/sparse: Register information into meminspect
  printk: Register information into meminspect
  remoteproc: qcom: Extract minidump definitions into a header
  soc: qcom: Add minidump driver
  soc: qcom: smem: Add minidump device
  dt-bindings: reserved-memory: Add Google Kinfo Pixel reserved memory
  meminspect: Add Kinfo compatible driver

 Documentation/dev-tools/index.rst             |   1 +
 Documentation/dev-tools/meminspect.rst        | 139 ++++++
 .../reserved-memory/google,kinfo.yaml         |  49 ++
 MAINTAINERS                                   |  13 +
 drivers/remoteproc/qcom_common.c              |  56 +--
 drivers/soc/qcom/Kconfig                      |  13 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/minidump.c                   | 272 ++++++++++
 drivers/soc/qcom/smem.c                       |  10 +
 include/asm-generic/vmlinux.lds.h             |  13 +
 include/linux/memblock.h                      |   7 +
 include/linux/meminspect.h                    | 261 ++++++++++
 include/linux/soc/qcom/minidump.h             |  72 +++
 init/Kconfig                                  |   2 +
 init/version-timestamp.c                      |   3 +
 init/version.c                                |   3 +
 kernel/Makefile                               |   1 +
 kernel/configs.c                              |   6 +
 kernel/cpu.c                                  |   5 +
 kernel/fork.c                                 |   2 +
 kernel/irq/irqdesc.c                          |   2 +
 kernel/kallsyms.c                             |  10 +
 kernel/meminspect/Kconfig                     |  30 ++
 kernel/meminspect/Makefile                    |   4 +
 kernel/meminspect/kinfo.c                     | 289 +++++++++++
 kernel/meminspect/meminspect.c                | 470 ++++++++++++++++++
 kernel/panic.c                                |   4 +
 kernel/printk/printk.c                        |  12 +
 kernel/sched/core.c                           |   2 +
 kernel/time/timer.c                           |   2 +
 kernel/vmcore_info.c                          |   4 +
 mm/init-mm.c                                  |  11 +
 mm/memblock.c                                 |  36 ++
 mm/mm_init.c                                  |   2 +
 mm/numa.c                                     |   2 +
 mm/page_alloc.c                               |   2 +
 mm/percpu.c                                   |   2 +
 mm/show_mem.c                                 |   2 +
 mm/sparse.c                                   |   4 +
 mm/swapfile.c                                 |   2 +
 40 files changed, 1766 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/dev-tools/meminspect.rst
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
 create mode 100644 drivers/soc/qcom/minidump.c
 create mode 100644 include/linux/meminspect.h
 create mode 100644 include/linux/soc/qcom/minidump.h
 create mode 100644 kernel/meminspect/Kconfig
 create mode 100644 kernel/meminspect/Makefile
 create mode 100644 kernel/meminspect/kinfo.c
 create mode 100644 kernel/meminspect/meminspect.c

-- 
2.43.0


