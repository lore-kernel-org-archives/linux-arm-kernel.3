Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5CEC98305
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xKz7fpX0m3HON3ZYP4pMx6i7wGXXtQ7CG30/boiLWDg=; b=pYVxYmOuZ/1pH2/qWigrtGJTzD
	N5vhIzPVFOhtJA0Kwe42o5PeFkDb2Vj4mXSDXq3eyi2HUwwkRTieY5tWrlJOZL5mEnRT5QS6532km
	+dyp5aq+i7nJjvZxYjKGVZNzh5XlLSZOf+4Rt0IBjZdEGtWRl+VQ6VWKWQ4yXnYkVdNlkm0s5S4KP
	PS+Ga69SfhyBbAsVpUySHom5z937hz3xXy+0PktZlzgk8qggTHtEvO5t8grBXUY8Br1s0NscsksCd
	Ro9a0J7UrN7LSLfipD4aKHKE+KrR4cAA/kKxE9hOfkb9tZD38dffDf6bmbZYaOPU63VqgCTktvCsz
	4LIp8s6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uqR-00000004Ury-0PN9;
	Tue, 22 Sep 2026 07:23:15 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uqO-00000004UrG-07XC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790061792; x=1821597792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oG0xvub+pWhjgDDUHqMEF75UKWqTKLX50Voi38p/N0k=;
  b=Qd6SV+1EEuX9O2luwYkqSOWYQbeiZpN4ptrk2U+SHbeESGQDYFVr2C9w
   lF55onsOjZcYcheytABsE6mB/WX7Bg6Ma+BkJFmTv9IFEc9uigj0Fi03+
   uC5DeVMdhFgdzMU+2jmuXam9pRBBXf/rczy3rn/IxoT5M+n5OtmNIlPFT
   ssKvx8ZdRDEXl9Z0mxhEe2OHZfNpIDEIyhcJ9/p6IeL/xUJMxbylE34Uu
   Ge3MGDqb/mqsae5qO3FJabV10y+slXqDxQWM/LCbiDoYuLIef/nfWyhA2
   mY3s5Vet7PCpJVqSxqiOgV3XvdMlKLdFPleuryBGvr6QP1T32IIFakefx
   Q==;
X-CSE-ConnectionGUID: gEMvpBrgREOOvuw48l9LuA==
X-CSE-MsgGUID: 4YZvguskSAOMzNes6a2xMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101230206"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="101230206"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 00:23:11 -0700
X-CSE-ConnectionGUID: cH0olBJBTGy/6woawrGjpQ==
X-CSE-MsgGUID: 5kYOOCXET7GNklhLXKQ4dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="300941614"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 00:23:08 -0700
Date: Tue, 22 Sep 2026 15:23:00 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
	yi1.lai@intel.com
Subject: [soc:board-remove-7.3] [net]  8d91a5ecce:
 EIP:kernfs_remove_by_name_ns
Message-ID: <202609221423.71fce5fb-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_002312_084973_C9E407CB 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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



Hello,

kernel test robot noticed "EIP:kernfs_remove_by_name_ns" on:

commit: 8d91a5ecce11412c646ad1f1637334ef9546ea90 ("net: wireless: brcmfmac: remove platform data based probe") https://git.kernel.org/cgit/linux/kernel/git/soc/soc.git board-remove-7.3

in testcase: boot

config: i386-randconfig-011-20260914
compiler: clang-22
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 4 -m 4G

If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202609221423.71fce5fb-lkp@intel.com


[    5.486950][    T1] ------------[ cut here ]------------
[    5.488426][    T1] kernfs: can not remove 'uevent', no directory
[    5.489919][    T1] WARNING: fs/kernfs/dir.c:1786 at kernfs_remove_by_name_ns+0x7b/0xc0, CPU#0: swapper/0/1
[    5.492378][    T1] Modules linked in:
[    5.493281][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.3.0-rc2-00073-g8d91a5ecce11 #1 PREEMPTLAZY
[    5.495837][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    5.498316][    T1] EIP: kernfs_remove_by_name_ns (kernfs/dir.c:1785)
[    5.499706][    T1] Code: 74 5a a8 03 75 5c ff 00 89 c1 89 c6 e8 5e f9 ff ff 89 f0 e8 d7 d8 ff ff 31 f6 eb 1c 53 68 30 84 07 c3 e8 08 1b d4 ff 83 c4 08 <0f> 0b be fe ff ff ff eb 14 be fe ff ff ff 89 f8 e8 70 da da ff 8b
All code
========
   0:	74 5a                	je     0x5c
   2:	a8 03                	test   $0x3,%al
   4:	75 5c                	jne    0x62
   6:	ff 00                	incl   (%rax)
   8:	89 c1                	mov    %eax,%ecx
   a:	89 c6                	mov    %eax,%esi
   c:	e8 5e f9 ff ff       	call   0xfffffffffffff96f
  11:	89 f0                	mov    %esi,%eax
  13:	e8 d7 d8 ff ff       	call   0xffffffffffffd8ef
  18:	31 f6                	xor    %esi,%esi
  1a:	eb 1c                	jmp    0x38
  1c:	53                   	push   %rbx
  1d:	68 30 84 07 c3       	push   $0xffffffffc3078430
  22:	e8 08 1b d4 ff       	call   0xffffffffffd41b2f
  27:	83 c4 08             	add    $0x8,%esp
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	be fe ff ff ff       	mov    $0xfffffffe,%esi
  31:	eb 14                	jmp    0x47
  33:	be fe ff ff ff       	mov    $0xfffffffe,%esi
  38:	89 f8                	mov    %edi,%eax
  3a:	e8 70 da da ff       	call   0xffffffffffdadaaf
  3f:	8b                   	.byte 0x8b

Code starting with the faulting instruction ===========================================
   0:	0f 0b                	ud2
   2:	be fe ff ff ff       	mov    $0xfffffffe,%esi
   7:	eb 14                	jmp    0x1d
   9:	be fe ff ff ff       	mov    $0xfffffffe,%esi
   e:	89 f8                	mov    %edi,%eax
  10:	e8 70 da da ff       	call   0xffffffffffdada85
  15:	8b                   	.byte 0x8b
[    5.504411][    T1] EAX: 00000000 EBX: c3095d8c ECX: 00000000 EDX: 00000000
[    5.506084][    T1] ESI: c35f2608 EDI: c01dd42c EBP: c0245c1c ESP: c0245c08
[    5.507830][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010282
[    5.509606][    T1] CR0: 80050033 CR2: ffd97000 CR3: 0386e000 CR4: 000406d0
[    5.511412][    T1] Call Trace:
[    5.512419][    T1]  driver_remove_file (sysfs/file.c:515 linux/sysfs.h:780 base/driver.c:126)
[    5.513635][    T1]  bus_remove_driver (base/bus.c:830)
[    5.514785][    T1]  driver_unregister (base/driver.c:202)
[    5.515927][    T1]  brcmfmac_module_init (base/platform.c:1005 net/wireless/broadcom/brcm80211/brcmfmac/common.c:580)
[    5.517104][    T1]  __initstub__kmod_brcmfmac__510_591_brcmfmac_module_init6 (net/wireless/broadcom/brcm80211/brcmfmac/common.c:591)
[    5.519013][    T1]  do_one_initcall (main.c:1357)
[    5.520164][    T1]  ? __initstub__kmod_ath6kl_sdio__508_1430_ath6kl_sdio_driver_init6 (usercopy_32.c:?)
[    5.522289][    T1]  ? __lock_acquire (locking/lockdep.c:4718)
[    5.523491][    T1]  ? __lock_acquire (locking/lockdep.c:4718)
[    5.525180][    T1]  ? lock_acquire (locking/lockdep.c:5942)
[    5.526824][    T1]  ? __lock_acquire (locking/lockdep.c:4718)
[    5.530956][    T1]  ? __lock_acquire (locking/lockdep.c:4718)
[    5.532755][    T1]  ? lock_acquire (locking/lockdep.c:5942)
[    5.534332][    T1]  ? lock_acquire (locking/lockdep.c:5942)
[    5.536001][    T1]  ? __this_cpu_preempt_check (smp_processor_id.c:64)
[    5.537894][    T1]  ? __this_cpu_preempt_check (smp_processor_id.c:64)
[    5.539914][    T1]  ? ktime_get (time/timekeeping.c:1002)
[    5.541408][    T1]  ? ktime_get (time/timekeeping.c:1002)
[    5.542911][    T1]  ? ktime_get (time/timekeeping.c:321 time/timekeeping.c:482 time/timekeeping.c:1004)
[    5.544554][    T1]  ? clockevents_program_event (time/clockevents.c:372)
[    5.546602][    T1]  ? irqentry_exit (linux/irq-entry-common.h:507)
[    5.548377][    T1]  ? __this_cpu_preempt_check (smp_processor_id.c:64)
[    5.550315][    T1]  ? lockdep_hardirqs_on (locking/lockdep.c:4516)
[    5.552128][    T1]  ? irqentry_exit (linux/irq-entry-common.h:507)
[    5.553774][    T1]  ? sysvec_apic_timer_interrupt (x86/kernel/apic/apic.c:1062)
[    5.559179][    T1]  ? trace_hardirqs_on (trace/trace_preemptirq.c:79)
[    5.560942][    T1]  ? vmware_sched_clock (vmware.c:?)
[    5.562784][    T1]  ? irqentry_exit (linux/irq-entry-common.h:507)
[    5.564594][    T1]  ? vmware_sched_clock (vmware.c:?)
[    5.566492][    T1]  ? sysvec_apic_timer_interrupt (x86/kernel/apic/apic.c:1062)
[    5.568555][    T1]  ? handle_exception (x86/entry/entry_32.S:1044)
[    5.570285][    T1]  ? parameq (params.c:98)
[    5.571797][    T1]  ? next_arg (cmdline.c:283)
[    5.573381][    T1]  ? parameq (linux/fortify-string.h:218 params.c:99)
[    5.574711][    T1]  ? parse_args (params.c:153)
[    5.579714][    T1]  do_initcall_level (main.c:1419)
[    5.581382][    T1]  do_initcalls (main.c:1435)
[    5.582841][    T1]  ? rest_init (main.c:?)
[    5.584478][    T1]  do_basic_setup (main.c:1455)
[    5.586016][    T1]  kernel_init_freeable (main.c:1670)
[    5.587875][    T1]  ? rest_init (main.c:?)
[    5.589472][    T1]  kernel_init (main.c:1560)
[    5.590987][    T1]  ret_from_fork (x86/kernel/process.c:158)
[    5.592643][    T1]  ? rest_init (main.c:?)
[    5.594157][    T1]  ret_from_fork_asm (x86/entry/entry_32.S:736)
[    5.595882][    T1]  entry_INT80_32 (x86/entry/entry_32.S:940)
[    5.597546][    T1] irq event stamp: 90237
[    5.598888][    T1] hardirqs last  enabled at (90251): __console_unlock (printk/printk.c:347)
[    5.600980][    T1] hardirqs last disabled at (90266): __console_unlock (printk/printk.c:345)
[    5.603033][    T1] softirqs last  enabled at (90070): __do_softirq (softirq.c:679)
[    5.604968][    T1] softirqs last disabled at (90061): __do_softirq (softirq.c:679)
[    5.606947][    T1] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260922/202609221423.71fce5fb-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


