Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E73DC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 11:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0iwWWWIOU3gxQ47OF4BxI4uU9ATyK3y9Ee4bHV2Spg=; b=RJ7VLg2THHeOCTiKHcjzXZDbqU
	GdemDQlJG7Rtgy1Ax4jW3onEYS1iGmkk3Av2Ff5QIFNknxbFZrPnC/x80R3xj7jxmroJS7zZdMWL2
	Zp6bvYz+eepyGJjznOCUgTKB2F1jBYbor/HMVrGd/MWb0Z0dgp+9LeoYjQmnXuUFd7SoTsCwNDfPN
	oXBYgkLwqe393AkePg+l/a0pUSbOoADwfsw5v/40+25jYLZUme9gCVcF8nguyH8ekurOHcmihMWOO
	Rpy24CqtcUGtQ72Esi20q/8Tj4YJjLNB+uBsCBuGDeG+ySSfE+eK9mBI90SQ4gEkPmqkaP9x65ATp
	crGE7Vzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZLU-0000000A6Xy-3dNg;
	Wed, 22 Jan 2025 11:56:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZKB-0000000A6Sn-3XkW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 11:55:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A9BE1007;
	Wed, 22 Jan 2025 03:55:39 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDC733F738;
	Wed, 22 Jan 2025 03:55:08 -0800 (PST)
Date: Wed, 22 Jan 2025 11:55:03 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, fweimer@redhat.com,
	jeremy.linton@arm.com, oliver.upton@linux.dev, pbonzini@redhat.com,
	stable@vger.kernel.org, wilco.dijkstra@arm.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64/sve: Ensure SVE is trapped after guest exit
Message-ID: <Z5DclwGtm_6TMCTJ@J2N7QTR9R3>
References: <20250121100026.3974971-1-mark.rutland@arm.com>
 <86r04wv2fv.wl-maz@kernel.org>
 <Z4--YuG5SWrP_pW7@J2N7QTR9R3>
 <86plkful48.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86plkful48.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_035511_973820_1206EC29 
X-CRM114-Status: GOOD (  36.82  )
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

On Wed, Jan 22, 2025 at 11:46:31AM +0000, Marc Zyngier wrote:
> On Tue, 21 Jan 2025 15:37:13 +0000, Mark Rutland <mark.rutland@arm.com> wrote:

> > Alternatively, we could take the large hammer approach and always save
> > and unbind the host state prior to entering the guest, so that hyp
> > doesn't need to save anything. An unconditional call to
> > fpsimd_save_and_flush_cpu_state() would suffice, and that'd also
> > implicitly fix the SME issue below.
> 
> I think I'd rather see that. Even if that costs us a few hundred
> cycles on vcpu_load(), I would take that any time over the current
> fragile/broken behaviour.

Cool -- I'll go do that. I'm also happier with that approach.

> > > > +		 *
> > > > +		 * If hyp code does not save the host state, then the host
> > > > +		 * state remains live on the CPU and saved fp_type is
> > > > +		 * irrelevant until it is overwritten by a later call to
> > > > +		 * fpsimd_save_user_state().
> > > 
> > > I'm not sure I understand this. If fp_type is irrelevant, surely it is
> > > *forever* irrelevant, not until something else happens. Or am I
> > > missing something?
> > 
> > Sorry, this was not very clear.
> > 
> > What this is trying to say is that *while the state is live on a CPU*
> > fp_type is irrelevant, and it's only meaningful when saving/restoring
> > state. As above, the only reason to set it here is so that *if* hyp
> > saves and unbinds the state, fp_type will accurately describe what the
> > hyp code saved.
> > 
> > The key thing is that there are two possibilities:
> > 
> > (1) The guest doesn't use FPSIMD/SVE, and no trap is taken to save the
> >     host state. In this case, fp_type is not consumed before the next
> >     time state has to be written back to memory (the act of which will
> >     set fp_type).
> > 
> >     So in this case, setting fp_type is redundant but benign.
> > 
> > (2) The guest *does* use FPSIMD/SVE, and a trap is taken to hyp to save
> >     the host state. In this case the hyp code will save the task's
> >     FPSIMD state to task->thread.uw.fpsimd_state, but will not update
> >     task->thread.fp_type accordingly, and:
> > 
> >     * If fp_type happened to be FP_STATE_FPSIMD, all is good and a later
> >       restore will load the state saved by the hyp code.
> > 
> >     * If fp_type happened to be FP_STATE_SVE, a later restore will load
> >       stale state from task->thread.sve_state.
> > 
> > ... does that make sense?
> 
> It does now, thanks. But with your above alternative suggestion, this
> becomes completely moot, right?

Yep.

[...]

> > So I can:
> > 
> > (a) Add the dependency, as you suggest.
> > 
> > (b) Leave that as-is.
> > 
> > (c) Solve this in a different way so that we don't need a BUILD_BUG() or
> >     dependency. e.g. fix the SME case at the same time, at the cost of
> >     possibly needing to do a bit more work when backporting.
> > 
> > ... any preference?
> 
> My preference would be on (c), if at all possible. My understanding is
> now that the fpsimd_save_and_flush_cpu_state() approach solves all of
> these problems, at the expense of a bit of overhead.
> 
> Did I get that correctly?

Yep -- I'll go spin that now.

Mark.

