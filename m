Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3A6CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucvmGdln0eqXccg+XKAlaJPI55ctMmMl9RgMkth7GwU=; b=IKnsHQX0EthC7DtCgp443atDZg
	ebpmNXyCvvARBhVSIMPqvzVGeZ2SX2+VZ4PA2umUu1N5h2YTtslU9eSD9g0oF7hNZKO0wOoAxSYfV
	Zil/w3t3fBB9PILI0xv9rdScrSQPrvM+BxOX/J+tJOqgzdh8vcafrYhwu1ltLscf7oNe9M4D4UAJJ
	Vbu+5vcb5PvycqvdbP0n5r46gYVDAu+U8sY1/gcjwIR7OkH/PSaGP8zu1LtuU+vFPYu79XJbEoVKf
	3HC0jv8Gk9TByP2lTjIsUajMn3JXbUAQYTKk09LgoiwkdU3oPelXYuoIym67HkaGA9NWolk8+PR3U
	rqB1UPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkfz-0000000EPj9-2vl9;
	Wed, 05 Nov 2025 21:04:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkfy-0000000EPio-3mo8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 21:04:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5397360220;
	Wed,  5 Nov 2025 21:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED49C19425;
	Wed,  5 Nov 2025 21:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762376658;
	bh=bjPVH71yYHRT38x+a2qhkcGYmz0Liwe3xJMHVBXj3C4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KDYIWONqcQ26ibQzAQkdgLQwpYLoizfgpJwRPDhmDxEYw8bbVT5NCfytM6LWq/UIk
	 d3X9McPNu5W7bwRl1V4OhMilC81nOdPW0GZNtyyKiVvnVvZwjU3V4eRlGb4PCDwa2w
	 oLLKKfw8RYLb9vZQfM9ezsSGTdJpcGLScxRA+EnGQR74nwdqy+MCCwX4jkhZ/5Hcyj
	 KRU9HMvlEYMMfEozwi7kZ2BnBbFbAgiVNuly1Yw+eyZFhmbmRTg4/XmokIJptUndAK
	 okt1ReWDWQxCFWQKpgouktVbzoKoG6YAN9jd11ycTU0odnnKgj2EXJdv1rMNICKGX4
	 CB4eyIRSu0e+Q==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>,
	cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 02/31] cpu: Revert "cpu/hotplug: Prevent self deadlock on CPU hot-unplug"
Date: Wed,  5 Nov 2025 22:03:18 +0100
Message-ID: <20251105210348.35256-3-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105210348.35256-1-frederic@kernel.org>
References: <20251105210348.35256-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

1) The commit:

	2b8272ff4a70 ("cpu/hotplug: Prevent self deadlock on CPU hot-unplug")

was added to fix an issue where the hotplug control task (BP) was
throttled between CPUHP_AP_IDLE_DEAD and CPUHP_HRTIMERS_PREPARE waiting
in the hrtimer blindspot for the bandwidth callback queued in the dead
CPU.

2) Later on, the commit:

	38685e2a0476 ("cpu/hotplug: Don't offline the last non-isolated CPU")

plugged on the target selection for the workqueue offloaded CPU down
process to prevent from destroying the last CPU domain.

3) Finally:

	5c0930ccaad5 ("hrtimers: Push pending hrtimers away from outgoing CPU earlier")

removed entirely the conditions for the race exposed and partially fixed
in 1). The offloading of the CPU down process to a workqueue on another
CPU then becomes unnecessary. But the last CPU belonging to scheduler
domains must still remain online.

Therefore revert the now obsolete commit
2b8272ff4a70b866106ae13c36be7ecbef5d5da2 and move the housekeeping check
under the cpu_hotplug_lock write held. Since HK_TYPE_DOMAIN will include
both isolcpus and cpuset isolated partition, the hotplug lock will
synchronize against concurrent cpuset partition updates.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index db9f6c539b28..453a806af2ee 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1410,6 +1410,16 @@ static int __ref _cpu_down(unsigned int cpu, int tasks_frozen,
 
 	cpus_write_lock();
 
+	/*
+	 * Keep at least one housekeeping cpu onlined to avoid generating
+	 * an empty sched_domain span.
+	 */
+	if (cpumask_any_and(cpu_online_mask,
+			    housekeeping_cpumask(HK_TYPE_DOMAIN)) >= nr_cpu_ids) {
+		ret = -EBUSY;
+		goto out;
+	}
+
 	cpuhp_tasks_frozen = tasks_frozen;
 
 	prev_state = cpuhp_set_state(cpu, st, target);
@@ -1456,22 +1466,8 @@ static int __ref _cpu_down(unsigned int cpu, int tasks_frozen,
 	return ret;
 }
 
-struct cpu_down_work {
-	unsigned int		cpu;
-	enum cpuhp_state	target;
-};
-
-static long __cpu_down_maps_locked(void *arg)
-{
-	struct cpu_down_work *work = arg;
-
-	return _cpu_down(work->cpu, 0, work->target);
-}
-
 static int cpu_down_maps_locked(unsigned int cpu, enum cpuhp_state target)
 {
-	struct cpu_down_work work = { .cpu = cpu, .target = target, };
-
 	/*
 	 * If the platform does not support hotplug, report it explicitly to
 	 * differentiate it from a transient offlining failure.
@@ -1480,18 +1476,7 @@ static int cpu_down_maps_locked(unsigned int cpu, enum cpuhp_state target)
 		return -EOPNOTSUPP;
 	if (cpu_hotplug_disabled)
 		return -EBUSY;
-
-	/*
-	 * Ensure that the control task does not run on the to be offlined
-	 * CPU to prevent a deadlock against cfs_b->period_timer.
-	 * Also keep at least one housekeeping cpu onlined to avoid generating
-	 * an empty sched_domain span.
-	 */
-	for_each_cpu_and(cpu, cpu_online_mask, housekeeping_cpumask(HK_TYPE_DOMAIN)) {
-		if (cpu != work.cpu)
-			return work_on_cpu(cpu, __cpu_down_maps_locked, &work);
-	}
-	return -EBUSY;
+	return _cpu_down(cpu, 0, target);
 }
 
 static int cpu_down(unsigned int cpu, enum cpuhp_state target)
-- 
2.51.0


