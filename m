Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7B1C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtncJdQV3G6fOhxMJmmsgwyhgsf7VEY1rjD907e2T4M=; b=4FhyHMO+DCEyJPj/fHyPRy4FTy
	m3hBrUcqbQltpmCtMHAnjJ+5Qog9kNecY/afnXe776DHs9+tIvpJ0UHFOtw81bzl2GMeLsaOB5E7+
	yWXMkrCPADnnCawI+vINk3BqXMGlBjFxVJYZGE0MWAT7T2RYnl3BCg3/brKgj/psaDCW5bqVdFbmP
	xuW9mk5voyzFYnduJBaYr5gP6LyWaDRHBmVmHSuwi2iXxSKz0dZ+bn454lbmByZQsiSMWD4SA504O
	9X46ye2HmjaYkaaa5Xle50IQLmr0hGQKuwtprpOaBPDvUYeze8JZmNl3rOdQPj9JUWgrQD3Wv1m/u
	yFli707A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXzY-000000017JA-0Z2w;
	Thu, 13 Aug 2026 16:09:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXzW-000000017IY-0LbQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:09:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09FE81596;
	Thu, 13 Aug 2026 09:09:06 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EA383F66F;
	Thu, 13 Aug 2026 09:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786637349; bh=w0ELszWBGMJXb0VVRoNWZwzpnHUnbxdOH2FQkHXWfls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bA34YwnO7if1PuJeP3jbH2rR0JQIu6urfwGn3nVRTyJGyNDO/+M8twCJaRopKkJgo
	 UmebfCbiRP4QBsH/gblc2UolCHVWi1SrF/GHV2Mop5szUFPXkokFcyIKMMoPWcSs9o
	 GV8RQ6Y5T7v6rPb7Def9re3E21GeI7JfIHkps1jg=
Date: Thu, 13 Aug 2026 17:09:05 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: David Hildenbrand <david.hildenbrand@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com,
	kvm@vger.kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, fuad.tabba@linux.dev
Subject: Re: [RFC PATCH 0/3] KVM: Dirty page logging for guest_memfd-only
 memslots
Message-ID: <an3sEiQlIuGEjUur@raptor>
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
 <akxOrMnlNga-vtQv@google.com>
 <ak0wSQ1133O7B96D@raptor>
 <ak0ziUcCXUlDdcla@google.com>
 <ak-EKSslAz1uqEtv@J2N7QTR9R3>
 <ak_wC4Q-mQe14DI8@google.com>
 <alDI1b8fC99SG4_a@J2N7QTR9R3>
 <a127176a-1722-460c-aa84-754e1d343f53@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a127176a-1722-460c-aa84-754e1d343f53@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_090914_158518_2EBB2552 
X-CRM114-Status: GOOD (  20.12  )
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

Hi Sean, David,

On Mon, Jul 13, 2026 at 04:11:57PM +0200, David Hildenbrand wrote:
> 
> >> That said, odds are good that we'll end up with per-gmem flags to communicate to
> >> guest_memfd whether or not the gmem instance supports page migration (x86's TDX
> >> and SNP in particular require extra consideration).  So if the anticipated use
> >> cases are fine with all-or-nothing "pinning", or with juggling guest_memfd files
> >> in userspace if a more dynamic setup is desired, then you should be ok?
> >>
> >> E.g. if the anticipated use cases are all slice-of-hardware style setups where
> >> the VM will be statically assigned a chunk of memory, then for the most part this
> >> will all Just Work.
> > 
> > Yeah. I agree (with the caveats you mention). Arm folk need to go figure
> > out if it's worthwhile to support with all those caveats.
> 
> Right, disabling migration (once gmem supports it) was also what I discussed
> with Alexandru when that topic comes up.
> 
> How to communicate to gmem that it wants these fixed mappings is a good question.

There's already a proposal for how to do this in the migratable guest_memfd
series [1] - it's a new guest_memfd creation flag that disables migration.

With Sean's comment that he expects swap/reclaim to be fully userspace
driven, I believe that would be enough to guarantee on the _kernel_ side
that SPE will work as intended for a guest.

I'm a slightly concerned though that all of this will work by chance, and
not by design, and in the future the behaviour might change to allow
guest_memfd memory to be unmapped from stage 2 without the VMM or KVM
explicitly allowing it or initiating it.

My understanding from the conversation so far is that the plan for the
future of guest_memfd is to support an option/mode where the memory is
effectively "pinned" at stage 2 (but which allows userspace to explicitly
free/unmap it, of course). Is that correct, or am I being overly optimistic
in my interpretation?

[1] https://lore.kernel.org/all/20260805-shivank-gmem-migrate-v3-4-00d8bdec4e1d@amd.com/

Thanks,
Alex

