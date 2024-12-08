Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CF3E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 19:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjK1bZri5pPYXLEPg3pfsInYn2WFK+u61JXJym8gukc=; b=adF11ffP+7/ZCLbqvXiyXdmFzK
	xT5I6OTW+I4MhCMaf01nZrmxNf2Tdz2tIlIWLR+7zagKSGGr/hc6fGJ0TnEl23YTc9/4RLQT0lCxA
	zd9/xsJOQoeo60TJhzpFooj65abtgJRridBz0cfBl7L6NTgyP6xX/6r1P9MnAJopKDBO1EYb0CZRz
	qIL1qCAHi5iPBqzRdRpJ2/zQvWqpt6VnsmOd4HsfKW3pzLcdUtr2G8dDoWPTOHLsM9ALkGC0sqq94
	qIx2OYzrlqoOu0StNHQDXDHTDUj9qMXy9TLiiidTpg0cp2ZGd2jgwRKT9yxUWKyeFj9/drIPmj8nj
	mNwe9PaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKMiw-00000005jIZ-144t;
	Sun, 08 Dec 2024 19:13:46 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKMhu-00000005jD9-1lnw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 19:12:43 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso637631066b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 11:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733685160; x=1734289960; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjK1bZri5pPYXLEPg3pfsInYn2WFK+u61JXJym8gukc=;
        b=Fy9y0+PkhlJ9pzRkAQ5xSjDpZgyH6eed0yL1wFskEEUZhxRP3eBCYoYTYraoX2r1cz
         ZJZ8UokkF3KtLyamsYtmfxMVFn+xiSZ2FCoRmlrN/EuszR5xePhJWmYFOdNUgKRxlUOd
         pcMgSHMQmuQRD+Vyz/dxG2xkZLLnLaagIMAPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733685160; x=1734289960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjK1bZri5pPYXLEPg3pfsInYn2WFK+u61JXJym8gukc=;
        b=s+uv78tLyF1vCPTAgTJtZZ7P+hVWLL9FCemzxfNq3XwSYf1Az1Gs9kBxK0InaF3G4b
         0Ov5TknMMSDHL2pOApIJa79gP3zd4WTMZpZNJACzet0DU7n+Hi4PRH+NRuVEL2rGREZS
         5Ebf4YAMTcedFYFWVI45Q2FbW7nP37aPRD6A6epsE0IR0AAbvEzDZ1ZNxLmg/0m8qj4g
         BEWQHHty6LiyCfgP+4lby22OVQy4IGd7e6YKK2CuRGIwKnHO04aUCDw1PKcLVEo39XIC
         eo02pHLtP/n2pvqpOlNpeVmb3mavgK43tWyy3zEtpSzxmmhlT+DLgY1rwAtxnuhFyCAR
         Y/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtxsfUcuVpsscn/o5c1w2fGKrHVdjRN6x2tYrgVsuHIQUpE32JiWNqOok0XXXBHBUm/Ns1cCXuVlTLlgQdKkG5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7swXH9mMqxIKYCLN8ilY5t5uY8QV0nYsNO5Rh3xJEZUvuaIHT
	395GUwrmktuVXgqafGm6Uo+dVzZGv3TzQ+RPT8KKaUQCZj5xWF5HN2AyQ3PRgVbzJKXgSW20lL+
	ZsnVL1A==
X-Gm-Gg: ASbGncuOXrNqi7pKH2oKRd8ekeebGjtlVDyh4fhxYkQ5YH+qwxbc6V9UZ4pZv3ooiFg
	MuhFhmK8tCM0hxvuKWPQfkZ/V1qmchWegEk2dyrDbM57jRC/VI9tr50KkRxcVsASjfai50s3bgF
	Txaen6wgGON/Xue0/eJ5StOWSJF+CswB1XpQsIKdwMuN1TGz/kAeNljnpuDPFo+1/eK0xF34diO
	DNKr8hQDbQqTV3frrI2x5g5WNeYQQlWDEdwYSjdAUj+hvskI83pnwRzhK+OJwlBP2/94CW/J0NQ
	b2GPHqa3x1I4sLFbjjCtc3+l
X-Google-Smtp-Source: AGHT+IF8ylCMIqjIsGu7IN7N1FmgQSNh04EpMfCOnNM2ztt1yqmUVdNSvkdqqPcynf9GiinA/COTBg==
X-Received: by 2002:a17:906:3191:b0:aa6:73ae:b3b3 with SMTP id a640c23a62f3a-aa673aebe0dmr344854466b.32.1733685160211;
        Sun, 08 Dec 2024 11:12:40 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa674a112c7sm155085766b.147.2024.12.08.11.12.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 11:12:39 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9ec267b879so707503966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 11:12:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVeJsHmB6rge6xBQO4igofuz+wI2yuHrZoN28fwNuwSj1W+YqcEd0h8DFC9qxiTCor5H52Fg0CaRZ/31yQ61Ytd@lists.infradead.org
X-Received: by 2002:a17:906:8a53:b0:aa5:4d96:ec7 with SMTP id
 a640c23a62f3a-aa63a21bf90mr809950866b.44.1733684751478; Sun, 08 Dec 2024
 11:05:51 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de> <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de> <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
 <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de> <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
 <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de> <b71056c1b9e04aa383f2e5608c27290f@AcuMS.aculab.com>
 <6658618490381cf5ec35edbb66f1478024174e67.camel@gwdg.de> <e71fffb7ff0e4bf29692d006c0fe77c2@AcuMS.aculab.com>
 <87dd9b7b52e7cea874c1899f56efdd3d7c5b7243.camel@gwdg.de>
In-Reply-To: <87dd9b7b52e7cea874c1899f56efdd3d7c5b7243.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 8 Dec 2024 11:05:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg+_6eQnLWm-kihFxJo1_EmyLSGruKVGzuRUwACE=osrA@mail.gmail.com>
Message-ID: <CAHk-=wg+_6eQnLWm-kihFxJo1_EmyLSGruKVGzuRUwACE=osrA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_111242_558559_32C70FB7 
X-CRM114-Status: GOOD (  25.82  )
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

On Sun, 8 Dec 2024 at 10:11, Martin Uecker <muecker@gwdg.de> wrote:
> >
> > A lot of the 'macro business' for min/max is avoiding unexpected
> > conversion of negative values to very large unsigned ones.
> > And no, -Wsign-compare is spectacularly useless.
>
> This is a different topic, but what would be needed here?

Dan Carpenter actually wrote up some of the issues in:

   https://staticthinking.wordpress.com/2023/07/25/wsign-compare-is-garbage=
/

but the basic issue is that -Wsign-compare has over the years been
truly spectacularly bad.

It has literally started out from the completely nonsensical and
incorrect assumption that the types of a comparison have to match in
signedness, and it shows in the name itself, but it also showed in
early implementations.

The very first versions of gcc that did -Wsign-compare literally
complained about code like

     sizeof(x) < 5

because obviously one side is an unsigned 'size_t', and the other side
is a signed 'int'. So comparing the two is clearly invalid, right?

No.

It's obviously *not* invalid, and any compiler that complains about
different signedness of that compare is just complete useless garbage.
It's literally checking two constants against each other, and the
result doesn't depend on the signedness or the silent C implicit type
conversion.

And no, gcc doesn't complain about that particular code any more.
*That* particular problem was I think only visible in a gcc
pre-release that sadly did actually ship as part of a SUSE release, so
we saw it in the wild even if it was never in an official gcc release.

I'm pointing out the history because it's relevant due to explaining
*why* the whole concept of looking at just the type is so broken, and
how the whole background to the warning was broken from the very
beginning. The very name of the warning is a sign of the problem.

Because gcc still *does* complain about entirely valid code, where
"fixing" the warning just means you have to write worse code.

I think Dan's example from the link above is a good one: if

        for (int i =3D 0; i < sizeof(x); i++)

causes a warning, the compiler got things entirely wrong.

And yes, modern gcc very much warns about that:

  t.c:4:27: warning: comparison of integer expressions of different
signedness: =E2=80=98int=E2=80=99 and =E2=80=98long unsigned int=E2=80=99 [=
-Wsign-compare]
      4 |         for (int i =3D 0; i < sizeof(b); i++)
        |                           ^

So if you want a general-purpose "Warn about dangerous comparisons",
you need to get away from the mindset that it's about different signs.

A compiler needs to do proper value range analysis before warning
about comparing said values. Not just mindlessly say "different types
bad" like some marsupial that has been dropped on its head a few too
many times.

End result: calling it "Warn about sign compare" is a disease. It
shows a lack of understanding of how complex the warning logic needs
to be.

Now, I'm not claiming that our min/max type warnings are great either:
they *do* end up basically being the same silly "just check signs, but
at least don't complain about signed positive constants being used for
unsigned comparisons".

So our min/max macros most definitely are *not* doing that "value
range analysis" that I claim is required for a *general* comparison
thing.

But our min//max macros aren't some general thing. They are very
specific, and so it's a lot easier to accept the not-great-analysis
for those specific cases where we then may have to change types
explicitly or do some other massaging to avoid the warning.

Put another way: a warning that triggers on really basic C absolutely
*must*not* have silly easily triggerable false positives for good and
idiomatic source code.

Such a warning is worse than useless, and gets disabled.

But a warning that is overly restrictive and gives silly false
positives can still be entirely acceptable when the context of that
warning is very limited.

So this is why in the kernel we disable '-Wsign-compare' in the
general case, but *do* basically manually then implement that very
same logic in the very _specific_ case of the min/max() macros.

What is unacceptable nonsense in one case may be acceptable "good
enough" in another. Life is not fair, I'm afraid.

                Linus

