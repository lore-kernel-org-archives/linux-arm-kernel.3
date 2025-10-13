Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C835DCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nDleYTDsTpmd/c215HAnx8R/DyyOeWflleynV7veSrk=; b=q5es1rFfn/KlumBY5fWyZmT8N7
	KMjJAEpQw1JrpaTYJt80Ooq+1Qxo3axPsQO0ve5fxzeab/3ZJNPIoQFOR7XT6jHI0vs+Zxs/jElGD
	gHMMFEPh1y/i7KrG/2Kicsas2tBYWwg996dibTDTjU8bBaEHdAzLULgVuymFY2NVQm8kaWuPOfru0
	HrLeMlT/N5xmw8xqbLU4D97g05WeUe0ayFBdsvNoGsEy4ROr0VYsq4FOzVeFUeCX2T/OlrYChsvHN
	glVw7eSZRS2K/KTPpEtqmeOMwiST9coJ5NBod1BKzIghciy+w194H0a/Pe97k1c2I+7ChWTnHszlo
	uP1CBqBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PD8-0000000EMl6-0tRT;
	Mon, 13 Oct 2025 20:32:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PD6-0000000EMky-42kR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:32:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F26D5602DC;
	Mon, 13 Oct 2025 20:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EEFC4CEE7;
	Mon, 13 Oct 2025 20:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760387518;
	bh=ysWVB1PH5yXaIm1/mguGEwYLxAYgw7ocXVK3fheEVQI=;
	h=From:To:Cc:Subject:Date:From;
	b=LBF2yNcUR6yjfrW50PCgHGc8AHAvBLQ9lrvJqA2WCQ37FrvKozfK4ptrCYuj1AVqK
	 z6xLAVCLuoIDZvrgr+0C+SCMd8qYe8A7C/Cf3X++Q67H89ylB379pqJbdfHeMTCE1N
	 KZf/I96mcxhrmHyctiuPatpj08zxohCD7+/aastyPBh1gSgRXhWXSZIaTY86mC93OK
	 KUAndnd+7NuK52jdhGUE2upP207tMgConuEtCVlypo9CFV2FAxTXtjRHDRb3FjhLQX
	 nDcM2xCjsiQV94+ABdYO/QPLEZKj8pdbSvjFzcU+/jqMNtaEDRurospUsKN1F/Xx3H
	 tw5a0zfkpfrcg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Danilo Krummrich <dakr@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	cgroups@vger.kernel.org,
	Michal Koutny <mkoutny@suse.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Phil Auld <pauld@redhat.com>,
	linux-pci@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Eric Dumazet <edumazet@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Will Deacon <will@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Michal Hocko <mhocko@suse.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-mm@kvack.org,
	Gabriele Monaco <gmonaco@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 00/33 v3] cpuset/isolation: Honour kthreads preferred affinity
Date: Mon, 13 Oct 2025 22:31:13 +0200
Message-ID: <20251013203146.10162-1-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
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

Changes since v2:

* Keep static key (peterz)

* Handle PCI work flush

* Comment why RCU is held until PCI work is queued (Waiman)

* Add new tags

* Add CONFIG_LOCKDEP ifdeffery (Waiman)

* Rename workqueue_unbound_exclude_cpumask() to workqueue_unbound_housekeeping_update()
  and invert the parameter (Waiman)
  
* Fix a few changelogs that used to mention that HK_TYPE_KERNEL_NOISE
  must depend on HK_TYPE_DOMAIN. It's strongly advised but not mandatory (Waiman)
  
* Cherry-pick latest version of "cgroup/cpuset: Fail if isolated and nohz_full don't leave any housekeeping"
  (Waiman and Gabriele)

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
	kthread/core-v3

HEAD: 4ba707cdced479592e9f461e1944b7fa6f75910f

Thanks,
	Frederic
---

Frederic Weisbecker (32):
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
      kthread: Add API to update preferred affinity on kthread runtime
      kthread: Document kthread_affine_preferred()
      genirq: Correctly handle preferred kthreads affinity
      doc: Add housekeeping documentation

Gabriele Monaco (1):
      cgroup/cpuset: Fail if isolated and nohz_full don't leave any housekeeping

 Documentation/cpu_isolation/housekeeping.rst | 111 +++++++++++++++
 arch/arm64/kernel/cpufeature.c               |  18 ++-
 block/blk-mq.c                               |   6 +-
 drivers/base/cpu.c                           |   2 +-
 drivers/pci/pci-driver.c                     |  71 +++++++---
 include/linux/cpu.h                          |   4 +
 include/linux/cpuhplock.h                    |   1 +
 include/linux/cpuset.h                       |   8 +-
 include/linux/kthread.h                      |   2 +
 include/linux/memcontrol.h                   |   4 +
 include/linux/mmu_context.h                  |   2 +-
 include/linux/pci.h                          |   3 +
 include/linux/percpu-rwsem.h                 |   1 +
 include/linux/sched/isolation.h              |   7 +-
 include/linux/vmstat.h                       |   2 +
 include/linux/workqueue.h                    |   2 +-
 init/Kconfig                                 |   1 +
 kernel/cgroup/cpuset.c                       | 134 +++++++++++++-----
 kernel/cpu.c                                 |  42 +++---
 kernel/irq/manage.c                          |  47 ++++---
 kernel/kthread.c                             | 195 +++++++++++++++++++--------
 kernel/sched/isolation.c                     | 137 +++++++++++++++----
 kernel/sched/sched.h                         |   4 +
 kernel/workqueue.c                           |  17 ++-
 mm/memcontrol.c                              |  25 +++-
 mm/vmstat.c                                  |  15 ++-
 net/core/net-sysfs.c                         |   2 +-
 27 files changed, 647 insertions(+), 216 deletions(-)

