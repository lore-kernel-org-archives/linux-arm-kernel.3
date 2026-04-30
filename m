Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F29CFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3i1vy6WqoMRtpTpD208NARv7ZWFUEOI3uSyvgcwppo=; b=ul0oCPK6nwTlLLxzssY9fPLngj
	diceMm4ADdsarskrfJu6mwJ3aXoUnmb+oh/hDUHsPdUj7eHZydDX3FJphfmwtizc8dbZ9v+1GH17W
	gB4uvdRss7uOgS2eRU+HrZ/JP+pJqoRwLv/XB58SJIKfOQtyJ1YyWe6gwBAAs7I5CmhlHgGXcyTcg
	ghtKo3jf6MA5WI0NMEVsiezwcNGK+Iex7ZvriLWW0XEfbOZp0BWDzaH25l0kl2DlTLJqFn/O5fCh3
	M5qbUX9c7TaukJEn/DlgbR6lOFu+mDirEntxY24BNQ3v2gDoE6mAoxdnmmvhaE87urpMojQv7IJ/S
	/0oI2RkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQeQ-00000005TJP-1sN6;
	Thu, 30 Apr 2026 12:37:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQeN-00000005TIX-2hmW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 12:37:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F08B19F6;
	Thu, 30 Apr 2026 05:37:44 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 464D43F7B4;
	Thu, 30 Apr 2026 05:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777552669; bh=7HPUcR8285oASPEPdQ3uCkZCcDoT78pU2f7CPixIm4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ezRKIkMgNpnf2rFG7bNWqgnB1U/ESgHDMInNeRwgf/Q0UB9pO0E+arQrNfdeVH0aC
	 O0joOZ+gJtN1+m3MfJ9h8WF4Y8ODT04kdMcjG5A2aUcxKXVGZAhggg8LpQ6iEJDCY1
	 wUI+AuCSaPhxbAdaub9eNaVRjmyez7/rxAxlzYnw=
Date: Thu, 30 Apr 2026 13:37:42 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Fuad Tabba <tabba@google.com>
Cc: Will Deacon <will@kernel.org>, maz@kernel.org, oliver.upton@linux.dev,
	james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	qperret@google.com, vdonnefort@google.com, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/8] KVM: arm64: Make EL2 exception entry and exit
 context-synchronization events
Message-ID: <afNNFtoZJk2IXwwU@J2N7QTR9R3>
References: <20260428103008.696141-1-tabba@google.com>
 <20260428103008.696141-2-tabba@google.com>
 <afMb7uuPlUbLeu7k@willie-the-truck>
 <CA+EHjTw6rx5rCVnR7Dfva3xmmgGjqUeUaT=3zDCEsN0J909Wsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+EHjTw6rx5rCVnR7Dfva3xmmgGjqUeUaT=3zDCEsN0J909Wsg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_053751_806241_69D890A5 
X-CRM114-Status: GOOD (  29.12  )
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

On Thu, Apr 30, 2026 at 01:18:48PM +0100, Fuad Tabba wrote:
> On Thu, 30 Apr 2026 at 10:08, Will Deacon <will@kernel.org> wrote:
> > On Tue, Apr 28, 2026 at 11:30:01AM +0100, Fuad Tabba wrote:
> > > Fixes: fe2c8d19189e ("KVM: arm64: Turn SCTLR_ELx_FLAGS into INIT_SCTLR_EL2_MMU_ON")
> >
> > I don't think this Fixes: tag is accurate:
> >
> > 1. That commit doesn't do anything with EIS/EOS afaict.
> > 2. Back in 5.12 (when that thing landed), SCTLR_EL2_RES1 did actually
> >    include EIS and EOS
> >
> > so I think the issue here might be that the auto-generated sysreg file
> > quietly changes the RES1 definitions as bits get allocated, but the
> > macros using the RES1 definition don't get updated. That's a pretty
> > horrible pit that it feels like we might keep falling into :/

I think that's a review failure, and people need to be careful when
updating the sysreg file (e.g. looking at whether any new bits were
previously RESx, and considering the impact). Regardless of tooling, we
need people to conciosuly review that.

> > Looking at 0a35bd285f43 ("arm64: Convert SCTLR_EL2 to sysreg
> > infrastructure"), I think we ended up dropping a whole bunch of fields
> > from the RES1 mask (which became 0!). Have you checked all of those?

> On the wider question of the other bits dropped from the old mask,
> I went through them against DDI 0487 M.b §D24.2.175. The summary
> (SCTLR_EL2 with E2H=0):
> 
>   bit  field    E2H=0 status                  kernel cares?
>   -------------------------------------------------------------
>    4   SA0      RES1 unconditionally          no
>    5   CP15BEN  RES1 unconditionally          no
>   11   EOS      RES1 iff !FEAT_ExS, else RW   yes (this fix)
>   16   nTWI     RES1 unconditionally          no
>   18   nTWE     RES1 unconditionally          no
>   22   EIS      RES1 iff !FEAT_ExS, else RW   yes (this fix)
>   23   SPAN     RES1 unconditionally          no
>   28   nTLSMD   RES1 unconditionally          no
>   29   LSMAOE   RES1 unconditionally          no
> 
> The seven non-EIS/EOS bits all fall under the "Otherwise: Reserved,
> RES1" clause for the E2H=0 layout, with no feature guard. Writing 0
> to them is a no-op, so dropping them from the mask should be harmless
> I think. EIS and EOS are the only positions where the bit
> becomes RW (with UNKNOWN reset) on FEAT_ExS hardware and the
> kernel actively relies on the value being 1, which is what this
> patch addresses.
> 
> I agree the auto-generator silently zeroing previously hand-rolled
> RES1 masks is a real problem. Happy to look at either teaching the
> sysreg infrastructure to express conditional RES1 (so config.c's
> AS_RES1/FEAT_X facts can flow back into the header masks), 

Please don't add that to the syreg code; that's deliberately *only* the
architectural definitions, and overloading that is going to make things
even more confusing, because "I want to treat this as RESx in this piece
of code" isn't a global property.

> or at least adding a build-time check that flags any auto-generated
> <REG>_RES1 that shrinks. After this series, though. Let me know if
> you'd like me to take a stab.

FWIW, having tooling to compare before/after would be useful, but I
don't think that can be a standard build-time check, given that this
would depend on having the old and new sysreg files available for
comparison.

Mark.

