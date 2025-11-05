Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6241CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KbRHAHejMA0mQr62kCLvQXM3weLqVxFVwaY0UNw5iaU=; b=tkg85r9Gf3AV4QNrTxofcTxPe7
	NnpiHW0IV4gsyOHZCAhvY9VfwPw7nlWbDRdcoH7oBI9Ru2bXwX1qB6tOAJeYSmdTdgOEtnoAYKpjL
	4ET9RtxKR4KaNzOP1zSISYWyOoOkWBn1JpEKMuFbgrhqAK+ZmYLrQH6GBOC5SKl/q5S/UtPoD2AzY
	q82p9bwIPEz5q8MRv+4yCWKIubqQ8a2T/ZBpRuDY0pi7jTSzjDuOcBat7fQe1hUzGUZ6sWI7MJZy+
	NKL3UA/Ibg0sAC7O3cCTOPUYxgy6mo/OcFmwfIyMOIMtkwm10xHeAoG10foEuT+QqJYAAJ+WxV4f7
	ZmGBLugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkfn-0000000EPfb-0TgZ;
	Wed, 05 Nov 2025 21:04:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkfk-0000000EPf3-30Pd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 21:04:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF5DE401B3;
	Wed,  5 Nov 2025 21:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21204C4CEF5;
	Wed,  5 Nov 2025 21:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762376642;
	bh=3lbd/EU2NQ8mLBwmqz/2m2jc7qv0uF70cLO4qQ/HcLI=;
	h=From:To:Cc:Subject:Date:From;
	b=dtbAR/JOu+tct/pxmTcYqviFrVXO6KQL6RNEt8EvVv6P33xPHb9dgHSk9ViufUw5h
	 kJ1uxg96GLeI8292NUvdAXLPsvexKzZTOvz/gqFR4B6Tf9OaddzbqXg2yQcuwzn5ku
	 NZ8Sz2aQ7UWT3Uo0jQ1QoNPnzhRVhti/SyAe56tyLNPuuhK+nf+q1QjFVpUI4PCL/l
	 xdV1u0DRnHSkyp4q84sPX72DQOu3N6R+ft0MWsYIMWFXcaMrhmv46DFunA41fPSuim
	 VgLUQjfA+k0lz49d9bWIB9ytxdlmtWzuFUN4GpAWzvETdfY0TBnWeKp8qSygESbq3Z
	 Ohs2vu0HGP3Lw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Eric Dumazet <edumazet@google.com>,
	Will Deacon <will@kernel.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Phil Auld <pauld@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Ingo Molnar <mingo@redhat.com>,
	cgroups@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	linux-mm@kvack.org,
	Michal Hocko <mhocko@suse.com>,
	linux-pci@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	linux-block@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Tejun Heo <tj@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	netdev@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH 00/31 v4] cpuset/isolation: Honour kthreads preferred affinity
Date: Wed,  5 Nov 2025 22:03:16 +0100
Message-ID: <20251105210348.35256-1-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_130404_826217_ED6236A0 
X-CRM114-Status: GOOD (  14.65  )
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

Hi,

The kthread code was enhanced lately to provide an infrastructure which
manages the preferred affinity of unbound kthreads (node or custom
cpumask) against housekeeping constraints and CPU hotplug events.

One crucial missing piece is cpuset: when an isolated partition is
created, deleted, or its CPUs updated, all the unbound kthreads in the
top cpuset are affine to _all_ the non-isolated CPUs, possibly breaking
their preferred affinity along the way

Solve this with performing the kthreads affinity update from cpuset to
the kthreads consolidated relevant code instead so that preferred
affinities are honoured.

The dispatch of the new cpumasks to workqueues and kthreads is performed
by housekeeping, as per the nice Tejun's suggestion.

As a welcome side effect, HK_TYPE_DOMAIN then integrates both the set
from isolcpus= and cpuset isolated partitions. Housekeeping cpumasks are
now modifyable with specific synchronization. A big step toward making
nohz_full= also mutable through cpuset in the future.

Changes since v3:

- Spelling issues all over the place (Bjorn Helgaas, Simon Horman

- Comment each HK_TYPE_* (Valentin Schneider)

- Keep static branch in housekeeping_test_cpu() (Waiman Long)

- Use rcu_dereference_all_check() to also check preemption disabled
  (Chen Ridong)

- Use cpumask_size() for allocation (Waiman Long)

- Fix inverted branch on update (Phil Auld)

- Set WQ_PERCPU to memcg workqueue (Waiman Long)

- Remove linux/cpuset.h include from include/linux/sched/isolation.h
  (Waiman Long)

- Comment why unbound kthreads aren't updated on CPU online (Waiman Long)

- Remove genirq related patches (handled in another patch after discussion
  with Thomas Gleixner)

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
	kthread/core-v4

HEAD: 9ba457a61e09fb17a4698879367b7e6593c256d2

Thanks,
	Frederic
---

Frederic Weisbecker (30):
      PCI: Prepare to protect against concurrent isolated cpuset change
      cpu: Revert "cpu/hotplug: Prevent self deadlock on CPU hot-unplug"
      memcg: Prepare to protect against concurrent isolated cpuset change
      mm: vmstat: Prepare to protect against concurrent isolated cpuset change
      sched/isolation: Save boot defined domain flags
      cpuset: Convert boot_hk_cpus to use HK_TYPE_DOMAIN_BOOT
      driver core: cpu: Convert /sys/devices/system/cpu/isolated to use HK_TYPE_DOMAIN_BOOT
      net: Keep ignoring isolated cpuset change
      block: Protect against concurrent isolated cpuset change
      cpu: Provide lockdep check for CPU hotplug lock write-held
      cpuset: Provide lockdep check for cpuset lock held
      sched/isolation: Convert housekeeping cpumasks to rcu pointers
      cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
      sched/isolation: Flush memcg workqueues on cpuset isolated partition change
      sched/isolation: Flush vmstat workqueues on cpuset isolated partition change
      PCI: Flush PCI probe workqueue on cpuset isolated partition change
      cpuset: Propagate cpuset isolation update to workqueue through housekeeping
      cpuset: Remove cpuset_cpu_is_isolated()
      sched/isolation: Remove HK_TYPE_TICK test from cpu_is_isolated()
      PCI: Remove superfluous HK_TYPE_WQ check
      kthread: Refine naming of affinity related fields
      kthread: Include unbound kthreads in the managed affinity list
      kthread: Include kthreadd to the managed affinity list
      kthread: Rely on HK_TYPE_DOMAIN for preferred affinity management
      sched: Switch the fallback task allowed cpumask to HK_TYPE_DOMAIN
      sched/arm64: Move fallback task cpumask to HK_TYPE_DOMAIN
      kthread: Honour kthreads preferred affinity after cpuset changes
      kthread: Comment on the purpose and placement of kthread_affine_node() call
      kthread: Document kthread_affine_preferred()
      doc: Add housekeeping documentation

Gabriele Monaco (1):
      cgroup/cpuset: Fail if isolated and nohz_full don't leave any housekeeping

 Documentation/cpu_isolation/housekeeping.rst | 111 +++++++++++++++++++
 arch/arm64/kernel/cpufeature.c               |  18 ++-
 block/blk-mq.c                               |   6 +-
 drivers/base/cpu.c                           |   2 +-
 drivers/pci/pci-driver.c                     |  71 ++++++++----
 include/linux/cpu.h                          |   4 +
 include/linux/cpuhplock.h                    |   1 +
 include/linux/cpuset.h                       |   8 +-
 include/linux/kthread.h                      |   1 +
 include/linux/memcontrol.h                   |   4 +
 include/linux/mmu_context.h                  |   2 +-
 include/linux/pci.h                          |   3 +
 include/linux/percpu-rwsem.h                 |   1 +
 include/linux/sched/isolation.h              |  16 ++-
 include/linux/vmstat.h                       |   2 +
 include/linux/workqueue.h                    |   2 +-
 init/Kconfig                                 |   1 +
 kernel/cgroup/cpuset.c                       | 134 +++++++++++++++-------
 kernel/cpu.c                                 |  42 +++----
 kernel/kthread.c                             | 160 ++++++++++++++++++---------
 kernel/sched/isolation.c                     | 138 ++++++++++++++++++-----
 kernel/sched/sched.h                         |   4 +
 kernel/workqueue.c                           |  17 +--
 mm/memcontrol.c                              |  25 ++++-
 mm/vmstat.c                                  |  15 ++-
 net/core/net-sysfs.c                         |   2 +-
 26 files changed, 596 insertions(+), 194 deletions(-)

