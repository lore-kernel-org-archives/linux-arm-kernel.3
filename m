Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0F5E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 20:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiZTKf4hCKQ8GKQ+oAO9V4GLtbxeasgvzn3MVqs40sY=; b=hgRRZdXn3YfbV/YBYFmLlt77fU
	kf+4ItMN2FMnyVqMukTuj0I8pRmAdPazpxaly+3kRRp/tlgIhbbM4cc+lDPC3LqVWqrrC9pPGkqyq
	1MbrmJpQ/tgn8KclTobgEnqj6jveTU8yx6gj++bTmMIUfjln5AcBoriprlknYeGAsuC2B9sS7JOgE
	fhifaSZKN1IZxEKQEWECJIO0n0xvIQAeIsgZK2/GMdn9psaPL1LxF0NkDw4yAQsB9KsKmsd7fhM6J
	YOKWbgaaH45h7EZPjtzYZgYrxgQNz+PZPel32NzNRGYTTsYSkX30qupwkx9gCG7uRcBgyYmlPYnYn
	kKUbk2wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK1R6-00000004N0w-2HEN;
	Sat, 07 Dec 2024 20:29:56 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK1Q4-00000004MvG-16Cp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 20:28:53 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aa64f3c5a05so141185766b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 12:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733603330; x=1734208130; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HiZTKf4hCKQ8GKQ+oAO9V4GLtbxeasgvzn3MVqs40sY=;
        b=deBqVbFOnGlt0Jop6cjTkTtcMgKIfnrKiViobRf7TyOmvr+6v4370Up7VfgyRoFVmm
         ACV+xtH4hxPrrxhqQvCpi5XxeSGuzJHnJe42dhvh3KveaxBom2j0Lz8AaB8JxASwDkFa
         +gy5MPtp2YVlyiHLIYfag7ffD3N+SplnD3lcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733603330; x=1734208130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiZTKf4hCKQ8GKQ+oAO9V4GLtbxeasgvzn3MVqs40sY=;
        b=o50o/3633LKxfYTfwttC1enAAt5wHy8RUQnBZY1gb0nknKOUmW1OvE2s3elsuBMLr9
         DLGPqV5iMRknnz3p0optwrTrpc7NEmpeVERng2H5YiZ4r4SIJPPL43TJl9XLsn1pO6ZJ
         na35kQ3k7ZV0eATTjw4gX0/7JV3Y4kpHw6bSTxE/hHDcTZGxO4bB8W2U01atSD9PBHFh
         F6av7hRGB98Q5X4OuIEAwbv5Tk4NDiYGEyk9dxOKcEYr12uSm8AFD+d2Js3dIWcho5qh
         zjoz2Y7giQTpApqzi2mvI2PeoTDU0z5+KyqIHVxLkQ2SKn6Lrg42WgDKQ4R0uLP33fKF
         2VXw==
X-Forwarded-Encrypted: i=1; AJvYcCW6PVjlF8y/uViuw1QZbRXBfxDUPr6J3gBuOHWR7/GUZnn4ivJLslW7qx3T3/YbYo5f99tlY3zQbIhcWMtQhtJG@lists.infradead.org
X-Gm-Message-State: AOJu0YwxBcRbL/7626saCGLgx4bI/8iymlb4q91YXxdat8v4varrNyY2
	4DMueZ+T/yAeo1siQAi83EiQBk3yuNAiRYstRs8XFaMy+lOnQIU3Oa6xh8q77AXy29tCK0J93Oq
	dbYuTkQ==
X-Gm-Gg: ASbGncsme7uFvI5ENXE9K+T1zm5t8aKgULreRxFTBam7hfGC+qIvp5v7p2s1W/v9dsV
	RyVRt2eVvXFQrGfoP8P1JZ+n1LBq4h/Xta60cjE8lr0VYnuOtz6EJYLpkHBJCXv79SdsIF/p5G+
	2yJj2/iF/74mi4dS+4zEvldfYMz8wa2rsBwfp9mxlC/a8LolErZl+o3lUXqM1JppvJ+iw/oa3Wx
	fMT4EL8Z3TiOwjqwwyZua9bONz86S+dVxlQsjw60p5nfBTkt5GZ0AFnl7QuVLi3tH52nwSmLTZG
	KNP2JDzoZz9eh9QKwwWoumAh
X-Google-Smtp-Source: AGHT+IGJquniIzGPjamzI/rqDOphR6JcPqDF/S4wZVDoDpB3/VLLjVCMvgz42bgvTueoi3OR09mppQ==
X-Received: by 2002:a17:906:2921:b0:aa6:7107:db00 with SMTP id a640c23a62f3a-aa67107ec76mr71973466b.50.1733603330481;
        Sat, 07 Dec 2024 12:28:50 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa675581337sm12205366b.120.2024.12.07.12.28.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 12:28:49 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso521828366b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 12:28:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVeP3acuYe32JmTpDzM6/GVvUgp9ZCo3NdjMG8x7T9BpbRlWQlzr7Ab/Pv7l3dY2T/ZMD0CyMeAYbGsZpJkn/aP@lists.infradead.org
X-Received: by 2002:a17:906:5a52:b0:aa5:3853:553d with SMTP id
 a640c23a62f3a-aa63a21b715mr608706066b.46.1733603329136; Sat, 07 Dec 2024
 12:28:49 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de> <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de> <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
 <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de>
In-Reply-To: <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 12:28:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
Message-ID: <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: David Laight <David.Laight@aculab.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
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
X-CRM114-CacheID: sfid-20241207_122852_390309_778538FD 
X-CRM114-Status: GOOD (  19.15  )
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

On Sat, 7 Dec 2024 at 11:19, Martin Uecker <muecker@gwdg.de> wrote:
>
> But that all seem solvable issues on the compiler side.

You know, there was a whole *architecture* that was designed and
predicated on "it's all solvable on the compiler side".

That architecture was pure and utter *shit*.

Because no, it's not solvable on the compiler side.

Getting things like value range analysis right on the compiler side is
fundamentally hard.

It's hard to the point where either you only get it for the simple
cases - yes, I can show you a ton of real code where it's trivial - or
you need to have explicit markings in the source code to help the
compiler, and then you end up having to have the compiler (or some
other tool) validate those with asserts or whatever.

And random asserts ARE NOT ACCEPTABLE in the kernel outside of pure
debug builds.

They may be acceptable in most other situations, but in a kernel you
can't just say "we stop now because it turns out the analysis was
broken and the manual notes could be fooled by an attacker".

Now, would we want to have proper value *static* range analysis in the
kernel for other reasons? Oh yes. It would often be very nice to have
the ability to state "this value is trusted and is in this range", and
have it percolate all the way down, both for optimization purposes but
also for various sanity check purposes.

But it's simply not sanely available in the generic case.

> a) this is not guaranteed in a specific situation (-Wvla-larher-than)

We'd either get horrendous numbers of false positives that we then
have to manually add special code for, or

> b) transform the array automatically to fixed size array
> of size X *or* something smaller when it can show this.

we'd just do this by hand *once* and for all, and say "VLA's didn't work out".

So yeah. We did (b) by hand.

We used to have VLA's in the kernel. It was a disaster. We got rid of
them, because the (big) pain wasn't worth the (few) places it was
actually useful.

So we have been VLA-free for the last five years, and it's been good.

Simplify.

             Linus

