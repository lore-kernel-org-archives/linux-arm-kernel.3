Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A811C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cuwD88UjU46NkDV8CZP70BiMvjpg3xf5O50MzNPfDY=; b=Xch3tUDJ2e2pdoOwi/2ip0lqRM
	JnV6heePYHCSDgMThyehwDxfhREVjEjfqrDZUR+dv6V8doVT8YL3zWa3oDBRA5xf9BiVHIdrDzMH3
	rcI/okH2kQ1WU7EEXzTLQ5urpPu1VXJPujEmhgcPhD03mW9wb1cob9o6HvS81SFq2qQWpVzwTbzAY
	QtEmULb92niEsG/wf7OEWWYNluBXjYyjnMlUaIMH3/kx9LaLBzGswSUYOSjsafZrpoiYS//WNzZnY
	GvGpW9KyEfch4C1OzuDU5ztecfeVvPSg+k+aD9tpzYZJO3/pjN82JKupn8GdbRSDaOXpYyPPQjPk8
	+oPnSF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5wS-00000008pyS-1YjZ;
	Tue, 21 Jul 2026 08:35:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5wP-00000008pxj-2Czo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:35:06 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so204545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784622904; x=1785227704; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/cuwD88UjU46NkDV8CZP70BiMvjpg3xf5O50MzNPfDY=;
        b=Ia9tMeQrmSMXNNVduDJ+dSgnmfXe3JDbaqQZCsFCl5TADlKk1xwKd0qZVfOyYPwXyN
         9oG9YDBd/OlAi94CmmDgUyf1TXEpRO1hmmNW6ksYMZ5vhloceTrjahUitbY2MbkM5CsI
         kJGRwH8do/Hxk3kclgiWBuNY50x+w+Twwr17IhSvzvO1mMlz3eajjDAkfH6sd5vDmBIz
         MWtDf2YJ8dNOdx4KDpHbAkNx4SOXhoXD2SWFmon7FfwAl/vU0ju2icdQ6fGW2vDYwXPL
         GAiez6KkxwYIDHJ1Ve5BqCDloDxLZtWxbv6ppLJxHD9hC8WRWZtdfQScsvzb1zdab0To
         RLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622904; x=1785227704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/cuwD88UjU46NkDV8CZP70BiMvjpg3xf5O50MzNPfDY=;
        b=L+7+kOEUA1/l52StMc3PAvF5y7jXIrZXqIPpPPKObvUhA3JXtPiyxpm0kSBP82gZXh
         dIL0sLNpxx5kP2bfW0xg4tIrA6y/zmI0fZEJbL06DXAR1c8QPATL/3fCQmJNsHs+wWp7
         TYCkrtf9PKDTOaXOxugaRnSFYtyCwzFNZSz+Ko0OdY90K565EqBHthN9iGlo5Wq+6xLx
         AxO3SZ45amRqfNKDog91h1zAUh7W2IYyxxrNkbciwJgxn0CSQRgj2q6uK7zSx/jVK4i4
         S8c4/B9YEdCbH93nMvQLp8SYZhXS+Tuv8OKXNAxToN+TnSO4pCfGasjC18Se2eeWEQ4b
         UKow==
X-Forwarded-Encrypted: i=1; AHgh+RoSIHlrZH96PjRT6VFhZC7mWqAT3CH0B6/AY32faNQKtfZ76pfWj2WyLgPJSpbK37SFpu9vedDWhHMGWhSV04P/@lists.infradead.org
X-Gm-Message-State: AOJu0YzHJanYpZ2RKBT4vIEUNOw8SX8gwmojw+Ib5sQ+/XnD8rBpOkNX
	J7kdf3+7dkcHFhWLKKARfvrJyVkZvKJvtPsgsY6Smftw1nP/M5TSLyZNGYleDZ1TjA==
X-Gm-Gg: AfdE7cmNMLD2sn0nEFSA7GjwwV4qJMw+KALdRRbIgJ5dGK5nDj3lpmaA8hHQvG5J9BI
	GW14tkmNumqrXbQJG7sIwD+7ZR/lLDOFRyloEByGo9ISI9X7LTbe5BHICqa4ffgjUN69J+TRan9
	umbq4niNpMsL2s1SHsk3CICW5Uw/Ir/xuegwdUBhGfMKQlNhvDKqP0VCvGWOdIFp3rvl5tEhLU2
	l0d0Cyr3s2fV/5R/qm1GdKfbEDkm9zsx4nXV1Cv947kffcYP4ero4leDk7hHenv+ucVgfqChLoI
	FXaVGVcddSGrRm+n9QeawIv1KY9SffLHCakO9HYfp9VOLWFk3y2daZxd26VLbctcso609+8uZPQ
	zIwalMjU9uL2BqpDjscajqI2gpthLn31AZTMjcvXaNy9/5TNm7mAvRIj2sjiWXbyawPwCZwVIwA
	RvW8fNHh8HAElhX52Dd/owBrobvLpCvAUYWzWPx0t2Vssv2R0j
X-Received: by 2002:a05:600d:8498:10b0:48a:5618:b4d4 with SMTP id 5b1f17b1804b1-4956435334cmr1374105e9.1.1784622903180;
        Tue, 21 Jul 2026 01:35:03 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563e4573bsm59467485e9.0.2026.07.21.01.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:34:59 -0700 (PDT)
Date: Tue, 21 Jul 2026 08:34:52 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	vdonnefort@google.com, tabba@google.com
Subject: Re: [RFC PATCH 2/2] KVM: arm64: Support BBM level 3
Message-ID: <al8vLJfY4seh4d5n@google.com>
References: <20260717130901.2239134-1-smostafa@google.com>
 <20260717130901.2239134-3-smostafa@google.com>
 <alqW49CH7eViDpAZ@kernel.org>
 <alvaEgJFJ5DaQaac@google.com>
 <CAFgf54r0xYwUGgPMY=1aTRzcqX7jKp545Jb+p_yFW=JwAX0E4g@mail.gmail.com>
 <8633xcg87z.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8633xcg87z.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_013505_597825_7EEC39F9 
X-CRM114-Status: GOOD (  41.97  )
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

On Tue, Jul 21, 2026 at 07:36:16AM +0100, Marc Zyngier wrote:
> On Mon, 20 Jul 2026 21:41:04 +0100,
> Mostafa Saleh <smostafa@google.com> wrote:
> > 
> > On Sat, Jul 18, 2026 at 8:55 PM Mostafa Saleh <smostafa@google.com> wrote:
> > >
> > > Hi Oliver,
> > >
> > > On Fri, Jul 17, 2026 at 01:56:03PM -0700, Oliver Upton wrote:
> > > > Hi Mostafa,
> > > >
> > > > On Fri, Jul 17, 2026 at 01:09:00PM +0000, Mostafa Saleh wrote:
> > > > > If the system supports hardware Break-Before-Make (BBM) level 3, use it
> > > > > to replace stage-2 PTEs directly instead of falling back to the software
> > > > > break-before-make sequence.
> > > > >
> > > > > 1) Get a reference count on the containing table for the new PTE.
> > > > > 2) Atomically update the PTE with the new valid descriptor.
> > > > > 3) Invalidate the TLB for the old PTE.
> > > > > 4) Drop the reference count holding the old PTE.
> > > > >
> > > > > One interesting case, as BBML3 will update the PTE atomically, it
> > > > > can only know it raced with another core at the point of the cmpxchg
> > > > > failing, unlike the SW implementation which locks the PTE first.
> > > > > And as we must issue CMOs to the new mapped page before the update,
> > > > > that means with BBML3 racing cores will issue redundant CMOs,
> > > >
> > > > I'd rather we just predicate BBML3-style transformations on an
> > > > implementation having FEAT_S2FWB and DIC. You can definitely come along
> > > > later and enable it when using a stage-2 in an SMMU makes this
> > > > mandatory, possibly at the expense of some extra CMOs.
> > >
> > > Makes sense, I will do that in v2.
> > >
> > 
> > Looking into this, I see some existing inefficiencies (or maybe I do
> > not understand it well)
> > - pKVM still do some work for dcache with FWB I posted a patch for that:
> > https://lore.kernel.org/all/20260720203529.1276355-1-smostafa@google.com/
> > 
> > - KVM does not elide the icache maintainence with DIC, it seems we
> > should have something similar for the FWB check in
> > __clean_dcache_guest_page() as
> > 
> > diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> > index 6eae7e7e2a68..d0a4ae66b069 100644
> > --- a/arch/arm64/include/asm/kvm_mmu.h
> > +++ b/arch/arm64/include/asm/kvm_mmu.h
> > @@ -247,6 +247,9 @@ static inline size_t __invalidate_icache_max_range(void)
> > 
> >  static inline void __invalidate_icache_guest_page(void *va, size_t size)
> >  {
> > +       if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
> > +               return;
> > +
> >         /*
> >          * Blow the whole I-cache if it is aliasing (i.e. VIPT) or the
> >          * invalidation range exceeds our arbitrary limit on invadations by
> > 
> > or I am missing something?
> 
> The latter. The shortcuts are in the individual helpers.
> We have:
> 
> 	static __always_inline void icache_inval_all_pou(void)
> 	{
> 		if (alternative_has_cap_unlikely(ARM64_HAS_CACHE_DIC))
> 			return;
> 
> 		asm("ic	ialluis");
> 		dsb(ish);
> 	}
> 
> and
> 
> 	SYM_FUNC_START(icache_inval_pou)
> 	alternative_if ARM64_HAS_CACHE_DIC
>         	isb
>         	ret
> 	alternative_else_nop_endif
> 
>         	invalidate_icache_by_line x0, x1, x2, x3
> 	        ret
> 	SYM_FUNC_END(icache_inval_pou)
> 
> it's not completely obvious to me why we have an ISB in
> icache_inval_pou(), but at least the invalidation elision is already
> there.

Ah, sorry about the noise! That’s why I shouldn't send late emails :)

I am not sure why the isb is needed, at least for KVM it should be
OK, besides that kexec uses it.

Thanks,
Mostafa

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

