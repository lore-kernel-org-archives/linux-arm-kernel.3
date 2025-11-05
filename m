Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7503CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+NjrrV9QIgonnxSfd7xcOESf1q0iJqHuWSGOcEGEYc=; b=wOJYTApPTMYw4bLfL3iOEwY9QK
	I5cidX2mnzXzeW/uZfL28WzYswMt9qEJgdl0qPnDObNYykx3dpghkNla1Gb4g84iJhXKPWm7ji8Is
	dN1Q9z/6A7fmGMR8cqBVLIR18dQceJmiq9P+aHfoSMYOTn+aE/zYfj7ABR1uQm44B67guNL4Wkq79
	BfFKe3vjJXTUUgNFj9z2fuswoL/hDEGbBPFU9HZKa0uKpjI/5SzWaJtIlpbkeDvT+8bQ7xUngeNH1
	qnBAlgMaWCs0VkoirkiUiexVuO3nW2BejWh6gjIDCXdIGiifvxpsqGGOBUgemP1lIXUdolxSKKU7b
	2tQAh/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkiT-0000000ERZP-1M0S;
	Wed, 05 Nov 2025 21:06:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkiO-0000000ERWY-2WwW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 21:06:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4955B409E3;
	Wed,  5 Nov 2025 21:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D176C116B1;
	Wed,  5 Nov 2025 21:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762376808;
	bh=msWuzDTcgxqxV1VfqrsWjNwgWbBhxXt72Fo9MOZeVHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OLduUcG/WX3sS+65TZ/jB9oleAmH7o+Ij6zm6G7vJRQPWAWn/kHN6E9NbiVBTETTK
	 /tSXg4kSg8acavMwtkMnD5cCSx1kzBA38/REmggw6d/dhe6YWgbA/cArl5URBF/xtS
	 g/5opQo0PL9RHjMmGs4LFg9IMBxDNjJsHV8PMg+doyGddTGf1j7R9RdBGuAap2AqwO
	 +X//Jgt6py+or3LRMvYCSO3DJr68NLAU5ynEv1K/hyNIgEWMRTuGBrgurdbL8p52vW
	 id04tI9qFZLhzJmCp7mudgZziC2RzYyNovODMsflC8Jdl6yqEsILrkfkUBWUyRVtKj
	 ZAphLjB/PodZQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: [PATCH 21/31] kthread: Refine naming of affinity related fields
Date: Wed,  5 Nov 2025 22:03:37 +0100
Message-ID: <20251105210348.35256-22-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105210348.35256-1-frederic@kernel.org>
References: <20251105210348.35256-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_130650_615220_FA7D3F99 
X-CRM114-Status: GOOD (  15.46  )
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

The kthreads preferred affinity related fields use "hotplug" as the base
of their naming because the affinity management was initially deemed to
deal with CPU hotplug.

The scope of this role is going to broaden now and also deal with
cpuset isolated partition updates.

Switch the naming accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/kthread.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 31b072e8d427..c4dd967e9e9c 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -35,8 +35,8 @@ static DEFINE_SPINLOCK(kthread_create_lock);
 static LIST_HEAD(kthread_create_list);
 struct task_struct *kthreadd_task;
 
-static LIST_HEAD(kthreads_hotplug);
-static DEFINE_MUTEX(kthreads_hotplug_lock);
+static LIST_HEAD(kthread_affinity_list);
+static DEFINE_MUTEX(kthread_affinity_lock);
 
 struct kthread_create_info
 {
@@ -69,7 +69,7 @@ struct kthread {
 	/* To store the full name if task comm is truncated. */
 	char *full_name;
 	struct task_struct *task;
-	struct list_head hotplug_node;
+	struct list_head affinity_node;
 	struct cpumask *preferred_affinity;
 };
 
@@ -128,7 +128,7 @@ bool set_kthread_struct(struct task_struct *p)
 
 	init_completion(&kthread->exited);
 	init_completion(&kthread->parked);
-	INIT_LIST_HEAD(&kthread->hotplug_node);
+	INIT_LIST_HEAD(&kthread->affinity_node);
 	p->vfork_done = &kthread->exited;
 
 	kthread->task = p;
@@ -323,10 +323,10 @@ void __noreturn kthread_exit(long result)
 {
 	struct kthread *kthread = to_kthread(current);
 	kthread->result = result;
-	if (!list_empty(&kthread->hotplug_node)) {
-		mutex_lock(&kthreads_hotplug_lock);
-		list_del(&kthread->hotplug_node);
-		mutex_unlock(&kthreads_hotplug_lock);
+	if (!list_empty(&kthread->affinity_node)) {
+		mutex_lock(&kthread_affinity_lock);
+		list_del(&kthread->affinity_node);
+		mutex_unlock(&kthread_affinity_lock);
 
 		if (kthread->preferred_affinity) {
 			kfree(kthread->preferred_affinity);
@@ -390,9 +390,9 @@ static void kthread_affine_node(void)
 			return;
 		}
 
-		mutex_lock(&kthreads_hotplug_lock);
-		WARN_ON_ONCE(!list_empty(&kthread->hotplug_node));
-		list_add_tail(&kthread->hotplug_node, &kthreads_hotplug);
+		mutex_lock(&kthread_affinity_lock);
+		WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
+		list_add_tail(&kthread->affinity_node, &kthread_affinity_list);
 		/*
 		 * The node cpumask is racy when read from kthread() but:
 		 * - a racing CPU going down will either fail on the subsequent
@@ -402,7 +402,7 @@ static void kthread_affine_node(void)
 		 */
 		kthread_fetch_affinity(kthread, affinity);
 		set_cpus_allowed_ptr(current, affinity);
-		mutex_unlock(&kthreads_hotplug_lock);
+		mutex_unlock(&kthread_affinity_lock);
 
 		free_cpumask_var(affinity);
 	}
@@ -876,10 +876,10 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 		goto out;
 	}
 
-	mutex_lock(&kthreads_hotplug_lock);
+	mutex_lock(&kthread_affinity_lock);
 	cpumask_copy(kthread->preferred_affinity, mask);
-	WARN_ON_ONCE(!list_empty(&kthread->hotplug_node));
-	list_add_tail(&kthread->hotplug_node, &kthreads_hotplug);
+	WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
+	list_add_tail(&kthread->affinity_node, &kthread_affinity_list);
 	kthread_fetch_affinity(kthread, affinity);
 
 	/* It's safe because the task is inactive. */
@@ -887,7 +887,7 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 	do_set_cpus_allowed(p, affinity);
 	raw_spin_unlock_irqrestore(&p->pi_lock, flags);
 
-	mutex_unlock(&kthreads_hotplug_lock);
+	mutex_unlock(&kthread_affinity_lock);
 out:
 	free_cpumask_var(affinity);
 
@@ -908,9 +908,9 @@ static int kthreads_online_cpu(unsigned int cpu)
 	struct kthread *k;
 	int ret;
 
-	guard(mutex)(&kthreads_hotplug_lock);
+	guard(mutex)(&kthread_affinity_lock);
 
-	if (list_empty(&kthreads_hotplug))
+	if (list_empty(&kthread_affinity_list))
 		return 0;
 
 	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL))
@@ -918,7 +918,7 @@ static int kthreads_online_cpu(unsigned int cpu)
 
 	ret = 0;
 
-	list_for_each_entry(k, &kthreads_hotplug, hotplug_node) {
+	list_for_each_entry(k, &kthread_affinity_list, affinity_node) {
 		if (WARN_ON_ONCE((k->task->flags & PF_NO_SETAFFINITY) ||
 				 kthread_is_per_cpu(k->task))) {
 			ret = -EINVAL;
-- 
2.51.0


