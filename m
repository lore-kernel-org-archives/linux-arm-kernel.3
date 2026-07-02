Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2D9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpHUx+iU6bLZo5mNKpJCWFG+jTe0bq2v3KW2aRr6Uyc=; b=QkryoZczIRtUS4uoug8Bl/N2hA
	TVeCTwrJhu6gIdFL+vtu7kZT1IczVZU5EEkNRYlIGLMmls2cVLuyfXko4HTtMVy3j3DUztZZMSrbP
	QqiTVEYVMAY1V3Kr+dqBfg50dwHJ+MSFhvic0H+7sNHGwfMffK0bRBLAeJmKr+x+oRxWePkl6XnT1
	A/rIBQbg8bNXFwvJP9DwTVclcDFgztUOA0oaHuHM1RlUxg99dhbkImCRy0hqwihdLk4XYk/I44ZTO
	aqtpbaypr2tKO5rs4aI5RRAEhWzGf+g5ykjzAh7fw+jmdGW0c5Q99leT8V/PJv+PdQO4KsdnhID6z
	9JBnnkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF7W-00000004FhW-0fHY;
	Thu, 02 Jul 2026 10:58:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF7T-00000004Fgr-0fA7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:58:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95DDE356E;
	Thu,  2 Jul 2026 03:58:05 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 017293F905;
	Thu,  2 Jul 2026 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782989889; bh=GKe7TITEFnRW0+TIwdiAaqbX7l401DXeRZ1PFimE7Ic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ScaL9klctrfC1nZszPATlBNGZfQgSLLUmDS9rlpFskG4zAekS3k2R94pM6p7Y10VT
	 gOD9XlGOfmnC7K/iKF504aaS49Ekpm/VEnxdRSwAwfj8M4YeDMMnaEBNRQYbHdsXsQ
	 zKN74dQtoj2Bar84aEcbbNxdyccUayNbkswmKn1k=
From: Leonardo Bras <leo.bras@arm.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 3/6] KVM: arm64: ptdump: Fix UAF when mmu->pgt is freed
Date: Thu,  2 Jul 2026 11:58:06 +0100
Message-ID: <akZEPVJhCcYbyoN2@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <5yy625c66j3kgoboejg7hagnmxjzp2tvmvvncmqvo444wtpmzl@sufez6t2iy3r>
References: <20260630121005.1130996-1-weilin.chang@arm.com> <20260630121005.1130996-4-weilin.chang@arm.com> <akUrmfQnKmIXTigs@LeoBrasDK> <5yy625c66j3kgoboejg7hagnmxjzp2tvmvvncmqvo444wtpmzl@sufez6t2iy3r>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_035811_275961_DE46D979 
X-CRM114-Status: GOOD (  39.46  )
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

On Wed, Jul 01, 2026 at 06:27:51PM +0100, Wei-Lin Chang wrote:
> On Wed, Jul 01, 2026 at 04:00:41PM +0100, Leonardo Bras wrote:
> > Hi Wei Lin,
> > 
> > On Tue, Jun 30, 2026 at 01:10:02PM +0100, Wei-Lin Chang wrote:
> > > ptdump files can still be read after the pgt of the canonical mmu is
> > > freed, if they are opened before the VM debugfs directory is removed.
> > > This triggers UAF in places where we cache the pgt pointer or access it
> > > without checking its validity.
> > > 
> > > Check the pgt is still alive under the mmu_lock before accessing the
> > > pgt.
> > > 
> > > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > > Closes: https://sashiko.dev/#/patchset/20260623142443.648972-1-weilin.chang@arm.com?part=1
> > > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > > ---
> > >  arch/arm64/kvm/ptdump.c | 38 ++++++++++++++++++++++++--------------
> > >  1 file changed, 24 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> > > index d5aa9eff08d1..752d8e0cd25c 100644
> > > --- a/arch/arm64/kvm/ptdump.c
> > > +++ b/arch/arm64/kvm/ptdump.c
> > > @@ -115,13 +115,21 @@ static int kvm_ptdump_build_levels(struct ptdump_pg_level *level, u32 start_lvl)
> > >  static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm *kvm)
> > >  {
> > >  	struct kvm_ptdump_guest_state *st;
> > > -	struct kvm_pgtable *pgtable = kvm->arch.mmu.pgt;
> > > +	struct kvm_pgtable *pgtable;
> > >  	int ret;
> > >  
> > >  	st = kzalloc_obj(struct kvm_ptdump_guest_state, GFP_KERNEL_ACCOUNT);
> > >  	if (!st)
> > >  		return ERR_PTR(-ENOMEM);
> > >  
> > > +	guard(write_lock)(&kvm->mmu_lock);
> > > +	if (!kvm->arch.mmu.pgt) {
> > > +		kfree(st);
> > > +		return ERR_PTR(-ENXIO);
> > > +	}
> > > +
> > > +	pgtable = kvm->arch.mmu.pgt;
> > > +
> > >  	ret = kvm_ptdump_build_levels(&st->level[0], pgtable->start_level);
> > >  	if (ret) {
> > >  		kfree(st);
> > > @@ -137,7 +145,6 @@ static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm *kvm)
> > >  
> > >  static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
> > >  {
> > > -	int ret;
> > >  	struct kvm_ptdump_guest_state *st = m->private;
> > >  	struct kvm *kvm = st->kvm;
> > >  	struct kvm_s2_mmu *mmu = &kvm->arch.mmu;
> > > @@ -154,11 +161,11 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
> > >  		.seq		= m,
> > >  	};
> > >  
> > > -	write_lock(&kvm->mmu_lock);
> > > -	ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
> > > -	write_unlock(&kvm->mmu_lock);
> > > +	guard(write_lock)(&kvm->mmu_lock);
> > > +	if (mmu->pgt)
> > > +		return kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
> > 
> > IIUC, that's the same behavior, right?
> > Just changed to look about the same with the rest of this file?
> 
> I'm not too sure what you are referring to, if you mean the
> write_lock/unlock -> guard(write_lock) change, then yes, mostly. Just
> also checking mmu->pgt is still not freed.

I was referring just to lock+unlock -> guard() strategy.
IIUC this has the same effect, so I was wondering on why you suggested the 
change.

I then supposed it was to look the same of the rest of the file.

> 
> > 
> > >  
> > > -	return ret;
> > > +	return 0;
> > >  }
> > 
> > So if the pgt does not exist anymore, it returns zero. Is that the desired 
> > behavior?
> 
> Good question, so the question is what contract between the ptdump and
> user do we want to make for this case. I guess returning some error like -EIO
> could make a little more sense than just printing nothing?
>

It depends on what is the behaviour you want to see... see below..
 
> > 
> > I guess it's aligned with the idea of single file mentioned in the cover, 
> > right?
> 
> Sorry, I don't get what you are asking here?

IIUC you mentioned in the cover letter that you planned to have a file 
which would, on read, output ptdump for every nested pgtable. Did I get 
that right? 

If so, I imagine that the user has no idea how many nested pgtables are 
there, and if the ioctl initially finds N, but ends up printing N-1 
(because a pgtable was not there anymore), that would not be an error that 
the user should be worried about.

It could be an issue if you were printing in multiple steps (multiple 
checks), as a part of that pgtable could be printed while another part 
could not. Which does not seem to be the case.

> 
> > 
> > >  
> > >  static int kvm_ptdump_guest_open(struct inode *m, struct file *file)
> > > @@ -206,17 +213,23 @@ static const struct file_operations kvm_ptdump_guest_fops = {
> > >  
> > >  static int kvm_pgtable_range_show(struct seq_file *m, void *unused)
> > >  {
> > > -	struct kvm_pgtable *pgtable = m->private;
> > > +	struct kvm *kvm = m->private;
> > > +
> > > +	guard(write_lock)(&kvm->mmu_lock);
> > > +	if (kvm->arch.mmu.pgt)
> > > +		seq_printf(m, "%2u\n", kvm->arch.mmu.pgt->ia_bits);
> > >  
> > > -	seq_printf(m, "%2u\n", pgtable->ia_bits);
> > >  	return 0;
> > >  }
> > >  
> > >  static int kvm_pgtable_levels_show(struct seq_file *m, void *unused)
> > >  {
> > > -	struct kvm_pgtable *pgtable = m->private;
> > > +	struct kvm *kvm = m->private;
> > > +
> > > +	guard(write_lock)(&kvm->mmu_lock);
> > > +	if (kvm->arch.mmu.pgt)
> > > +		seq_printf(m, "%1d\n", KVM_PGTABLE_MAX_LEVELS - kvm->arch.mmu.pgt->start_level);
> > >  
> > > -	seq_printf(m, "%1d\n", KVM_PGTABLE_MAX_LEVELS - pgtable->start_level);
> > >  	return 0;
> > >  }
> > >  
> > > @@ -224,15 +237,12 @@ static int kvm_pgtable_debugfs_open(struct inode *m, struct file *file,
> > >  				    int (*show)(struct seq_file *, void *))
> > >  {
> > >  	struct kvm *kvm = m->i_private;
> > > -	struct kvm_pgtable *pgtable;
> > >  	int ret;
> > >  
> > >  	if (!kvm_get_kvm_safe(kvm))
> > >  		return -ENOENT;
> > >  
> > > -	pgtable = kvm->arch.mmu.pgt;
> > > -
> > > -	ret = single_open(file, show, pgtable);
> > > +	ret = single_open(file, show, kvm);
> > 
> > Maybe this change is more related with the previous patch?
> 
> I see your point, but I divided it into first fixing mmu UAF, then the
> pgt UAF, which I also think makes sense.
> 

Okay then

Thanks!
Leo

