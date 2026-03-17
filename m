Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21470FED9EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzARhdGAAdzXnLLDQx+bGQ+D4Xbon7Lj6B8t5XjpU94=; b=vfen+MxVOrH0n4s7BtE2R8pibi
	UmO/bJjlFJ6YNq6KBZr/oMkjj/nC2HR3kzwkssO3xdZVsKiMML3YYcMFiA1rGC/O9UiEG9JD084PE
	c6d1gNuMuPfNNpkkQpemtupasQMhi8hgMNb21dkWMNadTTUyHjUO7Hfe5stLTpcl+i9iiFQ4cj7Ha
	JsRfp6bF90DY8MfBQlcJPd5vwvKo66CGtHQ+G77frHCZ8tEeRkKPe2uuqlhN32TenfGKtMRE+lLsb
	wFfQ0NEL0KYmswmHztUcHij4rDefIo50RK8bzvoL2XIBLYcJBwFX7TClR62uHG5RB9wicXt7DS8r1
	EVblnoxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ybl-00000006z0y-2fdD;
	Tue, 17 Mar 2026 17:53:33 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ybj-00000006yzs-0Ybh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:53:32 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fb00b4Bj3zJ46DJ;
	Wed, 18 Mar 2026 01:52:31 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 0833040584;
	Wed, 18 Mar 2026 01:53:28 +0800 (CST)
Received: from localhost (10.48.149.62) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Mar
 2026 17:53:27 +0000
Date: Tue, 17 Mar 2026 17:53:26 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Fuad Tabba <tabba@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, "Joey
 Gouly" <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, "KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64"
	<linux-arm-kernel@lists.infradead.org>, KERNEL VIRTUAL MACHINE FOR ARM64
 KVM/arm64 <kvmarm@lists.linux.dev>, "open list"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 07/10] KVM: arm64: Use scoped resource management in
 arm.c
Message-ID: <20260317175326.000074be@huawei.com>
In-Reply-To: <20260316-tabba-el2_guard-v1-7-456875a2c6db@google.com>
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
	<20260316-tabba-el2_guard-v1-7-456875a2c6db@google.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.149.62]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_105331_345465_A673B213 
X-CRM114-Status: GOOD (  12.32  )
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

On Mon, 16 Mar 2026 17:35:28 +0000
Fuad Tabba <tabba@google.com> wrote:

> Migrate manual spin_lock() calls managing mp_state_lock and manual
> mutex_lock() calls managing kvm->arch.config_lock to use the
> guard(spinlock) and guard(mutex) macros.
> 
> This eliminates manual unlock calls on early return paths and
> simplifies the vCPU suspend/resume control flow.
> 
> Change-Id: Ifcd8455d08afa5d00fc200daaa3fb13f6736e6ed
> Signed-off-by: Fuad Tabba <tabba@google.com>
Trivial stuff.
> ---
>  arch/arm64/kvm/arm.c | 53 ++++++++++++++++++++--------------------------------
>  1 file changed, 20 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 410ffd41fd73..017f5bfabe19 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c

>  
>  /**
> @@ -738,9 +736,8 @@ static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
>  
>  void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
>  {
> -	spin_lock(&vcpu->arch.mp_state_lock);
> +	guard(spinlock)(&vcpu->arch.mp_state_lock);
>  	__kvm_arm_vcpu_power_off(vcpu);
> -	spin_unlock(&vcpu->arch.mp_state_lock);
>  }
>  
>  bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu)
> @@ -773,7 +770,7 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
>  {
>  	int ret = 0;
>  
> -	spin_lock(&vcpu->arch.mp_state_lock);
> +	guard(spinlock)(&vcpu->arch.mp_state_lock);
>  
>  	switch (mp_state->mp_state) {
>  	case KVM_MP_STATE_RUNNABLE:
> @@ -789,8 +786,6 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
>  		ret = -EINVAL;
		return -EINVAL;
	}

	return 0;

Or even return in the switch legs instead of breaking out.

>  	}
>  
> -	spin_unlock(&vcpu->arch.mp_state_lock);
> -
>  	return ret;
>  }

>  /*
> @@ -944,9 +937,8 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
>  			return ret;
>  	}
>  
> -	mutex_lock(&kvm->arch.config_lock);
> +	guard(mutex)(&kvm->arch.config_lock);
>  	set_bit(KVM_ARCH_FLAG_HAS_RAN_ONCE, &kvm->arch.flags);
> -	mutex_unlock(&kvm->arch.config_lock);
>  
>  	return ret;

Personally I'd make this return 0 whilst you are here so it's obvious this
path only ever returns success.

>  }



