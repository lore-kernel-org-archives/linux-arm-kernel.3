Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BD2C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SksBvCkZJsvM7Rmqh0mGEf+0QRJJwMrgdQAdOhKbL9I=; b=wveB5wjJsHOJ6O+SQVPkO1JmK0
	dp77siMYuFOfRzK4Ormv5CzsH7wfpOJw4AbZvRQ8LfHlGweyOnH4ToR0krLPc/2+uhlAgNGOK0U1G
	t949mFDItteTK11u9ko1aTOCdulBB+w2JwNX55GA9WHr5qE69PjS4Jrp1PXdefweqe7gULAMHXPO/
	+RwDCqJYosbH2CENBgT+BJL+MZ+HM6aa/afi+kQtQv43F6ZhSXEjY7+nR8Rk8mZqENS1urOYX1q0C
	aLMKZtAjpE7WmEZLPFt1sOL/pd9UuIiA3fYdFy7jbfRWZqjs0+stJfl87l0yvYYBpN+UoSfIxzKNO
	9ObHjSeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy0x-00000000LW7-1DU8;
	Tue, 25 Feb 2025 16:42:35 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwUU-0000000011i-10fe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:04:59 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so12372907a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 07:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740495897; x=1741100697; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SksBvCkZJsvM7Rmqh0mGEf+0QRJJwMrgdQAdOhKbL9I=;
        b=EJuZi/Y9WKcejbG4SNkoKZArhM1GrOZIRmYClA7e55+X/nGOg2r9DdRVtTlwn9Exiq
         wlBI0tFJOrR4i1s1x+kCkBH8Nw7inHcTvtg2jNGrweMgyTV+4sy/d333kY/00hKu2fG7
         bjQ3VlZHgjixrm/s84mF9ImBHXVbj16hj4t5gHDraGL0Ri0gIl6cWDKJt/bq8QxoEcRK
         xZSjjOpaVB9PtWIgLrsW4/8mcKphanUzi9ki/m8lq58rQtdm66PbekemrJmnmOGbGV5T
         pJWGYdhNLafU3G5V/4JmpmUA7eif0M+aZgFZ36J5ukfCV1j1Co9G5IoCoj9R6djvjEVz
         4Slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740495897; x=1741100697;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SksBvCkZJsvM7Rmqh0mGEf+0QRJJwMrgdQAdOhKbL9I=;
        b=ZOGMlim60mmyRkejxWqoMDaFonNVUKnyL7s6tybwcEXy4p0sN//GVAKoR2L7mECeHG
         5yDc+BYlsEMK2GgZbEE+yopiowLUYiQ7ylS3GlAHhO8TrlwSQjZgOTwOuqSlhzwmLpd2
         SIgZ3dWS6qIUJ/Y1nsDyUyezsgbPMh5yS9xNiTfZfg5SbEea89qyo0Hc7UOpCrgONM6Z
         ER1pwCdooPK3DYZg9t2U7OmLU6h8JxPKdnNww/dvgmFv+cc4+Zns0A+TdEq7swBzRK/I
         R0LTfcddhK6fLUsqdJVGLGOTnusquSwFp4DAu79PNIVY4Gp7CpWikLluHmbyUDtwpekR
         oXjA==
X-Forwarded-Encrypted: i=1; AJvYcCX22wNj84gi9bUvRSnl7CuKPr2uazyWzqk3Ae5qc3Ok4nYEuqI5+AlNfft0ux2HnbsFMxp9XBeYibUp+D8HBARh@lists.infradead.org
X-Gm-Message-State: AOJu0YzCOxM8FC0ghVIWcPfy7vT+jYby11D9K7I6jvK9lMGeJwXSPzPG
	8k6KR3cqAssLVnFOyiiP52lqf54VvzqSmD9dP2E/g/0OYHd9fCfNwxaZHxX+EyTiA7gGgRtmLXv
	Iiw==
X-Google-Smtp-Source: AGHT+IGZHL7uZNM7BfQEbB7Kx7BtB5DxGYYXBfSiN251AAOj3wJWNSwzk9hwQvuFf2tqN0hxCASkCwncVrs=
X-Received: from pgmm27.prod.google.com ([2002:a05:6a02:551b:b0:ad5:4c6b:ab72])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9d8f:b0:1f0:e430:43f8
 with SMTP id adf61e73a8af0-1f0fbff6f36mr6428815637.1.1740495896725; Tue, 25
 Feb 2025 07:04:56 -0800 (PST)
Date: Tue, 25 Feb 2025 07:04:55 -0800
In-Reply-To: <Z71072F7FMz5aq/Q@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <Z71072F7FMz5aq/Q@yzhao56-desk.sh.intel.com>
Message-ID: <Z73cF_pWIFMreOf5@google.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_070458_283798_65FC8149 
X-CRM114-Status: GOOD (  18.53  )
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

On Tue, Feb 25, 2025, Yan Zhao wrote:
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 58b82d6fd77c..045c61cc7e54 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -12890,11 +12890,11 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
> >  		mutex_unlock(&kvm->slots_lock);
> >  	}
> >  	kvm_unload_vcpu_mmus(kvm);
> > +	kvm_destroy_vcpus(kvm);
> >  	kvm_x86_call(vm_destroy)(kvm);
> >  	kvm_free_msr_filter(srcu_dereference_check(kvm->arch.msr_filter, &kvm->srcu, 1));
> >  	kvm_pic_destroy(kvm);
> >  	kvm_ioapic_destroy(kvm);
> > -	kvm_destroy_vcpus(kvm);
> >  	kvfree(rcu_dereference_check(kvm->arch.apic_map, 1));
> >  	kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
> >  	kvm_mmu_uninit_vm(kvm);
> After this change, now the sequence is that
> 
> 1. kvm_arch_pre_destroy_vm()
> 2. kvm_arch_destroy_vm()
>    2.1 kvm_destroy_vcpus()
>    2.2 .vm_destroy hook
>    2.3 kvm_mmu_uninit_vm() --> mirror root ref is 1 upon here. Zap the mirror
>                                root and reclaim SETP page table pages.
>    2.4 .vm_free hook
> 
> Since TDX needs to reclaim the TDR page after reclaiming all other pages, we
> currently added a vm_free hook at 2.4, after 2.3.
> 
> Could we move kvm_mmu_uninit_vm() before the .vm_destroy hook and after
> kvm_destroy_vcpus()?
> 
> Or move the .vm_destroy hook after kvm_mmu_uninit_vm(), e.g. after
> kvm_page_track_cleanup()?

I would go for the first option.  I'll tack on a patch since I need to test all
of these flows anyways, and I would much prefer to change course sooner rather
than later if it doesn't work for whatever reason.

Is this comment accurate?

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1e5f6f820c0b..f5685f153e08 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12874,13 +12874,19 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
                mutex_unlock(&kvm->slots_lock);
        }
        kvm_destroy_vcpus(kvm);
+
+       /*
+        * Do final MMU teardown prior to calling into vendor code.  All pages
+        * that were donated to the TDX module, e.g. for S-EPT tables, need to
+        * be reclaimed before the VM metadata page can be freed.
+        */
+       kvm_mmu_uninit_vm(kvm);
        kvm_x86_call(vm_destroy)(kvm);
        kvm_free_msr_filter(srcu_dereference_check(kvm->arch.msr_filter, &kvm->srcu, 1));
        kvm_pic_destroy(kvm);
        kvm_ioapic_destroy(kvm);
        kvfree(rcu_dereference_check(kvm->arch.apic_map, 1));
        kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
-       kvm_mmu_uninit_vm(kvm);
        kvm_page_track_cleanup(kvm);
        kvm_xen_destroy_vm(kvm);
        kvm_hv_destroy_vm(kvm);

