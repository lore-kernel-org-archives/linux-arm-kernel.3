Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDEAC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kAwF9jClabQzIuxaj1+4xpfC/p/oC4tVV/qWtx4GXR4=; b=jD5XINRdLt984/R4K4WJNiiPOy
	QNif4XLodrCyK7NAlFvm/BmOJgiUa/D8eulUdT3w+NdC0ztVNl/RU0oFxYEL0J74zCFZlvbYSdPIb
	BdANrghz28l5BhvgV4b9560ulAGnHqgLvur2WCX5BXP60Jb+RFZt2lcFfQLbhSPX/GFC+No5kod4T
	B2kzCxj0J2zY70k0yArhQLaRrtxDmyWDklWvzfhLa1Uh+0FQgdsw8oJdtWjk9ZJANGswkMdIFTcLB
	d90NjjHHvLE6l1eRo9YbTgmdfaAstlyf4i3zGevkTt1b8iTuKgJpUkH0p1CPT3xxxwunj9GGS3TEa
	qmdUE3vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPuv-0000000GC2e-0IAp;
	Mon, 24 Aug 2026 08:20:29 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPur-0000000GC1g-18hB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 08:20:27 +0000
X-UUID: a2907e689f9411f19a56ed5b684f684d-20260824
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:cf209aa0-85bd-4f75-b90c-774da2a6f19d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:a67a211e3732448e8bbd3abde272191d,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a2907e689f9411f19a56ed5b684f684d-20260824
X-User: fangqiurong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fangqiurong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 515309590; Mon, 24 Aug 2026 16:20:15 +0800
From: Qiurong Fang <fangqiurong@kylinos.cn>
To: linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	mingo@redhat.com
Cc: vincent.guittot@linaro.org,
	juri.lelli@redhat.com,
	rostedt@goodmis.org,
	mgorman@suse.de,
	dietmar.eggemann@arm.com,
	qais.yousef@arm.com,
	kprateek.nayak@amd.com,
	vschneid@redhat.com,
	zhangqiao22@huawei.com,
	linux-arm-kernel@lists.infradead.org
Subject: sched/fair: NULL deref in pick_next_task_fair (v4.19) -- tasks_timeline empty, nr_running == -1 (two production dumps)
Date: Mon, 24 Aug 2026 16:19:59 +0800
Message-Id: <20260824081959.725054-1-fangqiurong@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_012025_793870_8A918008 
X-CRM114-Status: GOOD (  10.47  )
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

We have encountered the same crash signature in two unrelated production
environments, each with a kdump-captured vmcore. Both crashes occurred
after long uptime (738 days / 290 days) and dereferenced NULL in
pick_next_task_fair(). The root cfs_rq state on the crashing CPU is
identical in both cases.


=== 1. Environment ===

Site A:
  - aarch64, HiSilicon Kunpeng 920 (HIP08), 96 CPUs(NUMA: 4 nodes, 24 CPUs/node), 382 GB
  - Kernel 4.19.90-23.43.v2101 (vendor distro kernel based on 4.19), GCC 7.3
  - Uptime 738 days;

Site B:
  - aarch64, HiSilicon Kunpeng 920 (HIP08), 128 CPUs(NUMA: 4 nodes, 32 CPUs/node), 1 TB
  - Kernel 4.19.90-89.17.v2401 (newer vendor build), GCC 7.3
  - Uptime 290 days


=== 2. Crash site ===

In both cases the NULL comes from the same place: the non-zero count
prevents the idle path, so pick_next_entity() takes rb_leftmost from
an empty tree and gets NULL.

  again:
      if (!cfs_rq->nr_running)    /* 0xFFFFFFFF != 0, no idle */
          goto idle;

--- Site A dmesg ---

[63777450.752746] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000160
[63777450.753146] Mem abort info:
[63777450.753299]   ESR = 0x96000005
...
[63777450.755251] Internal error: Oops: 96000005 [#1] SMP
[63777450.755489] Modules linked in: iptable_filter udp_diag raw_diag unix_diag af_packet_diag netlink_diag tcp_diag inet_diag bonding vfat fat ipmi_ssif aes_ce_blk crypto_simd cryptd aes_ce_cipher crct10dif_ce ghash_ce sha2_ce sha256_arm64 sha1_ce hns_roce_hw_v2 hns_roce ib_uverbs ses sbsa_gwdt ib_core enclosure ofpart cmdlinepart ipmi_si ipmi_devintf hi_sfc ipmi_msghandler mtd spi_dw_mmio sch_fq_codel binfmt_misc ip_tables realtek hinic hns3 hclge megaraid_sas hisi_sas_v3_hw hnae3 hisi_sas_main host_edma_drv
[63777450.757458] Process ksoftirqd/65 (pid: 339, stack limit = 0x000000001f6f62e2)
[63777450.764478] CPU: 65 PID: 339 Comm: ksoftirqd/65 Kdump: loaded Not tainted 4.19.90-23.43.v2101.ky10.aarch64 #1
[63777450.778683] Hardware name: Huawei TaiShan 200 (Model 2280)/BC82AMDDA, BIOS 1.38 07/04/2020
[63777450.793264] pstate: 60c00089 (nZCv daIf +PAN +UAO)
[63777450.800561] pc : pick_next_task_fair+0x88/0x640
[63777450.807710] lr : pick_next_task_fair+0x88/0x640
[63777450.814599] sp : ffffa037c3d7bd10
[63777450.821394] x29: ffffa037c3d7bd10 x28: ffff000048c5e248
...
[63777450.911587] x1 : 0000000000000000 x0 : 0000000000000000
[63777450.917053] Call trace:
[63777450.922275]  pick_next_task_fair+0x88/0x640
[63777450.927392]  __schedule+0x71c/0x958
[63777450.932458]  schedule+0x2c/0x88
[63777450.937190]  smpboot_thread_fn+0x1b4/0x1b8
[63777450.941813]  kthread+0x134/0x138
[63777450.946248]  ret_from_fork+0x10/0x18
[63777450.950520] Code: 54000221 aa1403e0 aa1303e1 97ffcf29 (f940b014)

Corresponding source (4.19 pick_next_task_fair):

      se = pick_next_entity(cfs_rq, curr);   /* returns NULL */
      cfs_rq = group_cfs_rq(se);             /* NULL->my_q, +0x160, crash */

--- Site B dmesg ---

[25097461.360687] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000040
[25097461.370128] Mem abort info:
[25097461.373601]   ESR = 0x96000005
...
[25097461.417991] Internal error: Oops: 96000005 [#1] SMP
[25097461.423539] Modules linked in: nfsd nfs_acl binfmt_misc rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace fscache bonding sunrpc ipmi_ssif vfat fat aes_ce_blk crypto_simd joydev cryptd aes_ce_cipher crct10dif_ce ofpart ghash_ce cmdlinepart ipmi_si sha1_ce ses sbsa_gwdt ky_lpcmux enclosure hi_sfc ipmi_devintf mtd ipmi_msghandler spi_dw_mmio sch_fq_codel ip_tables sha2_ce nvme hinic sha256_arm64 nvme_core nfit hisi_sas_v3_hw nvme_common ngbe megaraid_sas libnvdimm hisi_sas_main host_edma_drv dm_mirror dm_region_hash dm_log
[25097461.471273] Process T1004_LockWaitM (pid: 4090813, stack limit = 0x0000000096656505)
[25097461.479672] CPU: 92 PID: 4090813 Comm: T1004_LockWaitM Kdump: loaded Not tainted 4.19.90-89.17.v2401.ky10.aarch64 #1
[25097461.497852] Hardware name: PowerLeader PR210K/BC82AMDYA, BIOS 6.57 05/17/2023
[25097461.505644] pstate: 60400089 (nZCv daIf +PAN -UAO)
[25097461.511111] pc : set_next_entity+0x20/0x6f8
[25097461.515968] lr : pick_next_task_fair+0x2e8/0x548
[25097461.521255] sp : ffff8041a56d7c60
[25097461.525245] x29: ffff8041a56d7c60 x28: ffff8040a2593800
...
[25097461.549161] x21: 0000000000000000 x20: 0000000000000000
...
[25097461.608946] x1 : 0000000000000000 x0 : ffff561d3afdf1d8
[25097461.614926] Call trace:
[25097461.618054]  set_next_entity+0x20/0x6f8
[25097461.622563]  pick_next_task_fair+0x2e8/0x548
[25097461.627509]  __schedule+0x6e4/0x840
[25097461.631673]  schedule+0x30/0xe0
[25097461.635493]  do_nanosleep+0x78/0x168
[25097461.639747]  hrtimer_nanosleep+0x88/0x100
[25097461.644429]  sys_nanosleep+0x94/0xb8
[25097461.648680]  el0_svc_naked+0x44/0x48
[25097461.652931] Code: aa0103f4 aa0003f3 aa1e03e0 d503201f (b9404280)

Corresponding source (4.19 pick_next_task_fair, simple label):

      se = pick_next_entity(cfs_rq, NULL);   /* returns NULL */
      set_next_entity(cfs_rq, se);           /* se->on_rq, +0x40, crash */


=== 3. Root cfs_rq / rq state from vmcore ===

field                                          observed value
-------------------------------------------  --------------------
rq->nr_running                                0
rq->load.weight                                2^64 - 1048576
cfs_rq->nr_running                             0xFFFFFFFF (-1)
cfs_rq->h_nr_running                           0xFFFFFFFF (-1)
cfs_rq->load.weight                            0
tasks_timeline->rb_root.rb_node/rb_leftmost    NULL / NULL
rq->cfs_tasks list length                      0
rq->curr                                       task se (se->on_rq=0)

The two sites use hardware from different vendors and kernel builds
about a year apart. This issue has only been seen on Kunpeng 920 arm64
(kernel 4.19); it has not appeared on x86 (kernel 4.19). The corruption
affects three fields (cfs.nr -1, cfs.h_nr -1, rq.load -1048576, the
latter being exactly one nice-0 task weight NICE_0_LOAD).

--- Site A (cpu 65) ---

struct rq (cpu 65):
  .nr_running = (unsigned int)0
  .load.weight = (unsigned long)18446744073708503040
  .nr_switches = (u64)113264737287
  ...
  .curr->pid = (pid_t)339
  .curr->on_rq = (int)0
  .cfs_tasks len = 0

struct cfs_rq (root, cpu 65):
(struct cfs_rq){
	.load = (struct load_weight){
		.weight = (unsigned long)0,
		.inv_weight = (u32)0,
	},
	.runnable_weight = (unsigned long)0,
	.nr_running = (unsigned int)4294967295,
	.h_nr_running = (unsigned int)4294967295,
	.exec_clock = (u64)0,
	.min_vruntime = (u64)12868847681674577,
	.tasks_timeline = (struct rb_root_cached){
		.rb_root = (struct rb_root){
			.rb_node = (struct rb_node *)0x0,
		},
		.rb_leftmost = (struct rb_node *)0x0,
	},
	.curr = (struct sched_entity *)0xffffa037c3d83ec0,
	.next = (struct sched_entity *)0x0,
	.last = (struct sched_entity *)0x0,
	.skip = (struct sched_entity *)0x0,
	...
	.tg = (struct task_group *)root_task_group+0x0 = 0xffff000049a364c0,
	.runtime_enabled = (int)0,
	.throttled = (int)0,
	.throttle_count = (int)0,
	...
}

--- Site B (cpu 92) ---

struct rq (cpu 92):
  .nr_running = (unsigned int)0
  .load.weight = (unsigned long)18446744073708503040
  .nr_switches = (u64)77284029461
  ...
  .curr->pid = (pid_t)4090813
  .curr->on_rq = (int)0
  .cfs_tasks len = 0

struct cfs_rq (root, cpu 92):
(struct cfs_rq){
	.load = (struct load_weight){
		.weight = (unsigned long)0,
		.inv_weight = (u32)0,
	},
	.runnable_weight = (unsigned long)0,
	.nr_running = (unsigned int)4294967295,
	.h_nr_running = (unsigned int)4294967295,
	.exec_clock = (u64)0,
	.min_vruntime = (u64)1181660162701980,
	.tasks_timeline = (struct rb_root_cached){
		.rb_root = (struct rb_root){
			.rb_node = (struct rb_node *)0x0,
		},
		.rb_leftmost = (struct rb_node *)0x0,
	},
	.curr = (struct sched_entity *)0x0,
	.next = (struct sched_entity *)0x0,
	.last = (struct sched_entity *)0x0,
	.skip = (struct sched_entity *)0x0,
	...
	.tg = (struct task_group *)root_task_group+0x0 = 0xffff561d3d1b6100,
	.runtime_enabled = (int)0,
	.throttled = (int)0,
	.throttle_count = (int)0,
	.idle_h_nr_running = (unsigned int)0,
	...
}


=== 4. Code analysis ===

Verified against the kernel source tag: the sole writers of root
cfs_rq.nr_running, root cfs_rq.load and rq.load in the entire scheduler
are the following two functions. Both are called under rq->lock, so no
race condition is expected:

  account_entity_enqueue(struct cfs_rq *cfs_rq, struct sched_entity *se)
  {
  	update_load_add(&cfs_rq->load, se->load.weight);
  	if (!parent_entity(se))
  		update_load_add(&rq_of(cfs_rq)->load, se->load.weight);
  	... /* cfs_tasks list, numa accounting, irrelevant here */
  	cfs_rq->nr_running++;
  }

  account_entity_dequeue(struct cfs_rq *cfs_rq, struct sched_entity *se)
  {
  	update_load_sub(&cfs_rq->load, se->load.weight);
  	if (!parent_entity(se))
  		update_load_sub(&rq_of(cfs_rq)->load, se->load.weight);
  	...
  	cfs_rq->nr_running--;
  }

For the three fields visible on a given rq, each accounting call has one
of three effects, and (-1, 0, -w) is not in the reachable set:

  (a) root-level entity enqueue:  (cfs.nr +1, cfs.load +w, rq.load +w)
  (b) root-level entity dequeue:  (cfs.nr -1, cfs.load -w, rq.load -w)
  (c) non-root-level entity:       (0, 0, 0)

From source inspection, the sole writers of nr_running and load are
account_entity_enqueue / account_entity_dequeue,both called under
rq->lock protection, which makes the observed field state hard to
explain.

Has anyone seen a similar issue on arm64? Any debugging suggestions
would be appreciated.

The full panic dmesg for both crashes is posted above. Both crashes have
kdump-captured vmcores; any data from them (struct fields, disassembly,
etc.) can be queried on request and reported back.

--
Thanks

