Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9834C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 08:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QrxEjwqpbzd9YHUFwZcgLOQVdCRhAoAh0surNbaoKs=; b=DltmViSF2QJSs/Z/vx7OpX/ahE
	33U6+qk7jr4ivI3GelRPMCT1vC2pfqACrMYnFp+v8jpFj8uMlC3N12+R8hMMnZbSxPJwu72o+Vlmd
	SxVcRcIcqxbacmqaHJtmsYEGuwfsftVrs2KDfTJEkRzaXnsKe9zEnaVSEtwpgHfcTpfLI9xkBCyVd
	rjsb1qEuBP8M8ROZZYMIv7pj74AnqNsgz1QbKRCjW3ELDTgx9oEfdW98mj/xKIPVAGXogOSG08rfc
	cEc9q6dd8NrQokt5XDJ786Op7m8Po+DgYRsg+B1RDySump9VYdvLuO6M7bwTlV5ACKZyLBkfAY+rd
	R1vByvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1PW-00000000Irr-2LCY;
	Thu, 22 May 2025 08:36:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI10d-00000000F7r-3mer;
	Thu, 22 May 2025 08:10:37 +0000
X-UUID: 3993923e36e411f0bed96b30c12bc3d6-20250522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6QrxEjwqpbzd9YHUFwZcgLOQVdCRhAoAh0surNbaoKs=;
	b=O1otPbzj77x5d7WmZeSCAToKNTebBrX+AfUZ7iuBwW1d4uedZI65TrAR95tIjFmv0TBSq9My7UUvECN4ubZFoAtcXROiukW2RD6h+/HJV/+EUai1HVElArdZmKopfBbJE1wQkXowURcA+cLNUKzWZrR/CggveAHUu8HZxxA4tgI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:802da52f-1ba4-4b65-ab56-471a693ad541,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:63bc9a47-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3993923e36e411f0bed96b30c12bc3d6-20250522
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 114724845; Thu, 22 May 2025 01:10:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 22 May 2025 16:10:26 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Thu, 22 May 2025 16:10:26 +0800
Message-ID: <a94b05d7fa647d1b358d28c604f87c03673f417c.camel@mediatek.com>
Subject: Re: [PATCH 1/1] [Bug] list_add corruption during CPU hotplug stress
 test
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Date: Thu, 22 May 2025 16:10:26 +0800
In-Reply-To: <20250521064238.3173224-1-kuyo.chang@mediatek.com>
References: <20250521064238.3173224-1-kuyo.chang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_011035_966179_485E37C2 
X-CRM114-Status: GOOD (  33.68  )
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

On Wed, 2025-05-21 at 14:42 +0800, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
>=20
> The commit (stop_machine, sched: Fix migrate_swap() vs.
> active_balance() deadlock)
> introduces wake_q_add rather than wake_up_process.
> However, it encounters sporadic failures during CPU hotplug stress
> test.
>=20
> The kernel log shows list add fail as below
> kmemleak: list_add corruption. prev->next should be next
> (ffffff82812c7a00), but was 0000000000000000.
> (prev=3Dffffff82812c3208).
> kmemleak: kernel BUG at lib/list_debug.c:34!
> kmemleak: Call trace:
> kmemleak:=C2=A0 __list_add_valid_or_report+0x11c/0x144
> kmemleak:=C2=A0 cpu_stop_queue_work+0x440/0x474
> kmemleak:=C2=A0 stop_one_cpu_nowait_rec+0xe4/0x138
> kmemleak:=C2=A0 balance_push+0x1f4/0x3e4
> kmemleak:=C2=A0 __schedule+0x1adc/0x23bc
> kmemleak:=C2=A0 preempt_schedule_common+0x68/0xd0
> kmemleak:=C2=A0 preempt_schedule+0x60/0x80
> kmemleak:=C2=A0 _raw_spin_unlock_irqrestore+0x9c/0xa0
> kmemleak:=C2=A0 scan_gray_list+0x220/0x3e4
> kmemleak:=C2=A0 kmemleak_scan+0x410/0x740
> kmemleak:=C2=A0 kmemleak_scan_thread+0xb0/0xdc
> kmemleak:=C2=A0 kthread+0x2bc/0x494
> kmemleak:=C2=A0 ret_from_fork+0x10/0x20
>=20
> Because the reproduction rate is very low, I designed a simple debug
> patch to help find the root cause of these sporadic failures.
> The purpose of this debug patch is to record the status of push_work
> at balance_push, cpu_stopper, and cpu_stop_work.
> In the regular case, we queue the push_work to stopper->works and set
> work->exec_state =3D WORK_QUEUE.
> Then, we call wake_q_add for the stopper and set
> cpu_stopper.stopper_wakeq =3D WAKEQ_ADD_OK.
> Finally, we wake up the stopper, which picks up the work from
> cpu_stop_work to execute.
> We then set stopper->exec_state =3D WORK_PREP_EXEC to indicate that the
> push_work has been consumed.
>=20
> However, in the failure case, by memory dump
> cpu_stopper.stopper_wakeq =3D WAKEQ_ADD_FAIL
> stopper->exec_state =3D WORK_QUEUE.
> cpu_stopper.enabled =3D TRUE
>=20
> Here is the failure sequence that leads to the bug.
> CPU0
> 1st balance_push
> stop_one_cpu_nowait
> cpu_stop_queue_work
> __cpu_stop_queue_work
> list_add_tail=C2=A0 -> fist add work
> wake_q_add=C2=A0=C2=A0 -> returns failure
> wake_up_q(&wakeq); -> it doesn't wake up the stopper.
> 2nd balance_push
> stop_one_cpu_nowait
> cpu_stop_queue_work
> __cpu_stop_queue_work
> list_add_tail=C2=A0 -> A double list add is detected, which triggers
> kernel bugs.
>=20
> Should we add queue status tracking in __cpu_stop_queue_work,
> or is there a better place to do this?
>=20
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> ---
> =C2=A0include/linux/sched/wake_q.h |=C2=A0 1 +
> =C2=A0include/linux/stop_machine.h | 20 ++++++++++++++++++++
> =C2=A0kernel/sched/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 15 ++++++++++++++-
> =C2=A0kernel/stop_machine.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3=
6
> ++++++++++++++++++++++++++++++++++--
> =C2=A04 files changed, 69 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/linux/sched/wake_q.h
> b/include/linux/sched/wake_q.h
> index 0f28b4623ad4..083ced4bb5dc 100644
> --- a/include/linux/sched/wake_q.h
> +++ b/include/linux/sched/wake_q.h
> @@ -60,6 +60,7 @@ static inline bool wake_q_empty(struct wake_q_head
> *head)
> =C2=A0}
> =C2=A0
> =C2=A0extern void wake_q_add(struct wake_q_head *head, struct task_struct
> *task);
> +extern bool wake_q_add_ret(struct wake_q_head *head, struct
> task_struct *task);
> =C2=A0extern void wake_q_add_safe(struct wake_q_head *head, struct
> task_struct *task);
> =C2=A0extern void wake_up_q(struct wake_q_head *head);
> =C2=A0
> diff --git a/include/linux/stop_machine.h
> b/include/linux/stop_machine.h
> index 3132262a404d..6daec44dcb99 100644
> --- a/include/linux/stop_machine.h
> +++ b/include/linux/stop_machine.h
> @@ -21,18 +21,38 @@ typedef int (*cpu_stop_fn_t)(void *arg);
> =C2=A0
> =C2=A0#ifdef CONFIG_SMP
> =C2=A0
> +enum work_state {
> +	WORK_INIT =3D 0,
> +	WORK_READY,
> +	WORK_QUEUE,
> +	WORK_PREP_EXEC,
> +};
> +
> +enum stopper_wakeq_state {
> +	WAKEQ_ADD_FAIL =3D 0,
> +	WAKEQ_ADD_OK,
> +};
> +
> +enum work_rec {
> +	WORK_NO_REC =3D 0,
> +	WORK_REC,
> +};
> =C2=A0struct cpu_stop_work {
> =C2=A0	struct list_head	list;		/* cpu_stopper-
> >works */
> =C2=A0	cpu_stop_fn_t		fn;
> =C2=A0	unsigned long		caller;
> =C2=A0	void			*arg;
> =C2=A0	struct cpu_stop_done	*done;
> +	enum work_rec		rec;
> +	enum work_state exec_state;
> =C2=A0};
> =C2=A0
> =C2=A0int stop_one_cpu(unsigned int cpu, cpu_stop_fn_t fn, void *arg);
> =C2=A0int stop_two_cpus(unsigned int cpu1, unsigned int cpu2,
> cpu_stop_fn_t fn, void *arg);
> =C2=A0bool stop_one_cpu_nowait(unsigned int cpu, cpu_stop_fn_t fn, void
> *arg,
> =C2=A0			 struct cpu_stop_work *work_buf);
> +bool stop_one_cpu_nowait_rec(unsigned int cpu, cpu_stop_fn_t fn,
> void *arg,
> +			struct cpu_stop_work *work_buf);
> =C2=A0void stop_machine_park(int cpu);
> =C2=A0void stop_machine_unpark(int cpu);
> =C2=A0void stop_machine_yield(const struct cpumask *cpumask);
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index c81cf642dba0..a617f51d3e5a 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1037,6 +1037,19 @@ void wake_q_add(struct wake_q_head *head,
> struct task_struct *task)
> =C2=A0		get_task_struct(task);
> =C2=A0}
> =C2=A0
> +/**
> + * wake_q_add_ret() - queue a wakeup for 'later' waking. record
> status.
> + */
> +bool wake_q_add_ret(struct wake_q_head *head, struct task_struct
> *task)
> +{
> +	bool ret =3D false;
> +
> +	ret =3D __wake_q_add(head, task);
> +	if (ret)
> +		get_task_struct(task);
> +	return ret;
> +}
> +
> =C2=A0/**
> =C2=A0 * wake_q_add_safe() - safely queue a wakeup for 'later' waking.
> =C2=A0 * @head: the wake_q_head to add @task to
> @@ -8100,7 +8113,7 @@ static void balance_push(struct rq *rq)
> =C2=A0	 */
> =C2=A0	preempt_disable();
> =C2=A0	raw_spin_rq_unlock(rq);
> -	stop_one_cpu_nowait(rq->cpu, __balance_push_cpu_stop,
> push_task,
> +	stop_one_cpu_nowait_rec(rq->cpu, __balance_push_cpu_stop,
> push_task,
> =C2=A0			=C2=A0=C2=A0=C2=A0 this_cpu_ptr(&push_work));
> =C2=A0	preempt_enable();
> =C2=A0	/*
> diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
> index 5d2d0562115b..3a2c48ed2182 100644
> --- a/kernel/stop_machine.c
> +++ b/kernel/stop_machine.c
> @@ -42,6 +42,8 @@ struct cpu_stopper {
> =C2=A0	struct list_head	works;		/* list of pending
> works */
> =C2=A0
> =C2=A0	struct cpu_stop_work	stop_work;	/* for stop_cpus */
> +	enum stopper_wakeq_state stopper_wakeq;		/*
> for stopper wakeup */
> +	enum work_state exec_state;			/* for
> stopper exec state */
> =C2=A0	unsigned long		caller;
> =C2=A0	cpu_stop_fn_t		fn;
> =C2=A0};
> @@ -85,8 +87,18 @@ static void __cpu_stop_queue_work(struct
> cpu_stopper *stopper,
> =C2=A0					struct cpu_stop_work *work,
> =C2=A0					struct wake_q_head *wakeq)
> =C2=A0{
> +	bool wake_flag;
> +
> =C2=A0	list_add_tail(&work->list, &stopper->works);
> -	wake_q_add(wakeq, stopper->thread);
> +	wake_flag =3D wake_q_add_ret(wakeq, stopper->thread);
> +	if (work->rec =3D=3D WORK_REC) {
> +		work->exec_state =3D WORK_QUEUE;
> +		stopper->exec_state =3D WORK_QUEUE;
> +		if (wake_flag)
> +			stopper->stopper_wakeq =3D WAKEQ_ADD_OK;
> +		else
> +			stopper->stopper_wakeq =3D WAKEQ_ADD_FAIL;
> +	}
> =C2=A0}
> =C2=A0
> =C2=A0/* queue @work to @stopper.=C2=A0 if offline, @work is completed
> immediately */
> @@ -141,6 +153,8 @@ int stop_one_cpu(unsigned int cpu, cpu_stop_fn_t
> fn, void *arg)
> =C2=A0	struct cpu_stop_done done;
> =C2=A0	struct cpu_stop_work work =3D { .fn =3D fn, .arg =3D arg, .done =
=3D
> &done, .caller =3D _RET_IP_ };
> =C2=A0
> +	work.rec =3D WORK_NO_REC;
> +	work.exec_state =3D WORK_INIT;
> =C2=A0	cpu_stop_init_done(&done, 1);
> =C2=A0	if (!cpu_stop_queue_work(cpu, &work))
> =C2=A0		return -ENOENT;
> @@ -350,6 +364,8 @@ int stop_two_cpus(unsigned int cpu1, unsigned int
> cpu2, cpu_stop_fn_t fn, void *
> =C2=A0		.arg =3D &msdata,
> =C2=A0		.done =3D &done,
> =C2=A0		.caller =3D _RET_IP_,
> +		.rec =3D WORK_NO_REC,
> +		.exec_state =3D WORK_INIT,
> =C2=A0	};
> =C2=A0
> =C2=A0	cpu_stop_init_done(&done, 2);
> @@ -386,6 +402,17 @@ bool stop_one_cpu_nowait(unsigned int cpu,
> cpu_stop_fn_t fn, void *arg,
> =C2=A0			struct cpu_stop_work *work_buf)
> =C2=A0{
> =C2=A0	*work_buf =3D (struct cpu_stop_work){ .fn =3D fn, .arg =3D arg,
> .caller =3D _RET_IP_, };
> +	work_buf->rec =3D WORK_NO_REC;
> +	work_buf->exec_state =3D WORK_INIT;
> +	return cpu_stop_queue_work(cpu, work_buf);
> +}
> +
> +bool stop_one_cpu_nowait_rec(unsigned int cpu, cpu_stop_fn_t fn,
> void *arg,
> +			struct cpu_stop_work *work_buf)
> +{
> +	*work_buf =3D (struct cpu_stop_work){ .fn =3D fn, .arg =3D arg,
> .caller =3D _RET_IP_, };
> +	work_buf->rec =3D WORK_REC;
> +	work_buf->exec_state =3D WORK_READY;
> =C2=A0	return cpu_stop_queue_work(cpu, work_buf);
> =C2=A0}
> =C2=A0
> @@ -411,6 +438,8 @@ static bool queue_stop_cpus_work(const struct
> cpumask *cpumask,
> =C2=A0		work->arg =3D arg;
> =C2=A0		work->done =3D done;
> =C2=A0		work->caller =3D _RET_IP_;
> +		work->rec =3D WORK_NO_REC;
> +		work->exec_state =3D WORK_INIT;
> =C2=A0		if (cpu_stop_queue_work(cpu, work))
> =C2=A0			queued =3D true;
> =C2=A0	}
> @@ -496,6 +525,8 @@ static void cpu_stopper_thread(unsigned int cpu)
> =C2=A0		work =3D list_first_entry(&stopper->works,
> =C2=A0					struct cpu_stop_work, list);
> =C2=A0		list_del_init(&work->list);
> +		if (work->rec =3D=3D WORK_REC)
> +			stopper->exec_state =3D WORK_PREP_EXEC;
> =C2=A0	}
> =C2=A0	raw_spin_unlock_irq(&stopper->lock);
> =C2=A0
> @@ -572,7 +603,8 @@ static int __init cpu_stop_init(void)
> =C2=A0
> =C2=A0	for_each_possible_cpu(cpu) {
> =C2=A0		struct cpu_stopper *stopper =3D &per_cpu(cpu_stopper,
> cpu);
> -
> +		stopper->exec_state =3D WORK_INIT;
> +		stopper->stopper_wakeq =3D WAKEQ_ADD_OK;
> =C2=A0		raw_spin_lock_init(&stopper->lock);
> =C2=A0		INIT_LIST_HEAD(&stopper->works);
> =C2=A0	}


The test kernel version is 6.12.22

And add the timeslot log for this issue.
[   99407090000] kmemleak: list_add corruption. prev->next should be
next (ffffff82812c7a00), but was 0000000000000000.
(prev=3Dffffff82812c3208).
[   99408874000] kmemleak: ------------[ cut here ]------------
[   99409727000] kmemleak: kernel BUG at lib/list_debug.c:34!
[   99410555000] kmemleak: Internal error: Oops - BUG: 00000000f2000800
[#1] PREEMPT SMP

I dumped the stop task's sched_info as below.
on_cpu =3D 0x0,
on_rq =3D 0x1,
sched_info =3D (
        pcount =3D 0x0B7D,
        run_delay =3D 0x08248680,
        last_arrival =3D 0x0000001724054D00,
        last_queued =3D 0x0000001725208400),
}

The last_queued time (0x0000001725208400 =3D 99,407,135,744 ns) indicates
when the stopper was enqueued (wake_up_q->wake_up_process->ttwu),=20
which occurred just after the list_add corruption (99,407,090,000 ns).
Therefore, let me correct my previous description: the wake_q_add
stopper is fine, but the subsequent latency wakeup stopper causes this
issue.




