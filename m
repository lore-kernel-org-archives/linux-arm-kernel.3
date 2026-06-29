Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60137C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UisZIj9SAq+/iU2iNCfWWIml1oT3ijfALHSO5VDxq/M=; b=ytjy6ycBGFg+6K5b0KqbUdd3Vl
	q/MESX9hWKkKjQPS/NjOTa2CriCmaa9somyqezM60pYsX9WEJkGwVRAGPbfG0sezHXtEd9RJNT7n/
	NMvZ+P4gbBFL9+MuqXHtFsxwsshKjfrLwYXgi2uvWXSnmUgfRh+gQ3P3ypmE8xDdrY8Sm3Q3wuWsH
	YVXQ5Gv4YUpptscdvs9CETm3Sg67M/x8DOUhixLWjYrVzIOvq+N6sM+S6SKpoF5VOMkXxjE19CBNw
	usT+Hl6ZxLnOVIvCyqLexavEQY5VGke87mZtpx6oVe8aBTHwAViwsae3Pgzvt+7nd8M1g7LjrO3Dm
	i3fyVtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD4Z-0000000EtE3-1AfF;
	Mon, 29 Jun 2026 14:34:55 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD4V-0000000EtDC-3dmq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:34:53 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-30b9e755555so5763065eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782743691; x=1783348491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UisZIj9SAq+/iU2iNCfWWIml1oT3ijfALHSO5VDxq/M=;
        b=fPn4RDuS4m/rC++Y1QD/8qtLYixVqaGJpZutD3ZP/GxNT+IJB6nd05f4LJYAG8adN8
         f+fMbNlCMULs4w822drbBiWXKAgzI/7axHMFkehNClHzdAY7smGWdJBLBTbbx3uFbt9J
         xj/QhLMVPQWZ0FVzxyq05cGDtYifg8ptYdQkA+RzHlhZZfX1hSQPHVa3CRSi8YSkC3Wk
         FbrtdeP+/fK6LSJGoJZcit8lB26DP4D2f8qAB1sNXDOzr+j4hOfH+mltOhEYuf0e5kda
         XGpjEqhUL3x/4B9iT245qRBdGYKYVQNtvLxD1GTao9mv9uHvlJGPn7znpiXClW+iZchO
         rUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743691; x=1783348491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UisZIj9SAq+/iU2iNCfWWIml1oT3ijfALHSO5VDxq/M=;
        b=Um1dRtGPIvTnXvOFzlWwSDJirV5ZO7hZYxbw0ssxtbu6weiDrlvxBhKXCFC2ZRUzkD
         Qy7a6q7Fn5TKEbWCqQ45FJp0NwmsE0AgUetHSKZAwWapZTmb0dTcYSUJ1+vTsYAr/CTL
         /BD/EGjEgRHNe/kVsxg7FlStz2r+oAcIFFRZs6sQeN7y2guRZTT4W2zda+xa1M9T7ubp
         mxRSVVxyeK7frSfnL825PCu9/1VlI2TIKLqOUNo3QYJIPJxH0Pov0bcnTwwxMJIK+rmN
         put09AtlzZP82MZtgD45mSn0nUIvDarjkwSKHH2gr3eM55+tJKFxdmuwJXiVTp2oQj6S
         739w==
X-Forwarded-Encrypted: i=1; AHgh+RqvxyFWVzo/Zyca6cR8Zk4odH7h4DrYEOGPi6PdM6Kt3uW+zQlP0nkQf9Dvu088R3nOGxd/QlVPE+AMHX7JcADA@lists.infradead.org
X-Gm-Message-State: AOJu0YyKSa0TWqbXlEAtL7csnx4DgqHH0KbXKxwPocixlo2nBtAR9gRV
	wfqUU50H6rAF4wUeb9I0xmcb1N81RhVgJdDTMPL5Bm1GIwRaqqa0AWUL
X-Gm-Gg: AfdE7ckbcKZ12ReThdQT3Ok/lBr6OjeaUzWCLTZq5vA8CHTdo/O+PLwoMdSlNivlXtU
	EPGRBdyCKwwJm4PPJWZEhK3aVPwrERRTuknWzDSJkBKA+jCkWQ5/jDeCWUfEZWOVN9xq9fbDsmR
	ko+lTXA7ey5ic9qNbMI3Z1aaaHGbme32NvxJ8rL7yE+ixhqLaewu8+ekMxOYewXH1g1EfW0UUaU
	ZKUwWOeWtVBjoB678mzu4v6uCUUhKVtkV9wytq5rCeEcykhh7o1MNW357mzKLnSKfFXRFNTt9/H
	o61qIi9cugDNj6qxP4IA2W0T7mtYMVpY2EYuH7rpaizzvvoNDjwpaEjrgQWDbfGRmQTXfBT+UtA
	5wkRFPDDz8kxXhSQmQbBKq/W9JCl7IkTKk0g8HNsWW/61s32GqPfcF2o3riA2U4qFQ1DMixkpyP
	t3CqPSvXmIW64UxJ+qnLLEYcAobsz3CC2BWWXYeRX7WpgF6zkKkkHaSMYOn4J2dZtBw+Z2sI/mX
	7NcN2fj
X-Received: by 2002:a05:693c:62d0:b0:30c:536e:3a95 with SMTP id 5a478bee46e88-30c84b94ff5mr10920163eec.2.1782743690538;
        Mon, 29 Jun 2026 07:34:50 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30edffa26afsm176604eec.4.2026.06.29.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:34:50 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: leonardo.costa@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Date: Mon, 29 Jun 2026 11:34:32 -0300
Message-ID: <20260629143439.361560-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_073451_914200_47D110F1 
X-CRM114-Status: GOOD (  12.20  )
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

We are seeing a regression on Apalis iMX6 where the kernel doesn't boot in the
newest v7.2-rc1 (it was working before, in v7.1). The device tree being used is the imx6q-apalis-eval.dtb. The kernel
configuration used is the one shown below:

    https://gist.github.com/lcosta37/53efdb2fb6e6e0fc05437c7e53b47737

The kernel logs stop almost immediately as the board starts to boot, and I 
don't notice any difference in the logs that points to the cause.

Is this known? We are seeing this behavior on all Apalis iMX6 modules, though
we don't see it on Colibri iMX6, so it is not SoC-specific.

Logs from v7.2-rc1 (not working, printing stops after the last line pasted
here):

    [    0.000000] Booting Linux on physical CPU 0x0
    [    0.000000] Linux version 7.2.0-rc1-0.0.0-devel (oe-user@oe-host) (arm-tdx-linux-gnueabi-gcc (GCC) 16.1.0, GNU ld (GNU Binutils) 2.46.1) #1 SMP PREEMPT Sun Jun 28 19:01:31 UTC 2026
    [    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d
    [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
    [    0.000000] OF: fdt: Machine model: Toradex Apalis iMX6Q/D Module on Apalis Evaluation Board
    [    0.000000] Memory policy: Data cache writealloc
    [    0.000000] cma: Reserved 256 MiB at 0x40000000
    [    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT
    [    0.000000] Zone ranges:
    [    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
    [    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
    [    0.000000] Movable zone start for each node
    [    0.000000] Early memory node ranges
    [    0.000000]   node   0: [mem 0x0000000010000000-0x000000004fffffff]
    [    0.000000] Initmem setup node 0 [mem 0x0000000010000000-0x000000004fffffff]
    [    0.000000] percpu: Embedded 15 pages/cpu s28684 r8192 d24564 u61440
    [    0.000000] Kernel command line: root=PARTUUID=adb2cea1-02 ro rootwait console=tty1 console=ttymxc0,115200
    [    0.000000] printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
    [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
    [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
    [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 262144
    [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
    [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
    [    0.000000] rcu: Preemptible hierarchical RCU implementation.
    [    0.000000] rcu:     RCU event tracing is enabled.
    [    0.000000]  Trampoline variant of Tasks RCU enabled.
    [    0.000000]  Tracing variant of Tasks RCU enabled.
    [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
    [    0.000000] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
    [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
    [    0.000000] L2C-310 errata 752271 769419 enabled
    [    0.000000] L2C-310 enabling early BRESP for Cortex-A9
    [    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
    [    0.000000] L2C-310 ID prefetch enabled, offset 16 lines


Logs from v7.1 (working) (full logs here: https://paste.debian.net/hidden/0f65ae5f)

    [    0.000000] Booting Linux on physical CPU 0x0
    [    0.000000] Linux version 7.1.0-0.0.0-devel (oe-user@oe-host) (arm-tdx-linux-gnueabi-gcc (GCC) 16.1.0, GNU ld (GNU Binutils) 2.46.1) #1 SMP PREEMPT Wed Jun 24 01:36:41 UTC 2026
    [    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d
    [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
    [    0.000000] OF: fdt: Machine model: Toradex Apalis iMX6Q/D Module on Apalis Evaluation Board
    [    0.000000] Memory policy: Data cache writealloc
    [    0.000000] cma: Reserved 256 MiB at 0x40000000
    [    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT
    [    0.000000] Zone ranges:
    [    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
    [    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
    [    0.000000] Movable zone start for each node
    [    0.000000] Early memory node ranges
    [    0.000000]   node   0: [mem 0x0000000010000000-0x000000004fffffff]
    [    0.000000] Initmem setup node 0 [mem 0x0000000010000000-0x000000004fffffff]
    [    0.000000] percpu: Embedded 15 pages/cpu s28684 r8192 d24564 u61440
    [    0.000000] pcpu-alloc: s28684 r8192 d24564 u61440 alloc=15*4096
    [    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
    [    0.000000] Kernel command line: root=PARTUUID=4ce4ba92-02 ro rootwait console=tty1 console=ttymxc0,115200
    [    0.000000] printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
    [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
    [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
    [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 262144
    [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
    [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
    [    0.000000] rcu: Preemptible hierarchical RCU implementation.
    [    0.000000] rcu:     RCU event tracing is enabled.
    [    0.000000]  Trampoline variant of Tasks RCU enabled.
    [    0.000000]  Tracing variant of Tasks RCU enabled.
    [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
    [    0.000000] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
    [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
    [    0.000000] L2C-310 errata 752271 769419 enabled
    [    0.000000] L2C-310 enabling early BRESP for Cortex-A9
    [    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
    [    0.000000] L2C-310 ID prefetch enabled, offset 16 lines
    [    0.000000] L2C-310 dynamic clock gating enabled, standby mode enabled
    [    0.000000] L2C-310 cache controller enabled, 16 ways, 1024 kB
    [    0.000000] L2C-310: CACHE_ID 0x410000c7, AUX_CTRL 0x76470001
    [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
    [    0.000000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
    [    0.000000] Switching to timer-based delay loop, resolution 333ns
    [    0.000001] sched_clock: 32 bits at 3000kHz, resolution 333ns, wraps every 715827882841ns
    [    0.000018] clocksource: mxc_timer1: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 637086815595 ns
    [    0.001910] Console: colour dummy device 80x30
    [    0.001926] printk: legacy console [tty1] enabled
    [    0.002519] Calibrating delay loop (skipped), value calculated using timer frequency.. 6.00 BogoMIPS (lpj=30000)
    [    0.002561] CPU: Testing write buffer coherency: ok
    [    0.002627] CPU0: Spectre v2: using BPIALL workaround
    [    0.002650] pid_max: default: 32768 minimum: 301
    [    0.002989] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
    [    0.003038] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
    [    0.003430] VFS: Finished mounting rootfs on nullfs
    [    0.004538] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
    [    0.006552] Setting up static identity map for 0x10100000 - 0x10100060
    [    0.006835] rcu: Hierarchical SRCU implementation.
    [    0.006864] rcu:     Max phase no-delay instances is 1000.
    [    0.007320] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
    [    0.008854] smp: Bringing up secondary CPUs ...
    [    0.010035] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
    [    0.010218] CPU1: Spectre v2: using BPIALL workaround
    [    0.011412] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
    [    0.011581] CPU2: Spectre v2: using BPIALL workaround
    [    0.012747] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
    [    0.012917] CPU3: Spectre v2: using BPIALL workaround
    [    0.013109] smp: Brought up 1 node, 4 CPUs
    ...


