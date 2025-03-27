Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E1DC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUuFRox/uRP18i3K1c7cQBFPt0r8UQeqKMMt0JvYusg=; b=VhGG7XK+XD5nfaolQIRZjtK3Bl
	/kWpRWB/exD9CjzFlTeW74X9qZhtoKY9864e4u+dvqtkxBJ1COTAYKlAqE/nH2re6M2KmWCOSrG+g
	OhGMCZQGzsZoJVDbFX/Ms5qCwDXqFop2YwGLxuNdsWTBg95bM9EvyE+N+2pmrds23hj1QoQ7Yl/0j
	ZHCHpuuX/XveN9lys08W433Qe2T2mjk0j4T7cKXIdYL9PIzDreLYHbdVtYhZiINRct/6UH9RoDEVg
	HRPX+pn5sygmwQGyt3xv+vVfAT5h/4cN/6bjNkgJSKABVh6bFrvZ7RfEV8potiCekrcfOyagzTeEO
	Wwa+tlfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txseX-0000000Bnrc-2z7w;
	Thu, 27 Mar 2025 19:12:33 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsc5-0000000BnQ7-40qy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:10:03 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e50bae0f5bso2653a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 12:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743102600; x=1743707400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUuFRox/uRP18i3K1c7cQBFPt0r8UQeqKMMt0JvYusg=;
        b=VRk8mi7rTwnjRNPYUVx2RKZxNMwEO/wMnEp1HuDKNhnQO/eeYbm4ZGvN2QgyYIABiv
         bWJlSKul3l9B0WTYY6lTSAubM3lBhk9LA8LvJyM/pmjMGI6Fz0kvNJcwVDxwan61q0pP
         YEk81ABKNCXIqu2NdOTshoaN4mPOX5Jix94Voy8DcrIkIFqlAQ4K3YpVamV9qKZUw8pM
         9Rj+oshYLMYMhJWgEI0b+1KKN+XA4cH0QHrRL+t97e/YENu1TwNIXoS+qSsg2t9e8bhd
         5ixeYmk+Ig7cK79xmFEZUaEgMofqb/93iyxAI9JjU8LuQH5qOKsrrxvZdkjX0bgQL76N
         0k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743102600; x=1743707400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUuFRox/uRP18i3K1c7cQBFPt0r8UQeqKMMt0JvYusg=;
        b=ag9BN63axCzGqJjWT9LqCMg7q8FDRIbEvtzbAcipqRH9NZ1awA147R29geTTB1e0NK
         9AaERLOdBjNOhVFkmjfvUKo9urwJtEv6AmcFBGaBo0I4L00mtwb7MxdjXxVwZHB6Me3M
         FiA/5aXSS1r9TU16fQr/Da6OtJnXndPYJgDbwL9Mi/IF2U/Dl3TOZHzKeVcPfFw3Cbpr
         7oMBYOoDS0991m0NZyIpu/Ut74K5UviqH/DeRXOU9sM250cRVwgDq1FG2sgrU/En8cEI
         ieYOdIhqFHGfrN3fb3DDSzKFg7bVK5JJKKrhgQ3vJFFohgqGuVUBH9OwynabtPWNLF3+
         9GpA==
X-Forwarded-Encrypted: i=1; AJvYcCXwU0ZhSlvE57HA2x6ry2MP9FWTeCHIkhpk+PtE5GkeP2q3G3e2QpzwSPdVP00oQPCgv0ZbSHfzMow67L1R2TBp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2dtKeMbG/lR0XsHzewu2armnbxRw2P963N8EscuO05uMOo4x1
	yrUrciMRoX+YWjNw8CJc3/T+4YiAp17nvnTJGnsPG8xJxpfecf7Eg4BWIn1M0isUJ/T6UOZfR2q
	aBI7LSgSm6VA8+xaO3T2VCsqusIMPbGDHHMma
X-Gm-Gg: ASbGncvbsU3h39ucW+1lbPgi/3oZobXYyOG1gOx1WGvJh6ECjUhe3RNcqoazkhP7WRK
	WHSm5f/StcTH4sPG9/h6QakA3EuGarLHLTb5NGnth3Lwlz/XqsffO5Z/yFZjNfBEt2khEc4VB5T
	pjnMfS0KBGrXFEysZW2saZMZX3IHgcmubTQQM3niAH9G28tmlpVqN7pbp2IWZGHQge
X-Google-Smtp-Source: AGHT+IHOr4ihodjQlvGDZs5ucW33VxA3jHugvRzddGHMknJhFWeOFtCLmC/UGJxIUeYk/Xc0DHxewm+kR73X7bKSWW4=
X-Received: by 2002:a50:d613:0:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5edc31eb882mr9171a12.7.1743102599869; Thu, 27 Mar 2025 12:09:59
 -0700 (PDT)
MIME-Version: 1.0
References: <CAG48ez2jj8KxxYG8-chkkzxiw-CLLK6MoSR6ajfCE6PyYyEZ=A@mail.gmail.com>
 <CAG_fn=UF1JmwMmPJd_CJQSzQAfA_z5fQ1MKaKXDv3N5+s3f6qg@mail.gmail.com>
In-Reply-To: <CAG_fn=UF1JmwMmPJd_CJQSzQAfA_z5fQ1MKaKXDv3N5+s3f6qg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 27 Mar 2025 20:09:23 +0100
X-Gm-Features: AQ5f1Jr5wNbIvQR1MW-T7jQhq0ywmSJ9hxwgEvhc7yrF336jp7xpkEVq02UK2vU
Message-ID: <CAG48ez1w3YO=dwuGqVF3PdHec6=vbYr3GmabY-qQHbZ0fko2JA@mail.gmail.com>
Subject: Re: does software KASAN not instrument READ_ONCE() on arm64 with LTO?
To: Alexander Potapenko <glider@google.com>
Cc: Will Deacon <will@kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, kernel list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_121002_000786_938AF098 
X-CRM114-Status: GOOD (  20.69  )
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

On Thu, Mar 27, 2025 at 8:29=E2=80=AFAM Alexander Potapenko <glider@google.=
com> wrote:
> On Thu, Mar 27, 2025 at 12:10=E2=80=AFAM Jann Horn <jannh@google.com> wro=
te:
> > Hi!
> >
> > I just realized - arm64 redefines __READ_ONCE() to use inline assembly
> > instead of a volatile load, and ASAN is designed to not instrument asm
> > statement operands (not even memory operands).
>
> Nice catch!
>
> > (I think I may have a years-old LLVM patch somewhere that changes
> > that, but I vaguely recall being told once that that's an intentional
> > design decision. I might be misremembering that though...)
>
> We have some best-effort asm instrumentation in KMSAN (see
> https://llvm.org/doxygen/MemorySanitizer_8cpp_source.html#l04968) and
> could potentially do something similar for KASAN, but if I remember
> correctly there were some corner cases with unknown argument sizes and
> with percpu instrumentation (at least on x86 percpu accesses receive
> an offset of the variable in .data..percpu, not the actual address).

Ah, I see. Annoying that memory operands are used for that...

> > So because __READ_ONCE() does not call anything like
> > instrument_read(), I think instrumentation-based KASAN in LTO arm64
> > builds probably doesn't cover READ_ONCE() accesses?
> >
> > A quick test seems to confirm this: https://godbolt.org/z/8oYfaExYf
>
> So should it be enough to call instrument_read()?

Sort of, I think; but I'm not sure whether instrument_read() is
available in this header or whether that would create an include
dependency loop because READ_ONCE is so fundamental
(linux/instrumented.h depends on linux/compiler.h, which pulls in
asm/rwonce.h). So instrument_read() might maybe need to be open-coded
if we want to use it here? IDK...

And also I think this would probably cause ASAN false-positives in
__read_once_word_nocheck(), because I think disabling ASAN
instrumentation per-function with __no_sanitize_or_inline probably
does not disable explicit instrumentation through instrument_read()?

