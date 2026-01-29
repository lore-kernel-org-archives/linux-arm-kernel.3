Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67145D358F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqrjSrhQ16zu5YN2qHtHKezDN8iCLmAO7xkrZmYMFLg=; b=xS4hC21eq1j/o/A3yJB8X4vXke
	veGFcA2FoH5RL+h0Uwxt2iuZo9Mag6IC+2S75URlSZ0eLk+2lRmp7zFmHriVBAff7/MqrXhwu86Mb
	nxl/Bj8Zp4DeT1oQwTsvFxIzGLciMqgWenB06sEoygqyogE4MDMIFE41ptzTIoTIfeMm8AbwDDur0
	4WbIp0u+vkBTRxcsRIRi6a8bKPwnivXkB1h1fDqIAGkUApc1cKYy96CGzK/Q3jjcQkygF2cf6UWDM
	DHnKsuNLvYSatrdmT6/R1HyCBrYzX+P2/AEz6yrK809vQ96nuDO/lDF/YE4cO2mSt6mljAuA2bngR
	XgmVNKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlPQe-0000000Hatp-2lWY;
	Thu, 29 Jan 2026 10:39:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlPQc-0000000HatS-0S3b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 10:39:11 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42fbc305882so590285f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 02:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769683148; x=1770287948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqrjSrhQ16zu5YN2qHtHKezDN8iCLmAO7xkrZmYMFLg=;
        b=kvkMmHC9f4+vT9iP6NyOpg9Eupfgf6F6sUz7YvBmmS4r/+968L71mjdS/K/2sgAru/
         A06HfzLydJZwTHVKHHzC5cKsEEpZuqKVKL9aFTasI8v4R9MV4V56egU5e3dkI1iC8Y52
         +wp6k1olUNAVA08faohWmAf7NT+6pZK9JHB2Pl+mkyp7S9DAsYOtTXbPPcCpo0aTG33w
         dD1w3tm42ceiMOhujQqa+RvROYrfNUxlRS6uGrfWN85c/VbNHRQiNEWtK/MK+jGi+Gfs
         DbeoiZBJ++uMmUBbTPRNbS1VAHoL+JcPMUwxwzkZRT3ryT3a7GYKMsi7YcMAcJ/9nC6h
         7G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769683148; x=1770287948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqrjSrhQ16zu5YN2qHtHKezDN8iCLmAO7xkrZmYMFLg=;
        b=PcN3xH4Dl8M4+8h577Z+1chBZZT0523rR56AXwPiTmBc6Fz4uJvh7P1vyG5P41GMSa
         oyoyZ3jAV6DY2RkbRuvGYBnfG6k8Iz46wK7Tc8eScLLLgzhiSZTyBQ9vd+9XNtlBUMGF
         HTU3XPsERn8aFglNx5c5Lu1ZnnYC8cuEggFLsHYvz2A37uxCYrzA2YIL3lqzZLN/2lcd
         e3bskVwRMu79mQwZNmpaxu3I7sOvFf9DFFtAj2DQYVVkLYj94TLX0BFwvFox3Cc1pG9O
         Hah5CPOe5V20FwPusv7u7E0f72QFd74E+zNfL5eR2KY6Wiix+8XktKMfseEeFGc7KzjC
         45Yg==
X-Forwarded-Encrypted: i=1; AJvYcCW0X4IENH1AHRqRuMwNJ/ENB30OeKEpYtg9mRSc2LIJQrqiicOn3NZu9mHTEXUZlsdg31GgNRJ3vhe9n83Gk6GA@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrz6FFnU7VeaBuhWTAM116jQD82kLjdZyGAikalMSsSHlnP7FE
	bQELQqReAdOz9EW+oJ4BBJmMFIEr1VLpweYLuRbmueAtEKY1L0gMDFZa
X-Gm-Gg: AZuq6aLW1WoLfV3oEVKSssT/hVybnyRfp66vxL/dVN9Stqhf1htbCXNlW6fJRkiC+Zi
	3cxl0astE1PMOa0awIAbKfSnn9Yl0iXE2rvDc4xpfC/LUuRFdztaBe+CN2B2WPyr0eqHd7G21vx
	vGiohgHt30v2ZVz5qXXjJT2gFDFdlsoLOOeN2P3GI2hNSjGM5OlpGMnY50wB+CoHXnE9qHEhavJ
	m3Zcq2sM1IvU9peoU9I6qCADehB8dDMFHwojPm/LZbytB4TiTTEBQISTzDmD0Rcb6DZZrWJPsvP
	I1qvNw9+XUeL1fHmzLvqleoBNdmi7ltSYTOR+g4mKGpH0UktoQtxn6ZkHmhQQor8E87qRTTw3ZJ
	q1HM9zSW/vWIPDyHpx5HIT3zDNleiI6+UoRjnVFD4mqJ4o43n960sZBFHGplo3fcCR39/4Tk0w8
	TspirBjXcfCKrvxijX9w4Mo471vXNoLO/JQ/3FJZLLcggkglLov/Sw
X-Received: by 2002:a05:6000:1b0b:b0:435:e436:7fb with SMTP id ffacd0b85a97d-435e4360896mr5882981f8f.50.1769683147650;
        Thu, 29 Jan 2026 02:39:07 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1048a54sm12773016f8f.0.2026.01.29.02.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:39:07 -0800 (PST)
Date: Thu, 29 Jan 2026 10:39:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260129103905.5b04ba90@pumpkin>
In-Reply-To: <CANpmjNPL662LMLw9o-fqQCBkhD=oG-UTHSQb8XeXtXduhh1dQQ@mail.gmail.com>
References: <20260129005645.747680-1-elver@google.com>
	<20260129005645.747680-3-elver@google.com>
	<20260129100332.500248d3@pumpkin>
	<CANpmjNPL662LMLw9o-fqQCBkhD=oG-UTHSQb8XeXtXduhh1dQQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_023910_181703_EF86FF98 
X-CRM114-Status: GOOD (  38.03  )
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

On Thu, 29 Jan 2026 11:12:49 +0100
Marco Elver <elver@google.com> wrote:

> On Thu, 29 Jan 2026 at 11:03, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > On Thu, 29 Jan 2026 01:52:33 +0100
> > Marco Elver <elver@google.com> wrote:
> >  
> > > Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
> > >
> > > 1. Replace _Generic-based __unqual_scalar_typeof() with more complete
> > >    __rwonce_typeof_unqual(). This strips qualifiers from all types, not
> > >    just integer types, which is required to be able to assign (must be
> > >    non-const) to __u.__val in the non-atomic case (required for #2).
> > >
> > > Once our minimum compiler versions are bumped, this just becomes
> > > TYPEOF_UNQUAL() (or typeof_unqual() should we decide to adopt C23
> > > naming).  Sadly the fallback version of __rwonce_typeof_unqual() cannot
> > > be used as a general TYPEOF_UNQUAL() fallback (see code comments).
> > >
> > > One subtle point here is that non-integer types of __val could be const
> > > or volatile within the union with the old __unqual_scalar_typeof(), if
> > > the passed variable is const or volatile. This would then result in a
> > > forced load from the stack if __u.__val is volatile; in the case of
> > > const, it does look odd if the underlying storage changes, but the
> > > compiler is told said member is "const" -- it smells like UB.
> > >
> > > 2. Eliminate the atomic flag and ternary conditional expression. Move
> > >    the fallback volatile load into the default case of the switch,
> > >    ensuring __u is unconditionally initialized across all paths.
> > >    The statement expression now unconditionally returns __u.__val.
> > >  
> > ...  
> > > Signed-off-by: Marco Elver <elver@google.com>
> > > ---
> > > v2:
> > > * Add __rwonce_typeof_unqual() as fallback for old compilers.
> > > ---
> > >  arch/arm64/include/asm/rwonce.h | 24 ++++++++++++++++++++----
> > >  1 file changed, 20 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > > index fc0fb42b0b64..712de3238f9a 100644
> > > --- a/arch/arm64/include/asm/rwonce.h
> > > +++ b/arch/arm64/include/asm/rwonce.h
> > > @@ -19,6 +19,23 @@
> > >               "ldapr" #sfx "\t" #regs,                                \
> > >       ARM64_HAS_LDAPR)
> > >
> > > +#ifdef USE_TYPEOF_UNQUAL
> > > +#define __rwonce_typeof_unqual(x) TYPEOF_UNQUAL(x)
> > > +#else
> > > +/*
> > > + * Fallback for older compilers to infer an unqualified type.
> > > + *
> > > + * Uses the fact that auto is supposed to drop qualifiers. Unlike  
> >
> > Maybe:
> >         In all versions of clang 'auto' correctly drops qualifiers.
> > A reminder in here that this is clang only might also clarify things.  
> 
> Will add.
> 
> > > + * typeof_unqual(), the type must be complete (defines an unevaluated local
> > > + * variable); this must trivially hold because __READ_ONCE() returns a value.  
> >
> > Not sure that is needed.  
> 
> Trying to warn against someone copy-pasting this as a TYPEOF_UNQUAL
> fallback implementation. typeof() and typeof_unqual() do happily take
> incomplete struct declarations. E.g. this works:
> 
> struct foo;
> ...
> struct foo *f;
> typeof_unqual(*f) *x = f;
> 
> Whereas with the __rwonce_typeof_unqual() fallback this doesn't work.
> I can try to make it clearer.

It fails to compile - they'll find out soon enough :-)
gcc < 11 and the array/pointer decay are probably more relevant.
Could catch out the unwary.

	David

> 
> > > + *
> > > + * Another caveat is that because of array-to-pointer decay, an array is
> > > + * inferred as a pointer type; this is fine for __READ_ONCE usage, but is
> > > + * unsuitable as a general fallback implementation for TYPEOF_UNQUAL.  
> >
> > gcc < 11.0 stops it being used elsewhere.
> > Something shorter?
> >         The array-to-pointer decay doesn't matter here.  
> 
> Ack.
> 
> Thanks!


