Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AB7C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDwMDWK74FGPCQksjJUhT5TIKVqDAVbip9kxaBkjJBk=; b=yLglwvZVBLfxbh/3vw98J+Gpn1
	6uvmL7KCwbghy1EUOrp3/DMr88oYvBf5aY/m8R2MXvuNlcKHLiqQ1ILrF4DrU6aZAPfB+RZjPuRX+
	/YcE20MPsn61yB5w+GVlnjFx4aTFHtzLWVDt7lbxyGwgblekSvRJL4hpBBw3X9Q2u3qepoKhQTTUO
	a6AgBwsA/YWcQhW518SjquFhPWQO01DWp6tcUH+XLvsQwHpK4tj3ovh2bF6VidXa/XC+w654IkVge
	yn7LxiZwSRu+an+L2I9h473j9NEnut0EXw+ZNWoxE15jn+GJRvC/1DfGRHEkePZHWcnaCJROkruAj
	iwN5RQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Eq-00000008ZMi-3GYc;
	Wed, 29 Jul 2026 16:34:36 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Eo-00000008ZLf-1mVx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:34:35 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpX4hIW96dRrjS0D98diuHbpdAN6p0z8Wf/EtkgPf1/AqhLqBkx4t4SWFcHjenvFAT/T3PV0/Zg1PB9zctLJ2+q@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785342872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CDwMDWK74FGPCQksjJUhT5TIKVqDAVbip9kxaBkjJBk=;
	b=bcf01UMEsLaJiT4r8RhB5dhd2nnAQ4nis5aD7yyNh24dC1r70pOkaS4l6JEiMWJ4cWCpp8
	IhZGLNgB+xiJxJsEYOxYCYFZWnu6cIIDTJt4VJOsAAmCRnQeVMbkf2X2ZsCBodUPSmYtjl
	3jr4fAzITWbIEAH+JN1kV6z0vSCOqMU=
X-Gm-Message-State: AOJu0YzDlpMUaxk9i9z6VGjWieDfZNW9dsgjBe3i49RkAlUFXHSQ+yNF
	SL1TBMQrIM61mAMZ9GMFQuRC3eAMYX6FfrIejMwI8xu2hyw2kke9TC/9jUzzjdGhCnexsUZ3O15
	uitOLKFypHwWr3beDFZQW0A+flOj5+C6OH54r/j/N
X-Received: by 2002:a05:622a:2b49:b0:51c:ca9:3d15 with SMTP id
 d75a77b69052e-52b3500260fmr2216081cf.12.1785342860083; Wed, 29 Jul 2026
 09:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-10-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-10-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 17:33:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzuaMDJm8BPf1sA9DiSDvtyn=C1Z2LrOLYc228XKJzF2w@mail.gmail.com>
X-Gm-Features: AUfX_mzDDgEy7qPOSuwHqBOjPkT5QQo0kZIP1lcw0jJbpzlF7P6EqmFVAn2Xz68
Message-ID: <CA+EHjTzuaMDJm8BPf1sA9DiSDvtyn=C1Z2LrOLYc228XKJzF2w@mail.gmail.com>
Subject: Re: [PATCH v9 10/16] KVM: arm64: Don't clear vcpu->cpu in kvm_arch_vcpu_put()
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
X-CRM114-CacheID: sfid-20260729_093434_635517_1F542515 
X-CRM114-Status: GOOD (  21.21  )
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
> From: Oliver Upton <oupton@kernel.org>
>
> commit e9b152cb957c ("arm/arm64: kvm: Set vcpu->cpu to -1 on vcpu_put")
> reset vcpu->cpu in order for the VGIC to determine if there was any vCPU
> running at the time of access. The VGIC has gone through an entire
> rewrite since then, and with commit 7d450e282171 ("KVM: arm/arm64:
> vgic-new: Add userland access to VGIC dist registers") the user
> accessors just grab all vCPU mutexes instead.
>
> Drop this remaining vestige such that kvm_arch_vcpu_load() can properly
> detect a CPU migration. While at it, rework kvm_reset_vcpu() to do a
> much more pedantic check that the provided vCPU is actually what's
> running on the present CPU.
>
> Signed-off-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/arm.c   |  1 -
>  arch/arm64/kvm/reset.c | 16 +++++++++++-----
>  2 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index a06ea39f57b1..72ce79ce4d5e 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -749,7 +749,6 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>         kvm_arm_vmid_clear_active();
>
>         vcpu_clear_on_unsupported_cpu(vcpu);
> -       vcpu->cpu = -1;
>  }
>
>  static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index b963fd975aac..6bfb21f00444 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -190,7 +190,8 @@ static void kvm_vcpu_reset_sve(struct kvm_vcpu *vcpu)
>  void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>  {
>         struct vcpu_reset_state reset_state;
> -       bool loaded;
> +       struct kvm_vcpu *running;
> +       bool loaded = false;
>         u32 pstate;
>
>         spin_lock(&vcpu->arch.mp_state_lock);
> @@ -198,10 +199,16 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>         vcpu->arch.reset_state.reset = false;
>         spin_unlock(&vcpu->arch.mp_state_lock);
>
> -       preempt_disable();
> -       loaded = (vcpu->cpu != -1);
> -       if (loaded)
> +       guard(preempt)();
> +
> +       running = kvm_get_running_vcpu();
> +       if (running) {
> +               if (KVM_BUG_ON(running != vcpu, vcpu->kvm))
> +                       return;
> +
> +               loaded = true;
>                 kvm_arch_vcpu_put(vcpu);
> +       }
>
>         if (!kvm_arm_vcpu_sve_finalized(vcpu)) {
>                 if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE))
> @@ -269,7 +276,6 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>
>         if (loaded)
>                 kvm_arch_vcpu_load(vcpu, smp_processor_id());
> -       preempt_enable();
>  }
>
>  u32 kvm_get_pa_bits(struct kvm *kvm)
>
> --
> 2.55.0
>
>

