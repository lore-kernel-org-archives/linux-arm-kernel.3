Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB46C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3xTtfp8+sFuOL15lrfY9099X11nqv/eMWaYFw/sH5k=; b=fey2x1+5R/fereVWmtuQpXmNNY
	r3B5BDIG7Qky21A2pTm3Gg0hq9BmMgROH97aV+GtrmdCubj7OZ29VGlsO9wm9vtrVPUry7Zk/hi3i
	TCedwrTuvTeYXMAiElBfQToYoqrVwIml5CtRTdWg6hoS0aZQo7dwzessqGRJIZVHWzd/iOVKR2Juk
	xViH/W5pjWP6Xk6cKhiaWYH8aobrCqbry0kqwO6TeGWJ3+ymHbGrxkewPzVXFXBPprxiIRPhlh5Ft
	tswQSa0uhEpfFTqnL1FJuT7cSFsOCqNSMoCmP27hJPg4qFavzP9XT6+E9FZ+lbtnyaY5yNBI09xSH
	29qUl2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nvb-0000000FDCZ-3qbG;
	Wed, 02 Sep 2026 16:35:11 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nvY-0000000FDBQ-2hpC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788366903; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=t3xTtfp8+sFuOL15lrfY9099X11nqv/eMWaYFw/sH5k=;
	b=Vtg0YuLTtR62D0ZLd/3+BlVGqn4pqpHWaIjUdxVjuvtURVb3wVPQB3/GQK8cFMXF8H5G/pU4DKMv75gPmSTMCFWGpsAVEnJ7SgLrgT2mphUconbFDWDkoHVTHjbfD6G4ew4yUj6kJ0sLsCKM2qnalqb4JvERLaJd2bg0/7lFDf4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XADH..Q_1788366900;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0XADH..Q_1788366900 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Sep 2026 00:35:01 +0800
From: Wang Han <wanghan@linux.alibaba.com>
To: weilin.chang@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	tabba@google.com,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	ljs@kernel.org,
	itaru.kitayama@fujitsu.com
Subject: Re: [PATCH v5 0/6] KVM: arm64: nv: Implement nested stage-2 reverse map (new data structure)
Date: Thu,  3 Sep 2026 00:35:00 +0800
Message-ID: <20260902163500.1841671-1-wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810205038.118843-1-weilin.chang@arm.com>
References: <20260810205038.118843-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_093508_885552_64B69EAF 
X-CRM114-Status: GOOD (  10.18  )
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

Hi Wei-Lin,

I tested this series on a Yitian 710 system with an ARM Neoverse-N2 CPU
(128 CPUs, 2 NUMA nodes).

Test environment
----------------

  L0 kernel: Linux v7.2-rc6
  L1 guest: Ubuntu 26.04 LTS, kernel 7.0.0-27-generic (aarch64)
  QEMU: 10.2.3

L0 NUMA balancing was enabled (`/proc/sys/kernel/numa_balancing=1`).
The host was booted with `kvm_arm.mode=nested`.

This series fixes a functional hang that is exposed when NUMA balancing is
enabled.  The previous nested stage-2 unmap path is too slow for this
workload, making the performance problem user-visible: NUMA balancing can
leave the L1 guest unable to make progress and eventually hang during boot.

The L1 was started with 8 vCPUs and 32 GiB of RAM using:

  qemu-system-aarch64 -smp 8 -m 32G \
    -machine virt,accel=kvm,gic-version=3,virtualization=on \
    -cpu host -nographic -enable-kvm \
    -drive if=pflash,format=raw,readonly=on,file=pflash0_bak.img \
    -drive if=pflash,format=raw,file=pflash1_bak.img \
    -drive file=./ubuntu-vm.qcow2,format=qcow2,if=virtio,cache=none,aio=native \
    -nic user,model=virtio-net-pci,hostfwd=tcp::11234-:22 \
    -serial mon:stdio

With upstream v7.2-rc6 (075b74841bd0065a3bda3440873c747938e69b68),
L0 NUMA balancing enabled, and the same QEMU configuration, the L1 guest
hung during boot.  The original L1 console reported:

  [   76.595764] watchdog: BUG: soft lockup - CPU#1 stuck for 45s! [k8s-dqlite:3068]
  [   76.595973] watchdog: BUG: soft lockup - CPU#0 stuck for 38s! [rs:main Q:Reg:1602]
  [   76.596181] watchdog: BUG: soft lockup - CPU#7 stuck for 45s! [kubelite:2672]
  [   76.596334] watchdog: BUG: soft lockup - CPU#5 stuck for 38s! [containerd:2375]

The corresponding L0 hung-task report was:

  [Wed Sep  2 22:49:08 2026] INFO: task qemu-system-aar:14681 blocked in I/O wait for more than 120 seconds.
  [Wed Sep  2 22:49:08 2026]       Tainted: G            E    N  7.2.0-rc6-poluted_opt-7-2-numa #10.al8
  [Wed Sep  2 22:49:08 2026] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  [Wed Sep  2 22:49:08 2026] task:qemu-system-aar state:D stack:0     pid:14681 tgid:14681 ppid:14680  task_flags:0x8400080 flags:0x00800000
  [Wed Sep  2 22:49:08 2026] Call trace:
  [Wed Sep  2 22:49:08 2026]  __switch_to+0x128/0x168 (T)
  [Wed Sep  2 22:49:08 2026]  __schedule+0x278/0x910
  [Wed Sep  2 22:49:08 2026]  schedule+0x3c/0xe8
  [Wed Sep  2 22:49:08 2026]  io_schedule+0x44/0x68
  [Wed Sep  2 22:49:08 2026]  softleaf_entry_wait_on_locked+0x280/0x2d0
  [Wed Sep  2 22:49:08 2026]  migration_entry_wait+0xdc/0x140
  [Wed Sep  2 22:49:08 2026]  do_swap_page+0x834/0xd80
  [Wed Sep  2 22:49:08 2026]  handle_pte_fault+0x208/0x2b8
  [Wed Sep  2 22:49:08 2026]  __handle_mm_fault+0x228/0x528
  [Wed Sep  2 22:49:08 2026]  handle_mm_fault+0xdc/0x2d8
  [Wed Sep  2 22:49:08 2026]  do_page_fault+0x388/0x790
  [Wed Sep  2 22:49:08 2026]  do_translation_fault+0x4c/0x88
  [Wed Sep  2 22:49:08 2026]  do_mem_abort+0x4c/0xa0
  [Wed Sep  2 22:49:08 2026]  el0_da+0x54/0x178
  [Wed Sep  2 22:49:08 2026]  el0t_64_sync_handler+0xd0/0xe8
  [Wed Sep  2 22:49:08 2026]  el0t_64_sync+0x1ac/0x1b0

The same wait and stack were observed repeatedly; the hung-task report
recurred after 241 and 362 seconds.

I applied the v5 series to the same v7.2-rc6 baseline.  With L0 NUMA
balancing still enabled and the same QEMU command line, the L1 guest
booted normally and could be operated through the serial console.  QEMU
no longer hung.  No new soft-lockup, hung-task, blocked-I/O,
migration-entry-wait, or softleaf-entry-wait message was observed in the
patched boot log.

As a control, the unmodified v7.2-rc6 kernel with
/proc/sys/kernel/numa_balancing=0 also booted the L1 with the same QEMU
configuration.  This confirms that the patch removes the NUMA-balancing
failure mode in this setup rather than merely changing the guest setup.

Tested-by: Wang Han <wanghan@linux.alibaba.com>

Thanks,
Wang Han

