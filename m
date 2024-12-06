Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41216E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 06:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkINBrTDhyE0tcSEzrQhWY00f3rEWU+OMRPtBhc6Jxo=; b=rGyx+cpI49KiDalPNBr8PF655x
	RqObeVr0FIsvMkdYttjaouLpAZsR77AIT4M+vGIaC4WK/yNWVU/5lizuYCqscygSKgWI6WnusTE7U
	UxNxceJBEahjg5RXxwRZGKtbl8wg2RMm18mL1QxQ3dCJqNyh+5q8hwwgpiQznXUHdSZZ+b0l3+grh
	gCzw8tmBPL5xBFxDqeimz5eTNHq3nz28VoeZC6hL1N8wrGrh1U6X5VsPEFlGns+hWUa+4MgNorW6j
	ejBPWX4NBW4G3P1W4mcbY8hEc3D8Zh50MAVavKF1VqHCfKrD6u1mSV5ZRiri9CAmbxXZPIfXbiRMs
	w2celCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRe3-00000000h6s-22fU;
	Fri, 06 Dec 2024 06:16:55 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRc7-00000000gp0-1B0e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 06:14:56 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9e44654ae3so267584066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 22:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733465693; x=1734070493; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lkINBrTDhyE0tcSEzrQhWY00f3rEWU+OMRPtBhc6Jxo=;
        b=an1LQF76Ko329oQ+4cQOdnDHcaJYG0bQxYh5iqTyztqGgl6r5afOZfhU9Kw27uV5Qp
         b7GU6Sz7Rbz7HyKog/CqnlwZfO7hP2YlMkQBFNz6JKC0FOdaok3Lm2Zp0q9IEIzAkQ7n
         w5Fa9WMNocoRC5EpHbhpcX4ZydGRj46DWU7Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733465693; x=1734070493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkINBrTDhyE0tcSEzrQhWY00f3rEWU+OMRPtBhc6Jxo=;
        b=BbmE5wUPGHP8p8zb2svA++kDy179RqhFVE3WJnDL6As0mgIcdjUhUBkuVvI9JeIGik
         zkAcCf18w/zuQhiRA1KK+fAk2b9T0QaqXaGjD+7cvn79HmcqL5VP+PjoOd7FDHM8QRn2
         5nFWFgaGo1u59qpwcR9WF6WyZoTnzww7E3FfnF+yDwoyhnUP3oq7eB3l5y6rnSkglVND
         bUjvsLydLwxmoNNUNlPNV0yyNThKEu2DhWFytMyL+zlAehm9/9P48BshIn+NM5Lzqcif
         GulVWjOtzzjj6JymIXhCXnXSE6KaHwbvBMdGkEjC5g6IcMsCV8/cA0lQ4DBHppljpDmi
         va1w==
X-Forwarded-Encrypted: i=1; AJvYcCVwBeIZlK47g/HGrQE6Vj4PGZptRiC6IwqTUraacFZVKLHO8NeY8vNtMN2z2l4kSvNpWPtnN6PJ1p7Kay6+JIBB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxor1o8XuWKqYRFSFE3tlzG0rdLdLqzGDuuXc0SBHAmdvoCpObb
	ygcRD6tq5+YuwsuL5bDfFG/HrUKHd28ISG3Y9ikJq9IJRSWDYLn/nk8eSN0xoG7o1igFUEJ1FZL
	xpF5lEQ==
X-Gm-Gg: ASbGncviJuybT3tnF1KdTsKcdAsGGQVZfjU9orI3UPB3oxVtZj1W4093yGqXYkMa55X
	Ykf0ddMKEt6x3rgq6xZvUhiZc3c2jlAI2bufI5bsPq/dgkZpe0xLjoT3/Om9zgxUTIhebCnjz9C
	oaBFsqj986TnkjsyzG8CAi8YUmGcGRoDXZAoBm0XAla2SShkgJ2D9EXKU6NVYa8LUewA/0xguju
	kSwOwbU800exRowWzcT21YlQhyw4apOu5HVmG+jnS1ga2t6GF5txt15ldDoQsyoCp2jl4bBmnQ+
	NSrT2LXKvxcZXUVtdgEtL8F3
X-Google-Smtp-Source: AGHT+IErfusB5f7oKlEoCFd2ylQqyDawCGC+eRk4urk54XpktSKSHYI3qzgokoxngz2dttT7UMaMTw==
X-Received: by 2002:a17:906:18b1:b0:aa4:9ab1:196c with SMTP id a640c23a62f3a-aa639fb24a8mr94762966b.9.1733465693023;
        Thu, 05 Dec 2024 22:14:53 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e58da5sm191269366b.28.2024.12.05.22.14.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 22:14:52 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa5366d3b47so267548466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 22:14:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNrrflFlOXIor8CXKZt781M5DK32/EzF+7yssY3robQMSyxR81TliEL7dq0Tw7DoUOst+lk3MlGYc0CbJz5zPf@lists.infradead.org
X-Received: by 2002:a17:906:1db1:b0:aa6:3de7:f258 with SMTP id
 a640c23a62f3a-aa63de7f394mr66959966b.37.1733465692215; Thu, 05 Dec 2024
 22:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
In-Reply-To: <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Dec 2024 22:14:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
Message-ID: <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: David Laight <David.Laight@aculab.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Martin Uecker <muecker@gwdg.de>, 
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
X-CRM114-CacheID: sfid-20241205_221455_336076_0E9D2F89 
X-CRM114-Status: GOOD (  14.11  )
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

On Thu, 5 Dec 2024 at 18:26, David Laight <David.Laight@aculab.com> wrote:
>
> From: Vincent Mailhol
> > ACK. Would adding a suggested--by Linus tag solve your concern?

I'm genberally the one person who doesn't need any more credit ;)

> I actually suspect the first patches to change __is_constexpr() to
> use _Generic were from myself.

Yes. And David was also I think the one who suggested something else
than "!!" originally too.

I may have liked "!!" for being very idiomatic and traditional C, but
there were those pesky compilers that warn about "integer in bool
context" or whatever the annoying warning was when then doing the
"multiply by zero" to turn a constant expression into a constant zero
expression.

So that

  #define is_const(x) __is_const_zero(0 * (x))

causes issues when 'x' is not an integer expression (think
"is_const(NULL)" or "is_const(1 == 2)".

Side note: I think "(x) == 0" will make sparse unhappy when 'x' is a
pointer, because it results that horrid "use integer zero as NULL
without a cast" thing when the plain zero gets implicitly cast to a
pointer. Which is a really nasty and broken C pattern and should never
have been silent.

I think David suggested using ((x)?0:0) at some point. Silly
nonsensical and complex expression, but maybe that finally gets rid of
all the warnings:

     #define is_const(x) __is_const_zero((x)?0:0)

might work regardless of the type of 'x'.

Or does that trigger some odd case too?

            Linus

