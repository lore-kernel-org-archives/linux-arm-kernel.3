Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D85DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vvv1sBUaBjcEUFUZGnIymSGGot8dFYipkz2vCCdspeg=; b=cJX8q6gcbdQsPqJFLrp2m6XKMi
	VgIrq6pOqjGCWoWtC+lZaBZMGbHmRjg+vlR4GMjNDLia67uR0JmRkyvuU4S7GszG+8jkXimPVmbbT
	ob2QHo2H3JSIbcnYK1RJ7fEt4Xf6weTn0iVQu7Lc4Ng6SSGSgDyGM4GToAEKItDOTV99E/I9LUsJ4
	/Yd7f0039pGaSYiWGuNVjQ7+lBiHUopO6j6SYtR+rHIp7y7qWHM8PlEl1HFw5Abyc74r+ofWguCKI
	URILuMQENXpKNM7ASlkyaKd2H/3RzqVyZreQHW6LqxkAMjIYNkCMT0MMjDFVDEvXs1LK19oD65uB/
	tAUCluKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhJR-00000009z05-44eN;
	Wed, 19 Aug 2026 14:30:41 +0000
Received: from mta-64-228.siemens.flowmailer.net ([185.136.64.228])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhJP-00000009yyf-2gJ6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:30:41 +0000
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260819143033e671f4cd9c00020775
        for <linux-arm-kernel@lists.infradead.org>;
        Wed, 19 Aug 2026 16:30:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Vvv1sBUaBjcEUFUZGnIymSGGot8dFYipkz2vCCdspeg=;
 b=QVtxtt6MaUFxp1ZH6eI+kErHX2u5GQOB9t6Xmhg/I+9OPexC3uPKmQZg0ZDD2Dk4ISPW6j
 oOMnQx18jh8IyucabgFrayd4vxBC9nHrwe6ucjxiU010Ep/V9QuDxLVsPG5mpSJLLzQQ2qey
 +TerQIBTfK0X1gf5rbIgT0CuKkp2cagerI8MxgurCS64y8jZRCWAERtNwe2LuXpDJMU/clcu
 qBR/doqvchL5NmXqbV0w01cohq0NJAG5uexVi3cu5oWp9xOpVnHAvFmXhGwG9TuFuID2u/HZ
 jN+fkIof+zI4Wx/kDJ/OzYqXDQF3yQ0RPBhsLv+sVxarCq3nzgTlVBnw==;
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Date: Wed, 19 Aug 2026 16:30:30 +0200
Subject: [PATCH RFC 1/3] cpumask: Honor irq_default_affinity in
 cpumask_local_spread()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-1-3f79a99cadaf@siemens.com>
References: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
In-Reply-To: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
 Florian Bezdeka <florian.bezdeka@siemens.com>
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_073040_205431_D2984C2D 
X-CRM114-Status: GOOD (  13.02  )
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

Many drivers call cpumask_local_spread() to spread IRQs to several
CPUs, mainly to get best performance and balance CPU load. For
realtime (PREEMPT_RT) and other cpu-isolating workloads the old
implementation was triggering an IRQ placement problem. IRQs were
targeting CPUs that were isolated for those sensitive workloads.

Userland will tell the kernel about the desired IRQ configuration
for new interrupts by writing a proper cpumask to
/proc/irq/default_smp_affinity. This cpu mask has to be honored to
avoid IRQ noise on isolated cores.

The default for irq_default_affinity is "all CPUs". So all CPUs will
be taken into account for spreading when userland did not configure
something special.
---
 lib/cpumask.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/cpumask.c b/lib/cpumask.c
index 5adb9874fbd0f5a42ea8cd9e6c3729a70599781f..73e7b60a9201174f83df6067effbe7d1889dcdb9 100644
--- a/lib/cpumask.c
+++ b/lib/cpumask.c
@@ -6,6 +6,7 @@
 #include <linux/export.h>
 #include <linux/memblock.h>
 #include <linux/numa.h>
+#include <linux/interrupt.h>
 
 /* These are not inline because of header tangles. */
 #ifdef CONFIG_CPUMASK_OFFSTACK
@@ -81,8 +82,9 @@ void __init free_bootmem_cpumask_var(cpumask_var_t mask)
  * @i: index number
  * @node: local numa_node
  *
- * Return: online CPU according to a numa aware policy; local cpus are returned
- * first, followed by non-local ones, then it wraps around.
+ * Return: online CPU according to the default IRQ affinity and a numa aware
+ * policy; local cpus are returned first, followed by non-local ones, then it
+ * wraps around.
  *
  * For those who wants to enumerate all CPUs based on their NUMA distances,
  * i.e. call this function in a loop, like:
@@ -110,9 +112,9 @@ unsigned int cpumask_local_spread(unsigned int i, int node)
 	unsigned int cpu;
 
 	/* Wrap: we always want a cpu. */
-	i %= num_online_cpus();
+	i %= cpumask_weight(irq_default_affinity);
 
-	cpu = sched_numa_find_nth_cpu(cpu_online_mask, i, node);
+	cpu = sched_numa_find_nth_cpu(irq_default_affinity, i, node);
 
 	WARN_ON(cpu >= nr_cpu_ids);
 	return cpu;

-- 
2.55.0


