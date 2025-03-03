Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D1DC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 19:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3HkVx4+0ayvquy5aaLipWI96mcL5u+NB4DNudaL0vo=; b=eNDKPw9KLVzVNuLvGQp0BSW5S1
	fnpBNEOiSy7P4Cnly8axUh2YeUp6nqC1Zwb8lfI0EXmQqeQa9AHhPPRI6BI6VsqZOUZ4CrtLquYg2
	g1k5sqC5m1CLjeZYzWkfqqn8FiBMq2gj8XYxeTmVp+x75PngNqSV247RPyFx+UwArh1RJqAjy8iU/
	4HxMGM2HLY7MpkydaDVW74OZz9gRmuwvy1vVZyn7jAFJdpMDk7d4b+PpXdcI24mhhytfHel+PFmBK
	G1U9Nw9zcpS27ipuMEaIM0UMDT49ADD+oYKykNwjbzZ6TCOFttACQW2ibpKcZunBfeFo4nRtSGCC3
	HetXKMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBKZ-000000023ch-1zbd;
	Mon, 03 Mar 2025 19:19:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBIy-000000023LA-2i68
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 19:18:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C901A44F5C;
	Mon,  3 Mar 2025 19:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD033C4CED6;
	Mon,  3 Mar 2025 19:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741029499;
	bh=Vg/2VuaawTLlMnp2NzzvT8YzOf8Czwrf1poIJiGpqqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRVnXtrJnlrgRsLrO9TGTZLe50ESltIbfTGcEudZwgeL9oCCckHNN41yquyDdnUiI
	 4ffOEpOrqa1N6rV0eJn0Y/IuC8wLzMGJTy19O6/GzHBRs8J6FpSLRogZKI3+qMY0fx
	 S16HdyLEEnxgPLz/IvK3lF3rO+Y/w7X2Bg1mMBUhs7vi0bmIE1Wj85XtEM0gR64K/D
	 KiKsuARv24cFfG607vxBFQBNoyBj4uma6Rrpi3jrreAhr4jjv9HIaks6tbJO8qVlhu
	 pme30VYiKza+nlwOkWDmtPq7nSgPpTsrSA3KoZMV4l1s8aNYT4ALT01l2hSXkLuEtT
	 62XB5ShLnHXXQ==
Date: Mon, 3 Mar 2025 19:18:13 +0000
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oliver.upton@linux.dev, mark.rutland@arm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com
Subject: Re: [PATCH v2 3/4] KVM: arm64: Factor out pKVM hyp vcpu creation to
 separate function
Message-ID: <20250303191811.GA30361@willie-the-truck>
References: <20250226215520.1759218-1-tabba@google.com>
 <20250226215520.1759218-4-tabba@google.com>
 <Z8ISLxQRcsx2uuHw@google.com>
 <CA+EHjTympdi0wei2Qx=hF2cYvHpzE0sWto2ypcJB3ddmonTROg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTympdi0wei2Qx=hF2cYvHpzE0sWto2ypcJB3ddmonTROg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_111820_749566_BF52AC6D 
X-CRM114-Status: GOOD (  19.89  )
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

On Mon, Mar 03, 2025 at 07:57:00AM +0000, Fuad Tabba wrote:
> On Fri, 28 Feb 2025 at 19:44, Quentin Perret <qperret@google.com> wrote:
> >
> > On Wednesday 26 Feb 2025 at 21:55:19 (+0000), Fuad Tabba wrote:
> > >  static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
> > >  {
> > > -     size_t pgd_sz, hyp_vm_sz, hyp_vcpu_sz;
> > > +     size_t pgd_sz, hyp_vm_sz;
> > >       struct kvm_vcpu *host_vcpu;
> > > -     pkvm_handle_t handle;
> > >       void *pgd, *hyp_vm;
> > >       unsigned long idx;
> > >       int ret;
> > > @@ -161,33 +178,12 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
> > >       if (ret < 0)
> > >               goto free_vm;
> > >
> > > -     handle = ret;
> > > +     WRITE_ONCE(host_kvm->arch.pkvm.handle, ret);
> >
> > What's the reason to make this a WRITE_ONCE? Does it mean we should
> > update the readers to be READ_ONCE()?
> 
> I don't remember the original reason, to be honest. In this case, it
> was to make it consistent with downstream code in Android. That said,
> I plan on revising all of these soon and fixing this (and related
> code) in light of Will's comment regarding potential specter gadgets:
> 
> https://lore.kernel.org/all/20250218092705.GA17030@willie-the-truck/

I'm not sure the spectre stuff changes the concurrency aspects here, so
Quentin's question presumably still stands even after that.

Looking at the Android code, this WRITE_ONCE() pairs with a READ_ONCE()
in pkvm_is_hyp_created() which is called without the config_lock held
by kvm_arch_prepare_memory_region(). However, given that
pkvm_is_hyp_created() is only testing against 0, I don't think the
_ONCE() accessors are doing anything useful in that case.

The more confusing stuff is where 'kvm->arch.pkvm.handle' is read
directly without the 'config_lock' held. The MMU notifiers look like
they can do that, so I wonder if there's a theoretical race where they
can race with first run and issue TLB invalidation with the wrong handle?
That would apply equally to the upstream code, I think.

Will

