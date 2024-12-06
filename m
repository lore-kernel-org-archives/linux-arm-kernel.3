Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09B4E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 19:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kAPKRPq5lRZj3+w00sHuehEc06lXL6QAGg+wJWcK0Q=; b=TtO0TlNLoYF6xIKguI0IoObnhn
	+BZEU2b3HVLZNo5he2D2wK3slHGfCyp3eju5jUEXqVFYCEg9ssxyKy2rZtzzhNoJ3Vvbbct+xJZei
	KMHlFxRtH9QrF8OZsvjclLY4N3/yE2tH2LKTeKny+JdA6C0fJ2WJKrL6Q6q9nojZ9BXzZaD4Nbn1Q
	aYQ2B9i5+H7XxX/NzfEDrVNz9Gr4Bj4nTQXslqhs5sG2MK6QkO6CDHCuqvgOBYSGmtK2106JlESpq
	tJNEYpIvRaNXPVtRGMPR2nK5ygr4HCjjOUXeGhnly7gioog0iRLLfWWWf8krBe+00sFjruMD5BIj6
	BYTRTaFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeBP-00000002a6G-3FPI;
	Fri, 06 Dec 2024 19:40:11 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeAM-00000002Zph-1auw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 19:39:08 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 4B6JcarQ027033;
	Fri, 6 Dec 2024 20:38:36 +0100
Date: Fri, 6 Dec 2024 20:38:36 +0100
From: Willy Tarreau <w@1wt.eu>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <David.Laight@aculab.com>,
        Vincent Mailhol <vincent.mailhol@gmail.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "uecker@tugraz.at" <uecker@tugraz.at>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Message-ID: <20241206193836.GA26860@1wt.eu>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
 <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_113907_039008_9283D33C 
X-CRM114-Status: GOOD (  13.95  )
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

On Fri, Dec 06, 2024 at 11:15:20AM -0800, Linus Torvalds wrote:
> On Fri, 6 Dec 2024 at 11:07, David Laight <David.Laight@aculab.com> wrote:
> >
> > I'm missing the compiler version and options to generate the error.
> 
> Just -Wall with most recent gcc versions seems to do it. At least I
> can repro it with gcc-14.2.1 and something silly like this:
> 
>   $ cat t.c
>   int fn(int a) { return (a<<2)?1:2; }
>   $ gcc -Wall -S t.c
>   t.c: In function 'fn':
>   t.c:1:26: warning: '<<' in boolean context, did you mean '<'?
> [-Wint-in-bool-context]
> 
> > Does a '+ 0' help?  "(var << 2) + 0 ? 0 : 0"
> 
> Yeah, that actually works.
> 
> And "+0" is nice in that it should work in any context.

I've already used "+0" to shut certain warnings, I don't really remember
which one, but also remember it was OK everywhere I needed.

Another trick I've been using to shut up the compiler is a cast via typeof
and an intermediary variable:

  #define shut_up(expr)                           \
          ({                                      \
                  typeof(expr) _expr_ = expr;     \
                  _expr_;                         \
                  })
  
  int fn1(int a)
  {
          return shut_up(a << 2) ? 1 : 2;
  }
  
  int fn2(int a)
  {
          return (a << 2) ? 1 : 2;
  }

  $ gcc -Wall -S t2.c
  t2.c: In function 'fn2':
  t2.c:15:19: warning: '<<' in boolean context, did you mean '<'? [-Wint-in-bool-context]
     15 |         return (a << 2) ? 1 : 2;
        |                ~~~^~~~~

See ? It only complains on fn2() but not fn1(). Similarly I found it
to be quite portable (at least I don't remember seeing it fail on me).
It produces the exact same code, except at -O0 where it does really
create a local variable.

Willy

