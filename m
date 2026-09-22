Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E673C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ql6e6uyZc8xZzxZ3KoRlBfpeEOGwWkJ5hNC8a9M29d8=; b=CD5rN/JQmzopZaI7ueozEEwyN6
	0jeDlEmHcSZqv5U3+EvQlktswP3TPtGgTQGkGtlrohDaxqHtnSdlEjJbJzTkamjB0ExWpHFlEvFnC
	8ROXdwfKjq6ZCo6rxu2aWQU1vuggtvkTmNnLz1fKsXjl8UC0HdqoYFFTcEJjLNs4T8O4/RJyK0lPi
	t3jNz64UBR7d2t0SQTd4ZlQNOV6+q1/kFrVSqZHj2GffrlwHa7dEEv9//jNQTSBiiXR/Sq2M9T5xs
	UmEuDGbN4B5zZJpD3oKVx3P9b48LGIB+Gub/ttHrZKK/mJzYpyFi+doaMtzIIO42Q1qpVNpRBZJzR
	f0NspfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Dd-00000006Bd8-0PpX;
	Tue, 22 Sep 2026 17:23:49 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Da-00000006Bcg-2XOE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:23:47 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2d959904658so786215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790097825; x=1790702625; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ql6e6uyZc8xZzxZ3KoRlBfpeEOGwWkJ5hNC8a9M29d8=;
        b=Zk0Xaw/hCoYmoDd7QLwiLW32dnfpDBHfLEXDxFknAJdZ2mx2qq69y39QzK2GwYqyjG
         m9SOqOHfpqh3PHa4E9vUH1hJqlPwnN+2Pg7pVn/5DiYndHdU37XsI2NdlmXtIawWR5JK
         KqC5JITQcYnB+ZRZAtQEy1Ad9rScznzMwUy7//2Ab7zqLjgPnjgtM4qa+xh3d9twspYS
         3kQoWzla2YelPpdqaapOhqYowdVyh9Sko60tgAOGE+h9OiTAgdGHfiaV4eIJg00ih6pg
         k4ry96Gkcyc37ZhH+epkyrRaBw4hNBtyTGuwA0nRUIKQF2er1ymnDb+Wjm4RncgeDf7+
         ZBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097825; x=1790702625;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ql6e6uyZc8xZzxZ3KoRlBfpeEOGwWkJ5hNC8a9M29d8=;
        b=nTY798NocEKyp82sjp1B5zbKkMnu+mbzj7x5VBlayJAzBKzV6LqRbn5HPQ8hexgiDR
         0ILo5szPJYwPQd8HtJ8Z1M2QJosGM0n4mVsGxg7kf8tGDqWB9TOXGXnXN7yqc7kUraua
         gH0C8Mi09pZrDDDAcIqTGfvaXc0DBFToc3IIPYA23KArqb1UKKeXeeWKCfE4Ym5/uD54
         59kwSy8rGV30ilv8tK4U97BOMqiX2JjgYLS7IK2kuoSEedli9i9mn/i1tRWV+Z/j8VcH
         P2uWB4507wWk1Lrqooo9BDhzmEy8In+6OaBayz+MG95mKRKhJDVqSg3NmuOUHepMxzjP
         M1iQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKX/bej7ynbmj+2KyrqmiSMR451uqCNbFNraWOe1ZKh611HbQH1XK05DNFuUeaIW+UGNPm4MkSHD++bLs9Oajg@lists.infradead.org
X-Gm-Message-State: AFuF++mf9V+AemAxG35FxhKctYFj+/NyykfN5AWBjZqWQpRM6amEqAFp
	GakWh6PJyfwAOsALsN1R+hi/od6ehEFaVHipeZAYcAMIbH303SGaUM/StAULyXLoTBSYdNgQKE/
	R+5rkUg==
X-Received: from pgdg5.prod.google.com ([2002:a05:6a02:51c5:b0:cc5:111b:b53f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1848:b0:2dd:c100:7cb7
 with SMTP id d9443c01a7336-2df69de9aaamr563645ad.51.1790097824659; Tue, 22
 Sep 2026 10:23:44 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:23:43 -0700
In-Reply-To: <arKxjsxuO1F5ExrY@kernel.org>
Mime-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org> <arKxjsxuO1F5ExrY@kernel.org>
Message-ID: <arK5n9HrbZMCOHOt@google.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_102346_644197_2A0FF1D2 
X-CRM114-Status: GOOD (  19.88  )
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

On Tue, Sep 22, 2026, Oliver Upton wrote:
> Hi Lorenzo,
> 
> On Tue, Sep 22, 2026 at 03:17:55PM +0100, Lorenzo Stoakes (ARM) wrote:
> > +bool __weak kvm_arch_vcpu_allow_pre_fault_memory(struct kvm_vcpu *vcpu)
> > +{
> > +	return true;
> > +}
> > +
> >  void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
> >  {
> >  	int nr_vcpus, start, i, idx, yielded;
> > @@ -4365,6 +4370,9 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >  	    range->gpa + range->size <= range->gpa)
> >  		return -EINVAL;
> >  
> > +	if (!kvm_arch_vcpu_allow_pre_fault_memory(vcpu))
> > +		return -ENOEXEC;
> > +
> 
> nit: it'd be better to let the arch hook return an error of its choosing
> but in reality this is only going to be used by arm64.

Heh, except x86 already has something similar.

	if (!vcpu->kvm->arch.pre_fault_allowed)
		return -EOPNOTSUPP;

As does s390:
	
	if (kvm_is_ucontrol(vcpu->kvm))
		return -EINVAL;

I also don't like that this is subtly about avoiding vcpu_load(); it will be all
too easy to overlook that detail in the future.

Rather than have kvm_arch_vcpu_allow_pre_fault_memory(), what if we add a more
generic kvm_is_vcpu_loadable()?  That way we don't need to worry as much about
the return value, the connection to vcpu_load() is obvious, and we don't need to
add another pre-check if future (or cleaned-up existing?) ioctls want to do
vcpu_load() in common code.

I'd also be tempted to say it can be a macro, not a __weak function.  E.g.

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 27fe0cd5b2d7..99613df254cf 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1533,6 +1533,7 @@ static inline bool __vcpu_has_feature(const struct kvm_arch *ka, int feature)
 #define vcpu_has_feature(v, f)	__vcpu_has_feature(&(v)->kvm->arch, (f))
 
 #define kvm_vcpu_initialized(v) vcpu_get_flag(v, VCPU_INITIALIZED)
+#define kvm_is_vcpu_loadable kvm_vcpu_initialized
 
 int kvm_trng_call(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_KVM
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3dd04605f2e5..02401b080507 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1053,6 +1053,9 @@ int kvm_trylock_all_vcpus(struct kvm *kvm);
 int kvm_lock_all_vcpus(struct kvm *kvm);
 void kvm_unlock_all_vcpus(struct kvm *kvm);
 
+#ifndef kvm_is_vcpu_loadable
+#define kvm_is_vcpu_loadable(v) true
+#endif
 void vcpu_load(struct kvm_vcpu *vcpu);
 void vcpu_put(struct kvm_vcpu *vcpu);

