Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC19FC5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 00:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOSnxQzcmiqyC1BWTtii7cFL3Os2J8CSE8dSpLGK4HU=; b=HJcsVJ7B/O4vu5SLHSIExiCARG
	cWTVjb2HuAbu0iGDZNC/MZzzYkW6bIDkMxKi9iEfogxead9Qd9129E4E9Lo/aDLiOQuAyPApmxIg0
	lhShs+TQXZiOQQI2k4tdgBLrrj8v+FT36IZycOFjoLwEfh/3/wwowNMHbQWSZ7EU2Ltp00nziOCmD
	mcsyO+6ViemxIl1f7P5z3u+ftQh97JTEBAA5pRKBcDpDP/tygG1MitbC+yThHrTg6GMwNxAlS45WQ
	1jDVAwuD0sb7gLV4mXRqaOYTiHdeo2fzrxf2mDEK5QcXaWfWQDhcDMtq96ju3trHCZ1is7w3Z0UN2
	0UjJYL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsV3V-00000008v8Q-00Zz;
	Sat, 08 Aug 2026 00:36:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsV3S-00000008v8K-3CK8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 00:36:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC24660054;
	Sat,  8 Aug 2026 00:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A707C1F000E9;
	Sat,  8 Aug 2026 00:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786149409;
	bh=MOSnxQzcmiqyC1BWTtii7cFL3Os2J8CSE8dSpLGK4HU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gpCQZEpREw06/WxueV2zhL/u7J32gYgkc+39TRkUlvH+P0ab9OCtRI/0q5qmf0PIZ
	 GhWZ/lhLlFTwHY9z5UinDTvXIopBOl2/hCBEvK84oHWiL6LMH1X0GAKePnSFjmlztQ
	 J29p+FouG9L1pw1ZsHqrKYOIkhM/dCDfLK/8bNfxgWPyQY769sdLNsHZ9dp+dSlSY0
	 2WdRiaY11al9hUElv4VAdoZI+OjdpZdUXrLMH0sY1iVyr+YoAKy7bAXsqOOng/r+nu
	 RXTBNLFMZMGtwyLwjSGrfTJqSvSssylJJTX9ml8LmgTBldLKP3rshVfdgKH82xCVf8
	 8LPBuF6ekniMA==
Date: Fri, 7 Aug 2026 17:36:47 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: sashiko-bot@kernel.org
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Petr Mladek <pmladek@suse.com>, Song Liu <song@kernel.org>, live-patching@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, Miroslav Benes <mbenes@suse.cz>, 
	Catalin Marinas <catalin.marinas@arm.com>, Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v3 17/21] objtool/klp: Don't correlate arm64 mapping
 symbols
Message-ID: <usz3qfvjypkbrnynylipd5mxtupbvglld4ioetzuzim27tei4y@lhwiwgt3onnt>
References: <48efc64058f667159d3dedf367c1d4cdedf84f1c.1778642120.git.jpoimboe@kernel.org>
 <20260515011947.F225CC2BCC7@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515011947.F225CC2BCC7@smtp.kernel.org>
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

On Fri, May 15, 2026 at 01:19:47AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `is_mapping_sym()` function relies on an overly broad substring match (`strchr(sym->name, '$')`), which risks falsely classifying any unannotated (`STT_NOTYPE`) symbol containing a `$` as an ARM64 mapping symbol.
> --
> 
> commit fb925cb10f7a9c6ab8ecefca87d3cd3b4e4da879
> Author: Josh Poimboeuf <jpoimboe@kernel.org>
> 
> objtool/klp: Don't correlate arm64 mapping symbols
> 
> This commit updates the livepatch diff tool to skip the correlation of arm64
> mapping symbols. These symbols mark transitions between code and data but are
> not standard symbols that require correlation.
> 
> > diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
> > index eb21f3bf3120b..e1d4d94c9d77c 100644
> > --- a/tools/objtool/klp-diff.c
> > +++ b/tools/objtool/klp-diff.c
> > @@ -501,6 +501,7 @@ static bool dont_correlate(struct symbol *sym)
> >  	       is_prefix_func(sym) ||
> >  	       is_uncorrelated_static_local(sym) ||
> >  	       is_local_label(sym) ||
> > +	       is_mapping_sym(sym) ||
> 
> Does this code risk falsely classifying user-defined or macro-generated
> assembly labels as mapping symbols?
> 
> Looking at the definition:
> 
> tools/objtool/include/objtool/elf.h:is_mapping_sym() {
>         return is_notype_sym(sym) && strchr(sym->name, '$');
> }
> 
> Because it relies on a broad substring match, could this exclude valid
> unannotated STT_NOTYPE symbols containing a $ from correlation across all
> architectures?
> 
> Triggering a livepatching failure would require an unusual edge case, but
> would it be safer to use a stricter match for standard arm64 mapping symbol
> formats like $x or $d?

Not realistic.

-- 
Josh

