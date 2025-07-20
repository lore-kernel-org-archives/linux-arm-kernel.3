Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3C8C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 00:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kl5dOLRGZSE3XxSQd2+oJTQaOnXruucC4cwYHuCuPzY=; b=zNnF0uLN7P6WXpRxBkc1WzWCLI
	CUUsivnzMvsfuDgnyemkV+M64bjENlCXlFnbECF9T0PbGkNJdsr+zHUxQw5Kxt9LKcrjmmPDYexME
	RktmI/g5HwtWq027SVV4DQWoT6mHC2zMt/xKYOArCk8Uorsf+XpJ0kH0U0VYcix71MWLgUqZg8KWO
	VuP4b0srUzSP2rRb3s7HtKWavZBHNmD88Xx/pRFHNP2zjJc74WpsSb9bsR5g6R3eAGIkoveejKd9R
	kcqw2e2Oe5CqTWkQC319K3ksfGBz7GXVrB11KohaDCpnfEcHmRdfFfUKIpsM6jkaJe/gWbtwunkcP
	XVr+bstA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udHeh-0000000ElDC-1kkn;
	Sun, 20 Jul 2025 00:11:51 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udHbX-0000000El2F-1PG3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 00:08:36 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso2460276a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 17:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752970114; x=1753574914; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kl5dOLRGZSE3XxSQd2+oJTQaOnXruucC4cwYHuCuPzY=;
        b=PQCLy/xyBk7m32kr54nl+Xd8yexXBG9pFSAM7Y1uchl9ZxP99OjKWwZYxBpzhB4AEy
         Y1Jd/Wn7Myy7zGyjwxSETAsBwK2Eb94vMrIArv2EoQbfipu+7R2oZ0gmYJaJ71c3ZCwa
         qMXOFyXdOX68Z+BOTkrvO7KalQbfI71smQeGeOMIs3uhI71bpiEUMeMQy0NUra3vAIgy
         74PAQqS4Ya6HwVcnEeVvoPeErfT+tU3LjaQPJkpFBzxBGMS24o/595A6wd1x8Pf/eXB9
         ViaRH4syzMJzKxdd9YEZlogq0BeHBXXTf6Z+HEodlAMHJ9L0EdUbTxtpkZRClT6ghT5x
         eHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752970114; x=1753574914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kl5dOLRGZSE3XxSQd2+oJTQaOnXruucC4cwYHuCuPzY=;
        b=MOK/X4HD8wQW0xvNE8U1yOqI7VYDFk5ENdXZY6U2Q0Vyh4KfazBquzifZ6iTyGoyQ3
         p50JqAxH+1o6ZxqIs/BtOV6v/xr4hr8RmJv9r8C3aDaoJlnbe449+FyreRaXRcnmJuy3
         cTXqZy0LTKuApqF96TtOH6oXvBLAOFvAZAkZS/li7LCzSY5Pg+NryRDmavdWDBSUnA4N
         3sEije02ZRSHuBFR9eyFOaBPUn98r1IkyVg7m/L0eVQ6y03V9lqhAEhGoPgXfK58+vWM
         vf8Jbe/9rEXVoLR2ZxD2li9iVEIkDJmZdwZ6ogsJg2s8z0qlmo0MAJXMsDR423PT9o4Z
         aYmg==
X-Forwarded-Encrypted: i=1; AJvYcCWof2a/0trFErzzQIu8cjIw8lsuRsFEGztmWkMVu+d6XkcufQpPgLbYfPuXJXi6CET5AadbgV8dcfQ+XNG+n7oE@lists.infradead.org
X-Gm-Message-State: AOJu0YzEWNaTOPDyHgm1AJQedBEkqvLUvotPoBkcmfD9y9XTnKP9fmor
	qs42H357GnbCip4HaEOWMchFjwm/WBBXEfLEqIdJ01WD4QmFTq+k2leG
X-Gm-Gg: ASbGncv324JPzAaPOOCAQ6U5P+rpCASREqFOh9SSP9EbOv4zhdTBVkmJsUW28OytGuA
	JxHpTLimaK03ciCxvNfTw8CxKdpw+cILrXMIAE/3hiYMz/GskGzRRZ1DHpoc7ukiA6+/60BpfJc
	VAsYDRdUBSwYrUHQWGntDl0y/yledTA/iMdLPOBe3CWKFQ5jvhq9GWmyCWqBo/xztkktsTyDGhJ
	L+nigrd8txwwkqRsQZHsdWaiDj+uRKfKBdhbt2s7N8a36016SY7GXNX36UkLZ3yxb+KCkreNW1t
	ZsJ351z+ffx1O2vLsiDZep3DiKbcNlio94rY2iDxfACxucij/2E6YwIbXmegPJ5blWz2FGXhOf4
	gLXPawoiHPBde2DvyDc1fNQ==
X-Google-Smtp-Source: AGHT+IE8XY+dnJCyO+fxfVPZjk61YisG840KHkxyISTYR3V12PFOL8A/LUQwYZFMMwVeIkosxKL8zw==
X-Received: by 2002:a17:903:198d:b0:23a:cba1:6662 with SMTP id d9443c01a7336-23e24f94702mr281107665ad.46.1752970114388;
        Sat, 19 Jul 2025 17:08:34 -0700 (PDT)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23e3b6b4a9esm34086575ad.93.2025.07.19.17.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 17:08:33 -0700 (PDT)
Date: Sun, 20 Jul 2025 08:08:30 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Keir Fraser <keirf@google.com>
Cc: Sean Christopherson <seanjc@google.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/4] KVM: arm64: vgic: Explicitly implement
 vgic_dist::ready ordering
Message-ID: <4i65mgp4rtfox2ttchamijofcmwjtd6sefmuhdkfdrjwaznhoc@2uhcfv2ziegj>
References: <20250716110737.2513665-1-keirf@google.com>
 <20250716110737.2513665-3-keirf@google.com>
 <kb7nwrco6s7e6catcareyic72pxvx52jbqbfc5gbqb5zu434kg@w3rrzbut3h34>
 <aHphgd0fOjHXjPCI@google.com>
 <5zpxxmymnyzncdnewdonnglvmvbtggjyxyqvkf6yars2bbyr4b@gottasrtoq2s>
 <aHtQG_k_1q3862s3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHtQG_k_1q3862s3@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_170835_376377_DA6B728A 
X-CRM114-Status: GOOD (  36.89  )
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

On Sat, Jul 19, 2025 at 07:58:19AM +0000, Keir Fraser wrote:
> On Sat, Jul 19, 2025 at 10:15:56AM +0800, Yao Yuan wrote:
> > On Fri, Jul 18, 2025 at 08:00:17AM -0700, Sean Christopherson wrote:
> > > On Thu, Jul 17, 2025, Yao Yuan wrote:
> > > > On Wed, Jul 16, 2025 at 11:07:35AM +0800, Keir Fraser wrote:
> > > > > In preparation to remove synchronize_srcu() from MMIO registration,
> > > > > remove the distributor's dependency on this implicit barrier by
> > > > > direct acquire-release synchronization on the flag write and its
> > > > > lock-free check.
> > > > >
> > > > > Signed-off-by: Keir Fraser <keirf@google.com>
> > > > > ---
> > > > >  arch/arm64/kvm/vgic/vgic-init.c | 11 ++---------
> > > > >  1 file changed, 2 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> > > > > index 502b65049703..bc83672e461b 100644
> > > > > --- a/arch/arm64/kvm/vgic/vgic-init.c
> > > > > +++ b/arch/arm64/kvm/vgic/vgic-init.c
> > > > > @@ -567,7 +567,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> > > > >  	gpa_t dist_base;
> > > > >  	int ret = 0;
> > > > >
> > > > > -	if (likely(dist->ready))
> > > > > +	if (likely(smp_load_acquire(&dist->ready)))
> > > > >  		return 0;
> > > > >
> > > > >  	mutex_lock(&kvm->slots_lock);
> > > > > @@ -598,14 +598,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> > > > >  		goto out_slots;
> > > > >  	}
> > > > >
> > > > > -	/*
> > > > > -	 * kvm_io_bus_register_dev() guarantees all readers see the new MMIO
> > > > > -	 * registration before returning through synchronize_srcu(), which also
> > > > > -	 * implies a full memory barrier. As such, marking the distributor as
> > > > > -	 * 'ready' here is guaranteed to be ordered after all vCPUs having seen
> > > > > -	 * a completely configured distributor.
> > > > > -	 */
> > > > > -	dist->ready = true;
> > > > > +	smp_store_release(&dist->ready, true);
> > > >
> > > > No need the store-release and load-acquire for replacing
> > > > synchronize_srcu_expedited() w/ call_srcu() IIUC:
> > >
> > > This isn't about using call_srcu(), because it's not actually about kvm->buses.
> > > This code is concerned with ensuring that all stores to kvm->arch.vgic are ordered
> > > before the store to set kvm->arch.vgic.ready, so that vCPUs never see "ready==true"
> > > with a half-baked distributor.
> > >
> > > In the current code, kvm_vgic_map_resources() relies on the synchronize_srcu() in
> > > kvm_io_bus_register_dev() to provide the ordering guarantees.  Switching to
> > > smp_store_release() + smp_load_acquire() removes the dependency on the
> > > synchronize_srcu() so that the synchronize_srcu() call can be safely removed.
> >
> > Yes, I understand this and agree with your point.
> >
> > Just for discusstion: I thought it should also work even w/o
> > introduce the load acqure + store release after switch to
> > call_srcu(): The smp_mb() in call_srcu() order the all store
> > to kvm->arch.vgic before store kvm->arch.vgic.ready in
> > current implementation.
>
> The load-acquire would still be required, to ensure that accesses to
> kvm->arch.vgic do not get reordered earlier than the lock-free check
> of kvm->arch.vgic.ready. Otherwise that CPU could see that the vgic is
> initialised, but then use speculated reads of uninitialised vgic state.
>

Thanks for your explanation.

I see. But there's "mutex_lock(&kvm->slot_lock);" before later
acccessing to the kvm->arch.vgic, so I think the order can be
guaranteed. Of cause as you said a explicitly acquire-load +
store-release is better than before implicitly implementation.

> > >

