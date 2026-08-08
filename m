Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256C6C5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 00:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+Oj3uWkY34NwPpBlXEx8i9PkPfVKPmRlTMGNMOx57g=; b=y8IysvnE8MzBodjFX/sJ+xSVxO
	d64PBRvhbnFI+nigGbnylDLjUuER07YvFsVJSpeiwfcVQE/EBZwnCjikDOIZqurRlqxe/H8rDv2V2
	6USh6jy3kuz/hquXNTcE6VdXZJITHAVxdJw4Vtdz2p2ExLy77ofrKKdCGcE9wMa0B2W1krsJBsJcb
	1LLyasF9+nTeiSHahWZiFrRoKaLyzZUtQo+yPw91/sStS8iUSs1ZvqKwXQP4PoZrEDtwbMcH49pQC
	Nr4g0fCpTji+Z4yZ4HHQ63L4OLXen8kRfFrAwOVcj7mEJwU2LyKN2nal2kdYQ94fNNW8lL6KlI7HM
	yOAk8KIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsV00-00000008uv5-2Ffm;
	Sat, 08 Aug 2026 00:33:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUzy-00000008uuh-2Rha
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 00:33:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 59155419A7;
	Sat,  8 Aug 2026 00:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A79E1F000E9;
	Sat,  8 Aug 2026 00:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786149194;
	bh=m+Oj3uWkY34NwPpBlXEx8i9PkPfVKPmRlTMGNMOx57g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hNufMEhE7XhvQCVhz80JhxOTPKOpI2ZOt8r5+a8EwxMpWD85d1aYL1Ozk1pzPPgKn
	 F70gamQUqooiGZBr8FrxNJ3sLz6Mcb/DtUIfNZzEGLklNLZcUsk2VkMESRWHcgVD/T
	 pRJOJzWdxolhWn770mWh4vDx66OY0zOWqeutmGKUQljfKVumATE+KBy5Nq+54dZOb5
	 u0K4HVDW1+NjRt/oBe8YcBiVM7UwURl7naEIAuZhCukxxgSjnCLOiLrI6rUhLr+hQF
	 W1WFnTLFhWmuiHrrnjledz8KIkSwN3PwzLCJ8HSZ/A5A0YTnlSaIg7k6s4NcC0NEmX
	 q0SObuLHwO37A==
Date: Fri, 7 Aug 2026 17:33:12 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: sashiko-bot@kernel.org
Cc: x86@kernel.org, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, Petr Mladek <pmladek@suse.com>, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Miroslav Benes <mbenes@suse.cz>, Song Liu <song@kernel.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v3 14/21] objtool: Prevent kCFI hashes from being decoded
 as instructions
Message-ID: <rvazkws6uosluw7lxjpf3pmxzhmktmxehj6momrjqpe6nuej3z@h6ip4ikjiwfo>
References: <b1d50c9fc9e6b9bca43833cc4ccbd88a31fed84b.1778642120.git.jpoimboe@kernel.org>
 <20260515001652.09947C2BCB3@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515001652.09947C2BCB3@smtp.kernel.org>
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

On Fri, May 15, 2026 at 12:16:51AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Build failure due to undeclared mapping symbol functions.
> - [Low] Unused header inclusion.
> --
> 
> commit 4ad78a24a64cd6a2d10b9a2f9c0d306fba3e6d19
> Author: Josh Poimboeuf <jpoimboe@kernel.org>
> 
> objtool: Prevent kCFI hashes from being decoded as instructions
> 
> On arm64 with CONFIG_CFI=y, Clang places a 4-byte kCFI type hash immediately
> before each address-taken function entry. This commit uses mapping symbols
> to mark such data as NOP in text sections to prevent objtool from decoding
> them.
> 
> > diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> > index e05dc7a93dc1e..2b03a2d6fc952 100644
> > --- a/tools/objtool/check.c
> > +++ b/tools/objtool/check.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/static_call_types.h>
> >  #include <linux/string.h>
> > +#include <linux/kconfig.h>
> 
> This isn't a bug, but is this include needed? It doesn't appear that any
> Kconfig configuration macros are being used in the modified code.

Fixed.

> 
> [ ... ]
> 
> > @@ -478,6 +483,16 @@ static int decode_instructions(struct objtool_file *file)
> >  
> >  			prev_len = insn->len;
> >  
> > +			/* Use mapping symbols to skip data in text sections */
> > +			sec_for_each_sym_from(sec, map_sym) {
> > +				if (map_sym->offset > offset)
> > +					break;
> > +				if (is_mapping_sym(map_sym))
> > +					is_data = is_data_mapping_sym(map_sym);
> 
> Could this cause a build failure across architectures here? It appears
> is_mapping_sym() and is_data_mapping_sym() are neither declared nor defined
> anywhere in the codebase at this point in the patch series.
> 
> If these functions are only introduced in a subsequent commit, applying
> this patch independently might result in an implicit declaration of function
> error, breaking git bisectability.

Fixes.

-- 
Josh

