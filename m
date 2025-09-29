Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38462CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZxsy4ehieQIjfLWTzJ+0WnOyHLVTM4StVaGaTf2H2M=; b=Mh28Vh4aRlETfklyae8evYe5tf
	zM3JLo9mGFPeNBAtV+GNGe1DvkuWEwvZESvm/T3gadWwoUt4XIm+I9G7WBvTKb6KXSD9xLTlkL+Ei
	1wcjWBLbksDw+zVwjdOjTT4NW91myHSJEr27iytm4dGPx0wcxoGjy9phnkt9bCRLhqEG2ILCP8pUR
	6PDStRMWeU71qwUYH0Uo25S/zYb3GannrRvoNKsoB5eEcAfseNnfL+Q617wCC0vgxS3/ZQBf+goGr
	+TCd//A9taWLPOvhNOa+H6f69YqdMENCi0Sg3yF+4CYhYM/KpdNk9FklIGjZkn2uTwOj03Z1OO2Sd
	gWsu0IDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Bfq-00000002HMB-14tn;
	Mon, 29 Sep 2025 11:04:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Bfp-00000002HLn-1Y7g
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 29 Sep 2025 11:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kZxsy4ehieQIjfLWTzJ+0WnOyHLVTM4StVaGaTf2H2M=; b=RO7GZ0ifeCyolkGY1Y7ATx6sss
	e//DjYdx0nRYSUIreaoUR++VLt+tyLZ1Eb/Hxlu4pY1uiwp8PPy6P8Koex0e43ru9hP/6zV2+ku/O
	8qVYKgQyCOXxjTSHhKVW5yDFQ+fmxIZaIeAKdp6MOyNkL17jgP9wO0lbGXgBm5ZohhpN1NeYbTnTU
	tB0u/XlKTRloBeLGuHUNINGnoMIDrPUaql9LQfDaNK8baXt5fxfVJ3HhoE12p+ELHvx/7vupEtwL8
	DWhI/M5s9ZguDkUvDKrxaXoc9Is7GsJFlY0ELM9nt/OLIY7nrGA9ubRFiBDcMx6mzU+toyK/faqbg
	gTdUlCsQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Bfk-0000000C4Ix-3xC7;
	Mon, 29 Sep 2025 11:04:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 10F5830039F; Mon, 29 Sep 2025 13:04:00 +0200 (CEST)
Date: Mon, 29 Sep 2025 13:04:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	x86@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V2a 2/6] kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang
 < version 17
Message-ID: <20250929110400.GL3419281@noisy.programming.kicks-ass.net>
References: <20250916163004.674341701@linutronix.de>
 <20250916163252.100835216@linutronix.de>
 <20250916184440.GA1245207@ax162>
 <87ikhi9lhg.ffs@tglx>
 <87frcm9kvv.ffs@tglx>
 <CAMuHMdVvAQbN8g7TJyK2MCLusGPwDbzrQJHw8uxDhOvjAh7_Pw@mail.gmail.com>
 <20250929100852.GD3245006@noisy.programming.kicks-ass.net>
 <CAMuHMdW_5QOw69Uyrrw=4BPM3DffG2=k5BAE4Xr=gfei7vV=+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW_5QOw69Uyrrw=4BPM3DffG2=k5BAE4Xr=gfei7vV=+g@mail.gmail.com>
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

On Mon, Sep 29, 2025 at 12:58:14PM +0200, Geert Uytterhoeven wrote:
> On Mon, 29 Sept 2025 at 12:09, Peter Zijlstra <peterz@infradead.org> wrote:
> > On Mon, Sep 29, 2025 at 11:38:17AM +0200, Geert Uytterhoeven wrote:
> >
> > > > +       # Detect buggy clang, fixed in clang-17
> > > > +       depends on $(success,echo 'void b(void **);void* c();int f(void){{asm goto("jmp %l0"::::l0);return 0;l0:return 1;}void *x __attribute__((cleanup(b))) = c();{asm goto("jmp %l0"::::l1);return 2;l1:return 1;}}' | $(CC) -x c - -c -o /dev/null)
> > >
> > > This is supposed to affect only clang builds, right?  I am using
> > > gcc version 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04) to build for
> > > arm32/arm64/riscv, and thus have:
> > >
> > >     CONFIG_CC_IS_GCC=y
> > >
> > > Still, this commit causes
> > >
> > >     CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
> > >     CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
> > >
> > > to disappear from my configs? Is that expected?
> >
> > Not expected -- that means your GCC is somehow failing that test case.
> > Ideally some GCC person will investigate why this is so.
> 
> Oh, "jmp" is not a valid mnemonic on arm and riscv, and several other
> architectures...

Ah, d'0h indeed.

void b(void **);void* c();int f(void){{asm goto(""::::l0);return 0;l0:return 1;}void *x __attribute__((cleanup(b))) = c();{asm goto(""::::l1);return 2;l1:return 1;}}

Seems to still finger the issue on x86_64. That should build on !x86
too, right?

