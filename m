Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B004FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0oZAMD7udZnD2znaSjoen/SyP0kj9p+GoRRy/BtAbo=; b=DQvDA1ooZc51StB757J2ANTNJb
	UmCrcDIbqAByFPrJJE0kr8Qf0U2+/Zfqzu6sLvy4Pu6ZeUJOl89pDIEWEoLmGPIdXOSLkEnXgcevV
	K8gdjWrtjstDPyLJFKp175HSzO/GRXDyAc7gps6OGYbKMN2s4vBzUWpgrSoTVlZ6ShujOkaS5QME2
	zM6kZBTG0HYLqtaVZpILdMUl1OFb0nGyBxyGWt3zPgaHJhZGRwnlaJ6HZp3aNyDtxmOZvytjRztVs
	rAVGg0cjFB/ZvHGsB9EUirzfZ7e9ZRCBR+f9ua2rXnqLNh/WM7dO12M94hwNuGfItd3edD06hAhC1
	zkLgA9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsO4H-00000008sQP-3ZtW;
	Wed, 12 Mar 2025 15:32:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsO19-00000008s4b-2nKf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 15:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ED8F55C5BC3;
	Wed, 12 Mar 2025 15:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2151CC4CEDD;
	Wed, 12 Mar 2025 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741793350;
	bh=tUtskz12THQl2lUAFZuDpLAXb7jPXmXFOy11AYim8Fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ki8HNWAykk88TACHZmdKNf4pIY4RMMzd5xWumgtSFOkudpodAzvR2F5wBdz+h0Zz2
	 nNlRItqijbP4LurgcPamVvWqB4/8nDWGGPJ1xqvRpypPuN3vU03GM4nixfxpDoFz9p
	 Xbzi8UHwR/Q0eWPjitHEFDB/r5WM15MZ1984PcGTnePCSQJ9xlRogHSzYMn+AB75SM
	 Ta58X92WvDaD7O6Os8M5JxFfsEou/oZ6MgQKrXgT9ihtOSr71z6PssS2f6PK14iiho
	 f058iOUTQl74fEt15Jp9mBo/KT0Va2/OLuqFfcqILe9Z4Vuy9DQ3g6kS1fVkb7lA+2
	 RsXupyrM4PsTg==
Date: Wed, 12 Mar 2025 15:29:04 +0000
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oliver.upton@linux.dev, mark.rutland@arm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com
Subject: Re: [PATCH v2 3/4] KVM: arm64: Factor out pKVM hyp vcpu creation to
 separate function
Message-ID: <20250312152903.GA6488@willie-the-truck>
References: <20250226215520.1759218-1-tabba@google.com>
 <20250226215520.1759218-4-tabba@google.com>
 <Z8ISLxQRcsx2uuHw@google.com>
 <CA+EHjTympdi0wei2Qx=hF2cYvHpzE0sWto2ypcJB3ddmonTROg@mail.gmail.com>
 <20250303191811.GA30361@willie-the-truck>
 <CA+EHjTySqDHDpOy=Vix5ZaNKWg61coySvV3Yk=+i0p8vg3mXTQ@mail.gmail.com>
 <20250303214947.GA30619@willie-the-truck>
 <CA+EHjTzZQ6UnOdaqpZ86JNiY=Gr_UoBAjZxk4CS3Q6nMJYdV2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzZQ6UnOdaqpZ86JNiY=Gr_UoBAjZxk4CS3Q6nMJYdV2w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_082911_818009_B4C11150 
X-CRM114-Status: GOOD (  42.15  )
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

On Tue, Mar 04, 2025 at 12:33:27PM +0000, Fuad Tabba wrote:
> On Mon, 3 Mar 2025 at 21:49, Will Deacon <will@kernel.org> wrote:
> >
> > On Mon, Mar 03, 2025 at 07:21:33PM +0000, Fuad Tabba wrote:
> > > On Mon, 3 Mar 2025 at 19:18, Will Deacon <will@kernel.org> wrote:
> > > > On Mon, Mar 03, 2025 at 07:57:00AM +0000, Fuad Tabba wrote:
> > > > > On Fri, 28 Feb 2025 at 19:44, Quentin Perret <qperret@google.com> wrote:
> > > > > > On Wednesday 26 Feb 2025 at 21:55:19 (+0000), Fuad Tabba wrote:
> > > > > > >  static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
> > > > > > >  {
> > > > > > > -     size_t pgd_sz, hyp_vm_sz, hyp_vcpu_sz;
> > > > > > > +     size_t pgd_sz, hyp_vm_sz;
> > > > > > >       struct kvm_vcpu *host_vcpu;
> > > > > > > -     pkvm_handle_t handle;
> > > > > > >       void *pgd, *hyp_vm;
> > > > > > >       unsigned long idx;
> > > > > > >       int ret;
> > > > > > > @@ -161,33 +178,12 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
> > > > > > >       if (ret < 0)
> > > > > > >               goto free_vm;
> > > > > > >
> > > > > > > -     handle = ret;
> > > > > > > +     WRITE_ONCE(host_kvm->arch.pkvm.handle, ret);
> > > > > >
> > > > > > What's the reason to make this a WRITE_ONCE? Does it mean we should
> > > > > > update the readers to be READ_ONCE()?
> > > > >
> > > > > I don't remember the original reason, to be honest. In this case, it
> > > > > was to make it consistent with downstream code in Android. That said,
> > > > > I plan on revising all of these soon and fixing this (and related
> > > > > code) in light of Will's comment regarding potential specter gadgets:
> > > > >
> > > > > https://lore.kernel.org/all/20250218092705.GA17030@willie-the-truck/
> > > >
> > > > I'm not sure the spectre stuff changes the concurrency aspects here, so
> > > > Quentin's question presumably still stands even after that.
> > > >
> > > > Looking at the Android code, this WRITE_ONCE() pairs with a READ_ONCE()
> > > > in pkvm_is_hyp_created() which is called without the config_lock held
> > > > by kvm_arch_prepare_memory_region(). However, given that
> > > > pkvm_is_hyp_created() is only testing against 0, I don't think the
> > > > _ONCE() accessors are doing anything useful in that case.
> > > >
> > > > The more confusing stuff is where 'kvm->arch.pkvm.handle' is read
> > > > directly without the 'config_lock' held. The MMU notifiers look like
> > > > they can do that, so I wonder if there's a theoretical race where they
> > > > can race with first run and issue TLB invalidation with the wrong handle?
> > > > That would apply equally to the upstream code, I think.
> > >
> > > Would using _ONCE accessors with the MMU notifiers be enough to avoid
> > > the race, or do we need to reconsider the lock protecting the handle
> > > and apply it to the notifiers?
> >
> > I'm not entirely sure... if we used _ONCE() then we'd get either the
> > correct handle or zero, but we presumably need to order that against the
> > page-table somehow. The 'mmu_lock' looks like it gives us that, but I
> > don't think the notifiers are expecting an uninitialised handle in the
> > case where the page-table is empty (i.e. if they fire before first run).
> >
> > Given that the handle is necessary for TLB invalidation, I'd be inclined
> > to make sure that the handle is allocated and published _before_ the
> > kvm_pgtable pointer checked by the notifiers is set, but that means
> > moving the handle allocation into kvm_arch_init_vm(). Is that do-able?
> 
> It is doable, but it won't be a simple patch. Up until now, the
> creation of the hyp view of a vm is associated with the first run of
> the vm, rather than its allocation at the host. Part of the reason for
> that is that much of the vm state (mainly the vcpu state) isn't
> finalized until then.
> 
> This patch series fixes this in part, by decoupling the initialization
> of the individual vcpus from the vm. Because of that, it would be
> doable, but it might be better as another patch series that we could
> test and analyze separately.
> 
> If you agree, I could whip up something and send it soon.

Yeah, I think we should fix this as a separate series and drop the
WRITE_ONCE() from this patch.

Will

