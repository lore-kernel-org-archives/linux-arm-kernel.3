Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C39E7545D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wizuhTN6mGlwa9nDLf8YTsLN8D8vmBJXyWiJsoAfY8=; b=kcN/9UwrKxzNvViBnOCBIU42j+
	ApYP5fQOPU8+LkmYnirJoP3jIyIqIen/Jov422JMpUewwsQ6KiSa0ixnt4jYgQ8tbi1eZo2Rw90wa
	TJGUe3XyqLvLPU07k9kuyHk17CRBw7r3wGDJOZvyh3Jd4HIagT6fD+iFa24Zyt3bYW6616y1RLmtj
	XPMSseVGcX6F9y9cmAAurooz0Fr34IUZWlhEWxUo4PxVrMd1iu6EDLJFdZ0WkwDvc4oUgrwY5TXGl
	Tto2L/BnOqIDcOsVFe1Yh2PzjzqgX1EfpziGyH6l1n5zVcT82rr9xhQ2fqgf8tVEcUIl7FX25ZC1Z
	8HSRj7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPCk-0000000GsLc-2xmA;
	Wed, 24 Dec 2025 13:47:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPCd-0000000GsHG-0eKc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 13:47:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96066600AD;
	Wed, 24 Dec 2025 13:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E85BC116D0;
	Wed, 24 Dec 2025 13:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766584018;
	bh=cfBsUi49kwBpo1bGsw5oqJU14C2/JcinY0oHFYzJ/us=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=REhxuoO3IX20hXtECaAueG16NscS9v1kyy5t+tUn35175JOSmkEnv4SvDaoazf7ww
	 YBpD3lRKkH2447ENW80qcP37hFyQ1nh1kM6Hopa6gcqmxGAx4vr2zZBbYP3naQ8kNq
	 JrEdcRRdPKO2q4yT5ATlv4ZznyMVYjlX6EfL2jmCsj2VIQBRGH8y3lO6py7ylcjmZo
	 efrxzY9JDKc8YjWfLnEDN1BYAYTzeNsIu534qaYrwScoI/mx5NKToLKPBHQZGg6upA
	 tyOavV43+aqYi1yHJHwWrGKQTWYuBo3NPayKJq0vqYJU7MJ+xYxwhGTXnBMYZ4J8UH
	 wWeA2GZaq/CLg==
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
Date: Wed, 24 Dec 2025 14:44:57 +0100
Message-ID: <20251224134520.33231-11-frederic@kernel.org>
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


