Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B38CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 12:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arbkOLxe9TsPGb9HPmwkESSbqInm/MlNCMr1iWn69z4=; b=FZSKot7GiHagmitqO9Gg2UqapN
	P9EDXy0HCP9d9/0cMJGVGinIDKP0WlXxqxR7DvLaSAxga779c61GPvH6SoO8kTySpZyEI8sGQZS6x
	OhA1xFlSNecnvhTZrzpK4COzDUhyWzpXESk/T61VoAuMsvP+k9qjV32gl3EFAh0mjpdfXZyj1FnoM
	ux/6NUaWRell9z0uQgGLdxOW9fJIiaPeN5IJgNqEy+z3TkAuoijJ3dDm7dwrqo9nlHIdIQqJakJaS
	eIdQanhZQ2+dw+g37vdtF0OqpfShnVOXC1NAdnywvom1Ge79nrIIqDZ93QbmYo+xNIrdTUY/3azlr
	IdTNwF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYsL-00000003Uwj-0iv4;
	Mon, 08 Jun 2026 12:14:41 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYsG-00000003Uvr-2BP8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 12:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=arbkOLxe9TsPGb9HPmwkESSbqInm/MlNCMr1iWn69z4=; b=lmJgB2ULtm4V40ha4u6XI+IhrV
	dmQcyNzSpJzo2oZAVn1Behho8kdF8bjIBymSFWxrc4kRhOWpifBhGXLESY6h9NmuItbklaKgtzJF7
	hagERND4I+XQbyGCpyYw3nQUlt6meeO2Y1J6VAlqx5HD/DLSKBWCuu4PVYe3jFHtBe3G9wZkJMn7D
	CZiTysk+/wm0llBa+3whCOLF6xy3C0kIxd48kBl0bkm5B7Y5+aaicrpb3br/nHSGwC7KaR2JcwLgo
	xhI53kvhRQOXJlSZc4+V/P2DXkrIqcgPn+Fk4a43Ipa/QQqS0pQG+W2lksDFDMsOLm33CvDGEw+Fu
	DCWohZxQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wWYs8-007cCR-0E;
	Mon, 08 Jun 2026 12:14:28 +0000
Date: Mon, 8 Jun 2026 05:14:22 -0700
From: Breno Leitao <leitao@debian.org>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Pratyush Anand <panand@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	clm@meta.com, leo.bras@arm.com, kernel-team@meta.com
Subject: Re: [PATCH] arm64/hw_breakpoint: reject unaligned watchpoints that
 would truncate BAS
Message-ID: <aiaqbmQSksKB6dTZ@gmail.com>
References: <20260430-arm64_bas-v1-1-c6ab2b15aec0@debian.org>
 <ahmohv6vQGxY-asL@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahmohv6vQGxY-asL@willie-the-truck>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_051436_599224_50068FF3 
X-CRM114-Status: GOOD (  40.00  )
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

On Fri, May 29, 2026 at 03:53:58PM +0100, Will Deacon wrote:
> Hi Breno,
> 
> Thanks for sending this out.
> 
> On Thu, Apr 30, 2026 at 02:40:10AM -0700, Breno Leitao wrote:
> > hw_breakpoint_arch_parse() positions the BAS bit pattern in
> > hw->ctrl.len with
> > 
> > 	offset = hw->address & alignment_mask;	/* 0..7 */
> > 	hw->ctrl.len <<= offset;
> > 
> > ctrl.len is an 8-bit bitfield (struct arch_hw_breakpoint_ctrl::len is
> > u32 :8), so the shift silently drops any bits past bit 7.  For
> > non-compat AArch64 watchpoints the offset is unbounded relative to
> > ctrl.len: a perf_event_open(PERF_TYPE_BREAKPOINT) caller asking for
> > HW_BREAKPOINT_W with bp_addr=page+1 and bp_len=HW_BREAKPOINT_LEN_8
> > ends up with 0xff << 1 = 0x1fe, stored as 0xfe.  The kernel programs
> > WCR.BAS=0xfe and the hardware watches bytes [1..7] instead of the
> > requested [1..8] -- the eighth byte is silently dropped.  The
> > syscall still returns success, leaving userspace to discover the
> > gap by empirical probing.
> > 
> > The same class affects HW_BREAKPOINT_LEN_{2,4} when offset pushes the
> > high BAS bit past bit 7 (e.g. LEN_4 with offset=5 yields 0xe0
> > instead of 0x1e0).  No memory-safety impact -- the value is masked
> > into 8 bits before encoding -- but debuggers and perf users observe
> > missed events on bytes they thought they were watching.
> > 
> > The AArch32 branch immediately above already rejects unrepresentable
> > (offset, len) combinations via an explicit switch.  Mirror that for
> > the non-compat branch by checking that the shifted pattern fits in
> > the BAS field, returning -EINVAL when it does not.
> > 
> > Reproducer:
> > 
> >   struct perf_event_attr a = {
> >       .type = PERF_TYPE_BREAKPOINT, .size = sizeof(a),
> >       .bp_type = HW_BREAKPOINT_W,
> >       .bp_addr = (uintptr_t)(buf + 1),
> >       .bp_len = HW_BREAKPOINT_LEN_8,
> >       .exclude_kernel = 1, .exclude_hv = 1,
> >   };
> >   int fd = perf_event_open(&a, 0, -1, -1, 0);
> >   /* before this fix: succeeds, watches 7 bytes (buf+1..buf+7)   */
> >   /* after  this fix: fails with EINVAL                          */
> > 
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > Fixes: b08fb180bb88 ("arm64: Allow hw watchpoint at varied offset from base address")
> 
> Oh man, this has been broken for nearly a decade :/
> 
> I think we probably should've stuck with the old behaviour of rejecting
> unaligned base addresses, but it's too late now. Damn.
> 
> >  arch/arm64/kernel/hw_breakpoint.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
> > index ab76b36dce820..b8a1402119f3a 100644
> > --- a/arch/arm64/kernel/hw_breakpoint.c
> > +++ b/arch/arm64/kernel/hw_breakpoint.c
> > @@ -559,6 +559,15 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
> >  		else
> >  			alignment_mask = 0x7;
> >  		offset = hw->address & alignment_mask;
> > +
> > +		/*
> > +		 * BAS is an 8-bit field in WCR/BCR; the shift below would
> > +		 * silently drop the high bits of ctrl.len when offset + len
> > +		 * exceeds 8, programming hardware to watch fewer bytes than
> > +		 * the user requested.
> > +		 */
> > +		if (((u32)hw->ctrl.len << offset) > 0xff)
> 
> nit: Use ARM_BREAKPOINT_LEN_8 instead of 0xff
> 
> > +			return -EINVAL;
> >  	}
> 
> I must confess, I'm very nervous about breaking userspace here. If GDB
> is triggering this path, then this patch will change an unreliable
> watchpoint into a hard error (which probably means GDB exits). Have you
> looked to see what GDB and/or any other debuggers do?
> 
> I had a quick peek and found the bugzilla entry which motivated the
> buggy change in the first place:
> 
> https://sourceware.org/bugzilla/show_bug.cgi?id=20207
> 
> and it looks like the aarch64_align_watchpoint() function does try to
> spill into multiple watchpoints, so perhaps your patch is ok. I'd
> appreciate your opinion, though.

It won't, for two independent reasons.

The new -EINVAL is unreachable from GDB; only a raw perf_event_open() passing
an unaligned base with an oversized bp_len hits it, which is the bug.

Second, even if a debugger did hand the kernel such a request, GDB
already treats EINVAL on NT_ARM_HW_WATCH as a downgrade signal, not a
fatal error. aarch64_linux_set_debug_regs() catches it, clears
kernel_supports_any_contiguous_range, calls aarch64_downgrade_regs()
(which rounds the BAS up to a legacy 0x01/03/0f/ff mask and aligns the
base down), and retries. That fallback is exactly the PR-20207 path.

Confirmed on a Grace box: with the patch applied (under virtme-ng), the
reproducer's unaligned LEN_8 now returns -EINVAL while aligned LEN_8
still succeeds, and GDB still inserts the watchpoint and it still fires
on every write.

GDB in fact downgrades on the current kernel independently of this patch, so
behaviour is unchanged for it.

