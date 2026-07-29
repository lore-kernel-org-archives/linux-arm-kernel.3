Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B1DC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6VHon7xksdGGcCd1w3LeE4rxQ4JdTn1VUPCXvQGSs4=; b=zOMd0DJdo+XOtYpAFbcIXswsqS
	lt2sbZB0GKVUNpEm5VXCg0Vlq2hUEpEkuDelOapc5hCCkace3n0jFCHXgEBpm6taqr2W/5Sc8deqj
	HnVaSMdF9bWlPe1jL5K67K/WJ7O71fVkQmtvxpS7V9rQF/+rC/n0qLBErWkzwLIEQhIeUhOLdn292
	lZWdCOAlFv5YrzHhzOjn6IIOlH0XnL71UjT/iuVGqf5w79tTc5/KI4Zp9+KeB/7ZM47ohmbMUEs7w
	wvmdM0H7G2rAFKh8hvWdUbSsCSSDUZSPMPZguvLcvn/em2+6Rw2P6RtQ95QqINmJAHvrBvktFkt7g
	oO6iNtNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6VG-00000008SF8-1s0S;
	Wed, 29 Jul 2026 15:47:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6VF-00000008SCz-0Avl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Jul 2026 15:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I6VHon7xksdGGcCd1w3LeE4rxQ4JdTn1VUPCXvQGSs4=; b=SdQTdhZK6bukoR6SK4US+9MQjJ
	NVkwN9b6a6mEph8TMiPgNxghw4JzozCfL3hQFrvhVs00u9bQhBEYy8HvpK29H+PuI6S4VKzc7nUTK
	wc2eapXqyJ7edrqNnC7P+7ByXr90/TWl4yFnVLgoXj+hjcE3ZXWoN7w1zSRxBKjpuwCf3l09jeI4W
	ijsaWeNRO9KO59ktFJozguhTWF0PMk4EMCgTxcQb+Z0VC1fAzMHtmU+Is5rNmIG2DrHnZqcCzkGXs
	ttXVBqpAsX1PXc8Hyr13Vr/ImJBabJ0wt6YACNo63Iu8KTSUR1GAFopnCggYtEQ9ix7HN/MBEnxim
	3tMjsVhw==;
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp6VB-00000005yL4-3gBb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:47:27 +0000
X-Forwarded-Encrypted: i=1; AHgh+RqCEkQmgOxO82AveA7OLGZg2NeYV1iWYMZ/PppK2MySNJo4pUmdCoWAAZ+jXlEg/zfMxlpUYuRqrxEYsOx1O1NR@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785340043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I6VHon7xksdGGcCd1w3LeE4rxQ4JdTn1VUPCXvQGSs4=;
	b=i7NHS2jlKQRyWR0g3OGctc1Gl6CLybsRvRd7cF0pZS3bEMOU7jvVbe8X8qMA/dDbe//uc0
	Z1SlsJSGNgP8YO6Ptp/3FNiXMQGx4j3UvrOcptFLY2J+TfBD8knpls8guqV55EwZjpZpfO
	MvHTwGvd8M+11q7bUrKbg5CkgiEHYgQ=
X-Gm-Message-State: AOJu0Yz7zCbJqZ5/LjnZte2oSSvbv5CSBFmx6+JQpA3ZR7aTHCXY8/pn
	1n+LNsDH57NcZQxd1GXTjAFQimGipvFwde7ct+uUheegilF+tKs11OobNk2Ur0gf9jpFHkphWEo
	T404faVyXHAejYflbwo/49hrTwgN9feUBwT41Lm+P
X-Received: by 2002:a05:622a:2cf:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-52b3514d8b8mr684631cf.7.1785340027562; Wed, 29 Jul 2026
 08:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-6-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-6-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 16:47:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw-nae7rEbt0-gGqLDqFR-snZg5=OMd6JwoY6=LPTYs6Q@mail.gmail.com>
X-Gm-Features: AUfX_mws-bcJkwmI1cxhAAS_5of0TC8PZKSSoA4EmHIto-AN5EE8KREg1_-JeRk
Message-ID: <CA+EHjTw-nae7rEbt0-gGqLDqFR-snZg5=OMd6JwoY6=LPTYs6Q@mail.gmail.com>
Subject: Re: [PATCH v9 06/16] KVM: arm64: PMU: Recreate events after MDCR_EL2 changes
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
X-CRM114-CacheID: sfid-20260729_164726_019864_10960216 
X-CRM114-Status: GOOD (  29.02  )
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

On Mon, 20 Jul 2026 at 06:44, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> MDCR_EL2.HPMN changes which counters are reserved for EL2 and thus which
> enable control, event filter, and overflow width apply. HPMD changes EL2
> filtering, while HLP changes the overflow width and sample period.
>
> The existing guest MDCR_EL2 handling only requests a PMU reload for
> HPME. Reloading enables or disables existing perf events, but does not
> rebuild events whose attributes have become stale. Generic userspace
> writes through KVM_SET_ONE_REG do not request a reload at all.
>
> Route guest writes, userspace writes, and reset through a common helper.
> Mark the vCPU's perf events for recreation when HPMN, HPMD, or HLP
> changes. Consume the marker on the vCPU thread before reprogramming the
> counters, which also preserves counter values and avoids creating events
> on an arbitrary ioctl thread.
>
> Use a setter-only accessor so register restore gains these side effects
> without changing generic reads or rejecting register values.
>
> Fixes: fe827f916662 ("KVM: arm64: nv: Honor MDCR_EL2.HPME")
> Fixes: 8a34979030f6 ("KVM: arm64: nv: Apply EL2 event filtering when in hyp context")
> Fixes: 16535d55e91f ("KVM: arm64: nv: Honor MDCR_EL2.HLP")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Sashiko's comment seems to be worth pursuing, but that's a separate fix.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/pmu-emul.c | 27 +++++++++++++++++++++++++++
>  arch/arm64/kvm/sys_regs.c | 31 +++++++++++++++++++++----------
>  include/kvm/arm_pmu.h     |  3 +++
>  3 files changed, 51 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index 5281d37634a0..9ac5f307ea31 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -17,6 +17,9 @@
>
>  #define PERF_ATTR_CFG1_COUNTER_64BIT   BIT(0)
>
> +#define MDCR_EL2_PMU_RECREATE_MASK     (MDCR_EL2_HPMN | MDCR_EL2_HPMD | \
> +                                        MDCR_EL2_HLP)
> +
>  static LIST_HEAD(arm_pmus);
>  static DEFINE_MUTEX(arm_pmus_lock);
>
> @@ -606,6 +609,21 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val)
>         }
>  }
>
> +void kvm_pmu_handle_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val)
> +{
> +       u64 changed = old ^ val;
> +
> +       /*
> +        * HPMN determines which counters HPMD and HLP apply to. Changes to
> +        * these fields require new perf event filters and sample periods.
> +        */
> +       if (changed & MDCR_EL2_PMU_RECREATE_MASK)
> +               vcpu->arch.pmu.events_need_recreate = true;
> +
> +       if (changed & (MDCR_EL2_HPME | MDCR_EL2_PMU_RECREATE_MASK))
> +               kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
> +}
> +
>  static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
>  {
>         struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
> @@ -899,7 +917,16 @@ u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
>
>  void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu)
>  {
> +       struct kvm_pmu *pmu = &vcpu->arch.pmu;
>         u64 mask = kvm_pmu_implemented_counter_mask(vcpu);
> +       int i;
> +
> +       if (pmu->events_need_recreate) {
> +               for (i = 0; i < KVM_ARMV8_PMU_MAX_COUNTERS; i++)
> +                       kvm_pmu_stop_counter(kvm_vcpu_idx_to_pmc(vcpu, i));
> +
> +               pmu->events_need_recreate = false;
> +       }
>
>         __vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, &=, mask);
>         __vcpu_rmw_sys_reg(vcpu, PMINTENSET_EL1, &=, mask);
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 5d5c579d4579..9e905d9be9f6 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3020,17 +3020,22 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
>         }
>
>         __vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
> -
> -       /*
> -        * Request a reload of the PMU to enable/disable the counters
> -        * affected by HPME.
> -        */
> -       if ((old ^ val) & MDCR_EL2_HPME)
> -               kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
> +       kvm_pmu_handle_mdcr(vcpu, old, val);
>
>         return true;
>  }
>
> +static int set_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
> +                   u64 val)
> +{
> +       u64 old = __vcpu_sys_reg(vcpu, MDCR_EL2);
> +
> +       __vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
> +       kvm_pmu_handle_mdcr(vcpu, old, val);
> +
> +       return 0;
> +}
> +
>  static bool access_ras(struct kvm_vcpu *vcpu,
>                        struct sys_reg_params *p,
>                        const struct sys_reg_desc *r)
> @@ -3177,8 +3182,13 @@ static int set_imp_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
>
>  static u64 reset_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
>  {
> -       __vcpu_assign_sys_reg(vcpu, r->reg, vcpu->kvm->arch.nr_pmu_counters);
> -       return vcpu->kvm->arch.nr_pmu_counters;
> +       u64 old = __vcpu_sys_reg(vcpu, r->reg);
> +       u64 val = vcpu->kvm->arch.nr_pmu_counters;
> +
> +       __vcpu_assign_sys_reg(vcpu, r->reg, val);
> +       kvm_pmu_handle_mdcr(vcpu, old, val);
> +
> +       return val;
>  }
>
>  /*
> @@ -3741,7 +3751,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>         EL2_REG_FILTERED(SCTLR2_EL2, access_vm_reg, reset_val, 0,
>                          sctlr2_el2_visibility),
>         EL2_REG_VNCR(HCR_EL2, reset_hcr, 0),
> -       EL2_REG(MDCR_EL2, access_mdcr, reset_mdcr, 0),
> +       SYS_REG_USER_FILTER(MDCR_EL2, access_mdcr, reset_mdcr, 0,
> +                           NULL, set_mdcr, el2_visibility),
>         EL2_REG(CPTR_EL2, access_rw, reset_val, CPTR_NVHE_EL2_RES1),
>         EL2_REG_VNCR(HSTR_EL2, reset_val, 0),
>         EL2_REG_VNCR_FILT(HFGRTR_EL2, fgt_visibility),
> diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
> index b5e5942204fc..1971f8794c9d 100644
> --- a/include/kvm/arm_pmu.h
> +++ b/include/kvm/arm_pmu.h
> @@ -32,6 +32,7 @@ struct kvm_pmu {
>         struct kvm_pmc pmc[KVM_ARMV8_PMU_MAX_COUNTERS];
>         int irq_num;
>         bool created;
> +       bool events_need_recreate;
>  };
>
>  struct arm_pmu_entry {
> @@ -56,6 +57,7 @@ bool kvm_pmu_should_notify_user(struct kvm_vcpu *vcpu);
>  bool kvm_pmu_update_run(struct kvm_vcpu *vcpu);
>  void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val);
>  void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val);
> +void kvm_pmu_handle_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val);
>  void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu, u64 data,
>                                     u64 select_idx);
>  void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu);
> @@ -133,6 +135,7 @@ static inline bool kvm_pmu_should_notify_user(struct kvm_vcpu *vcpu)
>  static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) { return false; }
>  static inline void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val) {}
>  static inline void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val) {}
> +static inline void kvm_pmu_handle_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val) {}
>  static inline void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu,
>                                                   u64 data, u64 select_idx) {}
>  static inline int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu,
>
> --
> 2.55.0
>
>

