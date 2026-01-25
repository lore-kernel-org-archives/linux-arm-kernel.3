Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9EBE63CA4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=un6mxQlOe8q3MHj28E/nUqpgAYI0PnqFAvHf+xc6wxE=; b=OBcnwzu2pRfZ1HvBCbRSdv+RSw
	sqha0la/T5KZAI01YRS5BYcyRYYxWmnImAPJQyT0d1c5Ircl0Ldu1fR580i8evpSLrd1QP0FrL6ZT
	jqpxQBF7awVqxtTfuVt8UX8FraLNUm4ynLXuunwR0o9/nsXdLhxwJSF+s/hLEhuCgkQLRtw4W9Fz5
	qSCEUEQGnybG5Edf8Me0dkgobz9l/k/h7dsPiYfLPb2kV5y4D2XWaT5GwucImge2rAIJSYgWaPGH0
	QcNPbhC7x/gPjMk3VhmuVqgVEi7uQgi/URLFM3XJK7vS4j3rfgc3wTgxyhj8lH/5+Ai2JffmSR94b
	CXczYZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8uD-0000000BcdE-3McX;
	Sun, 25 Jan 2026 22:48:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8uA-0000000Bcaa-3hJR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 22:48:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77C9840534;
	Sun, 25 Jan 2026 22:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D7DC19425;
	Sun, 25 Jan 2026 22:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769381306;
	bh=1KNWx87QTGRb7i2dGJVg+gYyletvaK/k+GQ/bIy3PfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WiokbWY+u72D6ZGtYKo/OejDhCbcUqCRW/Ivk54y8e59YMvltE6LmCSSlZrvA8P3I
	 6533dVvqWDSARpKKhgZXSIH72E2CbBiqihh/IqGhW6IPa4I/961XuV77GnI9QSY3Tf
	 wNow3A9qvtm2p7ZVWY4n8JyrVrgbRLGQklV+793Dg1WHR6Pc8W6pddLNM4lAOAeZ9m
	 fLORz+IDKeCldynaM9+BMlVges/4tcKZn7jJxWhO501pASCEFErJHshoUU6sjNsv4i
	 S2abbTLmRK73kWuAb2arxixwfUPO4O7J2fCOjEHn+OAleh3vPMqvugS5gwfJIcyM7y
	 RP4+wnYr93doA==
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
Subject: [PATCH 19/33] cpuset: Propagate cpuset isolation update to timers through housekeeping
Date: Sun, 25 Jan 2026 23:45:26 +0100
Message-ID: <20260125224541.50226-20-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260125224541.50226-1-frederic@kernel.org>
References: <20260125224541.50226-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_144826_976944_49134C8F 
X-CRM114-Status: GOOD (  11.77  )
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

Until now, cpuset would propagate isolated partition changes to
timer migration so that unbound timers don't get migrated to isolated
CPUs.

Since housekeeping now centralizes, synchronize and propagates isolation
cpumask changes, perform the work from that subsystem for consolidation
and consistency purposes.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cgroup/cpuset.c   | 3 ---
 kernel/sched/isolation.c | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 6309ec5d7b2a..080fa2fb10c7 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1485,9 +1485,6 @@ static void update_isolation_cpumasks(void)
 	ret = housekeeping_update(isolated_cpus);
 	WARN_ON_ONCE(ret < 0);
 
-	ret = tmigr_isolated_exclude_cpumask(isolated_cpus);
-	WARN_ON_ONCE(ret < 0);
-
 	isolated_cpus_updating = false;
 }
 
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 5bcb6d760f20..a30d19b641f7 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -149,9 +149,13 @@ int housekeeping_update(struct cpumask *isol_mask)
 	pci_probe_flush_workqueue();
 	mem_cgroup_flush_workqueue();
 	vmstat_flush_workqueue();
+
 	err = workqueue_unbound_housekeeping_update(housekeeping_cpumask(HK_TYPE_DOMAIN));
 	WARN_ON_ONCE(err < 0);
 
+	err = tmigr_isolated_exclude_cpumask(isol_mask);
+	WARN_ON_ONCE(err < 0);
+
 	kfree(old);
 
 	return 0;
-- 
2.51.1


