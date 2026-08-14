Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B47C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 16:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axm9DDg7/F1CyalXq6Y0UQsX8AkJAu95f6HQXMokHlg=; b=FQdB2gnnFr61cJbMRU2HUuN1qJ
	5XSW1E/A9jpg6RdwxlmhLbiFQzSHFn9DR39Ky4TNQbSVIboNofqeMqPARrMuoPl6oEx0k4X/m04lw
	XAsLULjEtLfZCNQGlJ7odgnXop3IFoidwcpmoMuTS4LWqmt0xz30wDt6JfohztwUgCDx8Wjbz9V3C
	JQxdo3r29Z+TxQxPdDFwEvkV6PZjftNkbwd42H9QnqkmHcHAXNkfRQskc43usBnIU1LjMsS0QKiNz
	byxnrd58Gx6DBMvrZ+1rHkbT+Z+pmDUUQXXbvAZ/Sh+pLA5rgwkjxQPiebhMomW4h42aWwNI7Og8x
	srrnrwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuujW-00000002v4L-2ERk;
	Fri, 14 Aug 2026 16:26:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuujR-00000002v3c-2cT1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 16:26:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 175141596;
	Fri, 14 Aug 2026 09:26:01 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC3FF3F632;
	Fri, 14 Aug 2026 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786724765; bh=MTPBOHQFJvYtb+AHcGvBZoYpVjfEnZJvBa0lWB+9N4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWgoTJHqOCjad3GIisdj3ANJUPRHIZpHgG+PT2LH+0PtFsBB96Dx1ZWBk/dLSVIz+
	 lWRVVd6FJRFZeOnqUQYcjh+8S6wGBxgK1yknbk6JSYoFK6km4YAdjMZ7aIaOXQKrjf
	 JFfOrlqAtKTXo1ga4xKDGaXnVaQRHXeH2UegfyMA=
Date: Fri, 14 Aug 2026 17:26:00 +0100
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
Message-ID: <an9BmCMFP2iok-0t@raptor>
References: <ak_wC4Q-mQe14DI8@google.com>
 <alDI1b8fC99SG4_a@J2N7QTR9R3>
 <a127176a-1722-460c-aa84-754e1d343f53@arm.com>
 <an3sEiQlIuGEjUur@raptor>
 <b6080c23-a2a8-4bc5-b3bd-982bd766c648@arm.com>
 <an5UJ4S_P1LUFmzD@google.com>
 <487aa57c-72ad-453b-971d-ca24a8380429@arm.com>
 <an8SOvLybeilzCEU@google.com>
 <an86rPn4P2dRO1RB@raptor>
 <an88nuw0FKT87a-W@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an88nuw0FKT87a-W@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_092609_706612_53B3A9E4 
X-CRM114-Status: GOOD (  18.42  )
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

On Fri, Aug 14, 2026 at 09:04:46AM -0700, Sean Christopherson wrote:
> On Fri, Aug 14, 2026, Alexandru Elisei wrote:
> > On Fri, Aug 14, 2026 at 06:03:54AM -0700, Sean Christopherson wrote:
> > > > That would be in contrast to user space having to guess that page migration on
> > > > the current hardware with the current guest_memfd implementation does not
> > > > support page migration, to then disable exactly that.
> > 
> > If guest_memfd picks up support for another feature that might lead to
> > memory being unmapped from stage 2 without userspace initiating it, would
> > you be ok with that feature being gated by another guest_memfd flag?
> 
> Yes, absolutely.  FWIW, if I get my way and reclaim is driven by userspace, then
> hopefully such a feature never comes along.  But if guest_memfd does gain some
> feature that triggers invalidations, then yeah, at the very least it would need
> to have some knowledge of whether or not the associated VM supports said feature.
> 
> > I get the feeling we're all on the same page, that guest_memfd will support
> > a mode where memory isn't unmapped from stage 2, and right now the
> > discussion is more about how that will be implemented.
> 
> Ya.

That's great, thanks for confirming.

Alex

