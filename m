Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7CCEEEC1C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 22:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLzPvP10lPZmnoDZlVjZaj2C4mTuFn9mkofErYVOVAU=; b=AeeRUXOaNpOdU56mZQIJTquv1l
	1vW4pSxeaSZAlh2q7r7rd8WFXtBH2fbjfOMZlDL+GQ/WiwLITdEz7bPpT0ZKTRI2xzh6Bxb+2GsMg
	8d6iWzx9jixRKG7AsPDh5j6BNiTLIFoWICjkc2P66mNk3CDRivukfMr09YuSz5ixk+uqsfQOzU/lk
	mPFdT4BbVFEKKd3cqSAtcl1PeT3S3bo1TBoexBuBDi7+W9x425hPZ4S/w8L5EpG7zm3O5h8j3rCh+
	flZPcrKn2YxvOODaCQ+QiShs1F8ibKs8/PwwE8bPohUe0cY+JeCMIlt8K844HBwgwCs3sgxObxRXb
	TxAR4AdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbQwK-00000007Xeu-16qK;
	Thu, 01 Jan 2026 22:14:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbQwI-00000007Xe3-28Di
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 22:14:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D45860055;
	Thu,  1 Jan 2026 22:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F29DC116D0;
	Thu,  1 Jan 2026 22:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767305677;
	bh=xkhk7ZGxynk2RcaH6iYDB0TKNwEPyWR7khi8Efbu4u0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bPTqFrIPuMeDiUKjLJf1BdJZTy8900oENIeuIH1dkJxlc6njI1s0k74kL6OtDCJJ8
	 R0azKjfphZArLtU64G3kGqplYYG9rSP2gHe1okwairy5AcP1hIu/yPGli7wVh+MMLx
	 Cf4HBRsfB7tB3ryzbCrOSwtSLh1ZhMMxFnpbplQa4efDNabKMfYGXmlvewbsq3eSLw
	 Q1gD7Sfampvfq3ZlL6yE+MwTbAdJW22yf9odVWI6MJ/KVLI6k1vg2L2FqskDdTxYRE
	 zgzfjdPOV14ZLPrpP77hkiEf1Z3io3x+v2KJKdO0dh6Rp9zb43IWkyhypLpv3OfYav
	 /RgNIaTo+1D9Q==
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
Subject: [PATCH 03/33] memcg: Prepare to protect against concurrent isolated cpuset change
Date: Thu,  1 Jan 2026 23:13:28 +0100
Message-ID: <20260101221359.22298-4-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260101221359.22298-1-frederic@kernel.org>
References: <20260101221359.22298-1-frederic@kernel.org>
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

The HK_TYPE_DOMAIN housekeeping cpumask will soon be made modifiable at
runtime. In order to synchronize against memcg workqueue to make sure
that no asynchronous draining is pending or executing on a newly made
isolated CPU, target and queue a drain work under the same RCU critical
section.

Whenever housekeeping will update the HK_TYPE_DOMAIN cpumask, a memcg
workqueue flush will also be issued in a further change to make sure
that no work remains pending after a CPU has been made isolated.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 mm/memcontrol.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index be810c1fbfc3..2289a0299331 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2003,6 +2003,19 @@ static bool is_memcg_drain_needed(struct memcg_stock_pcp *stock,
 	return flush;
 }
 
+static void schedule_drain_work(int cpu, struct work_struct *work)
+{
+	/*
+	 * Protect housekeeping cpumask read and work enqueue together
+	 * in the same RCU critical section so that later cpuset isolated
+	 * partition update only need to wait for an RCU GP and flush the
+	 * pending work on newly isolated CPUs.
+	 */
+	guard(rcu)();
+	if (!cpu_is_isolated(cpu))
+		schedule_work_on(cpu, work);
+}
+
 /*
  * Drains all per-CPU charge caches for given root_memcg resp. subtree
  * of the hierarchy under it.
@@ -2032,8 +2045,8 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
 				      &memcg_st->flags)) {
 			if (cpu == curcpu)
 				drain_local_memcg_stock(&memcg_st->work);
-			else if (!cpu_is_isolated(cpu))
-				schedule_work_on(cpu, &memcg_st->work);
+			else
+				schedule_drain_work(cpu, &memcg_st->work);
 		}
 
 		if (!test_bit(FLUSHING_CACHED_CHARGE, &obj_st->flags) &&
@@ -2042,8 +2055,8 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
 				      &obj_st->flags)) {
 			if (cpu == curcpu)
 				drain_local_obj_stock(&obj_st->work);
-			else if (!cpu_is_isolated(cpu))
-				schedule_work_on(cpu, &obj_st->work);
+			else
+				schedule_drain_work(cpu, &obj_st->work);
 		}
 	}
 	migrate_enable();
-- 
2.51.1


