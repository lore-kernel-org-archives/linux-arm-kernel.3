Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7C8CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTesFDq/YxSwK5ZXsSdDYLDRLFxVTwZi0rSBp7hpZ7c=; b=P/3/q92D2ZU940HFIY8KdBPKSx
	3u+yUaZVvO+cVcRSjyCRow/gGF8lR+UpyKofGfeOLLQ0IbAOBqsdMgL//gJuruQWIioGQZ+69B8im
	cpp6I9A5H7J3v6BP6oasoMAhNxm6rt8PKrJyiuyCinfAj1VzrPwRm886Xl6hHe8tvY94VSbdaz5l1
	8oxn8vNIXmGRXLvv7gg0Awemurx4iM4az90aVTIaiMXkbIiNa0Hngfsqt0RLdYWkeo2qBseK3/Y7i
	L8IuvblqdXdWmkv69zxMg/jl7acc3s0AypH5V8tfTLuENOWMir5Y6CiYTOuOlXgNdY0AeWy9ALtO6
	6VkuEYoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXnS-00000003fEc-1JfN;
	Tue, 29 Sep 2026 13:23:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXnR-00000003fDq-0v3t
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 13:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yTesFDq/YxSwK5ZXsSdDYLDRLFxVTwZi0rSBp7hpZ7c=; b=U9Y+9SwGauMnGl03tLEhXleqH6
	VBKXN60cH3k5z/9h3TYqpJzyz1yTnzooDjrh00Jq304zTjLVGn1v+fTIqNv+bHcjay1jnPinZz6Wh
	nRZQr2E/VM27FPCwL/YCjRBNN8AsSD2wGvK/JDCSqmO42KG+CoA7TDeRb9JCD3CaubzOuSbR0ngC1
	VBA6QGMY8DalgdkaSoewzEIOWNjeDeDZ2JxX8J1CImzHofMTPQXWf+HIAe0pb7OA8yg87Zdse6A3F
	FRtK9n9xkWnv3DAnHB2ByLNvuEdG7Tdp/chKiZmxzR8ZShbubXEY+0JVehUwswoGAcx3dcSGILT5j
	j52yufvw==;
Received: from out-161.mta1.migadu.com ([95.215.58.161] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBXnM-00000002fnX-0Vm8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:22:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=A/v7LPhRkH6ascBEThHb/vODFW80MSZ8BAktCxFOPL4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790688174; v=1; x=1791292974;
 b=xGRPHOC4VOQ3+sVj6In3mJimicpaYt8IRvt3bbJmY8rATe+IBu1to0tcWpdroAMk28KRyw8z
 1vNS9kEXQOAsVHWYmfL5UJGb1Lz8B8xfuFaqGR7ZS565Np4Qg7aV4tBMNAgYeJfY07WNpWS40B5
 GVmfoygewO1neYtgJN5LH9mE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3c553971cea933f3;
	Tue, 29 Sep 2026 13:22:54 +0000
X-Mizu-Trace-ID: 3c553971cea933f3
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8ea0ca5baso7699e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:22:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZOKzQf6nNzNmuOfEZCDjsYlR2Nwrqcvp12T7bevNtGzuPMXuE9ztf5bvQ9mIqdeI2cRLgK44BN2Kw8mWVeYcr@lists.infradead.org
X-Gm-Message-State: AFq9FYK1eLTZJd5dyaopNXt5DZSlt/bWlI1frYenpvFyQ48wy80CZ7YX
	aP/UXiKhGHE+I1KG98Hheal32RO997Gt1KTfRWFU+QJWUNcH0jpteMf3nLWvu2ABU9xf9fFEdQ3
	yWhgaCLdAgZi9geNRCABkZP/rtRBbj2wWmErsyy2b
X-Received: by 2002:a05:6512:628d:b0:5ae:b1b3:145a with SMTP id
 2adb3069b0e04-5ba2e7b40d0mr148813e87.6.1790688173434; Tue, 29 Sep 2026
 06:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260929093548.3598547-1-maz@kernel.org> <20260929093548.3598547-3-maz@kernel.org>
In-Reply-To: <20260929093548.3598547-3-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 29 Sep 2026 14:22:17 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzzX9g1+kgX_hBZ8gKQ1hbGbNjHrm0QMjQMmM0j-=SoXQ@mail.gmail.com>
X-Gm-Features: AclHuK_L9SaIlRtG-n3tXUkF9oIjgxk-0gMREksoQR95sfSSAdxHohLUu-uHe4Y
Message-ID: <CA+EHjTzzX9g1+kgX_hBZ8gKQ1hbGbNjHrm0QMjQMmM0j-=SoXQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] KVM: arm64: Turn vcpu->arch.pause into a counter
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Yuchao Zhang <ndaugoing@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_142256_327591_9F81916B 
X-CRM114-Status: GOOD (  28.09  )
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

On Tue, 29 Sept 2026 at 10:36, Marc Zyngier <maz@kernel.org> wrote:
>
> We have situations where we can call kvm_arm_halt_guest() without
> holding config_lock, which means that halt and resume can overlap in
> funny ways when called from separate contexts, and result in situations
> where a vcpu is resumed while other parts of KVM assume it is halted.
> Consequences are left to the imagination of the reader.
>
> Fix this sorry situation by turning kvm_vcpu_arch::pause into an
> atomic counter, which makes the races described above harmless.
>
> Fixes: 3b92830ad41b2 ("KVM: arm/arm64: implement kvm_arm_[halt,resume]_guest")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/include/asm/kvm_host.h |  7 +++----
>  arch/arm64/kvm/arm.c              | 21 ++++++++++++---------
>  2 files changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 27fe0cd5b2d7a..66ea2372f9870 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -889,11 +889,10 @@ struct kvm_vcpu_arch {
>         /*
>          * Don't run the guest (internal implementation need).
>          *
> -        * Contrary to the flags above, this is set/cleared outside of
> -        * a vcpu context, and thus cannot be mixed with the flags
> -        * themselves (or the flag accesses need to be made atomic).
> +        * Contrary to the flags above, this is updated outside of
> +        * a vcpu context, and thus cannot be mixed with the flags.
>          */
> -       bool pause;
> +       atomic_t pause;
>
>         /*
>          * We maintain more than a single set of debug registers to support
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 5f5dd8bead4b9..9a4871cd796bc 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -561,6 +561,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>         kvm_arm_pvtime_vcpu_init(&vcpu->arch);
>
>         vcpu->arch.hw_mmu = &vcpu->kvm->arch.mmu;
> +       atomic_set(&vcpu->arch.pause, 0);
>
>         /*
>          * This vCPU may have been created after mpidr_data was initialized.
> @@ -835,6 +836,11 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
>         return ret;
>  }
>
> +static bool vcpu_can_run(struct kvm_vcpu *vcpu)
> +{
> +       return !kvm_arm_vcpu_stopped(vcpu) && !atomic_read(&vcpu->arch.pause);
> +}
> +
>  /**
>   * kvm_arch_vcpu_runnable - determine if the vcpu can be scheduled
>   * @v:         The VCPU pointer
> @@ -850,8 +856,7 @@ int kvm_arch_vcpu_runnable(struct kvm_vcpu *v)
>                       (kvm_timer_should_notify_user(v) ||
>                        kvm_pmu_should_notify_user(v)));
>
> -       return ((irq_lines || kvm_vgic_vcpu_pending_irq(v))
> -               && !kvm_arm_vcpu_stopped(v) && !v->arch.pause);
> +       return ((irq_lines || kvm_vgic_vcpu_pending_irq(v)) && vcpu_can_run(v));
>  }
>
>  bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
> @@ -1014,7 +1019,7 @@ void kvm_arm_halt_guest(struct kvm *kvm)
>         struct kvm_vcpu *vcpu;
>
>         kvm_for_each_vcpu(i, vcpu, kvm)
> -               vcpu->arch.pause = true;
> +               atomic_inc(&vcpu->arch.pause);
>         kvm_make_all_cpus_request(kvm, KVM_REQ_SLEEP);
>  }
>
> @@ -1024,8 +1029,8 @@ void kvm_arm_resume_guest(struct kvm *kvm)
>         struct kvm_vcpu *vcpu;
>
>         kvm_for_each_vcpu(i, vcpu, kvm) {
> -               vcpu->arch.pause = false;
> -               __kvm_vcpu_wake_up(vcpu);
> +               if (atomic_dec_and_test(&vcpu->arch.pause))
> +                       __kvm_vcpu_wake_up(vcpu);
>         }
>  }
>
> @@ -1033,11 +1038,9 @@ static void kvm_vcpu_sleep(struct kvm_vcpu *vcpu)
>  {
>         struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
>
> -       rcuwait_wait_event(wait,
> -                          (!kvm_arm_vcpu_stopped(vcpu)) && (!vcpu->arch.pause),
> -                          TASK_INTERRUPTIBLE);
> +       rcuwait_wait_event(wait, vcpu_can_run(vcpu), TASK_INTERRUPTIBLE);
>
> -       if (kvm_arm_vcpu_stopped(vcpu) || vcpu->arch.pause) {
> +       if (!vcpu_can_run(vcpu)) {
>                 /* Awaken to handle a signal, request we sleep again later. */
>                 kvm_make_request(KVM_REQ_SLEEP, vcpu);
>         }
> --
> 2.47.3
>

