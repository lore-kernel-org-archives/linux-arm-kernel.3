Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE9BC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHNGtvXmI1lmcYGaqQf2LJdsupyf9eDfU/t8/RKu5uQ=; b=gRAiK+UarzMLBPCl1JAqxQQ5mc
	2mr9xCHiYdVYV2eWPhUZkkf5lk70a/mbgZ2REuYNk5F3yhITdTh9QM0d3AcW8+QxWae3LQd7GEknC
	6L5jEoBrC+ZSDXTSHWi76H5weQhjmhn4UIT5GqQFrLYyYl0VJ1ih/aCShk9zV/quypwCKQpH5VGo7
	GGlhvgeUkk/TUEyBf8Q+uOiubB2Q9OuTgP1q75/LIKYrDC3rv+IFR9Kn5ApVEDsMeiGRJvOWpxMjc
	2gBvpIeKEkR0GOaH2ZaYb3Hkagit3tsyHp/Qj5jbnj6zioouta2UR1LnQssUli8x/AN6xE7Y/MlYr
	Bs7To2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Ym-00000008ljU-3zjZ;
	Wed, 29 Jul 2026 17:59:16 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Yh-00000008liX-2q2U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:59:16 +0000
X-Forwarded-Encrypted: i=1; AHgh+RqSylO+rc+m2Jaxh7KISEtjMi9ZphBOF2LKygyffGaKTAhzuwJLMQfWn71/nbts98NXODxYC1tlBBAfjToTWso4@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785347945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sHNGtvXmI1lmcYGaqQf2LJdsupyf9eDfU/t8/RKu5uQ=;
	b=u9Nc2NJf6+WPY8IrMB5KDvxUwMVV0AlQGEKIH/Rr6MpVUBNHILZL5JUThwUz/tEqxvFpUo
	X6sreeEx1o3lBMowe/JpSpm5BZkEiQ62iEH7OY+Nc8mV+UGfdfCKitJokmW6OV3rZR2w8J
	Wxd7qjjjg3CCEdJNRqPjWd2y0JSa2SY=
X-Gm-Message-State: AOJu0Yw3NhW4orOdXFN6Hv6RPwZySNwynJaQQuD9lU5THqpAOSfsiIae
	JmZDJhQRVpXF7mpFCJ5qpuX0u7TsorytbNtv4xyyb5j1EAMb8goAKhYgsC09SVYV1msLlhd9xDn
	xKF0tHYp/UsMnZgmdr3GCydRONJ/YoAmhZJOm4qkw
X-Received: by 2002:ac8:7fc7:0:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-52b34cf718bmr4279531cf.0.1785347937591; Wed, 29 Jul 2026
 10:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-13-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-13-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 18:58:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyBNtRHMGp9LvGfrEHC+WggA_B5hQq+Yf35+zNBfNxG1A@mail.gmail.com>
X-Gm-Features: AUfX_mxD75QzlQhuaQNGxQQP31Q-APsfSKiFOjN07yFBd2o-UYKBSVA4waq0SzE
Message-ID: <CA+EHjTyBNtRHMGp9LvGfrEHC+WggA_B5hQq+Yf35+zNBfNxG1A@mail.gmail.com>
Subject: Re: [PATCH v9 13/16] KVM: arm64: PMU: Pass the target CPU to kvm_pmu_probe_armpmu()
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_105911_996742_75FE830B 
X-CRM114-Status: GOOD (  27.84  )
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

On Mon, 20 Jul 2026 at 06:39, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> kvm_pmu_probe_armpmu() currently samples the current CPU internally,
> which ties the helper to default PMU selection.
>
> Move that policy to kvm_arm_set_default_pmu() by passing
> raw_smp_processor_id() from the caller, and make the helper search for
> the pPMU covering an explicit CPU. Move the helper above
> kvm_pmu_create_perf_event() so later code can reuse it when creating
> PMU events for a VCPU's current pCPU.
>
> This preserves the existing default PMU selection behavior while
> preparing fixed-counters-only mode to select a pPMU at runtime.
>
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/pmu-emul.c | 72 +++++++++++++++++++++++------------------------
>  1 file changed, 35 insertions(+), 37 deletions(-)
>
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index 27db8877f96e..78611eaecca2 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -682,6 +682,23 @@ static int kvm_map_pmu_event(struct arm_pmu *pmu, unsigned int eventsel)
>         return eventsel;
>  }
>
> +static struct arm_pmu *kvm_pmu_probe_armpmu(int cpu)
> +{
> +       struct arm_pmu_entry *entry;
> +       struct arm_pmu *pmu;
> +
> +       guard(rcu)();
> +
> +       list_for_each_entry_rcu(entry, &arm_pmus, entry) {
> +               pmu = entry->arm_pmu;
> +
> +               if (cpumask_test_cpu(cpu, &pmu->supported_cpus))
> +                       return pmu;
> +       }
> +
> +       return NULL;
> +}
> +
>  /**
>   * kvm_pmu_create_perf_event - create a perf event for a counter
>   * @pmc: Counter context
> @@ -811,42 +828,6 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
>         list_add_tail_rcu(&entry->entry, &arm_pmus);
>  }
>
> -static struct arm_pmu *kvm_pmu_probe_armpmu(void)
> -{
> -       struct arm_pmu_entry *entry;
> -       struct arm_pmu *pmu;
> -       int cpu;
> -
> -       guard(rcu)();
> -
> -       /*
> -        * It is safe to use a stale cpu to iterate the list of PMUs so long as
> -        * the same value is used for the entirety of the loop. Given this, and
> -        * the fact that no percpu data is used for the lookup there is no need
> -        * to disable preemption.
> -        *
> -        * It is still necessary to get a valid cpu, though, to probe for the
> -        * default PMU instance as userspace is not required to specify a PMU
> -        * type. In order to uphold the preexisting behavior KVM selects the
> -        * PMU instance for the core during vcpu init. A dependent use
> -        * case would be a user with disdain of all things big.LITTLE that
> -        * affines the VMM to a particular cluster of cores.
> -        *
> -        * In any case, userspace should just do the sane thing and use the UAPI
> -        * to select a PMU type directly. But, be wary of the baggage being
> -        * carried here.
> -        */
> -       cpu = raw_smp_processor_id();
> -       list_for_each_entry_rcu(entry, &arm_pmus, entry) {
> -               pmu = entry->arm_pmu;
> -
> -               if (cpumask_test_cpu(cpu, &pmu->supported_cpus))
> -                       return pmu;
> -       }
> -
> -       return NULL;
> -}
> -
>  static u64 __compute_pmceid(struct arm_pmu *pmu, bool pmceid1)
>  {
>         u32 hi[2], lo[2];
> @@ -1072,7 +1053,24 @@ static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
>   */
>  int kvm_arm_set_default_pmu(struct kvm *kvm)
>  {
> -       struct arm_pmu *arm_pmu = kvm_pmu_probe_armpmu();
> +       /*
> +        * It is safe to use a stale cpu to iterate the list of PMUs so long as
> +        * the same value is used for the entirety of the loop. Given this, and
> +        * the fact that no percpu data is used for the lookup there is no need
> +        * to disable preemption.
> +        *
> +        * It is still necessary to get a valid cpu, though, to probe for the
> +        * default PMU instance as userspace is not required to specify a PMU
> +        * type. In order to uphold the preexisting behavior KVM selects the
> +        * PMU instance for the core during vcpu init. A dependent use
> +        * case would be a user with disdain of all things big.LITTLE that
> +        * affines the VMM to a particular cluster of cores.
> +        *
> +        * In any case, userspace should just do the sane thing and use the UAPI
> +        * to select a PMU type directly. But, be wary of the baggage being
> +        * carried here.
> +        */
> +       struct arm_pmu *arm_pmu = kvm_pmu_probe_armpmu(raw_smp_processor_id());
>
>         if (!arm_pmu)
>                 return -ENODEV;
>
> --
> 2.55.0
>
>

