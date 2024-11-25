Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A668D58D5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbqeRsx8pQ/ZtWu8yCGQNsmleid8eQ70IXU3cTll2z0=; b=HzUNyQ0vQPGFjpqUDDrOXQ8qWK
	cPwG6GzlsjndcQQDp3ofKkYvJqRkAtAcR10fgQKfzRlwruy/+bMZ75Igz8o4dmx80rAwqtMFEMtrj
	EEANZgrLPdFr+fvr71P1ps8vxJZKNrWMV2wqeftdILnHzi9tatnhZS6r0MnYj7YsVrnjGgrMxi+XO
	AHkXQ6PC6UaWncq6+9iHQtm/VEd3pD0aCdqZlWc2zSGxDghr+i6j9NbnY5121sIme4lFYZsTqRdZ8
	zLS9X7cz8Kr0hbPsaFVUvCCbdJNsYM5TYtujBIE+PBV+GzFIY7u8YXLtIZzYxMDfQoEA2QTerRSAX
	UykFK+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFasp-00000008S2S-06Ox;
	Mon, 25 Nov 2024 15:20:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFarr-00000008RqV-24HZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 15:19:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF6511692;
	Mon, 25 Nov 2024 07:19:43 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9A1B3F66E;
	Mon, 25 Nov 2024 07:19:11 -0800 (PST)
Date: Mon, 25 Nov 2024 15:18:57 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Zorro Lang <zlang@redhat.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH for-next/fixes] arm64/mm: Fix false-positive
 !virt_addr_valid() for kernel image
Message-ID: <Z0SVYSew0gIgSdAe@J2N7QTR9R3>
References: <90667b2b7f773308318261f96ebefd1a67133c4c.1732464395.git.lukas@wunner.de>
 <CAMj1kXFvJGHr_iv6bFQfb89XqPFrNWH7-rV7SFy4QBSWXYC4RA@mail.gmail.com>
 <CAMj1kXER7AbNyUDjtij6Ni0jVRMg11xvyhkCMKAxaKbx=dsgcQ@mail.gmail.com>
 <Z0RJaU4wjU5WeQb4@wunner.de>
 <Z0RWcgrQASMIleRn@J2N7QTR9R3>
 <Z0SOZhtJohCNxX6_@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0SOZhtJohCNxX6_@wunner.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_071915_573275_41463142 
X-CRM114-Status: GOOD (  27.96  )
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

On Mon, Nov 25, 2024 at 03:49:10PM +0100, Lukas Wunner wrote:
> On Mon, Nov 25, 2024 at 10:50:48AM +0000, Mark Rutland wrote:
> > On Mon, Nov 25, 2024 at 10:54:49AM +0100, Lukas Wunner wrote:
> > > Other arches do not seem to be concerned about this and
> > > let virt_addr_valid() return true for the kernel image.
> > > It's not clear why arm64 is special and needs to return false.
> > > 
> > > However, I agree there's hardly ever a reason to DMA from/to the
> > > .text section.  From a security perspective, constraining this to
> > > .rodata seems reasonable to me and I'll be happy to amend the patch
> > > to that effect if that's the consensus.
> > 
> > Instead, can we update the test to use lm_alias() on the symbols in
> > question? That'll convert a kernel image address to its linear map
> > alias, and then that'll work with virt_addr_valid(), virt_to_phys(),
> > etc.
> 
> Do you mean that sg_set_buf() should pass the address to lm_alias()
> if it points into the kernel image?

No; I meant that the test could use lm_alias() on the test vectors
before passing those to sg_set_buf(), when the test code knows by
construction that those vectors happen to be part of the kernel image.
That'll work on all architectures.

That said, looking at the code it appears that testmgr.c can be built as
a module, so the test vectors could be module/vmalloc addresses rather
than virt/linear or image addresses. Given that, I don't think the
changes suggested here are sufficient, as module addresses should still
be rejected.

Can we kmemdup() the test vector data first? That'd give us a legitimate
virt/linear address that we can use.

> That would require a helper to determine whether it's a kernel image
> address or not.  It seems we do not have such a cross-architecture
> helper (but maybe I'm missing something).  (I am adding an arm64-specific
> one in the proposed patch.)
> 
> So this doesn't look like a viable approach.
> 
> Also, I'd expect pushback against an sg_set_buf() change which is
> only necessary to accommodate arm64.  I'd expect the obvious question
> to be asked, which is why arm64's virt_addr_valid() can't behave like
> any other architecture's.  And honestly I wouldn't know what to answer.

I don't think arm64 is doing anything wrong here; an image address is
*not* a virt/linear address, and we only fix that up in virt_to_*() as a
best-effort thing. I think other architectures which accept that are
signing themselves up for subtle bugs that we're trying to prevent
early.

Mark.

