Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E715C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goyKAgXUXthVObEnOPcUswn0d1o7CZyZz+Py4yVkqho=; b=0xr2w/dZB8hJIz8afWaW9af5Dz
	XtDMzSCx2X+PcDGvf59CuVY2dVbzIzkXJIqoVlo47Vg8055yVEtqd0TR6Wrrt8F7i/xFIVZ8UupIN
	Nw6O8jeY8q+1TPocVbuQ4hRlJ7bivES/bHhYpXbDnfZvwNs1Q3msuYB828fUoLP/QgM6YMODOXcTU
	P8jdMTVlL7I2PJeibCxJJpoFeHMNmGtyvi2UX54BAil5sq6jXEpZ3s7b6SasPRdcr1CZQX70JM05N
	YlmoiKvy0Pv3quKy75IyzHhuWfvHgmzMTm6r3Noh2jem17Ny6KaXGRby1j8Ekj0BG85boytslbcpT
	1VptgviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29E5-00000004FKj-3VeY;
	Tue, 08 Apr 2025 13:42:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28cC-000000044NF-2VX8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 13:03:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B15A1688;
	Tue,  8 Apr 2025 06:03:44 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29B3F3F59E;
	Tue,  8 Apr 2025 06:03:42 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:03:39 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 03/14] arm64/fpsimd: Remove redundant clearing of TIF_SVE
Message-ID: <Z_Ueq4ezJyCPEJ6m@J2N7QTR9R3.cambridge.arm.com>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-4-mark.rutland@arm.com>
 <4b256092-ccee-45c8-aeb0-8af85cd43171@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b256092-ccee-45c8-aeb0-8af85cd43171@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_060344_727185_EC0B3E06 
X-CRM114-Status: GOOD (  27.04  )
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

On Fri, Apr 04, 2025 at 08:27:21PM +0100, Mark Brown wrote:
> On Fri, Apr 04, 2025 at 06:44:24PM +0100, Mark Rutland wrote:
> 
> > TIF_SVE implies that sve_state has been allocated. Barring specific
> > transient periods (e.g. during changes to SVE/SME vector lengths), it is
> > not valid for a task to have TIF_SVE set while sve_state is NULL.
> 
> > This was not taken into account in commit:
> 
> >   7559b7d7d651d397 ("arm64/sve: Better handle failure to allocate SVE register storage")
> 
> > As of that commit, sve_set_common() and restore_sve_fpsimd_context()
> > clear TIF_SVE if sve_alloc() fails to allocate memory. In these cases
> > TIF_SVE cannot legitimately have been set to begin with, and clearing
> > TIF_SVE only serves to complicate the code. No other code paths clear
> > TIF_SVE if sve_alloc() fails to allocate memory.
> 
> The OOM handling is all rather unfortunate, it's inconsistent and
> there's definite issues.

Agreed; it's a mess.

> In the case of sve_set_common() we might be changing the vector length,
> in which case vec_set_vector_length() will have attempted to reallocate
> the SVE state buffer.  It does not check that the buffer was allocated
> so won't return an error, and the sve_alloc() we do in sve_set_common()
> to flush the prior state would then actually try to do an allocation
> rather than flushing and so could potentially fail.  We should handle
> this in vec_set_vector_length() and/or sve_alloc() itself though which
> would mean that this change would be fine.

Yes; we really must handle this consistently at the point the allocation
fails. It's rather annoying that unchecked allocations got introduced
since commit:

  7559b7d7d651d397d ("arm64/sve: Better handle failure to allocate SVE register storage")

... since after that point we really should have known better.

Note that today it's possible to get to vec_set_vector_length() via
other means, e.g. via prctl(PR_SVE_SET_VL, ...), so even without this
patch, that logic is broken.

For the moment I'll drop this patch from this series and send a more
complete fix as part of a follow-up.

> In the case of restore_sve_fpsimd_context() we don't support vector
> length changes via sigreturn so there's no issue, if the user is
> enabling SVE for the first time we won't set TIF_SVE until later.
> 
> > Remove the unnecessary and confusing clearing of TIF_SVE, and remove the
> > similarly unnecessary and confusing update of the saved fp_type.
> 
> The update to the saved fp_type should go into the called functions too,
> if we ended up in a situation where we don't have a SVE state buffer we
> should ensure we don't try to load from it.

Maybe.

TBH, I don't think we should *ever* change the stored representation as
a result of failing to allocate memory. We should be able to allocate
the new buffer before freeing the old one, and if we cannot allocate the
new buffer we can return -ENOMEM without discarding the old state.

Mark.

