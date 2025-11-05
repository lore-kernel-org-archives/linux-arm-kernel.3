Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79D2CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0U19jvwafjIOZHkrvh1p72wLiGgKTY6AYcVHnCGRHT8=; b=Faq/KTbp9As8f4nwbq8pE9Fl+J
	E602yDDPf+Yo7BV3QAIzkU9be5AbIfvCmIWdtueEOK80U9CFIoLYPnqh3Z+Hzo0fd53et6vb3wlB9
	StE1xcI3j3zrb9tgzWzGA9Oe0iT5NXnR2IUpeW8m9YY/K5ScEA04kCpNUwonJC9HM5Q6Xx00oVC4i
	ONptG2g3h9NT9lp12HrJZcugl6Bsb3euV0y4kyOvtnasx+X9Y+6jwgWkvpzqQCFGlWDqCRaEvciZg
	DVD3p0H77HfgpR7rZv3MTFqc4GR6YDCrbthoDqFbZqzldr4vOTow9y3k3/gMh03Oy/GRQb8/RkUoH
	Gbg9MkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkgF-0000000EPqZ-3Qt1;
	Wed, 05 Nov 2025 21:04:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkgE-0000000EPpZ-33tX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 21:04:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B35AD60220;
	Wed,  5 Nov 2025 21:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFC7C4AF09;
	Wed,  5 Nov 2025 21:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762376673;
	bh=ApQa5R07ipGBiVCyA3EgObV++ftyWFoj/ra3rzP5dCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cyGGAVyEEtnTJleIGvRPvdX/Cc6KEP2KDLlXtGtmXgRrPqu8Hr6k4dV2PS4NZXG/b
	 0TuJ9Xv9ZVXQWSh2Q5s5CnahVU/19PTlWf5bvziWhR6igHAhOvKcyNWxStp0IREsuQ
	 dCvjHLJNUd14dOSieLUuFACfi9H0I3xpfHEEvQVGyxubT+iCI4qTrf+SBosWgX9JwY
	 q8wUhQKNtbk77Gb5lvCUyYfdwPpF6f8ZJlnEwEOgiTX7YW4gUFPYiJIdvr5mvwbwxf
	 m8/DbHKO9hBpJpzZlv5oT+4ck92P+ii+pCIyA06mlA6F7sTvBrnc5dZH921cfMjKM3
	 ISpiuGCwxLlCw==
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
Subject: [PATCH 04/31] mm: vmstat: Prepare to protect against concurrent isolated cpuset change
Date: Wed,  5 Nov 2025 22:03:20 +0100
Message-ID: <20251105210348.35256-5-frederic@kernel.org>
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

The HK_TYPE_DOMAIN housekeeping cpumask will soon be made modifiable at
runtime. In order to synchronize against vmstat workqueue to make sure
that no asynchronous vmstat work is pending or executing on a newly made
isolated CPU, target and queue a vmstat work under the same RCU read
side critical section.

Whenever housekeeping will update the HK_TYPE_DOMAIN cpumask, a vmstat
workqueue flush will also be issued in a further change to make sure
that no work remains pending after a CPU has been made isolated.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 mm/vmstat.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/mm/vmstat.c b/mm/vmstat.c
index bb09c032eecf..7afb2981501f 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -2135,11 +2135,13 @@ static void vmstat_shepherd(struct work_struct *w)
 		 * infrastructure ever noticing. Skip regular flushing from vmstat_shepherd
 		 * for all isolated CPUs to avoid interference with the isolated workload.
 		 */
-		if (cpu_is_isolated(cpu))
-			continue;
+		scoped_guard(rcu) {
+			if (cpu_is_isolated(cpu))
+				continue;
 
-		if (!delayed_work_pending(dw) && need_update(cpu))
-			queue_delayed_work_on(cpu, mm_percpu_wq, dw, 0);
+			if (!delayed_work_pending(dw) && need_update(cpu))
+				queue_delayed_work_on(cpu, mm_percpu_wq, dw, 0);
+		}
 
 		cond_resched();
 	}
-- 
2.51.0


