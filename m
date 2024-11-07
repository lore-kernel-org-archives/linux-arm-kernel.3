Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54653D5D689
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 20:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v35HyYfzjB2bG4AOilBZdKULCbIxbvNUBJLvIql+6B0=; b=Z6i4yY/XkUjGIzKBAJBr8Uw4oD
	L6ownW1kKw17HLitZnzLXLj7VOvomQZ4XJozE/MJ+mE+jxQLVaXpRYZlQ+R18lB1sXI4c8naQDqCs
	9OGQF7WpzdbMQORo7epojEw5/CeuCfRF0HQfN+MHwQ3ZqFWFWHBUTyMr2zOqKdgb+RfO8hDNz6Ohs
	/RVrwkhsvAK+9C6m1c3idXubiYUVjwtcwrDqEhELz3yxoqJ6h4Dyj4Sv0BZpVpbn13NGIcyt9S6jp
	VX+5oSqfRMLHdRtksfUi/fMMcvDWWCtOYtucSzmBhXLoJF7dfN9UuO3ubeXqGUZ7XDrLlaOLQfoGO
	IPHZhUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t996b-00000008EyW-35vE;
	Thu, 07 Nov 2024 20:27:49 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98zm-00000008E43-3BJ5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 20:20:48 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e33152c8225so2940975276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 12:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731010845; x=1731615645; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v35HyYfzjB2bG4AOilBZdKULCbIxbvNUBJLvIql+6B0=;
        b=uAXKv/usErvKVayxi+rurMaj+9CYnP3I4DsySYF+02Hu2BEh9f0O32hPA0WK/kSI0p
         aE90oPm4XHzIFCtZKWS5RfFmwjh9tN3P4eCNftMfx/G5Chs80IWAJfKNvkqygV8uc8es
         5xgSzE4UHn9W7ZVwazquEf8TTX+gUbyCCHnRQakBZBVuUDkhNfqsO8gFg8709lY3G+ze
         mJwZ4oLJuHm2OTXEdFM1UirMwnYS7qaeeHa6KPgVf9RGh04U4UIOONisr6ipOZA8TLqf
         ypmcKGPoNJi3ICdgoB2qD81nSLlB9+NUW1Gu2mBsw+T/YWZcT8MLF5IWq8dvjlhuX3oI
         XcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731010845; x=1731615645;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v35HyYfzjB2bG4AOilBZdKULCbIxbvNUBJLvIql+6B0=;
        b=hFpZxWIBGoQIT+ppV2QAjdvuQYZB72s0gBx/dhtZpenYMABCZGbN/NY7ssypkzWjgZ
         xbVEQURy6D0yOVjEQvEd5FTJD6Lcahi0md8Gq+eBuVMVjOMEyXYfnJ4+xLzXgxnndmmg
         IQBd5jUogCz24lPJFo+d6wukEJhI4l397UIx+a8lbtf0jovuu8FCBIE2aOhTZ8V6LPNB
         rpKiiV+NIlQPhmvtcCBq4hzYg+vgAYNEUYx3lEL1v8CgtszRgLq8hfMwjVC9ITG0vIWW
         eBLWLNENEndYpJ5jy4oqK/iMV1rePsXzwMtyWg3SavG7j/4uEi6Yy2uFxWLx87dn0Oe/
         6NLg==
X-Forwarded-Encrypted: i=1; AJvYcCW05qfKV9cj2x51FSavLlylADawECNX9szQI8UR5ARQdE8tDDQcj6DFn6E8i1+h0+5BWNTqFpKiEgSo8alwDntE@lists.infradead.org
X-Gm-Message-State: AOJu0YzZsfu+mms98WWlkgGy7ZkW5+PbSRkUcTakvDH0gcS6ouSfB98D
	dFlKHJQPFXdFiOz445jwg7k6b90Ba3jtOnAMjKHQJuny7/rotqzSQ6Vf0tdPvGr5T3TzpTVxtkK
	l0g==
X-Google-Smtp-Source: AGHT+IH5+g5PrNVgp5Pr5OTYOBdUbFjFulnS4uSn6ZxFeBhddvMAobpkpn0NbUnR+mioP6ARIrKUFKFKqUg=
X-Received: from yuzhao2.bld.corp.google.com ([2a00:79e0:2e28:6:a4c0:c64f:6cdd:91f8])
 (user=yuzhao job=sendgmr) by 2002:a25:a249:0:b0:e28:e510:6ab1 with SMTP id
 3f1490d57ef6-e337f8faff5mr210276.8.1731010845128; Thu, 07 Nov 2024 12:20:45
 -0800 (PST)
Date: Thu,  7 Nov 2024 13:20:30 -0700
In-Reply-To: <20241107202033.2721681-1-yuzhao@google.com>
Mime-Version: 1.0
References: <20241107202033.2721681-1-yuzhao@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107202033.2721681-4-yuzhao@google.com>
Subject: [PATCH v2 3/6] irqchip/gic-v3: support SGI broadcast
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_122046_823522_9F68D1CA 
X-CRM114-Status: GOOD (  16.26  )
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

GIC v3 and later support SGI broadcast, i.e., the mode that routes
interrupts to all PEs in the system excluding the local CPU.

Supporting this mode can avoid looping through all the remote CPUs
when broadcasting SGIs, especially for systems with 200+ CPUs. The
performance improvement can be measured with the rest of this series
booted with "hugetlb_free_vmemmap=on irqchip.gicv3_pseudo_nmi=1":

  cd /sys/kernel/mm/hugepages/
  echo 600 >hugepages-1048576kB/nr_hugepages
  echo 2048kB >hugepages-1048576kB/demote_size
  perf record -g time echo 600 >hugepages-1048576kB/demote"

With 80 CPUs:
           gic_ipi_send_mask()  bash sys time
  Before:  38.14%               0m10.513s
  After:    0.20%               0m5.132s

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 drivers/irqchip/irq-gic-v3.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index ce87205e3e82..7ebe870e4608 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1322,6 +1322,7 @@ static void gic_cpu_init(void)
 
 #define MPIDR_TO_SGI_RS(mpidr)	(MPIDR_RS(mpidr) << ICC_SGI1R_RS_SHIFT)
 #define MPIDR_TO_SGI_CLUSTER_ID(mpidr)	((mpidr) & ~0xFUL)
+#define MPIDR_TO_SGI_TARGET_LIST(mpidr)	(1 << ((mpidr) & 0xf))
 
 /*
  * gic_starting_cpu() is called after the last point where cpuhp is allowed
@@ -1356,7 +1357,7 @@ static u16 gic_compute_target_list(int *base_cpu, const struct cpumask *mask,
 	mpidr = gic_cpu_to_affinity(cpu);
 
 	while (cpu < nr_cpu_ids) {
-		tlist |= 1 << (mpidr & 0xf);
+		tlist |= MPIDR_TO_SGI_TARGET_LIST(mpidr);
 
 		next_cpu = cpumask_next(cpu, mask);
 		if (next_cpu >= nr_cpu_ids)
@@ -1394,9 +1395,20 @@ static void gic_send_sgi(u64 cluster_id, u16 tlist, unsigned int irq)
 	gic_write_sgi1r(val);
 }
 
+static void gic_broadcast_sgi(unsigned int irq)
+{
+	u64 val;
+
+	val = BIT_ULL(ICC_SGI1R_IRQ_ROUTING_MODE_BIT) | (irq << ICC_SGI1R_SGI_ID_SHIFT);
+
+	pr_devel("CPU %d: broadcasting SGI %u\n", smp_processor_id(), irq);
+	gic_write_sgi1r(val);
+}
+
 static void gic_ipi_send_mask(struct irq_data *d, const struct cpumask *mask)
 {
-	int cpu;
+	int cpu = smp_processor_id();
+	bool self = cpumask_test_cpu(cpu, mask);
 
 	if (WARN_ON(d->hwirq >= 16))
 		return;
@@ -1407,6 +1419,19 @@ static void gic_ipi_send_mask(struct irq_data *d, const struct cpumask *mask)
 	 */
 	dsb(ishst);
 
+	if (cpumask_weight(mask) + !self == num_online_cpus()) {
+		/* Broadcast to all but self */
+		gic_broadcast_sgi(d->hwirq);
+		if (self) {
+			unsigned long mpidr = gic_cpu_to_affinity(cpu);
+
+			/* Send to self */
+			gic_send_sgi(MPIDR_TO_SGI_CLUSTER_ID(mpidr),
+				     MPIDR_TO_SGI_TARGET_LIST(mpidr), d->hwirq);
+		}
+		goto done;
+	}
+
 	for_each_cpu(cpu, mask) {
 		u64 cluster_id = MPIDR_TO_SGI_CLUSTER_ID(gic_cpu_to_affinity(cpu));
 		u16 tlist;
@@ -1414,7 +1439,7 @@ static void gic_ipi_send_mask(struct irq_data *d, const struct cpumask *mask)
 		tlist = gic_compute_target_list(&cpu, mask, cluster_id);
 		gic_send_sgi(cluster_id, tlist, d->hwirq);
 	}
-
+done:
 	/* Force the above writes to ICC_SGI1R_EL1 to be executed */
 	isb();
 }
-- 
2.47.0.277.g8800431eea-goog


