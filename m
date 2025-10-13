Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C27CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcejJ+qERsCbxE1HeS/D/TrEhbhgOItY0Tp2plYf2OY=; b=kS4C1c1S559qGnuzWvfyfKOM7G
	bMLaIuXiwN33vupeKs/7aYI/KdMquER31csAfFU5gIYdY0PR9vNYqEyBO8Wqq2du3TynvIscUshAd
	/Brn+sAVobNX1AU+drKpocNaUawj0lCXSm7QSi5mCswnyZYt3MBiK6EQOS0NzLHaj+/lt701m+Zv+
	CSjORv47D9a8buCukBsO6EnmY5jYm306HCkBTXuLUqm68O2+7gggjuXcFsTnUgsfmM+8cOUzLRC8R
	689gXt2hi4rvRkhV717Fok8ucv8HKfy6DrqtnsCDDyBXAEVLkW9t/1K4piERGrmNruAW9qJVHn4WX
	nC1oo6jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PG6-0000000EPPb-0Lhn;
	Mon, 13 Oct 2025 20:35:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PG5-0000000EPNm-0G88
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:35:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B78761DF0;
	Mon, 13 Oct 2025 20:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65864C4CEF8;
	Mon, 13 Oct 2025 20:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760387704;
	bh=P4mvTUeHXF9en4Wc01ryvy7Y+w+A6mZbhGMT9VJdNo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uAo47q15gD48C7SdcvHUfVvWDlDNeHp2TLA9efNKkx7V7ATILjsd2QTj9semDC601
	 E0m4Mor4NEQdRAkmFJL7MMtE0xIfVWxG6guaxtc0wUtXl+H0gdbn+Q1vFfelndq3ij
	 WyaCD8JOsDpeutJtmpNdXO0dyEEsHZsKQwjuuJpWFac8CBuzwGgmEiLgWHxPGjhYX2
	 v8ObSANlzhTMQSmtojBwEeTfglLwbivxWI+gBQWVTi7c9knWojTx+IMOqbWrFgCq70
	 XPMjCM7kaEn1TC/GQUIqhnBgsNJiFMJ6YnirbKuYhz+1cFUe8LfbO5qXhS0SwY1E+1
	 o/Pza/73NnM0A==
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
Subject: [PATCH 24/33] kthread: Rely on HK_TYPE_DOMAIN for preferred affinity management
Date: Mon, 13 Oct 2025 22:31:37 +0200
Message-ID: <20251013203146.10162-25-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013203146.10162-1-frederic@kernel.org>
References: <20251013203146.10162-1-frederic@kernel.org>
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

Unbound kthreads want to run neither on nohz_full CPUs nor on domain
isolated CPUs. And since nohz_full implies domain isolation, checking
the latter is enough to verify both.

Therefore exclude kthreads from domain isolation.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/kthread.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index cb0be05d6091..8d0c8c4c7e46 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -362,18 +362,20 @@ static void kthread_fetch_affinity(struct kthread *kthread, struct cpumask *cpum
 {
 	const struct cpumask *pref;
 
+	guard(rcu)();
+
 	if (kthread->preferred_affinity) {
 		pref = kthread->preferred_affinity;
 	} else {
 		if (kthread->node == NUMA_NO_NODE)
-			pref = housekeeping_cpumask(HK_TYPE_KTHREAD);
+			pref = housekeeping_cpumask(HK_TYPE_DOMAIN);
 		else
 			pref = cpumask_of_node(kthread->node);
 	}
 
-	cpumask_and(cpumask, pref, housekeeping_cpumask(HK_TYPE_KTHREAD));
+	cpumask_and(cpumask, pref, housekeeping_cpumask(HK_TYPE_DOMAIN));
 	if (cpumask_empty(cpumask))
-		cpumask_copy(cpumask, housekeeping_cpumask(HK_TYPE_KTHREAD));
+		cpumask_copy(cpumask, housekeeping_cpumask(HK_TYPE_DOMAIN));
 }
 
 static void kthread_affine_node(void)
-- 
2.51.0


