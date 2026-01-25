Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5275DD7237B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMEZtpjkMJvKy0j2B2A5Z2PL6g1rPUGZICiE2R96ChU=; b=ZdJ5ZKG2lJltRXMnFoug+HKEjH
	iwEhIgBara9tsDAL5CiI67b5delLGiMESHR8tl0dgiJvMDTsLn+sQr77LUYm/6pDtA2i4xf7scz/m
	ypcC4cWLXMAbY+ZbI8PzEvHe12YXcOXrS3f64TV4piOU5qNfS2VNbr2aoDqyX9HC3McZaZmQY7sQL
	GXVCOvKwQz1UBUv6drJdTY06SR9rs/4Th3axNHFCro39Me8Gn+UGqNfDiFc9uumV8cJwzsflJ6q3I
	MJHdWAkOF4dhDVDSLaLcShx260LpDWa6n9DPL9h26oGuYWoSECekFLCVUCHFjYDssS8+7VepaG/Bw
	fBUie0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8w2-0000000BdyO-3spq;
	Sun, 25 Jan 2026 22:50:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8w1-0000000BdxZ-3IBs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 22:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 32A1460127;
	Sun, 25 Jan 2026 22:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F9BC16AAE;
	Sun, 25 Jan 2026 22:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769381420;
	bh=soOg+pSguRYShDvlBT6z+CExBTh9mpEwKqBDpU+MvVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O9eNU6FBgsG9hyVi/+uWzwzBcb3jcShb7uOmQsjIIjUrQdwd6h2E2hlOYXFcXB/ql
	 qdKPPIOMoMFnsXK4JR327RdmvVp12tzAKc3mdCuECy36dJ+ULwoOd7XxIR96MFfnRS
	 Tf/BhWFSthB4dknZzQT+VDMKWaiGk1piYc4/1SvoEyWQPVWOMbGzCOX50wyM0HhBgo
	 zQY6jjB6xI7BeQI9xaby26nk/VdbQlcrksM8alFh3VGgf4VPNgHrdrPRTG1yHtNs6B
	 LJOghmDwx1hiHEaoiXnunqOam5DBew91Q1zeucjxGqoQn4ndm/rwNY/R4fMGcCaLal
	 ZHqk/ey3wxMIw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Ridong <chenridong@huawei.com>,
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
Subject: [PATCH 33/33] doc: Add housekeeping documentation
Date: Sun, 25 Jan 2026 23:45:40 +0100
Message-ID: <20260125224541.50226-34-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260125224541.50226-1-frederic@kernel.org>
References: <20260125224541.50226-1-frederic@kernel.org>
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

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Acked-by: Waiman Long <longman@redhat.com>
---
 Documentation/core-api/housekeeping.rst | 111 ++++++++++++++++++++++++
 Documentation/core-api/index.rst        |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/core-api/housekeeping.rst

diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
new file mode 100644
index 000000000000..e5417302774c
--- /dev/null
+++ b/Documentation/core-api/housekeeping.rst
@@ -0,0 +1,111 @@
+======================================
+Housekeeping
+======================================
+
+
+CPU Isolation moves away kernel work that may otherwise run on any CPU.
+The purpose of its related features is to reduce the OS jitter that some
+extreme workloads can't stand, such as in some DPDK usecases.
+
+The kernel work moved away by CPU isolation is commonly described as
+"housekeeping" because it includes ground work that performs cleanups,
+statistics maintainance and actions relying on them, memory release,
+various deferrals etc...
+
+Sometimes housekeeping is just some unbound work (unbound workqueues,
+unbound timers, ...) that gets easily assigned to non-isolated CPUs.
+But sometimes housekeeping is tied to a specific CPU and requires
+elaborated tricks to be offloaded to non-isolated CPUs (RCU_NOCB, remote
+scheduler tick, etc...).
+
+Thus, a housekeeping CPU can be considered as the reverse of an isolated
+CPU. It is simply a CPU that can execute housekeeping work. There must
+always be at least one online housekeeping CPU at any time. The CPUs that
+are not	isolated are automatically assigned as housekeeping.
+
+Housekeeping is currently divided in four features described
+by the ``enum hk_type type``:
+
+1.	HK_TYPE_DOMAIN matches the work moved away by scheduler domain
+	isolation performed through ``isolcpus=domain`` boot parameter or
+	isolated cpuset partitions in cgroup v2. This includes scheduler
+	load balancing, unbound workqueues and timers.
+
+2.	HK_TYPE_KERNEL_NOISE matches the work moved away by tick isolation
+	performed through ``nohz_full=`` or ``isolcpus=nohz`` boot
+	parameters. This includes remote scheduler tick, vmstat and lockup
+	watchdog.
+
+3.	HK_TYPE_MANAGED_IRQ matches the IRQ handlers moved away by managed
+	IRQ isolation performed through ``isolcpus=managed_irq``.
+
+4.	HK_TYPE_DOMAIN_BOOT matches the work moved away by scheduler domain
+	isolation performed through ``isolcpus=domain`` only. It is similar
+	to HK_TYPE_DOMAIN except it ignores the isolation performed by
+	cpusets.
+
+
+Housekeeping cpumasks
+=================================
+
+Housekeeping cpumasks include the CPUs that can execute the work moved
+away by the matching isolation feature. These cpumasks are returned by
+the following function::
+
+	const struct cpumask *housekeeping_cpumask(enum hk_type type)
+
+By default, if neither ``nohz_full=``, nor ``isolcpus``, nor cpuset's
+isolated partitions are used, which covers most usecases, this function
+returns the cpu_possible_mask.
+
+Otherwise the function returns the cpumask complement of the isolation
+feature. For example:
+
+With isolcpus=domain,7 the following will return a mask with all possible
+CPUs except 7::
+
+	housekeeping_cpumask(HK_TYPE_DOMAIN)
+
+Similarly with nohz_full=5,6 the following will return a mask with all
+possible CPUs except 5,6::
+
+	housekeeping_cpumask(HK_TYPE_KERNEL_NOISE)
+
+
+Synchronization against cpusets
+=================================
+
+Cpuset can modify the HK_TYPE_DOMAIN housekeeping cpumask while creating,
+modifying or deleting an isolated partition.
+
+The users of HK_TYPE_DOMAIN cpumask must then make sure to synchronize
+properly against cpuset in order to make sure that:
+
+1.	The cpumask snapshot stays coherent.
+
+2.	No housekeeping work is queued on a newly made isolated CPU.
+
+3.	Pending housekeeping work that was queued to a non isolated
+	CPU which just turned isolated through cpuset must be flushed
+	before the related created/modified isolated partition is made
+	available to userspace.
+
+This synchronization is maintained by an RCU based scheme. The cpuset update
+side waits for an RCU grace period after updating the HK_TYPE_DOMAIN
+cpumask and before flushing pending works. On the read side, care must be
+taken to gather the housekeeping target election and the work enqueue within
+the same RCU read side critical section.
+
+A typical layout example would look like this on the update side
+(``housekeeping_update()``)::
+
+	rcu_assign_pointer(housekeeping_cpumasks[type], trial);
+	synchronize_rcu();
+	flush_workqueue(example_workqueue);
+
+And then on the read side::
+
+	rcu_read_lock();
+	cpu = housekeeping_any_cpu(HK_TYPE_DOMAIN);
+	queue_work_on(cpu, example_workqueue, work);
+	rcu_read_unlock();
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 5eb0fbbbc323..79fe7735692e 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -25,6 +25,7 @@ it.
    symbol-namespaces
    asm-annotations
    real-time/index
+   housekeeping.rst
 
 Data structures and low-level utilities
 =======================================
-- 
2.51.1


