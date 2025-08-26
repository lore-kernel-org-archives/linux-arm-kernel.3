Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0B2CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 19:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3TH3r3Rwj1NIsB8dPGas/6OVkWEe0yZPECgLM5Cpvg=; b=vAsmZMEoLW+4amMME9uP1STx3F
	u2otMZLRCkcIzEwIbIXvz3P2OEbd/Xqmu7Su4/ma2oRnpeZJDnrQ341IuWO5BeAw8VM+djNS5WTNA
	9CHoOOrYUlMIxjTX/kSU5tuSzJdpHcHiyfigVjc2zzq4iFTZqg3aiPaBnawdO9xLVsiE/Kup642Gy
	DgyWa9TSqt/bgwIwgVsKspBHLFRYKNOXPZeoQZVCfZppRtTTa58T2cSGKTSf+YUc/Y2n8TO6/9rbK
	tA/x1wfyX8ttMu4Bh+PVz4P9/QupZF6lEXGAatmjkSX+T1gPj4lV0cQ9e6xheZFv++sTkJtRJbXJY
	keka5Fgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqzRN-0000000D0K7-3bd3;
	Tue, 26 Aug 2025 19:34:45 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqzOe-0000000CzZQ-26gW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 19:31:58 +0000
Date: Tue, 26 Aug 2025 12:29:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756236591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A3TH3r3Rwj1NIsB8dPGas/6OVkWEe0yZPECgLM5Cpvg=;
	b=aDqDpINynr6ybo6xMCGuGg/Zm3t4jpzlChTdjV1hAwFyilOB/hSW8hHvUKENj0Q9zZh6rs
	zkPcG5uk/BTm7PXnIPzAupTb3u1putzTorFk6ye4so4VTdKUMGqM01ra6qxVE+HZnhWg02
	3MRonxtLj+pvtIRm0QYoetQYBwm/mMA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	James Houghton <jthoughton@google.com>
Subject: Re: [RFC PATCH 05/16] KVM: arm64: Introduce "struct kvm_page_fault"
 for tracking abort state
Message-ID: <aK4LIj-OZsP_35wc@linux.dev>
References: <20250821210042.3451147-1-seanjc@google.com>
 <20250821210042.3451147-6-seanjc@google.com>
 <aKeeRynpwFTSONfm@linux.dev>
 <aK4DwtuQtzYvRei-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aK4DwtuQtzYvRei-@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_123156_691154_72ACA769 
X-CRM114-Status: GOOD (  23.85  )
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

On Tue, Aug 26, 2025 at 11:58:10AM -0700, Sean Christopherson wrote:
> On Thu, Aug 21, 2025, Oliver Upton wrote:
> > Hey Sean,
> > 
> > On Thu, Aug 21, 2025 at 02:00:31PM -0700, Sean Christopherson wrote:
> > > Add and use a kvm_page_fault structure to track state when handling a
> > > guest abort.  Collecting everything in a single structure will enable a
> > > variety of cleanups (reduce the number of params passed to helpers), and
> > > will pave the way toward using "struct kvm_page_fault" in arch-neutral KVM
> > > code, e.g. to consolidate logic for KVM_EXIT_MEMORY_FAULT.
> > > 
> > > No functional change intended.
> > > 
> > > Cc: James Houghton <jthoughton@google.com>
> > > Link: https://lore.kernel.org/all/20250618042424.330664-1-jthoughton@google.com
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  arch/arm64/include/asm/kvm_host.h |  18 ++++
> > >  arch/arm64/kvm/mmu.c              | 143 ++++++++++++++----------------
> > >  2 files changed, 87 insertions(+), 74 deletions(-)
> > > 
> > > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > > index 2f2394cce24e..4623cbc1edf4 100644
> > > --- a/arch/arm64/include/asm/kvm_host.h
> > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > @@ -413,6 +413,24 @@ struct kvm_vcpu_fault_info {
> > >  	u64 disr_el1;		/* Deferred [SError] Status Register */
> > >  };
> > >  
> > > +struct kvm_page_fault {
> > > +	const u64 esr;
> > > +	const bool exec;
> > > +	const bool write;
> > > +	const bool is_perm;
> > 
> > Hmm... these might be better represented as predicates that take a
> > pointer to this struct and we just compute it based on ESR. That'd have
> > the benefit in the arch-neutral code where 'struct kvm_page_fault' is an
> > opaque type and we don't need to align field names/types.
> 
> We'd need to align function names/types though, so to some extent it's six of one,
> half dozen of the other.  My slight preference would be to require kvm_page_fault
> to have certain fields, but I'm ok with making kvm_page_fault opaque to generic
> code and instead adding arch APIs.  Having a handful of wrappers in x86 isn't the
> end of the world, and it would be more familiar for pretty much everyone.

To clarify my earlier point, my actual interest is in using ESR as the
source of truth from the arch POV, interface to the arch-neutral code
isn't that big of a deal either way.

Thanks,
Oliver

