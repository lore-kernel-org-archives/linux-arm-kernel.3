Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B659C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zX6oE4JMTzNjx3EDIF+YBoN0OI0vIMt2+Gqe1CNAmzU=; b=3+K0pS3AlOzk+fnOGdzjb/+MS/
	xmDOyE61L/6/MejrVbyRQXnuOTVze6z6TRk9idjXb7NZvll6EwfUEyXYmZwXqJ1Mw46tTM1YbeuuC
	gvzy/7AufAWMtcNfB+GekVCR5Xs9l5DAwQOFLjEhvn6p+CKfVzrs3swnV5f0MUDDwkXfYHbUAk0y5
	M0CLDjrphqZFoJ+vq0S/JPPSU/vifvzzZzfSXzI+jMC6Ey8o3rPpAbyCE6Hf18FrJfncI/kbj+GNv
	gliUhuPY7sw3cF/pafwB72LvyJ9LmOdHDX/OwrKNI7Bf2Rp8nMmBDWDa78f7VsO7HeQSNtWkLcxMe
	QBJRd+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JVs-0000000C1nc-1jGz;
	Wed, 09 Sep 2026 14:43:00 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JVq-0000000C1mX-1YGt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:42:59 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c253425b253so898942366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788964976; cv=none;
        d=google.com; s=arc-20260327;
        b=apwnerL+nSbV1PIVlCRQqRQ0pF7ZZLQc3BY79Ej8q5a9IpgsBuRS4GKQZGDMvUTzQk
         M+9hQOcOFsk25xDmNaYOKAyS+kyzFy9Q2fhbmikK1Z6GJNhTpvauG2h5FO1NkV5g2vPF
         GI+zj3PRtmbSzX+Q5DROngrUYqZ6rSYfxY1Rjjuj7c7S9vgJunOXfIH08oisHJQ4r8ox
         3Viazqhe/PqzXMnAchGNPVuSRSLsYrZSR85fMyXwAwTXvNKbmz8Z3Jr7Qc409zKY0Tt/
         6/w3XUJxv37nDD5LrqIMM8vDRzayu8EcPDGakV5IWaNxFIlym5FqhvsQUafCx1Ue13CH
         LGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zX6oE4JMTzNjx3EDIF+YBoN0OI0vIMt2+Gqe1CNAmzU=;
        fh=5QXXbkp2jt5CDTTlpsKsYJB63rS4wXUNPgzOL8q9+xc=;
        b=sfStvLu6OXz6QpWz4VdPuD6CNZMo0iI+FJd0fkVef7pk9L/sV15q2cbCiJbpqgHYHD
         LbOhuyF1a2zFaeGcnZyqTiBURkIWB3cAPuoBnWlZstdorpWZUDd7eJZ3XJddQMceudme
         aiXzfZWmSSfbkhD7rg+t9ACQJLTGm2RwIrzeEOShhXGKwM9QLM5Ko8k2g7SSBeRun95x
         w5ZT45LYWu8blHWVLQAOfIP6pUUO5HzwyuBrwSDkct0KhIiOf2Wu+Vjf49B7KRT64rTs
         TBRrvds8B4kVu+ocn2ER/tDCtvs7iQNLWqJ+Ip8oDaOC4QKv/BrhP44DPFWZGptWNR9R
         F5Xw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788964976; x=1789569776; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zX6oE4JMTzNjx3EDIF+YBoN0OI0vIMt2+Gqe1CNAmzU=;
        b=xmoGLVhZ3Vlt4zzTynYvzVUFA5mgBMFMv5XDkWyO1eTeJi8Z88h9e6tbEJFeXOiVUo
         QYgXU68yOZmUSZYJNzFfYELpXyzsiuciKGJ3G5Dep89KlaKOuzSo+tvly+4oEaWfXMyM
         qQeF8eXIbWHHT9B56xvE1m8rn7+YFu7uPt7dkqwzZJaKabjUjvkUNGWPSwkiJJJQbF2v
         9LkyOKKojWAFrJyzoxBMEI4qpC8CV7KrejiQ4rRyXS0v3N3iqHtkPD5qy80BXcEGkrNo
         vpkLdindtQBMo+PV9PXw2FqNXtSVqeX4oUM3jA81BeCg0UyTJ726JdIxv8/ycGlxsIxB
         A8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964976; x=1789569776;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zX6oE4JMTzNjx3EDIF+YBoN0OI0vIMt2+Gqe1CNAmzU=;
        b=she0V7nB72MxonC4hbFd2UZgUUydHXoOPGlyWPmr+NLjbPOQoNFbFad20Z3UB9PCDd
         jB6HbRdF1aC7wMIufC2XVOk4MhzpNHzkYDwC2peJGzbPPJaK1AGTWBX7PD0of8K+US2v
         ELeVQ+qMv/HXlq0ZAS9+uVdKyqCmi2EvZAF5okx7884XlBDs8o6BElRe1R562dTQnUnp
         9H6HG5b3iDaHyucPnYFxRN5lM+lTpK7DqmIJLA7DkwdzMPsRCZd/b65ZS3ldDxCoQjbr
         Opd5dUE5YRcN99dZ6vHa/oTaIs+f9nCloimPYc31EJCcqGzGPLE6JUeTqgf1qtee9f5a
         A3Ug==
X-Forwarded-Encrypted: i=1; AKwUvBx9U888XXV2qfobsVAapQ6Vu03XsTUDZyrk1UMX1HMHkko5ik9f/t5VfaMbBuuEQHjqi/OuFe15hXgP9WBgC8AM@lists.infradead.org
X-Gm-Message-State: AFuF++lOnO3pLG/2NEvE8ZK52V573PQ1oby/NjSrzZCWM8xYCDQNF0RZ
	LJRBYleEhGVS9vAl1hv7Z7+JmxQOBxwvMMd8lt7cISVThXx86+adTcTq9LSZpNFQ524wrPXhvEj
	0JSYqEO1vb0jCXE1BlF6VRwhUE44DYcSf1ju8VXOmTg==
X-Gm-Gg: AYBFou0K/JkMJLVyqGFsmkkAMtqhdKfMr010E4gXOedq6gqhCpbKJZ+gILzg2xwDui2
	pyZjHwOcivUMWRWCqlN3cOviUPpmcvOG8GnS4nD5FAlDxARdr34JfWGihQ+9UEGJbbsSLnNl8Ni
	SBvaCCRKGUskv2kHiTIxFgZEZYi5Q65/Ia30p+Zx+R/eDkx5dOaxoqzWtdVxMh//T3rA3eXB3yE
	J7lJG1gDaP2naJMo5kGyU37Zi9MJgmoqAPJWC96IElRQmEbQ0dtcyrByHnhgt1nFj0YIq1eOQrV
	6Ts/6baRGfUxHMUiwaQjLqzv2WRvORtT6ZepPQbPM5Cfm/p2/bYPTywEDJGaVf7JSgw2U31RD+V
	ZaNDRiC3vQQqk
X-Received: by 2002:a17:907:805:b0:c25:2c70:50ed with SMTP id
 a640c23a62f3a-c260c6ab6c4mr1433834966b.5.1788964975840; Wed, 09 Sep 2026
 07:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260908082345.103087-1-arighi@nvidia.com> <20260908082345.103087-3-arighi@nvidia.com>
In-Reply-To: <20260908082345.103087-3-arighi@nvidia.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 9 Sep 2026 16:42:44 +0200
X-Gm-Features: AcwNN1WUvcq4choY-C1_blVRgCRrlhEispGupqnG6SrJ3Mcc_nmksOnFuJ0lc98
Message-ID: <CAKfTPtAQh6ZndkHC+njYvX0hoDafaC+PX2EBfafDumTHvvgFcg@mail.gmail.com>
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle selection
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Mark Rutland <mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>, 
	Breno Leitao <leitao@debian.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_074258_499294_9410DE28 
X-CRM114-Status: GOOD (  33.64  )
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

On Tue, 8 Sept 2026 at 10:24, Andrea Righi <arighi@nvidia.com> wrote:
>
> POWER7 and NVIDIA Olympus use SD_ASYM_PACKING at the shared-capacity SMT
> level to order hardware threads. Idle CPU selection does not consult
> that order, so a task can wake on an arbitrary sibling and remain there
> until load balancing corrects the placement. On these systems, that
> initial choice can prevent the core from entering its preferred
> lower-thread resource mode and cause a large and persistent performance
> loss.
>
> When idle selection finds an available CPU in an SMT core, choose the
> highest-priority available sibling. On SMT2 Olympus this only changes
> selection on fully idle cores. A partially idle core has only one
> available CPU. On wider SMT systems such as POWER7, it also fills
> available siblings in priority order while the core is partially busy.
>
> Apply the preference to idle-core and idle-CPU scans,
> asymmetric-capacity scans, target, previous, recently-used CPU fast
> paths and the slow path. Inspect the lowest scheduling domain directly,
> but require both CPUs to share its span because isolcpus can split
> hardware siblings across scheduling domains.
>
> Keep physical-core capacity selection independent from SMT sibling
> ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
> maximum capacities, then SD_ASYM_PACKING selects the preferred available
> sibling inside the chosen core, whose siblings continue to share equal
> capacity.
>
> Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> ---
>  kernel/sched/fair.c     | 85 ++++++++++++++++++++++++++++++++---------
>  kernel/sched/sched.h    |  6 +++
>  kernel/sched/topology.c | 36 +++++++++++++++++
>  3 files changed, 110 insertions(+), 17 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b8bd308c2d5b1..37837c36288a0 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8587,6 +8587,35 @@ static inline bool test_idle_cores(int cpu)
>         return false;
>  }
>
> +/*
> + * Redirect a CPU to a higher-priority available sibling in its SMT domain,
> + * subject to task affinity.
> + */
> +static inline int select_idle_smt_cpu(struct task_struct *p, int cpu)
> +{
> +       struct sched_domain *sd;
> +       int best = cpu;
> +       int sibling;
> +
> +       if (!sched_smt_asym_active())

I wonder if it's worth creating a new static key. All other pieces
related to asym packing use sched_smt_active() to opt out the related
code

Other than that looks good to me

> +               return cpu;
> +
> +       sd = rcu_dereference_all(cpu_rq(cpu)->sd);
> +       if (!sd || !(sd->flags & SD_SHARE_CPUCAPACITY) ||
> +           !(sd->flags & SD_ASYM_PACKING))
> +               return cpu;
> +
> +       for_each_cpu_and(sibling, sched_domain_span(sd), p->cpus_ptr) {
> +               if (sibling == best || !choose_idle_cpu(sibling, p))
> +                       continue;
> +
> +               if (sched_asym_prefer(sibling, best))
> +                       best = sibling;
> +       }
> +
> +       return best;
> +}
> +
>  /*
>   * Scans the local SMT mask to see if the entire core is idle, and records this
>   * information in sd_balance_shared->has_idle_cores.
> @@ -8971,7 +9000,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>
>         if (choose_idle_cpu(target, p) &&
>             asym_fits_cpu(task_util, util_min, util_max, target))
> -               return target;
> +               goto select_smt_priority;
>
>         /*
>          * If the previous CPU is cache affine and idle, don't be stupid:
> @@ -8981,8 +9010,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>             asym_fits_cpu(task_util, util_min, util_max, prev)) {
>
>                 if (!static_branch_unlikely(&sched_cluster_active) ||
> -                   cpus_share_resources(prev, target))
> -                       return prev;
> +                   cpus_share_resources(prev, target)) {
> +                       target = prev;
> +                       goto select_smt_priority;
> +               }
>
>                 prev_aff = prev;
>         }
> @@ -9000,7 +9031,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>             prev == smp_processor_id() &&
>             this_rq()->nr_running <= 1 &&
>             asym_fits_cpu(task_util, util_min, util_max, prev)) {
> -               return prev;
> +               target = prev;
> +               goto select_smt_priority;
>         }
>
>         /* Check a recently used CPU as a potential idle candidate: */
> @@ -9014,8 +9046,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>             asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
>
>                 if (!static_branch_unlikely(&sched_cluster_active) ||
> -                   cpus_share_resources(recent_used_cpu, target))
> -                       return recent_used_cpu;
> +                   cpus_share_resources(recent_used_cpu, target)) {
> +                       target = recent_used_cpu;
> +                       goto select_smt_priority;
> +               }
>
>         } else {
>                 recent_used_cpu = -1;
> @@ -9037,7 +9071,11 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>                  */
>                 if (sd) {
>                         i = select_idle_capacity(p, sd, target);
> -                       return ((unsigned)i < nr_cpumask_bits) ? i : target;
> +                       if ((unsigned int)i < nr_cpumask_bits) {
> +                               target = i;
> +                               goto select_smt_priority;
> +                       }
> +                       return target;
>                 }
>         }
>
> @@ -9050,14 +9088,18 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>
>                 if (!has_idle_core && cpus_share_cache(prev, target)) {
>                         i = select_idle_smt(p, sd, prev);
> -                       if ((unsigned int)i < nr_cpumask_bits)
> -                               return i;
> +                       if ((unsigned int)i < nr_cpumask_bits) {
> +                               target = i;
> +                               goto select_smt_priority;
> +                       }
>                 }
>         }
>
>         i = select_idle_cpu(p, sd, has_idle_core, target);
> -       if ((unsigned)i < nr_cpumask_bits)
> -               return i;
> +       if ((unsigned int)i < nr_cpumask_bits) {
> +               target = i;
> +               goto select_smt_priority;
> +       }
>
>         /*
>          * For cluster machines which have lower sharing cache like L2 or
> @@ -9065,12 +9107,19 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>          * first. But prev_cpu or recent_used_cpu may also be a good candidate,
>          * use them if possible when no idle CPU found in select_idle_cpu().
>          */
> -       if ((unsigned int)prev_aff < nr_cpumask_bits)
> -               return prev_aff;
> -       if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
> -               return recent_used_cpu;
> +       if ((unsigned int)prev_aff < nr_cpumask_bits) {
> +               target = prev_aff;
> +               goto select_smt_priority;
> +       }
> +       if ((unsigned int)recent_used_cpu < nr_cpumask_bits) {
> +               target = recent_used_cpu;
> +               goto select_smt_priority;
> +       }
>
>         return target;
> +
> +select_smt_priority:
> +       return select_idle_smt_cpu(p, target);
>  }
>
>  /**
> @@ -9747,8 +9796,10 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>         }
>
>         /* Slow path */
> -       if (unlikely(sd))
> -               return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> +       if (unlikely(sd)) {
> +               new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> +               return select_idle_smt_cpu(p, new_cpu);
> +       }
>
>         /* Fast path */
>         if (wake_flags & WF_TTWU)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 6c3ad70e58b8e..568cb1ed2dd6b 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2240,6 +2240,7 @@ DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
>  DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
>
>  extern struct static_key_false sched_asym_cpucapacity;
> +extern struct static_key_false sched_smt_asym_packing;
>  extern struct static_key_false sched_cluster_active;
>
>  static __always_inline bool sched_asym_cpucap_active(void)
> @@ -2247,6 +2248,11 @@ static __always_inline bool sched_asym_cpucap_active(void)
>         return static_branch_unlikely(&sched_asym_cpucapacity);
>  }
>
> +static __always_inline bool sched_smt_asym_active(void)
> +{
> +       return static_branch_unlikely(&sched_smt_asym_packing);
> +}
> +
>  struct sched_group_capacity {
>         atomic_t                ref;
>         /*
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 0248227d983a7..06c40eb5932af 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -683,8 +683,24 @@ DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
>  DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
>
>  DEFINE_STATIC_KEY_FALSE(sched_asym_cpucapacity);
> +DEFINE_STATIC_KEY_FALSE(sched_smt_asym_packing);
>  DEFINE_STATIC_KEY_FALSE(sched_cluster_active);
>
> +static bool has_asym_smt_domain(int cpu)
> +{
> +       struct sched_domain *sd;
> +
> +       for_each_domain(cpu, sd) {
> +               if (!(sd->flags & SD_SHARE_CPUCAPACITY))
> +                       break;
> +
> +               if (sd->flags & SD_ASYM_PACKING)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  static void update_top_cache_domain(int cpu)
>  {
>         struct sched_domain_shared *sds = NULL;
> @@ -3084,6 +3100,7 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
>         struct rq *rq = NULL;
>         int i, ret = -ENOMEM;
>         bool has_asym = false;
> +       bool has_asym_smt = false;
>         bool has_cluster = false;
>
>         if (WARN_ON(cpumask_empty(cpu_map)))
> @@ -3202,6 +3219,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
>
>                 cpu_attach_domain(sd, d.rd, i);
>
> +               if (has_asym_smt_domain(i))
> +                       has_asym_smt = true;
> +
>                 if (lowest_flag_domain(i, SD_CLUSTER))
>                         has_cluster = true;
>         }
> @@ -3210,6 +3230,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
>         if (has_asym)
>                 static_branch_inc_cpuslocked(&sched_asym_cpucapacity);
>
> +       if (has_asym_smt)
> +               static_branch_inc_cpuslocked(&sched_smt_asym_packing);
> +
>         if (has_cluster)
>                 static_branch_inc_cpuslocked(&sched_cluster_active);
>
> @@ -3310,11 +3333,24 @@ int __init sched_init_domains(const struct cpumask *cpu_map)
>  static void detach_destroy_domains(const struct cpumask *cpu_map)
>  {
>         unsigned int cpu = cpumask_any(cpu_map);
> +       bool has_asym_smt = false;
>         int i;
>
> +       rcu_read_lock();
> +       for_each_cpu(i, cpu_map) {
> +               if (has_asym_smt_domain(i)) {
> +                       has_asym_smt = true;
> +                       break;
> +               }
> +       }
> +       rcu_read_unlock();
> +
>         if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
>                 static_branch_dec_cpuslocked(&sched_asym_cpucapacity);
>
> +       if (has_asym_smt)
> +               static_branch_dec_cpuslocked(&sched_smt_asym_packing);
> +
>         if (static_branch_unlikely(&sched_cluster_active))
>                 static_branch_dec_cpuslocked(&sched_cluster_active);
>
> --
> 2.55.0
>

