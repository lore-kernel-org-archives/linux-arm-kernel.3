Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DCDC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 19:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OtteCJd5kLZ2hGXBwK3WYGu95XqRXhomwJCp9pxwjE=; b=z3+f3wQRFwa5oY1Vk92KSGI5j6
	9bkdkVgtoo+kH7ZH9p5321fv2JMFko/4lv2mZ8QexJ8C4SevCxFQsnMsB+ULlsBqW0oiZAREd7+K0
	HgfGU2817PYNs2cp70ln98n+RU/bN4wBcpo0OTFQrIlJp4GgWOuBBz3JqHK8f+14/I129zTcSx5Hn
	7n/u7wu60Wel/ENVuaYdXE/hpLSYhVsHqToicKsU6AMDA6mx/fb2Vok1PETDUAAruAwcEygdV2GH1
	hg7dyKCurdfuBLwyyUWQmum9WD2UZV3+XU5upvqpfwwyl8CVQCroxM8csjQ+TCil8sGv8yKGRBs2e
	Qsi8dtqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlB7u-00000004UqB-2eIw;
	Sat, 18 Jul 2026 19:55:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlB7r-00000004Upm-3NqA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 19:55:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4954d5d814fso60295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 12:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784404505; x=1785009305; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/OtteCJd5kLZ2hGXBwK3WYGu95XqRXhomwJCp9pxwjE=;
        b=CD+mUimB1stUSEt/Fet9gOZfv2nthC67ZN1XYLIucbFYOpdC0PLFBNuRIHr5FXEeAI
         h/DdGoe8oNcVOe4vU2OgAYE5PIoNPLuBLv6I+uLKRDTzOppx/7doTurYSwXRWAlaVCX2
         5DGjVENyWGklwPtV6W9o7gVwH+NAeTDztvfajohqkuCSh+MqfMIGTe29rtJx1CWpGVKz
         jH3EgzW/DtMmq8w5Q9hGVlr9qIHKt2COVX3BTsIiAG2/CyX3Xj3gX2HJ+VOUp+j8XAUm
         dkSmPGaa1E1QCFb0LIAbuvJgH1MfBCGbwncq5PHQAZCN3e4BCy+mg/BYcBukeAyjV6YF
         4nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784404505; x=1785009305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/OtteCJd5kLZ2hGXBwK3WYGu95XqRXhomwJCp9pxwjE=;
        b=qpxIXx7AZ0OzoO8cXxw1Ia2ifncmhbvnB2Z6kHsnbvtPXmJ1roi1kLLvKNiQJCtel2
         DqHY9bdNk28/zLX8b+OweXukq9ve0NxJfzqi5/ctghOEWEeHy6T+GS+mTZEQqylJ3/1A
         9sW4B6lL5fqV6GDPWjAWqPaN+In/ulFw4c4h/iArLTvrOUz2J8DLaqMb8zyzkI67X6GI
         7Czltenx1GAd3yxXCneZX0Uof46H62M/HO9WrRtbYn5tuZN7EFyM5oO/+k6I2ogzLr06
         MGVjl5UuhDPRIEQ5SEB6T0np3Q4yQ9O6BWGJugowiwozKJiH7J4tTKBOBZSn2g8QezJX
         osxA==
X-Forwarded-Encrypted: i=1; AHgh+Rry9BvHLWgjJpGvOl4W1iRMunE0428iNyjCxmrViEUXrOlnKRJKVkmsiX6ZrbCZsPCdfWXO+MKB9a86MdVR40RI@lists.infradead.org
X-Gm-Message-State: AOJu0YzW64LITDoJWX+0zIiV53BwvOE023Lc3wQmDQiCJAuioei/VfDZ
	q7n8R43bqG0UrxKnnrUysnBeczY/ZAssRv1Tbrn/gaczEJNkdtnHy+/EV9Us+qt0Fw==
X-Gm-Gg: AfdE7cndQ4p8tn0QY6N/zCl2PJdYiwRL7ImKBfad6fBNjGYqMUPIvjduqBGuUQ3VjpB
	0IdR5oowJaRslgO0EzC5nRtCoW3x//F+9APK6veHqVrX9lYNlM45uGOfSqnFjTX2ri/5PY7yHte
	IQqi/3wALxJwJfOc2CT/yr3/qym149YunD4k6eHg3t0ciCEG4+NVlrU5MZlNMeh6FIFn/30sN9g
	G84pCxO/rYl+JhlfxQqQQe6S0/aY3jDrdKK+j9Xo7tuVOA5uRBpWAEPXGleuq6DLrZJloR1CAWj
	1ntlEuYi6ZRZ1ypIoSnASXoxKB7Wq1q5YVci/wIll3OcVmkMKdlBNjCQtxY6pUkZV3KlcNofTJP
	7aNRLdZDoybGdpf8WnOVizEFSb4zrWM0CV2KTmO3oAREvfsjONKolrX6Lj73dyO+jRf3R5V0php
	tNihl4N5eItTtgblxcsDur1UMVexZa7QvfvdlW6g==
X-Received: by 2002:a05:600c:4995:b0:493:a96b:f9fe with SMTP id 5b1f17b1804b1-4954ff99257mr1026495e9.4.1784404504362;
        Sat, 18 Jul 2026 12:55:04 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a36312sm161560395e9.2.2026.07.18.12.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 12:55:03 -0700 (PDT)
Date: Sat, 18 Jul 2026 19:54:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	vdonnefort@google.com, tabba@google.com
Subject: Re: [RFC PATCH 2/2] KVM: arm64: Support BBM level 3
Message-ID: <alvaEgJFJ5DaQaac@google.com>
References: <20260717130901.2239134-1-smostafa@google.com>
 <20260717130901.2239134-3-smostafa@google.com>
 <alqW49CH7eViDpAZ@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alqW49CH7eViDpAZ@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_125507_905508_44F1F674 
X-CRM114-Status: GOOD (  41.79  )
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

Hi Oliver,

On Fri, Jul 17, 2026 at 01:56:03PM -0700, Oliver Upton wrote:
> Hi Mostafa,
> 
> On Fri, Jul 17, 2026 at 01:09:00PM +0000, Mostafa Saleh wrote:
> > If the system supports hardware Break-Before-Make (BBM) level 3, use it
> > to replace stage-2 PTEs directly instead of falling back to the software
> > break-before-make sequence.
> > 
> > 1) Get a reference count on the containing table for the new PTE.
> > 2) Atomically update the PTE with the new valid descriptor.
> > 3) Invalidate the TLB for the old PTE.
> > 4) Drop the reference count holding the old PTE.
> > 
> > One interesting case, as BBML3 will update the PTE atomically, it
> > can only know it raced with another core at the point of the cmpxchg
> > failing, unlike the SW implementation which locks the PTE first.
> > And as we must issue CMOs to the new mapped page before the update,
> > that means with BBML3 racing cores will issue redundant CMOs,
> 
> I'd rather we just predicate BBML3-style transformations on an
> implementation having FEAT_S2FWB and DIC. You can definitely come along
> later and enable it when using a stage-2 in an SMMU makes this
> mandatory, possibly at the expense of some extra CMOs.

Makes sense, I will do that in v2.

> 
> There's also an extremely subtle detail that BBML3 enablement relies on,
> which is that KVM will never change the OA of active translation. IOW,
> if the host is moving the PFN we expect an invalidation before
> re-mapping it.
> 
> I have no issue with relying on that behavior but we should make that
> assumption abundantly clear.

I see, I can add a comment as:
Note: we assume that KVM will never change the OA of an active
translation. If the host needs to move the backing PFN,it should do
an explicit unmap to issue the required TLBI.

> 
> One of the things on my wish list for a while has been rebuilding
> hugepages after dirty logging is disabled on a memslot. That seems like
> like a very good optimization to do when BBML3 is present.
> 

In android we have support for coalescing for KVM_PGTABLE_S2_IDMAP
on map, that does not rely on BBML3, maybe this can be added in a
follow-up series, and eventually extended to be more generic.

https://android.googlesource.com/kernel/common/+/refs/heads/android17-6.18/arch/arm64/kvm/hyp/pgtable.c#1107

> > to improve this:
> > - We only use BBML3 if the old PTE was live.
> > - To reduce the window of the race, an early check is added before
> >   the CMO to exit early, but that does not eliminate the race.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/pgtable.c | 53 +++++++++++++++++++++++++++++++-----
> >  1 file changed, 46 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index 127b7f9541b1..69d52308236f 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -838,7 +838,8 @@ static void stage2_clean_old_pte(const struct kvm_pgtable_visit_ctx *ctx,
> >  /**
> >   * stage2_try_break_pte() - Invalidates a pte according to the
> >   *			    'break-before-make' requirements of the
> > - *			    architecture.
> > + *			    architecture, if BMML3 is supported it
> > + *			    will be used, otherwise fallback to SW.
> >   *
> >   * @ctx: context of the visited pte.
> >   * @mmu: stage-2 mmu
> > @@ -854,6 +855,18 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
> >  {
> >  	kvm_pte_t locked_pte;
> >  
> > +	if (system_supports_bbml3() && kvm_pte_valid(ctx->old)) {
> > +		kvm_pte_t curr_pte = READ_ONCE(*ctx->ptep);
> > +
> > +		/*
> > +		 * All handled in stage2_make_pte(). However exit early if we already
> > +		 * lost the race to avoid extra CMOs.
> > +		 */
> > +		 if (curr_pte != ctx->old)
> > +			return false;
> 
> Does this race detection actually move the needle? We haven't gotten
> very far from the read in __kvm_pgtable_visit().

Yes, doesn't seem to help much with the current users, I will drop it.

Thanks,
Mostafa

> 
> Thanks,
> Oliver

