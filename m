Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6433CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gV/ChDBGc9PLzOMwlQ88pXk6Lp6exJnDze4qQYv61iQ=; b=3CvihZK6Enb2JXguPvCoTXYzAU
	qGlj8B5or6eAStD3L0lN+It7rbM4rCDveqMAHZSRx43nu6ntqmR8o42d05xQXEZ9jaL059RkxkpXu
	wntBMpUFelWLwTpyWMQhDlY7TN40+Xe2Pu6bCMg2ytAHkqOMetL3+moTqaYdcr/FRJICybm6MPawk
	oT2PQK96gqvkVDqjEAnbDggWS3HmJoZH/VyqxsHtPtIaR6bfwbROSFW74HWiYhTfjeMgcwG3xqI5l
	nRRrE2kIm56LHXmeKhJFCysRYqpnH5o35zoVTL9pRmKrLkCSvvG/7pM5aOKmF0bM2LLOpmv21InkO
	ivbYtbzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkfs-0000000EPgb-1i5A;
	Wed, 05 Nov 2025 21:04:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkfr-0000000EPgP-2O5e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 21:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C85560220;
	Wed,  5 Nov 2025 21:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13AB5C116D0;
	Wed,  5 Nov 2025 21:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762376650;
	bh=8Q71EO557AK60zUjy5zJPPkN07FPtYd1UuHTAzHqsFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AJURCUSilbHUliUZRLrgr+YTl80lHSkFVtDFlHcKKO/sO5PBq/MhEJUXJz916fP81
	 wAbJ8Yy5s6zsZm9lBVZoeQXrmyCrVMNai4ryobrKlPGWI6PI6p6Jep72D7ahE5dvcd
	 k4C/l6tC0UJksuZsxtngb12Gs/wAUhM8HZr8RudMlyYPQQHJ6z+N1Fiqf5+++lztgm
	 sINWjeiVCtGxC9uvySEPj5+spW1J3KjyQn3Fa6fEASxYDs+prWyAMn68bY/cKaaxjd
	 txBp5Oc4fioT76vUk0O5Kgl+uyh1HTeyhNjK41/nevk/wEXq14ugto76jhLUchVfJp
	 9jeOdMslbHixg==
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
Subject: [PATCH 01/31] PCI: Prepare to protect against concurrent isolated cpuset change
Date: Wed,  5 Nov 2025 22:03:17 +0100
Message-ID: <20251105210348.35256-2-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105210348.35256-1-frederic@kernel.org>
References: <20251105210348.35256-1-frederic@kernel.org>
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

HK_TYPE_DOMAIN will soon integrate cpuset isolated partitions and
therefore be made modifiable at runtime. Synchronize against the cpumask
update using RCU.

The RCU locked section includes both the housekeeping CPU target
election for the PCI probe work and the work enqueue.

This way the housekeeping update side will simply need to flush the
pending related works after updating the housekeeping mask in order to
make sure that no PCI work ever executes on an isolated CPU. This part
will be handled in a subsequent patch.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/pci/pci-driver.c | 47 ++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 302d61783f6c..7b74d22b20f7 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -302,9 +302,8 @@ struct drv_dev_and_id {
 	const struct pci_device_id *id;
 };
 
-static long local_pci_probe(void *_ddi)
+static int local_pci_probe(struct drv_dev_and_id *ddi)
 {
-	struct drv_dev_and_id *ddi = _ddi;
 	struct pci_dev *pci_dev = ddi->dev;
 	struct pci_driver *pci_drv = ddi->drv;
 	struct device *dev = &pci_dev->dev;
@@ -338,6 +337,19 @@ static long local_pci_probe(void *_ddi)
 	return 0;
 }
 
+struct pci_probe_arg {
+	struct drv_dev_and_id *ddi;
+	struct work_struct work;
+	int ret;
+};
+
+static void local_pci_probe_callback(struct work_struct *work)
+{
+	struct pci_probe_arg *arg = container_of(work, struct pci_probe_arg, work);
+
+	arg->ret = local_pci_probe(arg->ddi);
+}
+
 static bool pci_physfn_is_probed(struct pci_dev *dev)
 {
 #ifdef CONFIG_PCI_IOV
@@ -362,34 +374,51 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
 	dev->is_probed = 1;
 
 	cpu_hotplug_disable();
-
 	/*
 	 * Prevent nesting work_on_cpu() for the case where a Virtual Function
 	 * device is probed from work_on_cpu() of the Physical device.
 	 */
 	if (node < 0 || node >= MAX_NUMNODES || !node_online(node) ||
 	    pci_physfn_is_probed(dev)) {
-		cpu = nr_cpu_ids;
+		error = local_pci_probe(&ddi);
 	} else {
 		cpumask_var_t wq_domain_mask;
+		struct pci_probe_arg arg = { .ddi = &ddi };
+
+		INIT_WORK_ONSTACK(&arg.work, local_pci_probe_callback);
 
 		if (!zalloc_cpumask_var(&wq_domain_mask, GFP_KERNEL)) {
 			error = -ENOMEM;
 			goto out;
 		}
+
+		/*
+		 * The target election and the enqueue of the work must be within
+		 * the same RCU read side section so that when the workqueue pool
+		 * is flushed after a housekeeping cpumask update, further readers
+		 * are guaranteed to queue the probing work to the appropriate
+		 * targets.
+		 */
+		rcu_read_lock();
 		cpumask_and(wq_domain_mask,
 			    housekeeping_cpumask(HK_TYPE_WQ),
 			    housekeeping_cpumask(HK_TYPE_DOMAIN));
 
 		cpu = cpumask_any_and(cpumask_of_node(node),
 				      wq_domain_mask);
+		if (cpu < nr_cpu_ids) {
+			schedule_work_on(cpu, &arg.work);
+			rcu_read_unlock();
+			flush_work(&arg.work);
+			error = arg.ret;
+		} else {
+			rcu_read_unlock();
+			error = local_pci_probe(&ddi);
+		}
+
 		free_cpumask_var(wq_domain_mask);
+		destroy_work_on_stack(&arg.work);
 	}
-
-	if (cpu < nr_cpu_ids)
-		error = work_on_cpu(cpu, local_pci_probe, &ddi);
-	else
-		error = local_pci_probe(&ddi);
 out:
 	dev->is_probed = 0;
 	cpu_hotplug_enable();
-- 
2.51.0


