Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBCCCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dwOmCBAOJzodyb5F2mSRZPPkcWx4GfSifh0Yv8qIpE=; b=s1867sRru1NGIq74CgJg93vqyS
	pY3JdMc7MA5WQk+n9VqYEkfVc1RbQXt/DJTwSygMauP/bFfRrFMgdyLKNg8drc+lhUqTuaNMyF5Bf
	JIeDnHitipMTuDeHJ5SP14MtwB671EhCzqkBNwsOS/sIiqy9/1zO7tITIz11ZQA4f0F6U+bVwYOF6
	b5LjbFcnWVxceuP17/9iMRifYLhMGqPcOZbeDUpfv457XZn9wHD6XUI7B/+qoGduYUH/b1LQzYTAG
	4Fasrt0txOgQww5MypEdwDqOMxzYlOFZguzizERuOC1kxAOXoTmb+MFjaexZnhdSeOr5owo5c/3vd
	0I8IwbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJnV-00000001Vqk-1HJQ;
	Tue, 19 May 2026 12:43:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJnU-00000001VqR-0247
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:43:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A35060129;
	Tue, 19 May 2026 12:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0E9C2BCB3;
	Tue, 19 May 2026 12:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779194622;
	bh=hmwbv3gqqbu9yBYmBx9zaYS9bABt+uvbkJGYxywxwzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rVE1YeOZV2XbKbVfX+FQ9bZc9J7twuHL/3/W1z+n+q07I1Z1Ko5baS4YO5TmKvyOK
	 rd9HoZ5sdQejOXx0oAlv0aSFMayjD0fK1gdCeJtdvMa6l7b0U1S8iLa1zPIimBPbJl
	 Ez+esnryZEKDSlLimDEo2/+DvY+XYihEdtvT47lsV4r91sOW8ktv/EI24ihElDFjdf
	 lWtKOMweX98zCjFdUlxYNRVm60qqDSEOiqwe1PC50Qx7JcztgWiKtG4i9MNCqERXdd
	 nHE3ocfqpp3I7DNWnI56vOKM9c9S2lEPiNqq4qnZ5A06o+mBagO1kvdjUYEw39MywW
	 N5r9RaC5RaNtA==
Date: Tue, 19 May 2026 13:43:37 +0100
From: Will Deacon <will@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] KVM: arm64: Introduce S2 walker SKIP return
 options
Message-ID: <agxa-TydN1PoKsYn@willie-the-truck>
References: <20260515195904.2466381-1-leo.bras@arm.com>
 <20260515195904.2466381-2-leo.bras@arm.com>
 <agq-RyKhBy4CIThm@kernel.org>
 <agrTQMw4QJX6HGrm@willie-the-truck>
 <agsYF-Dav2bpxWK4@devkitleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agsYF-Dav2bpxWK4@devkitleo>
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

On Mon, May 18, 2026 at 02:45:59PM +0100, Leonardo Bras wrote:
> Hello Oliver, Will,
> Thanks for reviewing!
> 
> On Mon, May 18, 2026 at 09:52:16AM +0100, Will Deacon wrote:
> > On Mon, May 18, 2026 at 12:22:47AM -0700, Oliver Upton wrote:
> > > On Fri, May 15, 2026 at 08:59:02PM +0100, Leonardo Bras wrote:
> > > > Introduce S2 walker return values:
> > > > - SKIP_CHILDREN: skip walking the children of the current node
> > > > - SKIP_SIBLINGS: skip waling the siblings of the current node
> > > > 
> > > > Also, modify __kvm_pgtable_visit() to fulfil the hing on above return
> > > > values. Current walkers should not be impacted
> > > 
> > > I'd rather see something based around new walk flags than introducing an
> > > entirely new mechanic around return values.
> > > 
> > > e.g. you could split the LEAF flag into separate flags for blocks v.
> > > pages:
> > > 
> > > 	KVM_PGTABLE_WALK_PAGE,
> > > 	KVM_PGTABLE_WALK_BLOCK,
> > > 	KVM_PGTABLE_WALK_LEAF	= KVM_PGTABLE_WALK_PAGE |
> > > 				  KVM_PGTABLE_WALK_BLOCK,
> > > 
> > > and then let __kvm_pgtable_visit() decide how to steer the walk. You may
> > > need some special handling to get the address arithmetic right when
> > > skipping over a table of page descriptors.
> 
> I am probably not getting the whole inner workings of this solution, but 
> IIUC the idea would be to walk the blocks, but not the pages, right?
> 
> Blocks meaning level2- and pages being level3?
>  
> > I was wondering along similar lines, but maybe it would be useful just
> > to pass a maximum level to the walker logic? That feels like the most
> > general case without complicating the existing logic.
> 
> This proposal seems simpler for me to understand, and indeed looks like a 
> better solution than what I have proposed, taking care of  the 
> 'already split' case with better performance, as it don't even walk a 
> single level-3 entry. 
> 
> On the 'splitting' case, it also works flawlessly if the memory is given in 
> level-2 blocks. There is only one case that I would like to address here:
> 
> - Memory given in level-1 blocks (say 1GB)
> - Walker flag says 'walk down to level-2 only'
> - Split Walker on level-1 will break page down to (up to) level-3 entries.
> - Walker will continue to be called on level-2 entries, even though it's 
>   not necessary.

If you're only visiting leaves, why would it be called on the level-2
table entries?

Will

