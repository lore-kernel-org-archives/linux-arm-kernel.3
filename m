Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70967C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vupMdWkKONZrvWZyxZjI9RuKIWcmnqNg++2GIJkgpb8=; b=zYS+P6R5uRFH5Or7U0fYE6SbHF
	P0G5F1muP2G/sXY49K4N9Xoar2yB6N4FVakm46m+7PJIUihlT2X6Wl/CnbNhJI4awSxwUKcFy3xTf
	7B0701+6GiUfFDrq0s4KETBmx4yOf4PI634TPuDL44ktLTZP2ef2TxHtVY+gIfrUslI61MJIK5eXN
	RkhkU6PZXs9pjhsg5GDanhJsrHx75tysLpLAC69P+LWAwRe5gsaqr8dJ5UQknR9bfWAynG7ltNPai
	d4XTtkur34javPDQVOmVsp2FWT3msNqlc/SBsbg117m+2bzMI+8Ir/8fo2tXLxzY/YajG9ci9HF4y
	9ypQzbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmcs-0000000Ct7q-08OR;
	Fri, 18 Jul 2025 15:03:54 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmZQ-0000000CsdE-3TG3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:00:21 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3138f5e8ff5so2438100a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752850819; x=1753455619; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vupMdWkKONZrvWZyxZjI9RuKIWcmnqNg++2GIJkgpb8=;
        b=3mPueCx3a6uSZxDFDF9Y06ifUJMvYlPgRRLt6n2zrxZJIKk0xVvd/grmNHc/BTOgY3
         AwjzM5vulmXa37drNLpt3dmdtXFlRA4amo1puoZfg9eKkp+LBAI9WTqYZwS5K0uWBZfk
         qSVDdIUzeYidwB5SJIkKBtWguEVpyZI5T/Mb/OAbfTyOtYwftsZKocP5JTsjGWYYt9qu
         9p/MtLtJyCzttNzVfXeHebYEuynd/9jMZpbQVEE8zxcOPVCkjvBjigoJjrDT3D/UlOG7
         ZF835+8iNVRFx1MvZ1AURhN/9omUnk+HRup5NHCjDAvA3gK5ig2zNhuxMAuJ+p86+U7h
         N0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752850819; x=1753455619;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vupMdWkKONZrvWZyxZjI9RuKIWcmnqNg++2GIJkgpb8=;
        b=NJd9F6li+iKHquTRwRvvpUZ3YI1O/cICoh/ULhluNcfFFluLSPPnZwiTEnu6QG6KAW
         ibK0L66Y2UvMGQA22OckmmaXr+qvErHPN78oITMk8l+jhkKowztScHJgwM5bzPFfA+eI
         SagbHldqw+ULU7OlumcsiXCo/wPdurA7HL6hEEn5ZkhedOLDXvrcXgyF+/mx4edIWS67
         u4EmwH4oNoydeigx6FDx0VsI6env4xpSR16QeLkoBDLvWUTDnKO5DmTZxrOj8aN/1oEo
         DBbMCU8L97/dUCD2Bj9HWXZbydkWFThx4EZFGSbYRkyp1BBzgRJ0SyUspkiIPCoDtDjr
         eAew==
X-Forwarded-Encrypted: i=1; AJvYcCXDhxzlkl6Gib8i9OYjS5XPhEAloJ7KuH5IlbcQzfX65FNdpx6gAenrVRtGaAufJ4HC/hkWimMqRsK0UibRt/f6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy1/+Vxq8gj7l461Z0BDezPzDefWz5xAVRUzCeOD3xj4uQgxmq
	7Q6nuz9GKiJzpftbgCBgCRom9tamZIGmr2jy3Qkox45cXwiRiA+Qy0dQcmkQQDmcX8xP4HGWC1O
	ZDsgeSg==
X-Google-Smtp-Source: AGHT+IFjxELA0BNq1G4E0QijL5FN9/8iFWVvHq5YSj689yONqS6ui827UBJhsYL4QvQGyIsYC6a3QGkZb5I=
X-Received: from pjee13.prod.google.com ([2002:a17:90b:578d:b0:311:f699:df0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e46:b0:313:2754:5910
 with SMTP id 98e67ed59e1d1-31c9f3eea5amr15965053a91.15.1752850819578; Fri, 18
 Jul 2025 08:00:19 -0700 (PDT)
Date: Fri, 18 Jul 2025 08:00:17 -0700
In-Reply-To: <kb7nwrco6s7e6catcareyic72pxvx52jbqbfc5gbqb5zu434kg@w3rrzbut3h34>
Mime-Version: 1.0
References: <20250716110737.2513665-1-keirf@google.com> <20250716110737.2513665-3-keirf@google.com>
 <kb7nwrco6s7e6catcareyic72pxvx52jbqbfc5gbqb5zu434kg@w3rrzbut3h34>
Message-ID: <aHphgd0fOjHXjPCI@google.com>
Subject: Re: [PATCH v2 2/4] KVM: arm64: vgic: Explicitly implement
 vgic_dist::ready ordering
From: Sean Christopherson <seanjc@google.com>
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: Keir Fraser <keirf@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Eric Auger <eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_080020_873148_993CC96C 
X-CRM114-Status: GOOD (  21.76  )
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

On Thu, Jul 17, 2025, Yao Yuan wrote:
> On Wed, Jul 16, 2025 at 11:07:35AM +0800, Keir Fraser wrote:
> > In preparation to remove synchronize_srcu() from MMIO registration,
> > remove the distributor's dependency on this implicit barrier by
> > direct acquire-release synchronization on the flag write and its
> > lock-free check.
> >
> > Signed-off-by: Keir Fraser <keirf@google.com>
> > ---
> >  arch/arm64/kvm/vgic/vgic-init.c | 11 ++---------
> >  1 file changed, 2 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> > index 502b65049703..bc83672e461b 100644
> > --- a/arch/arm64/kvm/vgic/vgic-init.c
> > +++ b/arch/arm64/kvm/vgic/vgic-init.c
> > @@ -567,7 +567,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> >  	gpa_t dist_base;
> >  	int ret = 0;
> >
> > -	if (likely(dist->ready))
> > +	if (likely(smp_load_acquire(&dist->ready)))
> >  		return 0;
> >
> >  	mutex_lock(&kvm->slots_lock);
> > @@ -598,14 +598,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> >  		goto out_slots;
> >  	}
> >
> > -	/*
> > -	 * kvm_io_bus_register_dev() guarantees all readers see the new MMIO
> > -	 * registration before returning through synchronize_srcu(), which also
> > -	 * implies a full memory barrier. As such, marking the distributor as
> > -	 * 'ready' here is guaranteed to be ordered after all vCPUs having seen
> > -	 * a completely configured distributor.
> > -	 */
> > -	dist->ready = true;
> > +	smp_store_release(&dist->ready, true);
> 
> No need the store-release and load-acquire for replacing
> synchronize_srcu_expedited() w/ call_srcu() IIUC:

This isn't about using call_srcu(), because it's not actually about kvm->buses.
This code is concerned with ensuring that all stores to kvm->arch.vgic are ordered
before the store to set kvm->arch.vgic.ready, so that vCPUs never see "ready==true"
with a half-baked distributor.

In the current code, kvm_vgic_map_resources() relies on the synchronize_srcu() in
kvm_io_bus_register_dev() to provide the ordering guarantees.  Switching to
smp_store_release() + smp_load_acquire() removes the dependency on the
synchronize_srcu() so that the synchronize_srcu() call can be safely removed.

