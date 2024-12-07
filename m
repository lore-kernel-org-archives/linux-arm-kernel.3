Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424B0E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 18:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hz+XAesKzHzZKAdlmXfk5ETHyOV9LQeE1EOaQCTU32k=; b=iLE4GTbFZaH3BYRKOtB/4wndQ/
	xtUYbI/bF+O5QxJLyoLCEpS7Ka3h+JzOgrnli8XtZMF3jOjrRBDXCIks0my/ZvK0V/Irskn73wsn8
	+YScdy5Gq5Fum08n33wIlVlDqYLY26+8MdB8AOyF1EHf9YH5/t69FhRcHcg4rGWBm5Tjo0lvsaXBq
	74/KwMhJZ/fJSxN7I5H1AFYVolHUFUtR4PpHgA8347DCHUpNhTiZVFv/z6Nyr3fT09ueVLm2bBn90
	UWC2ATd/w0PmmOtohZeZsy2efGG7DoMKwH2kJ6dAVeCk8fP95lR2zqTh2QebrUCCopLqAhUUfw8Gh
	wlSHMQ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJzY7-00000004GYT-2rq4;
	Sat, 07 Dec 2024 18:29:03 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJzX5-00000004GUT-1fmO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 18:28:00 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9e44654ae3so501423166b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 10:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733596078; x=1734200878; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hz+XAesKzHzZKAdlmXfk5ETHyOV9LQeE1EOaQCTU32k=;
        b=JVcZjO3bwjtO8Tcm6QanLe9qig4iyHSMP7VE5ttb75j+VGejU2MEDuzpBda9mtyS6p
         qVhnEHccBOSQny89MtCmtdgHrxFXYgr1eJrq5eQezQtrEa/mjd/VTSjF1wRblLA0BPYI
         So8B7k2t5cs8AF37UqLhvJ2yR7NRPiC6MxFOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733596078; x=1734200878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hz+XAesKzHzZKAdlmXfk5ETHyOV9LQeE1EOaQCTU32k=;
        b=gj+y/5rfBteWs1eHNhW+umkrCo+l9XdO48JCyzYawtrao7VE73ln+VCTUbVjRYelK6
         CJOI+h/jplkn4sCWMZ4T1kgvOtkoEYhF6s/UnsbX4FXQ3iC0f09NKrAN2s77G29m1oBA
         fB4vsFrjinUAPW+xt91anutvU4kyzcI88GttaXC/4IctYLAjPK8jgc6ehCu2/v5ip6Xc
         wVsqEG33HPBRdoR6ZkSl9bE7bcdAMqzMBRJY+5MtJObRp25kH0crEv+NCdZVozjp+lkM
         Df5/YVug1kOj7SNLrC++mBCrvmcMA5CZkPc6HMWKbtKaxO90cszTHDdF4pDPkMaSRHLb
         ivFA==
X-Forwarded-Encrypted: i=1; AJvYcCWzRBicFXPcX9C5ovdVryEaC0IyoZFPCiNkoR5QxVsK0BWnGnWrcUu6tbc6c8NZ2pQX4AzqwbrP4DReen2hoPTv@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb/6aFmDtKyuv0ai5nuRzWG24kEBOPHN0WiV0Pa20EZTdnTjx7
	dEi4VJ/kGoJqlkBe54miFDk1lQgFoicCO2iJnam8yhDHENOy31T3DJ1+E3W408yTbUchz3VSH6o
	oIG4eLQ==
X-Gm-Gg: ASbGncshdtccDiGtRDauVhzDxuN+j570tTgXYQKDZ9ZQaidjVj/JuPiY5p+XlerEvCk
	/hXmkKHXoxchnwjHhwgpJzNTv0kI8t7hxDGk9DSfIZ5AJs3wukO5KG5f+0D0relDYd7fLDzGj0J
	QKJakKHstr4i4zAXOOF7jq07EtAWjFensaMcqitdAu8cxW5dvujO9iyVYLunG2VUCksIC/5dqAb
	j86XL3g8y/zrASuGFF1u88FHoyCF4jDQq5yBw7bb++uxW5Rs12LFlkTdK1Pot7nIMLm4TPTQ6zJ
	hLQT8XkzYX5m2ue/O64iDWVT
X-Google-Smtp-Source: AGHT+IGacX54XgNTddBl2fQn4MrwkJZO3WkdhrT6uP0jaN7MkGSpOYuyx0Y+YaXlZgoLWqhq3KR2hQ==
X-Received: by 2002:a17:907:90d5:b0:aa6:41ef:dcbf with SMTP id a640c23a62f3a-aa641efe925mr485504566b.35.1733596077921;
        Sat, 07 Dec 2024 10:27:57 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa673e7a132sm6233366b.11.2024.12.07.10.27.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 10:27:56 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e27c75f4so2418440f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 10:27:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRODJiOhckWffFHgawytIzKXHvfl4Nmnn6JU6Ov0mlB3q7wmELxo2yC/p2dIeI2Czlx1Q2Z0Q4u7reu51P+3o8@lists.infradead.org
X-Received: by 2002:a17:906:1db1:b0:aa6:3de7:f258 with SMTP id
 a640c23a62f3a-aa63de7f394mr497786166b.37.1733595590996; Sat, 07 Dec 2024
 10:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com> <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
 <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com> <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
 <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com>
 <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com> <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
In-Reply-To: <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 10:19:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com>
Message-ID: <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Vincent Mailhol <vincent.mailhol@gmail.com>
Cc: David Laight <David.Laight@aculab.com>, "w@1wt.eu" <w@1wt.eu>, 
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"uecker@tugraz.at" <uecker@tugraz.at>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_102759_434723_0D79EDC7 
X-CRM114-Status: GOOD (  17.05  )
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

On Sat, 7 Dec 2024 at 04:24, Vincent Mailhol <vincent.mailhol@gmail.com> wrote:
>
> > No good - expands everything twice.
>
> And? __is_const_zero() does not evaluate its arguments, so no side effect:

No, the problem is literally the expansion.

Double expansion of these fundamental helpers gets exponential,
because they are used in various nested ways in other fundamental
helpers.

That's why we then spent so much effort on trying to clean up the
min/max macros, because a single line of code would expand to
literally tens of megabytes of horrific expansions.

And the problem with these things is that you can't make them inline
functions, so they have to be macros, and then you build up other
macros using them (like that "clamp()" macro), and it really gets
horrendous and affects the build time.

And yes, it is very sad. Particularly since a compiler would have a
really easy time with some nice helper builtins.

Of course, often the compiler *does* have helper builtins, but we
can't use them, because they aren't *quite* the right thing. Like that
"__builtin_constant_p()" not actually working for some situations
where we absolutely need not just a constant value, but a constant
_expression_ due to C parsing rules.

Quite a lot of the pain we tend to have with these things is directly
related to the fact that we often want to do these tests in contexts
like global array initializers etc.

If there is one feature of C I would have liked it is "allow inline
functions and statement expressions with constant arguments as
constant expressions". Other languages have done that, and it really
does help. And yes, it means that you have to basically have a
language interpreter in the compiler (you do want to allow loop
constructions etc), but it really is very useful.

Oh well. Even if compilers added that today, it would be years until
we could take advantage of it.

At one point I literally was thinking I'd do 'sparse' as a
pre-processor for kernel code, in order to have extended language
facilities like that.

            Linus

