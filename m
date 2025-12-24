Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBD7E75453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 13:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkAzbA5ueoGEJ4U/Zdzxqtdvla3TLonTUIGegnDQ6Ro=; b=ZjNDXGGPFAM9+5a4KHwJy/sjv+
	rKai9umNYfFh+D7ek3v7iB6dSkoOZiXQyss/G5kmcQRLPJDBeIukuJYrG8RPM2LeuGHaAmJCLqvii
	AnG+fje7vtaTqpyWMBNXJCWEYyEvDz3cDhm/GC7KdpOA/k0BxwbixvwIynXw48/NqRKR4bQF26Fdj
	uadskMrkjkVEIm1DNoV0Y+8gHrF9hGuyQ4hGRrWsXeKKB+bdqj+6jzObn/3ZAnN/IO33667+XhN3Z
	hLuvxe7dkyoVj5nyRx8/D8xH3wzJ79vsQ7/uI+tWk767AE+7fTxLeDeHkFBOLB4GzKXHSXgJIV5Fo
	1J/AETFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPDw-0000000GtC4-3RjT;
	Wed, 24 Dec 2025 13:48:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPDr-0000000Gt6I-3Pt3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 13:48:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0298060133;
	Wed, 24 Dec 2025 13:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F4CC4CEFB;
	Wed, 24 Dec 2025 13:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766584094;
	bh=g07phPGG/Oy0m05V60X9C22vXitOxGspdZ/J2kDb5tw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DzQOLmNe2ElVs26zpy4ezuaRwXGVH+R3stciRsBWJLK3UC5w34inc2T1/EwdC9lFE
	 fyFiuQahU2FvodRmFXZ9ijmEeJTHKF0Yrj/Q6DGeG2newSS1uUJ4GvRqcz4p9Uy79A
	 KRJjyRKu7Sah7jkELphRWphjVnGuhoJZqN6v/aJID406Re2uCtndE0NAvaionA7PgN
	 ySgdtzsXpdLvA8Pn72STWr5Ug6rp7Tvxn1Wpf/7S1CYDrfJGoNZ0TJdyYvRfZx8ZLu
	 lXqXo59WpBnc9ZBjGMDalkqCjnlSnb/30eoplFozEe8MJ3ixwjIIk2oD7Xyth3S1Uu
	 5PsQG1Bnax0Sg==
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
Date: Wed, 24 Dec 2025 14:45:06 +0100
Message-ID: <20251224134520.33231-20-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251224134520.33231-1-frederic@kernel.org>
References: <20251224134520.33231-1-frederic@kernel.org>
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

Until now, cpuset would propagate isolated partition changes to
timer migration so that unbound timers don't get migrated to isolated
CPUs.

Since housekeeping now centralizes, synchronize and propagates isolation
cpumask changes, perform the work from that subsystem for consolidation
and consistency purposes.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cgroup/cpuset.c   | 3 ---
 kernel/sched/isolation.c | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index a492d23dd622..25ac6c98113c 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1487,9 +1487,6 @@ static void update_isolation_cpumasks(void)
 	ret = housekeeping_update(isolated_cpus, HK_TYPE_DOMAIN);
 	WARN_ON_ONCE(ret < 0);
 
-	ret = tmigr_isolated_exclude_cpumask(isolated_cpus);
-	WARN_ON_ONCE(ret < 0);
-
 	isolated_cpus_updating = false;
 }
 
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index d224bca299ed..84a257d05918 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -150,7 +150,12 @@ int housekeeping_update(struct cpumask *isol_mask, enum hk_type type)
 	pci_probe_flush_workqueue();
 	mem_cgroup_flush_workqueue();
 	vmstat_flush_workqueue();
+
 	err = workqueue_unbound_housekeeping_update(housekeeping_cpumask(type));
+	WARN_ON_ONCE(err < 0);
+
+	err = tmigr_isolated_exclude_cpumask(isol_mask);
+	WARN_ON_ONCE(err < 0);
 
 	kfree(old);
 
-- 
2.51.1


