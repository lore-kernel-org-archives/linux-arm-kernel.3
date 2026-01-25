Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BB7D7237B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CH9CKuGBomtUGQZ4+PlDf6AcFHLxJeql89OGbhEvJI4=; b=NHPOkupW/J4tIHZOgQBu4HFgtO
	kqNn6P/VqEIP/7DOBv06qvCZei7S3u/n7JFsAFWlzCSgmPDK3Q/JoG9sLlzpGxAIjf6ZaeKU9mlQK
	IHC0Ons3BXXzvvI3YsGYQYZFW4Cd56stOuQVvIC5JcSQcWOpHtx57cMxfQC46m+c7f58mGP7I5Gus
	stQ83Sz1bAkoeBxbyDSp5OT30G+jFWYMQqEOAVvJSc8IbaXc/R7bCJN3r+V6CyC3vVaZ/dFds3kSS
	0aMrQzOl1yFlH3bKw7pwBN9TitkKwDdYh1lWEaCu67CpFx+XF+CWVczzfSx7qmrJUPX74yRSSslmA
	4V3JJNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8vW-0000000Bdaw-3UIP;
	Sun, 25 Jan 2026 22:49:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8vV-0000000BdZb-0fyb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 22:49:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C1107407C8;
	Sun, 25 Jan 2026 22:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F034C19425;
	Sun, 25 Jan 2026 22:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769381388;
	bh=8YH3jJJ1l+zWkUBN7W5HQtnoatv1adfZkeKPi8o8s7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xh9qasXMZUMlZAvDOzubOT1QTX8nu9zdOSq/aG5SytkYO8dDUbUHJYFhPOhMIbOoc
	 shv9P8Bht3wB1y2r2jVGvZJv0HRG80ck2wtcmqKvSpyaFC/xFWa1YeBCz4KK/9ivCR
	 hYkK+Dyczy4RyH0t8DqAhfix9gdqot+5+jz0nhKl5oWWR6gbyqD0RRWpWeslUSffQg
	 5ffYgiOyzrLcj7I2oZeUcUBGC28h6CqUynsHVapP6lqi9yhKrLlwD6ZJaiFeb/Dw6q
	 li4SD3zXYvOkkw7bhKz4ZGmz1nuunbm6XlRzlwkUldb6lKhtWEGk/kgzKSmleS680L
	 XVtpddRKIJWYQ==
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
Subject: [PATCH 29/33] sched/arm64: Move fallback task cpumask to HK_TYPE_DOMAIN
Date: Sun, 25 Jan 2026 23:45:36 +0100
Message-ID: <20260125224541.50226-30-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260125224541.50226-1-frederic@kernel.org>
References: <20260125224541.50226-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_144949_241960_57FC9B33 
X-CRM114-Status: GOOD (  16.02  )
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

When none of the allowed CPUs of a task are online, it gets migrated
to the fallback cpumask which is all the non nohz_full CPUs.

However just like nohz_full CPUs, domain isolated CPUs don't want to be
disturbed by tasks that have lost their CPU affinities.

And since nohz_full rely on domain isolation to work correctly, the
housekeeping mask of domain isolated CPUs should always be a subset of
the housekeeping mask of nohz_full CPUs (there can be CPUs that are
domain isolated but not nohz_full, OTOH there shouldn't be nohz_full
CPUs that are not domain isolated):

	HK_TYPE_DOMAIN & HK_TYPE_KERNEL_NOISE == HK_TYPE_DOMAIN

Therefore use HK_TYPE_DOMAIN as the appropriate fallback target for
tasks. Note that cpuset isolated partitions are not supported on those
systems and may result in undefined behaviour.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Reviewed-by: Waiman Long <longman@redhat.com>
---
 Documentation/arch/arm64/asymmetric-32bit.rst | 12 ++++++++----
 arch/arm64/kernel/cpufeature.c                |  6 +++---
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/arch/arm64/asymmetric-32bit.rst b/Documentation/arch/arm64/asymmetric-32bit.rst
index 57b8d7476f71..fc0c350c5e00 100644
--- a/Documentation/arch/arm64/asymmetric-32bit.rst
+++ b/Documentation/arch/arm64/asymmetric-32bit.rst
@@ -154,10 +154,14 @@ mode will return to host userspace with an ``exit_reason`` of
 ``KVM_EXIT_FAIL_ENTRY`` and will remain non-runnable until successfully
 re-initialised by a subsequent ``KVM_ARM_VCPU_INIT`` operation.
 
-NOHZ FULL
----------
+SCHEDULER DOMAIN ISOLATION
+--------------------------
 
-To avoid perturbing an adaptive-ticks CPU (specified using
-``nohz_full=``) when a 32-bit task is forcefully migrated, these CPUs
+To avoid perturbing a boot-defined domain isolated CPU (specified using
+``isolcpus=[domain]``) when a 32-bit task is forcefully migrated, these CPUs
 are treated as 64-bit-only when support for asymmetric 32-bit systems
 is enabled.
+
+However as opposed to boot-defined domain isolation, runtime-defined domain
+isolation using cpuset isolated partition is not advised on asymmetric
+32-bit systems and will result in undefined behaviour.
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c840a93b9ef9..f0e66cb27d17 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1669,7 +1669,7 @@ const struct cpumask *system_32bit_el0_cpumask(void)
 
 const struct cpumask *task_cpu_fallback_mask(struct task_struct *p)
 {
-	return __task_cpu_possible_mask(p, housekeeping_cpumask(HK_TYPE_TICK));
+	return __task_cpu_possible_mask(p, housekeeping_cpumask(HK_TYPE_DOMAIN));
 }
 
 static int __init parse_32bit_el0_param(char *str)
@@ -3987,8 +3987,8 @@ static int enable_mismatched_32bit_el0(unsigned int cpu)
 	bool cpu_32bit = false;
 
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
-		if (!housekeeping_cpu(cpu, HK_TYPE_TICK))
-			pr_info("Treating adaptive-ticks CPU %u as 64-bit only\n", cpu);
+		if (!housekeeping_cpu(cpu, HK_TYPE_DOMAIN))
+			pr_info("Treating domain isolated CPU %u as 64-bit only\n", cpu);
 		else
 			cpu_32bit = true;
 	}
-- 
2.51.1


