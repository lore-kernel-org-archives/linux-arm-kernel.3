Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFE1C44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/h7AFpYYjfr4QRK5vZ0HEp1r6v/217c+9SOII2nfXY=; b=s0trS1Uz7eRyzrbc7kdD71n/Zs
	UL+cL4huQGcW3qRUGqxJyNqt5UnF7y5LfIaAuVVgCovZSSFna5vK6Zo4gI9Uj5H0/s2AItPVxMYIr
	iLpvYUxwSrY6jgMU+Q2svwoa+q8oFMRgPDzLUbsC4pWKVwEHypvhzahr639zaI/pnnGTA4QDzKc0a
	BsR1PykMjo35WyGF+NwxUnnq7oXzRZ1CGtsBnDumS4oWmlbfUy7UVXMwZfNRJish4JNZblgb9ty/j
	3YmI7817AbNVioZjZsLINtbpQNNqqM1K/7XTv+/WdWvw99148i6fuRfHr/mW+cVrTTi2HosXe9iyv
	5f6mYLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgmb-00000002A0b-1NkD;
	Fri, 17 Jul 2026 11:31:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgmZ-00000002A0G-3Ua4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 11:31:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FE3142D97;
	Fri, 17 Jul 2026 11:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3EA1F000E9;
	Fri, 17 Jul 2026 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784287867;
	bh=s/h7AFpYYjfr4QRK5vZ0HEp1r6v/217c+9SOII2nfXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RJ6waE8J5De7CGz3kfzL1GYaHOVqcIMu9z2HzrtrB4BDaZe3CBznCa6qekPUT52BG
	 q59cTRh0FkDXzqk05NB/RNFR5hrRIglXq1KOBY480Jqp53WBwTH/+M/I7gez29PtF5
	 FcBtgZAMKqqTSnH/wIHCb3JbwRWsSG+m/ZR8uRgFIlKoUBdSY1A5mDw9L1iTytNqj8
	 9ItG8frbfB/5CtyqMOj1P5+Z9PYVYqB3C8OdNeA2i7GdgpLnT9AHtwKk0fdw0oSKUD
	 bOgebkta91WA+pWyAqnoW4HZfDd+0GcrEAMhuuwPci17UO6sqbZQwL8SXf+nrJt1tK
	 bDGgbyIGuN+Qg==
Date: Fri, 17 Jul 2026 12:31:03 +0100
From: Will Deacon <will@kernel.org>
To: Bradley Morgan <include@grrlz.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: sleep: dedup the sleep_save_stash slot lookup
Message-ID: <aloSd8AwZQPoh4ev@willie-the-truck>
References: <20260705192331.23150-1-include@grrlz.net>
 <20260705192331.23150-3-include@grrlz.net>
 <aljsRBIEzeNVdzvn@willie-the-truck>
 <EFA466A8-F9E9-422D-B10D-BC1B324050AC@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EFA466A8-F9E9-422D-B10D-BC1B324050AC@grrlz.net>
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

On Thu, Jul 16, 2026 at 05:55:38PM +0100, Bradley Morgan wrote:
> On July 16, 2026 3:35:48 PM GMT+01:00, Will Deacon <will@kernel.org> wrote:
> >On Sun, Jul 05, 2026 at 07:23:31PM +0000, Bradley Morgan wrote:
> >> Both __cpu_suspend_enter() and _cpu_resume() open code the same MPIDR
> >> hash lookup. Factor it into a get_sleep_stash_slot macro.
> >> 
> >> Signed-off-by: Bradley Morgan <include@grrlz.net>
> >> ---
> >>  arch/arm64/kernel/sleep.S | 55 +++++++++++++++++++++------------------
> >>  1 file changed, 30 insertions(+), 25 deletions(-)
> >> 
> >> diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
> >> index e112b8537f10..8820a131aef7 100644
> >> --- a/arch/arm64/kernel/sleep.S
> >> +++ b/arch/arm64/kernel/sleep.S
> >> @@ -64,6 +64,31 @@
> >>  	lsr	\mask ,\mask, \rs3
> >>  	orr	\dst, \dst, \mask		// dst|=(aff3>>rs3)
> >>  	.endm
> >> +
> >> +/*
> >> + * Compute the address of the current CPU's entry in sleep_save_stash,
> >> + * i.e. &sleep_save_stash[hash(MPIDR_EL1)].
> >> + *
> >> + * @slot: output register
> >> + *
> >> + * Clobbers: x2 - x8
> >> + */
> >> +	.macro get_sleep_stash_slot slot
> >> +	mpidr_hash_assert_distinct \slot, x2
> >> +	mrs	x3, mpidr_el1
> >> +	adr_l	x2, mpidr_hash
> >> +	ldr	x8, [x2, #MPIDR_HASH_MASK]
> >> +	/*
> >> +	 * Following code relies on the struct mpidr_hash
> >> +	 * members size.
> >> +	 */
> >> +	ldp	w4, w5, [x2, #MPIDR_HASH_SHIFTS]
> >> +	ldp	w6, w7, [x2, #(MPIDR_HASH_SHIFTS + 8)]
> >> +	compute_mpidr_hash x2, x4, x5, x6, x7, x3, x8
> >> +	ldr_l	\slot, sleep_save_stash
> >> +	add	\slot, \slot, x2, lsl #3
> >> +	.endm
> >
> >I think this would now be the only user of compute_mpidr_hash, so it's
> >probably better to inline that macro here and then we don't need to
> >bother with mpidr_hash_assert_distinct at all (i.e. your first patch
> >isn't needed).
> >
> >Will
> >
> 
> 
> Will! What do you think of this?

I think it's been mangled by your mail client. Please just send a v2 and
I'll get to it on the next pass through my inbox (which is an unholy mess
right now).

Will

