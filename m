Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67E9D7237B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KHDLLePAqkz6NbXL8RNmHMi3VnthXTVysTGEVg0CEEE=; b=STn3gCvSjNnZXVcHT8AOgn/ffL
	8Qc0g3NAtdUf+qPOWfXeOqJCugBSp/7LMAVyfpI/KhyM2h1caIAymwjOXc6wy2mOwFN8i5pN46mRz
	qvyHqolkMtxRwsfz3R3JxBqqKCsLoCIPj4irfhWg3V6xtES7hBmqWpBoQsPt8Hvx1X1cD6qcLm1Qf
	p+cRPEbjZYwEb0o52fqlqLt2JcdQ0a/7PO7KJKsBTYHb3/doT4GOAwi/+Ksn5iMfI30tvAQzpqsuL
	KKks8rLlw8z4Z+2RwM8WLoXV6MHDMmkDNG7jyHNFyDP5fbW5UXCsVY10uaH1G8RtYmTBbzeGKjaUT
	Rf6z5+TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8rj-0000000Bayq-3flO;
	Sun, 25 Jan 2026 22:45:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8ri-0000000Bayk-0qoR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 22:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10E89600C3;
	Sun, 25 Jan 2026 22:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E9CC4CEF1;
	Sun, 25 Jan 2026 22:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769381152;
	bh=S9vFWXhyg0MkV+tLx10WmLW7gf6qdVccxzNBP8JiVGU=;
	h=From:To:Cc:Subject:Date:From;
	b=bqJjGl8d8RkkxkNvm/b5FIs/lRTASegJ/2eEoGWhYNy0srWYwoejNbrqxkPu2klYU
	 YVq84UWjZ3KVHkLb3wiIOu7FCgNo9VHkTwG0W5/o3u0kyD0fL7JbFhVEcrQng2LmLu
	 GVLMOXatTuZeWFep6DqNIoVnejZ4E/K2VMt5H8ZAnwsZqEtHinrP8j40M6aXuquMs/
	 N9lYLDQOFUPXs0x7iEoCWmgFUKARoa0cHptC3IKwrxOrHarVuA9cjNpuHWpvl5jM3u
	 NSMHi06NAeCcQIlPkr7hsC+VTZfuiOtGbaerDSPBNtMwoBS2MYvO7k1/vIxRHuoYi2
	 Y3KSPEiKGXnXA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	cgroups@vger.kernel.org,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Will Deacon <will@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Michal Koutny <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-pci@vger.kernel.org,
	linux-mm@kvack.org,
	Johannes Weiner <hannes@cmpxchg.org>,
	Chen Ridong <chenridong@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Muchun Song <muchun.song@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-arm-kernel@lists.infradead.org,
	Jens Axboe <axboe@kernel.dk>,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Phil Auld <pauld@redhat.com>,
	linux-block@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	netdev@vger.kernel.org
Subject: [PATCH 00/33 v7] cpuset/isolation: Honour kthreads preferred affinity
Date: Sun, 25 Jan 2026 23:45:07 +0100
Message-ID: <20260125224541.50226-1-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
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

Here is just a few changes sinces v6:

- More tags

- Fix raw access to __rcu pointer (Simon Horman, Waiman)

- Fix cpu_hotplug_lock deadlock and use correct static branch API
  (Chen Ridong)

- Fix a few changelogs that got the set rules between HK_TYPE_DOMAIN
  HL_TYPE_KERNEL_NOISE wrong.

- Simplify arm64 mismatched 32 bits support (Will Deacon)

If all goes well, my plan is to make the pull request myself for the
upcoming merge window.

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
	kthread/core-v7

HEAD: dcbe41f43e2cb32fbdbaf73b7745739e018b35dc

Thanks,
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

 Documentation/arch/arm64/asymmetric-32bit.rst |  12 +-
 Documentation/core-api/housekeeping.rst       | 111 ++++++++++++++++++
 Documentation/core-api/index.rst              |   1 +
 arch/arm64/kernel/cpufeature.c                |   6 +-
 block/blk-mq.c                                |   6 +-
 drivers/base/cpu.c                            |   2 +-
 drivers/pci/pci-driver.c                      |  71 +++++++++---
 include/linux/cpuhplock.h                     |   1 +
 include/linux/cpuset.h                        |   8 +-
 include/linux/kthread.h                       |   1 +
 include/linux/memcontrol.h                    |   4 +
 include/linux/mmu_context.h                   |   2 +-
 include/linux/pci.h                           |   3 +
 include/linux/percpu-rwsem.h                  |   1 +
 include/linux/sched/isolation.h               |  16 ++-
 include/linux/vmstat.h                        |   2 +
 include/linux/workqueue.h                     |   2 +-
 init/Kconfig                                  |   1 +
 kernel/cgroup/cpuset.c                        |  53 +++------
 kernel/cpu.c                                  |  42 +++----
 kernel/kthread.c                              | 160 +++++++++++++++++---------
 kernel/sched/isolation.c                      | 145 ++++++++++++++++++-----
 kernel/sched/sched.h                          |   4 +
 kernel/time/timer_migration.c                 |  25 ++--
 kernel/workqueue.c                            |  17 +--
 mm/memcontrol.c                               |  31 ++++-
 mm/vmstat.c                                   |  15 ++-
 net/core/net-sysfs.c                          |   2 +-
 28 files changed, 538 insertions(+), 206 deletions(-)

