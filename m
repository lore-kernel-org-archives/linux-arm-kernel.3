Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F7CEEB57B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 22:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wizuhTN6mGlwa9nDLf8YTsLN8D8vmBJXyWiJsoAfY8=; b=B5KgzFCX+75LpRjMHHnkX8eW6K
	rOJqPU0YJL744+75+4SFI0F23w3kpXKBsPhiPIT0jQ6SmP0iWbpCHasZOxhGA82SGISQRE0kJt5SY
	UopJ0IQ/IsDmTeA2j+4BtjF7esS+hvEsA4xW0ip/Cy3U31irkPhuweNIBoIPGrtM3ppZ94IJK4jXg
	QYrxuEeZsA55QPsCveQOvdAgl8luiIQHRJPskgyZnPOgjKt388ajCJGaO6dP+xknnUjLH9vNRu+EK
	E8H7yxGsz79racKv35Mhf7azJEalHHSXmtpjdHNvCGFsbfClEh+T9hXyx0BmviyqNnWdDuP+t09p9
	FAtpl+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbQxN-00000007Y85-0Prz;
	Thu, 01 Jan 2026 22:15:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbQxF-00000007Y2J-0fWu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 22:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 89AB0600B0;
	Thu,  1 Jan 2026 22:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208B9C116D0;
	Thu,  1 Jan 2026 22:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767305736;
	bh=cfBsUi49kwBpo1bGsw5oqJU14C2/JcinY0oHFYzJ/us=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nlQMgj1nTTXW18RtyL+xyRQjFuVUjFVIkw9w4/qbqxrf81g8r3KSDa05VKVN/bxA/
	 vIKSiCe2IhhaJyJCtEzi9RsJO0Kbx8cxJXCZHBVgFZymaDNc7SBubaq2+9W8AmTG/R
	 Eq6yt71iRpiTnQdzSIiKHmq7FzyJIJ71LVV0/jxsh8Dr0Psex4G5jmxaJgSgs/9rC7
	 WvO1V9EwXxqIAxixAFfaI6OkeVse14raZBGXjJ1BvNu7ayX38rhmGCtOOAwATE9ajn
	 kudc2CaRsC2rzY4fk5JPxN5Wf/5Y1n6opCaB/29876e/JqEDRp56ZY7BLWOVS3cV8r
	 BETHMalvbdJ4w==
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
Subject: [PATCH 10/33] timers/migration: Prevent from lockdep false positive warning
Date: Thu,  1 Jan 2026 23:13:35 +0100
Message-ID: <20260101221359.22298-11-frederic@kernel.org>
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

Testing housekeeping_cpu() will soon require that either the RCU "lock"
is held or the cpuset mutex.

When CPUs get isolated through cpuset, the change is propagated to
timer migration such that isolation is also performed from the migration
tree. However that propagation is done using workqueue which tests if
the target is actually isolated before proceeding.

Lockdep doesn't know that the workqueue caller holds cpuset mutex and
that it waits for the work, making the housekeeping cpumask read safe.

Shut down the future warning by removing this test. It is unecessary
beyond hotplug, the workqueue is already targeted towards isolated CPUs.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/time/timer_migration.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 18dda1aa782d..3879575a4975 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -1497,7 +1497,7 @@ static int tmigr_clear_cpu_available(unsigned int cpu)
 	return 0;
 }
 
-static int tmigr_set_cpu_available(unsigned int cpu)
+static int __tmigr_set_cpu_available(unsigned int cpu)
 {
 	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
 
@@ -1505,9 +1505,6 @@ static int tmigr_set_cpu_available(unsigned int cpu)
 	if (WARN_ON_ONCE(!tmc->tmgroup))
 		return -EINVAL;
 
-	if (tmigr_is_isolated(cpu))
-		return 0;
-
 	guard(mutex)(&tmigr_available_mutex);
 
 	cpumask_set_cpu(cpu, tmigr_available_cpumask);
@@ -1523,6 +1520,14 @@ static int tmigr_set_cpu_available(unsigned int cpu)
 	return 0;
 }
 
+static int tmigr_set_cpu_available(unsigned int cpu)
+{
+	if (tmigr_is_isolated(cpu))
+		return 0;
+
+	return __tmigr_set_cpu_available(cpu);
+}
+
 static void tmigr_cpu_isolate(struct work_struct *ignored)
 {
 	tmigr_clear_cpu_available(smp_processor_id());
@@ -1530,7 +1535,12 @@ static void tmigr_cpu_isolate(struct work_struct *ignored)
 
 static void tmigr_cpu_unisolate(struct work_struct *ignored)
 {
-	tmigr_set_cpu_available(smp_processor_id());
+	/*
+	 * Don't call tmigr_is_isolated() ->housekeeping_cpu() directly because
+	 * the cpuset mutex is correctly held by the workqueue caller but lockdep
+	 * doesn't know that.
+	 */
+	__tmigr_set_cpu_available(smp_processor_id());
 }
 
 /**
-- 
2.51.1


