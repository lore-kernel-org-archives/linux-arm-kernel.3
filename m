Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FCFE75453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 13:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iq1+jwMZ9tlCi0hkNsGw1dAsvEQiAfO+JMYot7TdvGo=; b=ibmtZDKwgGsQHHWr4JL6cwEr4a
	7gev6q0Lf5cnXf5igfS+mu7ylJZ8kOth6SROmrVs9xfA6BK0GNfuTT4A6BexhU8T1HsFmOuPr1N+O
	YBxj9s+QJ1sVRcgN5Bs//43BahlAafneDlYRUzJWrBrBZVvOvz/X+Fl9NEsW4f1QQITH+16U+Zirb
	B4MoOJKU2v4sTwcWj6+8BMQ3vB9p2LQL/iZ8E6gv4tOLgTp3P+no5URtl54sOoj4Vz8LyPp2zFpXe
	BWs1GjnSKeqIGDxzfiJ4kWx+KzhJQ3YvIOj1SZchO+ZEy//MHes/84CL1Q8f9wtFQy8AtvH5ktv8e
	lrfh0RaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPBI-0000000Grle-0Ff2;
	Wed, 24 Dec 2025 13:45:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPBF-0000000Grkz-2cuQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 13:45:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BE2F4193F;
	Wed, 24 Dec 2025 13:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CBCC4CEFB;
	Wed, 24 Dec 2025 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766583932;
	bh=tK3Yaoy6unJ5tHzgM+8i6RExHWgxXGyyr5alAshg1RU=;
	h=From:To:Cc:Subject:Date:From;
	b=uVp068q6+NoKI3AKxIIX51WZN2Jzi9fLoN+QB2SdXLQh+BvI82O1SnOAi1wUKysT8
	 2Gx+3lcLrUemOtTJfD8eE18TmmMX6fiZpABw/ahwtYlpSgDTztcpI3oTtMB4pAiqNN
	 m9kPVJBaJKsTFZhIULeXcmgaJ3C6o961eLzaKyONSEN2pM707fPKDmk4q+psrAQ1w4
	 VZ5iQe3+kpmbe/0RT5cv6YrpbsRyyUv24PXxW7FHAa1lgeGs0QXk5XeA4+7uk5NxWG
	 sViGJtbTDgVkVGUDDjT0nXcwqYbxz/XbwOshBOTOQxUIawvq7Ufnn7f1TTgRtyVqPN
	 5Z2zHqnJrj31w==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Chen Ridong <chenridong@huawei.com>,
	Michal Koutny <mkoutny@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Hocko <mhocko@suse.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Phil Auld <pauld@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-mm@kvack.org,
	Jens Axboe <axboe@kernel.dk>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>,
	cgroups@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH 00/33 v5] cpuset/isolation: Honour kthreads preferred affinity
Date: Wed, 24 Dec 2025 14:44:47 +0100
Message-ID: <20251224134520.33231-1-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_054533_707028_63C86719 
X-CRM114-Status: GOOD (  13.91  )
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

Changes since v4:

* Add more tags

* Rebase on v6.19-rc2 with latest cpuset changes

* Accomodate timers migration isolation

* Rename housekeeping_update() parameter from mask to isol_mask (Chen Ridong)

* Link housekeeping documentation to core-api

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
	kthread/core-v5

HEAD: 3c0ee047f05f361f215521424f5e789dfffcafc1

Merry Christmas,
	Frederic
---

Frederic Weisbecker (33):
      PCI: Prepare to protect against concurrent isolated cpuset change
      cpu: Revert "cpu/hotplug: Prevent self deadlock on CPU hot-unplug"
      memcg: Prepare to protect against concurrent isolated cpuset change
      mm: vmstat: Prepare to protect against concurrent isolated cpuset change
      sched/isolation: Save boot defined domain flags
      cpuset: Convert boot_hk_cpus to use HK_TYPE_DOMAIN_BOOT
      driver core: cpu: Convert /sys/devices/system/cpu/isolated to use HK_TYPE_DOMAIN_BOOT
      net: Keep ignoring isolated cpuset change
      block: Protect against concurrent isolated cpuset change
      timers/migration: Prevent from lockdep false positive warning
      cpu: Provide lockdep check for CPU hotplug lock write-held
      cpuset: Provide lockdep check for cpuset lock held
      sched/isolation: Convert housekeeping cpumasks to rcu pointers
      cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
      sched/isolation: Flush memcg workqueues on cpuset isolated partition change
      sched/isolation: Flush vmstat workqueues on cpuset isolated partition change
      PCI: Flush PCI probe workqueue on cpuset isolated partition change
      cpuset: Propagate cpuset isolation update to workqueue through housekeeping
      cpuset: Propagate cpuset isolation update to timers through housekeeping
      timers/migration: Remove superfluous cpuset isolation test
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

 Documentation/core-api/housekeeping.rst | 111 ++++++++++++++++++++++
 Documentation/core-api/index.rst        |   1 +
 arch/arm64/kernel/cpufeature.c          |  18 +++-
 block/blk-mq.c                          |   6 +-
 drivers/base/cpu.c                      |   2 +-
 drivers/pci/pci-driver.c                |  71 ++++++++++----
 include/linux/cpu.h                     |   4 +
 include/linux/cpuhplock.h               |   1 +
 include/linux/cpuset.h                  |   8 +-
 include/linux/kthread.h                 |   1 +
 include/linux/memcontrol.h              |   4 +
 include/linux/mmu_context.h             |   2 +-
 include/linux/pci.h                     |   3 +
 include/linux/percpu-rwsem.h            |   1 +
 include/linux/sched/isolation.h         |  16 +++-
 include/linux/vmstat.h                  |   2 +
 include/linux/workqueue.h               |   2 +-
 init/Kconfig                            |   1 +
 kernel/cgroup/cpuset.c                  |  68 +++++++-------
 kernel/cpu.c                            |  42 ++++-----
 kernel/kthread.c                        | 160 +++++++++++++++++++++-----------
 kernel/sched/isolation.c                | 144 +++++++++++++++++++++++-----
 kernel/sched/sched.h                    |   4 +
 kernel/time/timer_migration.c           |  25 +++--
 kernel/workqueue.c                      |  17 ++--
 mm/memcontrol.c                         |  25 ++++-
 mm/vmstat.c                             |  15 ++-
 net/core/net-sysfs.c                    |   2 +-
 28 files changed, 554 insertions(+), 202 deletions(-)

