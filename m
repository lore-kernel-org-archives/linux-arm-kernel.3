Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782ABE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 21:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5clrau1lRtsXlazqJvRaiJm9ebUB3H7RT0weXhH8So=; b=tyzZ4IRuTkXnJLRoIk4J3ZVCTJ
	O8J0SpfKBDHyr9OYu7F77pxkwU/q/avIYNO41HGv92ltEhwVCISB1X12+R3P6FlnmqnyA/juoAWXc
	CKH/4BbwbWMYUtUubOf4VWjnh99372rIdaR+HnwIzYufXirVzj1VE9F9JxPn+AwZFMqFd526YDLMS
	12yUE+W5hY4qijOl4zGbnB1mBLxNZKkFJiG1pQ3qbU/W8k4yZfHBKWrEWCBvkeHOtIWLQif7hb34K
	rCBKrYy4i93CnC08jQZQtfehFGbg3XwXO+2/41GgPRGjUpnykwHnvLSaSkObFJfNemHk6E4etuTK/
	yAFRdY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJJe5-0000000HQLr-3gXr;
	Thu, 05 Dec 2024 21:44:25 +0000
Received: from out-13.smtpout.orange.fr ([193.252.22.13] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJJd2-0000000HQHt-2A1K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 21:43:21 +0000
Received: from mail-lj1-f173.google.com ([209.85.208.173])
	by smtp.orange.fr with ESMTPSA
	id JJcwt3J1veELzJJcxtOc6e; Thu, 05 Dec 2024 22:43:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733434997;
	bh=L5clrau1lRtsXlazqJvRaiJm9ebUB3H7RT0weXhH8So=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=JAsHkzNql/nzk1vKgsOWePrIBfEqHex6sCnGCEh97M3aI3hGOD3Ehu8ONxl5Cq+5X
	 TNA/G6eR0tO+gS8DOhItVmyfTnsACWqF7n2aZhlPRIGXAEplG1NlZ9B50IY4X/tF4k
	 3CQt6IOjLmPObnFW4+/oAZuXpBT7zqyjwDEs3jg8QPuCAJKJedlcfHaEDiL3yXhyRE
	 LzcAZ5Q4O81CAdvQeyzlHxPDEV4zIpywY8tLPzgVnvwWCnBhX4TD/wO+orjI6jiAI2
	 1TilDwxE3+1scgmvUlrrFyYSePdfBoZYl6n7RzXVSaycfEwikNEzf/+cVuhD0qRuFy
	 3+S6vdqd5eIQw==
X-ME-Helo: mail-lj1-f173.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 05 Dec 2024 22:43:17 +0100
X-ME-IP: 209.85.208.173
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffc380b1d0so13824251fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 13:43:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVX3Lo6HY9D4CK9hcziPUI1sZbNo/axVbvA6Y8Lj7l3OLlXZCLZUixE8hXMIbxfThUVD9Dur7e53P4+aaNUGVHB@lists.infradead.org
X-Gm-Message-State: AOJu0YxjD8z4BXiurHAxCgcN84l98h2y7NKH9I8aYSThk/xGotpiOKQ+
	4HPoNOj5MjitqeF2kw/GLHLGeF9r3ejANkZMxCG45XPp1UoR71N7+SEJ/8O97Z/MvXHpIbbV94b
	teDgu0Kk9YgR0/X7ZZOjFfYuEy5Q=
X-Google-Smtp-Source: AGHT+IH7WYy/8Hc8H+vVCwhqalxjzlWUoqcEyoqkjWQBBxloHACrRQF+5k7EKnQaTMOmRJCyI12iNEP09nDvxOtT4aY=
X-Received: by 2002:a05:6402:358f:b0:5d0:fc12:79e3 with SMTP id
 4fb4d7f45d1cf-5d125063c34mr3565576a12.15.1733414047033; Thu, 05 Dec 2024
 07:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-6-4e4cbaecc216@wanadoo.fr> <ad4482cc835543578862051431f5174f@AcuMS.aculab.com>
In-Reply-To: <ad4482cc835543578862051431f5174f@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:53:56 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqJMXKaa_xDcyweGwb+FqvANrpvrkRvnjh6_s-J1ApVmaA@mail.gmail.com>
Message-ID: <CAMZ6RqJMXKaa_xDcyweGwb+FqvANrpvrkRvnjh6_s-J1ApVmaA@mail.gmail.com>
Subject: Re: [PATCH 06/10] fortify: replace __is_constexpr() by is_const() in strlen()
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
X-CRM114-CacheID: sfid-20241205_134320_714383_936A3FF8 
X-CRM114-Status: GOOD (  21.38  )
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

On Thu. 5 Dec. 2024 at 03:58, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:33
> >
> > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >
> > is_const() is a one to one replacement of __is_constexpr(). Do the
> > replacement so that __is_constexpr() can be removed.
> >
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > ---
> >  include/linux/fortify-string.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
> > index 0d99bf11d260a3482bbe46e35c7553c0ccfb8b94..e3f2f772c5439ef71eb4a904b4ce27956bc69743 100644
> > --- a/include/linux/fortify-string.h
> > +++ b/include/linux/fortify-string.h
> > @@ -254,8 +254,8 @@ __FORTIFY_INLINE __kernel_size_t strnlen(const char * const POS p, __kernel_size
> >   * Returns number of characters in @p (NOT including the final NUL).
> >   *
> >   */
> > -#define strlen(p)                                                    \
> > -     __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
> > +#define strlen(p)                                            \
> > +     __builtin_choose_expr(is_const(__builtin_strlen(p)),    \
> >               __builtin_strlen(p), __fortify_strlen(p))
>
> I'm sure Linus suggested a way of doing that without replicating
> the __builtin_strlen().
>
> Indeed it may be valid to do:
>         len = __builtin_strlen(p);
>         __builtin_constant_p(len) ? len : __fortify_strlen(p);

Then, wouldn't it be better for strlen() to be an inline function
instead of a macro?

  __FORTIFY_INLINE __kernel_size_t strlen(const char *p)
  {
          __kernel_size_t ret = __builtin_strlen(p);

          if (__builtin_constant_p(ret))
                  return ret;
          return __fortify_strlen(p);
  }

I tested it and it worked on an allyesconfig. So if I receive no
objections, strlen() will become an inline function in v2.


Yours sincerely,
Vincent Mailhol

