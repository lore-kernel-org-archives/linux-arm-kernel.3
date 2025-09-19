Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B87CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eT2pbc/oV1st43WTaaPabX3MOAv4ylI3uxbqmfQzIgM=; b=wLGnKT8M3jclySmqVtp44nijLy
	1wk9fsP4LYDTYcutwyqR3pm6ZZl0PmNAARwOlFjI+3g6t7y9JiO40axFF+8xJyrT6SckV1RlVTh4P
	Od7GcNCPrBOStu05KOJpyVIPogUJUJt3yJ4aY8epCQk8BOHu5JpBAHvwpZhq9pF3v24MSxS+TaDJv
	Dk7sHXqm7y1vESuzk9ccuSpHPAzZTrPDKy/PEJl15egYNIfL3kBPE0dun7Halp3ttaeOd/vpEAYTu
	6fVRHHt2Lt9wso4jWYjaVwu6goNrR9hUdDv2ADnMs6lz95m1RXeHmBR8r9xqpRrHoJqkhnbL42bZ8
	uadCFqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbZr-000000032aO-07yf;
	Fri, 19 Sep 2025 13:55:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbZq-000000032a1-06AG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:55:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64D6B6013A;
	Fri, 19 Sep 2025 13:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312CEC4CEF0;
	Fri, 19 Sep 2025 13:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758290105;
	bh=XVzTh4eHn4N/ZmlR3lObvuzKNEutxl5poX823+fHFB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1S2hu/sBbuYfL5WeMi1H2qeTqk+hHxic2QzEs4J8ouGVegrgWvMQ6at2y2WAhuBr
	 fdRhBucjff9iC6fQMtxcVqsSWbu+0GGnRjVXCGngvqnUJug8xoNh5fYGix0z6jgAN/
	 b/kkxsakBRspu0tTk7C5ZT6pFf7JXURtNW5R6hm7b2ELCDFELfj+0ucEZIIrjEQHL/
	 XWXw3IZqoqBhzIagQkU7c+lOLImvXc1T06T90aDrKXNNFi9odXwV5x8x/ssygy2mwI
	 dYiVfw/h7nfRlSMJnmHJJum4OvnQwNDKX5AOBTB6z6hTq70gEjRXMuSvVn0P6E2HiA
	 Mp4mgt4mLZlPQ==
Date: Fri, 19 Sep 2025 14:54:59 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 6/8] arm64/efi: Use a mutex to protect the EFI stack
 and FP/SIMD state
Message-ID: <aM1gs9rhKbrB2Val@willie-the-truck>
References: <20250918103010.2973462-10-ardb+git@google.com>
 <20250918103010.2973462-16-ardb+git@google.com>
 <aM0_96QvR-hlYMJJ@willie-the-truck>
 <CAMj1kXHDtTNMzih7OoTYU0vN4M3mOmFL3YOfaPUKReyJQA6uAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHDtTNMzih7OoTYU0vN4M3mOmFL3YOfaPUKReyJQA6uAQ@mail.gmail.com>
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

On Fri, Sep 19, 2025 at 03:42:12PM +0200, Ard Biesheuvel wrote:
> On Fri, 19 Sept 2025 at 13:35, Will Deacon <will@kernel.org> wrote:
> >
> > On Thu, Sep 18, 2025 at 12:30:17PM +0200, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Replace the spinlock in the arm64 glue code with a mutex, so that
> > > the CPU can preempted while running the EFI runtime service.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > >  arch/arm64/kernel/efi.c | 13 ++++++++++---
> > >  1 file changed, 10 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> > > index 0d52414415f3..4372fafde8e9 100644
> > > --- a/arch/arm64/kernel/efi.c
> > > +++ b/arch/arm64/kernel/efi.c
> > > @@ -166,15 +166,22 @@ asmlinkage efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f)
> > >       return s;
> > >  }
> > >
> > > -static DEFINE_RAW_SPINLOCK(efi_rt_lock);
> > > +static DEFINE_MUTEX(efi_rt_lock);
> > >
> > >  bool arch_efi_call_virt_setup(void)
> > >  {
> > >       if (!may_use_simd())
> > >               return false;
> > >
> > > +     /*
> > > +      * This might be called from a non-sleepable context so try to take the
> > > +      * lock but don't block on it. This should never fail in practice, as
> > > +      * all EFI runtime calls are serialized under the efi_runtime_lock.
> > > +      */
> > > +     if (WARN_ON(!mutex_trylock(&efi_rt_lock)))
> > > +             return false;
> >
> > If it will never fail in practice, why do we need the lock at all? Can we
> > just assert that the efi_runtime_lock is held instead and rely on that?
> >
> 
> Excellent point.
> 
> Do you mean a lockdep assert? efi_runtime_lock is a semaphore, so
> there is no is_locked() API that we can BUG() on here.

Yes, I was thinking of lockdep. Even though lockdep doesn't tend to be
enabled in production, just having it in the code is useful documentation
imo.

Will

