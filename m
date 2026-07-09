Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8D7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 20:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/KG7TIcBpiZiS4el0LE+iYccTuVv/lNii4KjbUfLL0=; b=xDGtdSXySh7NPHGcdSL3az7A10
	F3KKvv7aMRnVLP+Pps8iEnIqAkrCJpFyuSyo7FUXD23nC0/wo5fR3bt/kGbmUkPPxEWw7M0BgEeqQ
	f/xmfLpLnthel4qANGL0L2ZFlj5w3BEvqyYszBdcxzwJYC7wFk8nHnQ+ZRVIOM3XYhtMPZt43qTOi
	FP6UFW4xTbatyEuADk/4A5Wl/8rHA+Cb/g+y5tz0NnRlT2OYU/wdlBjRI1ESS4fUuiJauAIQQdyhi
	BM+15yn3E+xq2uqnvWExRuIyam1AkCCfDyCBT8ErBx6EIVNnwqdkSRDWkFXp7DQj/n4nNfkyatPiO
	kqTfgBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvR8-00000003c0R-28GO;
	Thu, 09 Jul 2026 20:33:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvR6-00000003c0C-1Qyd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 20:33:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BCA9434BF;
	Thu,  9 Jul 2026 20:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE471F000E9;
	Thu,  9 Jul 2026 20:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783629212;
	bh=b/KG7TIcBpiZiS4el0LE+iYccTuVv/lNii4KjbUfLL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n/2GuPIy58VJVIIU1zKh5qySaCHdgamXriRoUFBqoKkaRGjPaM3dGXmEGkwVF6UVn
	 snC9P4KEKbCoetvivfNhSiKy7tzw0MNAEXzI4nn8aWyr0942zZ7I56qAyLsHdC91vB
	 2GQSaaJA+U8w4zbSwaUuT50IO2PdLuVZST6PFbCzIWvthi77nuJC36mhFNS3cgnFzq
	 2HFhcm3oKTidQO3FIT8xOEQkwH3v2iWXrtTl7TYSHQm5twnVUiDXEluK45ZWPjceCx
	 zrhGDTX+JyY47GBo52d2ypfw420234eFXAzbfsX/dm75ZKHxCQBfDLgXU1aG5X/hDr
	 QtEuFMFGVm/9Q==
Date: Thu, 9 Jul 2026 13:33:30 -0700
From: Oliver Upton <oupton@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com,
	kvm@vger.kernel.org, david.hildenbrand@arm.com, maz@kernel.org,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, fuad.tabba@linux.dev, mark.rutland@arm.com
Subject: Re: [RFC PATCH 0/3] KVM: Dirty page logging for guest_memfd-only
 memslots
Message-ID: <alAFmiAsNf6Xm49_@kernel.org>
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
 <akxOrMnlNga-vtQv@google.com>
 <ak0wSQ1133O7B96D@raptor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak0wSQ1133O7B96D@raptor>
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

On Tue, Jul 07, 2026 at 05:58:49PM +0100, Alexandru Elisei wrote:
> Hi Sean,
> 
> On Mon, Jul 06, 2026 at 05:56:12PM -0700, Sean Christopherson wrote:
> > On Thu, Jul 02, 2026, Alexandru Elisei wrote:
> > > The memory represented by guest_memfd-only memslots
> > > (kvm_memslot_is_gmem_only() is true) is shared with userspace, which can
> > > freely mmap it and access it. The only thing that is preventing dirty page
> > > logging for such memslots is that KVM doesn't allow slots backed by
> > > guest_memfd to have their flags changed; they can only be created and
> > > deleted.
> > 
> > Please (publicly) document *why*  you want to add dirty-logging support.  It's
> > all but impossible to review new uAPI without knowing the use case.
> 
> Of course, my mistake, I was so deep in this that I didn't realise that
> there might be different perspectives.
> 
> My thinking was that since guest_memfd created with GUEST_MEMFD_FLAG_MMAP +
> GUEST_MEMFD_FLAG_INIT_SHARED is extremely similar from a userspace point of
> view to using an anonymous file (created with memfd_create()), that
> supporting dirty page logging and migration would be a natural next step
> and would expand the usefulness of guest_memfd. It has nothing to do with
> confidential compute.
> 
> As to why I'm working on it now, it's because of an arm64 feature that
> requires that memory remains mapped at stage 2, called Statistical
> Profiling Extension (SPE), similar to Intel's PEBS or AMD's IBS. Exposing
> the feature to a guest requires that memory remains mapped at stage 2
> outside of userspace explicitely unmapping it, and guest_memfd, with the
> patch to ignore the MMU notifiers [1], has this property.  I wanted to
> expand the functionality of guest_memfd to support migration of virtual
> machines when that arm64 feature is exposed to guests.

Can you please expand a bit on how you actually expect dirty tracking to
work with SPE? Taking write permission faults seem to be at odds with
"thou shalt not fault".

Seems to me like you'd need hardware dirty state and the "noabort"
flavor of BBML2 to actually get things down to page mappings. Oh, and an
SPE implementation that actually respects write permissions... Is there
even an implementation out there where the stars align?

Fixing rotten architecture would be a more appropriate starting point :-/

Thanks,
Oliver

