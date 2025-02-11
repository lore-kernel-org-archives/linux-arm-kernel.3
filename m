Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE344C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HrP1QASq5Fp3V5sUafLqNhIjAKgQypcRjFNxI3MNFc=; b=jF9SOtxe25JakY5Srkv0E9JUBB
	OG0rX1bE/1MlNkDoxX/ZxP/Nsv1tf6H1wecYWRCt7RTDVuuZGDtHwun5q/DAt2sM/5dxNTUZbyhRP
	DyLLb3mh0NiB+N3yvPmFsNcFYSRSXBz1SW8tnJPl9gr1DnAvAkwOTsyJK9h7Aoe3WHNFDFxAkT+kD
	XTcJVXBaC1it0WpMf15BDB7Totoci1K3z9EVLQgE0DVbx+gs+dH5WnfS2tkqxg8YlikiUbkWrZr4P
	Lzm3PsRodWb84SvJUIlP4f/58UwWhJBYOp8/h7HFWH3zGqa5nlZCnFU3ZBjKNBp4LPxe4sU2NRPtu
	FZxN6L8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnXb-00000003M97-2YGc;
	Tue, 11 Feb 2025 10:30:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnWB-00000003Ly8-1dvJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:29:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 01885A40224;
	Tue, 11 Feb 2025 10:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17ECC4CEDD;
	Tue, 11 Feb 2025 10:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739269766;
	bh=HaHabSl+wxC8yeelHmSr2+qIEdKDU6K4yefBEnZQXy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HT7wZxHrLIu2yMUWmOIWFnrP7uTpA6e1zrfjmnBecJYeZzPHp4RnYchuY8B9yLQV3
	 rGR3bQZPj4Ik5esTM/eyWiJlLvf8SGl4bDmT+pJ7cXrSWbXEPeJSiTprCzigx6Z/7c
	 UpZ74U6s6A3iK+l8+3nLoG5thLel7eiamb4mdJXvfKcThJ1U+0kv1P0ARw2m9zqreS
	 0eTHJkiiJXc0Q2SKFVfrQgAlrm12f5kCkBPu4zQVANIrrrMxxihp5ytLVAquFObbxK
	 TAr9UUjHMjOfLuXfBbaw/K3X839Dfq67ToIN6UNCk9yC1qE6v4a3E4/uhZOvOgZpCk
	 q0s4nehs9XTgA==
Date: Tue, 11 Feb 2025 10:29:19 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
Message-ID: <20250211102918.GA8653@willie-the-truck>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-9-mark.rutland@arm.com>
 <20250210165325.GI7568@willie-the-truck>
 <Z6o1t7ys2qVaZ-7n@J2N7QTR9R3>
 <20250210182009.GB7926@willie-the-truck>
 <Z6pL81_yi98o2vtS@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6pL81_yi98o2vtS@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_022927_557643_5674CB80 
X-CRM114-Status: GOOD (  26.66  )
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

On Mon, Feb 10, 2025 at 06:56:51PM +0000, Mark Rutland wrote:
> On Mon, Feb 10, 2025 at 06:20:09PM +0000, Will Deacon wrote:
> > On Mon, Feb 10, 2025 at 05:21:59PM +0000, Mark Rutland wrote:
> > > On Mon, Feb 10, 2025 at 04:53:27PM +0000, Will Deacon wrote:
> > > > On Thu, Feb 06, 2025 at 02:11:02PM +0000, Mark Rutland wrote:
> > > Sorry, I had meant to add a comment here that this relies upon a
> > > subtlety that avoids the need for the ISB.
> > 
> > Ah yes, it really all hinges on guest_owns_fp_regs() and so I think a
> > comment would be helpful, thanks.
> > 
> > Just on this, though:
> > 
> > > When the guest owns the FP regs here, we know:
> > > 
> > > * If the guest doesn't have SVE, then we're not poking anything, and so
> > >   no ISB is necessary.
> > > 
> > > * If the guest has SVE, then either:
> > > 
> > >   - The guest owned the FP regs when it was entered.
> > > 
> > >   - The guest *didn't* own the FP regs when it was entered, but acquired
> > >     ownership via a trap which executed kvm_hyp_handle_fpsimd().
> > > 
> > >   ... and in either case, *after* disabling the traps there's been an
> > >   ERET to the guest and an exception back to hyp, either of which
> > >   provides the necessary context synchronization such that the traps are
> > >   disabled here.
> > 
> > What about the case where we find that there's an interrupt pending on
> > return to the guest? In that case, I think we elide the ERET and go back
> > to the host (see the check of isr_el1 in hyp/entry.S).
> 
> Ah; I had missed that, and evidently I had not looked at the entry code.
> 
> Given that, I think the options are:
> 
> (a) Add an ISB after disabling the traps, before returning to the guest.
> 
> (b) Add an ISB in fpsimd_lazy_switch_to_host() above.
> 
> (c) Add an ISB in that sequence in hyp/entry.S, just before the ret, to
>     ensure that __guest_enter() always provides a context
>     synchronization event even when it doesn't enter the guest,
>     regardless of ARM64_HAS_RAS_EXTN.
> 
> I think (c) is probably the nicest, since that avoids the need for
> redundant barriers in the common case, and those short-circuited exits
> are hopefully rare.

(c) sounds like the most robust thing to do and, even though the ISB
might be expensive, we're still avoiding an ERET+IRQ.

> Obviously that would mean adding comments in both __guest_enter() and
> fpsimd_lazy_switch_to_host().

Yup.

Cheers,

Will

