Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578A7E7545D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlqOEIUZYj0eLijTdCIgJNLNuXexdin4tjYUP/KfQoA=; b=YDcm6mgkSn5aGAZzqw9COu0HL8
	HV1J4BoBTEAqrEFOzjm1omrdru3uP3RooRh2LRoPVQdvgkUrzBahi+5G0sKOsFGWd/tkW8ixVXslh
	tG9rwEZEtTiY17pzMb03XMSOP6Pvd346Yh2jlCGS8HaFcTd0v0tn25QiaQJ3YR9gw3MLU9udAqX7T
	OilFMjGvb/fEDBPA2QdWWDQXxwdXMyzeUw4hIOUxpEot+TmrTwMA0XiI/4RDoReURahCQttOa38tU
	xXjRwEiK9JhIXiyljCrJxC++obf/8JSy+oNnji52Gp6puj+mRNCK97N+2RogoX1qd7qX/e9ioGS3+
	PceK9iLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPEc-0000000Gtgl-0oZP;
	Wed, 24 Dec 2025 13:49:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPEP-0000000Gtab-1tmq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 13:48:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02DB7407EE;
	Wed, 24 Dec 2025 13:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DE6C4CEFB;
	Wed, 24 Dec 2025 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766584128;
	bh=A8T9Nt5SRDhTjWCk2XTP9uMmIZ8k8WhHtELVSGlUK7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KuY1u8Rz/vaDMQjR2MduOKoqcP3JJ9dZEbloX6lhXdXVpmxWAzJIaQm3eFg/D27zU
	 lUafuPB2AoUO60eHIuJvuu/m6OXX7ZEEz1Oq8bxROsWzYSdKvSUuUK/5HO71jIMixa
	 4QGfLZwXMeDTLbl/ZR5f7UsqA0/+3ilmlN3S0gTkCDQusqv50zQ6QFshATbiWqw2Id
	 xMidRdd8Ofj9Le4qh6i/2QdArks8ocuNp1MNGmE26zBEUzp9CT8I0OkWU4qpszM38g
	 BYupaN2e+pTopKIZqnKPL7f+wpgqeZV1/GK2kbN2pGJTpTuA6NiJbtWnPELGFGbMF2
	 LnjLg5nkSaQug==
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
Subject: [PATCH 23/33] PCI: Remove superfluous HK_TYPE_WQ check
Date: Wed, 24 Dec 2025 14:45:10 +0100
Message-ID: <20251224134520.33231-24-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251224134520.33231-1-frederic@kernel.org>
References: <20251224134520.33231-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_054853_632991_2C6718D6 
X-CRM114-Status: GOOD (  14.43  )
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

It doesn't make sense to use nohz_full without also isolating the
related CPUs from the domain topology, either through the use of
isolcpus= or cpuset isolated partitions.

And now HK_TYPE_DOMAIN includes all kinds of domain isolated CPUs.

This means that HK_TYPE_KERNEL_NOISE (of which HK_TYPE_WQ is only an
alias) should always be a subset of HK_TYPE_DOMAIN.

Therefore sane configurations verify:

	HK_TYPE_KERNEL_NOISE | HK_TYPE_DOMAIN == HK_TYPE_DOMAIN

Simplify the PCI probe target election accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/pci/pci-driver.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index d87f781e5ce9..a9590601835a 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -384,16 +384,9 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
 	    pci_physfn_is_probed(dev)) {
 		error = local_pci_probe(&ddi);
 	} else {
-		cpumask_var_t wq_domain_mask;
 		struct pci_probe_arg arg = { .ddi = &ddi };
 
 		INIT_WORK_ONSTACK(&arg.work, local_pci_probe_callback);
-
-		if (!zalloc_cpumask_var(&wq_domain_mask, GFP_KERNEL)) {
-			error = -ENOMEM;
-			goto out;
-		}
-
 		/*
 		 * The target election and the enqueue of the work must be within
 		 * the same RCU read side section so that when the workqueue pool
@@ -402,12 +395,9 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
 		 * targets.
 		 */
 		rcu_read_lock();
-		cpumask_and(wq_domain_mask,
-			    housekeeping_cpumask(HK_TYPE_WQ),
-			    housekeeping_cpumask(HK_TYPE_DOMAIN));
-
 		cpu = cpumask_any_and(cpumask_of_node(node),
-				      wq_domain_mask);
+				      housekeeping_cpumask(HK_TYPE_DOMAIN));
+
 		if (cpu < nr_cpu_ids) {
 			struct workqueue_struct *wq = pci_probe_wq;
 
@@ -422,10 +412,9 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
 			error = local_pci_probe(&ddi);
 		}
 
-		free_cpumask_var(wq_domain_mask);
 		destroy_work_on_stack(&arg.work);
 	}
-out:
+
 	dev->is_probed = 0;
 	cpu_hotplug_enable();
 	return error;
-- 
2.51.1


