Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2ADE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 15:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1k59tg7g6ZR0AiJKHkbtvAsnBjYlK49uTsKYbfsQyM=; b=xBna4PQV8leSSG1X1Y372gUAni
	LsncX1ICxPepOhL3XCik2N69kak9Nh2wxzO3oD5/KXT9UjlyzO99Y8xO2qEquKh2XLpcb0pCdh3Y1
	NmbjunF3zdc4pHiuCFqo31jtLXDMebaAp1yK79Ka6/mgvKhXrBPWMI3hUhyg5tji6A0Crj7SUadpB
	1ZSazhYqD3FiKquaOCen2fXW+r0A4OzOZ3RwaWF2KzjJtdaE/giu7YJz9dyLlzc3KCHnHwyUk7TUg
	09y4kTxaphrzQ5iH8u5lwbI65kvG7hbTkmRu8wSQX0xr84U6kLcTvFBId2Gw4MFYDI+nckzuDYzxm
	UyJXMkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaex-000000023QU-0eAC;
	Fri, 06 Dec 2024 15:54:27 +0000
Received: from out-15.smtpout.orange.fr ([193.252.22.15] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJadv-000000023M9-0g4E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 15:53:25 +0000
Received: from mail-lj1-f178.google.com ([209.85.208.178])
	by smtp.orange.fr with ESMTPSA
	id JadotaIEQ60jWJadptLVNb; Fri, 06 Dec 2024 16:53:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733500399;
	bh=Q1k59tg7g6ZR0AiJKHkbtvAsnBjYlK49uTsKYbfsQyM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=fKtbMZ5e7UStiyuD342Rp/U/JB98QwkfvLfdqD7cHAhFT750srLxdTN2JGUakuWD3
	 SHPJCkf7UsV9WL2EHl0AGNoXBaElul1y/DEDEWK4M+WfhiYxHPwiea+PmwUMRtLjyB
	 PufA6TTvHBMBJinHrTbV8e5+3aJY+BlKwsQz2KvJ1yUeych6uTXvyinfwpWZHuThPe
	 9f/xJKrHajZknKxH8UWQa23/nAyCBvihjRiB8KSWVs4drqj/AXL7lX5E1gxjteq5Ma
	 rO3c7ZSyb4NQogF030iFOs0ETIV4hYqIqQGoCKK5jXC1J0zjPX/kc+O/DJBQ7+4YgX
	 t4GGdaSO5OezQ==
X-ME-Helo: mail-lj1-f178.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Dec 2024 16:53:19 +0100
X-ME-IP: 209.85.208.178
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffc7a2c5d5so22502711fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 07:53:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqM6uayhU9AeelWC4O6rTLdusZDJYV4Z1TcIFfGHOV3BfUm+iDM2ApHZ1wt7X1PpRaybHqmqZhWYf/+tEwd5my@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9XuRfNJ8ksDJfw3/rAwJ8ajmJf8CyKAJcfYOHWMkyTKmhwbJ8
	S7SvcaQG3E+vyIynI4v1veNSjITzFsOlKdFkunu1/FGA6h6OOr+j/ifCwmA3ka1RuEqT4ZQn3nJ
	hAt/7dzLCJ5hbMVBSxvIParE6Xbs=
X-Google-Smtp-Source: AGHT+IHLXgFQhA/c3KQxjVrMyKCAmSqwk42Fqpsfdz6EK+jIFFcEtdXEZClHZQiPmD1jBbv/RGy99L+br5F0PLvN22o=
X-Received: by 2002:a17:907:7392:b0:aa5:427d:b101 with SMTP id
 a640c23a62f3a-aa63a1109camr127306566b.36.1733460187056; Thu, 05 Dec 2024
 20:43:07 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-1-4e4cbaecc216@wanadoo.fr>
 <e115a4245e5342a994a7e596cc6357fa@AcuMS.aculab.com> <CAMZ6Rq+n0vG9zObF-kY-Xo+iP_Y3P8A6_nEfB8F=UhqeQBepRw@mail.gmail.com>
 <b48e2f5dd8d64cbab471629ae03c7511@AcuMS.aculab.com>
In-Reply-To: <b48e2f5dd8d64cbab471629ae03c7511@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 13:42:56 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqKUH5VGHAuqv+dR_0o1JFTvV_gNV2qUwoMfcWCQUSX2Lg@mail.gmail.com>
Message-ID: <CAMZ6RqKUH5VGHAuqv+dR_0o1JFTvV_gNV2qUwoMfcWCQUSX2Lg@mail.gmail.com>
Subject: Re: [PATCH 01/10] compiler.h: add statically_false()
To: David Laight <David.Laight@aculab.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	Martin Uecker <Martin.Uecker@med.uni-goettingen.de>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_075323_606225_CAED8655 
X-CRM114-Status: GOOD (  22.50  )
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

On Fri. 6 Dec. 2024 at 12:39, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 05 December 2024 15:26
> >
> > On Thu. 5 Dec 2024 at 03:30, David Laight <David.Laight@aculab.com> wrote:
> > > From: Vincent Mailhol
> > > > Sent: 02 December 2024 17:33
> > > >
> > > > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > > >
> > > > For completion, add statically_false() which is the equivalent of
> > > > statically_true() except that it will return true only if the input is
> > > > known to be false at compile time.
> > >
> > > This is pretty much pointless.
> > > It is just as easy to invert the condition at the call site.
> >
> > To start with, I will argue that:
> >
> >   statically_false(foo)
> >
> > is more pretty than
> >
> >   statically_true(!(foo))
>
> Except that the test is more likely to be:
>         statically_false(x > y)
> and the invert is then
>         statically_true(x <= y)
>
> No different from C itself, there is no 'ifnot (condition) {...}'
> (don't talk to me about perl...)

No need to talk about perl, just staying in C, it has both the #ifdef
and the #ifndef directives (and since C23, it even has the #elifndef).

Regardless, this was just a nitpick. You convinced me, I will remove
both statically_false() and is_const_false() in v2.

> I suspect you need to pretty much remove all the comments that
> cross-refer to statically_true() from the other patches.
>
> So is_const_true() is just 'return true if the expression
> is a 'non-zero constant integer expression'.

No. Linus made it clear in

  https://lore.kernel.org/all/CAHk-=wh5SNYdgx8-X+ggHP+ojbG2F7oyt3TLmMgqejYd5zn0Aw@mail.gmail.com/

that we need an explanation of why statically_true() may not work in
some contexts and I agree with this.

As far as I like using proper nuances between the terms 'integer
constant expression' and 'compile time constant', treating
statically_true() and is_const_true() as completely different things
as you are suggesting is not constructive. At the end, what matters
the most in a comment, is that the final user properly understands how
to use the thing correctly.

Removing the cross reference would increase the risk of people using
is_const_true() in places where it is not needed. I will keep the
cross reference to statically_true().


Yours sincerely,
Vincent Mailhol

