Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880DBC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ti+NqKDTLfm/nZ8f6EX1KwjNP1iMFipkmncvpp1Cax0=; b=ES6yHvnMXuJSoQokEeBZxhkywN
	UezKEoIjCa+uDae1T3f2+xHMts92+RjzVp6hSRM4DtggkCQ08j0q+WhFdG6cHyjpyl9CszYSFegDZ
	xy5jPwYydbC59tYGvXtkBcattGo76RNBZVNElF1q51VOQNfWJWT24Or783HuVs4fXPmDvKrxJCsD4
	CurJefIWx2AK+ywwSCbLK5godqYV3+bsZIomfy937XGIPWX7UpVEbfT2WMHsd8SjQ6e58Y+GC3rl0
	Z/U69MQmUcUFEODgqjFAIBHds5K/I0VmHcloC3Yh0VEJWSZcgW49i9R27GPA352yJ0kIt+T59IhB5
	Oem1ITUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp62T-00000008N3R-03Mp;
	Wed, 29 Jul 2026 15:17:45 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp62L-00000008N06-2SQY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:17:39 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpcOqiq6NO9h0zyed/byKtwEzPV4jOU7JXuAimYgqNbd24RlqhlXgQgspcdmiNgVOlI13eQ+q0gKU33SepI50Gp@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785338254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ti+NqKDTLfm/nZ8f6EX1KwjNP1iMFipkmncvpp1Cax0=;
	b=J2LoDH3F572bDEJyW1xfXap/SHFI59iI0SBplMVBgWg2RAv37Qo7/JAj20TTLFo2XRFxQu
	x5dCLY/qFPvjNvoVUg3P8sEIderg7zdMxfKLzJRU5jxZeowV+8PCSpah6Q7y7LtjTmWg4D
	8L4Vt9Jxht34X/l3CGSb3SFUjidGNRI=
X-Gm-Message-State: AOJu0YyxT6Ym8vid71VVeIrYGWARXKdwRhz2m3j/toJP3IREg+B1a3jk
	19oCweldF+U0HG/5J2Lt7kERat4CQ+F3+pQfQSMpOPZLtG/4wsB1cwFmPofi6kmpM48v2OkvU9V
	C8NWNM6PWgBXerBht80fIqiDSN1QhMdkyXVecXYLY
X-Received: by 2002:ac8:7dc4:0:b0:528:3186:5799 with SMTP id
 d75a77b69052e-52b35089d24mr441161cf.10.1785338243657; Wed, 29 Jul 2026
 08:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-2-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-2-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 16:16:46 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwCFXkQ=VHjQt3zt0TORh5YwPVCPBqFqTJF7YULxM-11g@mail.gmail.com>
X-Gm-Features: AUfX_mxk11pzy6CU19PtboDUtDrd-zS8qSEKUP6-qNGENZgdWGBbQJn1zZ_m4NQ
Message-ID: <CA+EHjTwCFXkQ=VHjQt3zt0TORh5YwPVCPBqFqTJF7YULxM-11g@mail.gmail.com>
Subject: Re: [PATCH v9 02/16] KVM: arm64: PMU: Stop updating MDCR_EL2.HPMN
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
X-CRM114-CacheID: sfid-20260729_081737_779588_62C69790 
X-CRM114-Status: GOOD (  18.12  )
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
> KVM allows userspace to write any value to MDCR_EL2.HPMN. However,
> kvm_arm_set_nr_counters() rewrites HPMN for every vCPU whenever
> userspace changes the PMU or its counter count. This can discard a
> value previously restored with KVM_SET_ONE_REG.
>
> The architecture only defines HPMN's value on warm reset. Stop
> rewriting it after vCPU initialization and update nr_pmu_counters
> directly instead. reset_mdcr() continues to initialize HPMN from the
> counter count current at KVM_ARM_VCPU_INIT.
>
> Fixes: c8823e51b534 ("KVM: arm64: Fix MDCR_EL2.HPMN reset value")
> Closes: https://sashiko.dev/#/patchset/20260706-hybrid-v8-0-de459617b59d%40rsg.ci.i.u-tokyo.ac.jp?part=6
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/pmu-emul.c | 22 ++--------------------
>  1 file changed, 2 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index 98305bbfc095..b5df6843dbcd 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -1022,30 +1022,12 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
>         return bitmap_weight(arm_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS);
>  }
>
> -static void kvm_arm_set_nr_counters(struct kvm *kvm, unsigned int nr)
> -{
> -       kvm->arch.nr_pmu_counters = nr;
> -
> -       /* Reset MDCR_EL2.HPMN behind the vcpus' back... */
> -       if (test_bit(KVM_ARM_VCPU_HAS_EL2, kvm->arch.vcpu_features)) {
> -               struct kvm_vcpu *vcpu;
> -               unsigned long i;
> -
> -               kvm_for_each_vcpu(i, vcpu, kvm) {
> -                       u64 val = __vcpu_sys_reg(vcpu, MDCR_EL2);
> -                       val &= ~MDCR_EL2_HPMN;
> -                       val |= FIELD_PREP(MDCR_EL2_HPMN, kvm->arch.nr_pmu_counters);
> -                       __vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
> -               }
> -       }
> -}
> -
>  static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
>  {
>         lockdep_assert_held(&kvm->arch.config_lock);
>
>         kvm->arch.arm_pmu = arm_pmu;
> -       kvm_arm_set_nr_counters(kvm, kvm_arm_pmu_get_max_counters(kvm));
> +       kvm->arch.nr_pmu_counters = kvm_arm_pmu_get_max_counters(kvm);
>  }
>
>  /**
> @@ -1111,7 +1093,7 @@ static int kvm_arm_pmu_v3_set_nr_counters(struct kvm_vcpu *vcpu, unsigned int n)
>         if (n > kvm_arm_pmu_get_max_counters(kvm))
>                 return -EINVAL;
>
> -       kvm_arm_set_nr_counters(kvm, n);
> +       kvm->arch.nr_pmu_counters = n;
>         return 0;
>  }
>
>
> --
> 2.55.0
>
>

