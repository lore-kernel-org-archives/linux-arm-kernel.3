Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C93C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 07:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x5kqMG56SWDQsrMynXSFFFcF3tBs6H1f9+/5qrqftM8=; b=W6YP1G8LNMQUspn9c1IWssJU8/
	ohlZdrVNSYkmk1XpJcPXYRJb5p4IcWb4PcBBhBh3JUaH2GJhb6FGASM7+REUVVPrJZpJpzfOpw/1y
	Njh/yjpYwihXtEjNKYHNcbOo5zGPXplYJfIttdq+36EA5yeyor7AtgR8EWJC1RTq48BhE9uNhiY79
	Jj25nnuASF7xsnwajtkZGSRx1Un/yN5JE0nSy1lLd/ByxogcZYH3/8vU2FMBSD4oPlEAT3USiW+ik
	5cyBDg5A1oI9o+SiDaOHEy8Om1rP4mvHoSry9A69U/CkgFJtpOIr1KyzbH7qHBS82MLCDxUsCY6Y6
	VW0G/mbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzY7-00000006uRV-2awx;
	Mon, 02 Jun 2025 07:25:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzVW-00000006u1z-307t;
	Mon, 02 Jun 2025 07:22:56 +0000
X-UUID: 6367b3dc3f8211f0bed96b30c12bc3d6-20250602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=x5kqMG56SWDQsrMynXSFFFcF3tBs6H1f9+/5qrqftM8=;
	b=Nqrnfaz6e9bWE2zQTT4lWua5+fcRLyF5E3DVxC2MMYyPTdgjPiV8MhyocbeH9udWoSgKgmbPlQy+qPzMbfxq2ZD1uTZtyyTlpdsRA1V8REAIznSoi2xol8tm8KZOfg9wDVHQc6tqNBf3SeWiCyVh0FTUVrvwC/p/QJaMJwmIxPc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:13a267ff-66a7-47ab-be24-65dd6fd692fe,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:e337fa47-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6367b3dc3f8211f0bed96b30c12bc3d6-20250602
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1646159747; Mon, 02 Jun 2025 00:22:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 2 Jun 2025 15:22:45 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 2 Jun 2025 15:22:45 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: kuyo chang <kuyo.chang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] sched/core: Fix migrate_swap() vs. hotplug
Date: Mon, 2 Jun 2025 15:22:13 +0800
Message-ID: <20250602072242.1839605-1-kuyo.chang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_002254_769407_F302EF07 
X-CRM114-Status: GOOD (  12.78  )
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

From: kuyo chang <kuyo.chang@mediatek.com>

It encounters sporadic failures during CPU hotplug stress test.

[Syndrome]
The kernel log shows list add fail as below.

kmemleak: list_add corruption.
prev->next should be next (ffffff82812c7a00),
but was 0000000000000000. (prev=ffffff82812c3208).

kmemleak: kernel BUG at lib/list_debug.c:34!
kmemleak: Call trace:
kmemleak:  __list_add_valid_or_report+0x11c/0x144
kmemleak:  cpu_stop_queue_work+0x440/0x474
kmemleak:  stop_one_cpu_nowait+0xe4/0x138
kmemleak:  balance_push+0x1f4/0x3e4
kmemleak:  __schedule+0x1adc/0x23bc
kmemleak:  preempt_schedule_common+0x68/0xd0
kmemleak:  preempt_schedule+0x60/0x80
kmemleak:  _raw_spin_unlock_irqrestore+0x9c/0xa0
kmemleak:  scan_gray_list+0x220/0x3e4
kmemleak:  kmemleak_scan+0x410/0x740
kmemleak:  kmemleak_scan_thread+0xb0/0xdc
kmemleak:  kthread+0x2bc/0x494
kmemleak:  ret_from_fork+0x10/0x20

[Analysis]
In the failure case, by memory dump, we find
cpu_stopper.enabled = TRUE
but the wakeq is empty(the migrate/1 is at another wakeq)
static bool cpu_stop_queue_work(...)
{
...
..
	enabled = stopper->enabled;
	if (enabled)
		__cpu_stop_queue_work(stopper, work, &wakeq);
...
...
	wake_up_q(&wakeq);  -> wakeq is empty !!
	preempt_enable();
	return enabled;
}

Through analysis of the CPU0 call trace and memory dump

   CPU0: migration/0, pid: 43, priority: 99
   Native callstack:
	vmlinux  __kern_my_cpu_offset()           <arch/arm64/include/asm/percpu.h:40>
	vmlinux  ct_state_inc(incby=8)            <include/linux/context_tracking.h:137>
	vmlinux  rcu_momentary_eqs() + 72         <kernel/rcu/tree.c:375>
	vmlinux  multi_cpu_stop() + 316           <kernel/stop_machine.c:278>
	vmlinux  cpu_stopper_thread() + 676       <kernel/stop_machine.c:563>
	vmlinux  smpboot_thread_fn(data=0) + 1188 <kernel/smpboot.c:164>
	vmlinux  kthread() + 696                  <kernel/kthread.c:389>
	vmlinux  0xFFFFFFC08005941C()             <arch/arm64/kernel/entry.S:845>

  (struct migration_swap_arg *)0xFFFFFFC08FF87A40 (
    src_task = 0xFFFFFF80FF519740 ,
    dst_task = 0xFFFFFF802A579740 ,
    src_cpu = 0x0,
    dst_cpu = 0x1)

  (struct multi_stop_data)*    0xFFFFFFC08FF87930 = (
    fn = 0xFFFFFFC0802657F4 = migrate_swap_stop,
    data = 0xFFFFFFC08FF87A40
    num_threads = 0x2,
    active_cpus = cpu_bit_bitmap[1] -> (
      bits = (0x2)),
    state = MULTI_STOP_PREPARE = 0x1,
    thread_ack = (
      counter = 0x1))

By cpu mask memory dump:
  ((const struct cpumask *)&__cpu_online_mask) (
    bits = (0xFF))
  ((const struct cpumask *)&__cpu_dying_mask)  (
    bits = (0x2))
  ((const struct cpumask *)&__cpu_active_mask)(
    bits = (0xFD))
  ((const struct cpumask *)&__cpu_possible_mask) (
    bits = (0xFF))
->Imply cpu1 is dying & non-active

So, the potential race scenario is:

	CPU0							CPU1
	// doing migrate_swap(cpu0/cpu1)
	stop_two_cpus()
							  ...
							 // doing _cpu_down()
							      sched_cpu_deactivate()
								set_cpu_active(cpu, false);
								balance_push_set(cpu, true);
	cpu_stop_queue_two_works
	    __cpu_stop_queue_work(stopper1,...);
	    __cpu_stop_queue_work(stopper2,..);
	stop_cpus_in_progress -> true
		preempt_enable();
								...
							1st balance_push
							stop_one_cpu_nowait
							cpu_stop_queue_work
							__cpu_stop_queue_work
							list_add_tail  -> 1st add push_work
							wake_up_q(&wakeq);  -> "wakeq is empty.
										This implies that the stopper is at wakeq@migrate_swap."
	preempt_disable
	wake_up_q(&wakeq);
	        wake_up_process // wakeup migrate/0
		    try_to_wake_up
		        ttwu_queue
		            ttwu_queue_cond ->meet below case
		                if (cpu == smp_processor_id())
			         return false;
			ttwu_do_activate
			//migrate/0 wakeup done
		wake_up_process // wakeup migrate/1
	           try_to_wake_up
		    ttwu_queue
			ttwu_queue_cond
		        ttwu_queue_wakelist
			__ttwu_queue_wakelist
			__smp_call_single_queue
	preempt_enable();

							2nd balance_push
							stop_one_cpu_nowait
							cpu_stop_queue_work
							__cpu_stop_queue_work
							list_add_tail  -> 2nd add push_work, so the double list add is detected
							...
							...
							cpu1 get ipi, do sched_ttwu_pending, wakeup migrate/1

[Solution]
Fix this race condition by adding cpus_read_lock/cpus_read_unlock around stop_two_cpus().
This ensures that no CPUs can come up or go down during this operation.

Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
---
 kernel/sched/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 62b3416f5e43..1b371575206f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3441,6 +3441,8 @@ int migrate_swap(struct task_struct *cur, struct task_struct *p,
 		.dst_cpu = target_cpu,
 	};
 
+	/* Make sure no CPUs can come up or down */
+	cpus_read_lock();
 	if (arg.src_cpu == arg.dst_cpu)
 		goto out;
 
@@ -3461,6 +3463,7 @@ int migrate_swap(struct task_struct *cur, struct task_struct *p,
 	ret = stop_two_cpus(arg.dst_cpu, arg.src_cpu, migrate_swap_stop, &arg);
 
 out:
+	cpus_read_unlock();
 	return ret;
 }
 #endif /* CONFIG_NUMA_BALANCING */
-- 
2.45.2


