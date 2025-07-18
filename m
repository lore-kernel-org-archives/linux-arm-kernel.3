Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D0FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geYaB9rXHQSUMsGWg9gaauTb+O/4/i92BVIedWT6AZU=; b=fUBtjFsbCarBhKHq3dto2atbxT
	L2tJ6f5W9XP14sZ11NM+pX/ZPh0xIcHnCFHtOOBoz5e0hEt+RtRzvYnS445nP9EBP0Rq7ToFcZM8x
	hsa1tcXSbnEJwfAuqv3d6ITHTXlkgcAFDzg+W74VGV8fxfws2s3UJcia6Vhtqpjofe2s3QgBe26r1
	stmoe5EIlJxO6Nm0hoVajr1iJmYvs2BfTU3aOSuCvNydcca/BdLNYaFnX8wusZYYwsS+wzcGcDG8K
	X/JcOf6jSxusa3lQBqPSPTz+CSRwNYKzIH8j0jJXFuyYf5ojgLlQtploxxB5I0WqegPx+tszl7T/7
	Qb19Nw/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmfI-0000000CtQ8-3MJh;
	Fri, 18 Jul 2025 15:06:24 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmam-0000000CsoE-1QqE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:01:45 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-74ea7007866so2160545b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752850903; x=1753455703; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=geYaB9rXHQSUMsGWg9gaauTb+O/4/i92BVIedWT6AZU=;
        b=grX6BM7DZS+JgpFSz1UOKKSxdPIg12dSLMlRR5E9KBsK06bebNws2YlNyO0lMheJOY
         Uiba4XRtZFwzlXR8lRZCICd1O7FhblITtW1azBD2S3MJrdVgrLv5f6CNYJHF8vFlCdaz
         st0PKQiIN7kgYGYSlJ3aCqraN2uTWGmcUsEYoM97oF6K4DXc8AAt8L0wSXXsUpYo/m1R
         aew2dynY3MEEOqW1KZD1ZFVgC83xxoQvl/rZHkxwYEDyBbQfOW4joQPA2VlVRa1GKGr/
         ONPeBKVqfgZR77e9sJpaYMvWLJnChJEPQuaY9SRHChyqgOrwFowkv3o/FeAHi8RGBP0q
         btvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752850903; x=1753455703;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=geYaB9rXHQSUMsGWg9gaauTb+O/4/i92BVIedWT6AZU=;
        b=KA4FZZ/i3r6gNKj3Cn5pMysJwuEsDzQc8BMIPyKRI1rLzMa6imqUYJpnJzHFqn+v7s
         ZqPQKR32pYnC2sNiuzUx/uBAkfNHjKJ+62/msfxqDv/51jVX1hcgaPpZEc4o6YkjqRg0
         R04ZwG/H6kgtUntKEgMz4NRWn9HWOjBH68ogzqArFQSJWJbI61nDrztdEIXS84tqBg14
         v7+QQiBfek1ZAP46XKR4WcC50wRs9mvLdBCSDufKmyb/PuPDyMun1ZnBS1NhSty+PORp
         M/hZQa3EDCQklxv0vbW6EYUFK7JR6ZnWTsRZzu1my1Vqefg14+waBb/9S9lTgPRe6/w2
         /VeA==
X-Forwarded-Encrypted: i=1; AJvYcCXKhZdyq6XNYmRtl/o032zCXx826w2NQXh1EyMb7sESx36zQuMdnh2+crEc+tm+10HgYdA7LQTV9SR+iFxdfswh@lists.infradead.org
X-Gm-Message-State: AOJu0YwaC3AS2/B4htR5fEzI9dxjjWS0yHrzvy314aM3G3NWp/boBXPL
	vdaEi75i146dNkMr5ArEjt4IJnwfP+YtjGeK6jAXyCWf0YbySpKd05ZcuPgzL9tP7Qv1vxl5I8v
	Er386PQ==
X-Google-Smtp-Source: AGHT+IHdKCPaGZUvEghSMEa/uSwnZ5WlkHcmcoPjFppjTidPL81orqXlF7aHA7YyyC6gZbDkNyDDlRyVDxc=
X-Received: from pjbqd6.prod.google.com ([2002:a17:90b:3cc6:b0:311:eb65:e269])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:6e17:b0:238:3f54:78e7
 with SMTP id adf61e73a8af0-2383f548d14mr11815528637.45.1752850903016; Fri, 18
 Jul 2025 08:01:43 -0700 (PDT)
Date: Fri, 18 Jul 2025 08:01:41 -0700
In-Reply-To: <aHpf9vuRK691J7HD@google.com>
Mime-Version: 1.0
References: <20250716110737.2513665-1-keirf@google.com> <20250716110737.2513665-3-keirf@google.com>
 <kb7nwrco6s7e6catcareyic72pxvx52jbqbfc5gbqb5zu434kg@w3rrzbut3h34> <aHpf9vuRK691J7HD@google.com>
Message-ID: <aHph1ZeYRhWIMCMm@google.com>
Subject: Re: [PATCH v2 2/4] KVM: arm64: vgic: Explicitly implement
 vgic_dist::ready ordering
From: Sean Christopherson <seanjc@google.com>
To: Keir Fraser <keirf@google.com>
Cc: Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Eric Auger <eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_080144_382138_A895886E 
X-CRM114-Status: GOOD (  23.25  )
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

On Fri, Jul 18, 2025, Keir Fraser wrote:
> On Thu, Jul 17, 2025 at 01:44:48PM +0800, Yao Yuan wrote:
> > On Wed, Jul 16, 2025 at 11:07:35AM +0800, Keir Fraser wrote:
> > > In preparation to remove synchronize_srcu() from MMIO registration,
> > > remove the distributor's dependency on this implicit barrier by
> > > direct acquire-release synchronization on the flag write and its
> > > lock-free check.
> > >
> > > Signed-off-by: Keir Fraser <keirf@google.com>
> > > ---
> > >  arch/arm64/kvm/vgic/vgic-init.c | 11 ++---------
> > >  1 file changed, 2 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> > > index 502b65049703..bc83672e461b 100644
> > > --- a/arch/arm64/kvm/vgic/vgic-init.c
> > > +++ b/arch/arm64/kvm/vgic/vgic-init.c
> > > @@ -567,7 +567,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> > >  	gpa_t dist_base;
> > >  	int ret = 0;
> > >
> > > -	if (likely(dist->ready))
> > > +	if (likely(smp_load_acquire(&dist->ready)))
> > >  		return 0;
> > >
> > >  	mutex_lock(&kvm->slots_lock);
> > > @@ -598,14 +598,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> > >  		goto out_slots;
> > >  	}
> > >
> > > -	/*
> > > -	 * kvm_io_bus_register_dev() guarantees all readers see the new MMIO
> > > -	 * registration before returning through synchronize_srcu(), which also
> > > -	 * implies a full memory barrier. As such, marking the distributor as
> > > -	 * 'ready' here is guaranteed to be ordered after all vCPUs having seen
> > > -	 * a completely configured distributor.
> > > -	 */
> > > -	dist->ready = true;
> > > +	smp_store_release(&dist->ready, true);
> > 
> > No need the store-release and load-acquire for replacing
> > synchronize_srcu_expedited() w/ call_srcu() IIUC:
> > 
> > Tree SRCU on SMP:
> > call_srcu()
> >  __call_srcu()
> >   srcu_gp_start_if_needed()
> >     __srcu_read_unlock_nmisafe()
> > 	 #ifdef	CONFIG_NEED_SRCU_NMI_SAFE
> > 	   	  smp_mb__before_atomic() // __smp_mb() on ARM64, do nothing on x86.
> > 	 #else
> >           __srcu_read_unlock()
> > 		   smp_mb()
> > 	 #endif
> 
> I don't think it's nice to depend on an implementation detail of
> kvm_io_bus_register_dev() and, transitively, on implementation details
> of call_srcu().
> 
> kvm_vgic_map_resources() isn't called that often and can afford its
> own synchronization.

+1

