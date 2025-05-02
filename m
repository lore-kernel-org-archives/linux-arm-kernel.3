Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC1EC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 21:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z141FLEwqm2f5UKeV3GY2SvtY7oSxEMFO78Y0lhO4Mo=; b=mDqcjinsD3OnltltxTpzfojyI4
	C4UyZ3APGNSQLdBQkPSMhZOxdiWMkoWv0Pj8kSXCuUaS8Zb6RIE5mJo9L5bPF1XMM8gymjIK1CKkw
	4jyoB7gmuLVckwoLw9YWrRLOOUbNwUvp0aygQAja/cdAMaosL37RwcfAdC44MfJ+hh5UHtHjXKHam
	vIj9SqP5yrCkklpqkRYpBt324+2weVGno5JGVK5erjLjmc8kQl2V6pkJRYPFgB9yJZNbVJPFtUlSU
	qlIfKGE9ggW9nPoHsPpg0hPoyiVoDyzeMhp7ST/3v74o82XdAf9XOck3tFOWiFcmtu9V8gAniBPap
	68xXPk3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxbd-000000032Mv-2rf0;
	Fri, 02 May 2025 21:07:37 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxTC-0000000318m-3HAN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 20:58:56 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so2165025a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 13:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746219533; x=1746824333; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z141FLEwqm2f5UKeV3GY2SvtY7oSxEMFO78Y0lhO4Mo=;
        b=L08LiuUwe9hAZ3bFgxSnWRHRf4z5pTSiM4tIRDrgAbeAwyyMZTuh3s4VYaesnziVIJ
         PnGZfytFfcv9/aaipiSXpQReQzGtygbWHVi9+spYoM4dw4Em6xxRMe1A6WwpEQ7ucijw
         xUVqiDN/ID1YoU0Bmdp/QONQ2hO0UtOFHZSNxP/Yhtb+FLII6eUyBd9yYXsKY2++PSB8
         YrJXe/sCQvi0LoyXnoKz9YW+U1Ny3jokK6WSDIoszwOZR/6DphSBEPoYSH2R5u9fFbXw
         k3JPz04rhhOQYS6FINIQB5RyFFoyjMyrTLPXxjOfgWHt+ibBlFTZjuv32qHEZTv/1PoA
         QXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746219533; x=1746824333;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z141FLEwqm2f5UKeV3GY2SvtY7oSxEMFO78Y0lhO4Mo=;
        b=ejQn2y5uKtKyAzEyjk5IuOzMlpfQF6xfNEK7YjTVPZhum4ykDe7zqn/DLS+evD1+/d
         dx3kX1BAUNuBxXbyLgF3OIukqeo1lAr4TYIIIXQDx0zsC3Idax4PJlduPyCEk30lU4m7
         Vv7uID61FQ6jwa1mjAOeCZEPIuommib9u7ORNEAwDk4wLPI9c3/rRXcGAug025N1MBEH
         7na2hH1zNW0roJ62t+V1N1wd9jjgYASgG521xU8wrkcfRaSvWZUjekULmgzuqfghvMRP
         vbKCfpsD+h7+/ccDHM70gSjRsApsoR3xZOhCoJhgubEe4cqbTzntDiQ6cJNA1/0hk1U+
         AXHA==
X-Forwarded-Encrypted: i=1; AJvYcCUa4Ken8lz1hXBAbUa6iyE0vplvCqZTz8A4max4WKNON7ZSozJ4hVpjcp2HbuKQkcuzIGuKl3uI3IPl37lO4g9r@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2g7Av1QKhDsRU4eivFhGNVvLtbWKjcetww2PxFXCYx+zRhksa
	erERaGJQFcrVIi3ZG7xut6ozaa5riYCIqUL8c0bWh7a/DeWPC5eaTHJgd8fQaBnj1MGcaEqdxhX
	w+w==
X-Google-Smtp-Source: AGHT+IGm3fjnbZdZ0P5dTXEIDYUNeozyMh591wQHnGgOaKhf2rgPLaUDWxwxyDC2IuE6wOX5aAwhTk5qwaY=
X-Received: from pjff8.prod.google.com ([2002:a17:90b:5628:b0:2ff:8471:8e53])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f8c:b0:305:5f32:d9f0
 with SMTP id 98e67ed59e1d1-30a4e5c5e9dmr6320303a91.19.1746219533227; Fri, 02
 May 2025 13:58:53 -0700 (PDT)
Date: Fri, 2 May 2025 13:58:51 -0700
In-Reply-To: <864iy4ivro.wl-maz@kernel.org>
Mime-Version: 1.0
References: <20250430203013.366479-1-mlevitsk@redhat.com> <20250430203013.366479-3-mlevitsk@redhat.com>
 <864iy4ivro.wl-maz@kernel.org>
Message-ID: <aBUyC5kgTipXud-7@google.com>
Subject: Re: [PATCH v4 2/5] arm64: KVM: use mutex_trylock_nest_lock when
 locking all vCPUs
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Kunkun Jiang <jiangkunkun@huawei.com>, 
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Borislav Petkov <bp@alien8.de>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Potapenko <glider@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Andre Przywara <andre.przywara@arm.com>, x86@kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, kvm-riscv@lists.infradead.org, 
	Atish Patra <atishp@atishpatra.org>, Ingo Molnar <mingo@redhat.com>, 
	Jing Zhang <jingzhangos@google.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, kvmarm@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Keisuke Nishimura <keisuke.nishimura@inria.fr>, 
	Sebastian Ott <sebott@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Shusen Li <lishusen2@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_135854_813046_031F03F2 
X-CRM114-Status: GOOD (  20.53  )
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

On Thu, May 01, 2025, Marc Zyngier wrote:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 69782df3617f..834f08dfa24c 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -1368,6 +1368,40 @@ static int kvm_vm_release(struct inode *inode, struct file *filp)
> >  	return 0;
> >  }
> >  
> > +/*
> > + * Try to lock all of the VM's vCPUs.
> > + * Assumes that the kvm->lock is held.
> 
> Assuming is not enough. These assertions have caught a number of bugs,
> and I'm not prepared to drop them.
> 
> > + */
> > +int kvm_trylock_all_vcpus(struct kvm *kvm)
> > +{
> > +	struct kvm_vcpu *vcpu;
> > +	unsigned long i, j;
> > +
> > +	kvm_for_each_vcpu(i, vcpu, kvm)
> > +		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
> > +			goto out_unlock;
> > +	return 0;
> > +
> > +out_unlock:
> > +	kvm_for_each_vcpu(j, vcpu, kvm) {
> > +		if (i == j)
> > +			break;
> > +		mutex_unlock(&vcpu->mutex);
> > +	}
> > +	return -EINTR;
> > +}
> > +EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
> > +
> > +void kvm_unlock_all_vcpus(struct kvm *kvm)
> > +{
> > +	struct kvm_vcpu *vcpu;
> > +	unsigned long i;
> > +
> > +	kvm_for_each_vcpu(i, vcpu, kvm)
> > +		mutex_unlock(&vcpu->mutex);
> > +}
> > +EXPORT_SYMBOL_GPL(kvm_unlock_all_vcpus);
> 
> I don't mind you not including the assertions in these helpers, 

I do :-)  I see no reason not to add assertions here, if locking all vCPUs is
a hot path, we've probably got bigger problems.

