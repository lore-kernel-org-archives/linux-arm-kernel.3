Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EFCC36011
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 17:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Co4RpiFV+ly6UFErhco3vS5kdG2BX+IOkv6UHpq96sI=; b=1MvN+HXBz31p8lpnutiKsqOsqj
	23w0+nn0cIM2PzCKsqsaXORdCNgb8X54WX/PQtBqIeyRr+AOamiBTO6+xTef+S3ntt1jQr9f/q+CZ
	Y3daA96VZB0pO3y8QO4kdwo9drlvJerNvwk9IiS39I0iwrKNrvD0KPjDsZGRXFonP7vne7YhFOgPd
	Yfz34GHkTgAHHoolHyxSLaHbYPBk+KvBDj1zaYzaGOZ0LgFy9DHDsCtJIarkcOqLo5bTXTG10zivc
	9jdpXvv/pu1aG75mly+6CIUU1yMc81pVLPDRRGyWJFlsAuJBDiEzN/cYeeoN9QMG4LMkMAo9uzWsL
	iIyG6nnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyD5C-0000000DwH4-2Q09;
	Fri, 28 Mar 2025 17:01:26 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyD3Q-0000000Dw1g-36Zy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 16:59:38 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-30185d00446so3374362a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 09:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743181175; x=1743785975; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Co4RpiFV+ly6UFErhco3vS5kdG2BX+IOkv6UHpq96sI=;
        b=OfVKoWUciRHmk7e7mO7temIT7U0nELxBkIlkTbl0AAunPm4A9Mm/Jq+S3tBlR1UPP0
         fUKUa7cUtwTZaHgRHvSq4Z1hBKdO1yjRhnMOMigMrqng5kaNnEI6qBZ1nPUbuWtRzhK8
         ip6UwLKuMWB2/wsYfbUufAOWuqAwu79ADbrC7V5ExHOsOmjQOGNjuV5Q6L+6MqBPQmGc
         kE06XOjJteOhF0OOLBuQbOBDYOTLzdsCPj6wD43qWMgGBB9tLWVTTZOEPTDvUSHq5Odm
         uL+6OxN1WXIQYZhQNUUk4OCW4N3dlvDds38deGTL+aiRZBu0xVUXhgE3bUvz+hCp+Aaj
         Fq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743181175; x=1743785975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Co4RpiFV+ly6UFErhco3vS5kdG2BX+IOkv6UHpq96sI=;
        b=oOXkIqcjTexnsob8Mgg5GuKLNsyG9CiTNp9nzaY77smlg3JjPrcoo61MakwpLUQlV0
         VJ2HiVzbZj4tGI8dlI4EMXLZ8RaTfbtRIm1wNrh6u3mc5wbMV/Ti7GIlfpr401kNT3Gd
         WPoQbZjdQLfZpujBD69IYLmK5sKBn1EOlQd3TDZQSlsNbW5PdH+pVg6cjyDu5WcxZEtg
         DIWfGwLuQIyvAGSyMUkczSqvZEkiE/h83mWP8jD77lCLl8Ip1GSu7YWVtf59rQeADEpR
         2ncG/vH8ahBYWXsZ/hCQ6JI0Y+xlGmdBJggQBhQTPwTgSXvTizdhWiqTwTymHei52C6a
         9kDw==
X-Forwarded-Encrypted: i=1; AJvYcCWHcA5/0op9HSpbQniSHMySe6Yfqf53iobGXDmc5ap0qAYdfDtEluwkBdNez6ZongA+VfQ6KZb4f7ERMhUC77ur@lists.infradead.org
X-Gm-Message-State: AOJu0YwHn2+XyKHp324bpqSa/goAT/lGgix0KboIy9sJGR9ndmoKdwXw
	B9Ce7OgxtNFeusS8CyS9HR5DFeIg4y2kwspZ7KeFM0XMPxRRy/3tm92aHcU/v3ZR+rVwiq4gk9D
	KAa45S5nQUilvqnSUFn8sHxtVsDo9bI1Teji7
X-Gm-Gg: ASbGncsP/5ZT9F1A8PL1ADDP0kIAsKY8REUlzD3qVhi3ja5W1rkF8eaXRPx76ZGlkC8
	3O5RAEU8sMZL9Otmeh1krGctnBG7T/ZSAJZxbzNN361xz8yglcCT5ntbO5cvegaZ79OBFB0EsE0
	tgSBS+V0DRyuA6xYDYUGS8UDJjT8R0+O+RcT6zDGIEG+mh/Ll/QAwc9kv1AA==
X-Google-Smtp-Source: AGHT+IFrUnI6CZJgKZQPMApvvIGJWKalCQQcAgrMhwe8ut9FGmt1jDNcMPB91mkenDBYrNRb8lEWvbPv7r67wkakJTc=
X-Received: by 2002:a17:90b:42:b0:2fa:4926:d18d with SMTP id
 98e67ed59e1d1-3051c952251mr6075406a91.13.1743181175080; Fri, 28 Mar 2025
 09:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAG48ez2jj8KxxYG8-chkkzxiw-CLLK6MoSR6ajfCE6PyYyEZ=A@mail.gmail.com>
 <CAG_fn=UF1JmwMmPJd_CJQSzQAfA_z5fQ1MKaKXDv3N5+s3f6qg@mail.gmail.com> <CAG48ez1w3YO=dwuGqVF3PdHec6=vbYr3GmabY-qQHbZ0fko2JA@mail.gmail.com>
In-Reply-To: <CAG48ez1w3YO=dwuGqVF3PdHec6=vbYr3GmabY-qQHbZ0fko2JA@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Fri, 28 Mar 2025 17:58:57 +0100
X-Gm-Features: AQ5f1Jo5avP8gathSpZrvGuQ9hpBAo8b9sd-f-ysvgj_1b3jBP--BO4MKJWn5D8
Message-ID: <CANpmjNM_+gkQ2VwykXxu+7DL2ib2-4O-jDnn=+rXQn_e4=BnBA@mail.gmail.com>
Subject: Re: does software KASAN not instrument READ_ONCE() on arm64 with LTO?
To: Jann Horn <jannh@google.com>
Cc: Alexander Potapenko <glider@google.com>, Will Deacon <will@kernel.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	kernel list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_095936_780962_E8D05931 
X-CRM114-Status: GOOD (  28.28  )
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

On Thu, 27 Mar 2025 at 20:10, 'Jann Horn' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Thu, Mar 27, 2025 at 8:29=E2=80=AFAM Alexander Potapenko <glider@googl=
e.com> wrote:
> > On Thu, Mar 27, 2025 at 12:10=E2=80=AFAM Jann Horn <jannh@google.com> w=
rote:
> > > Hi!
> > >
> > > I just realized - arm64 redefines __READ_ONCE() to use inline assembl=
y
> > > instead of a volatile load, and ASAN is designed to not instrument as=
m
> > > statement operands (not even memory operands).
> >
> > Nice catch!
> >
> > > (I think I may have a years-old LLVM patch somewhere that changes
> > > that, but I vaguely recall being told once that that's an intentional
> > > design decision. I might be misremembering that though...)
> >
> > We have some best-effort asm instrumentation in KMSAN (see
> > https://llvm.org/doxygen/MemorySanitizer_8cpp_source.html#l04968) and
> > could potentially do something similar for KASAN, but if I remember
> > correctly there were some corner cases with unknown argument sizes and
> > with percpu instrumentation (at least on x86 percpu accesses receive
> > an offset of the variable in .data..percpu, not the actual address).
>
> Ah, I see. Annoying that memory operands are used for that...
>
> > > So because __READ_ONCE() does not call anything like
> > > instrument_read(), I think instrumentation-based KASAN in LTO arm64
> > > builds probably doesn't cover READ_ONCE() accesses?
> > >
> > > A quick test seems to confirm this: https://godbolt.org/z/8oYfaExYf
> >
> > So should it be enough to call instrument_read()?
>
> Sort of, I think; but I'm not sure whether instrument_read() is
> available in this header or whether that would create an include
> dependency loop because READ_ONCE is so fundamental
> (linux/instrumented.h depends on linux/compiler.h, which pulls in
> asm/rwonce.h). So instrument_read() might maybe need to be open-coded
> if we want to use it here? IDK...
>
> And also I think this would probably cause ASAN false-positives in
> __read_once_word_nocheck(), because I think disabling ASAN
> instrumentation per-function with __no_sanitize_or_inline probably
> does not disable explicit instrumentation through instrument_read()?

Correct, the attribute doesn't kill explicit instrumentation.

Easiest way to "fix" this is to disable the promotion to acquire by
arm64 when built with a *compiler-based* (i.e. not KASAN_HWTAGS)
sanitizer + LTO. This promotion was only made because of fear of
overaggressive compiler optimizations with LTO. If there's a bug due
to the compiler breaking dependency ordering [1], it'd actually be
very nice to see a sanitizer splat, but I doubt we'd ever be so lucky.

[1] https://lpc.events/event/16/contributions/1174/attachments/1108/2121/St=
atus%20Report%20-%20Broken%20Dependency%20Orderings%20in%20the%20Linux%20Ke=
rnel.pdf

