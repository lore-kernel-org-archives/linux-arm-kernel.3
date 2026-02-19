Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26788E9A05A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6J64nrxbONTCCmeNdQEVG1FOv3pNfoDRs5IqMpfOIM=; b=fg0/Nh/3s+XH55XOKfT/tHo6bl
	DWbnbY7nQj9ezTOl1Sgt+vABGOU8KjohxyJ3Ia48XnYE5E7lWEakjVSLh5h3kBVdQNibnSUY4s5Bd
	xElisEOjFLqfqKoPh5pzc0MVVLKMUQyxQWzWM8h3vwQPmGEH2mflOVr35o++MgURTByIjVMP66YHB
	DCsEJSN58q92kKQb1c6JH7QSnqy/Q+hlAHOgV+wQxP8vUs6ZmXUXt/AGGxuDoTY3pzKWq1KzB25+H
	UtVqMY0l1tLa/tNmwAZFNnm6GdTye+/6pBh4gKoYM/wrKlnQPOOxw91O9pUk2i8XvKyMJUE1kMa0n
	/AYwMR2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8tF-0000000Bn5S-0kA6;
	Thu, 19 Feb 2026 18:36:41 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8tA-0000000Bn4r-2Hym
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 18:36:39 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-65a26c220b6so1596114a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 10:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771526194; x=1772130994; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r6J64nrxbONTCCmeNdQEVG1FOv3pNfoDRs5IqMpfOIM=;
        b=EoWM0hGea4B3mAhtBllNcxrU7cx9IRLTWl6txQqembbmv576wIC8KIL/EwAo0ARHf6
         TEHK7Hu2H5YfLqmIXNCv9vETev+0Mvd95ROVIg9ztad2wGulLJB6YKphOGoaWKLHm1uW
         9MTQzQoAKaixalj75vlNq+nRZNcGNWIv1St24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771526194; x=1772130994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6J64nrxbONTCCmeNdQEVG1FOv3pNfoDRs5IqMpfOIM=;
        b=AhAJbD4+5sVR9OwTPikEtNwoFcNcg+kjjlheKaaba8fCxRyGFajSgUeKjHCoB+bqYK
         ErxjFUkuBqP4PY+Bcz4gN4YcETwQGHMNwqNF/kkjfj67fyifei7jQ2nJXugsLKdcV082
         ndkk0yXwvedbC7MoAqlJIJg3x8NBux7qRxbqNY2/4foZz0B6kkZ/GI1wT4A5Z5aaIrMW
         tXgmTN/Qvo6ZvKPJJ3jVgqkvGJejYxAq6CvOWBX8gkjB+jCbI9kxDkbXXYIOgO7zSJif
         s4+gLmdj19Zj9B5SJPNURB7SdZxFZDuRtl7ZegvMeRwUBfqFcIf1uyt7FmSxDp6Ai9Bf
         KJng==
X-Forwarded-Encrypted: i=1; AJvYcCUfEe7ejXq/1/AHhM+iYKlb1t9rkMocXpQqEbLAZOYgoiKDXRfPOtT/UI8rtOO0f2na2tmQ6ixjNC42tjNLXgFf@lists.infradead.org
X-Gm-Message-State: AOJu0Yybqos8n4P0NlKOwe2quTyqbUWMCP0DfAIn6ZqyqEv1YZGUkw+p
	TteGuVlXmmDVlXfkMbWXRE6hTCtv/zzM4pJXjFbE3j1pnyejitMb+1LQAgJAtuoxdOAjKRlXZVz
	Tqpikjr6zwsb9
X-Gm-Gg: AZuq6aJLKN4GKj7P4WvL61D4GlDibeqvDFOoD4rWn0wGuP4YXul757NqcuTPFw4wkyR
	PNq3l901RGTBkSyVigIjLp8KYCBmgW7FRHbuulPA4yDCw9ZTpROtWE+MSex8C1TZnzkb0hq71Nj
	Ug5XwPqrH8PMLq+uHb+hrjmbAvMSdLT5RXfbXJpgFTC+iONXHt8M2pfe4siVdO84sJUIUrAYa+Y
	tY7I88+coRnBB/TuFUgqftyHN5mLbaGB8d9EPpcmJbWEqb/No9meQTAj/01/F4INq8BNj9ZuweR
	gWCUZO8yvfWzvlnR7hbBRxNDBJl6TulsbjyKB1gAgNs32tIw5Az98X109jxvGxS3bx1SKQNBPZg
	kzHtsHxZbBtDFSQuib94rbSL9sF70IJHpU7L4HErCwM4aoLi54BR4JRznugg6Ir7vGYWwf2tDQH
	HelQvQP87Wesuap0dWWxw6uRtAlHbFgr9t6V2JaXkGD3sFuxJLVedy2Juwdz+ixDgQ56n735il
X-Received: by 2002:a17:907:26c8:b0:b8f:9748:be75 with SMTP id a640c23a62f3a-b903dccb99cmr489495966b.58.1771526194285;
        Thu, 19 Feb 2026 10:36:34 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e3538sm4239710a12.20.2026.02.19.10.36.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 10:36:33 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8d7f22d405so195232366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 10:36:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVS4sWvq43wYwE+ix+cICWNxIzBxuNgLu+AD1B4+/lSMAUju/+IqoiVKoivHcfudg54NsV/6zTKeVedNr+vmEAf@lists.infradead.org
X-Received: by 2002:a17:907:6ea7:b0:b88:716a:e4ae with SMTP id
 a640c23a62f3a-b903dcd017fmr367534466b.61.1771526192836; Thu, 19 Feb 2026
 10:36:32 -0800 (PST)
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck> <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
 <aYNUmEfDzq7lTFFr@willie-the-truck> <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
 <20260206182650.6c21b0ff@pumpkin> <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin> <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
 <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
 <20260216110915.4f0d5490@pumpkin> <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
 <20260216174324.75d47e37@pumpkin> <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
 <CAHk-=whFGxN0nUffzCsR_NZnQ5TTu+8QFGSfca1j42kDK1a1tw@mail.gmail.com> <DGJ1H1TJVYBF.PA8G6HMJ0V6W@garyguo.net>
In-Reply-To: <DGJ1H1TJVYBF.PA8G6HMJ0V6W@garyguo.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Feb 2026 10:36:16 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi7W4oeKP-1T-jhJSuVETtsNWxXCxczaepiPM8cy_Cm0Q@mail.gmail.com>
X-Gm-Features: AaiRm53E-2ixouS_a13WNQ7MnkuMrpdZYTKGOBvavd2yyU4R5GBexVg9Sn5kI5c
Message-ID: <CAHk-=wi7W4oeKP-1T-jhJSuVETtsNWxXCxczaepiPM8cy_Cm0Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: Gary Guo <gary@garyguo.net>
Cc: David Laight <david.laight.linux@gmail.com>, Marco Elver <elver@google.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_103636_664299_C4ED617C 
X-CRM114-Status: GOOD (  18.24  )
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

On Thu, 19 Feb 2026 at 07:21, Gary Guo <gary@garyguo.net> wrote:
>
> However there is some limited optimizations being done to fences, at least I
> know in LLVM multiple fences do get merged.

I don't think we have any real use for that, in that we typically have
no real need for combining fences.

Yes, we have hacks for "I did an atomic op, so now I'm using a special
fence that turns into a nop on x86 because the atomic already acted as
a fence" (ie "smp_mb__after_atomic()" etc). So we have some pain
points, but it's pain points we've dealt with.

Having the compiler reliably deal with that would have been great - 25
years ago.

But we have the code, and we have to use our own architecture-specific
atomics anyway because the compiler built-ins aren't reliable or good
enough.

The thing is, inline asm is *reliable*. It's reliable exactly because
it isn't a thousand different cases that the compiler has to get
right. It's *one* case - admittedly a complicated one - that the
compiler has to get right, but then you can do pretty much anything.

And having seen the process - and read the language - of the C memory
ordering standard, I do not believe anybody can ever understand that
thing. Memory ordering is very subtle and hard to understand even when
well documented. The C standard documentation for it is definitely not
helping.

I'm not surprised that compilers don't do better at atomics, because
if I was a compiler writer, I'd have long since given up trying to
figure out the meaning of the standards language and just gone "yeah,
it's an atomic, I won't do anything fancy".

(Which is obviously exactly what happens to volatile too, but at least
there you can *understand* the rules, at least unless you got confused
by the C++ horrors, at which point you throw your hands up again).

             Linus

