Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3869E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 19:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGtbOaTCTsAvyUDr9a4PNqlmY0QlpNlNkPLsZ0+zYxc=; b=eR+77v9dvhumsCph7+GdX7fBT9
	G+n4vJqHD5h8MXgWCQa8A/ZxR41gtmcffSp8TwGIz5+wuDoThhuzFyIbbndknN6FZFPu02eG0YtJp
	V4cPRBvmyjdoZwivKN5hJ/pohUtcLjgLBGKw/DQsDI1QQxYaw6pqn8ZyMdPrgLvnuFIsiseZjHSzU
	DgE66He7SSTYpwvmc0LAX3CLD5ASDzvTdbMGMXtIsHqwLuAVdm2lN2IeKwXFyvFxHvtzLONBGz9sa
	L55XDc+0C+zcH8vQrGm/iTwGqXfOhADEGpPpz21CiSkg4P8thBsw0XcjFURp5vtzlqiaRcxSbFjq0
	b33tBRow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdaM-00000002UuP-47e7;
	Fri, 06 Dec 2024 19:01:54 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdZL-00000002UfB-1ZPF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 19:00:52 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa629402b53so282030066b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 11:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733511649; x=1734116449; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WGtbOaTCTsAvyUDr9a4PNqlmY0QlpNlNkPLsZ0+zYxc=;
        b=UVR4+XFsWbTFrzB3VfIYCf/hOyax2Lxk+OOPvruSe3E5WdN6zJdjqw5AXZNMfkM9rp
         7aV+LWxepTTeYT10FVuwt6f2CTiCpwDOpw/VvAKWAM6QqASPW7V4D6q4syOmzBoxweBH
         K9b87Rqr27urDcvFMkjWTgy+M1lw1Gxbpkck0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733511649; x=1734116449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGtbOaTCTsAvyUDr9a4PNqlmY0QlpNlNkPLsZ0+zYxc=;
        b=gm8dwJ31xyyB/YbvLTlQ85g4btOhtBgqlJHXJa1Q9wzqP6cpLXKxve2kHEZ7N+ssjp
         tJh+7OxXu7t5BONUdaKsFxedkGsvg69ZurRxdwmiU6eVZkEK5QD4HjNnbYbfF5WlQrp9
         wYPpiCjeDXz35JcBzkHpST/N4gJ5OYnGXUxHm2GxyN+Sl7XuLAUQ7am7Eq7WSv6alkWH
         xrkwDtjcjJrtFFaQSGVHnQPM0uFdI/f5aJAWD1fibtVsZKdcdwo2HHYkgxc/G1NrK+Tt
         w8dzH8xhWr64hjkNVizUFuVzYEcQ5W6GTWgnHCruhe+dh0tAeyQe+hBrA2t8IjmKkXCi
         hphA==
X-Forwarded-Encrypted: i=1; AJvYcCUPiN+Ee+6d6xdYknDOXlN+IrZ/1EGTCVtjT/rfwmd8VEVny3op9hLvnKkf/fEaWPV//Ejry8vQFRMJW3I6TNOa@lists.infradead.org
X-Gm-Message-State: AOJu0YwEsubsnnGAJAvBsTa0KtKW073Oe72DhBcysVyVbSA7mColZVzc
	tJkeCemmcnaZkeScxijvW1Di1Hx6Z7EHnvAV6MHBaX+OioQQtngziPkHIUiji8k4uLGPuQq5npa
	sKfh/5g==
X-Gm-Gg: ASbGnct2T6HK/xRFy22t7P6cxTn++/9aRjt1SH2NxZ/ZnkEr2AqO+Clx5cGAJDpofNi
	Hy0O/fdqF0McvdyQij/TlTlLH344xFqJ5zQKqs5RgENKB8unKCgrv+mBbRjc7MRDJp+rviXCg5l
	24MW6iocZPdbvtV04MlSfNSVzhFq9nhm7pND669Yq4rK7qbekPZuiMIDVM5KfVReMHv+rjnh+st
	+bYhM49t2TAZuDjQ/6dUOFCsQGqs8W0dwzvHw/3pGakw1rLxRUwaHaQE4lw3Zh24RLa3BjzLURA
	FN43RkQQCtss76ApkTzuLkvW
X-Google-Smtp-Source: AGHT+IGKgbPfZE3fRNooNpwUHYhj4uFiJmbQq578jV4UK8XKaIt3a3rypBSVsGGxR6K8s4xIGLAf0g==
X-Received: by 2002:a17:907:950a:b0:aa6:2861:564b with SMTP id a640c23a62f3a-aa639fb232fmr248574866b.3.1733511649017;
        Fri, 06 Dec 2024 11:00:49 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260a3a89sm276097666b.171.2024.12.06.11.00.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 11:00:48 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so24762915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 11:00:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZHWRjdx1sbR5/SAeITFzinTYSV73JgzlW3eyM9bNbYYh/5Yud8g58LXZWo+tDW5ufABUDVpFbFS1jBsc1nuR8@lists.infradead.org
X-Received: by 2002:a17:906:1ba2:b0:aa5:451c:ce1e with SMTP id
 a640c23a62f3a-aa63a0aa48amr290776466b.32.1733511169269; Fri, 06 Dec 2024
 10:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
In-Reply-To: <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Dec 2024 10:52:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
Message-ID: <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Vincent Mailhol <vincent.mailhol@gmail.com>
Cc: David Laight <David.Laight@aculab.com>, 
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, uecker@tugraz.at
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_110051_404363_A3F48D8C 
X-CRM114-Status: GOOD (  13.56  )
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

On Fri, 6 Dec 2024 at 10:31, Vincent Mailhol <vincent.mailhol@gmail.com> wrote:
>
> > causes issues when 'x' is not an integer expression (think
> > "is_const(NULL)" or "is_const(1 == 2)".
>
> But 1 == 2 already has an integer type as proven by:

Yeah, I was confused about exactly what triggers that odd
'-Wint-in-bool-context'.

It's not about some actual bool type, it's literally a random
collection of integer operations used with logical ops.

So it's things like "!(var<<2)" that generate that warning, because
some compiler person at some point went "maybe that left shift should
have been just a comparison instead '<'".

But it turns out that "(var <<2)?0:0" _also_ triggers that warning.

End result: I have *no* idea how to shut that crazy warning up for
this case, if we want to have some generic macro that says "is this
constant". Because it damn well is perfectly sane to ask "is (a << 3)
a constant expression".

How very annoying.

This may be a case of "we just need to disable that incorrect compiler
warning". Or does anybody see a workaround?

             Linus

              Linus

