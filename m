Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3B7EE6B49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 18:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTrA9q7gvwCe8UT0/NDBaJmIUo6Fhril3QJx2wP9roI=; b=T63ZnkTolQ6+e+PfOgnUMxEssU
	hebA/CDUyen7aEjxXhDHLdgTUuNwtnoTH+8JxhnioCnaIZp+HbiDvb+qSyEkBUOex+UXLMlxGRLsD
	i47mGtiN3e0aTT7Op9gN/OryNMHURwkqeqo70vfMjiXeQK6zOtbnqunm83ktc3jdNgl1ggjPjG9R3
	uxnb30TxEeyVySEPbKPAH/AxQdIA/5EqGWCMU0VikNWbPlh/cdlgcjjvaS08j6hbHdwhmIiPx4b4R
	LGHSHudasYpKQr8fTUyyZ8A2N+tAlekKwyGm2gatDeMn4S/0W6ilmeYJOQECsJgRi5rxTC6d5MBjh
	ab5inK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQXi-0000000BgfW-0exc;
	Fri, 06 Feb 2026 18:26:58 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQXf-0000000Bgez-3P5i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 18:26:57 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-436317c80f7so147387f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 10:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770402413; x=1771007213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTrA9q7gvwCe8UT0/NDBaJmIUo6Fhril3QJx2wP9roI=;
        b=Gbnv+L7d9uiuLUwHRLL2dcJDgUUPEoaOuyb67tK8wp2vQ6p9SQdV0djEZ9FNhkHHzP
         mZaAS48TE4lsNCUJTaD8Ve7TCSNhht17fZ1YOXqvJTfI4hUuxR51SEoDNk2p6gp+hwf1
         Cx0Mq9gHs+Hs2nsZl76hSagnzwglt480HG7jMkKRirSfITYNrMPmXTTJbSBLdh+qrzSb
         mcvkoqLTbYLPfPUQZOZw/rxOpzHBUtOPuwNA0e7gtlq5WCcAXRJSlZNQ4s4aRtgNZQNa
         Jgz7IopArhxeZ8Z0qskwMKTiVsngu0bYzl2fG+IZJ8Z9O0C0BHY9hGQtBz0vmRzeUfaT
         DHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770402413; x=1771007213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pTrA9q7gvwCe8UT0/NDBaJmIUo6Fhril3QJx2wP9roI=;
        b=f6G25AJi1gtqMfq/lLer5AOAzu0H2kCnpInp9ULS8ecjAWcDJKNaL+k8Bb+Z48++2K
         BCr+53ZKsX4uLS4Jks9chp32dIB2ThsOddSD7RzUpCe0kKy8fYA6kEJdaoA3uEIFBPm3
         0nivG1P1AMQIX9gkB/5zu70EeHogvyNRWW6rs8yEH1HGXZgn12RWigw/YijLhc8hhwEh
         kNoZadprM/1dbBwZ3WaySomzleD1kn0UDCtMt96/HqZXXnOHhDUAiVE5/ZWG9wMoIrKJ
         dAFP6qYqAfuZMxw5XWV0QeMsJhhY5EhRu4yZBAUzzZ8jaxaCI/xiO2S7KDyL/86T4JhL
         ygfw==
X-Forwarded-Encrypted: i=1; AJvYcCWeMISHG3ywN1ZbLLspVqM+cvrusxSbu0CXtjYzhsYy0qf6vfjNZJlVPPtXw0B4pn+HhasB0Ip4/1X7NnuGUQqv@lists.infradead.org
X-Gm-Message-State: AOJu0YyxJafWYdwZtWuEndYA5TZKp1dMTd5gHcdb5YvkZLQ5Z+OuFy5q
	lrUgFLwkf36cs9OzIiF7IBCQPurQw4gEnVxzvoCd+O9nwdJKxy0KqpOK
X-Gm-Gg: AZuq6aK5/Q79LZXroF9uiH/AIkxLazsbQMeMarBW9/hapQTJUwWlnAS8j9OtRfMHKzi
	RS8uXH9tfn2j8GEM9Szb8z4k6TlmRbJWuk+A2WEr1YxXfbB05GmskgGhS6RcEVNhmJFpGtgu3zC
	CyA322E2Fm3iV22e1AcvVLwP1JOnxHzNgHupONJpHDtxsoQO0xSfc+zAZCoVzgP9mgnjAsbiZv5
	mXI++Dk3fqsMatwtCpa+KgugbKI7iuP0R389TluLlBBmGQJ0XyGTE+p3JCvk+NyJd35NsXDkTqy
	RAlA/bcLZkQIwmQlb3XcAy6xHfWOj2u03DJlc7wAhI5YqrUBT12fA8+7RM5rjZNV3hY5jYZDPj5
	zdRpvPniY3HoIV9IpEux3CiS0rlRn5L9SdA3NiZKxDWZO3vOeq1KvLOv/wH8gGgu5EzCQSJm32n
	z+an1cVi0l0RkXTpSVsEjjhmPo3EIkXPrhm+NItPP3uzqIq/a0Iywb
X-Received: by 2002:a05:6000:184e:b0:430:2773:84d6 with SMTP id ffacd0b85a97d-43629344cb3mr6228340f8f.24.1770402413004;
        Fri, 06 Feb 2026 10:26:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b20fasm8131876f8f.6.2026.02.06.10.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:26:52 -0800 (PST)
Date: Fri, 6 Feb 2026 18:26:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260206182650.6c21b0ff@pumpkin>
In-Reply-To: <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-4-elver@google.com>
	<aYDFOIskB20CbztD@willie-the-truck>
	<20260202192923.0707e463@pumpkin>
	<aYHgNSF5a3F7UGU_@willie-the-truck>
	<CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
	<20260204131400.GI2995752@noisy.programming.kicks-ass.net>
	<aYNUmEfDzq7lTFFr@willie-the-truck>
	<CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_102655_907077_FD4B3602 
X-CRM114-Status: GOOD (  42.09  )
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

On Fri, 6 Feb 2026 16:09:35 +0100
Marco Elver <elver@google.com> wrote:

>  On Wed, 4 Feb 2026 at 15:15, Will Deacon <will@kernel.org> wrote:
> >
> > On Wed, Feb 04, 2026 at 02:14:00PM +0100, Peter Zijlstra wrote:  
> > > On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:  
> > > > On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> > > > [...]  
> > > > > > > What does GCC do with this? :/  
> > > > > >
> > > > > > GCC currently doesn't see it, LTO is clang only.  
> > > > >
> > > > > LTO is just one way that a compiler could end up breaking dependency
> > > > > chains, so I really want to maintain the option to enable this path for
> > > > > GCC in case we run into problems caused by other optimisations in future.  
> > > >
> > > > It will work for GCC, but only from GCC 11. Before that __auto_type
> > > > does not drop qualifiers:
> > > > https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> > > >
> > > > So to summarize, all supported Clang versions deal with __auto_type
> > > > correctly for the fallback; GCC from version 11 does (kernel currently
> > > > supports GCC 8 and above). From GCC 14 and Clang 19 we have
> > > > __typeof_unqual__.
> > > >
> > > > I really don't see another way forward; there's no other good way to
> > > > solve this issue. I would advise against pessimizing new compilers and
> > > > features because maybe one day we might still want to enable this
> > > > version of READ_ONCE() for GCC 8-10.
> > > >
> > > > Should we one day choose to enable this READ_ONCE() version for GCC,
> > > > we will (a) either have bumped the minimum GCC version to 11+, or (b)
> > > > we can only do so from GCC 11. At this point GCC 11 was released 5
> > > > years ago!  
> > >
> > > There is, from this thread:
> > >
> > >   https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV
> > >
> > > another trick to strip qualifiers:
> > >
> > >   #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> > >
> > > which will work from GCC-8.4 onwards. Arguably, it should be possible to
> > > raise the minimum from 8 to 8.4 (IMO).  
> 
> That looks like an interesting option.
> 
> > That sounds reasonable to me but I'm not usually the one to push back
> > on raising the minimum compiler version!
> >  
> > > But yes; in general I think it is fine to have 'old' compilers generate
> > > suboptimal code.  
> >
> > I'm absolutely fine with the codegen being terrible for ancient
> > toolchains as long as it's correct.  
> 
> From that discussion a month ago and this one, it seems we need
> something to fix __unqual_scalar_typeof().
> 
> What's the way forward?
> 
> 1. Bump minimum GCC version to 8.4. Replace __unqual_scalar_typeof()
> for old compilers with the better unqual_non_array hack?
> 
> 2. Leave __unqual_scalar_typeof() as-is. The patch "compiler: Use
> __typeof_unqual__() for __unqual_scalar_typeof()" will fix the codegen
> issues for new compilers. Doesn't fix not dropping 'const' for old
> compilers for non-scalar types, and requires localized workarounds
> (like this patch here).
> 
> Either way we need a fix for this arm64 LTO version to fix the
> context-analysis "see through" the inline asm (how this patch series
> started).
> 
> Option #1 needs a lot more due-diligence and testing that it all works
> for all compilers and configs (opening Pandora's Box :-)). For option
> #2 we just need these patches here to at least fix the acute issue
> with this arm64 LTO version.

Option 3.

Look are where/why they are used and change the code to do it differently.
Don't forget the similar __unsigned_scalar_typeof() in bitfield.h.
(I posted a patch that nuked that one not long ago - used sizeof instead.)

The one in minmax_array (in minmax.h) is particularly pointless.
The value 'suffers' integer promotion as soon as it is used, nothing
wrong with 'auto _x = x + 0' there.
That will work elsewhere.

	David



