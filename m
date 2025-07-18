Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C853C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRq4mZGW6hHwIgirPnFC0Ellx4rYs15LC6saX2uSxGU=; b=pRWGd4GuahmfKtv9452Ap5bCS+
	duShf05hJuBym6Hu1y/6Lp1SF4tGUES0L5iKG4mvglr4odHDpN04awW2H1aaurqJPZjkjpqHLDcti
	C6hoe8+EvKMbH5HICV8hCQ8kyxN8qRZne5OBOqsTI+RmBv4uPXgpBRBgBUZZTxfXqQse+IBBnHOD5
	Y49oL2kZsZNzvbdbFfm4SMB+cKUw7yrhJyWMyvCGPcEMtgA+wry5fvvzeC5uEUJBeIt0+V82zX9yB
	cD9mPAHyBT+D2zNKfRlq6kfNfeasQ+vlHkzw/3pWa0Pl54Ypd2Lcvkiq39DONDY4peXiaV2aqs4sV
	rl5thsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmVa-0000000CrtS-0FBh;
	Fri, 18 Jul 2025 14:56:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmT7-0000000CrXo-3IX6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 14:53:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so16182555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752850427; x=1753455227; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cRq4mZGW6hHwIgirPnFC0Ellx4rYs15LC6saX2uSxGU=;
        b=wIZsiNlKpgdeRM242nN5c+wVqkdr2MrfRhExgvtz9FM2tnDlNMYM+d8x2TYu5mNOnE
         P7a7qwj+DBgqYaMGMonzZZTaL12rv2QmIwqOQMUiYh3yNqPaUnMTN28paq8QFfw7HgZc
         O0hfr3nTIiiTBSZXJmkIqZeo0Z57t5tRptr9gSFOXjttQZ+hkro9cxYZLa/fMIdFWuLV
         FiylO6SROYqf6F4glPwm8gnevXJpAx0B4XNL8p12GWeSMYmte0C3yEZgcyMwVDURcm6y
         DIo2GG8EgVIE4qbYDyUNB3rO3ncdOct0rhaFUB4VjO1/uek+E7MDr7RACVpZIfwstiOm
         NzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752850427; x=1753455227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRq4mZGW6hHwIgirPnFC0Ellx4rYs15LC6saX2uSxGU=;
        b=e2s7+ak+3U7Rqz+SUNS1NZ1ZJEMI3aOTcy77AvYHAEFwFe0vZ8S6JeXfRQwBMPokM4
         FXeHdiPRagQenFmx8BDKzy+80RG94maoN+9zWShpjencPxboKuDILONu6fLB28haPvAc
         XZ0lOgnbpj6amVCXF4UlgZF+8dLqB1qDIa7aMIp7AUtYG1n2K+bfb06jbmva7HOj7UFQ
         4NNsagSBkYJ4molMQOz60fYNZ5GmzBDPXeQ50OGjQY+EqIJcH/rN3AbM8kM9fOlqmrV9
         uor8LKbeJ75BopHGi2HArohTMKXR9cZavdo/loHikg4UKn34uSOcyve0nMahiV5TVgN9
         X4PQ==
X-Gm-Message-State: AOJu0YyGFmHTD43VotL4c1+uT7MFDfLqB5oL7HhIHI0gWazXMSfJu/pD
	PrtMhhH3mnAZzD8zgWLOZ3PZ9NvaNDksK1QgZjzDxd6Gw+m2ojb99cOnyatcBIPlPg==
X-Gm-Gg: ASbGncsbMAOw686Fs83CCUjD1cvrmThh6FfZKqE/Xz4qNlkuISS2qREUx0hhJH6cGfy
	9pj8wtzTr499L+rm/1urvNqZyapADRjbaWAP8ko3+NOzqbA4f97T7/6gtLUP92eooLifR/8q4ob
	t8xa5yNHNmkFpHVLdx8qr8Wdnnwggy56SEb8lG36n/ySqK/TWaQ+vw+sWYIu6FQqHQ374KwzKd9
	0iM3bljw3Cqq61+kReqVDEIUHgULDsC2nl22WDerU1z0IOV9i8MukdszF/SPP0CltCPkGzaAw93
	7sH1QXUu7ckZHhtmYL6ojamtsy1a/Ad1txj9h7qDQ0YbaQSRsBh+hFR6u9V7yw/R9PzhHus3K9h
	yvoGoI+KDN3Vh0NDy07f8IQMgt5r6Qt9K/G/A0HPpsU2l3H+s2xY+H7o4P7Lu2HIo4x0c1g==
X-Google-Smtp-Source: AGHT+IHRoLNQ/BOi8gPhfanYsriNie013yEjEncyuc0ze1Z2dpZlN67n7NZfnIUPQdvgGELPGcgEHQ==
X-Received: by 2002:adf:e193:0:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3b60e5242a1mr10025699f8f.57.1752850427262;
        Fri, 18 Jul 2025 07:53:47 -0700 (PDT)
Received: from google.com (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563f7c88a0sm11817035e9.2.2025.07.18.07.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 07:53:46 -0700 (PDT)
Date: Fri, 18 Jul 2025 14:53:42 +0000
From: Keir Fraser <keirf@google.com>
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/4] KVM: arm64: vgic: Explicitly implement
 vgic_dist::ready ordering
Message-ID: <aHpf9vuRK691J7HD@google.com>
References: <20250716110737.2513665-1-keirf@google.com>
 <20250716110737.2513665-3-keirf@google.com>
 <kb7nwrco6s7e6catcareyic72pxvx52jbqbfc5gbqb5zu434kg@w3rrzbut3h34>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kb7nwrco6s7e6catcareyic72pxvx52jbqbfc5gbqb5zu434kg@w3rrzbut3h34>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_075349_823623_3E43890D 
X-CRM114-Status: GOOD (  22.94  )
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

On Thu, Jul 17, 2025 at 01:44:48PM +0800, Yao Yuan wrote:
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
> 
> Tree SRCU on SMP:
> call_srcu()
>  __call_srcu()
>   srcu_gp_start_if_needed()
>     __srcu_read_unlock_nmisafe()
> 	 #ifdef	CONFIG_NEED_SRCU_NMI_SAFE
> 	   	  smp_mb__before_atomic() // __smp_mb() on ARM64, do nothing on x86.
> 	 #else
>           __srcu_read_unlock()
> 		   smp_mb()
> 	 #endif

I don't think it's nice to depend on an implementation detail of
kvm_io_bus_register_dev() and, transitively, on implementation details
of call_srcu().

kvm_vgic_map_resources() isn't called that often and can afford its
own synchronization.

 -- Keir

> TINY SRCY on UP:
> Should have no memory ordering issue on UP.
> 
> >  	goto out_slots;
> >  out:
> >  	mutex_unlock(&kvm->arch.config_lock);
> > --
> > 2.50.0.727.gbf7dc18ff4-goog
> >

