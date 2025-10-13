Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DF7CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZojQTew++BfAEii+rnYjOoU9yY6iAsIlazqCQw8DR8=; b=KoqPTEgU9MJqy8l1z23e4bLAHh
	r7VpZySeOas68SswR+Oerz25k+ROKT0F6wVa7dJbnBXi7scEDBVd3QkjxLFpb/S+TurVlkjw2nGkb
	yas42xbF1dzJd8PVF58J+WSfUud7Q6CySHDTbJJIZM5hha1Malf9bRbumCa2OvIxGYa0iO+wQB1kg
	t1Pl09QfGcXcg/394FHDlpKwhQE1SSlM5dhMrXaoMh6oIzfqcyIfdeurSxDzf4/awSQhZYlezt1mg
	iz/wvWUtptBd6AS26/P4J9PY6/0mCLj+j63u8+fM9UKrGhNF+uxOSCntD/hpG9NJozTWhljNB0Xph
	qStFmGkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PGr-0000000EQAB-3C0v;
	Mon, 13 Oct 2025 20:35:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PGn-0000000EQ5V-3znE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:35:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A068A40748;
	Mon, 13 Oct 2025 20:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39411C4CEF8;
	Mon, 13 Oct 2025 20:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760387749;
	bh=tmme1GHCRZttEH0fzbesyJQ/RQ0GFTr99io8B0/CrOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qGk5nfr+6FsZ+NjmwnCpmAIaenxkl60KAACf6wbri2p0S9pMENlqql05tS3cfeHFe
	 uKiGz3Z1CNQF9dQ5na0Eo9YKToVMYig8jRDhXl6mjij12opct/nqMuc04zcTbWIkUp
	 Pv4FcATUmHuTXDyFfwmtBXSk+cueqvuhxXcz79ZHZkNl/G05hC4WAIWCUq6mXj3vlC
	 8GL1Mo9r7l5G3jIvY1YprkTxP7uSL9d4kbRQllwCO4VpCnFsXjxKKnDv13lxqm/xOg
	 uIG/Hsns7R68qcZY9rnBMiW6uZGF0Fd9OINAd0lw3yS0nEqn0SX9YPNmoF+o7eFaGf
	 O1f7778QWb7+g==
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
Subject: [PATCH 30/33] kthread: Add API to update preferred affinity on kthread runtime
Date: Mon, 13 Oct 2025 22:31:43 +0200
Message-ID: <20251013203146.10162-31-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013203146.10162-1-frederic@kernel.org>
References: <20251013203146.10162-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_133550_053983_79D307B3 
X-CRM114-Status: GOOD (  17.94  )
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

Kthreads can apply for a preferred affinity upon creation but they have
no means to update that preferred affinity after the first wake up.
kthread_affine_preferred() is optimized by assuming the kthread
is sleeping while applying the allowed cpumask.

Therefore introduce a new API to further update the preferred affinity.

It will be used by IRQ kthreads.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/kthread.h |  1 +
 kernel/kthread.c        | 55 +++++++++++++++++++++++++++++++++++------
 2 files changed, 48 insertions(+), 8 deletions(-)

diff --git a/include/linux/kthread.h b/include/linux/kthread.h
index c92c1149ee6e..a06cae7f2c55 100644
--- a/include/linux/kthread.h
+++ b/include/linux/kthread.h
@@ -86,6 +86,7 @@ void free_kthread_struct(struct task_struct *k);
 void kthread_bind(struct task_struct *k, unsigned int cpu);
 void kthread_bind_mask(struct task_struct *k, const struct cpumask *mask);
 int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask);
+int kthread_affine_preferred_update(struct task_struct *p, const struct cpumask *mask);
 int kthread_stop(struct task_struct *k);
 int kthread_stop_put(struct task_struct *k);
 bool kthread_should_stop(void);
diff --git a/kernel/kthread.c b/kernel/kthread.c
index d36bdfbd004e..f3397cf7542a 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -322,17 +322,16 @@ EXPORT_SYMBOL_GPL(kthread_parkme);
 void __noreturn kthread_exit(long result)
 {
 	struct kthread *kthread = to_kthread(current);
+	struct cpumask *to_free = NULL;
 	kthread->result = result;
-	if (!list_empty(&kthread->affinity_node)) {
-		mutex_lock(&kthread_affinity_lock);
-		list_del(&kthread->affinity_node);
-		mutex_unlock(&kthread_affinity_lock);
 
-		if (kthread->preferred_affinity) {
-			kfree(kthread->preferred_affinity);
-			kthread->preferred_affinity = NULL;
-		}
+	scoped_guard(mutex, &kthread_affinity_lock) {
+		if (!list_empty(&kthread->affinity_node))
+			list_del_init(&kthread->affinity_node);
+		to_free = kthread->preferred_affinity;
+		kthread->preferred_affinity = NULL;
 	}
+	kfree(to_free);
 	do_exit(0);
 }
 EXPORT_SYMBOL(kthread_exit);
@@ -900,6 +899,46 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 }
 EXPORT_SYMBOL_GPL(kthread_affine_preferred);
 
+/**
+ * kthread_affine_preferred_update - update a kthread's preferred affinity
+ * @p: thread created by kthread_create().
+ * @cpumask: new mask of CPUs (might not be online, must be possible) for @k
+ *           to run on.
+ *
+ * Update the cpumask of the desired kthread's affinity that was passed by
+ * a previous call to kthread_affine_preferred(). This can be called either
+ * before or after the first wakeup of the kthread.
+ *
+ * Returns 0 if the affinity has been applied.
+ */
+int kthread_affine_preferred_update(struct task_struct *p,
+				    const struct cpumask *mask)
+{
+	struct kthread *kthread = to_kthread(p);
+	cpumask_var_t affinity;
+	int ret = 0;
+
+	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL))
+		return -ENOMEM;
+
+	scoped_guard(mutex, &kthread_affinity_lock) {
+		if (WARN_ON_ONCE(!kthread->preferred_affinity ||
+				 list_empty(&kthread->affinity_node))) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		cpumask_copy(kthread->preferred_affinity, mask);
+		kthread_fetch_affinity(kthread, affinity);
+		set_cpus_allowed_ptr(p, affinity);
+	}
+out:
+	free_cpumask_var(affinity);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(kthread_affine_preferred_update);
+
 static int kthreads_update_affinity(bool force)
 {
 	cpumask_var_t affinity;
-- 
2.51.0


