Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03956CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stEP2oD3joJTE/Xmmd/5LalXQSA6/yt8STh/dRBXMj4=; b=jtFO+13SPEQOjzall4l0zVsO91
	RoQShKRyaxPSlPtz16qTXDYxa/oFEeeUVZGDkOjDoAl4tT6STCSLSr1voZCHSl2MwkmiVh87N2ROg
	UJ+y1Khd59ioKUpSyFn+53uII67N0VXfL4Ffu8NyBHjwf8miEBmDIkTd4Lt7GZpaXOujs1FCj6tCw
	mfa1lQ9mRPrFOHVHJCogFBTyr3eER972dtaAxS38axHCyDlCyCmyj1GG2D8E9ozzGQb6cuH9jZ3Pp
	vcBVce8Dpqu/TDRAAARnS2UnA+Hwi652E5BwV+bCPgd3Z7m/yLQhKdrRz+Tucrk/1p4PoDm6rGz20
	6aI69RdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScMZ-00000005u2y-04en;
	Thu, 28 May 2026 15:09:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScMW-00000005u2d-3vtE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 15:09:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC6F522EE;
	Thu, 28 May 2026 08:09:25 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BBF03F632;
	Thu, 28 May 2026 08:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779980970; bh=I6lBJNyqotuQp6rRRZ0DpHnxzL/Qyi1Z2gNSf4pkFPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ub4ntYZwE7WBLfQcTQ4BZLAwd/jljkpHU7iuVrrqMxvTJIByM42USzhhbWXA7tf9T
	 5yRmFr61MZJ14HzbE4pMMyDNlfsZYPneK2r5TBYc0RmPRhHG2ZRv18falAOL3DKLpb
	 j4cWYvDMfaEugWj0wG0sIcqYhReA9+R7D2c3e2DQ=
Date: Thu, 28 May 2026 16:09:27 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
	maz@kernel.org, oupton@kernel.org, tabba@google.com,
	will@kernel.org
Subject: Re: [PATCH 04/18] KVM: arm64: pkvm: Remove struct cpu_sve_state
Message-ID: <ahhapwyfE7WrBCby@J2N7QTR9R3.cambridge.arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-5-mark.rutland@arm.com>
 <9670cf97-b844-4029-b77e-25ade600e024@arm.com>
 <ahcVsVGPtOmF0nIC@J2N7QTR9R3.cambridge.arm.com>
 <4e15c17e-06c0-414f-ae9d-210c70d1757f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e15c17e-06c0-414f-ae9d-210c70d1757f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_080933_050086_8CB94DA0 
X-CRM114-Status: GOOD (  23.67  )
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

On Wed, May 27, 2026 at 05:11:26PM +0100, Vladimir Murzin wrote:
> On 5/27/26 17:02, Mark Rutland wrote:
> > On Wed, May 27, 2026 at 12:58:47PM +0100, Vladimir Murzin wrote:
> >> On 5/21/26 14:25, Mark Rutland wrote:
> >>> -struct cpu_sve_state {
> >>> -	__u64 zcr_el1;
> >>> -
> >>> -	/*
> >>> -	 * Ordering is important since __sve_save_state/__sve_restore_state
> >>> -	 * relies on it.
> >>> -	 */
> >>> -	__u32 fpsr;
> >>> -	__u32 fpcr;
> >>> -
> >>> -	/* Must be SVE_VQ_BYTES (128 bit) aligned. */
> >>> -	__u8 sve_regs[];
> >>
> >> It seems that the requirement (driven by SVE ldr/str) is
> >> satisfied with the new sve_regs pointing to the start of the
> >> page.
> >>
> >> I'm not sure whether we want to keep the comment (or perhaps
> >> enforce this with explicit checks) so that future refactoring
> >> doesn't lead to time spent debugging alignment faults...
> > AFAICT alignment has never been functionally necessary. The LDR (vector)
> > and STR (vector) instructions only mandate alignment when the relevant
> > SCTLR_ELx has SCTLR_ELx.A==1. For kernel and hyp code we configure
> > SCTLR_ELx.A==0, so there's no alignment requirement.
> > 
> > Per ARM DDI 0487 M.b, section C8.2.437 "LDR (vector)":
> > 
> >   The load is performed as contiguous byte accesses, with no endian
> >   conversion and no guarantee of single-copy atomicity larger than a
> >   byte. However, *if alignment is checked*, then the base register must be
> >   aligned to 16 bytes.
> > 
> > Per ARM DDI 0487 M.b, section C8.2.777 "STR (vector)":
> > 
> >   The store is performed as contiguous byte accesses, with no endian
> >   conversion and no guarantee of single-copy atomicity larger than a
> >   byte. However, *if alignment is checked*, then the base register must be
> >   aligned to 16 bytes.
> > 
> > ... and in both cases the pseudocode shows that AlignmentEnforced()
> > depends on the value of SCTLR_ELx.A.
> > 
> > Given that, I don't think we need the comment.
> > 
> 
> Thanks for explanation! Maybe worth mentioning in commit message that it never was
> a requirement? 

I've added the following to the commi message:

  I've dropped the comment regarding buffer alignment as AFAICT this was
  never necessary. The LDR/STR (vector) instructions only require this
  alignment when SCTLR_ELx.A==1, which is not the case for the kernel or
  hyp code. Nothing else depends on the alignment.

Mark.

