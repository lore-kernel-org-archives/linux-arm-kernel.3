Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C780CE909D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 16:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VVVA27vXMecotvakD3mWfyoVh5TXj3m2nUAse+m5/Y=; b=2+ASbvSRftFGyqBiluCKfsqt41
	YhPbXQ62pbgUftGYtYVVYcHYhYu2v5LmS1rAZF2nSQDQcPZxV8mSSnPZcRAEFHTXE3YOFV8rHSJng
	dDt8bx+8vsaJ3JdzOEC2qUs/H1L/yUL/Aw9BgOinuQHni6NTcqepr2kNeXra3GG41dCgD+yBtfauj
	LhBYxJ2UVynvmp6hV3RPQof8rCEsqCf1caUr9UbZgNvbIfNCKy8LBWm5VMKIpt49V/4bU4wq0D5+q
	Dpt4q4QPv02+oOGHp+ZiMWOSkB5ighsGRKF40kkyoAfrjK2MfGE2QPB3Uo7S9B/M3R2bGyG8YPKkF
	STtCNl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNrn-00000008Z9c-31b8;
	Tue, 17 Feb 2026 16:24:03 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNrg-00000008Z8g-1Inh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 16:23:59 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso1441173a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 08:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771345433; x=1771950233; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8VVVA27vXMecotvakD3mWfyoVh5TXj3m2nUAse+m5/Y=;
        b=beZtuieUjJfoE4iOHat6JzdEHd2oyJ+5utt5hzTIHJGwZErZstzipx9r0wbdH6tJ76
         J6L8Skol8CKOtR+cO1lgvamquwDeSC3Guo2DU/72G2z9P2tF6PRZjWpien6y9gkbmhkP
         cYvl6VmrwVOy3DTEgqmlA//QtIOLQZ52Q/zQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345433; x=1771950233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VVVA27vXMecotvakD3mWfyoVh5TXj3m2nUAse+m5/Y=;
        b=VVumdgaQxZvmULX6plfNIrhXiQrmcZHdD+Qx2qHWSW2pOX/RlMEPL5a+zpAYUPKaq7
         Jj+9VFRUsDAHa2z8FR5Qg1F4fSzwj4qrkojzxwzbJems+ChzRCv2Y+E73OWrjB+/Pgt+
         hG/c2+dvfKNb3+2IUQWzQcpyD5c9OaPlb3/p/dopipQGA+b6k7uqwLfRoLanmArhhM8S
         eQMPXRTiM1gieXFAmjMgFB7Wo9M0Ktux2Mao6WnGAPoZI+C3FyGgRMhnO/D8h6mH9vvv
         IqzYMHDIKQh254Z/Fn65UfU7JvpjzjX7cGn3frVy6k3FLiCNtpLLFNWC3nBxo5kqvxCJ
         vMZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGeqQRGAj2yuneFEkf+VjX88lnM92VE3PfZjvYAP8LWiXmp2ZkCMv3fIk0UHUoRSnrEaE0W8abEJ/ARe2O6hrb@lists.infradead.org
X-Gm-Message-State: AOJu0YxnYz8kX+/oeLPoeCH66Ee0uuFJVzu5l4eSvHXHBGMwGnLMcfym
	s+Ccn9311OHUfJI+87FUzNgu3RtaGKYOxjvx4EF78bALNGuqVX4awPY7o0QKo42DUZRA6CrFErf
	rHMwLFjyCdQ==
X-Gm-Gg: AZuq6aL4l9M1VLoQVdSwA5pKKaI/2raBKCLn5IEExzJ+XzGb6USwoMEZHb49EGEsEKw
	kCyNES3TuBTtwL3VO/I3HN4bXNQ+z/zbd4rQeEsQmpBninUccNgbccU8ikI75V5VADRbDZXfrOB
	jdJL39OvZ5y8sig9d1VKqJLR0eCs4p1+O3aA7VpJwpKdOB5oGvJC/9gK6bxug+cry5/IGVm2WGC
	KbLKqAytMKb5sRCw7pP2UTxBs3e+4yW4LWJak897mZFNN8Ff8ESHuGHzp2StT4MhmZ8Y8pCpXZj
	QIg7CqjsP+qjT3lKDroR+XA9gzP+htE6WKbaDx+RqD/0ohETusxNQD+eECMGhHeUJ4Oa14BCcWG
	PEPei/I8yYRJXfrOA8SCdMjpkyLL4mjMYYL24rvq1ubPeMduHYrxnGI403wm5+cyZek0D/qmdUh
	rhajOpXdtmjF2zUZPiuiddv/J76rsuaOrlEjyy/dcMyXziYD8d5oWCzXdeIU2RIHIh8xlTIdv5f
	C4cUwaPK8U=
X-Received: by 2002:a05:6402:5110:b0:64b:5562:c8f4 with SMTP id 4fb4d7f45d1cf-65bb1130008mr7606863a12.7.1771345433232;
        Tue, 17 Feb 2026 08:23:53 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad29d4afsm2411850a12.10.2026.02.17.08.23.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 08:23:51 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65a380b554bso7000425a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 08:23:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXW5guCA9I0emLEswdUuwsP0AdaubxJTOy39jzwHaoaYIdQb65JJLS2xwBvF7VfkeEJURi7Mon6n4F24Op158Mz@lists.infradead.org
X-Received: by 2002:a17:907:988:b0:b8e:d04e:e4fb with SMTP id
 a640c23a62f3a-b8fb44dce24mr825863766b.48.1771345431078; Tue, 17 Feb 2026
 08:23:51 -0800 (PST)
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
 <20260216174324.75d47e37@pumpkin>
In-Reply-To: <20260216174324.75d47e37@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Feb 2026 08:23:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
X-Gm-Features: AaiRm53uZCbuFwEyfKCGb0ntN5PpXfYQtY2WkHebZ_fqBMtvDsyJbw5Zc4B6Gvw
Message-ID: <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_082357_960082_A2B31AE6 
X-CRM114-Status: GOOD (  17.28  )
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

On Mon, 16 Feb 2026 at 09:43, David Laight <david.laight.linux@gmail.com> wrote:
>
> >
> > Try doing something as simple as a "var++" on a volatile, and cry.
>
> On x86 I just see a load, inc, store - not that surprising really.
> (clang did do 'inc memory'.)
>
> It's not as though 'inc memory' is atomic (without a lock prefix).

That's not my point. My point is that it makes for absolutely
disgusting - and pointless - code generation.

That load + inc + store is a sign of the compiler missing truly basic
optimizations because "volatile" is so badly designed.

The thing is, we typically even *want* a single load. We actually want
not only to have basic optimizations that don't even change the
semantics - we typically even want CSE.

So we want basic optimizations and combining loads. The main reason to
use READ_ONCE() is actually a worry about compilers doing even worse
things, namely rematerialization or memory accesses - something that
compilers don't even do, because it's a bad idea, but people still
worry because they are _allowed_ to do it and who knows when something
silly happens.

So I want that READ_ONCE(), not "volatile" on data structures, because
*some* day we can rely on more modern things and compilers will
actually get it right if we do it as

 #define READ_ONCE(ptr) __atomic_load_n(ptr, __ATOMIC_RELAXED)

or similar.

But last time I looked at it - which was admittedly a few years ago -
the compilers we supported didn't actually do anything reasonable here
(ie the built-in atomics were fundamentally worse than the ones we do
by hand, and even basic things like __atomic_load_n() weren't
actually; better than just using 'volatile'.

Maybe that has changed. We've upgraded minimum compilers since.

             Linus

