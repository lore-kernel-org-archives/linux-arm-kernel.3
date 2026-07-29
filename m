Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55990C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTKtf9y0sAvMzfV5x7XnlOJ9LjJuEUBlqCkfsXA/OVA=; b=pTC9W1+EsrecB6dyXUBjRU7eHJ
	pEngafDCZk0TA1UayT6e6Npva7E31rlqjoRDISVdhrlYS5se966IIqPJhu/EJDisTVkn2MeO1FM+F
	7ZS5JqQBBTQIn6SakEeYhNhj5oGHi7k7ouzYTkn6ePixffYUW95XXb23vABklYdSm/n/r5gueA1jU
	FKJEOA/XYOQM/EN7bVC2gplMqIQjfkN3MjpFeFxkZX3xGQpybqO497KiSoPXjouv10VI1MX73AfnD
	5ACnquZ3eoAAS9+PJa8Vk3jF8Uh6oSTnmpOzlm4E78S0hZkmw9OFcOfEQBDaF1Zo2ArgqejPXHqkL
	fi7qBb5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7KL-00000008aft-35bW;
	Wed, 29 Jul 2026 16:40:17 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7KH-00000008acA-2NlX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:40:16 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoKWJ4FknumGoqugcvFJksnOWJ9yl4au96PwdpdViCShzaSOItxYicVHptyU2SD5yHDO5kU5PKmCiKERaVeDQbr@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785343210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hTKtf9y0sAvMzfV5x7XnlOJ9LjJuEUBlqCkfsXA/OVA=;
	b=or+2uQ9BtVn9YW+a4xVlZoW9E8aF8KumWyRmxDaz166Hfrs5TqKHtMk3y2jh2ySdv6MDjF
	SBdtfA6a28WCn/JnqgwI/B5RuMlCo8zU8806NW3V6FkdqWfFf2A9Oe2HvYZfj1yvtuW8Nx
	dJGsJuVX36MtPtajGfVn2Yd7QRF2zFk=
X-Gm-Message-State: AOJu0YxEsOB/UX7OcvL5j1mmvppaENf2fpvkt2NcVe8rJm3RPXXTHIIy
	FNoCCZVonLzOMGDwsV/5DWBdBgAfc3fKBmd4ZrsOvdsFlbOCueiGNiaVyeKeFFaUMOhvzF1AuJx
	pfJG/T4CFfP010Sbri6nVsAWO+TgpDKLKfRUbY3SA
X-Received: by 2002:a05:622a:c4:b0:517:5ac7:332e with SMTP id
 d75a77b69052e-52b34fbe0femr1827251cf.6.1785343198660; Wed, 29 Jul 2026
 09:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-11-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-11-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 17:39:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyY3PnJLHBVWCx1Mjy09a+AztByawZxcSSVtBUfzObC_A@mail.gmail.com>
X-Gm-Features: AUfX_myAfVdxJqe8mBkarWtUgPMModQPrWR0zonAtg_LmKu_beXtJUxWvL2MWRA
Message-ID: <CA+EHjTyY3PnJLHBVWCx1Mjy09a+AztByawZxcSSVtBUfzObC_A@mail.gmail.com>
Subject: Re: [PATCH v9 11/16] KVM: arm64: PMU: Protect the list of PMUs with RCU
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
X-CRM114-CacheID: sfid-20260729_094013_900121_454A65A3 
X-CRM114-Status: GOOD (  19.55  )
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
> Convert the list of PMUs to a RCU-protected list that has primitives to
> avoid read-side contention.
>
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/pmu-emul.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index 9ac5f307ea31..c5c505b6fc61 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -7,9 +7,9 @@
>  #include <linux/cpu.h>
>  #include <linux/kvm.h>
>  #include <linux/kvm_host.h>
> -#include <linux/list.h>
>  #include <linux/perf_event.h>
>  #include <linux/perf/arm_pmu.h>
> +#include <linux/rculist.h>
>  #include <linux/uaccess.h>
>  #include <asm/kvm_emulate.h>
>  #include <kvm/arm_pmu.h>
> @@ -20,6 +20,10 @@
>  #define MDCR_EL2_PMU_RECREATE_MASK     (MDCR_EL2_HPMN | MDCR_EL2_HPMD | \
>                                          MDCR_EL2_HLP)
>
> +/*
> + * arm_pmus is append-only. kvm_supports_guest_pmuv3() feeds persistent
> + * VM state, so a true result must remain valid after the check.
> + */
>  static LIST_HEAD(arm_pmus);
>  static DEFINE_MUTEX(arm_pmus_lock);
>
> @@ -29,7 +33,6 @@ static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc);
>
>  bool kvm_supports_guest_pmuv3(void)
>  {
> -       guard(mutex)(&arm_pmus_lock);
>         return !list_empty(&arm_pmus);
>  }
>
> @@ -807,7 +810,7 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
>                 return;
>
>         entry->arm_pmu = pmu;
> -       list_add_tail(&entry->entry, &arm_pmus);
> +       list_add_tail_rcu(&entry->entry, &arm_pmus);
>  }
>
>  static struct arm_pmu *kvm_pmu_probe_armpmu(void)
> @@ -816,7 +819,7 @@ static struct arm_pmu *kvm_pmu_probe_armpmu(void)
>         struct arm_pmu *pmu;
>         int cpu;
>
> -       guard(mutex)(&arm_pmus_lock);
> +       guard(rcu)();
>
>         /*
>          * It is safe to use a stale cpu to iterate the list of PMUs so long as
> @@ -836,7 +839,7 @@ static struct arm_pmu *kvm_pmu_probe_armpmu(void)
>          * carried here.
>          */
>         cpu = raw_smp_processor_id();
> -       list_for_each_entry(entry, &arm_pmus, entry) {
> +       list_for_each_entry_rcu(entry, &arm_pmus, entry) {
>                 pmu = entry->arm_pmu;
>
>                 if (cpumask_test_cpu(cpu, &pmu->supported_cpus))
> @@ -1088,9 +1091,9 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
>         int ret = -ENXIO;
>
>         lockdep_assert_held(&kvm->arch.config_lock);
> -       mutex_lock(&arm_pmus_lock);
> +       guard(rcu)();
>
> -       list_for_each_entry(entry, &arm_pmus, entry) {
> +       list_for_each_entry_rcu(entry, &arm_pmus, entry) {
>                 arm_pmu = entry->arm_pmu;
>                 if (arm_pmu->pmu.type == pmu_id) {
>                         if (kvm_vm_has_ran_once(kvm) ||
> @@ -1106,7 +1109,6 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
>                 }
>         }
>
> -       mutex_unlock(&arm_pmus_lock);
>         return ret;
>  }
>
>
> --
> 2.55.0
>
>

