Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A50C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 16:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+gXlhA8nFVi0NTGWLJwhB1fUYYRId0D+GL6W0Xogjo=; b=NBqm8dBP5tAar3BwOjVBeJuPWc
	R8h9lmXkG39vUf9aBwhhnKaWpeQ+gVMQ8Vn5anEJ6ao25y/Hwvc0w++K9cm6y0COjo9BzeScBx023
	jNfGq97OG140BoFIbV73xswUJd4SIe9jYxlrxEzMb8nlZQmrWv8RII7rELc/j5D+RjP32VTeu4Z5F
	2TwYGqJtbCKS2mQJd/X51KajkwgNSOn0oL9S9q1K6ION2HdrR7Bl/sQQlwsWNCzdNW/cfde44eMTF
	xfpoRbsxYfJn1aCKhbbDvEe2xznf98iRgDTNS2Ye13fhF1BJFRl5QDah0qZUGUptuvYfvLRwYvqSu
	hdgIUDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvEt-00000002wuL-0tz5;
	Fri, 14 Aug 2026 16:58:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvEq-00000002wtw-1bKm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 16:58:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C0AB1596;
	Fri, 14 Aug 2026 09:58:30 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3EA93F632;
	Fri, 14 Aug 2026 09:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786726713; bh=uBllJ/kQ24Mxwc6aiM69olWJy5qFzkEa5b9PK//GgIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mfRdwd/UvqFh9+V93kh2ouAmmKKGikyurMG1NoN0DOeCELs0Uhk8AGUhZ8KxNZYS5
	 P8r9ARNTgRz8q4re45FPgr+v1iwq0wgBSqd1Wi+k5lIvZTCK5zHP8PtUxwtizBw+1S
	 V27T4NZ2Qbw72uJNefKwKwVh4c4R+JX1dX/9Sl4E=
Date: Fri, 14 Aug 2026 17:58:29 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: David Hildenbrand <david.hildenbrand@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, pbonzini@redhat.com,
	kvm@vger.kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, fuad.tabba@linux.dev
Subject: Re: [RFC PATCH 0/3] KVM: Dirty page logging for guest_memfd-only
 memslots
Message-ID: <an9JNUln8dKaidQc@raptor>
References: <ak0ziUcCXUlDdcla@google.com>
 <ak-EKSslAz1uqEtv@J2N7QTR9R3>
 <ak_wC4Q-mQe14DI8@google.com>
 <alDI1b8fC99SG4_a@J2N7QTR9R3>
 <a127176a-1722-460c-aa84-754e1d343f53@arm.com>
 <an3sEiQlIuGEjUur@raptor>
 <b6080c23-a2a8-4bc5-b3bd-982bd766c648@arm.com>
 <an5UJ4S_P1LUFmzD@google.com>
 <487aa57c-72ad-453b-971d-ca24a8380429@arm.com>
 <an8SOvLybeilzCEU@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an8SOvLybeilzCEU@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_095836_606163_51121008 
X-CRM114-Status: GOOD (  30.47  )
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

Hi,

On Fri, Aug 14, 2026 at 06:03:54AM -0700, Sean Christopherson wrote:
> On Fri, Aug 14, 2026, David Hildenbrand wrote:
> > We have a hardware feature that requires pages to always be mapped into S2. Some
> > things I had in mind:
> > 
> > 1) Page migration would not be a problem as long as hardware could be paused
> >    while migrating (e.g., kick all vCPUs). I doubt someone would implement that
> >    right now,  but you could consider it an implementation detail that page
> >    migration cannot be supported right now.
> > 
> > 2) Newer hardware could mitigate this problem, allowing the feature to support
> >    pages temporarily being unmapped from S2.
> > 
> > 3) Disallowing page migration is really just one implication of "pages must
> >    always be mapped into S2".
> > 
> > So what we really want is "if feature X is enabled and hardware requires it,
> > always keep pages mapped into S2, which currently implies that page migration
> > cannot be supported."
> > 
> > Which isn't all that different to "if a confidential VM is run on current TDX
> > hardware, always keep pages mapped into S2, which currently implies that page
> > migration cannot be supported."
> > 
> > So I was wondering whether the flow could be:
> > 
> > User space enabled CPU feature for VM -> KVM knows that current hardware
> > requires for that CPU feature to have S2 always mapped -> KVM tells guest_memfd
> > that S2 must be always mapped / disables page migration.
> 
> I'm a-ok with adding a flag to guest_memfd to communicate whether or not page
> migration is allowed, because guest_memfd needs to actively support page migration.
> 
> I'm not ok adding a flag telling guest_memfd that memory must always be mapped
> in S2, because guest_memfd doesn't care.  E.g. KVM doesn't yet support page
> migration for SNP, but SNP tracks page ownership in an out-of-band table and so
> KVM can map/unmap all guest memory from S2 at will.
> 
> > That would be in contrast to user space having to guess that page migration on
> > the current hardware with the current guest_memfd implementation does not
> > support page migration, to then disable exactly that.
> > 
> > Does that explanation makes sense? I don't know the exact mechanism to do that,
> > but that's just my high-level thinking.
> 
> Yes, I'm supportive of KVM expressing to guest_memfd that page migration isn't
> supported by the VM.  I'm only objecting to expressing that memory must stay
> mapped in S2, because guest_memfd doesn't care *why* page migration is or isn't
> supported/allowed by a particular VM.

My naive contribution is this idea I had:

1. Userspace queries support in KVM for feature xyz by checking the
capability KVM_CAP_xyz.

2. Userspace knows that for feature xyz to work correctly, it is required
that memory remains mapped at stage 2.

3. Userspace creates a guest_memfd instance with the right combination of
flags set and _unset_ for feature xyz to work correctly - i.e, to keep
memory mapped at stage 2.

For this to work, new guest_memfd features that might lead to memory being
unmapped are enabled via a flag, and KVM keeps memory mapped at stage 2 by
default, to maintain compatibility with an userspace not updated for the
new features/flags.

Thanks,
Alex

