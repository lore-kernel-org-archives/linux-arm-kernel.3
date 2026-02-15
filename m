Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F95E63F08
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 22:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDmUias2s0pvnhz4ZeDjGfgxnsQChrumnkaZhgFLeFw=; b=Ywja5GBg8vBUBCVL/1eL2Jn0PI
	czDiF0Tkr0CoQ3NChXl05XdLhVlChSEeWnbxG62FLJs5C1OmikQOlzLxTfTA3c8rotqexJCcf8GSl
	/gcjtUCpQl9q7QPi983o5+ZOU/R8osiz/lCfkzoOt6hCjqGyiHGVoBnilZHsEExB7VNV3Ai96wPLm
	OH8Z6DUd5IPPew80JIAO/GMsR9/CmhxjDK3UVDzIYSkI8bNwthGE1Li5D8X2pkvRh+zAA4oRxHmYj
	+RsRBSiblxjbs11lGOlpj+BLPNZpi7MjY4Oo//4JOSOlZB8mShMuXn5WAJFaFM2O89rJgyzpg9Uj9
	CsR52o7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrkQN-00000005hra-0z7V;
	Sun, 15 Feb 2026 22:17:07 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrkQH-00000005hqp-17XO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 22:17:05 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so19462765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 14:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771193818; x=1771798618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDmUias2s0pvnhz4ZeDjGfgxnsQChrumnkaZhgFLeFw=;
        b=EOQTea7gPtD5RACJsUAnW14pHe4UHeSuhfKqiEDGnt5eMGLCvdH6EplLhWzjVPk2kr
         3O4b16Jyb5qsIXh0ZHR8/2U8lz8RWu5JFgYaICFYSXhtYPwD81oMi7y5ASqWW++Fi/4J
         n48WEw2gtKQmUttWhOshgSSZwwRPkX70lDAF6ve4IGKwF5i7mucDExSzyWn2nnrxsUcC
         ccGQeFIv2M6Tk8rFL0RZdNqNXHlnDtwvjJ2PD4t80pkX8EGiZDD2NCSXJYJgKBv3z21Q
         WXSeUd6lDbh6+SZECEQr2WcTx43zhNkrM4+wM3Y9I8NX800s0R5Nc3Lq4Wup3AXYzu2C
         xXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771193818; x=1771798618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IDmUias2s0pvnhz4ZeDjGfgxnsQChrumnkaZhgFLeFw=;
        b=Rc+ZNKuR5XUve3SPS8s6FwxFkptY6QHytFxtk45p/li+/iq9+NS6xQIG3ba3rBp9tB
         +r382U91qSxKzLpY2bbD4G4j81RVEG2aTpVpTIZqv0iYC1AGkJ8Ifz9E90UmHKHsclof
         3H6s7v9A7HAqRmZBlDQU/VnAoPscooBJk7WLxZSwrDas/xdmw2h00wSh2JxlLq+AlVOh
         F3ZanZsuypoYmEWcbhv9Yt8hPdoNf15yWHdxix9BHwh6TzN2gu7KT+aLjgwLRjI7iqVY
         umQsjXEsDiguZyiVaIQ2Jnh2/8ba0LyoXgcS34f6VVqNZbneRYxpFRTriXXVp19GSGNK
         0nBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLMOFMSh9YuafxMNcOto0t7wmhs+3Lp7gBbbh8eGSxJ2j58zpsIPthkRaRhBq8BAeHohRMzuUbtsKrscMN6t+0@lists.infradead.org
X-Gm-Message-State: AOJu0YyjR/pBeAcGmTHQsEoV1W0WY/XrtJvG4GF3DoxuAfz95v7Omts9
	A7zpDvtWjPx2W0CCb2tRg/37lewTTma8Pr6KND/kmhmwiarL6aWJMFLD
X-Gm-Gg: AZuq6aL46St+tk0DHAM9436azLgzCKUapexkTbvPmwwnJwfeBGy5LcrDywsq43NrHe6
	NK7tcQKVK8k7xykpTddBDHm28laSKzRaBGWJ1uMYfEkyuJD1qNxKI/aJCEwJ5GTVhrru7wnKNFt
	FkA7OqR1ZcwJzm0PeozTUn86nXrnOmJYY4up9NkA7rpaLb8yDfTawDZpOPecQgtdjx6IvOEdnye
	8DQIlEQfsBFkMjzGuenoh65vg1rT7dZ5vuEwWx/ryudgQb0i1OWADCJBmMEtkjetA9kykbHhV+M
	Qa5geHNuQLompclvZ7wEOaHleOmHfhLZ3CFX84irgBdhMHvR057tlmLQwWNVPzT5Gek8STuRV7O
	F2P0s4vP+V0MMcX70DnIvZ8ppGsFSBL+7l3kbvGBWTlS6yCQvsX0Dlq7nsRo4NIx+3ovOJtwlcC
	ztZQqtMpeEgdILs2tqCjcWSo+0vLg/qd0s03hlNapa8J5zZsFyGHC63iHU7AABuirY
X-Received: by 2002:a05:600c:6211:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-48373a09741mr161305915e9.10.1771193818234;
        Sun, 15 Feb 2026 14:16:58 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5d156sm24535875f8f.5.2026.02.15.14.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 14:16:57 -0800 (PST)
Date: Sun, 15 Feb 2026 22:16:56 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260215221656.68b2fc1d@pumpkin>
In-Reply-To: <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-4-elver@google.com>
	<aYDFOIskB20CbztD@willie-the-truck>
	<20260202192923.0707e463@pumpkin>
	<aYHgNSF5a3F7UGU_@willie-the-truck>
	<CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
	<20260204131400.GI2995752@noisy.programming.kicks-ass.net>
	<aYNUmEfDzq7lTFFr@willie-the-truck>
	<CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
	<20260206182650.6c21b0ff@pumpkin>
	<CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_141701_374683_99F6686E 
X-CRM114-Status: GOOD (  50.39  )
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

On Sun, 15 Feb 2026 22:55:44 +0100
Marco Elver <elver@google.com> wrote:

> On Fri, 6 Feb 2026 at 19:26, David Laight <david.laight.linux@gmail.com> wrote:
> > On Fri, 6 Feb 2026 16:09:35 +0100
> > Marco Elver <elver@google.com> wrote:
> >  
> > >  On Wed, 4 Feb 2026 at 15:15, Will Deacon <will@kernel.org> wrote:  
> > > >
> > > > On Wed, Feb 04, 2026 at 02:14:00PM +0100, Peter Zijlstra wrote:  
> > > > > On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:  
> > > > > > On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> > > > > > [...]  
> > > > > > > > > What does GCC do with this? :/  
> > > > > > > >
> > > > > > > > GCC currently doesn't see it, LTO is clang only.  
> > > > > > >
> > > > > > > LTO is just one way that a compiler could end up breaking dependency
> > > > > > > chains, so I really want to maintain the option to enable this path for
> > > > > > > GCC in case we run into problems caused by other optimisations in future.  
> > > > > >
> > > > > > It will work for GCC, but only from GCC 11. Before that __auto_type
> > > > > > does not drop qualifiers:
> > > > > > https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> > > > > >
> > > > > > So to summarize, all supported Clang versions deal with __auto_type
> > > > > > correctly for the fallback; GCC from version 11 does (kernel currently
> > > > > > supports GCC 8 and above). From GCC 14 and Clang 19 we have
> > > > > > __typeof_unqual__.
> > > > > >
> > > > > > I really don't see another way forward; there's no other good way to
> > > > > > solve this issue. I would advise against pessimizing new compilers and
> > > > > > features because maybe one day we might still want to enable this
> > > > > > version of READ_ONCE() for GCC 8-10.
> > > > > >
> > > > > > Should we one day choose to enable this READ_ONCE() version for GCC,
> > > > > > we will (a) either have bumped the minimum GCC version to 11+, or (b)
> > > > > > we can only do so from GCC 11. At this point GCC 11 was released 5
> > > > > > years ago!  
> > > > >
> > > > > There is, from this thread:
> > > > >
> > > > >   https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV
> > > > >
> > > > > another trick to strip qualifiers:
> > > > >
> > > > >   #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> > > > >
> > > > > which will work from GCC-8.4 onwards. Arguably, it should be possible to
> > > > > raise the minimum from 8 to 8.4 (IMO).  
> > >
> > > That looks like an interesting option.
> > >  
> > > > That sounds reasonable to me but I'm not usually the one to push back
> > > > on raising the minimum compiler version!
> > > >  
> > > > > But yes; in general I think it is fine to have 'old' compilers generate
> > > > > suboptimal code.  
> > > >
> > > > I'm absolutely fine with the codegen being terrible for ancient
> > > > toolchains as long as it's correct.  
> > >
> > > From that discussion a month ago and this one, it seems we need
> > > something to fix __unqual_scalar_typeof().
> > >
> > > What's the way forward?
> > >
> > > 1. Bump minimum GCC version to 8.4. Replace __unqual_scalar_typeof()
> > > for old compilers with the better unqual_non_array hack?
> > >
> > > 2. Leave __unqual_scalar_typeof() as-is. The patch "compiler: Use
> > > __typeof_unqual__() for __unqual_scalar_typeof()" will fix the codegen
> > > issues for new compilers. Doesn't fix not dropping 'const' for old
> > > compilers for non-scalar types, and requires localized workarounds
> > > (like this patch here).
> > >
> > > Either way we need a fix for this arm64 LTO version to fix the
> > > context-analysis "see through" the inline asm (how this patch series
> > > started).
> > >
> > > Option #1 needs a lot more due-diligence and testing that it all works
> > > for all compilers and configs (opening Pandora's Box :-)). For option
> > > #2 we just need these patches here to at least fix the acute issue
> > > with this arm64 LTO version.  
> >
> > Option 3.
> >
> > Look are where/why they are used and change the code to do it differently.
> > Don't forget the similar __unsigned_scalar_typeof() in bitfield.h.
> > (I posted a patch that nuked that one not long ago - used sizeof instead.)
> >
> > The one in minmax_array (in minmax.h) is particularly pointless.
> > The value 'suffers' integer promotion as soon as it is used, nothing
> > wrong with 'auto _x = x + 0' there.
> > That will work elsewhere.  
> 
> Agreed that getting rid of __unqual_scalar_typeof() in favor of 'auto'
> where possible is the way to go.
> 
> Unfortunately I spent the last week occasionally glancing at this
> arm64 READ_ONCE problem, and could not come up with something that
> avoids using typeof_unqual() or __unqual_scalar_typeof(). I'm inclined
> to go with the unqual_non_array hack, but not make this available as a
> macro for general use - we have too many of these horrid macros, don't
> want to add more to this hack pile.

Agreed, having to do such things inside what are already horrid 'functions'
is one thing, but when they get used in 'normal' code it is silly.

Have you checked whether sizes other than 1, 2, 4 and 8 are ever used?
There aren't any in an x86-64 allmodconfig build and it used to be an error.
Even if there are handful, having to use a different define wouldn't
really be an issue.
Removing that support would make READ_ONCE() easier to write/understand
and (hopefully) compile faster - there is a measurable cost for the
'size check' in the x86-64 build, the arm LTO expansion must be significant.

	David




