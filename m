Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D5BFED9F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfcInGoHyz3tOzv/Xwz6FfnrxaU7XbhhSIw2sGC/Vxs=; b=UFMc6zB6tHD8m2s9NwAbybkxUk
	irjRFmyisYKpcZu18ziUbGgj+VsnLPk9V7AHAcLIv4v+sQxaED0zcD8qp8oySKBw4q3c1pPAxvYOq
	1qqDte3HdmUmaCF12/rgvjn8UnV/GpsiUTPWppSLOcu5n2m3KECbES4ILLpyvQatwg8lM7BogeM/s
	bl7uk8Dso3MyFYOcxXAVb1vT9aX32lbq/Rua+tP41nELBuHSx6PLJ53ehIqyQmyIkIXOc/FvKrT/4
	jorCHwKMJ/GXJpgVWfhHgKttq5FfrYmTJzN73NqhTMObrTu0dsdgIC1pKBUDAeF4fu+fNo7jLF3jD
	2aWjX9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y6h-00000006vNE-22an;
	Tue, 17 Mar 2026 17:21:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y6g-00000006vMq-2Cqj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9386A60018;
	Tue, 17 Mar 2026 17:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F05C2BCB1;
	Tue, 17 Mar 2026 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773768085;
	bh=IVGSJM4LoIWwlPtv0GpUpx6vGDQ9JIgeGDNFN88Xd50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cvbw3MJivK1a7TY6KXu52jnmTTZwyvvg/0OorfvWUOHY9IRHuSlsqXJS29zGSdIX6
	 38MCIGzqHytjPGYJAMDzFZWCv3ShrWgSqTcAj+S3vlOKJoQkEBPTC1hqUzlEIC+bsc
	 nb4W9QuYuDrggQX6ZUvpoXlQFQLVg4BgDKY/NJprf2FTbyDo6Mezy9Yjn7ZsKmMW7C
	 T8D1ZGABtrNm2JRopipcU+Uu92hGYI2Db88NDF1q1+g6BTHoObrr6Pi0jKWk77+h9u
	 ZZsRftAMuryD7MB2GmpdDuTAouAZrVktWgWFywtIF375FN/jQTkbMWkSIhtFghXdlD
	 U1xQoB44fKTRw==
Date: Tue, 17 Mar 2026 10:21:22 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Miroslav Benes <mbenes@suse.cz>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 07/14] objtool: Extricate checksum calculation from
 validate_branch()
Message-ID: <77f2cxfdnnddygnzrwmq5krnpvhfln4hnvyscnhays25vojt3y@noahb2i2sakg>
References: <cover.1772681234.git.jpoimboe@kernel.org>
 <7a1e22454a3fd1d968775c24aa0529a4ec7c5886.1772681234.git.jpoimboe@kernel.org>
 <alpine.LSU.2.21.2603101144410.14672@pobox.suse.cz>
 <ssvxqrraejznlambdt3yunuteguhu22yef236ngtqnpyhxruc6@bx2dhcbpzrbq>
 <alpine.LSU.2.21.2603110916110.19933@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.21.2603110916110.19933@pobox.suse.cz>
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

On Wed, Mar 11, 2026 at 09:24:22AM +0100, Miroslav Benes wrote:
> On Tue, 10 Mar 2026, Josh Poimboeuf wrote:
> 
> > On Tue, Mar 10, 2026 at 11:47:41AM +0100, Miroslav Benes wrote:
> > > Hi,
> > > 
> > > > @@ -3691,9 +3691,30 @@ static void checksum_update_insn(struct objtool_file *file, struct symbol *func,
> > > >  				 struct instruction *insn)
> > > >  {
> > > >  	struct reloc *reloc = insn_reloc(file, insn);
> > > > +	struct alternative *alt;
> > > >  	unsigned long offset;
> > > >  	struct symbol *sym;
> > > >  
> > > > +	for (alt = insn->alts; alt; alt = alt->next) {
> > > > +		struct alt_group *alt_group = alt->insn->alt_group;
> > > > +
> > > > +		checksum_update(func, insn, &alt->type, sizeof(alt->type));
> > > > +
> > > > +		if (alt_group && alt_group->orig_group) {
> > > > +			struct instruction *alt_insn;
> > > > +
> > > > +			checksum_update(func, insn, &alt_group->feature, sizeof(alt_group->feature));
> > > > +
> > > > +			for (alt_insn = alt->insn; alt_insn; alt_insn = next_insn_same_sec(file, alt_insn)) {
> > > > +				checksum_update_insn(file, func, alt_insn);
> > > > +				if (alt_insn == alt_group->last_insn)
> > > > +					break;
> > > > +			}
> > > > +		} else {
> > > > +			checksum_update(func, insn, &alt->insn->offset, sizeof(alt->insn->offset));
> > > > +		}
> > > > +	}
> > > > +
> > > 
> > > does this hunk belong to the patch? Unless I am missing something, it 
> > > might be worth a separate one.
> > 
> > It belongs, but I should have clarified that in the patch description.
> > 
> > This hunk wasn't needed before because validate_branch() already
> > iterates all the alternatives, so it was calling checksum_update_insn()
> > for every instruction in the function, including the alternatives.
> > 
> > Now that it's no longer called by validate_branch(),
> > checksum_update_insn() has to manually iterate the alternatives.
> 
> After writing the email I had a suspicion it must have been something like 
> above but failed to find it. Now I see that next_insn_to_validate() called 
> in do_validate_branch() handles exactly that. Thanks for the pointer. The 
> patch looks good to me then (and the rest as well as far as I can judge).

Actually, next_insn_to_validate() helps with an edge case for directing
code flow from the end of an alternative back to the original code.

The code which traverses the alternatives is in validate_insn():

	if (insn->alts) {
		for (alt = insn->alts; alt; alt = alt->next) {
			TRACE_ALT_BEGIN(insn, alt, alt_name);
			ret = validate_branch(file, func, alt->insn, *statep);
			TRACE_ALT_END(insn, alt, alt_name);
			if (ret) {
				BT_INSN(insn, "(alt)");
				return ret;
			}
		}
		TRACE_ALT_INFO_NOADDR(insn, "/ ", "DEFAULT");
	}

> I must admit that objtool has gotten so complex that I have a hard time to 
> track everything in the code :).

The code hasn't changed *too* much, it's just that validate_branch() got
split up more when the tracing code went in, so things are organized a
bit differently.  Most of that code is now in validate_insn().

-- 
Josh

