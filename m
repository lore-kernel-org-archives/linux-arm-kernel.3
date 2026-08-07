Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D32BC5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 22:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5d/ApPq9zKbEYsjvmT4dzXT3sPT/1q+7IIhU9CC4Ho=; b=XptDJsbjSl5c+E48GT7QAHafuR
	TFAFm3D4ia+b91ITov8nZ13imowM2nVruulve7bkwcKu10QUS0Ki0OzS7do8vRn8dkhbwsiLQ+p9r
	ZeWKFhA4XsNvPIhuYx/pflbO6jcRk6RPxYJoMQWTgQv8YL8SeWgvYoslhVCabGkiC/LlZaUO5u/bm
	RN4Zkt50q3dqlaC6Agrdf8Iif7jae4Yp/BpMGSoi+YJhd4FRfKMN4ZedhCEuI1vPRRQYPMF9cfZvU
	bewBDOl6Lh/n44/3Y/7IYEPa9+FsgqM/As3+rDCK7OLXQ4kt02OrNMTYs5+6p3Ng5ozRso23km7r1
	zdYkdgiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTMJ-00000008pYe-2wQ7;
	Fri, 07 Aug 2026 22:48:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTMI-00000008pYQ-0Srd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 22:48:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B30B41213;
	Fri,  7 Aug 2026 22:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661941F000E9;
	Fri,  7 Aug 2026 22:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786142889;
	bh=e5d/ApPq9zKbEYsjvmT4dzXT3sPT/1q+7IIhU9CC4Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hWTRQCy6854hksUwK/VkgIwM3NsNKUB/Y+ZrRFbRlL+nZAWlFl17tJfYFsNP649jO
	 KY5n1rO7h1Sjc/7LFbBXUo+NPh2IdoTkUg44lV39YEr0RDr2NY1T+TKCVlcb4n9BwR
	 zzbMNr3uc/VhgGQNiTDz4sU61TpCXcnUShnzTvtI2yxx9OhHiKhe8SVPiKbxWKOto6
	 HbK83zumiS5UlywAgLiVmAylllQU7gbZNFNeuvBzwEdwEU4iGQ0neNVhmbUZl1eOoA
	 RqG8MOUEdCRHM0lOvDrQ8oUQfwgnCoayylFD08fCs/anXPWypZKnE1ZxM++VZX1ugH
	 UdvUchmmtB3Aw==
Date: Fri, 7 Aug 2026 15:48:06 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: sashiko-bot@kernel.org
Cc: x86@kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Will Deacon <will@kernel.org>, Song Liu <song@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Joe Lawrence <joe.lawrence@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 10/21] objtool: Ignore jumps to the end of the
 function for checksum runs
Message-ID: <2jmchblm2lryol7crl2n7rv6f5h4ej7hl3cmnixpv7amkuztsn@t4qigaqzvqg6>
References: <b3b58101e15e1bb5266e57134f0b65f7d8efdd4b.1778642120.git.jpoimboe@kernel.org>
 <20260514223021.1326AC2BCB3@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514223021.1326AC2BCB3@smtp.kernel.org>
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

On Thu, May 14, 2026 at 10:30:20PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing parentheses in the jump destination check causes objtool to silently ignore all missing jump targets when branch validation is disabled, instead of only jumps to the end of the function.
> --
> 
> commit aa068d4053e8b92ff17082c7a023821e72f5d625
> Author: Josh Poimboeuf <jpoimboe@kernel.org>
> 
> objtool: Ignore jumps to the end of the function for checksum runs
> 
> Sometimes Clang arm64 code jumps to the end of the function for UB.
> This commit ignores these jumps to the end of the function for
> checksum runs to avoid errors.
> 
> > diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> > index 10b18cf9c3608..73451aef68029 100644
> > --- a/tools/objtool/check.c
> > +++ b/tools/objtool/check.c
> 
> [ ... ]
> 
> > @@ -1593,10 +1609,14 @@ static int add_jump_destinations(struct objtool_file *file)
> >  			/*
> >  			 * GCOV/KCOV dead code can jump to the end of
> >  			 * the function/section.
> > +			 *
> > +			 * Clang on arm64 also does this sometimes for
> > +			 * undefined behavior.
> >  			 */
> > -			if (file->ignore_unreachables && func &&
> > -			    dest_sec == insn->sec &&
> > -			    dest_off == func->offset + func->len)
> > +			if (!validate_branch_enabled() ||
> > +			    (file->ignore_unreachables && func &&
> > +			     dest_sec == insn->sec &&
> > +			     dest_off == func->offset + func->len))
> >  				continue;
> 
> Does this condition silently ignore all missing jump targets when branch
> validation is disabled?
> 
> Because of the || without proper parenthetical grouping around the first
> two terms, if !validate_branch_enabled() is true (which it is for
> --checksum or --noinstr runs), the rest of the condition short-circuits.
> 
> This appears to cause objtool to skip the error reporting and silently
> leave the jump destination as NULL for any unresolvable jump in the binary,
> instead of only those jumping to the end of the function.
> 
> Should the logic be grouped to restrict the exception to the end of the
> function?
> 
> 			if ((!validate_branch_enabled() || file->ignore_unreachables) &&
> 			    func &&
> 			    dest_sec == insn->sec &&
> 			    dest_off == func->offset + func->len)

Yes, we should tighten that up.

-- 
Josh

