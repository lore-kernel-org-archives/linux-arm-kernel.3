Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1E5C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsBJ75Nos/JKeIDPM3xGBy+cj9I+X9kBPg+21akMtHI=; b=ePVxtrqrFkIBRwMLuvJul4RNfw
	DlWrUatmRq7HQvRqj6afcmjjHyFx5iXu4+PmrnscQ0r3eO02+NFLiuG7EZtqB+l0il3+ao4cTTR6h
	10NqiyfX060EV1BSLOlpzHyHXCeBkPGAtaKIk4hqCWBGmy6kpSkuw6rXOAek0l7sJVaf0K3UrC202
	Q1du4SsvKtSLtCLiXhuo9UEKf1Opg4YCpXdEEvuPBE+MTia0jbwuZ8XRSAnTkgJVH40FxqMhuSygp
	vyTIY4RMeM1mrpPborKm2k60nRblFBtDj8mRDXgabRv245/4D6faWp+43Eg0IKip8m94wI1fCkRIw
	a8sZ2MIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Bhb-0000000BLvB-2jMo;
	Thu, 17 Sep 2026 12:58:59 +0000
Received: from mail-lr2-x10.google.com ([2a00:1450:4864:38::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BhY-0000000BLui-2Qcu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:58:57 +0000
Received: by mail-lr2-x10.google.com with SMTP id 38308e7fff4ca-3a3156692c6so5649651fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 05:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789649934; x=1790254734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsBJ75Nos/JKeIDPM3xGBy+cj9I+X9kBPg+21akMtHI=;
        b=ZGE40/NG7R4CCcnuNJnsezBvIkugiE5/mw8Q/3hYL+kHdPfhqXd6lrTn+vS9Iv9bjg
         dOmqGrqAVEGhHIzQZrz/7STyXD39H6FTcsvFKg7MofRZ7cVknL5A6REVK+D9FZQP8eU3
         ew+f66v7sinsHcExV8LOSkDS214fpjjYo0kaPLyH9kt6FJtPeeJmGJ9uxHN5B3BvZOyJ
         Q9L9NBuwyXQZzODHSIrF4p159mZSBSG2AI3Gf//MCs4Jp8tyQT2JA9ggJiIg+rVJExdT
         0/AvNU1l4qSQjzkkfvkGWuVBjNjYRVu5AlfdZ+PF1HHsT8s3jMMaUH8swAGEsZp26x92
         udWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649934; x=1790254734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fsBJ75Nos/JKeIDPM3xGBy+cj9I+X9kBPg+21akMtHI=;
        b=GnYmwSWanL1TS1zYs9v8yhC0ffrdxbkRtb0VDZEYb569FD5hzryMtkt3SPaZjaHDuj
         XCCv3VQXiNtlxXCUeH+kyn/bBy84I0sUzeQglc5HS8ixO6K4cV6eqFj2Q33jNj34Wr/N
         Mj+bJ3m1SXaQ+zU/rOTh3wyUYjT9x+MMCg8lqZYe0ZmpTnZ1SxszZFHZeNYA80itGYWf
         ZIFi0yss1VW2lX2WrhqHKRjnxyywCsM8awfzZ3IvGc3jeCz0mlsYJQ6RqONpFHG4M/LA
         lCVYSbTsFCOplD/mJ+SxyGEqsQxa9A9QIvaqhJlQWTvuxPaso5QD6fPHThbQknMlOasf
         bvbQ==
X-Gm-Message-State: AFuF++lVaenqc3RC0JcmueHl60zWDdUE4pfXHYHeeNlpPpxwHcZuyh43
	yxR7nID5HLZQdKfVNWXtyDHC0EMrbyw+qgltEY8Rbu07zcePe4j4NjvEGnwtRplj6p8=
X-Gm-Gg: AYBFou1yOqInkFf3gHI+KGCq5ZUx6xFR2YJ+cIR+JlS2PnxwYIlYIAi6ZUusBWQCDeN
	eS+MtP7DALVF2Z+RB8M/fDtLzr7lbpCOaEgWW2uMcQJ4Bj0Ct+wcXcFxR47pUyOF6XGmEbSfh6g
	kSL5c9pYrJj72FzgXjAqtBJ4QZIu6hNrps6E1RcJvTcYFxmgnJ0pOBNBZrS+d7HPh3I3qh9fG7t
	Gw0Ptq7878FjEl8nwcGwKb+buKHsyYHP1rRm9g1xGpWMUuAu1TFhIw/Cs1escn3hZbEGabFrdf/
	twM139CcmJp0th8VnM+ZUrZl6g1S2Kn/gw6TxFZn4hO/xbEcvTHvhYCvarf0a0KbWzLHCLQq1md
	eZD+2UownzfplTjLRdBG+RfqMsBtDLw7Dt/aROCOrsipLuBVMAx+jcocauI9yqfwG0+AZQOhGov
	Lwo0qSjwk8uVlshN46ozx63JREgqtl2g2983njBrAsT0sQiAOcBjOKGbw4RxsvjmnYQydae046r
	vWatFDl
X-Received: by 2002:a05:600c:83c9:b0:49e:7caa:e7b2 with SMTP id 5b1f17b1804b1-49eb733800amr66060375e9.29.1789649483005;
        Thu, 17 Sep 2026 05:51:23 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fbd204d89sm86555015e9.3.2026.09.17.05.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:51:22 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Thu, 17 Sep 2026 14:51:11 +0200
Message-ID: <20260917125112.2283-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917125112.2283-1-okerixx@gmail.com>
References: <20260917125112.2283-1-okerixx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_055856_657294_873BB632 
X-CRM114-Status: GOOD (  16.92  )
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

arch_freq_get_on_cpu() computes the product of the frequency scale and
the reference frequency as a u64, but assigns it to an unsigned int
before shifting it back down:

	freq = scale * arch_scale_freq_ref(cpu);
	freq >>= SCHED_CAPACITY_SHIFT;

The product is truncated to 32 bits before the shift, so the result
wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
i.e. 4194304 kHz.

On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
the CPU demonstrably runs at the boost frequency: a fixed workload
completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
kHz, matching the 1.171 frequency ratio.

Use cap_scale(), which the scheduler already has for exactly this
capacity scaling, so the multiply and the shift stay in 64 bits and
only the final value is narrowed by the return type. Move the macro
from the scheduler's private header to <linux/topology.h> so it can be
used outside kernel/sched.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 arch/arm64/kernel/topology.c | 5 +----
 include/linux/topology.h     | 2 ++
 kernel/sched/sched.h         | 2 --
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f..07b8c497c9e6 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -186,7 +186,6 @@ int arch_freq_get_on_cpu(int cpu)
 	struct amu_cntr_sample *amu_sample;
 	unsigned int start_cpu = cpu;
 	unsigned long last_update;
-	unsigned int freq = 0;
 	u64 scale;
 
 	if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
@@ -245,9 +244,7 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
-	return freq;
+	return cap_scale(arch_scale_freq_ref(cpu), scale);
 }
 
 static void amu_fie_setup(const struct cpumask *cpus)
diff --git a/include/linux/topology.h b/include/linux/topology.h
index 709a2dcf4c73..0a4ee12a98d5 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -351,4 +351,6 @@ static inline unsigned long topology_get_cpu_scale(int cpu)
 
 void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);
 
+#define cap_scale(v, s)		((v)*(s) >> SCHED_CAPACITY_SHIFT)
+
 #endif /* _LINUX_TOPOLOGY_H */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c3ad70e58b8..45796fccdc84 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -236,8 +236,6 @@ static inline int task_has_dl_policy(struct task_struct *p)
 	return dl_policy(p->policy);
 }
 
-#define cap_scale(v, s)		((v)*(s) >> SCHED_CAPACITY_SHIFT)
-
 static inline void update_avg(u64 *avg, u64 sample)
 {
 	s64 diff = sample - *avg;
-- 
2.55.0


