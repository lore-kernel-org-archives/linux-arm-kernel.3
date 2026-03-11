Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F075EFD0655
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 08:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VDoG4qgirvBquEcLfmlPu2dvl2T+iu1SW8cK79GS8c=; b=HkAGlJSTQkhMOmDgxuDsMR8LEr
	LcOBEtE01JpAUFeOSWaqzNkZdfd4f5cKdDf3Sc1QPRdeLm1MvIsta7M4rBfow6z9UBzBvGKBqYk0I
	nlX0Zmp3h4hp7/1y1VK4WUVu8y1BNaoEmEUXQTbiyJouzHmc4WXZkxGQJ9rscnZoGZ4xXDDCqr3id
	3v6Y3xqMY0Z4Lr5UxweyhW45sb0D2pbO5Ml/U6a/NL7FsnBIArXC6golry57v2gFCRGV1DmoRvsiK
	BY5Y6knzmXeXiIULqRPKZJ3D1buAYPRH0J0OA9o7/APVTjqidpXt3iRPTK+3qVc5sic52feMiWNQh
	vgN1iXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Eri-0000000BAMQ-3Cjo;
	Wed, 11 Mar 2026 08:24:26 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Erg-0000000BALr-2PZs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 08:24:25 +0000
Received: from pobox.suse.cz (unknown [10.128.32.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E148E4D252;
	Wed, 11 Mar 2026 08:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1773217463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2VDoG4qgirvBquEcLfmlPu2dvl2T+iu1SW8cK79GS8c=;
	b=NmA2pocH2heMkXY5+3NRBkqxyEvl+Wmn/A0IugdEFIvkyQ1BJL5KcH0B8IjpHwYrhXF1qV
	oLl60dcWk9EYvLj/XxD/ZcssNjOyYQ2v/Pn20lsKe6+cqkoDxhnymulC9VtP9Z0RHufitC
	q3e/s+Gd+OvPHEF4hvEt+4m0W0GLjy8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1773217463;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2VDoG4qgirvBquEcLfmlPu2dvl2T+iu1SW8cK79GS8c=;
	b=KVddPJblQmeWPPQdPPrRRdCj6IOiQmWTlsTwkJBXoM0aFlYXsamUidvo+UlCUjRzUgXY1w
	OfLMqTnRKG1Rw0Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1773217462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2VDoG4qgirvBquEcLfmlPu2dvl2T+iu1SW8cK79GS8c=;
	b=Oeex2kaXhr0qVjMJKZwyjUZsymTICnNW0et/WGkvadOWt2tggyhqhawNlI7rz1uW++ScLM
	/riJE+H94ehNAFUerHEy2xaV9o5yj6OV3+wzXxW7Rk9lGTv0XGsYdfDUVsRreksIS7+MAE
	u0/3NjcHXzXsvopzNWxAOdixlGpDbdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1773217462;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2VDoG4qgirvBquEcLfmlPu2dvl2T+iu1SW8cK79GS8c=;
	b=SYobaRbRcdcBzwR8ROiEEmYr9ihgc4AGoS2rBo2sdw2LF+6TTW+67PXO1Ilalijb0m03Dz
	iQ6iIsZi95AVNYAg==
Date: Wed, 11 Mar 2026 09:24:22 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Josh Poimboeuf <jpoimboe@kernel.org>
cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
    live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
    Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
    Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
    Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 07/14] objtool: Extricate checksum calculation from
 validate_branch()
In-Reply-To: <ssvxqrraejznlambdt3yunuteguhu22yef236ngtqnpyhxruc6@bx2dhcbpzrbq>
Message-ID: <alpine.LSU.2.21.2603110916110.19933@pobox.suse.cz>
References: <cover.1772681234.git.jpoimboe@kernel.org> <7a1e22454a3fd1d968775c24aa0529a4ec7c5886.1772681234.git.jpoimboe@kernel.org> <alpine.LSU.2.21.2603101144410.14672@pobox.suse.cz> <ssvxqrraejznlambdt3yunuteguhu22yef236ngtqnpyhxruc6@bx2dhcbpzrbq>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_012424_875380_B2B981DA 
X-CRM114-Status: GOOD (  22.46  )
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

On Tue, 10 Mar 2026, Josh Poimboeuf wrote:

> On Tue, Mar 10, 2026 at 11:47:41AM +0100, Miroslav Benes wrote:
> > Hi,
> > 
> > > @@ -3691,9 +3691,30 @@ static void checksum_update_insn(struct objtool_file *file, struct symbol *func,
> > >  				 struct instruction *insn)
> > >  {
> > >  	struct reloc *reloc = insn_reloc(file, insn);
> > > +	struct alternative *alt;
> > >  	unsigned long offset;
> > >  	struct symbol *sym;
> > >  
> > > +	for (alt = insn->alts; alt; alt = alt->next) {
> > > +		struct alt_group *alt_group = alt->insn->alt_group;
> > > +
> > > +		checksum_update(func, insn, &alt->type, sizeof(alt->type));
> > > +
> > > +		if (alt_group && alt_group->orig_group) {
> > > +			struct instruction *alt_insn;
> > > +
> > > +			checksum_update(func, insn, &alt_group->feature, sizeof(alt_group->feature));
> > > +
> > > +			for (alt_insn = alt->insn; alt_insn; alt_insn = next_insn_same_sec(file, alt_insn)) {
> > > +				checksum_update_insn(file, func, alt_insn);
> > > +				if (alt_insn == alt_group->last_insn)
> > > +					break;
> > > +			}
> > > +		} else {
> > > +			checksum_update(func, insn, &alt->insn->offset, sizeof(alt->insn->offset));
> > > +		}
> > > +	}
> > > +
> > 
> > does this hunk belong to the patch? Unless I am missing something, it 
> > might be worth a separate one.
> 
> It belongs, but I should have clarified that in the patch description.
> 
> This hunk wasn't needed before because validate_branch() already
> iterates all the alternatives, so it was calling checksum_update_insn()
> for every instruction in the function, including the alternatives.
> 
> Now that it's no longer called by validate_branch(),
> checksum_update_insn() has to manually iterate the alternatives.

After writing the email I had a suspicion it must have been something like 
above but failed to find it. Now I see that next_insn_to_validate() called 
in do_validate_branch() handles exactly that. Thanks for the pointer. The 
patch looks good to me then (and the rest as well as far as I can judge).

I must admit that objtool has gotten so complex that I have a hard time to 
track everything in the code :).

Regards
Miroslav

