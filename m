Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7888AC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 00:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvlyJKdE192JAO01xRoJhAr4gdn8qg9JaO5oXNv+qhI=; b=KCFoihEH5AXseGf322MH8fsnil
	g+U6UW/Th68N5oYYHnLiDqNg+UIX5pR2h+dQYkBxnIXD+xf8oaOSXg9iPjlMXvOfwnTG7pf/YYF6z
	TR+8Lh5ntbTDjtrYoWovDnB318gQEuwaaQ/DCBi6jwr/VYc5ZixI/XbhgKxpjm7Qn+GZlyullS7X1
	Ofvcn+JOr51KNC6g1Mx6gUvxmdE4H1t+B3T1Pwgb/YMqXM/xpHKg3c/oByli1vStZT0DYlNWlMMLM
	FTLinBaJUvwgBC9Zuj98ALzqqBv3HnMHgrilUlCd9joZO+xwCX+WBaBGUvKkodFLnUalGrd974TMR
	ytHuYS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwrh-0000000F9ZW-2fvX;
	Wed, 12 Aug 2026 00:30:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwre-0000000F9ZI-174T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 00:30:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B848600AE;
	Wed, 12 Aug 2026 00:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E267D1F000E9;
	Wed, 12 Aug 2026 00:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786494636;
	bh=NvlyJKdE192JAO01xRoJhAr4gdn8qg9JaO5oXNv+qhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CMchk1oUOFt2K8ezRECQ5ICwvGOQlMvPhdI0E8Jxfl3xTl1lzAoghSQz6l0sseXEQ
	 3FsUz3Egsybpxb71hQaTmSjmIPhEwg1A0axkWuDsEfMAJcFHw+4ryi5XuFdgXlxGuR
	 qTsj0/XXr4v6XLIKEZwxQrc7QEm9UUo4gsvusQcPHJGQ6lbCdptE+jhpQUuRTsyYlB
	 ynJsDHjZBnPvTGGaIbptOUTPYH6HmMyho97FUx1Dh6hShs8snmsgS4/s7v8nyHXxhf
	 rWEbOSxrErnyOGeN7uwFkIlpDo3bQWx0MrW8c+yjmj6K6RClSYosZDguy9BFEgrSK9
	 Qf5vSh93MNq6Q==
Date: Tue, 11 Aug 2026 17:30:34 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v4 15/22] objtool: Prevent kCFI hashes from being decoded
 as instructions
Message-ID: <anu-Xbm02J7BgCIb@jpoimboe>
References: <cover.1786230311.git.jpoimboe@kernel.org>
 <11e49187e13d36d4257bc60cd2606e0ff5481dfc.1786230311.git.jpoimboe@kernel.org>
 <CAPhsuW5tzBOHnw42d31r_5k9eS28VrDLGXoUzS=hYkZmAyRbhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW5tzBOHnw42d31r_5k9eS28VrDLGXoUzS=hYkZmAyRbhw@mail.gmail.com>
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

On Tue, Aug 11, 2026 at 04:58:05PM -0700, Song Liu wrote:
> On Sat, Aug 8, 2026 at 4:18 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> [...]
> >
> > +/*
> > + * ARM64 mapping symbols ($d, $x, $a, __pi_$d, etc) which mark transitions
> > + * between code and data.
> > + */
> > +static inline bool is_mapping_sym(struct symbol *sym)
> > +{
> > +       return is_notype_sym(sym) && strchr(sym->name, '$');
> > +}
> > +
> > +static inline bool is_data_mapping_sym(struct symbol *sym)
> > +{
> > +       const char *dollar;
> > +
> > +       if (!is_mapping_sym(sym))
> > +               return false;
> > +
> > +       dollar = strchr(sym->name, '$');
> > +       return dollar && dollar[1] == 'd';
> 
> nit: is_data_mapping_sym() calls strchr() twice. Maybe we can
> optimize it by eliminating a strchr()?

I suppose it's a bit funky, but the compiler CSEs it, so it's harmless.

-- 
Josh

